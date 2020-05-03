Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web10.27279.1588527593941526075
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 10:39:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Cp0sAqes;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id w18so7254765qvs.3
        for <openembedded-core@lists.openembedded.org>; Sun, 03 May 2020 10:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jngB3dznzPiZqTMap6u8Me8pm44QSzNxhAcyZUrGKN8=;
        b=Cp0sAqesFlgvh+slfR14MVQeRzyqxJ5wjOq+XtNEd1CrnWjkYGXAAMjJfwbqE8HHHi
         MTpbtf7/OP/qDwMooXSh4vclLyqENRlvqkdGa4xMLhs2boWodvixZ57igyNlDVi2ZWCr
         AXkWi8Tg+fUWsEnWzuGz54xiomBuf74rsOiHPMCQREh+c93hknKqzJDHqdI/gcR+RIMZ
         kyvWQ3LXEFIDabT8gOyhWyyfUqDwpRNrpKD/ooDaW/FYkL0z/V8gNOHqOEvbve77RPvj
         fqZkTWcRAx8lAgjoaz4KvkMR9nD7Nx2+xPev80Fr1wF4tNQQjtLhSBNX3jzZh4TwGpLW
         8I9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jngB3dznzPiZqTMap6u8Me8pm44QSzNxhAcyZUrGKN8=;
        b=grkt9RYeHlonodvxjhkU5JXj53j6NhotzCGbwsu7/Q5UsdHctdcciYS1o4Qw57GgxH
         6D5Gqc+i44gXDEgKiDXwtZM2R6fCsFlIFG7ih4Mdcenek2qKEeKIuMgdechNEyW8Y7gp
         o5mhMSfwB8lPkwFkWerl6kOqHwaQtSrBW8NHLZXM2GrpzzzpswZk/1kqgT79IbMN6C9S
         7OIOJ4W65n0yTstETjGHqbQea05gQMq2ju9bwe5ctcoGEtNlrJ2G4CwH85gHpgtyUEkG
         f9rN+8gJuRr0pBIi964zIcT3WF80nvRkf2mR1adMhMmoHxGnO0eT186rlYYge5t3ZeyF
         iOsA==
X-Gm-Message-State: AGi0PuY8sGlCQwAY7o0adZK/y1ZsXdgl6CBc1Y3mM26mwQmHFU5/yvZs
	bDQ7L52WMUvkxKRV1OnoTmX+Jx4RentxlTckMMxvzlyh
X-Google-Smtp-Source: APiQypKmUhv36z05ogLesV2rsQu1RaNs6wN6cCH+N50Su5r/qk3qCLTC/kLPGmGEeXtuCWShUWUCHTSQ/FLd2SdopDg=
X-Received: by 2002:a0c:f1d1:: with SMTP id u17mr13310230qvl.146.1588527592965;
 Sun, 03 May 2020 10:39:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200503080730.3686063-1-daniel@zonque.org>
In-Reply-To: <20200503080730.3686063-1-daniel@zonque.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sun, 3 May 2020 10:39:42 -0700
Message-ID: <CAMKF1sqCb8JhGcuyJaTwC2=AsHRGvHsQ7BXJguOVg3VTOENiNA@mail.gmail.com>
Subject: Re: [PATCH] Add -fcommon to BUILD_CFLAGS to a number of recipes
To: Daniel Mack <daniel@zonque.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e50afd05a4c1e638"

--000000000000e50afd05a4c1e638
Content-Type: text/plain; charset="UTF-8"

I think add it globally to BUILD_CFLAGS perhaps is
Right thing to do once we upgrade to gcc10 cross compiler I have a patch to
add it to gcc defaults

Perhaps we will have apps ported to gcc10 by then

On Sun, May 3, 2020 at 1:07 AM Daniel Mack <daniel@zonque.org> wrote:

> When building on a gcc 10 enabled host distribution (such as Fedora 32),
> a number of recipies need explicit treatment to enable '-fcommon' in
> BUILD_CFLAGS. There might be more of those fixes needed.
>
> Commit 46827b8616 ("recipes: Use -fcommon explicitly") already addressed
> that for some places, but tweaking CFLAGS doesn't seem to suffice.
>
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
>  meta/recipes-bsp/u-boot/u-boot-tools.inc                   | 2 ++
>  meta/recipes-bsp/u-boot/u-boot.inc                         | 2 ++
>  meta/recipes-devtools/binutils/binutils.inc                | 2 ++
>  meta/recipes-devtools/libcomps/libcomps_git.bb             | 1 +
>  meta/recipes-devtools/pseudo/pseudo.inc                    | 2 ++
>  meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb | 1 +
>  meta/recipes-extended/libtirpc/libtirpc_1.2.5.bb           | 2 +-
>  meta/recipes-kernel/dtc/dtc.inc                            | 3 ++-
>  meta/recipes-support/gdbm/gdbm_1.18.1.bb                   | 2 +-
>  9 files changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot-tools.inc
> b/meta/recipes-bsp/u-boot/u-boot-tools.inc
> index 8ae290acc6..98c47bf399 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-tools.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-tools.inc
> @@ -11,6 +11,8 @@ RPROVIDES_${PN}-mkimage = "u-boot-mkimage"
>  RREPLACES_${PN}-mkimage = "u-boot-mkimage"
>  RCONFLICTS_${PN}-mkimage = "u-boot-mkimage"
>
> +BUILD_CFLAGS += "-fcommon"
> +
>  EXTRA_OEMAKE_class-target = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC}
> ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"
> STRIP=true V=1'
>  EXTRA_OEMAKE_class-native = 'CC="${BUILD_CC} ${BUILD_CFLAGS}
> ${BUILD_LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"
> STRIP=true V=1'
>  EXTRA_OEMAKE_class-nativesdk = 'CROSS_COMPILE="${HOST_PREFIX}" CC="${CC}
> ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"
> STRIP=true V=1'
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc
> b/meta/recipes-bsp/u-boot/u-boot.inc
> index 188e5295cf..5fb1ae856a 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -9,6 +9,8 @@ inherit uboot-config uboot-extlinux-config uboot-sign
> deploy cml1 python3native
>
>  DEPENDS += "swig-native"
>
> +BUILD_CFLAGS += "-fcommon"
> +
>  EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc
> ${TOOLCHAIN_OPTIONS}" V=1'
>  EXTRA_OEMAKE += 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
>  EXTRA_OEMAKE += 'STAGING_INCDIR=${STAGING_INCDIR_NATIVE}
> STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE}'
> diff --git a/meta/recipes-devtools/binutils/binutils.inc
> b/meta/recipes-devtools/binutils/binutils.inc
> index 4119960c63..6d590658f8 100644
> --- a/meta/recipes-devtools/binutils/binutils.inc
> +++ b/meta/recipes-devtools/binutils/binutils.inc
> @@ -71,6 +71,8 @@ python do_package_prepend() {
>
>  B = "${S}/build.${HOST_SYS}.${TARGET_SYS}"
>
> +BUILD_CFLAGS += "-fcommon"
> +
>  EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
>                  --disable-werror \
>                  --enable-deterministic-archives \
> diff --git a/meta/recipes-devtools/libcomps/libcomps_git.bb
> b/meta/recipes-devtools/libcomps/libcomps_git.bb
> index 40b60159bc..0e893a9b49 100644
> --- a/meta/recipes-devtools/libcomps/libcomps_git.bb
> +++ b/meta/recipes-devtools/libcomps/libcomps_git.bb
> @@ -17,6 +17,7 @@ inherit cmake distutils3-base
>
>  DEPENDS += "libxml2 expat libcheck"
>
> +BUILD_CFLAGS += "-fcommon"
>  EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR}
> -DPYTHON_DESIRED=3"
>  OECMAKE_SOURCEPATH = "${S}/libcomps"
>
> diff --git a/meta/recipes-devtools/pseudo/pseudo.inc
> b/meta/recipes-devtools/pseudo/pseudo.inc
> index 50e30064bd..751f1815dc 100644
> --- a/meta/recipes-devtools/pseudo/pseudo.inc
> +++ b/meta/recipes-devtools/pseudo/pseudo.inc
> @@ -15,6 +15,8 @@ INSANE_SKIP_${PN}-dbg += "libdir"
>
>  PROVIDES += "virtual/fakeroot"
>
> +BUILD_CFLAGS += "-fcommon"
> +
>  MAKEOPTS = ""
>  MAKEOPTS_class-native =
> "'RPATH=-Wl,--rpath=XORIGIN/../../../sqlite3-native/usr/lib/'"
>
> diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
> b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
> index 9bcf026ce2..3ab9b0f2e5 100644
> --- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
> +++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
> @@ -12,6 +12,7 @@ SRC_URI = "git://
> github.com/plougher/squashfs-tools.git;protocol=https \
>
>  S = "${WORKDIR}/git/squashfs-tools"
>
> +BUILD_CFLAGS += "-fcommon"
>  EXTRA_OEMAKE = "${PACKAGECONFIG_CONFARGS}"
>
>  PACKAGECONFIG ??= "gzip xz lzo lz4 lzma xattr reproducible"
> diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.2.5.bb
> b/meta/recipes-extended/libtirpc/libtirpc_1.2.5.bb
> index fc66821ecc..f600430c41 100644
> --- a/meta/recipes-extended/libtirpc/libtirpc_1.2.5.bb
> +++ b/meta/recipes-extended/libtirpc/libtirpc_1.2.5.bb
> @@ -21,7 +21,7 @@ inherit autotools pkgconfig
>
>  EXTRA_OECONF = "--disable-gssapi"
>
> -CFLAGS += "-fcommon"
> +BUILD_CFLAGS += "-fcommon"
>
>  do_install_append() {
>         chown root:root ${D}${sysconfdir}/netconfig
> diff --git a/meta/recipes-kernel/dtc/dtc.inc
> b/meta/recipes-kernel/dtc/dtc.inc
> index 0650e3c82e..6a5b5e5ef1 100644
> --- a/meta/recipes-kernel/dtc/dtc.inc
> +++ b/meta/recipes-kernel/dtc/dtc.inc
> @@ -10,7 +10,8 @@ SRC_URI = "git://
> git.kernel.org/pub/scm/utils/dtc/dtc.git \
>             "
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
>
> -EXTRA_OEMAKE='NO_PYTHON=1 PREFIX="${prefix}" LIBDIR="${libdir}"
> DESTDIR="${D}"'
> +EXTRA_CFLAGS += "-fcommon"
> +EXTRA_OEMAKE='NO_PYTHON=1 PREFIX="${prefix}" LIBDIR="${libdir}"
> DESTDIR="${D}" EXTRA_CFLAGS="${EXTRA_CFLAGS}"'
>
>  inherit pkgconfig
>
> diff --git a/meta/recipes-support/gdbm/gdbm_1.18.1.bb
> b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
> index 5cb7c558b8..5f55ab0ffb 100644
> --- a/meta/recipes-support/gdbm/gdbm_1.18.1.bb
> +++ b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
> @@ -23,7 +23,7 @@ CACHED_CONFIGUREVARS += "ac_cv_lib_ndbm_main=no
> ac_cv_lib_dbm_main=no"
>
>  BBCLASSEXTEND = "native nativesdk"
>
> -CFLAGS += "-fcommon"
> +BUILD_CFLAGS += "-fcommon"
>
>  do_install_append () {
>      # Create a symlink to ndbm.h and gdbm.h in include/gdbm to let other
> packages to find
> --
> 2.26.2
>
>

--000000000000e50afd05a4c1e638
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">I think add it globally to BUILD_CFLAGS perhaps is</=
div></div><div dir=3D"auto">Right thing to do once we upgrade to gcc10 cros=
s compiler I have a patch to add it to gcc defaults=C2=A0</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Perhaps we will have apps ported to gcc10=
 by then=C2=A0</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Sun, May 3, 2020 at 1:07 AM Daniel Mack &lt;<a href=
=3D"mailto:daniel@zonque.org">daniel@zonque.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">When building on a gcc 10 enabled host distribu=
tion (such as Fedora 32),<br>
a number of recipies need explicit treatment to enable &#39;-fcommon&#39; i=
n<br>
BUILD_CFLAGS. There might be more of those fixes needed.<br>
<br>
Commit 46827b8616 (&quot;recipes: Use -fcommon explicitly&quot;) already ad=
dressed<br>
that for some places, but tweaking CFLAGS doesn&#39;t seem to suffice.<br>
<br>
Signed-off-by: Daniel Mack &lt;<a href=3D"mailto:daniel@zonque.org" target=
=3D"_blank">daniel@zonque.org</a>&gt;<br>
---<br>
=C2=A0meta/recipes-bsp/u-boot/u-boot-tools.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
=C2=A0meta/recipes-bsp/u-boot/u-boot.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
=C2=A0meta/recipes-devtools/binutils/binutils.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
=C2=A0meta/recipes-devtools/libcomps/<a href=3D"http://libcomps_git.bb" rel=
=3D"noreferrer" target=3D"_blank">libcomps_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A0meta/recipes-devtools/pseudo/pseudo.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
=C2=A0meta/recipes-devtools/squashfs-tools/<a href=3D"http://squashfs-tools=
_git.bb" rel=3D"noreferrer" target=3D"_blank">squashfs-tools_git.bb</a> | 1=
 +<br>
=C2=A0meta/recipes-extended/libtirpc/<a href=3D"http://libtirpc_1.2.5.bb" r=
el=3D"noreferrer" target=3D"_blank">libtirpc_1.2.5.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0meta/recipes-kernel/dtc/dtc.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3 ++-<br>
=C2=A0meta/recipes-support/gdbm/<a href=3D"http://gdbm_1.18.1.bb" rel=3D"no=
referrer" target=3D"_blank">gdbm_1.18.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A09 files changed, 14 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools.inc b/meta/recipes-bsp/u-=
boot/u-boot-tools.inc<br>
index 8ae290acc6..98c47bf399 100644<br>
--- a/meta/recipes-bsp/u-boot/u-boot-tools.inc<br>
+++ b/meta/recipes-bsp/u-boot/u-boot-tools.inc<br>
@@ -11,6 +11,8 @@ RPROVIDES_${PN}-mkimage =3D &quot;u-boot-mkimage&quot;<br=
>
=C2=A0RREPLACES_${PN}-mkimage =3D &quot;u-boot-mkimage&quot;<br>
=C2=A0RCONFLICTS_${PN}-mkimage =3D &quot;u-boot-mkimage&quot;<br>
<br>
+BUILD_CFLAGS +=3D &quot;-fcommon&quot;<br>
+<br>
=C2=A0EXTRA_OEMAKE_class-target =3D &#39;CROSS_COMPILE=3D&quot;${TARGET_PRE=
FIX}&quot; CC=3D&quot;${CC} ${CFLAGS} ${LDFLAGS}&quot; HOSTCC=3D&quot;${BUI=
LD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}&quot; STRIP=3Dtrue V=3D1&#39;<br>
=C2=A0EXTRA_OEMAKE_class-native =3D &#39;CC=3D&quot;${BUILD_CC} ${BUILD_CFL=
AGS} ${BUILD_LDFLAGS}&quot; HOSTCC=3D&quot;${BUILD_CC} ${BUILD_CFLAGS} ${BU=
ILD_LDFLAGS}&quot; STRIP=3Dtrue V=3D1&#39;<br>
=C2=A0EXTRA_OEMAKE_class-nativesdk =3D &#39;CROSS_COMPILE=3D&quot;${HOST_PR=
EFIX}&quot; CC=3D&quot;${CC} ${CFLAGS} ${LDFLAGS}&quot; HOSTCC=3D&quot;${BU=
ILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}&quot; STRIP=3Dtrue V=3D1&#39;<br>
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u=
-boot.inc<br>
index 188e5295cf..5fb1ae856a 100644<br>
--- a/meta/recipes-bsp/u-boot/u-boot.inc<br>
+++ b/meta/recipes-bsp/u-boot/u-boot.inc<br>
@@ -9,6 +9,8 @@ inherit uboot-config uboot-extlinux-config uboot-sign deplo=
y cml1 python3native<br>
<br>
=C2=A0DEPENDS +=3D &quot;swig-native&quot;<br>
<br>
+BUILD_CFLAGS +=3D &quot;-fcommon&quot;<br>
+<br>
=C2=A0EXTRA_OEMAKE =3D &#39;CROSS_COMPILE=3D${TARGET_PREFIX} CC=3D&quot;${T=
ARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}&quot; V=3D1&#39;<br>
=C2=A0EXTRA_OEMAKE +=3D &#39;HOSTCC=3D&quot;${BUILD_CC} ${BUILD_CFLAGS} ${B=
UILD_LDFLAGS}&quot;&#39;<br>
=C2=A0EXTRA_OEMAKE +=3D &#39;STAGING_INCDIR=3D${STAGING_INCDIR_NATIVE} STAG=
ING_LIBDIR=3D${STAGING_LIBDIR_NATIVE}&#39;<br>
diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-dev=
tools/binutils/binutils.inc<br>
index 4119960c63..6d590658f8 100644<br>
--- a/meta/recipes-devtools/binutils/binutils.inc<br>
+++ b/meta/recipes-devtools/binutils/binutils.inc<br>
@@ -71,6 +71,8 @@ python do_package_prepend() {<br>
<br>
=C2=A0B =3D &quot;${S}/build.${HOST_SYS}.${TARGET_SYS}&quot;<br>
<br>
+BUILD_CFLAGS +=3D &quot;-fcommon&quot;<br>
+<br>
=C2=A0EXTRA_OECONF =3D &quot;--program-prefix=3D${TARGET_PREFIX} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-wer=
ror \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-dete=
rministic-archives \<br>
diff --git a/meta/recipes-devtools/libcomps/<a href=3D"http://libcomps_git.=
bb" rel=3D"noreferrer" target=3D"_blank">libcomps_git.bb</a> b/meta/recipes=
-devtools/libcomps/<a href=3D"http://libcomps_git.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">libcomps_git.bb</a><br>
index 40b60159bc..0e893a9b49 100644<br>
--- a/meta/recipes-devtools/libcomps/<a href=3D"http://libcomps_git.bb" rel=
=3D"noreferrer" target=3D"_blank">libcomps_git.bb</a><br>
+++ b/meta/recipes-devtools/libcomps/<a href=3D"http://libcomps_git.bb" rel=
=3D"noreferrer" target=3D"_blank">libcomps_git.bb</a><br>
@@ -17,6 +17,7 @@ inherit cmake distutils3-base<br>
<br>
=C2=A0DEPENDS +=3D &quot;libxml2 expat libcheck&quot;<br>
<br>
+BUILD_CFLAGS +=3D &quot;-fcommon&quot;<br>
=C2=A0EXTRA_OECMAKE =3D &quot; -DPYTHON_INSTALL_DIR=3D${PYTHON_SITEPACKAGES=
_DIR} -DPYTHON_DESIRED=3D3&quot;<br>
=C2=A0OECMAKE_SOURCEPATH =3D &quot;${S}/libcomps&quot;<br>
<br>
diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtool=
s/pseudo/pseudo.inc<br>
index 50e30064bd..751f1815dc 100644<br>
--- a/meta/recipes-devtools/pseudo/pseudo.inc<br>
+++ b/meta/recipes-devtools/pseudo/pseudo.inc<br>
@@ -15,6 +15,8 @@ INSANE_SKIP_${PN}-dbg +=3D &quot;libdir&quot;<br>
<br>
=C2=A0PROVIDES +=3D &quot;virtual/fakeroot&quot;<br>
<br>
+BUILD_CFLAGS +=3D &quot;-fcommon&quot;<br>
+<br>
=C2=A0MAKEOPTS =3D &quot;&quot;<br>
=C2=A0MAKEOPTS_class-native =3D &quot;&#39;RPATH=3D-Wl,--rpath=3DXORIGIN/..=
/../../sqlite3-native/usr/lib/&#39;&quot;<br>
<br>
diff --git a/meta/recipes-devtools/squashfs-tools/<a href=3D"http://squashf=
s-tools_git.bb" rel=3D"noreferrer" target=3D"_blank">squashfs-tools_git.bb<=
/a> b/meta/recipes-devtools/squashfs-tools/<a href=3D"http://squashfs-tools=
_git.bb" rel=3D"noreferrer" target=3D"_blank">squashfs-tools_git.bb</a><br>
index 9bcf026ce2..3ab9b0f2e5 100644<br>
--- a/meta/recipes-devtools/squashfs-tools/<a href=3D"http://squashfs-tools=
_git.bb" rel=3D"noreferrer" target=3D"_blank">squashfs-tools_git.bb</a><br>
+++ b/meta/recipes-devtools/squashfs-tools/<a href=3D"http://squashfs-tools=
_git.bb" rel=3D"noreferrer" target=3D"_blank">squashfs-tools_git.bb</a><br>
@@ -12,6 +12,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/plou=
gher/squashfs-tools.git;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_bla=
nk">github.com/plougher/squashfs-tools.git;protocol=3Dhttps</a> \<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git/squashfs-tools&quot;<br>
<br>
+BUILD_CFLAGS +=3D &quot;-fcommon&quot;<br>
=C2=A0EXTRA_OEMAKE =3D &quot;${PACKAGECONFIG_CONFARGS}&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;gzip xz lzo lz4 lzma xattr reproducible&quo=
t;<br>
diff --git a/meta/recipes-extended/libtirpc/<a href=3D"http://libtirpc_1.2.=
5.bb" rel=3D"noreferrer" target=3D"_blank">libtirpc_1.2.5.bb</a> b/meta/rec=
ipes-extended/libtirpc/<a href=3D"http://libtirpc_1.2.5.bb" rel=3D"noreferr=
er" target=3D"_blank">libtirpc_1.2.5.bb</a><br>
index fc66821ecc..f600430c41 100644<br>
--- a/meta/recipes-extended/libtirpc/<a href=3D"http://libtirpc_1.2.5.bb" r=
el=3D"noreferrer" target=3D"_blank">libtirpc_1.2.5.bb</a><br>
+++ b/meta/recipes-extended/libtirpc/<a href=3D"http://libtirpc_1.2.5.bb" r=
el=3D"noreferrer" target=3D"_blank">libtirpc_1.2.5.bb</a><br>
@@ -21,7 +21,7 @@ inherit autotools pkgconfig<br>
<br>
=C2=A0EXTRA_OECONF =3D &quot;--disable-gssapi&quot;<br>
<br>
-CFLAGS +=3D &quot;-fcommon&quot;<br>
+BUILD_CFLAGS +=3D &quot;-fcommon&quot;<br>
<br>
=C2=A0do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 chown root:root ${D}${sysconfdir}/netconfig<br>
diff --git a/meta/recipes-kernel/dtc/dtc.inc b/meta/recipes-kernel/dtc/dtc.=
inc<br>
index 0650e3c82e..6a5b5e5ef1 100644<br>
--- a/meta/recipes-kernel/dtc/dtc.inc<br>
+++ b/meta/recipes-kernel/dtc/dtc.inc<br>
@@ -10,7 +10,8 @@ SRC_URI =3D &quot;git://<a href=3D"http://git.kernel.org/=
pub/scm/utils/dtc/dtc.git" rel=3D"noreferrer" target=3D"_blank">git.kernel.=
org/pub/scm/utils/dtc/dtc.git</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;v(?P&lt;pver&gt;\d+(\.\d+)+)&quo=
t;<br>
<br>
-EXTRA_OEMAKE=3D&#39;NO_PYTHON=3D1 PREFIX=3D&quot;${prefix}&quot; LIBDIR=3D=
&quot;${libdir}&quot; DESTDIR=3D&quot;${D}&quot;&#39;<br>
+EXTRA_CFLAGS +=3D &quot;-fcommon&quot;<br>
+EXTRA_OEMAKE=3D&#39;NO_PYTHON=3D1 PREFIX=3D&quot;${prefix}&quot; LIBDIR=3D=
&quot;${libdir}&quot; DESTDIR=3D&quot;${D}&quot; EXTRA_CFLAGS=3D&quot;${EXT=
RA_CFLAGS}&quot;&#39;<br>
<br>
=C2=A0inherit pkgconfig<br>
<br>
diff --git a/meta/recipes-support/gdbm/<a href=3D"http://gdbm_1.18.1.bb" re=
l=3D"noreferrer" target=3D"_blank">gdbm_1.18.1.bb</a> b/meta/recipes-suppor=
t/gdbm/<a href=3D"http://gdbm_1.18.1.bb" rel=3D"noreferrer" target=3D"_blan=
k">gdbm_1.18.1.bb</a><br>
index 5cb7c558b8..5f55ab0ffb 100644<br>
--- a/meta/recipes-support/gdbm/<a href=3D"http://gdbm_1.18.1.bb" rel=3D"no=
referrer" target=3D"_blank">gdbm_1.18.1.bb</a><br>
+++ b/meta/recipes-support/gdbm/<a href=3D"http://gdbm_1.18.1.bb" rel=3D"no=
referrer" target=3D"_blank">gdbm_1.18.1.bb</a><br>
@@ -23,7 +23,7 @@ CACHED_CONFIGUREVARS +=3D &quot;ac_cv_lib_ndbm_main=3Dno =
ac_cv_lib_dbm_main=3Dno&quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
-CFLAGS +=3D &quot;-fcommon&quot;<br>
+BUILD_CFLAGS +=3D &quot;-fcommon&quot;<br>
<br>
=C2=A0do_install_append () {<br>
=C2=A0 =C2=A0 =C2=A0# Create a symlink to ndbm.h and gdbm.h in include/gdbm=
 to let other packages to find<br>
-- <br>
2.26.2<br>
<br>
</blockquote></div></div>

--000000000000e50afd05a4c1e638--
