Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SPH0J-0002Re-6k
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 19:36:47 +0200
Received: by lbbgo4 with SMTP id go4so2632862lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 May 2012 10:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=f4Y/3YHvnG/s0jJPJpZyjjv2FjHffCQ95ZJNzBW56gc=;
	b=04nVmgCyGwCfc42hd6LUPNQw4qT7faNpw53vnXFJkPp9CA50I0wvZ1OtXjY75SM22i
	hxslCeXQfwT3ZCk7KwOkioXclheF7ItnrAXaiyPiTrSTexhGgJoFMExJ48k6u9HmhK0e
	peEOfZko7GAkOgF2tUpk43+JxnnGY4btmgMtBl4Hm+iKnwjGXGCzRpySrDsCTruloH1a
	IC5bre6+GoXMmWe2qzKS/+ZQSmHIm4H3+04Y59uhr4hdQvfKgiqIhy0P7dEJY4f59fu6
	2JGrI/K62uOe/oEFRzHpth4t5oLksqyIzQtVq3QToi258BMO40h2K6wrFOuQD0nvQ4WQ
	Cxyg==
Received: by 10.152.145.228 with SMTP id sx4mr23057452lab.45.1335893223772;
	Tue, 01 May 2012 10:27:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Tue, 1 May 2012 10:26:33 -0700 (PDT)
In-Reply-To: <7f53932a2701014255382dd2990858b1cfb28c3b.1335887732.git.kergoth@gmail.com>
References: <cover.1335887732.git.kergoth@gmail.com>
	<7f53932a2701014255382dd2990858b1cfb28c3b.1335887732.git.kergoth@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 May 2012 10:26:33 -0700
Message-ID: <CAMKF1sozSeO2aDcjBy7oQaXS1b17DFFbkQ_gocaCyrQQKBKUSA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] external-csl-toolchain: cleanup, simplify, use base_libdir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 May 2012 17:36:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 1, 2012 at 8:58 AM, Christopher Larson <kergoth@gmail.com> wrot=
e:
> Signed-off-by: Christopher Larson <kergoth@gmail.com>
> ---
> =C2=A0meta/recipes-core/meta/external-csl-toolchain.bb | =C2=A0 55 ++++++=
+++++-----------
> =C2=A01 files changed, 27 insertions(+), 28 deletions(-)
>
> diff --git a/meta/recipes-core/meta/external-csl-toolchain.bb b/meta/reci=
pes-core/meta/external-csl-toolchain.bb
> index fb553ab..a14e958 100644
> --- a/meta/recipes-core/meta/external-csl-toolchain.bb
> +++ b/meta/recipes-core/meta/external-csl-toolchain.bb
> @@ -24,36 +24,40 @@ PROVIDES +=3D "\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0virtual/linux-libc-headers \
> =C2=A0"
> =C2=A0PV =3D "${CSL_VER_MAIN}"
> -PR =3D "r3"
> +PR =3D "r5"
>
> =C2=A0#SRC_URI =3D "http://www.codesourcery.com/public/gnu_toolchain/${CS=
L_TARGET_SYS}/arm-${PV}-${TARGET_PREFIX}i686-pc-linux-gnu.tar.bz2"
>
> =C2=A0SRC_URI =3D "file://SUPPORTED"
>
> =C2=A0do_install() {
> - =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sysconfdir} ${D}${bindir} ${D}${s=
bindir} ${D}${base_bindir} ${D}${libdir}
> - =C2=A0 =C2=A0 =C2=A0 install -d ${D}${base_libdir} ${D}${base_sbindir} =
${D}${datadir} ${D}/usr
> + =C2=A0 =C2=A0 =C2=A0 # Use optimized files if available
> + =C2=A0 =C2=A0 =C2=A0 sysroot=3D"${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}=
/libc"
> + =C2=A0 =C2=A0 =C2=A0 if [ -d $sysroot/${CSL_TARGET_CORE} ]; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sysroot=3D"$sysroot/${=
CSL_TARGET_CORE}"
> + =C2=A0 =C2=A0 =C2=A0 fi
> +
> + =C2=A0 =C2=A0 =C2=A0 cp -a $sysroot${base_libdir}/. ${D}${base_libdir}
> + =C2=A0 =C2=A0 =C2=A0 cp -a $sysroot/etc/. ${D}${sysconfdir}
> + =C2=A0 =C2=A0 =C2=A0 cp -a $sysroot/sbin/. ${D}${base_sbindir}
>
> - =C2=A0 =C2=A0 =C2=A0 if [ -d ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/li=
bc/${CSL_TARGET_CORE} ]; then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a ${EXTERNAL_TOOLC=
HAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE}/lib/. =C2=A0${D}${base_libd=
ir}
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a ${EXTERNAL_TOOLC=
HAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE}/etc/. =C2=A0${D}${sysconfdi=
r}
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a ${EXTERNAL_TOOLC=
HAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE}/sbin/. ${D}${base_sbindir}
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ ! -e ${EXTERNAL_T=
OOLCHAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE}/usr/include ]; then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 cp -a ${EXTERNAL_TOOLCHAIN}/${CSL_TARGET_SYS}/libc/usr/include =C2=
=A0${D}/usr/
> + =C2=A0 =C2=A0 =C2=A0 install -d ${D}/usr
> + =C2=A0 =C2=A0 =C2=A0 for usr_element in bin libexec sbin share ${base_l=
ibdir}; do
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usr_path=3D$sysroot/us=
r/$usr_element
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a $usr_path ${D}/u=
sr/
> + =C2=A0 =C2=A0 =C2=A0 done
> + =C2=A0 =C2=A0 =C2=A0 for datadir_element in man info; do
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 datadir_path=3D$sysroo=
t/usr/$datadir_element
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -e $datadir_path =
]; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 cp -a $datadir_path ${D}${datadir}/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a ${EXTERNAL_TOOLC=
HAIN}/${CSL_TARGET_SYS}/libc/${CSL_TARGET_CORE}/usr/. =C2=A0${D}/usr/
> - =C2=A0 =C2=A0 =C2=A0 else
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a ${EXTERNAL_TOOLC=
HAIN}/${CSL_TARGET_SYS}/libc/lib/. =C2=A0${D}${base_libdir}
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a ${EXTERNAL_TOOLC=
HAIN}/${CSL_TARGET_SYS}/libc/etc/. =C2=A0${D}${sysconfdir}
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a ${EXTERNAL_TOOLC=
HAIN}/${CSL_TARGET_SYS}/libc/sbin/. ${D}${base_sbindir}
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a ${EXTERNAL_TOOLC=
HAIN}/${CSL_TARGET_SYS}/libc/usr/. =C2=A0${D}/usr/
> - =C2=A0 =C2=A0 =C2=A0 fi
> + =C2=A0 =C2=A0 =C2=A0 done
>
> - =C2=A0 =C2=A0 =C2=A0 if [ -e ${D}${prefix}/info ]; then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mv ${D}${prefix}/info =
${D}${infodir}
> - =C2=A0 =C2=A0 =C2=A0 fi
> - =C2=A0 =C2=A0 =C2=A0 if [ -e ${D}${prefix}/man ]; then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mv ${D}${prefix}/man $=
{D}${mandir}
> + =C2=A0 =C2=A0 =C2=A0 # Some toolchains have headers under the core spec=
ific area
> + =C2=A0 =C2=A0 =C2=A0 if [ -e $sysroot/usr/include ]; then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a $sysroot/usr/inc=
lude/. ${D}${includedir}
> + =C2=A0 =C2=A0 =C2=A0 else
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a $sysroot/../usr/=
include/. ${D}${includedir}
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fi

