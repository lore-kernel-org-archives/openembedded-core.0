Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T6RRL-00054n-OX
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Aug 2012 21:27:07 +0200
Received: by eekb57 with SMTP id b57so1703240eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2012 12:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=9focWtmNGr7Q89gSODWCjuyKhKIMzCshmO1ppb67/a0=;
	b=BsTNC2zf6fuBqfmkeTe4Qi8aw+aF5cMtdC4qqlF/qTZvTWp/dTvlPf/hQTqGpXkxpA
	TTgTweRKSjPtiSUdTeoH82SOOY0UgCsnkYbh/bqmIj8gBjCGUwU3O/bY82X1WCBlW5Tr
	gwARTtWNSSqZgVgYIFiTj9y+mLPuSSs7So0/GQjYNpSa3YyrZ3WocQ53tUm5I0IAAu83
	9tU9SYFGv6aZHS6xooVMbehlDQ0gjA1cW4+Aoo0KdInWLcDo3wydB3ihCZ4f5R4tHazF
	kcAUgfld161TWGV7rB+kkeGCVJW3Q+QlvLJV+YY0+0lERcUiDY7mjjZYfVamwmSdTg1x
	uAxQ==
Received: by 10.14.202.131 with SMTP id d3mr23724156eeo.32.1346181294613; Tue,
	28 Aug 2012 12:14:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Tue, 28 Aug 2012 12:14:24 -0700 (PDT)
In-Reply-To: <1346168136.23096.4.camel@ted>
References: <1346168136.23096.4.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Aug 2012 12:14:24 -0700
Message-ID: <CAMKF1somm8-J+Sdz+yVAXeSiLpi+N_pRrTjdq-9vN1zHAeCsPQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nativesdk: Switch to using nativesdk as a prefix, not a suffix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Aug 2012 19:27:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 28, 2012 at 8:35 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> As discussed on the mailing lists, using a suffix to package names is
> hard and has lead to many recipes having to do PKGSUFFIX games. Its
> looking extremely hard to scale nativesdk much further without hacking
> many recipes.
>
> By comparison, using a prefix like multilib does works much better and
> doesn't involve "hacking" as many recipes. This change converts nativesdk
> to use a prefix using the existing multilib infrastructure.
>

Hi Richard

Thanks for doing it.
Please leave some lead time for distro folks to adapt their policies
to this change


> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 59febd1..801896a 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -191,7 +191,7 @@ def preferred_ml_updates(d):
>      for v in versions:
>          val =3D d.getVar(v, False)
>          pkg =3D v.replace("PREFERRED_VERSION_", "")
> -        if pkg.endswith("-native") or pkg.endswith("-nativesdk"):
> +        if pkg.endswith("-native") or pkg.startswith("nativesdk-"):
>              continue
>          for p in prefixes:
>              newname =3D "PREFERRED_VERSION_" + p + "-" + pkg
> @@ -201,7 +201,7 @@ def preferred_ml_updates(d):
>      for prov in providers:
>          val =3D d.getVar(prov, False)
>          pkg =3D prov.replace("PREFERRED_PROVIDER_", "")
> -        if pkg.endswith("-native") or pkg.endswith("-nativesdk"):
> +        if pkg.endswith("-native") or pkg.startswith("nativesdk-"):
>              continue
>          virt =3D ""
>          if pkg.startswith("virtual/"):
> @@ -218,7 +218,7 @@ def preferred_ml_updates(d):
>      mp =3D (d.getVar("MULTI_PROVIDER_WHITELIST", True) or "").split()
>      extramp =3D []
>      for p in mp:
> -        if p.endswith("-native") or p.endswith("-nativesdk"):
> +        if p.endswith("-native") or p.startswith("nativesdk-"):
>              continue
>          virt =3D ""
>          if p.startswith("virtual/"):
> @@ -359,15 +359,18 @@ python () {
>                      subs =3D a.split("/", 1)[1]
>                      newappends.append("virtual/" + prefix + subs + exten=
sion)
>                  else:
> -                    newappends.append(prefix + a + extension)
> +                    if a.startswith(prefix):
> +                        newappends.append(a + extension)
> +                    else:
> +                        newappends.append(prefix + a + extension)
>              return newappends
>
>          def appendVar(varname, appends):
>              if not appends:
>                  return
>              if varname.find("DEPENDS") !=3D -1:
> -                if pn.endswith("-nativesdk"):
> -                    appends =3D expandFilter(appends, "-nativesdk", "")
> +                if pn.startswith("nativesdk-"):
> +                    appends =3D expandFilter(appends, "", "nativesdk-")
>                  if pn.endswith("-native"):
>                      appends =3D expandFilter(appends, "-native", "")
>                  if mlprefix:
> @@ -456,7 +459,7 @@ python () {
>
>          dont_want_license =3D d.getVar('INCOMPATIBLE_LICENSE', True)
>
> -        if dont_want_license and not pn.endswith("-native") and not pn.e=
ndswith("-cross") and not pn.endswith("-cross-initial") and not pn.endswith=
("-cross-intermediate") and not pn.endswith("-crosssdk-intermediate") and n=
ot pn.endswith("-crosssdk") and not pn.endswith("-crosssdk-initial") and no=
t pn.endswith("-cross-canadian-%s" % d.getVar('TRANSLATED_TARGET_ARCH', Tru=
e)) and not pn.endswith("-nativesdk"):
> +        if dont_want_license and not pn.endswith("-native") and not pn.e=
ndswith("-cross") and not pn.endswith("-cross-initial") and not pn.endswith=
("-cross-intermediate") and not pn.endswith("-crosssdk-intermediate") and n=
ot pn.endswith("-crosssdk") and not pn.endswith("-crosssdk-initial") and no=
t pn.endswith("-cross-canadian-%s" % d.getVar('TRANSLATED_TARGET_ARCH', Tru=
e)) and not pn.startswith("nativesdk-"):
>          # Internally, we'll use the license mapping. This way INCOMPATIB=
LE_LICENSE =3D "GPLv2" and
>          # INCOMPATIBLE_LICENSE =3D "GPLv2.0" will pick up all variations=
 of GPL-2.0
>              spdx_license =3D return_spdx(d, dont_want_license)
> diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-can=
adian.bbclass
> index ed53118..aec7301 100644
> --- a/meta/classes/cross-canadian.bbclass
> +++ b/meta/classes/cross-canadian.bbclass
> @@ -52,7 +52,7 @@ LDFLAGS =3D "${BUILDSDK_LDFLAGS} \
>             -Wl,-rpath-link,${STAGING_LIBDIR}/.. \
>             -Wl,-rpath,${libdir}/.. "
>
> -DEPENDS_GETTEXT =3D "gettext-native gettext-nativesdk"
> +DEPENDS_GETTEXT =3D "gettext-native nativesdk-gettext"
>
>  # Path mangling needed by the cross packaging
>  # Note that we use :=3D here to ensure that libdir and includedir are
> diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bb=
class
> index f196df5..0da10a1 100644
> --- a/meta/classes/distrodata.bbclass
> +++ b/meta/classes/distrodata.bbclass
> @@ -33,10 +33,10 @@ python do_distrodata_np() {
>             localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d=
.getVar('OVERRIDES', True))
>             bb.data.update_data(localdata)
>
> -       if pn.find("-nativesdk") !=3D -1:
> -           pnstripped =3D pn.split("-nativesdk")
> +       if pn.find("nativesdk-") !=3D -1:
> +           pnstripped =3D pn.replace("nativesdk-", "")
>             bb.note("Native Split: %s" % pnstripped)
> -           localdata.setVar('OVERRIDES', "pn-" + pnstripped[0] + ":" + d=
.getVar('OVERRIDES', True))
> +           localdata.setVar('OVERRIDES', "pn-" + pnstripped + ":" + d.ge=
tVar('OVERRIDES', True))
>             bb.data.update_data(localdata)
>
>         if pn.find("-cross") !=3D -1:
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 8b6f054..6de14e0 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -195,7 +195,7 @@ def package_qa_check_dev(path, name, d, elf, messages=
):
>      Check for ".so" library symlinks in non-dev packages
>      """
>
> -    if not name.endswith("-dev") and not name.endswith("-dbg") and not n=
ame.endswith("-nativesdk") and path.endswith(".so") and os.path.islink(path=
):
> +    if not name.endswith("-dev") and not name.endswith("-dbg") and not n=
ame.startswith("nativesdk-") and path.endswith(".so") and os.path.islink(pa=
th):
>          messages.append("non -dev/-dbg/-nativesdk package contains symli=
nk .so: %s path '%s'" % \
>                   (name, package_qa_clean_path(path,d)))
>
> @@ -726,7 +726,7 @@ Rerun configure task after fixing this. The path was =
'%s'""" % root)
>          if bb.data.inherits_class('native', d) or bb.data.inherits_class=
('cross', d) or bb.data.inherits_class('crosssdk', d) or bb.data.inherits_c=
lass('nativesdk', d):
>              gt =3D "gettext-native"
>          elif bb.data.inherits_class('cross-canadian', d):
> -            gt =3D "gettext-nativesdk"
> +            gt =3D "nativesdk-gettext"
>          else:
>              gt =3D "virtual/" + ml + "gettext"
>          deps =3D bb.utils.explode_deps(d.getVar('DEPENDS', True) or "")
> diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbcl=
ass
> index 8c0cd5b..3334817 100644
> --- a/meta/classes/nativesdk.bbclass
> +++ b/meta/classes/nativesdk.bbclass
> @@ -52,8 +52,6 @@ baselib =3D "lib"
>  export PKG_CONFIG_DIR =3D "${STAGING_DIR_HOST}${libdir}/pkgconfig"
>  export PKG_CONFIG_SYSROOT_DIR =3D "${STAGING_DIR_HOST}"
>
> -PKGSUFFIX =3D "-nativesdk"
> -
>  python nativesdk_virtclass_handler () {
>      if not isinstance(e, bb.event.RecipePreFinalise):
>          return
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.=
bbclass
> index 9abad5e..fc7f3d2 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -1119,7 +1119,7 @@ python do_package_rpm () {
>      targetsys =3D d.getVar('TARGET_SYS', True)
>      targetvendor =3D d.getVar('TARGET_VENDOR', True)
>      package_arch =3D d.getVar('PACKAGE_ARCH', True) or ""
> -    if package_arch not in "all any noarch".split():
> +    if package_arch not in "all any noarch".split() and not package_arch=
.endswith("-nativesdk"):
>          ml_prefix =3D (d.getVar('MLPREFIX', True) or "").replace("-", "_=
")
>          d.setVar('PACKAGE_ARCH_EXTEND', ml_prefix + package_arch)
>      else:
> diff --git a/meta/classes/pkgconfig.bbclass b/meta/classes/pkgconfig.bbcl=
ass
> index ddcf878..5908b7f 100644
> --- a/meta/classes/pkgconfig.bbclass
> +++ b/meta/classes/pkgconfig.bbclass
> @@ -2,6 +2,6 @@ DEPENDS_prepend =3D "pkgconfig-native "
>
>  PKGCONFIGRDEP =3D "pkgconfig"
>  PKGCONFIGRDEP_virtclass-native =3D ""
> -PKGCONFIGRDEP_virtclass-nativesdk =3D "pkgconfig-nativesdk"
> +PKGCONFIGRDEP_virtclass-nativesdk =3D "nativesdk-pkgconfig"
>
>  RDEPENDS_${PN}-dev +=3D "${PKGCONFIGRDEP}"
> diff --git a/meta/classes/populate_sdk.bbclass b/meta/classes/populate_sd=
k.bbclass
> index e5bb540..f64a911 100644
> --- a/meta/classes/populate_sdk.bbclass
> +++ b/meta/classes/populate_sdk.bbclass
> @@ -4,3 +4,4 @@
>  inherit populate_sdk_base
>
>  addtask populate_sdk after do_install before do_build
> +
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/popula=
te_sdk_base.bbclass
> index a1cb12a..c9fb00d 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -7,7 +7,7 @@ SDK_DEPLOY =3D "${TMPDIR}/deploy/sdk"
>
>  SDKTARGETSYSROOT =3D "${SDKPATH}/sysroots/${MULTIMACH_TARGET_SYS}"
>
> -TOOLCHAIN_HOST_TASK ?=3D "task-sdk-host-nativesdk task-cross-canadian-${=
TRANSLATED_TARGET_ARCH}"
> +TOOLCHAIN_HOST_TASK ?=3D "nativesdk-task-sdk-host task-cross-canadian-${=
TRANSLATED_TARGET_ARCH}"
>  TOOLCHAIN_HOST_TASK_ATTEMPTONLY ?=3D ""
>  TOOLCHAIN_TARGET_TASK ?=3D "task-core-standalone-sdk-target task-core-st=
andalone-sdk-target-dbg"
>  TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?=3D ""
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 7dfeda3..1d56813 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -194,7 +194,7 @@ EXTENDPKGV ?=3D "${EXTENDPKGEVER}${PKGV}-${PKGR}"
>  # Base package name
>  # Automatically derives "foo" from "foo-native", "foo-cross" or "foo-ini=
tial"
>  # otherwise it is the same as PN and P
> -SPECIAL_PKGSUFFIX =3D "-native -cross -initial -intermediate -nativesdk =
-crosssdk -cross-canadian"
> +SPECIAL_PKGSUFFIX =3D "-native -cross -initial -intermediate -crosssdk -=
cross-canadian"
>  BPN =3D "${@base_prune_suffix(d.getVar('PN', True), d.getVar('SPECIAL_PK=
GSUFFIX', True).split(), d)}"
>  BP =3D "${BPN}-${PV}"
>
> @@ -250,7 +250,7 @@ PROVIDES =3D ""
>  PROVIDES_prepend =3D "${P} ${PF} ${PN} "
>  RPROVIDES =3D ""
>
> -MULTI_PROVIDER_WHITELIST =3D "virtual/libintl virtual/libintl-native vir=
tual/libintl-nativesdk virtual/xserver virtual/update-alternatives-native v=
irtual/update-alternatives"
> +MULTI_PROVIDER_WHITELIST =3D "virtual/libintl virtual/libintl-native vir=
tual/nativesdk-libintl virtual/xserver virtual/update-alternatives-native v=
irtual/update-alternatives"
>
>  SOLIBS =3D ".so.*"
>  SOLIBS_darwin =3D ".*.dylib"
> diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/d=
istro/include/default-providers.inc
> index 28d2f8e..2d8a17d 100644
> --- a/meta/conf/distro/include/default-providers.inc
> +++ b/meta/conf/distro/include/default-providers.inc
> @@ -27,12 +27,12 @@ PREFERRED_PROVIDER_dbus-glib ?=3D "dbus-glib"
>  PREFERRED_PROVIDER_dbus-glib-native ?=3D "dbus-glib-native"
>  PREFERRED_PROVIDER_gdk-pixbuf ?=3D "gdk-pixbuf"
>  PREFERRED_PROVIDER_libgcc ?=3D "libgcc"
> -PREFERRED_PROVIDER_libgcc-nativesdk ?=3D "libgcc-nativesdk"
> +PREFERRED_PROVIDER_nativesdk-libgcc ?=3D "nativesdk-libgcc"
>  PREFERRED_PROVIDER_linux-libc-headers ?=3D "linux-libc-headers"
> -PREFERRED_PROVIDER_linux-libc-headers-nativesdk ?=3D "linux-libc-headers=
-nativesdk"
> +PREFERRED_PROVIDER_nativesdk-linux-libc-headers ?=3D "nativesdk-linux-li=
bc-headers"
>  PREFERRED_PROVIDER_matchbox-panel ?=3D "matchbox-panel-2"
>  PREFERRED_PROVIDER_opkg ?=3D "opkg"
>  PREFERRED_PROVIDER_opkg-native ?=3D "opkg-native"
> -PREFERRED_PROVIDER_opkg-nativesdk ?=3D "opkg-nativesdk"
> +PREFERRED_PROVIDER_nativesdk-opkg ?=3D "nativesdk-opkg"
>  PREFERRED_PROVIDER_console-tools ?=3D "kbd"
>  PREFERRED_PROVIDER_gzip-native ?=3D "pigz-native"
> diff --git a/meta/conf/distro/include/tclibc-eglibc.inc b/meta/conf/distr=
o/include/tclibc-eglibc.inc
> index 4f5607f..1c9e7e9 100644
> --- a/meta/conf/distro/include/tclibc-eglibc.inc
> +++ b/meta/conf/distro/include/tclibc-eglibc.inc
> @@ -9,10 +9,10 @@ LIBCOVERRIDE =3D ":libc-glibc"
>  OVERRIDES .=3D "${LIBCOVERRIDE}"
>
>  PREFERRED_PROVIDER_virtual/libiconv ?=3D "eglibc"
> -PREFERRED_PROVIDER_virtual/libiconv-nativesdk ?=3D "eglibc-nativesdk"
> +PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?=3D "nativesdk-eglibc"
>  PREFERRED_PROVIDER_virtual/libintl ?=3D "eglibc"
>  PREFERRED_PROVIDER_virtual/libc ?=3D "eglibc"
> -PREFERRED_PROVIDER_virtual/libc-nativesdk ?=3D "eglibc-nativesdk"
> +PREFERRED_PROVIDER_virtual/nativesdk-libc ?=3D "nativesdk-eglibc"
>  PREFERRED_PROVIDER_virtual/libc-locale ?=3D "eglibc-locale"
>
>  CXXFLAGS +=3D "-fvisibility-inlines-hidden"
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/dist=
ro/include/tcmode-default.inc
> index 2bfa225..9193691 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -12,9 +12,9 @@ PREFERRED_PROVIDER_gdb =3D "gdb"
>
>  # Default libc config
>  PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc =3D "${TCLIBC}"
> -PREFERRED_PROVIDER_virtual/${SDK_PREFIX}libc-for-gcc-nativesdk ?=3D "${T=
CLIBC}-nativesdk"
> +PREFERRED_PROVIDER_virtual/nativesdk-${SDK_PREFIX}libc-for-gcc ?=3D "nat=
ivesdk-${TCLIBC}"
>  PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial =3D "${TCLIBC}-i=
nitial"
> -PREFERRED_PROVIDER_virtual/${SDK_PREFIX}libc-initial-nativesdk =3D "${TC=
LIBC}-initial-nativesdk"
> +PREFERRED_PROVIDER_virtual/nativesdk-${SDK_PREFIX}libc-initial =3D "nati=
vesdk-${TCLIBC}-initial"
>  PREFERRED_PROVIDER_virtual/gettext ??=3D "gettext"
>
>  GCCVERSION ?=3D "4.7%"
> @@ -33,20 +33,20 @@ PREFERRED_VERSION_gcc-crosssdk-initial ?=3D "${SDKGCC=
VERSION}"
>  PREFERRED_VERSION_gcc-crosssdk-intermediate ?=3D "${SDKGCCVERSION}"
>  PREFERRED_VERSION_gcc-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=3D "${G=
CCVERSION}"
>  PREFERRED_VERSION_gcc-runtime ?=3D "${GCCVERSION}"
> -PREFERRED_VERSION_gcc-runtime-nativesdk ?=3D "${SDKGCCVERSION}"
> +PREFERRED_VERSION_nativesdk-gcc-runtime ?=3D "${SDKGCCVERSION}"
>  PREFERRED_VERSION_libgcc ?=3D "${GCCVERSION}"
> -PREFERRED_VERSION_libgcc-nativesdk ?=3D "${SDKGCCVERSION}"
> +PREFERRED_VERSION_nativesdk-libgcc ?=3D "${SDKGCCVERSION}"
>  PREFERRED_VERSION_binutils ?=3D "${BINUVERSION}"
>  PREFERRED_VERSION_binutils-cross ?=3D "${BINUVERSION}"
>  PREFERRED_VERSION_binutils-crosssdk ?=3D "${BINUVERSION}"
>  PREFERRED_VERSION_binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} ?=3D=
 "${BINUVERSION}"
