Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <85865748-569f-f859-c40f-80633e57f422@oleksandr-kravchuk.com>
Date: Thu, 28 Oct 2021 23:53:10 +0200
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH 2/2] WIP: xserver-xorg: update to 21.1.0
References: <20211028184356.3890493-1-open.source@oleksandr-kravchuk.com>
 <20211028184356.3890493-2-open.source@oleksandr-kravchuk.com>
 <0ddf8258-03bc-3179-2dfc-b0a85fad226f@gmail.com>
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
In-Reply-To: <0ddf8258-03bc-3179-2dfc-b0a85fad226f@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: akuster808 <akuster808@gmail.com>, openembedded-core@lists.openembedded.org

On 28/10/2021 23:45, akuster808 wrote:
> Oleksandr,
>
>
> On 10/28/21 11:43 AM, Oleksandr Kravchuk wrote:
>> This dirty work-in-progress patch is an open call for anyone interested
>> to help with its testing.
> What may get more folks participating in testing this is if you push
> your changes to git.openembedded.org/openembedded-core-contrib. This can
> lend itself to making your life easier in rebasing to latest master.
> while you tweak you official patch.  If you don't have permission to
> push to that repo, we can get you connected with the appropriate people
> to make that happen. <git://git.openembedded.org/openembedded-core-contrib>
>
> - armin

Thanks for the tip. Just tell me what I should do on my side.

