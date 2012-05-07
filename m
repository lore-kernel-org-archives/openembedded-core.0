Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SRU2r-0002ll-QC
	for openembedded-core@lists.openembedded.org;
	Mon, 07 May 2012 21:56:34 +0200
Received: by yenm3 with SMTP id m3so4621132yen.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 May 2012 12:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=NXxWZ2v5jCKg8t0VzxpwGAOxHL3TDvNDS6b+i0HBO1I=;
	b=rtV/bDS/kqH/oU5T0AaAnVeaZaHATWZizdi74n9vTAt6+HK0q25K5nQw7LzDX9jPGt
	Xn/aa3eEqpC/UOtGNeoHnIq72vjUPL229bAXUzxxx9aNueDjAd69KerWHPCVWJGgzDzd
	SqAqOkNROpe2Cy7pc0AVCktdYZXq4gUiGxYzOO+Ry+3WvKCEgU19chOTyiT7KsCldkD+
	nwfPqx7faNZ/TXzbUKjPo1P4QwfEvScDo3/3pc6TkPjkKKH7H/l4qtRzLmUdLNNZ7iA2
	jX19RTbkHzssyiCJGaUhQodeBDZ+2TdM5tca/OjFI+rvTgAsJa+rPrnPAZfNEMqdEHn4
	KC2A==
MIME-Version: 1.0
Received: by 10.236.125.234 with SMTP id z70mr20772299yhh.18.1336420002652;
	Mon, 07 May 2012 12:46:42 -0700 (PDT)
Received: by 10.236.23.9 with HTTP; Mon, 7 May 2012 12:46:42 -0700 (PDT)
In-Reply-To: <907b74f1035fcd569920630c6fc68751cfb8ca14.1335992192.git.raj.khem@gmail.com>
References: <cover.1335992192.git.raj.khem@gmail.com>
	<907b74f1035fcd569920630c6fc68751cfb8ca14.1335992192.git.raj.khem@gmail.com>
Date: Mon, 7 May 2012 21:46:42 +0200
Message-ID: <CA+chaQem7Wiba2MLqkANC-retpk7WBre7gUpAtJsXF+b5P43aw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] kmod: Add recipes
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
X-List-Received-Date: Mon, 07 May 2012 19:56:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 2, 2012 at 10:58 PM, Khem Raj <raj.khem@gmail.com> wrote:
> kmod is replacement for module-init-tools
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0meta/recipes-kernel/kmod/kmod-native_git.bb =C2=A0 =C2=A0 =C2=A0| =
=C2=A0 14 +++++
> =C2=A0meta/recipes-kernel/kmod/kmod.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 31 +++++++++++
> =C2=A0meta/recipes-kernel/kmod/kmod/depmod-search.conf | =C2=A0 =C2=A06 +=
+
> =C2=A0meta/recipes-kernel/kmod/kmod_git.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 62 ++++++++++++++++++++++
> =C2=A04 files changed, 113 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 meta/recipes-kernel/kmod/kmod-native_git.bb
> =C2=A0create mode 100644 meta/recipes-kernel/kmod/kmod.inc
> =C2=A0create mode 100644 meta/recipes-kernel/kmod/kmod/depmod-search.conf
> =C2=A0create mode 100644 meta/recipes-kernel/kmod/kmod_git.bb
>
> diff --git a/meta/recipes-kernel/kmod/kmod-native_git.bb b/meta/recipes-k=
ernel/kmod/kmod-native_git.bb
> new file mode 100644
> index 0000000..96de8b8
> --- /dev/null
> +++ b/meta/recipes-kernel/kmod/kmod-native_git.bb
> @@ -0,0 +1,14 @@
> +# Copyright (C) 2012 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +require kmod.inc
> +inherit native
> +
> +PR =3D "${INC_PR}.0"
> +
> +do_install_append (){
> + =C2=A0 =C2=A0 =C2=A0 for tool in depmod insmod lsmod modinfo modprobe r=
mmod
> + =C2=A0 =C2=A0 =C2=A0 do
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -s kmod ${D}${bindi=
r}/$tool
> + =C2=A0 =C2=A0 =C2=A0 done
> +}
> diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod=
/kmod.inc
> new file mode 100644
> index 0000000..940a317
> --- /dev/null
> +++ b/meta/recipes-kernel/kmod/kmod.inc
> @@ -0,0 +1,31 @@
> +# Copyright (C) 2012 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +DESCRIPTION =3D "kmod is a set of tools to handle common tasks with Linu=
x kernel modules like \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 insert, remove, list, =
check properties, resolve dependencies and aliases."
> +HOMEPAGE =3D "http://packages.profusion.mobi/kmod/"
> +LICENSE =3D "GPL-2.0+ & LGPL-2.1+"
> +LICENSE_libkmod =3D "LGPL-2.1+"
> +SECTION =3D "base"
> +PV =3D "7+git${SRCREV}"

this version sorts lower than what was in meta-oe, can we bump PE with
libkmod fix please?