>  PREFERRED_VERSION_linux-libc-headers ?=3D "${LINUXLIBCVERSION}"
> -PREFERRED_VERSION_linux-libc-headers-nativesdk ?=3D "${LINUXLIBCVERSION}=
"
> +PREFERRED_VERSION_nativesdk-linux-libc-headers ?=3D "${LINUXLIBCVERSION}=
"
>  PREFERRED_VERSION_eglibc                   ?=3D "${EGLIBCVERSION}"
>  PREFERRED_VERSION_eglibc-locale            ?=3D "${EGLIBCVERSION}"
> -PREFERRED_VERSION_eglibc-nativesdk         ?=3D "${EGLIBCVERSION}"
> +PREFERRED_VERSION_nativesdk-eglibc         ?=3D "${EGLIBCVERSION}"
>  PREFERRED_VERSION_eglibc-initial           ?=3D "${EGLIBCVERSION}"
> -PREFERRED_VERSION_eglibc-initial-nativesdk ?=3D "${EGLIBCVERSION}"
> +PREFERRED_VERSION_nativesdk-eglibc-initial ?=3D "${EGLIBCVERSION}"
>  PREFERRED_VERSION_cross-localedef-native   ?=3D "${EGLIBCVERSION}"
>  PREFERRED_VERSION_uclibc                   ?=3D "${UCLIBCVERSION}"
>  PREFERRED_VERSION_uclibc-initial           ?=3D "${UCLIBCVERSION}"
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index 20d94b2..50b4027 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -7,7 +7,7 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep=
, depname, dataCache):
>      def isCross(x):
>          return x.endswith("-cross") or x.endswith("-cross-initial") or x=
.endswith("-cross-intermediate")
>      def isNativeSDK(x):
> -        return x.endswith("-nativesdk")
> +        return x.startswith("nativesdk-")
>      def isKernel(fn):
>          inherits =3D " ".join(dataCache.inherits[fn])
>          return inherits.find("module-base.bbclass") !=3D -1 or inherits.=
find("linux-kernel-base.bbclass") !=3D -1
> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbu=
s.inc
> index 1984c74..8f35f56 100644
> --- a/meta/recipes-core/dbus/dbus.inc
> +++ b/meta/recipes-core/dbus/dbus.inc
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D10dded3b58148f=
3f1fd804b26354af3e \
>  X11DEPENDS =3D "virtual/libx11 libsm"
>  DEPENDS =3D "expat virtual/libintl ${@base_contains('DISTRO_FEATURES', '=
x11', '${X11DEPENDS}', '', d)}"
>  DEPENDS_virtclass-native =3D "expat-native virtual/libintl-native"
> -DEPENDS_virtclass-nativesdk =3D "expat-nativesdk virtual/libintl-natives=
dk virtual/libx11"
> +DEPENDS_virtclass-nativesdk =3D "nativesdk-expat virtual/nativesdk-libin=
tl virtual/libx11"
>
>  INC_PR =3D "r3"
>
> diff --git a/meta/recipes-core/eglibc/eglibc-locale.inc b/meta/recipes-co=
re/eglibc/eglibc-locale.inc
> index d6bdcb5..296afde 100644
> --- a/meta/recipes-core/eglibc/eglibc-locale.inc
> +++ b/meta/recipes-core/eglibc/eglibc-locale.inc
> @@ -17,7 +17,7 @@ do_compile[noexec] =3D "1"
>
>  # default to disabled
>  ENABLE_BINARY_LOCALE_GENERATION ?=3D "0"
> -ENABLE_BINARY_LOCALE_GENERATION_pn-eglibc-locale-nativesdk =3D "0"
> +ENABLE_BINARY_LOCALE_GENERATION_pn-nativesdk-eglibc-locale =3D "0"
>
>  #enable locale generation on these arches
>  # BINARY_LOCALE_ARCHES is a space separated list of regular expressions
> @@ -29,16 +29,13 @@ LOCALE_GENERATION_WITH_CROSS-LOCALEDEF =3D "1"
>
>  PR =3D "r22"
>
> -PKGSUFFIX =3D ""
> -PKGSUFFIX_virtclass-nativesdk =3D "-nativesdk"
> +PROVIDES =3D "virtual/libc-locale"
>
> -PROVIDES =3D "virtual/libc-locale${PKGSUFFIX}"
> -
> -PACKAGES =3D "localedef${PKGSUFFIX} ${PN}-dbg"
> +PACKAGES =3D "localedef ${PN}-dbg"
>
>  PACKAGES_DYNAMIC =3D "locale-base-* \
>                      eglibc-gconv-* eglibc-charmap-* eglibc-localedata-* =
eglibc-binary-localedata-* \
> -                    glibc-gconv-*${PKGSUFFIX}  glibc-charmap-*  glibc-lo=
caledata-*  glibc-binary-localedata-*"
> +                    glibc-gconv-*  glibc-charmap-*  glibc-localedata-*  =
glibc-binary-localedata-*"
>
>  # Create a eglibc-binaries package
>  ALLOW_EMPTY_${BPN}-binaries =3D "1"
> @@ -67,7 +64,7 @@ DESCRIPTION_localedef =3D "eglibc: compile locale defin=
ition files"
>  # Explicitly add ${MLPREFIX} for FILES_eglibc-gconv.
>  FILES_${MLPREFIX}eglibc-gconv =3D "${libdir}/gconv/*"
>  FILES_${PN}-dbg +=3D "${libdir}/gconv/.debug/*"
> -FILES_localedef${PKGSUFFIX} =3D "${bindir}/localedef"
> +FILES_localedef =3D "${bindir}/localedef"
>
>  LOCALETREESRC =3D "${STAGING_INCDIR}/eglibc-locale-internal-${MULTIMACH_=
TARGET_SYS}"
>
> @@ -93,6 +90,6 @@ do_install () {
>
>  inherit libc-package
>
> -do_install[depends] +=3D "virtual/${MLPREFIX}libc${PKGSUFFIX}:do_populat=
e_sysroot"
> +do_install[depends] +=3D "virtual/${MLPREFIX}libc:do_populate_sysroot"
>
>  BBCLASSEXTEND =3D "nativesdk"
> diff --git a/meta/recipes-core/eglibc/eglibc-package.inc b/meta/recipes-c=
ore/eglibc/eglibc-package.inc
> index af78456..bd46cb8 100644
> --- a/meta/recipes-core/eglibc/eglibc-package.inc
> +++ b/meta/recipes-core/eglibc/eglibc-package.inc
> @@ -17,47 +17,44 @@ python __anonymous () {
>  # Set this to zero if you don't want ldconfig in the output package
>  USE_LDCONFIG ?=3D "1"
>
> -PKGSUFFIX =3D ""
> -PKGSUFFIX_virtclass-nativesdk =3D "-nativesdk"
> -
> -PACKAGES =3D "${PN}-dbg catchsegv${PKGSUFFIX} sln${PKGSUFFIX} nscd${PKGS=
UFFIX} ldd${PKGSUFFIX} ${PN}-mtrace ${PN}-utils eglibc-thread-db${PKGSUFFIX=
} ${PN}-pic libcidn${PKGSUFFIX} libmemusage${PKGSUFFIX} libsegfault${PKGSUF=
FIX} ${PN}-pcprofile libsotruss${PKGSUFFIX} ${PN}-dev ${PN}-staticdev ${PN}=
-doc ${PN} eglibc-extra-nss${PKGSUFFIX}"
> +PACKAGES =3D "${PN}-dbg catchsegv sln nscd ldd ${PN}-mtrace ${PN}-utils =
eglibc-thread-db ${PN}-pic libcidn libmemusage libsegfault ${PN}-pcprofile =
libsotruss ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN} eglibc-extra-nss"
>
>  # The ld.so in this eglibc supports the GNU_HASH
> -RPROVIDES_${PN} =3D "glibc${PKGSUFFIX} rtld(GNU_HASH)"
> -RPROVIDES_${PN}-utils =3D "glibc${PKGSUFFIX}-utils"
> -RPROVIDES_${PN}-mtrace =3D "glibc${PKGSUFFIX}-mtrace libc-mtrace"
> -RPROVIDES_${PN}-pic =3D "glibc${PKGSUFFIX}-pic"
> -RPROVIDES_${PN}-dev =3D "glibc${PKGSUFFIX}-dev"
> -RPROVIDES_${PN}-staticdev =3D "glibc${PKGSUFFIX}-staticdev"
> -RPROVIDES_${PN}-doc =3D "glibc${PKGSUFFIX}-doc"
> -RPROVIDES_eglibc-extra-nss${PKGSUFFIX} =3D "glibc-extra-nss${PKGSUFFIX}"
> -RPROVIDES_eglibc-thread-db${PKGSUFFIX} =3D "glibc-thread-db${PKGSUFFIX}"
> -RPROVIDES_${PN}-pcprofile =3D "glibc${PKGSUFFIX}-pcprofile"
> -RPROVIDES_${PN}-dbg =3D "glibc-dbg${PKGSUFFIX}"
> +RPROVIDES_${PN} =3D "glibc rtld(GNU_HASH)"
> +RPROVIDES_${PN}-utils =3D "glibc-utils"
> +RPROVIDES_${PN}-mtrace =3D "glibc-mtrace libc-mtrace"
> +RPROVIDES_${PN}-pic =3D "glibc-pic"
> +RPROVIDES_${PN}-dev =3D "glibc-dev"
> +RPROVIDES_${PN}-staticdev =3D "glibc-staticdev"
> +RPROVIDES_${PN}-doc =3D "glibc-doc"
> +RPROVIDES_eglibc-extra-nss =3D "glibc-extra-nss"
> +RPROVIDES_eglibc-thread-db =3D "glibc-thread-db"
> +RPROVIDES_${PN}-pcprofile =3D "glibc-pcprofile"
> +RPROVIDES_${PN}-dbg =3D "glibc-dbg"
>  libc_baselibs =3D "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt=
-*.so ${base_libdir}/libc.so.* ${base_libdir}/libc-*.so ${base_libdir}/libm=
*.so.* ${base_libdir}/libm-*.so ${base_libdir}/ld*.so.* ${base_libdir}/ld-*=
.so ${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so ${base_l=
ibdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so ${base_libdir}/librt*.=
so.* ${base_libdir}/librt-*.so ${base_libdir}/libutil*.so.* ${base_libdir}/=
libutil-*.so ${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so ${base_=
libdir}/libnss_files*.so.* ${base_libdir}/libnss_files-*.so ${base_libdir}/=
libnss_compat*.so.* ${base_libdir}/libnss_compat-*.so ${base_libdir}/libnss=
_dns*.so.* ${base_libdir}/libnss_dns-*.so ${base_libdir}/libdl*.so.* ${base=
_libdir}/libdl-*.so ${base_libdir}/libanl*.so.* ${base_libdir}/libanl-*.so =
${base_libdir}/libBrokenLocale*.so.* ${base_libdir}/libBrokenLocale-*.so"
>
>  FILES_${PN} =3D "${libc_baselibs} ${libexecdir}/* ${@base_conditional('U=
SE_LDCONFIG', '1', '${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf', '',=
 d)}"
> -FILES_ldd${PKGSUFFIX} =3D "${bindir}/ldd"
> -FILES_libsegfault${PKGSUFFIX} =3D "${base_libdir}/libSegFault*"
> -FILES_libcidn${PKGSUFFIX} =3D "${base_libdir}/libcidn-*.so ${base_libdir=
}/libcidn.so.*"
> -FILES_libmemusage${PKGSUFFIX} =3D "${base_libdir}/libmemusage.so"
> -FILES_eglibc-extra-nss${PKGSUFFIX} =3D "${base_libdir}/libnss_*-*.so ${b=
ase_libdir}/libnss_*.so.*"
> -FILES_sln${PKGSUFFIX} =3D "/sbin/sln"
> +FILES_ldd =3D "${bindir}/ldd"
> +FILES_libsegfault =3D "${base_libdir}/libSegFault*"
> +FILES_libcidn =3D "${base_libdir}/libcidn-*.so ${base_libdir}/libcidn.so=
.*"
> +FILES_libmemusage =3D "${base_libdir}/libmemusage.so"
> +FILES_eglibc-extra-nss =3D "${base_libdir}/libnss_*-*.so ${base_libdir}/=
libnss_*.so.*"
> +FILES_sln =3D "/sbin/sln"
>  FILES_${PN}-pic =3D "${libdir}/*_pic.a ${libdir}/*_pic.map ${libdir}/lib=
c_pic/*.o"
> -FILES_libsotruss${PKGSUFFIX} =3D "${libdir}/audit/sotruss-lib.so"
> +FILES_libsotruss =3D "${libdir}/audit/sotruss-lib.so"
>  FILES_SOLIBSDEV =3D "${libdir}/lib*${SOLIBSDEV}"
>  FILES_${PN}-dev +=3D "${bindir}/rpcgen ${libdir}/*_nonshared.a ${base_li=
bdir}/*_nonshared.a ${base_libdir}/*.o ${datadir}/aclocal"
>  FILES_${PN}-staticdev +=3D "${libdir}/*.a ${base_libdir}/*.a"
> -FILES_nscd${PKGSUFFIX} =3D "${sbindir}/nscd*"
> +FILES_nscd =3D "${sbindir}/nscd*"
>  FILES_${PN}-mtrace =3D "${bindir}/mtrace"
>  FILES_${PN}-utils =3D "${bindir}/* ${sbindir}/*"
>  FILES_${PN}-dbg +=3D "${libexecdir}/*/.debug ${libdir}/audit/.debug"
> -FILES_catchsegv${PKGSUFFIX} =3D "${bindir}/catchsegv"
> -RDEPENDS_catchsegv${PKGSUFFIX} =3D "libsegfault"
> +FILES_catchsegv =3D "${bindir}/catchsegv"
> +RDEPENDS_catchsegv =3D "libsegfault"
>  RDEPENDS_${PN}-utils +=3D "bash"
>  RDEPENDS_${PN}-mtrace +=3D "perl"
>  FILES_${PN}-pcprofile =3D "${base_libdir}/libpcprofile.so"
> -FILES_eglibc-thread-db${PKGSUFFIX} =3D "${base_libdir}/libthread_db.so.*=
 ${base_libdir}/libthread_db-*.so"
