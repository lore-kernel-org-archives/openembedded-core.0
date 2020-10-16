Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.12419.1602843683121280001
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 85C5738C1775
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:24 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-plugins-bad: upgrading to 1.18.0 FAILED
Message-ID: <MADEUP.163E71D72AD55BAD.24086@lists.openembedded.org>
X-Groupsio-MsgNum: 143488
Content-Type: multipart/mixed; boundary="===============4140673137434018195=="

--===============4140673137434018195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-plugins-bad* to *1.18.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gstreamer1.0-plugins-bad-upgrade-1.16.2-1.18.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============4140673137434018195==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-plugins-bad-upgrade-1.16.2-1.18.0.patch"

From c066fd409f18e560bb819b81cb6c6525fb4a7d1a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Fri, 16 Oct 2020 09:28:00 +0000
Subject: [PATCH] gstreamer1.0-plugins-bad: upgrade 1.16.2 -> 1.18.0

---
 ...even-when-cross-compiling-if-introsp.patch | 36 -----------------
 ...-sentinels-for-gst_structure_get-etc.patch | 39 ++++++++++---------
 ....bb => gstreamer1.0-plugins-bad_1.18.0.bb} | 17 ++++----
 3 files changed, 27 insertions(+), 65 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.16.2.bb => gstreamer1.0-plugins-bad_1.18.0.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
deleted file mode 100644
index 1321852023..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 97a4d0cd7de8cfbf983acc7e37ba2f8fb73c3e19 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Tim-Philipp=20M=C3=BCller?= <tim@centricular.com>
-Date: Fri, 18 Oct 2019 00:39:12 +0100
-Subject: [PATCH 1/2] meson: build gir even when cross-compiling if
- introspection was enabled explicitly
-
-This can be made to work in certain circumstances when
-cross-compiling, so default to not building g-i stuff
-when cross-compiling, but allow it if introspection was
-enabled explicitly via -Dintrospection=enabled.
-
-See gstreamer/gstreamer#454 and gstreamer/gstreamer#381.
-
-Upstream-Status: Backport [97a4d0cd7de8cfbf983acc7e37ba2f8fb73c3e19]
-
-Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 67aeeb4d0..7b3314bd9 100644
---- a/meson.build
-+++ b/meson.build
-@@ -411,7 +411,7 @@ python3 = import('python').find_installation()
- 
- gir = find_program('g-ir-scanner', required : get_option('introspection'))
- gnome = import('gnome')
--build_gir = gir.found() and not meson.is_cross_build()
-+build_gir = gir.found() and (not meson.is_cross_build() or get_option('introspection').enabled())
- gir_init_section = [ '--add-init-section=extern void gst_init(gint*,gchar**);' + \
-     'g_setenv("GST_REGISTRY_1.0", "@0@", TRUE);'.format(meson.current_build_dir() + '/gir_empty_registry.reg') + \
-     'g_setenv("GST_PLUGIN_PATH_1_0", "", TRUE);' + \
--- 
-2.17.1
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/ensure-valid-sentinels-for-gst_structure_get-etc.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/ensure-valid-sentinels-for-gst_structure_get-etc.patch
index 2d5389d953..4d0244141b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/ensure-valid-sentinels-for-gst_structure_get-etc.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/ensure-valid-sentinels-for-gst_structure_get-etc.patch
@@ -1,4 +1,4 @@
-From 2262ba4b686d5cc0d3e894707fe1d31619a3a8f1 Mon Sep 17 00:00:00 2001
+From 369b77c6b6cc7049ed19491ef31b98474b027aa3 Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 9 Feb 2016 14:00:00 -0800
 Subject: [PATCH] ensure valid sentinals for gst_structure_get() etc
@@ -17,26 +17,27 @@ without an explicit cast to a pointer type.
 Upstream-Status: Pending
 
 Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+
 ---
  sys/decklink/gstdecklink.cpp          | 10 +++++-----
  sys/decklink/gstdecklinkaudiosrc.cpp  |  2 +-
  sys/decklink/gstdecklinkvideosink.cpp |  2 +-
  3 files changed, 7 insertions(+), 7 deletions(-)
 
-Index: gst-plugins-bad-1.10.2/sys/decklink/gstdecklink.cpp
-===================================================================
---- gst-plugins-bad-1.10.2.orig/sys/decklink/gstdecklink.cpp
-+++ gst-plugins-bad-1.10.2/sys/decklink/gstdecklink.cpp
-@@ -617,7 +617,7 @@ gst_decklink_mode_get_structure (GstDeck
+diff --git a/sys/decklink/gstdecklink.cpp b/sys/decklink/gstdecklink.cpp
+index 4dac7e1..43762ce 100644
+--- a/sys/decklink/gstdecklink.cpp
++++ b/sys/decklink/gstdecklink.cpp
+@@ -674,7 +674,7 @@ gst_decklink_mode_get_generic_structure (GstDecklinkModeEnum e)
        "pixel-aspect-ratio", GST_TYPE_FRACTION, mode->par_n, mode->par_d,
        "interlace-mode", G_TYPE_STRING,
        mode->interlaced ? "interleaved" : "progressive",
 -      "framerate", GST_TYPE_FRACTION, mode->fps_n, mode->fps_d, NULL);
 +      "framerate", GST_TYPE_FRACTION, mode->fps_n, mode->fps_d, (void*)NULL);
  