> +INC_PR =3D "r0"
> +DEPENDS +=3D "gnome-doc-utils-native"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi=
le://libkmod/COPYING;md5=3Da6f89e2100d9b6cdffcea4f398e37343 \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
> +inherit autotools
> +
> +SRC_URI =3D "git://git.profusion.mobi/kmod.git;protocol=3Dgit;branch=3Dm=
aster \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://depmod-search.conf \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
> +
> +SRCREV =3D "02629fa02e96763db7460a930239cc93649a52f8"
> +
> +S =3D "${WORKDIR}/git"
> +
> +EXTRA_AUTORECONF +=3D "--install --symlink"
> +EXTRA_OECONF +=3D"--enable-debug --enable-logging --enable-tools"
> +
> +do_configure_prepend () {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0gtkdocize --docdir ${S}/libkmod/docs || touc=
h ${S}/libkmod/docs/gtk-doc.make
> +}
> diff --git a/meta/recipes-kernel/kmod/kmod/depmod-search.conf b/meta/reci=
pes-kernel/kmod/kmod/depmod-search.conf
> new file mode 100644
> index 0000000..527c0bb
> --- /dev/null
> +++ b/meta/recipes-kernel/kmod/kmod/depmod-search.conf
> @@ -0,0 +1,6 @@
> +#
> +# /etc/depmod.d/depmod.conf
> +#
> +
> +search updates extramodules built-in
> +
> diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/k=
mod/kmod_git.bb
> new file mode 100644
> index 0000000..928fa88
> --- /dev/null
> +++ b/meta/recipes-kernel/kmod/kmod_git.bb
> @@ -0,0 +1,62 @@
> +# Copyright (C) 2012 Khem Raj <raj.khem@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +require kmod.inc
> +
> +PR =3D "${INC_PR}.0"
> +
> +PROVIDES_${PN} +=3D "module-init-tools-insmod-static module-init-tools-d=
epmod module-init-tools"
> +RPROVIDES_${PN} +=3D "module-init-tools-insmod-static module-init-tools-=
depmod module-init-tools"
> +CONFLICTS_${PN} +=3D "module-init-tools-insmod-static module-init-tools-=
depmod module-init-tools"
> +
> +# autotools set prefix to /usr, however we want them in /bin and /sbin
> +bindir =3D "${base_bindir}"
> +sbindir =3D "${base_sbindir}"
> +# libdir =3D "${base_libdir}"

why is this commented out?
it breaks libkmod packaging
FILES_libkmod =3D "${base_libdir}/libkmod*${SOLIBS}"
doesn't matches anything

previous version of this patch had this enabled..

> +
> +SRC_URI +=3D " \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://depmod-search.conf \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
> +
> +do_install_append () {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0install -dm755 ${D}${base_bindir}
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0install -dm755 ${D}${base_sbindir}
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0# add symlinks to kmod
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s ..${base_bindir}/kmod ${D}${base_bindi=
r}/lsmod.kmod
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0for tool in {ins,rm,dep}mod mod{info,probe};=
 do
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s ..${base_b=
indir}/kmod ${D}${base_sbindir}/${tool}.kmod
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0done
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0# configuration directories
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0install -dm755 ${D}${base_libdir}/depmod.d
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0install -dm755 ${D}${base_libdir}/modprobe.d
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0install -dm755 ${D}${sysconfdir}/depmod.d
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0install -dm755 ${D}${sysconfdir}/modprobe.d
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0# install depmod.d file for search/ dir
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0install -Dm644 "${WORKDIR}/depmod-search.con=
f" "${D}${base_libdir}/depmod.d/search.conf"
> +}
> +
> +pkg_postinst_kmod() {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0for f in sbin/insmod sbin/modprobe sbin/rmmo=
d sbin/modinfo; do
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bn=3D`basename $=
f`
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0update-alternati=
ves --install /$f $bn /$f.kmod 60
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0done
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0update-alternatives --install /bin/lsmod bin=
-lsmod /bin/lsmod.kmod 60
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0update-alternatives --install /sbin/lsmod ls=
mod /bin/lsmod.kmod 60
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0update-alternatives --install /sbin/depmod d=
epmod /sbin/depmod.kmod 60
> +}
> +
> +pkg_prerm_kmod() {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0for f in sbin/insmod sbin/modprobe sbin/rmmo=
d sbin/modinfo; do
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bn=3D`basename $=
f`
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0update-alternati=
ves --remove $bn /$f.kmod
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0done
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0update-alternatives --remove bin-lsmod /bin/=
lsmod.kmod
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0update-alternatives --remove lsmod /bin/lsmo=
d.kmod
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0update-alternatives --remove depmod /sbin/de=
pmod.kmod
> +}
> +
> +PACKAGES =3D+ "libkmod"
> +
> +FILES_libkmod =3D "${base_libdir}/libkmod*${SOLIBS}"
> +FILES_${PN} +=3D "${base_libdir}/depmod.d ${base_libdir}/modprobe.d"
> --
> 1.7.5.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