> +FILES_eglibc-thread-db =3D "${base_libdir}/libthread_db.so.* ${base_libd=
ir}/libthread_db-*.so"
>  RPROVIDES_${PN}-dev +=3D "libc-dev"
>  RPROVIDES_${PN}-staticdev +=3D "libc-staticdev"
>
> @@ -65,8 +62,8 @@ SUMMARY_sln =3D "The static ln."
>  DESCRIPTION_sln =3D "Similar to the 'ln' utility, but statically linked.=
  sln is useful to make symbolic links to dynamic libraries if the dynamic =
linking system, for some reason, is not functional."
>  SUMMARY_nscd =3D "Name service cache daemon"
>  DESCRIPTION_nscd =3D "nscd, name service cache daemon, caches name servi=
ce lookups for the passwd, group and hosts information.  It can damatically=
 improvide performance with remote, such as NIS or NIS+, name services."
> -SUMMARY_eglibc-extra-nss${PKGSUFFIX} =3D "hesiod, NIS and NIS+ nss libra=
ries"
> -DESCRIPTION_eglibc-extra-nss${PKGSUFFIX} =3D "eglibc: nis, nisplus and h=
esiod search services."
> +SUMMARY_eglibc-extra-nss =3D "hesiod, NIS and NIS+ nss libraries"
> +DESCRIPTION_eglibc-extra-nss =3D "eglibc: nis, nisplus and hesiod search=
 services."
>  SUMMARY_ldd =3D "print shared library dependencies"
>  DESCRIPTION_ldd =3D "/usr/bin/ldd prints shared library dependencies for=
 each program or shared library specified on the command line."