> <git://git.openembedded.org/openembedded-core-contrib>
>> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
>> ---
>>   .../xorg-xserver/xserver-xorg.inc             | 62 ++++++++-----------
>>   ...-duplicate-definitions-of-IOPortBase.patch | 45 --------------
>>   ...probing-a-non-PCI-platform-device-on.patch | 34 ----------
>>   ...t-xtest-Initialize-array-with-braces.patch | 36 -----------
>>   .../xorg-xserver/xserver-xorg/pkgconfig.patch | 34 ----------
>>   .../xserver-xorg/sdksyms-no-build-path.patch  | 50 ---------------
>>   ...xorg_1.20.13.bb => xserver-xorg_21.1.0.bb} | 11 +---
>>   7 files changed, 29 insertions(+), 243 deletions(-)
>>   delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
>>   delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch
>>   delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-test-xtest-Initialize-array-with-braces.patch
>>   delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/pkgconfig.patch
>>   delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-build-path.patch
>>   rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.20.13.bb => xserver-xorg_21.1.0.bb} (60%)
>>
>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
>> index e1fc0a06dc..3732601a4a 100644
>> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
>> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
>> @@ -12,24 +12,23 @@ PROVIDES = "virtual/xserver-xf86"
>>   # Other packages tend to just care that there is *an* X server:
>>   PROVIDES += "virtual/xserver"
>>   
>> -PE = "2"
>> -
>>   XORG_PN = "xorg-server"
>> -SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.xz"
>> +#SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.xz"
>> +SRC_URI = "https://gitlab.freedesktop.org/xorg/xserver/-/archive/master/xserver-master.tar.gz"
>>   
>>   UPSTREAM_CHECK_REGEX = "xorg-server-(?P<pver>\d+(\.(?!99)\d+)+)\.tar"
>>   
>>   CVE_PRODUCT = "xorg-server"
>>   
>> -S = "${WORKDIR}/${XORG_PN}-${PV}"
>> +#S = "${WORKDIR}/${XORG_PN}-${PV}"
>> +S = "${WORKDIR}/xserver-master"
>>   
>> -inherit autotools pkgconfig
>> +inherit meson features_check pkgconfig
>>   
>> -inherit features_check
>>   REQUIRED_DISTRO_FEATURES = "x11"
>>   
>>   LIB_DEPS = "pixman libxfont2 xtrans libxau libxext libxdmcp libdrm libxkbfile libpciaccess"
>> -DEPENDS = "xorgproto ${LIB_DEPS} font-util"
>> +DEPENDS = "xorgproto ${LIB_DEPS} font-util libxcvt libepoxy"
>>   
>>   # Split out some modules and extensions from the main package
>>   # These aren't needed for basic operations and only take up space:
>> @@ -52,7 +51,7 @@ PACKAGES =+ "${PN}-sdl \
>>                ${PN}-xephyr \
>>                ${PN}-xwayland \
>>                ${PN}-multimedia-modules \
>> -             ${PN}-extension-dri \
>> +             ${PN}-extension-dri1 \
>>                ${PN}-extension-dri2 \
>>                ${PN}-extension-glx \
>>                ${PN}-extension-record \
>> @@ -67,6 +66,7 @@ PACKAGES =+ "${PN}-sdl \
>>                ${PN}-module-xaa \
>>                ${PN}-module-libxf1bpp \
>>                ${PN}-module-libxf4bpp \
>> +             ${PN}-module-inputtest \
>>                xf86-video-modesetting"
>>   
>>   SUMMARY:xf86-video-modesetting = "X.Org X server -- modesetting display driver"
>> @@ -88,7 +88,7 @@ FILES:${PN}-utils = "${bindir}/scanpci ${bindir}/pcitweak ${bindir}/ioport ${bin
>>   FILES:${PN}-xephyr = "${bindir}/Xephyr"
>>   FILES:${PN}-xwayland = "${bindir}/Xwayland"
>>   FILES:${PN}-multimedia-modules = "${libdir}/xorg/modules/multimedia/*drv*"
>> -FILES:${PN}-extension-dri = "${libdir}/xorg/modules/extensions/libdri.so"
>> +FILES:${PN}-extension-dri1 = "${libdir}/xorg/modules/extensions/libdri.so"
>>   FILES:${PN}-extension-dri2 = "${libdir}/xorg/modules/extensions/libdri2.so"
>>   FILES:${PN}-extension-glx = "${libdir}/xorg/modules/extensions/libglx.so"
>>   FILES:${PN}-extension-record = "${libdir}/xorg/modules/extensions/librecord.so"
>> @@ -103,6 +103,7 @@ FILES:${PN}-module-exa = "${libdir}/xorg/modules/libexa.so"
>>   FILES:${PN}-module-xaa = "${libdir}/xorg/modules/libxaa.so"
>>   FILES:${PN}-module-libxf1bpp = "${libdir}/xorg/modules/libxf1bpp.so"
>>   FILES:${PN}-module-libxf4bpp = "${libdir}/xorg/modules/libxf4bpp.so"
>> +FILES:${PN}-module-inputtest = "${libdir}/xorg/modules/input/inputtest_drv.so"
>>   FILES:xf86-video-modesetting = "${libdir}/xorg/modules/drivers/modesetting_drv.so"
>>   
>>   EXTRA_OECONF += "--with-fop=no \
>> @@ -121,41 +122,30 @@ EXTRA_OECONF += "--with-fop=no \
>>                    --with-os-name=Linux \
>>   "
>>   
>> -OPENGL_PKGCONFIGS = "dri glx glamor dri3 xshmfence"
>> -PACKAGECONFIG ??= "dga dri2 udev ${XORG_CRYPTO} \
>> +OPENGL_PKGCONFIGS = "dri1 glx glamor dri3"
>> +PACKAGECONFIG ??= "dga dri2 udev ${SHA1} \
>>                      ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', '${OPENGL_PKGCONFIGS}', '', d)} \
>>                      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-logind', '', d)} \
>>   "
>>   
>> -PACKAGECONFIG[udev] = "--enable-config-udev,--disable-config-udev,udev"
>> -PACKAGECONFIG[dga] = "--enable-dga,--disable-dga"
>> -PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,virtual/mesa"
>> -PACKAGECONFIG[dri2] = "--enable-dri2,--disable-dri2"
>> +PACKAGECONFIG[udev] = "-Dudev=true,-Dudev=false, udev"
>> +PACKAGECONFIG[dga] = "-Ddga=true,-Ddga=false"
>> +PACKAGECONFIG[dri1] = "-Ddri1=true,-Ddri1=false, virtual/mesa"
>> +PACKAGECONFIG[dri2] = "-Ddri2=true,-Ddri2=false"
>>   # DRI3 requires xshmfence to also be enabled
>> -PACKAGECONFIG[dri3] = "--enable-dri3,--disable-dri3"
>> -PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,virtual/libgl virtual/libx11"
>> -PACKAGECONFIG[glamor] = "--enable-glamor,--disable-glamor,libepoxy virtual/libgbm,libegl"
>> -PACKAGECONFIG[unwind] = "--enable-libunwind,--disable-libunwind,libunwind"
>> -PACKAGECONFIG[xshmfence] = "--enable-xshmfence,--disable-xshmfence,libxshmfence"
>> -PACKAGECONFIG[xmlto] = "--with-xmlto, --without-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
>> -PACKAGECONFIG[systemd-logind] = "--enable-systemd-logind=yes,--enable-systemd-logind=no,dbus,"
>> -PACKAGECONFIG[systemd] = "--with-systemd-daemon,--without-systemd-daemon,systemd"
>> -PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama"
>> -PACKAGECONFIG[xwayland] = "--enable-xwayland,--disable-xwayland,wayland wayland-native wayland-protocols libepoxy"
>> +PACKAGECONFIG[dri3] = "-Ddri3=true,-Ddri3=false"
>> +PACKAGECONFIG[glx] = "-Dglx=true,-Dglx=false"
>> +PACKAGECONFIG[glamor] = "-Dglamor=true,-Dglamor=false"
>> +PACKAGECONFIG[libunwind] = "-Dlibunwind=true,-Dlibunwind=false,libunwind"
>> +PACKAGECONFIG[systemd-logind] = "-Dsystemdd_logind=true,-Dsystemd_logind=false, dbus,"
>> +PACKAGECONFIG[xinerama] = "-Dxinerama=true,-Dxinerama=false"
>> +PACKAGECONFIG[xwayland] = "-Dxwayland=true,-Dxwayland=false,wayland wayland-native wayland-protocols libepoxy"
>>   
>>   # Xorg requires a SHA1 implementation, pick one
>> -XORG_CRYPTO ??= "openssl"
>> -PACKAGECONFIG[openssl] = "--with-sha1=libcrypto,,openssl"
>> -PACKAGECONFIG[nettle] = "--with-sha1=libnettle,,nettle"
>> -PACKAGECONFIG[gcrypt] = "--with-sha1=libgcrypt,,libgcrypt"
>> -
>> -do_install:append () {
>> -	# Its assumed base-files creates this for us
>> -	rmdir ${D}${localstatedir}/log/
>> -        sed -i -e 's,${libdir}/xorg/modules,${prefix}/lib*/xorg/modules,' ${D}${mandir}/man5/xorg.conf.5
>> -}
>> +SHA1 ??= "sha1"
>> +# TODO: more options
>> +PACKAGECONFIG[sha1] = "-Dsha1=libgcrypt,,libgcrypt"
>>   
>> -# Add runtime provides for the ABI versions of the video and input subsystems,
>>   # so that drivers can depend on the relevant version.
>>   python populate_packages:prepend() {
>>       import subprocess
>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
>> deleted file mode 100644
>> index 4737040675..0000000000
>> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Avoid-duplicate-definitions-of-IOPortBase.patch
>> +++ /dev/null
>> @@ -1,45 +0,0 @@
>> -From fc04acfd948ac99d04a5dc08c78f3b13bc0c5c41 Mon Sep 17 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Mon, 17 Aug 2020 10:50:51 -0700
>> -Subject: [PATCH] Avoid duplicate definitions of IOPortBase
>> -
>> -This fixed build with gcc10/-fno-common
>> -
>> -Fixes
>> -compiler.h:528: multiple definition of `IOPortBase';
>> -
>> -Upstream-Status: Pending
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> - hw/xfree86/common/compiler.h            | 2 +-
>> - hw/xfree86/os-support/linux/lnx_video.c | 1 +
>> - 2 files changed, 2 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/hw/xfree86/common/compiler.h b/hw/xfree86/common/compiler.h
>> -index 2b2008b..c7d617e 100644
>> ---- a/hw/xfree86/common/compiler.h
>> -+++ b/hw/xfree86/common/compiler.h
>> -@@ -525,7 +525,7 @@ xf86WriteMmio32Le(__volatile__ void *base, const unsigned long offset,
>> - #define PORT_SIZE short
>> - #endif
>> -
>> --_X_EXPORT unsigned int IOPortBase;      /* Memory mapped I/O port area */
>> -+extern _X_EXPORT unsigned int IOPortBase;      /* Memory mapped I/O port area */
>> -
>> - static __inline__ void
>> - outb(unsigned PORT_SIZE port, unsigned char val)
>> -diff --git a/hw/xfree86/os-support/linux/lnx_video.c b/hw/xfree86/os-support/linux/lnx_video.c
>> -index 04e4509..9dc7316 100644
>> ---- a/hw/xfree86/os-support/linux/lnx_video.c
>> -+++ b/hw/xfree86/os-support/linux/lnx_video.c
>> -@@ -78,6 +78,7 @@ xf86OSInitVidMem(VidMemInfoPtr pVidMem)
>> - /***************************************************************************/
>> - /* I/O Permissions section                                                 */
>> - /***************************************************************************/
>> -+_X_EXPORT unsigned int IOPortBase;      /* Memory mapped I/O port area */
>> -
>> - #if defined(__powerpc__)
>> - volatile unsigned char *ioBase = NULL;
>> ---
>> -2.28.0
>> -
>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch
>> deleted file mode 100644
>> index 8b687d612d..0000000000
>> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch
>> +++ /dev/null
>> @@ -1,34 +0,0 @@
>> -From e50c85f4ebf559a3bac4817b41074c43d4691779 Mon Sep 17 00:00:00 2001
>> -From: Eric Anholt <eric@anholt.net>
>> -Date: Fri, 26 Oct 2018 17:47:30 -0700
>> -Subject: [PATCH] Fix segfault on probing a non-PCI platform device on a system
>> - with PCI.
>> -
>> -Some Broadcom set-top-box boards have PCI busses, but the GPU is still
>> -probed through DT.  We would dereference a null busid here in that
>> -case.
>> -
>> -Signed-off-by: Eric Anholt <eric@anholt.net>
>> -
>> -Upstream-Status: Backport [https://github.com/freedesktop/xorg-xserver/commit/e50c85f4e]
>> -Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
>> ----
>> - hw/xfree86/common/xf86platformBus.c | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/hw/xfree86/common/xf86platformBus.c b/hw/xfree86/common/xf86platformBus.c
>> -index cef47da03..dadbac6c8 100644
>> ---- a/hw/xfree86/common/xf86platformBus.c
>> -+++ b/hw/xfree86/common/xf86platformBus.c
>> -@@ -289,7 +289,7 @@ xf86platformProbe(void)
>> -     for (i = 0; i < xf86_num_platform_devices; i++) {
>> -         char *busid = xf86_platform_odev_attributes(i)->busid;
>> -
>> --        if (pci && (strncmp(busid, "pci:", 4) == 0)) {
>> -+        if (pci && busid && (strncmp(busid, "pci:", 4) == 0)) {
>> -             platform_find_pci_info(&xf86_platform_devices[i], busid);
>> -         }
>> -
>> ---
>> -2.28.0
>> -
>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-test-xtest-Initialize-array-with-braces.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-test-xtest-Initialize-array-with-braces.patch
>> deleted file mode 100644
>> index c0c242814b..0000000000
>> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-test-xtest-Initialize-array-with-braces.patch
>> +++ /dev/null
>> @@ -1,36 +0,0 @@
>> -From 8a382c015cd3c69fcfc146ef03dcbf30c77ff207 Mon Sep 17 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Fri, 1 Mar 2019 09:47:57 -0800
>> -Subject: [PATCH] test/xtest: Initialize array with braces
>> -
>> -Fixes an error when extra warnings are enabled, this is caught with clang
>> -
>> -test/xtest.c:64:23: error: suggest braces around initialization of subobject [-Werror,-Wmissing-braces]
>> -    WindowRec root = {0};
>> -                      ^
>> -                      {}
>> -1 error generated.
>> -
>> -Upstream-Status: Pending
>> -
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> - test/xtest.c | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/test/xtest.c b/test/xtest.c
>> -index fc5e433..d7e6620 100644
>> ---- a/test/xtest.c
>> -+++ b/test/xtest.c
>> -@@ -61,7 +61,7 @@ xtest_init_devices(void)
>> - {
>> -     ScreenRec screen = {0};
>> -     ClientRec server_client = {0};
>> --    WindowRec root = {0};
>> -+    WindowRec root = {{0}};
>> -     WindowOptRec optional = {0};
>> -
>> -     /* random stuff that needs initialization */
>> ---
>> -2.21.0
>> -
>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/pkgconfig.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/pkgconfig.patch
>> deleted file mode 100644
>> index 2ef9fa9fe4..0000000000
>> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/pkgconfig.patch
>> +++ /dev/null
>> @@ -1,34 +0,0 @@
>> -Upstream-Status: Submitted [https://gitlab.freedesktop.org/xorg/xserver/merge_requests/22]
>> -Signed-off-by: Ross Burton <ross.burton@intel.com>
>> -
>> -From 5f65a6246fe752764045dd1e38912f1dccec71e4 Mon Sep 17 00:00:00 2001
>> -From: Ross Burton <ross.burton@intel.com>
>> -Date: Thu, 20 Sep 2018 20:12:24 +0100
>> -Subject: [PATCH] xorg-server.m4: just all cflags instead of just sdkdir
>> -
>> -Instead of fetching just the sdkdir variable of xorg-server using pkg-config,
>> -simply get all of the CFLAGS.  Aside from completeness, this helps builds in
>> -sysroots as pkg-config knows what to do with --cflags but doesn't remap
>> -arbitrary variables.
>> -
>> -Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ----
>> - xorg-server.m4 | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/xorg-server.m4 b/xorg-server.m4
>> -index 18255b91a..195bda5d8 100644
>> ---- a/xorg-server.m4
>> -+++ b/xorg-server.m4
>> -@@ -31,7 +31,7 @@ dnl
>> - AC_DEFUN([XORG_DRIVER_CHECK_EXT],[
>> - 	AC_REQUIRE([PKG_PROG_PKG_CONFIG])
>> - 	SAVE_CFLAGS="$CFLAGS"
>> --	CFLAGS="$CFLAGS -I`$PKG_CONFIG --variable=sdkdir xorg-server`"
>> -+	CFLAGS="$CFLAGS `$PKG_CONFIG --cflags xorg-server`"
>> - 	AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
>> - #include "xorg-server.h"
>> - #if !defined $1
>> ---
>> -2.11.0
>> -
>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-build-path.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-build-path.patch
>> deleted file mode 100644
>> index be198ece49..0000000000
>> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/sdksyms-no-build-path.patch
>> +++ /dev/null
>> @@ -1,50 +0,0 @@
>> -Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/merge_requests/253]
>> -Signed-off-by: Ross Burton <ross.burton@intel.com>
>> -
>> -From ca832598d38ba55a001088b57d73c6d7261dc9a7 Mon Sep 17 00:00:00 2001
>> -From: Ross Burton <ross.burton@intel.com>
>> -Date: Thu, 1 Aug 2019 15:24:51 +0100
>> -Subject: [PATCH] sdksyms.sh: don't embed the build path
>> -
>> -This script generates a header that has a comment containing the build path for
>> -no real reason.  As this source can end up deployed on targets in debug packages
>> -this means there is both potentially sensitive information leakage about the
>> -build environment, and a source of change for reproducible builds.
>> ----
>> - hw/xfree86/sdksyms.sh | 7 +++++--
>> - 1 file changed, 5 insertions(+), 2 deletions(-)
>> -
>> -diff --git a/hw/xfree86/sdksyms.sh b/hw/xfree86/sdksyms.sh
>> -index 39e33711d..bdf47a71a 100755
>> ---- a/hw/xfree86/sdksyms.sh
>> -+++ b/hw/xfree86/sdksyms.sh
>> -@@ -302,13 +302,16 @@ LC_ALL=C
>> - export LC_ALL
>> - ${CPP:-cpp} "$@" sdksyms.c > /dev/null || exit $?
>> - ${CPP:-cpp} "$@" sdksyms.c | ${AWK:-awk} -v topdir=$topdir '
>> -+function basename(file) {
>> -+    sub(".*/", "", file)
>> -+    return file
>> -+}
>> - BEGIN {
>> -     sdk = 0;
>> -     print("/*");
>> -     print(" * These symbols are referenced to ensure they");
>> -     print(" * will be available in the X Server binary.");
>> -     print(" */");
>> --    printf("/* topdir=%s */\n", topdir);
>> -     print("_X_HIDDEN void *xorg_symbols[] = {");
>> -
>> -     printf("sdksyms.c:") > "sdksyms.dep";
>> -@@ -337,7 +340,7 @@ BEGIN {
>> - 	# remove quotes
>> - 	gsub(/"/, "", $3);
>> - 	line = $2;
>> --	header = $3;
>> -+	header = basename($3);
>> - 	if (! headers[$3]) {
>> - 	    printf(" \\\n  %s", $3) >> "sdksyms.dep";
>> - 	    headers[$3] = 1;
>> ---
>> -2.20.1
>> -
>> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.13.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.0.bb
>> similarity index 60%
>> rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.13.bb
>> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.0.bb
>> index 01a54070c7..8cb92884b5 100644
>> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.13.bb
>> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.0.bb
>> @@ -1,14 +1,9 @@
>>   require xserver-xorg.inc
>>   
>> -SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
>> -           file://pkgconfig.patch \
>> -           file://0001-test-xtest-Initialize-array-with-braces.patch \
>> -           file://sdksyms-no-build-path.patch \
>> -           file://0001-drmmode_display.c-add-missing-mi.h-include.patch \
>> -           file://0001-Avoid-duplicate-definitions-of-IOPortBase.patch \
>> -           file://0001-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch \
>> +SRC_URI += " \
>>              "
>> -SRC_URI[sha256sum] = "40aa4e96a56a81a301f15a9b10e06a22700f12b42d9e0e453c7f11d354386300"
>> +#SRC_URI[sha256sum] = "50c316dd8f4472cb60dfb285aa46ca6855d7626cecfd8330f6c51da743c1fe42"
>> +SRC_URI[sha256sum] = "d8381e02919ca4683bdee5d399f7dc40dff8eb5a64d8bf9e4ee7c09edd51c086"
>>   
>>   # These extensions are now integrated into the server, so declare the migration
>>   # path for in-place upgrades.
>>
>> 
>>