-   if (input && mode->interlaced) {
-     if (mode->tff)
-@@ -632,16 +632,16 @@ gst_decklink_mode_get_structure (GstDeck
+   return s;
+ }
+@@ -699,16 +699,16 @@ gst_decklink_mode_get_structure (GstDecklinkModeEnum e, BMDPixelFormat f,
      case bmdFormat8BitYUV:     /* '2vuy' */
        gst_structure_set (s, "format", G_TYPE_STRING, "UYVY",
            "colorimetry", G_TYPE_STRING, mode->colorimetry,
@@ -57,11 +58,11 @@ Index: gst-plugins-bad-1.10.2/sys/decklink/gstdecklink.cpp
        break;
      case bmdFormat10BitRGB:    /* 'r210' Big-endian RGB 10-bit per component with SMPTE video levels (64-960). Packed as 2:10:10:10 */
      case bmdFormat12BitRGB:    /* 'R12B' Big-endian RGB 12-bit per component with full range (0-4095). Packed as 12-bit per component */
-Index: gst-plugins-bad-1.10.2/sys/decklink/gstdecklinkaudiosrc.cpp
-===================================================================
---- gst-plugins-bad-1.10.2.orig/sys/decklink/gstdecklinkaudiosrc.cpp
-+++ gst-plugins-bad-1.10.2/sys/decklink/gstdecklinkaudiosrc.cpp
-@@ -387,7 +387,7 @@ gst_decklink_audio_src_set_caps (GstBase
+diff --git a/sys/decklink/gstdecklinkaudiosrc.cpp b/sys/decklink/gstdecklinkaudiosrc.cpp
+index 2fef934..c47229a 100644
+--- a/sys/decklink/gstdecklinkaudiosrc.cpp
++++ b/sys/decklink/gstdecklinkaudiosrc.cpp
+@@ -379,7 +379,7 @@ gst_decklink_audio_src_start (GstDecklinkAudioSrc * self)
        g_mutex_unlock (&self->input->lock);
  
        if (videosrc) {
@@ -70,11 +71,11 @@ Index: gst-plugins-bad-1.10.2/sys/decklink/gstdecklinkaudiosrc.cpp
          gst_object_unref (videosrc);
  
          switch (vconn) {
-Index: gst-plugins-bad-1.10.2/sys/decklink/gstdecklinkvideosink.cpp
-===================================================================
---- gst-plugins-bad-1.10.2.orig/sys/decklink/gstdecklinkvideosink.cpp
-+++ gst-plugins-bad-1.10.2/sys/decklink/gstdecklinkvideosink.cpp
-@@ -285,7 +285,7 @@ reset_framerate (GstCapsFeatures * featu
+diff --git a/sys/decklink/gstdecklinkvideosink.cpp b/sys/decklink/gstdecklinkvideosink.cpp
+index e3a6775..f1a5aae 100644
+--- a/sys/decklink/gstdecklinkvideosink.cpp
++++ b/sys/decklink/gstdecklinkvideosink.cpp
+@@ -286,7 +286,7 @@ reset_framerate (GstCapsFeatures * features, GstStructure * structure,
      gpointer user_data)
  {
    gst_structure_set (structure, "framerate", GST_TYPE_FRACTION_RANGE, 0, 1,
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb
index 99176b2571..2099d5855d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb
@@ -1,15 +1,12 @@
 require gstreamer1.0-plugins-common.inc
 
-SRC_URI = " \
-    https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-${PV}.tar.xz \
-    file://0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch \
-    file://fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch \
-    file://avoid-including-sys-poll.h-directly.patch \
-    file://ensure-valid-sentinels-for-gst_structure_get-etc.patch \
-    file://opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
-"
-SRC_URI[md5sum] = "ccc7404230afddec723bbdb63c89feec"
-SRC_URI[sha256sum] = "f1cb7aa2389569a5343661aae473f0a940a90b872001824bc47fa8072a041e74"
+SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad-${PV}.tar.xz \
+           file://fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch \
+           file://avoid-including-sys-poll.h-directly.patch \
+           file://ensure-valid-sentinels-for-gst_structure_get-etc.patch \
+           file://opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
+           "
+SRC_URI[sha256sum] = "f382ab1caddd64aaa7acb7c4787487f63fd39bd0fde9c757655cbaa457c1185f"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-- 
2.18.4


--===============4140673137434018195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1469 entries from dependency cache.
Parsing recipes...done.
Parsing of 785 .bb files complete (784 cached, 1 parsed). 1356 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20201016"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:025b487fc4fd295f6c571bea0716c4c3adc2f23b"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 201 Found 194 Missed 7 Current 708 (96% match, 99% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2094 of 2775 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.0-r0: task do_fetch: Started
NOTE: Running task 2377 of 2775 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 2395 of 2775 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb:do_unpack)
NOTE: Running task 2396 of 2775 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 2764 of 2775 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.0-r0: task do_patch: Succeeded
NOTE: Running task 2765 of 2775 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2766 of 2775 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.0-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.18.0-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.18.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2767 of 2775 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.18.0-r0: task do_configure: Started
ERROR: gstreamer1.0-plugins-bad-1.18.0-r0 do_configure: meson failed
ERROR: gstreamer1.0-plugins-bad-1.18.0-r0 do_configure: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/temp/run.do_configure.3917865' failed with exit code 1:
The Meson build system
Version: 0.55.1
Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/gst-plugins-bad-1.18.0
Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/build
Build type: cross build
Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/recipe-sysroot/usr/share/pkgconfig'
WARNING: Unknown options: "nvdec, nvenc, vdpau"
The value of new options can be set with:
meson setup <builddir> --reconfigure -Dnew_option=new_value ...
Project name: gst-plugins-bad
Project version: 1.18.0
C compiler for the build machine: gcc (gcc 8.3.1 "gcc (GCC) 8.3.1 20191121 (Red Hat 8.3.1-5)")
C linker for the build machine: gcc ld.bfd 2.30-73
C++ compiler for the build machine: g++ (gcc 8.3.1 "g++ (GCC) 8.3.1 20191121 (Red Hat 8.3.1-5)")
C++ linker for the build machine: g++ ld.bfd 2.30-73
C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/recipe-sysroot (gcc 10.2.0 "i686-poky-linux-gcc (GCC) 10.2.0")
C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/recipe-sysroot ld.bfd 2.35.0.20200730
C++ compiler for the host machine: i686-poky-linux-g++ -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/recipe-sysroot (gcc 10.2.0 "i686-poky-linux-g++ (GCC) 10.2.0")
C++ linker for the host machine: i686-poky-linux-g++ -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/recipe-sysroot ld.bfd 2.35.0.20200730
Build machine cpu family: x86_64
Build machine cpu: x86_64
Host machine cpu family: x86
Host machine cpu: i686
Target machine cpu family: x86
Target machine cpu: i686
Compiler for C++ supports arguments -Wno-non-virtual-dtor -Wnon-virtual-dtor: YES 
Compiler for C supports link arguments -Wl,-Bsymbolic-functions: YES 
Compiler for C supports arguments -fvisibility=hidden: YES 
Compiler for C supports arguments -fno-strict-aliasing: YES 
Compiler for C++ supports arguments -fno-strict-aliasing: YES 
Message: Disabling GLib cast checks
Has header "dlfcn.h" : YES 
Has header "fcntl.h" : YES 
Has header "inttypes.h" : YES 
Has header "memory.h" : YES 
Has header "netinet/in.h" : YES 
Has header "netinet/ip.h" : YES 
Has header "netinet/tcp.h" : YES 
Has header "pthread.h" : YES 
Has header "stdint.h" : YES 
Has header "stdlib.h" : YES 
Has header "strings.h" : YES 
Has header "string.h" : YES 
Has header "sys/param.h" : YES 
Has header "sys/socket.h" : YES 
Has header "sys/stat.h" : YES 
Has header "sys/time.h" : YES 
Has header "sys/types.h" : YES 
Has header "sys/utsname.h" : YES 
Has header "unistd.h" : YES 
Has header "windows.h" : NO 
Has header "winsock2.h" : NO 
Has header "ws2tcpip.h" : NO 
Checking for function "dcgettext" : YES 
Checking for function "getpagesize" : YES 
Checking for function "gmtime_r" : YES 
Checking for function "mmap" : YES 
Checking for function "pipe2" : YES 
Checking for function "getrusage" : YES 
Checking for size of "char" : 1
Checking for size of "int" : 4
Checking for size of "long" : 4
Checking for size of "short" : 2
Checking for size of "void*" : 4
Compiler for C supports arguments -Wmissing-prototypes: YES 
Compiler for C supports arguments -Wdeclaration-after-statement: YES 
Compiler for C supports arguments -Wold-style-definition: YES 
Compiler for C++ supports arguments -Wformat-nonliteral: YES 
Compiler for C supports arguments -Wmissing-declarations: YES 
Compiler for C++ supports arguments -Wmissing-declarations: YES 
Compiler for C supports arguments -Wredundant-decls: YES 
Compiler for C++ supports arguments -Wredundant-decls: YES 
Compiler for C supports arguments -Wwrite-strings: YES 
Compiler for C++ supports arguments -Wwrite-strings: YES 
Compiler for C supports arguments -Wformat: YES 
Compiler for C++ supports arguments -Wformat: YES 
Compiler for C supports arguments -Wformat-security: YES 
Compiler for C++ supports arguments -Wformat-security: YES 
Compiler for C supports arguments -Winit-self: YES 
Compiler for C++ supports arguments -Winit-self: YES 
Compiler for C supports arguments -Wmissing-include-dirs: YES 
Compiler for C++ supports arguments -Wmissing-include-dirs: YES 
Compiler for C supports arguments -Waddress: YES 
Compiler for C++ supports arguments -Waddress: YES 
Compiler for C supports arguments -Wno-multichar -Wmultichar: YES 
Compiler for C++ supports arguments -Wno-multichar -Wmultichar: YES 
Compiler for C supports arguments -Wvla: YES 
Compiler for C++ supports arguments -Wvla: YES 
Compiler for C supports arguments -Wpointer-arith: YES 
Compiler for C++ supports arguments -Wpointer-arith: YES 
Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/recipe-sysroot/usr/share/pkgconfig'
Dependency gstreamer-1.0 found: NO found 1.16.2 but need: '>= 1.18.0'
Found CMake: NO
Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
Looking for a fallback subproject for the dependency gstreamer-1.0

../gst-plugins-bad-1.18.0/meson.build:265:0: ERROR: Subproject directory not found and gstreamer.wrap file not found

A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/build/meson-logs/meson-log.txt
WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/temp/run.do_configure.3917865:183 exit 1 from 'exit 1'
WARNING: Backtrace (BB generated script): 
	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/temp/run.do_configure.3917865, line 183
	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/temp/run.do_configure.3917865, line 172
	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/temp/run.do_configure.3917865, line 157
	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/temp/run.do_configure.3917865, line 212

Backtrace (metadata-relative locations):
	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/logging.bbclass, line 72
	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/meson.bbclass, line 138
	#3: do_configure, autogenerated, line 6
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/temp/log.do_configure.3917865
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.40.21.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.32.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.20.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.54.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/get
 text_0.21.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.135.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.46.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.1.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/reci
 pes-devtools/python/python3_3.8.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.18.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.10.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.102.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.23.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/y
 octo-worker/auh/build/build/poky/meta/recipes-devtools/prelink/prelink_git.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.31.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_1.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.64.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_0.55.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-work
 er/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_5.1.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.72.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_233.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.31.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/
 recipes-devtools/quilt/quilt-native_0.66.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['patch-native', 'librsvg', 'glibc', 'glib-2.0-native', 'wayland-protocols', 'openssl', 'bluez5', 'gettext-native', 'vulkan-loader', 'pseudo-native', 'nettle', 'libsndfile1', 'pango', 'libwebp', 'gobject-introspection', 'python3-native', 'pkgconfig-native', 'wayland-native', 'wayland', 'gstreamer1.0-plugins-base', 'ninja-native', 'libdrm', 'libusb1', 'prelink-native', 'orc', 'libxml2', 'cairo', 'sbc', 'gobject-introspection-native', 'meson-native', 'gcc-runtime', 'qemu-native', 'curl', 'libgudev', 'orc-native', 'gstreamer1.0', 'bzip2', 'gcc-cross-i686', 'xz-native', 'quilt-native', 'gnu-config-native', 'automake-native', 'libtool-native', 'autoconf-native', 'attr-native', 'libcroco', 'glib-2.0', 'gdk-pixbuf', 'linux-libc-headers', 'gtk-doc-native', 'libffi-native', 'zlib-native', 'util-linux-native', 'gettext-minimal-native', 'libpcre-native', 'opkg-utils', 'initscripts', 'libical', 'dbus', 'readline', 'update-rc.d', 'eudev', 'texinfo-du
 mmy-native', 'libx11', 'libxrandr', 'libxcb', 'vulkan-headers', 'gmp', 'alsa-lib', 'libogg', 'flac', 'libvorbis', 'freetype', 'fontconfig', 'libxft', 'harfbuzz', 'fribidi', 'python3', 'autoconf-archive', 'libffi', 'zlib', 'gdbm-native', 'bzip2-native', 'libnsl2-native', 'sqlite3-native', 'openssl-native', 'libtirpc-native', 'readline-native', 'expat-native', 'libxml2-native', 'expat', 'iso-codes', 'libsm', 'libpng', 'util-linux', 'libxrender', 'libtheora', 'mesa', 'libjpeg-turbo', 'libxv', 're2c-native', 'libpthread-stubs', 'libpciaccess', 'elfutils-native', 'binutils-native', 'libxext', 'pixman', 'flex-native', 'python3-setuptools-native', 'libgcc', 'libidn2', 'gnutls', 'libcap', 'libmpc-native', 'mpfr-native', 'gmp-native', 'binutils-cross-i686', 'm4-native', 'libpcre', 'bash-completion', 'shared-mime-info', 'libpcre2-native', 'ncurses-native', 'libcap-ng-native', 'icu', 'shadow-sysroot', 'base-passwd', 'shadow', 'base-files', 'shadow-native', 'ncurses', 'kmod', 'util-macros', 'xt
 rans', 'xorgproto', 'libxdmcp', 'libxau', 'xcb-proto', 'xz', 'libxcrypt', 'libnsl2', 'libtirpc', 'gdbm', 'sqlite3', 'cmake-native', 'libice', 'libcap-ng', 'libxxf86vm', 'libxdamage', 'xrandr', 'libxfixes', 'libxshmfence', 'unzip-native', 'libunistring', 'attr', 'curl-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dintrospection=enabled -Dexamples=disabled -Dnls=enabled -Ddecklink=enabled -Ddvb=enabled -Dfbdev=enabled -Dipcpipeline=enabled -Dnetsim=enabled -Dshm=enabled -Daom=disabled -Dandroidmedia=disabled -Dapplemedia=disabled -Dbs2b=disabled -Dchromaprint=disabled -Dd3dvideosink=disabled -Ddirectsound=disabled -Ddts=disabled -Dfdkaac=disabled -Dflite=disabled -Dgme=disabled -Dgsm=disabled -Diqa=disabled -Dkate=disabled -Dladspa=disabled -Dlv2=disabled -Dmpeg2enc=disabled -Dmplex=disabled -Dmusepack=disabled -Dnvdec=disabled -Dnvenc=disabled -Dofa=disabled -Dopenexr=disabled -Dopenni2=disabled -Dopensles=disabled -Dsoundtouch=disabled -Dspandsp=disabled -Dsrt=disabled -Dteletext=disabled -Dwasapi=disabled -Dwildmidi=disabled -Dwinks=disabled -Dwinscreencap=disabled -Dwpe=disabled -Dx265=disabled -Dassrender=disabled -Dbluez=enabled -Dbz2=enabled -Dclosedcaption=enabled -Dcurl=enabled -Ddash=enabled -Ddc1394=disabled -Ddirectfb=disabled -Ddtls=enabled -Dfaac=disabled
  -Dfaad=disabled -Dfluidsynth=disabled -Dgl=enabled -Dhls=enabled -Dhls-crypto=nettle -Dkms=disabled -Dcolormanagement=disabled -Dlibde265=disabled -Dlibmms=disabled -Dcurl-ssh2=disabled -Dmodplug=disabled -Dmsdk=disabled -Dneon=disabled -Dopenal=disabled -Dopencv=disabled -Dopenh264=disabled -Dopenjpeg=disabled -Dopenmpt=disabled -Dopus=disabled -Dorc=enabled -Dresindvd=disabled -Drsvg=enabled -Drtmp=disabled -Dsbc=enabled -Dsctp=disabled -Dsmoothstreaming=enabled -Dsndfile=enabled -Dsrtp=disabled -Dtinyalsa=disabled -Dttml=enabled -Duvch264=enabled -Dvdpau=disabled -Dvoaacenc=disabled -Dvoamrwbenc=disabled -Dvulkan=enabled -Dwayland=enabled -Dwebp=enabled -Dwebrtc=disabled -Dwebrtcdsp=disabled -Dzbar=disabled...
| The Meson build system
| Version: 0.55.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/gst-plugins-bad-1.18.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/build
| Build type: cross build
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/recipe-sysroot/usr/share/pkgconfig'
| WARNING: Unknown options: "nvdec, nvenc, vdpau"
| The value of new options can be set with:
| meson setup <builddir> --reconfigure -Dnew_option=new_value ...
| Project name: gst-plugins-bad
| Project version: 1.18.0
| C compiler for the build machine: gcc (gcc 8.3.1 "gcc (GCC) 8.3.1 20191121 (Red Hat 8.3.1-5)")
| C linker for the build machine: gcc ld.bfd 2.30-73
| C++ compiler for the build machine: g++ (gcc 8.3.1 "g++ (GCC) 8.3.1 20191121 (Red Hat 8.3.1-5)")
| C++ linker for the build machine: g++ ld.bfd 2.30-73
| C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/recipe-sysroot (gcc 10.2.0 "i686-poky-linux-gcc (GCC) 10.2.0")
| C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/recipe-sysroot ld.bfd 2.35.0.20200730
| C++ compiler for the host machine: i686-poky-linux-g++ -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/recipe-sysroot (gcc 10.2.0 "i686-poky-linux-g++ (GCC) 10.2.0")
| C++ linker for the host machine: i686-poky-linux-g++ -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/recipe-sysroot ld.bfd 2.35.0.20200730
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86
| Host machine cpu: i686
| Target machine cpu family: x86
| Target machine cpu: i686
| Compiler for C++ supports arguments -Wno-non-virtual-dtor -Wnon-virtual-dtor: YES
| Compiler for C supports link arguments -Wl,-Bsymbolic-functions: YES
| Compiler for C supports arguments -fvisibility=hidden: YES
| Compiler for C supports arguments -fno-strict-aliasing: YES
| Compiler for C++ supports arguments -fno-strict-aliasing: YES
| Message: Disabling GLib cast checks
| Has header "dlfcn.h" : YES
| Has header "fcntl.h" : YES
| Has header "inttypes.h" : YES
| Has header "memory.h" : YES
| Has header "netinet/in.h" : YES
| Has header "netinet/ip.h" : YES
| Has header "netinet/tcp.h" : YES
| Has header "pthread.h" : YES
| Has header "stdint.h" : YES
| Has header "stdlib.h" : YES
| Has header "strings.h" : YES
| Has header "string.h" : YES
| Has header "sys/param.h" : YES
| Has header "sys/socket.h" : YES
| Has header "sys/stat.h" : YES
| Has header "sys/time.h" : YES
| Has header "sys/types.h" : YES
| Has header "sys/utsname.h" : YES
| Has header "unistd.h" : YES
| Has header "windows.h" : NO
| Has header "winsock2.h" : NO
| Has header "ws2tcpip.h" : NO
| Checking for function "dcgettext" : YES
| Checking for function "getpagesize" : YES
| Checking for function "gmtime_r" : YES
| Checking for function "mmap" : YES
| Checking for function "pipe2" : YES
| Checking for function "getrusage" : YES
| Checking for size of "char" : 1
| Checking for size of "int" : 4
| Checking for size of "long" : 4
| Checking for size of "short" : 2
| Checking for size of "void*" : 4
| Compiler for C supports arguments -Wmissing-prototypes: YES
| Compiler for C supports arguments -Wdeclaration-after-statement: YES
| Compiler for C supports arguments -Wold-style-definition: YES
| Compiler for C++ supports arguments -Wformat-nonliteral: YES
| Compiler for C supports arguments -Wmissing-declarations: YES
| Compiler for C++ supports arguments -Wmissing-declarations: YES
| Compiler for C supports arguments -Wredundant-decls: YES
| Compiler for C++ supports arguments -Wredundant-decls: YES
| Compiler for C supports arguments -Wwrite-strings: YES
| Compiler for C++ supports arguments -Wwrite-strings: YES
| Compiler for C supports arguments -Wformat: YES
| Compiler for C++ supports arguments -Wformat: YES
| Compiler for C supports arguments -Wformat-security: YES
| Compiler for C++ supports arguments -Wformat-security: YES
| Compiler for C supports arguments -Winit-self: YES
| Compiler for C++ supports arguments -Winit-self: YES
| Compiler for C supports arguments -Wmissing-include-dirs: YES
| Compiler for C++ supports arguments -Wmissing-include-dirs: YES
| Compiler for C supports arguments -Waddress: YES
| Compiler for C++ supports arguments -Waddress: YES
| Compiler for C supports arguments -Wno-multichar -Wmultichar: YES
| Compiler for C++ supports arguments -Wno-multichar -Wmultichar: YES
| Compiler for C supports arguments -Wvla: YES
| Compiler for C++ supports arguments -Wvla: YES
| Compiler for C supports arguments -Wpointer-arith: YES
| Compiler for C++ supports arguments -Wpointer-arith: YES
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/recipe-sysroot/usr/share/pkgconfig'
| Dependency gstreamer-1.0 found: NO found 1.16.2 but need: '>= 1.18.0'
| Found CMake: NO
| Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gstreamer-1.0
| 
| ../gst-plugins-bad-1.18.0/meson.build:265:0: ERROR: Subproject directory not found and gstreamer.wrap file not found
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/temp/run.do_configure.3917865:183 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/temp/run.do_configure.3917865, line 183
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/temp/run.do_configure.3917865, line 172
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/temp/run.do_configure.3917865, line 157
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/temp/run.do_configure.3917865, line 212
| ERROR: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/temp/run.do_configure.3917865' failed with exit code 1:
| The Meson build system
| Version: 0.55.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/gst-plugins-bad-1.18.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/build
| Build type: cross build
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/recipe-sysroot/usr/share/pkgconfig'
| WARNING: Unknown options: "nvdec, nvenc, vdpau"
| The value of new options can be set with:
| meson setup <builddir> --reconfigure -Dnew_option=new_value ...
| Project name: gst-plugins-bad
| Project version: 1.18.0
| C compiler for the build machine: gcc (gcc 8.3.1 "gcc (GCC) 8.3.1 20191121 (Red Hat 8.3.1-5)")
| C linker for the build machine: gcc ld.bfd 2.30-73
| C++ compiler for the build machine: g++ (gcc 8.3.1 "g++ (GCC) 8.3.1 20191121 (Red Hat 8.3.1-5)")
| C++ linker for the build machine: g++ ld.bfd 2.30-73
| C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/recipe-sysroot (gcc 10.2.0 "i686-poky-linux-gcc (GCC) 10.2.0")
| C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/recipe-sysroot ld.bfd 2.35.0.20200730
| C++ compiler for the host machine: i686-poky-linux-g++ -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/recipe-sysroot (gcc 10.2.0 "i686-poky-linux-g++ (GCC) 10.2.0")
| C++ linker for the host machine: i686-poky-linux-g++ -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/recipe-sysroot ld.bfd 2.35.0.20200730
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86
| Host machine cpu: i686
| Target machine cpu family: x86
| Target machine cpu: i686
| Compiler for C++ supports arguments -Wno-non-virtual-dtor -Wnon-virtual-dtor: YES
| Compiler for C supports link arguments -Wl,-Bsymbolic-functions: YES
| Compiler for C supports arguments -fvisibility=hidden: YES
| Compiler for C supports arguments -fno-strict-aliasing: YES
| Compiler for C++ supports arguments -fno-strict-aliasing: YES
| Message: Disabling GLib cast checks
| Has header "dlfcn.h" : YES
| Has header "fcntl.h" : YES
| Has header "inttypes.h" : YES
| Has header "memory.h" : YES
| Has header "netinet/in.h" : YES
| Has header "netinet/ip.h" : YES
| Has header "netinet/tcp.h" : YES
| Has header "pthread.h" : YES
| Has header "stdint.h" : YES
| Has header "stdlib.h" : YES
| Has header "strings.h" : YES
| Has header "string.h" : YES
| Has header "sys/param.h" : YES
| Has header "sys/socket.h" : YES
| Has header "sys/stat.h" : YES
| Has header "sys/time.h" : YES
| Has header "sys/types.h" : YES
| Has header "sys/utsname.h" : YES
| Has header "unistd.h" : YES
| Has header "windows.h" : NO
| Has header "winsock2.h" : NO
| Has header "ws2tcpip.h" : NO
| Checking for function "dcgettext" : YES
| Checking for function "getpagesize" : YES
| Checking for function "gmtime_r" : YES
| Checking for function "mmap" : YES
| Checking for function "pipe2" : YES
| Checking for function "getrusage" : YES
| Checking for size of "char" : 1
| Checking for size of "int" : 4
| Checking for size of "long" : 4
| Checking for size of "short" : 2
| Checking for size of "void*" : 4
| Compiler for C supports arguments -Wmissing-prototypes: YES
| Compiler for C supports arguments -Wdeclaration-after-statement: YES
| Compiler for C supports arguments -Wold-style-definition: YES
| Compiler for C++ supports arguments -Wformat-nonliteral: YES
| Compiler for C supports arguments -Wmissing-declarations: YES
| Compiler for C++ supports arguments -Wmissing-declarations: YES
| Compiler for C supports arguments -Wredundant-decls: YES
| Compiler for C++ supports arguments -Wredundant-decls: YES
| Compiler for C supports arguments -Wwrite-strings: YES
| Compiler for C++ supports arguments -Wwrite-strings: YES
| Compiler for C supports arguments -Wformat: YES
| Compiler for C++ supports arguments -Wformat: YES
| Compiler for C supports arguments -Wformat-security: YES
| Compiler for C++ supports arguments -Wformat-security: YES
| Compiler for C supports arguments -Winit-self: YES
| Compiler for C++ supports arguments -Winit-self: YES
| Compiler for C supports arguments -Wmissing-include-dirs: YES
| Compiler for C++ supports arguments -Wmissing-include-dirs: YES
| Compiler for C supports arguments -Waddress: YES
| Compiler for C++ supports arguments -Waddress: YES
| Compiler for C supports arguments -Wno-multichar -Wmultichar: YES
| Compiler for C++ supports arguments -Wno-multichar -Wmultichar: YES
| Compiler for C supports arguments -Wvla: YES
| Compiler for C++ supports arguments -Wvla: YES
| Compiler for C supports arguments -Wpointer-arith: YES
| Compiler for C++ supports arguments -Wpointer-arith: YES
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Using 'PKG_CONFIG_PATH' from environment with value: '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/recipe-sysroot/usr/lib/pkgconfig:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/recipe-sysroot/usr/share/pkgconfig'
| Dependency gstreamer-1.0 found: NO found 1.16.2 but need: '>= 1.18.0'
| Found CMake: NO
| Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gstreamer-1.0
| 
| ../gst-plugins-bad-1.18.0/meson.build:265:0: ERROR: Subproject directory not found and gstreamer.wrap file not found
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/build/meson-logs/meson-log.txt
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/temp/run.do_configure.3917865:183 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/temp/run.do_configure.3917865, line 183
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/temp/run.do_configure.3917865, line 172
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/temp/run.do_configure.3917865, line 157
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/gstreamer1.0-plugins-bad/1.18.0-r0/temp/run.do_configure.3917865, line 212
| 
| Backtrace (metadata-relative locations):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/logging.bbclass, line 72
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/meson.bbclass, line 138
| 	#3: do_configure, autogenerated, line 6
NOTE: recipe gstreamer1.0-plugins-bad-1.18.0-r0: task do_configure: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb:do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2767 tasks of which 2759 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.0.bb:do_configure
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============4140673137434018195==--