>  SUMMARY_${PN}-utils =3D "Miscellaneous utilities provided by eglibc"
> diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb b/meta/recipes=
-core/glib-2.0/glib-2.0_2.32.4.bb
> index 8f7cd69..1dd3a92 100644
> --- a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
> +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
> @@ -5,7 +5,7 @@ PE =3D "1"
>
>  DEPENDS +=3D "libffi python-argparse-native zlib"
>  DEPENDS_virtclass-native +=3D "libffi-native python-argparse-native"
> -DEPENDS_virtclass-nativesdk +=3D "libffi-nativesdk python-argparse-nativ=
e zlib-nativesdk ${BPN}-native"
> +DEPENDS_virtclass-nativesdk +=3D "nativesdk-libffi python-argparse-nativ=
e nativesdk-zlib ${BPN}-native"
>
>  SHRT_VER =3D "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).spl=
it('.')[1]}"
>
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib=
-2.0/glib.inc
> index 3540cd5..f2eb246 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -15,7 +15,7 @@ SECTION =3D "libs"
>
>  DEPENDS =3D "glib-2.0-native zip virtual/libiconv"
>  DEPENDS_virtclass-native =3D "pkgconfig-native gettext-native"
> -DEPENDS_virtclass-nativesdk =3D "libtool-nativesdk"
> +DEPENDS_virtclass-nativesdk =3D "nativesdk-libtool"
>  PACKAGES =3D+ "${PN}-utils ${PN}-bash-completion ${PN}-codegen"
>
>  LEAD_SONAME =3D "libglib-2.0.*"
> diff --git a/meta/recipes-core/meta/external-python-tarball.bb b/meta/rec=
ipes-core/meta/external-python-tarball.bb
> index e317ba3..2085acc 100644
> --- a/meta/recipes-core/meta/external-python-tarball.bb
> +++ b/meta/recipes-core/meta/external-python-tarball.bb
> @@ -16,25 +16,25 @@ SDK_DEPLOY =3D "${TMPDIR}/deploy/sdk"
>  IPKG_HOST =3D "opkg-cl -f ${IPKGCONF_SDK} -o ${SDK_OUTPUT}"
>
>  TOOLCHAIN_HOST_TASK ?=3D "\
> -    python-nativesdk-core \
> -    python-nativesdk-textutils \
> -    python-nativesdk-sqlite3 \
> -    python-nativesdk-pickle \
> -    python-nativesdk-logging \
> -    python-nativesdk-elementtree \
> -    python-nativesdk-curses \
> -    python-nativesdk-compile \
> -    python-nativesdk-compiler \
> -    python-nativesdk-fcntl \
> -    python-nativesdk-shell \
> -    python-nativesdk-misc \
> -    python-nativesdk-multiprocessing \
> -    python-nativesdk-subprocess \
> -    python-nativesdk-xmlrpc \
> -    python-nativesdk-netclient \
> -    python-nativesdk-netserver \
> -    python-nativesdk-distutils \
> -    chrpath-nativesdk \
> +    nativesdk-python-core \
> +    nativesdk-python-textutils \
> +    nativesdk-python-sqlite3 \
> +    nativesdk-python-pickle \
> +    nativesdk-python-logging \
> +    nativesdk-python-elementtree \
> +    nativesdk-python-curses \
> +    nativesdk-python-compile \
> +    nativesdk-python-compiler \
> +    nativesdk-python-fcntl \
> +    nativesdk-python-shell \
> +    nativesdk-python-misc \
> +    nativesdk-python-multiprocessing \
> +    nativesdk-python-subprocess \
> +    nativesdk-python-xmlrpc \
> +    nativesdk-python-netclient \
> +    nativesdk-python-netserver \
> +    nativesdk-python-distutils \
> +    nativesdk-chrpath \
>      "
>
>  TOOLCHAIN_OUTPUTNAME ?=3D "python-nativesdk-standalone-${SDKMACHINE}"
> diff --git a/meta/recipes-core/tasks/task-sdk-host-nativesdk.bb b/meta/re=
cipes-core/tasks/nativesdk-task-sdk-host.bb
> index 920f359..ea054bc 100644
> --- a/meta/recipes-core/tasks/task-sdk-host-nativesdk.bb
> +++ b/meta/recipes-core/tasks/nativesdk-task-sdk-host.bb
> @@ -15,21 +15,21 @@ inherit nativesdk
>  PACKAGES =3D "${PN}"
>
>  RDEPENDS_${PN} =3D "\
> -    pkgconfig-nativesdk \
> -    qemu-nativesdk \
> -    qemu-helper-nativesdk \
> -    pseudo-nativesdk \
> -    unfs-server-nativesdk \
> -    opkg-nativesdk \
> -    libtool-nativesdk \
> -    autoconf-nativesdk \
> -    automake-nativesdk \
> +    nativesdk-pkgconfig \
> +    nativesdk-qemu \
> +    nativesdk-qemu-helper \
> +    nativesdk-pseudo \
> +    nativesdk-unfs-server \
> +    nativesdk-opkg \
> +    nativesdk-libtool \
> +    nativesdk-autoconf \
> +    nativesdk-automake \
>      "
>
>  RDEPENDS_${PN}_darwin8 =3D "\
>      odcctools-cross-canadian \
>      llvm-cross-canadian \
> -    pkgconfig-nativesdk \
> -    opkg-nativesdk \
> -    libtool-nativesdk \
> +    nativesdk-pkgconfig \
> +    nativesdk-opkg \
> +    nativesdk-libtool \
>      "
> diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-d=
evtools/autoconf/autoconf.inc
> index 4f5a5b2..e80a834 100644
> --- a/meta/recipes-devtools/autoconf/autoconf.inc
> +++ b/meta/recipes-devtools/autoconf/autoconf.inc
> @@ -7,10 +7,10 @@ HOMEPAGE =3D "http://www.gnu.org/software/autoconf/"
>  SECTION =3D "devel"
>  DEPENDS +=3D "m4-native"
>  DEPENDS_virtclass-native =3D "m4-native gnu-config-native"
> -DEPENDS_virtclass-nativesdk =3D "m4-nativesdk gnu-config-nativesdk"
> +DEPENDS_virtclass-nativesdk =3D "nativesdk-m4 nativesdk-gnu-config"
>  RDEPENDS_${PN} =3D "m4 gnu-config"
>  RDEPENDS_${PN}_virtclass-native =3D "m4-native gnu-config-native"
> -RDEPENDS_${PN}_virtclass-nativesdk =3D "m4-nativesdk gnu-config-nativesd=
k"
> +RDEPENDS_${PN}_virtclass-nativesdk =3D "nativesdk-m4 nativesdk-gnu-confi=
g"
>
>  SRC_URI =3D "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.gz \
>            file://program_prefix.patch"
> diff --git a/meta/recipes-devtools/automake/automake_1.12.1.bb b/meta/rec=
ipes-devtools/automake/automake_1.12.1.bb
> index 2a97bcc..700592c 100644
> --- a/meta/recipes-devtools/automake/automake_1.12.1.bb
> +++ b/meta/recipes-devtools/automake/automake_1.12.1.bb
> @@ -28,7 +28,7 @@ RDEPENDS_${PN} +=3D "\
>      perl-module-vars "
>
>  RDEPENDS_${PN}_virtclass-native =3D "autoconf-native perl-native-runtime=
"
> -RDEPENDS_${PN}_virtclass-nativesdk =3D "autoconf-nativesdk"
> +RDEPENDS_${PN}_virtclass-nativesdk =3D "nativesdk-autoconf"
>
>  PATHFIXPATCH =3D "file://path_prog_fixes.patch"
>  PATHFIXPATCH_virtclass-native =3D ""
> diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc b=
/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> index a23531c..4658bad 100644
> --- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> +++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> @@ -4,7 +4,7 @@ DESCRIPTION =3D "A GNU collection of cross-canadian binar=
y utilities for ${TARGET_
>  PN =3D "binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}"
>  BPN =3D "binutils"
>
> -DEPENDS =3D "flex-native bison-native virtual/${HOST_PREFIX}gcc-crosssdk=
 virtual/libc-nativesdk zlib-nativesdk gettext-nativesdk"
> +DEPENDS =3D "flex-native bison-native virtual/${HOST_PREFIX}gcc-crosssdk=
 virtual/nativesdk-libc nativesdk-zlib nativesdk-gettext"
>  EXTRA_OECONF +=3D "--with-sysroot=3D${SDKPATH}/sysroots/${TUNE_PKGARCH}$=
{TARGET_VENDOR}-${TARGET_OS} \
>                  "
>  do_install () {
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/reci=
pes-devtools/gcc/gcc-cross-canadian.inc
> index cc0a3ba..ef861ae 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> @@ -4,5 +4,5 @@ DESCRIPTION =3D "The cross-canadian GNU cc and gcc C comp=
ilers for ${TARGET_ARCH}
>  PN =3D "gcc-cross-canadian-${TRANSLATED_TARGET_ARCH}"
>  BPN =3D "gcc"
>
> -DEPENDS =3D "virtual/${HOST_PREFIX}binutils-crosssdk virtual/${TARGET_PR=
EFIX}libc-for-gcc gettext-nativesdk"
> +DEPENDS =3D "virtual/${HOST_PREFIX}binutils-crosssdk virtual/nativesdk-$=
{HOST_PREFIX}libc-for-gcc gettext"
>
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb b/meta/r=
ecipes-devtools/gcc/gcc-cross-canadian_4.7.bb
> index 308e6f5..53c4632 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb
> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian_4.7.bb
> @@ -5,8 +5,8 @@ require gcc-cross-canadian.inc
>  require gcc-configure-sdk.inc
>  require gcc-package-sdk.inc
>
> -DEPENDS +=3D "gmp-nativesdk mpfr-nativesdk libmpc-nativesdk elfutils-nat=
ivesdk"
> -RDEPENDS_${PN} +=3D "mpfr-nativesdk libmpc-nativesdk elfutils-nativesdk"
> +DEPENDS +=3D "nativesdk-gmp nativesdk-mpfr nativesdk-libmpc nativesdk-el=
futils"
> +RDEPENDS_${PN} +=3D "nativesdk-mpfr nativesdk-libmpc nativesdk-elfutils"
>
>  SYSTEMHEADERS =3D "/usr/include"
>  SYSTEMLIBS =3D "${target_base_libdir}/"
> diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk.inc b/meta/recipes-de=
vtools/gcc/gcc-crosssdk.inc
> index 0fd82a6..467a3f5 100644
> --- a/meta/recipes-devtools/gcc/gcc-crosssdk.inc
> +++ b/meta/recipes-devtools/gcc/gcc-crosssdk.inc
> @@ -6,5 +6,5 @@ SYSTEMLIBS1 =3D "${SDKPATHNATIVE}${libdir_nativesdk}/"
>
>  GCCMULTILIB =3D "--disable-multilib"
>
> -DEPENDS =3D "virtual/${TARGET_PREFIX}binutils-crosssdk virtual/${TARGET_=
PREFIX}libc-for-gcc-nativesdk gettext-native"
> +DEPENDS =3D "virtual/${TARGET_PREFIX}binutils-crosssdk virtual/nativesdk=
-${TARGET_PREFIX}libc-for-gcc gettext-native"
>  PROVIDES =3D "virtual/${TARGET_PREFIX}gcc-crosssdk virtual/${TARGET_PREF=
IX}g++-crosssdk"
> diff --git a/meta/recipes-devtools/gcc/libgcc_4.7.bb b/meta/recipes-devto=
ols/gcc/libgcc_4.7.bb
> index c796253..5eaa515 100644
> --- a/meta/recipes-devtools/gcc/libgcc_4.7.bb
> +++ b/meta/recipes-devtools/gcc/libgcc_4.7.bb
> @@ -4,14 +4,11 @@ INHIBIT_DEFAULT_DEPS =3D "1"
>
>  DEPENDS =3D "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
>
> -PKGSUFFIX =3D ""
> -PKGSUFFIX_virtclass-nativesdk =3D "-nativesdk"
> -
>  PACKAGES =3D "\
>    ${PN} \
>    ${PN}-dev \
>    ${PN}-dbg \
> -  libgcov${PKGSUFFIX}-dev \
> +  libgcov-dev \
>    "
>
>  FILES_${PN} =3D "${base_libdir}/libgcc*.so.*"
> @@ -19,7 +16,7 @@ FILES_${PN}-dev =3D " \
>    ${base_libdir}/libgcc*.so \
>    ${libdir}/${TARGET_SYS}/${BINV}/*crt* \
>    ${libdir}/${TARGET_SYS}/${BINV}/libgcc*"
> -FILES_libgcov${PKGSUFFIX}-dev =3D " \
> +FILES_libgcov-dev =3D " \
>    ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a \
>    "
>  FILES_${PN}-dbg +=3D "${base_libdir}/.debug/"
> @@ -72,4 +69,4 @@ do_package_write_rpm[depends] +=3D "virtual/${MLPREFIX}=
libc:do_package"
>  BBCLASSEXTEND =3D "nativesdk"
>
>  INSANE_SKIP_${PN}-dev =3D "staticdev"
> -INSANE_SKIP_${MLPREFIX}libgcov${PKGSUFFIX}-dev =3D "staticdev"
> +INSANE_SKIP_${MLPREFIX}libgcov-dev =3D "staticdev"
> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/reci=
pes-devtools/gdb/gdb-cross-canadian.inc
> index 2b60698..c947526 100644
> --- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> +++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> @@ -5,9 +5,9 @@ DESCRIPTION =3D "cross-canadian gdb for ${TARGET_ARCH} ta=
rget - GNU debugger"
>  PN =3D "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
>  BPN =3D "gdb"
>
> -DEPENDS =3D "ncurses-nativesdk expat-nativesdk gettext-nativesdk readlin=
e-nativesdk python-nativesdk"
> -RDEPENDS +=3D "python-nativesdk-core python-nativesdk-lang python-native=
sdk-re \
> -             python-nativesdk-codecs python-nativesdk-netclient"
> +DEPENDS =3D "nativesdk-ncurses nativesdk-expat nativesdk-gettext natives=
dk-readline nativesdk-python"
> +RDEPENDS +=3D "nativesdk-python-core nativesdk-python-lang nativesdk-pyt=
hon-re \
> +             nativesdk-python-codecs nativesdk-python-netclient"
>
>  EXTRA_OECONF_append =3D "--with-python=3D${WORKDIR}/python"
>
> @@ -30,3 +30,4 @@ EOF
>  do_install_append() {
>         rm -rf ${D}${exec_prefix}/lib
>  }
> +
> diff --git a/meta/recipes-devtools/gnu-config/gnu-config_20111111.bb b/me=
ta/recipes-devtools/gnu-config/gnu-config_20111111.bb
> index d4588da..f731360 100644
> --- a/meta/recipes-devtools/gnu-config/gnu-config_20111111.bb
> +++ b/meta/recipes-devtools/gnu-config/gnu-config_20111111.bb
> @@ -28,7 +28,7 @@ do_install () {
>                 sed -e 's,@gnu-configdir@,${datadir}/gnu-config,g' \
>                     -e 's,@autom4te_perllibdir@,${datadir}/autoconf,g' > =
${D}${bindir}/gnu-configize
>         # In the native case we want the system perl as perl-native can't=
 have built yet
> -       if [ "${PN}" !=3D "gnu-config-native" -a "${PN}" !=3D "gnu-config=
-nativesdk" ]; then
> +       if [ "${PN}" !=3D "gnu-config-native" -a "${PN}" !=3D "nativesdk-=
gnu-config" ]; then
>                 sed -i -e 's,/usr/bin/env,${bindir}/env,g' ${D}${bindir}/=
gnu-configize
>         fi
>         chmod 755 ${D}${bindir}/gnu-configize
> diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/re=
cipes-devtools/gnu-config/gnu-config_git.bb
> index 4de4799..73efbb0 100644
> --- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
> +++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
> @@ -29,7 +29,7 @@ do_install () {
>                 sed -e 's,@gnu-configdir@,${datadir}/gnu-config,g' \
>                     -e 's,@autom4te_perllibdir@,${datadir}/autoconf,g' > =
${D}${bindir}/gnu-configize
>         # In the native case we want the system perl as perl-native can't=
 have built yet
> -       if [ "${PN}" !=3D "gnu-config-native" -a "${PN}" !=3D "gnu-config=
-nativesdk" ]; then
> +       if [ "${PN}" !=3D "gnu-config-native" -a "${PN}" !=3D "nativesdk-=
gnu-config" ]; then
>                 sed -i -e 's,/usr/bin/env,${bindir}/env,g' ${D}${bindir}/=
gnu-configize
>         fi
>         chmod 755 ${D}${bindir}/gnu-configize
> diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_in=
staller_internal b/meta/recipes-devtools/installer/adt-installer/scripts/ad=
t_installer_internal
> index a540c0d..78ea6d0 100755
> --- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer=
_internal
> +++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer=
_internal
> @@ -117,7 +117,7 @@ OPKG_INSTALL_NATIVE_CMD=3D"$OPKG_INSTALL_CMD  -f $OPK=
G_CONFIG_FILE -o $NATIVE_INST
>  BASE_HOSTSDK_PKGNAMES=3D"pseudo opkg pkgconfig libtool autoconf automake=
"
>  for pkg in $BASE_HOSTSDK_PKGNAMES; do
>    echo_info "Installing ${pkg} nativesdk ...\n"
> -  $OPKG_INSTALL_NATIVE_CMD ${pkg}-nativesdk &>> $YOCTOADT_INSTALL_LOG_FI=
LE
> +  $OPKG_INSTALL_NATIVE_CMD nativesdk-${pkg} &>> $YOCTOADT_INSTALL_LOG_FI=
LE
>    check_result
>  done
>
> @@ -142,15 +142,15 @@ done
>
>  if [ "$YOCTOADT_QEMU" =3D=3D "Y" ] || [ "$YOCTOADT_QEMU" =3D "y" ]; then
>    echo_info "\nInstalling qemu native ..."
> -  $OPKG_INSTALL_NATIVE_CMD qemu-nativesdk &>> $YOCTOADT_INSTALL_LOG_FILE
> +  $OPKG_INSTALL_NATIVE_CMD nativesdk-qemu &>> $YOCTOADT_INSTALL_LOG_FILE
>    check_result
> -  $OPKG_INSTALL_NATIVE_CMD qemu-helper-nativesdk &>> $YOCTOADT_INSTALL_L=
OG_FILE
> +  $OPKG_INSTALL_NATIVE_CMD nativesdk-qemu-helper &>> $YOCTOADT_INSTALL_L=
OG_FILE
>    check_result
>  fi
>
>  if [ "$YOCTOADT_NFS_UTIL" =3D=3D "Y" ] || [ "$YOCTOADT_NFS_UTIL" =3D=3D =
"y" ]; then
>    echo_info "\nInstalling unfs ..."
> -  $OPKG_INSTALL_NATIVE_CMD unfs-server-nativesdk &>> $YOCTOADT_INSTALL_L=
OG_FILE
> +  $OPKG_INSTALL_NATIVE_CMD nativesdk-unfs-server &>> $YOCTOADT_INSTALL_L=
OG_FILE
>    check_result
>  fi
>
> diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/=
opkg/opkg.inc
> index 5c7cad3..10cd9d8 100644
> --- a/meta/recipes-devtools/opkg/opkg.inc
> +++ b/meta/recipes-devtools/opkg/opkg.inc
> @@ -8,7 +8,7 @@ LICENSE =3D "GPLv2+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f \
>                      file://src/opkg-cl.c;beginline=3D1;endline=3D20;md5=
=3D321f658c3f6b6c832e25c8850b5dffba"
>  DEPENDS_virtclass-native =3D "curl-native"
> -DEPENDS_virtclass-nativesdk =3D "curl-nativesdk"
> +DEPENDS_virtclass-nativesdk =3D "nativesdk-curl"
>
>  PE =3D "1"
>  INC_PR =3D "r10"
> @@ -41,12 +41,12 @@ RDEPENDS_${PN}_virtclass-nativesdk =3D ""
>  PACKAGE_ARCH_update-alternatives-cworth =3D "all"
>  RREPLACES_${PN} =3D "opkg-nogpg"
>
> -PACKAGES =3D+ "libopkg${PKGSUFFIX}-dev libopkg${PKGSUFFIX}-staticdev lib=
opkg${PKGSUFFIX} update-alternatives-cworth${PKGSUFFIX}"
> +PACKAGES =3D+ "libopkg-dev libopkg-staticdev libopkg update-alternatives=
-cworth"
>
> -FILES_update-alternatives-cworth${PKGSUFFIX} =3D "${bindir}/update-alter=
natives"
> -FILES_libopkg${PKGSUFFIX}-dev =3D "${libdir}/*.la ${libdir}/*.so"
> -FILES_libopkg${PKGSUFFIX}-staticdev =3D "${libdir}/*.a"
> -FILES_libopkg${PKGSUFFIX} =3D "${libdir}/*.so.* ${localstatedir}/lib/opk=
g/"
> +FILES_update-alternatives-cworth =3D "${bindir}/update-alternatives"
> +FILES_libopkg-dev =3D "${libdir}/*.la ${libdir}/*.so"
> +FILES_libopkg-staticdev =3D "${libdir}/*.a"
> +FILES_libopkg =3D "${libdir}/*.so.* ${localstatedir}/lib/opkg/"
>
>  # We need to create the lock directory
>  do_install_append() {
> @@ -75,9 +75,6 @@ ALTERNATIVE_TARGET[opkg] =3D "${bindir}/opkg-cl"
>
>  BBCLASSEXTEND =3D "native nativesdk"
>
> -PKGSUFFIX =3D ""
> -PKGSUFFIX_virtclass-nativesdk =3D "-nativesdk"
> -
>  # Define a variable to allow distros to run configure earlier.
>  # (for example, to enable loading of ethernet kernel modules before netw=
orking starts)
>  POSTINSTALL_INITPOSITION ?=3D "98"
> diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-dev=
tools/perl/perl_5.14.2.bb
> index 561b30e..9db3805 100644
> --- a/meta/recipes-devtools/perl/perl_5.14.2.bb
> +++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
> @@ -302,6 +302,7 @@ python populate_packages_prepend () {
>  }
>
>  PACKAGES_DYNAMIC =3D "perl-module-*"
> +PACKAGES_DYNAMIC_virtclass-nativesdk =3D "nativesdk-perl-module-*"
>
>  RPROVIDES_perl-lib =3D "perl-lib"
>
> @@ -311,3 +312,4 @@ require perl-rprovides_${PV}.inc
>
>  SSTATE_SCAN_FILES +=3D "*.pm *.pod *.h *.pl *.sh"
>
> +BBCLASSEXTEND =3D "nativesdk"
> diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-=
devtools/python/python_2.7.3.bb
> index 9c648fe..3eb36fc 100644
> --- a/meta/recipes-devtools/python/python_2.7.3.bb
> +++ b/meta/recipes-devtools/python/python_2.7.3.bb
> @@ -148,11 +148,11 @@ require python-${PYTHON_MAJMIN}-manifest.inc
>  RPROVIDES_${PN}-core =3D "${PN}"
>  RRECOMMENDS_${PN}-core =3D "${PN}-readline"
>  RRECOMMENDS_${PN}-crypt =3D "openssl"
> -RRECOMMENDS_${PN}-crypt_virtclass-nativesdk =3D "openssl-nativesdk"
> +RRECOMMENDS_${PN}-crypt_virtclass-nativesdk =3D "nativesdk-openssl"
>
>  # package libpython2
> -PACKAGES =3D+ "lib${BPN}2${PKGSUFFIX}"
> -FILES_lib${BPN}2${PKGSUFFIX} =3D "${libdir}/libpython*.so.*"
> +PACKAGES =3D+ "lib${BPN}2"
> +FILES_lib${BPN}2 =3D "${libdir}/libpython*.so.*"
>
>  # catch debug extensions (isn't that already in python-core-dbg?)
>  FILES_${PN}-dbg +=3D "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/.debu=
g"
> @@ -166,6 +166,3 @@ PACKAGES +=3D "${PN}-man"
>  FILES_${PN}-man =3D "${datadir}/man"
>
>  BBCLASSEXTEND =3D "nativesdk"
> -
> -PKGSUFFIX =3D ""
> -PKGSUFFIX_virtclass-nativesdk =3D "-nativesdk"
> diff --git a/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb b/me=
ta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
> index df0cae0..fbf9e77 100644
> --- a/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb
> +++ b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
> @@ -1,7 +1,7 @@
>  SUMMARY =3D "Qemu helper scripts"
>  DESCRIPTION =3D "Qemu helper scripts"
>  LICENSE =3D "GPLv2"
> -RDEPENDS_${PN} =3D "qemu-nativesdk"
> +RDEPENDS_${PN} =3D "nativesdk-qemu"
>  PR =3D "r9"
>
>  FILESPATH =3D "${FILE_DIRNAME}/qemu-helper"
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index 9cb4aee..bdb566d 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -22,7 +22,7 @@ inherit autotools
>  do_configure() {
>      # Handle distros such as CentOS 5 32-bit that do not have kvm suppor=
t
>      KVMOPTS=3D"--disable-kvm"
> -    if [ "${PN}" !=3D "qemu-native" -a "${PN}" !=3D "qemu-nativesdk" ] \
> +    if [ "${PN}" !=3D "qemu-native" -a "${PN}" !=3D "nativesdk-qemu" ] \
>         || [ -f /usr/include/linux/kvm.h ] ; then
>         KVMOPTS=3D"--enable-kvm"
>      fi
> @@ -41,8 +41,8 @@ do_install () {
>  PACKAGECONFIG ??=3D ""
>
>  DEPENDS_virtclass-native =3D "zlib-native alsa-lib-native glib-2.0-nativ=
e"
> -DEPENDS_virtclass-nativesdk =3D "zlib-nativesdk libsdl-nativesdk glib-2.=
0-nativesdk"
> -RDEPENDS_virtclass-nativesdk =3D "libsdl-nativesdk"
> +DEPENDS_virtclass-nativesdk =3D "nativesdk-zlib nativesdk-libsdl natives=
dk-glib-2.0"
> +RDEPENDS_virtclass-nativesdk =3D "nativesdk-libsdl"
>  EXTRA_OECONF_virtclass-nativesdk =3D "--target-list=3D${@get_qemu_target=
_list(d)} --disable-werror --disable-vnc-tls \
>                                 --disable-curl \
>                                 "
> diff --git a/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.=
bb b/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb
> index d03c153..7480638 100644
> --- a/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb
> +++ b/meta/recipes-devtools/unfs-server/unfs-server_2.1+2.2beta47.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c23=
36e835926c2166c28b"
>
>  RDEPENDS_${PN} =3D "pseudo"
>  RDEPENDS_${PN}_virtclass-native =3D "pseudo-native"
> -RDEPENDS_${PN}_virtclass-nativesdk =3D "pseudo-nativesdk"
> +RDEPENDS_${PN}_virtclass-nativesdk =3D "nativesdk-pseudo"
>  BASEPV =3D "2.2beta47"
>  PR =3D "r1"
>
> @@ -73,6 +73,6 @@ python __anonymous () {
>      import re
>
>      pn =3D d.getVar("PN", True)
> -    if not pn.endswith('-native') and not pn.endswith('-nativesdk'):
> +    if not pn.endswith('-native') and not pn.startswith('nativesdk-'):
>          raise bb.parse.SkipPackage("unfs-server is intended for native/n=
ativesdk builds only")
>  }
> diff --git a/meta/recipes-extended/bash/bash_4.2.bb b/meta/recipes-extend=
ed/bash/bash_4.2.bb
> index 50f2ff6..384eb62 100644
> --- a/meta/recipes-extended/bash/bash_4.2.bb
> +++ b/meta/recipes-extended/bash/bash_4.2.bb
> @@ -39,3 +39,4 @@ SRC_URI[patch009.sha256sum] =3D "e7ed5440b4c19765786e90=
e4f1ded43195d38b3e4d1c4b39f
>  SRC_URI[patch010.md5sum] =3D "0a51602b535ef661ee707be6c8bdb373"
>  SRC_URI[patch010.sha256sum] =3D "acfc5482c25e6923116fcf4b4f7f6345b80f75a=
d7299749db4b736ad67aa43dc"
>
> +BBCLASSEXTEND =3D "nativesdk"
> diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb b/meta/recipes-ex=
tended/bzip2/bzip2_1.0.6.bb
> index e0c710b..5f92deb 100644
> --- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
> +++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
> @@ -43,4 +43,5 @@ SECTION_libbz2-staticdev =3D "devel"
>  RDEPENDS_libbz2-staticdev =3D "libbz2-dev (=3D ${EXTENDPKGV})"
>
>  PROVIDES_append_virtclass-native =3D " bzip2-replacement-native"
> -BBCLASSEXTEND =3D "native"
> +BBCLASSEXTEND =3D "native nativesdk"
> +
> diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb b/meta/recipes=
-graphics/libsdl/libsdl_1.2.15.bb
> index 8b39442..b05840a 100644
> --- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> @@ -16,7 +16,7 @@ DEPENDS =3D "${@base_contains('DISTRO_FEATURES', 'direc=
tfb', 'directfb', '', d)} \
>             ${@base_contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl'=
, '', d)} \
>             ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11 li=
bxext libxrandr libxrender', '', d)} \
>             tslib"
> -DEPENDS_virtclass-nativesdk =3D "${@base_contains('DISTRO_FEATURES', 'x1=
1', 'libx11-nativesdk libxrandr-nativesdk libxrender-nativesdk libxext-nati=
vesdk', '', d)}"
> +DEPENDS_virtclass-nativesdk =3D "${@base_contains('DISTRO_FEATURES', 'x1=
1', 'nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-li=
bxext', '', d)}"
>
>  PR =3D "r0"
>
> diff --git a/meta/recipes-graphics/mesa/qemugl_git.bb b/meta/recipes-grap=
hics/mesa/qemugl_git.bb
> index 32980d3..9cf0436 100644
> --- a/meta/recipes-graphics/mesa/qemugl_git.bb
> +++ b/meta/recipes-graphics/mesa/qemugl_git.bb
> @@ -25,7 +25,7 @@ DEFAULT_PREFERENCE =3D "-1"
>
>  do_install () {
>         install -d ${D}${libdir}/
> -    if [ "${PN}" !=3D "qemugl-nativesdk" ]; then
> +    if [ "${PN}" !=3D "nativesdk-qemugl" ]; then
>          install -m 0755 ${S}/libGL.so.1.2 ${D}${libdir}/libGL-qemu.so.1.=
2
>      else
>             install -m 0755 ${S}/libGL.so.1.2 ${D}${libdir}/libGL.so.1.2
> diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipe=
s-kernel/systemtap/systemtap_git.bb
> index 059aca7..3f94e98 100644
> --- a/meta/recipes-kernel/systemtap/systemtap_git.bb
> +++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
> @@ -4,7 +4,7 @@ require systemtap_git.inc
>
>  DEPENDS =3D "elfutils sqlite3 systemtap-native"
>  DEPENDS_virtclass-native =3D "elfutils-native sqlite3-native gettext-nat=
ive"
> -DEPENDS_virtclass-nativesdk =3D "elfutils-nativesdk sqlite3-nativesdk ge=
ttext-nativesdk"
> +DEPENDS_virtclass-nativesdk =3D "nativesdk-elfutils nativesdk-sqlite3 na=
tivesdk-gettext"
>
>  PR =3D "r0"
>
> diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb b/meta/recip=
es-multimedia/alsa/alsa-lib_1.0.25.bb
> index 08da5cd..7914bb9 100644
> --- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-lib_1.0.25.bb
> @@ -31,22 +31,19 @@ EXTRA_OECONF =3D "--with-cards=3Dpdaudiocf --with-oss=
=3Dyes --disable-python"
>
>  EXTRA_OECONF_append_libc-uclibc =3D " --with-versioned=3Dno "
>
> -PKGSUFFIX =3D ""
> -PKGSUFFIX_virtclass-nativesdk =3D "-nativesdk"
> -
> -PACKAGES =3D+ "alsa-server${PKGSUFFIX} libasound${PKGSUFFIX} alsa-conf-b=
ase${PKGSUFFIX} alsa-conf${PKGSUFFIX} alsa-doc${PKGSUFFIX} alsa-dev${PKGSUF=
FIX}"
> +PACKAGES =3D+ "alsa-server libasound alsa-conf-base alsa-conf alsa-doc a=
lsa-dev"
>  FILES_${PN} +=3D "${libdir}/${BPN}/smixer/*.so"
>  FILES_${PN}-dbg +=3D "${libdir}/${BPN}/smixer/.debug"
>  FILES_${PN}-dev +=3D "${libdir}/${BPN}/smixer/*.la"
> -FILES_libasound${PKGSUFFIX} =3D "${libdir}/libasound.so.*"
> -FILES_alsa-server${PKGSUFFIX} =3D "${bindir}/*"
> -FILES_alsa-conf${PKGSUFFIX} =3D "${datadir}/alsa/"
> -FILES_alsa-dev${PKGSUFFIX} +=3D "${libdir}/pkgconfig/ /usr/include/ ${da=
tadir}/aclocal/*"
> -FILES_alsa-conf-base${PKGSUFFIX} =3D "\
> +FILES_libasound =3D "${libdir}/libasound.so.*"
> +FILES_alsa-server =3D "${bindir}/*"
> +FILES_alsa-conf =3D "${datadir}/alsa/"
> +FILES_alsa-dev +=3D "${libdir}/pkgconfig/ /usr/include/ ${datadir}/acloc=
al/*"
> +FILES_alsa-conf-base =3D "\
>  ${datadir}/alsa/alsa.conf \
>  ${datadir}/alsa/cards/aliases.conf \
>  ${datadir}/alsa/pcm/default.conf \
>  ${datadir}/alsa/pcm/dmix.conf \
>  ${datadir}/alsa/pcm/dsnoop.conf"
>
> -RDEPENDS_libasound${PKGSUFFIX} =3D "alsa-conf-base${PKGSUFFIX}"
> +RDEPENDS_libasound =3D "alsa-conf-base"
> diff --git a/meta/recipes-qt/meta/meta-toolchain-qte.bb b/meta/recipes-qt=
/meta/meta-toolchain-qte.bb
> index 735ccd1..116db91 100644
> --- a/meta/recipes-qt/meta/meta-toolchain-qte.bb
> +++ b/meta/recipes-qt/meta/meta-toolchain-qte.bb
> @@ -1,6 +1,6 @@
>  # Qt Embedded toolchain
>  PR =3D "r5"
> -TOOLCHAIN_HOST_TASK =3D "task-qte-toolchain-host-nativesdk task-cross-ca=
nadian-${TRANSLATED_TARGET_ARCH}"
> +TOOLCHAIN_HOST_TASK =3D "nativesdk-task-qte-toolchain-host task-cross-ca=
nadian-${TRANSLATED_TARGET_ARCH}"
>  TOOLCHAIN_TARGET_TASK =3D "task-qte-toolchain-target"
>  TOOLCHAIN_OUTPUTNAME =3D "${SDK_NAME}-toolchain-qte-${DISTRO_VERSION}"
>
> diff --git a/meta/recipes-qt/qt4/files/qt-dbus-const.patch b/meta/recipes=
-qt/qt4/files/qt-dbus-const.patch
> index f3de77e..6ee402f 100644
> --- a/meta/recipes-qt/qt4/files/qt-dbus-const.patch
> +++ b/meta/recipes-qt/qt4/files/qt-dbus-const.patch
> @@ -1,4 +1,4 @@
> -Remove "const" usage that causes compile failure building qt4-tools-nati=
vesdk
> +Remove "const" usage that causes compile failure building nativesdk-qt4-=
tools
>
>  Upstream-Status: Denied [possible retry]
>
> diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.1.bb b/meta/reci=
pes-qt/qt4/nativesdk-qt4-tools_4.8.1.bb
> index e17a8ad..e17a8ad 100644
> --- a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.1.bb
> +++ b/meta/recipes-qt/qt4/nativesdk-qt4-tools_4.8.1.bb
> diff --git a/meta/recipes-qt/tasks/nativesdk-task-qte-toolchain-host.bb b=
/meta/recipes-qt/tasks/nativesdk-task-qte-toolchain-host.bb
> new file mode 100644
> index 0000000..5098d11
> --- a/dev/null
> +++ b/meta/recipes-qt/tasks/nativesdk-task-qte-toolchain-host.bb
> @@ -0,0 +1,7 @@
> +require recipes-core/tasks/nativesdk-task-sdk-host.bb
> +
> +DESCRIPTION =3D "Host packages for Qt Embedded SDK"
> +LICENSE =3D "MIT"
> +ALLOW_EMPTY =3D "1"
> +
> +RDEPENDS_${PN} +=3D "nativesdk-qt4-tools"
> diff --git a/meta/recipes-qt/tasks/task-qte-toolchain-host-nativesdk.bb b=
/meta/recipes-qt/tasks/task-qte-toolchain-host-nativesdk.bb
> deleted file mode 100644
> index cfa45ef..0000000
> --- a/meta/recipes-qt/tasks/task-qte-toolchain-host-nativesdk.bb
> +++ b/dev/null
> @@ -1,7 +0,0 @@
> -require recipes-core/tasks/task-sdk-host-nativesdk.bb
> -
> -DESCRIPTION =3D "Host packages for Qt Embedded SDK"
> -LICENSE =3D "MIT"
> -ALLOW_EMPTY =3D "1"
> -
> -RDEPENDS_${PN} +=3D "qt4-tools-nativesdk"
> diff --git a/meta/recipes-support/curl/curl_7.26.0.bb b/meta/recipes-supp=
ort/curl/curl_7.26.0.bb
> index 418e29c..dad5572 100644
> --- a/meta/recipes-support/curl/curl_7.26.0.bb
> +++ b/meta/recipes-support/curl/curl_7.26.0.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;beginline=3D7;md5=3D=
3a34942f4ae3fbf1a303160714e66
>
>  DEPENDS =3D "zlib gnutls"
>  DEPENDS_virtclass-native =3D "zlib-native openssl-native"
> -DEPENDS_virtclass-nativesdk =3D "zlib-nativesdk"
> +DEPENDS_virtclass-nativesdk =3D "nativesdk-zlib"
>  PR =3D "r1"
>
>  SRC_URI =3D "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
> diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-suppo=
rt/sqlite/sqlite3.inc
> index 79542fe..0cc5d65 100644
> --- a/meta/recipes-support/sqlite/sqlite3.inc
> +++ b/meta/recipes-support/sqlite/sqlite3.inc
> @@ -17,17 +17,14 @@ export config_TARGET_LINK =3D "${CCLD}"
>  export config_TARGET_CFLAGS =3D "${CFLAGS}"
>  export config_TARGET_LFLAGS =3D "${LDFLAGS}"
>
> -PKGSUFFIX =3D ""
> -PKGSUFFIX_virtclass-nativesdk =3D "-nativesdk"
> -
> -PACKAGES =3D "lib${BPN}${PKGSUFFIX} lib${BPN}${PKGSUFFIX}-dev lib${BPN}$=
{PKGSUFFIX}-doc ${PN}-dbg lib${BPN}${PKGSUFFIX}-staticdev ${PN}"
> +PACKAGES =3D "lib${BPN} lib${BPN}-dev lib${BPN}-doc ${PN}-dbg lib${BPN}-=
staticdev ${PN}"
>
>  FILES_${PN} =3D "${bindir}/*"
> -FILES_lib${BPN}${PKGSUFFIX} =3D "${libdir}/*.so.*"
> -FILES_lib${BPN}${PKGSUFFIX}-dev =3D "${libdir}/*.la ${libdir}/*.so \
> +FILES_lib${BPN} =3D "${libdir}/*.so.*"
> +FILES_lib${BPN}-dev =3D "${libdir}/*.la ${libdir}/*.so \
>                                    ${libdir}/pkgconfig ${includedir}"
> -FILES_lib${BPN}${PKGSUFFIX}-doc =3D "${docdir} ${mandir} ${infodir}"
> -FILES_lib${BPN}${PKGSUFFIX}-staticdev =3D "${libdir}/lib*.a"
> -AUTO_LIBNAME_PKGS =3D "lib${BPN}${PKGSUFFIX}"
> +FILES_lib${BPN}-doc =3D "${docdir} ${mandir} ${infodir}"
> +FILES_lib${BPN}-staticdev =3D "${libdir}/lib*.a"
> +AUTO_LIBNAME_PKGS =3D "lib${BPN}"
>
>  BBCLASSEXTEND =3D "native nativesdk"
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