can we avoid using /usr/ explicitly here

>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0rm ${D}${sysconfdir}/rpc
> @@ -61,18 +65,13 @@ do_install() {
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0mv ${D}${libdir}/bin/* ${D}${bindir}/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e ${D}${libdir}/bin/.debug ]; then
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${bindi=
r}/.debug
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv ${D}${libdir}/b=
in/.debug/* ${D}${bindir}/.debug/
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s ../../bin/gdbserver ${D}${libdir}/bin/sy=
sroot-gdbserver
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e 's/__packed/__attribute__ ((packed))=
/' ${D}${includedir}/mtd/ubi-user.h
> - =C2=A0 =C2=A0 =C2=A0 sed -i -e "s# /lib# ../../lib#g" -e "s# /usr/lib# =
.#g" ${D}${libdir}/libc.so
> - =C2=A0 =C2=A0 =C2=A0 sed -i -e "s# /lib# ../../lib#g" -e "s# /usr/lib# =
.#g" ${D}${libdir}/libpthread.so
> -}
> -
> -do_install_locale_append () {
> - =C2=A0 =C2=A0 =C2=A0 rm -r ${D}${datadir}/locale ${D}${libdir}/locale
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e "s# ${base_libdir}# ../..${base_li=
bdir}#g" -e "s# ${libdir}# .#g" ${D}${libdir}/libc.so
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e "s# ${base_libdir}# ../..${base_li=
bdir}#g" -e "s# ${libdir}# .#g" ${D}${libdir}/libpthread.so
> =C2=A0}
>
> =C2=A0SYSROOT_PREPROCESS_FUNCS +=3D "external_toolchain_sysroot_adjust"
> --
> 1.7.7
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


