Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rpq54-00009U-CK
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 00:47:14 +0100
Received: by lags15 with SMTP id s15so2678353lag.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2012 15:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=wv0OIhoR9hGwrOjgrIs4oGbYSh8Rx+rgcJiF1Wce89g=;
	b=Ponzau1ELIyU19Soakwpph5VZcXcRM1S/wiR+KPLhQEDbZEJP4Nv2FNdj3M3X1DyCW
	ZYK9QzV7k1amyFdGQGRrUAUpHF24wGKZ9Y8fU9yJz6bGNfqvzFklmvohgE/MqLxgQM55
	4wSOSmZWGoT2Fmmj3Fjs6/Lxv3WEGVGjqbke8=
Received: by 10.112.86.67 with SMTP id n3mr3789557lbz.29.1327448368297; Tue,
	24 Jan 2012 15:39:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Tue, 24 Jan 2012 15:38:57 -0800 (PST)
In-Reply-To: <4F1F274D.9070509@mentor.com>
References: <4F1F26C6.8050501@mentor.com> <4F1F274D.9070509@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Jan 2012 15:38:57 -0800
Message-ID: <CAMKF1sqo3rtO80nz+Xek56u8RrHU_hvm+G7=WV5P+=LxhDXHag@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] systemtap: build and install uprobes.ko
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
X-List-Received-Date: Tue, 24 Jan 2012 23:47:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 24, 2012 at 1:49 PM, Wade Farnsworth
<wade_farnsworth@mentor.com> wrote:
> SystemTap needs to provide uprobes.ko in order to support user space
> probing. =C2=A0Build and install the uprobes.ko on systems where it makes
> sense to.
>
> Signed-off-by: Wade Farnsworth <wade_farnsworth@mentor.com>
> ---
> =C2=A0meta/recipes-kernel/systemtap/systemtap_git.bb | =C2=A0 57 ++++++++=
++++++++++++++-
> =C2=A01 files changed, 54 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipe=
s-kernel/systemtap/systemtap_git.bb
> index 298e005..22f3993 100644
> --- a/meta/recipes-kernel/systemtap/systemtap_git.bb
> +++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
> @@ -2,12 +2,12 @@ DESCRIPTION =3D "SystemTap - script-directed dynamic tr=
acing and performance analy
> =C2=A0LICENSE =3D "GPLv2"
> =C2=A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fd=
af4a4263"
>
> -DEPENDS =3D "elfutils sqlite3 systemtap-native"
> +DEPENDS =3D "elfutils sqlite3 systemtap-native virtual/kernel"
> =C2=A0DEPENDS_virtclass-native =3D "elfutils sqlite3 gettext-native"
> =C2=A0DEPENDS_virtclass-nativesdk =3D "elfutils sqlite3 gettext-native"
>
> =C2=A0SRCREV =3D "a56e4b7800e3fa8f9df6f4434cb02f86f6e995bc"
> -PR =3D "r4"
> +PR =3D "r5"
> =C2=A0PV =3D "1.6+git${SRCPV}"
>
> =C2=A0SRC_URI =3D "git://sources.redhat.com/git/systemtap.git;protocol=3D=
git"
> @@ -28,8 +28,59 @@ COMPATIBLE_HOST =3D '(x86_64.*|i.86.*|powerpc.*|arm.*)=
-linux'
>
> =C2=A0S =3D "${WORKDIR}/git"
>
> -inherit autotools gettext
> +inherit autotools gettext module-base
>
> =C2=A0BBCLASSEXTEND =3D "native nativesdk"
>
> +FILES_${PN} +=3D "${datadir}/systemtap/runtime/uprobes"
> =C2=A0FILES_${PN}-dbg +=3D "${libexecdir}/systemtap/.debug"
> +
> +# Compile and install the uprobes kernel module. =C2=A0Note that staprun
> +# expects it in the systemtap/runtime directory, not in /lib/modules.
> +# Note that we only build uprobes on machines with utrace support.
> +do_compile_uprobes() {
> + =C2=A0 =C2=A0 =C2=A0 if grep -q "CONFIG_UTRACE=3Dy" ${STAGING_KERNEL_DI=
R}/.config
> + =C2=A0 =C2=A0 =C2=A0 then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unset CFLAGS CPPFLAGS =
CXXFLAGS LDFLAGS CC LD CPP
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake CC=3D"${KER=
NEL_CC}" LD=3D"${KERNEL_LD}" \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0AR=3D"${KERNEL_AR}" \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0-C ${STAGING_KERNEL_DIR} scripts
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake KDIR=3D${ST=
AGING_KERNEL_DIR} =C2=A0 \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0M=3D"${S}/runtime/uprobes/" \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0AR=3D"${KERNEL_AR}" \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0-C "${S}/runtime/uprobes/"
> + =C2=A0 =C2=A0 =C2=A0 fi
> +}
> +
> +do_compile_uprobes_virtclass-native() {
> + =C2=A0 =C2=A0 =C2=A0 :
> +}
> +
> +do_compile_uprobes_virtclass-nativesdk() {
> + =C2=A0 =C2=A0 =C2=A0 :
> +}
> +
> +do_compile_append() {
> + =C2=A0 =C2=A0 =C2=A0 do_compile_uprobes
> +}
> +
> +do_install_uprobes() {
> + =C2=A0 =C2=A0 =C2=A0 if [ -e "${S}/runtime/uprobes/uprobes.ko" ]
> + =C2=A0 =C2=A0 =C2=A0 then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}/usr/sh=
are/systemtap/runtime/uprobes/
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${S}/r=
untime/uprobes/uprobes.ko ${D}/usr/share/systemtap/runtime/uprobes/
> + =C2=A0 =C2=A0 =C2=A0 fi
> +}
> +
> +do_install_uprobes_virtclass-native() {
> + =C2=A0 =C2=A0 =C2=A0 :
> +}
> +
> +do_install_uprobes_virtclass-nativesdk() {
> + =C2=A0 =C2=A0 =C2=A0 :
> +}
> +
> +do_install_append() {
> + =C2=A0 =C2=A0 =C2=A0 do_install_uprobes
> +}


could this module be baked as a standalone recipe instead?
since this now depends on kernel makes systemtap to be machine specific


