Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QjDrp-00066y-8j
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 19:13:57 +0200
Received: by pvf24 with SMTP id 24so4017039pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2011 10:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=2V7h9YM7vwgbXNwxJ8qDoj6GBopZw+o2YO+2UyQHl5s=;
	b=Zzf0Cy9B/Ie7juV8QBpTN+/bTau+3R+cEyor6eUF6pW1eLvhNal4/0PWCC30uDSoVZ
	XpcyNNBdAruS7+mT5zaK3FL+hLjjOgYVK/VTMHsLAhgrtNLJzd+6bWX9weU2XhbTDBB0
	QeVsiU1mNawVezvHiki0Lsxy9E7hJaMA4OufQ=
Received: by 10.68.35.105 with SMTP id g9mr8557192pbj.479.1311095390066; Tue,
	19 Jul 2011 10:09:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.62.36 with HTTP; Tue, 19 Jul 2011 10:09:20 -0700 (PDT)
In-Reply-To: <1311091299.30326.38.camel@phil-desktop>
References: <1311091299.30326.38.camel@phil-desktop>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Jul 2011 10:09:20 -0700
Message-ID: <CAMKF1sqBvobw4AEDn+UCUQVYeZXSPE+Xt_1PV0W2ajFHTguAkw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] uclibc: improve packaging granularity
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
X-List-Received-Date: Tue, 19 Jul 2011 17:13:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 19, 2011 at 9:01 AM, Phil Blundell <philb@gnu.org> wrote:
> Put each of the libraries into its own package rather than dumping them
> all into libc0. =C2=A0This saves ~300kB on the installed size of an i586 =
micro-base-image
> and avoids the need to set the hated LEAD_SONAME.
>
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
> =C2=A0meta/recipes-core/uclibc/uclibc.inc | =C2=A0 31 ++++++++++++++++---=
------------
> =C2=A01 files changed, 16 insertions(+), 15 deletions(-)
>
> diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/ucli=
bc/uclibc.inc
> index 23a8ecb..222c34f 100644
> --- a/meta/recipes-core/uclibc/uclibc.inc
> +++ b/meta/recipes-core/uclibc/uclibc.inc
> @@ -13,7 +13,7 @@ SECTION =3D "libs"
> =C2=A0LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3Da6f89e2100d9b6cdffce=
a4f398e37343 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file=
://COPYING.LIB.boilerplate;md5=3Daaddeadcddeb918297e0e4afc52ce46f \
> =C2=A0file://${S}/test/regex/testregex.c;startline=3D1;endline=3D31;md5=
=3D234efb227d0a40677f895e4a1e26e960"
> -INC_PR =3D "r2"
> +INC_PR =3D "r4"
>
> =C2=A0require uclibc-config.inc
> =C2=A0STAGINGCC =3D "gcc-cross-intermediate"
> @@ -49,27 +49,28 @@ RDEPENDS_${PN}-dev =3D "linux-libc-headers-dev"
> =C2=A0INHIBIT_DEFAULT_DEPS =3D "1"
>
> =C2=A0PACKAGES =3D+ "ldd uclibc-utils-dbg uclibc-utils uclibc-gconv uclib=
c-thread-db uclibc-argp uclibc-backtrace"
> -
> -LEAD_SONAME =3D "libc.so"
> +PACKAGES =3D+ "uclibc-libcrypt uclibc-libintl uclibc-libnsl uclibc-libre=
solv uclibc-libm"
> +PACKAGES =3D+ "uclibc-libdl uclibc-libutil uclibc-libpthread uclibc-libr=
t"
> +
> +FILES_uclibc-libcrypt =3D "${base_libdir}/libcrypt*.so.* ${base_libdir}/=
libcrypt-*.so"
> +FILES_uclibc-libintl =3D "${base_libdir}/libintl*.so.* ${base_libdir}/li=
bintl-*.so"
> +FILES_uclibc-libnsl =3D "${base_libdir}/libnsl*.so.* ${base_libdir}/libn=
sl-*.so"
> +FILES_uclibc-libresolv =3D "${base_libdir}/libresolv*.so.* ${base_libdir=
}/libresolv-*.so"
> +FILES_uclibc-libm =3D "${base_libdir}/libm*.so.* ${base_libdir}/libm-*.s=
o"
> +FILES_uclibc-libdl =3D "${base_libdir}/libdl*.so.* ${base_libdir}/libdl-=
*.so"
> +FILES_uclibc-libutil =3D "${base_libdir}/libutil*.so.* ${base_libdir}/li=
butil-*.so"
> +FILES_uclibc-libpthread =3D "${base_libdir}/libpthread*.so.* ${base_libd=
ir}/libpthread-*.so"
> +FILES_uclibc-librt =3D "${base_libdir}/librt*.so.* ${base_libdir}/librt-=
*.so"
>
> =C2=A0# The last line (gdb and lib1) is for uclinux-uclibc builds
> -uclibc_baselibs =3D "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcry=
pt-*.so \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${base_l=
ibdir}/libintl*.so.* ${base_libdir}/libintl-*.so \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${base_l=
ibdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${base_l=
ibdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${base_l=
ibdir}/ld*.so.* ${base_libdir}/ld*.so \
> +uclibc_baselibs =3D "${base_libdir}/ld*.so.* ${base_libdir}/ld*.so \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${ba=
se_libdir}/libc*.so.* ${base_libdir}/libuClibc-*.so \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${base_l=
ibdir}/libdl*.so.* ${base_libdir}/libdl-*.so \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${base_l=
ibdir}/libm*.so.* ${base_libdir}/libm-*.so \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${base_l=
ibdir}/libutil*.so.* ${base_libdir}/libutil-*.so \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${base_l=
ibdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${base_l=
ibdir}/librt*.so.* ${base_libdir}/librt-*.so \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${li=
bdir}/libc.gdb ${libdir}/libc ${base_libdir}/lib1.so \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
> =C2=A0FILES_${PN} =3D "${sysconfdir} ${uclibc_baselibs} /sbin/ldconfig \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${libexecdir} ${da=
tadir}/zoneinfo ${libdir}/locale"
> =C2=A0FILES_ldd =3D "${bindir}/ldd"
> -FILES_uclibc-dev_append =3D "\
> +FILES_${PN}-dev_append =3D "\

same uclibc.inc is also used by uclibc-initial recipe so using ${PN}
may not be ok here

> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${libdir}/lib*.so \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${libdir}/*_nonshared.a \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${libdir}/[S]*crt[1in].o \
> @@ -84,7 +85,7 @@ FILES_uclibc-thread-db =3D "${base_libdir}/libthread_db=
*"
> =C2=A0FILES_uclibc-argp =3D "${base_libdir}/libuargp-*.so ${base_libdir}/=
libuargp*.so.*"
> =C2=A0FILES_uclibc-backtrace =3D "${base_libdir}/libubacktrace-*.so ${bas=
e_libdir}/libubacktrace*.so.*"
>
> -RPROVIDES_uclibc-dev +=3D "libc-dev virtual-libc-dev"
> +RPROVIDES_${PN}-dev +=3D "libc-dev virtual-libc-dev"

same as above

> =C2=A0# uclibc does not really have libsegfault but then using the one fr=
om glibc is also not
> =C2=A0# going to work. So we pretend that we have it to make bitbake not =
pull other recipes
> =C2=A0# to satisfy this dependency for the images/tasks
> --
> 1.7.4.1
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


