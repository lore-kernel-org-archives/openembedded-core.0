Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.283.1615826520859726396
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 09:42:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 6452738C1279
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 16:42:00 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Pascal Bach <pascal.bach@siemens.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] cmake: upgrading to 3.19.6 FAILED
Message-ID: <MADEUP.166C91A8EABB53A2.2480@lists.openembedded.org>
X-Groupsio-MsgNum: 149479
Content-Type: multipart/mixed; boundary="===============5836626875915487236=="

--===============5836626875915487236==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cmake* to *3.19.6* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-cmake-upgrade-3.19.5-3.19.6.patch
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

--===============5836626875915487236==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-cmake-upgrade-3.19.5-3.19.6.patch"

From 90fd872045be6d39d8a8372167df530e8f9e1da4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Mar 2021 04:47:03 +0000
Subject: [PATCH] cmake: upgrade 3.19.5 -> 3.19.6

---
 meta/recipes-devtools/cmake/cmake.inc         |  2 +-
 ...stem-use-oe-environment-vars-to-load.patch |  2 +-
 .../cmake/cmake/OEToolchainConfig.cmake       | 25 -------------------
 .../cmake/cmake/environment.d-cmake.sh        |  2 --
 .../{cmake_3.19.5.bb => cmake_3.19.6.bb}      | 11 ++++----
 5 files changed, 8 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
 delete mode 100644 meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh
 rename meta/recipes-devtools/cmake/{cmake_3.19.5.bb => cmake_3.19.6.bb} (78%)

diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index e0f59a6c67..b01e1b3b02 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -22,7 +22,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[sha256sum] = "c432296eb5dec6d71eae15d140f6297d63df44e9ffe3e453628d1dc8fc4201ce"
+SRC_URI[sha256sum] = "ec87ab67c45f47c4285f204280c5cde48e1c920cfcfed1555b27fb3b1a1d20ba"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
index 8181510324..73bdff366b 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
@@ -1,4 +1,4 @@
-From 66d5b27dc37ef6243f6549e16d0285ba6c064a6e Mon Sep 17 00:00:00 2001
+From f8937e4c7bc7f7ec591d0bce8354a2224db6403c Mon Sep 17 00:00:00 2001
 From: Cody P Schafer <dev@codyps.com>
 Date: Thu, 27 Apr 2017 11:35:05 -0400
 Subject: [PATCH] CMakeDetermineSystem: use oe environment vars to load default
diff --git a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
deleted file mode 100644
index 8f6f3a272d..0000000000
--- a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
+++ /dev/null
@@ -1,25 +0,0 @@
-set( CMAKE_SYSTEM_NAME Linux )
-set( CMAKE_C_FLAGS $ENV{CFLAGS} CACHE STRING "" FORCE )
-set( CMAKE_CXX_FLAGS $ENV{CXXFLAGS}  CACHE STRING "" FORCE )
-set( CMAKE_ASM_FLAGS ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )
-set( CMAKE_LDFLAGS_FLAGS ${CMAKE_CXX_FLAGS} CACHE STRING "" FORCE )
-set( CMAKE_SYSROOT $ENV{OECORE_TARGET_SYSROOT} )
-
-set( CMAKE_FIND_ROOT_PATH $ENV{OECORE_TARGET_SYSROOT} )
-set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER )
-set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
-set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
-set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )
-
-set(CMAKE_FIND_LIBRARY_CUSTOM_LIB_SUFFIX "$ENV{OE_CMAKE_FIND_LIBRARY_CUSTOM_LIB_SUFFIX}")
-
-# Set CMAKE_SYSTEM_PROCESSOR from the sysroot name (assuming processor-distro-os).
-if ($ENV{SDKTARGETSYSROOT} MATCHES "/sysroots/([a-zA-Z0-9_-]+)-.+-.+")
-  set(CMAKE_SYSTEM_PROCESSOR ${CMAKE_MATCH_1})
-endif()
-
-# Include the toolchain configuration subscripts
-file( GLOB toolchain_config_files "${CMAKE_CURRENT_LIST_FILE}.d/*.cmake" )
-foreach(config ${toolchain_config_files})
-    include(${config})
-endforeach()
diff --git a/meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh b/meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh
deleted file mode 100644
index 7bdb19fb6c..0000000000
--- a/meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh
+++ /dev/null
@@ -1,2 +0,0 @@
-export OE_CMAKE_TOOLCHAIN_FILE="$OECORE_NATIVE_SYSROOT/usr/share/cmake/OEToolchainConfig.cmake"
-export OE_CMAKE_FIND_LIBRARY_CUSTOM_LIB_SUFFIX="`echo $OECORE_BASELIB | sed -e s/lib//`"
diff --git a/meta/recipes-devtools/cmake/cmake_3.19.5.bb b/meta/recipes-devtools/cmake/cmake_3.19.6.bb
similarity index 78%
rename from meta/recipes-devtools/cmake/cmake_3.19.5.bb
rename to meta/recipes-devtools/cmake/cmake_3.19.6.bb
index 64c92b89f2..8cf4c617ac 100644
--- a/meta/recipes-devtools/cmake/cmake_3.19.5.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.19.6.bb
@@ -4,11 +4,12 @@ inherit cmake bash-completion
 
 DEPENDS += "curl expat zlib libarchive xz ncurses bzip2"
 
-SRC_URI_append_class-nativesdk = " \
-    file://OEToolchainConfig.cmake \
-    file://environment.d-cmake.sh \
-    file://0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch \
-"
+SRC_URI += "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
+           file://0002-cmake-Prevent-the-detection-of-Qt5.patch \
+           file://0003-cmake-support-OpenEmbedded-Qt4-tool-binary-names.patch \
+           file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
+           file://0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch \
+           "
 
 # Strip ${prefix} from ${docdir}, set result into docdir_stripped
 python () {
-- 
2.17.1


--===============5836626875915487236==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1438 entries from dependency cache.
Parsing recipes...WARNING: /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.19.5.bb: Unable to get checksum for cmake-native SRC_URI entry OEToolchainConfig.cmake: file could not be found
WARNING: /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.19.5.bb: Unable to get checksum for cmake-native SRC_URI entry environment.d-cmake.sh: file could not be found
done.
Parsing of 814 .bb files complete (812 cached, 2 parsed). 1438 targets, 31 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-8dda8c26ee0a577b7a39be10c1335abe8641104e"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8dda8c26ee0a577b7a39be10c1335abe8641104e"
workspace            = "master:eec64066073428e38d5b0b6947ff302943188f65"

Initialising tasks...done.
Sstate summary: Wanted 234 Local 177 Network 0 Missed 57 Current 466 (75% match, 91% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 479 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 496 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_setscene)
NOTE: Running setscene task 504 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_setscene)
NOTE: Running setscene task 515 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 524 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_package_setscene)
NOTE: Running setscene task 525 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 574 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 619 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 639 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 640 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 645 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 646 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 647 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 648 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 649 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 659 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 660 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 661 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 662 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 663 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 664 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 665 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-28-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_247.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 673 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_247.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 674 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 675 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 676 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 677 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 678 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 679 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-28-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 680 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 681 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 682 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 694 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_fetch)
NOTE: Running task 700 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.19.5.bb:do_fetch)
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 813 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 834 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_write_config)
NOTE: recipe kmod-28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cmake-native-3.19.5-r0: task do_fetch: Started
NOTE: Running task 889 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_fetch)
NOTE: Running task 893 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_fetch)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 910 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_fetch)
NOTE: Running setscene task 683 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 684 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.2.10-r0: task do_fetch: Started
NOTE: Running task 924 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_fetch)
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_fetch: Succeeded
NOTE: Running setscene task 685 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 686 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 687 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 688 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 689 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 968 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_unpack)
NOTE: Running task 982 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe wayland-1.19.0-r0: task do_fetch: Started
NOTE: Running task 1037 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_write_config)
NOTE: Running task 1042 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_warn_musl)
NOTE: Running task 1043 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_write_config)
NOTE: recipe wayland-1.19.0-r0: task do_write_config: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_fetch: Succeeded
NOTE: Running task 1087 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_write_config)
NOTE: Running task 1102 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_unpack)
WARNING: cmake-native-3.19.5-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.19.5.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.19.5-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.19.5.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.19.5.tar.gz_bad-checksum_c432296eb5dec6d71eae15d140f6297d63df44e9ffe3e453628d1dc8fc4201ce
NOTE: recipe libxkbcommon-1.0.3-r0: task do_fetch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_setscene: Started
NOTE: Running task 1157 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_unpack)
NOTE: recipe wayland-1.19.0-r0: task do_write_config: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_fetch: Started
NOTE: Running task 1186 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_fetch)
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe dbus-1.12.20-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_fetch: Started
NOTE: Running task 1233 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_unpack)
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_unpack: Started
NOTE: recipe systemd-1_247.3-r0: task do_fetch: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_setscene: Succeeded
NOTE: Running task 1318 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.19.6.bb:do_fetch)
NOTE: Running setscene task 690 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_247.3-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_write_config: Started
NOTE: recipe wayland-1.19.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_fetch: Succeeded
NOTE: Running task 1356 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_unpack)
NOTE: Running task 1357 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_unpack)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_unpack: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_fetch: Started
NOTE: Running task 1405 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_fetch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_247.3-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_write_config: Succeeded
NOTE: recipe systemd-1_247.3-r0: task do_warn_musl: Started
NOTE: Running setscene task 691 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe systemd-1_247.3-r0: task do_warn_musl: Succeeded
NOTE: Running task 1427 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 1428 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_fetch)
NOTE: Running task 1434 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_fetch)
NOTE: recipe dbus-test-1.12.20-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_unpack: Succeeded
NOTE: Running task 1456 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_unpack)
NOTE: recipe dbus-1.12.20-r0: task do_unpack: Started
NOTE: Running task 1457 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_patch)
NOTE: recipe cmake-3.19.6-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_247.3-r0: task do_write_config: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 692 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_write_config: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 693 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 694 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 695 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 696 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 697 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-compat-units-1.0-r29: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cmake-3.19.6-r0: task do_fetch: Succeeded
NOTE: Running task 1533 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.19.6.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_unpack: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_fetch: Started
NOTE: Running task 1643 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: recipe dbus-1.12.20-r0: task do_unpack: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_fetch: Started
NOTE: Running task 1666 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_patch)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_fetch: Started
NOTE: recipe procps-3.3.16-r0: task do_fetch: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_unpack: Started
NOTE: recipe systemd-1_247.3-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_fetch: Succeeded
NOTE: Running task 1697 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_fetch: Succeeded
NOTE: Running task 1732 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_unpack)
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_fetch: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1751 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_unpack)
NOTE: Running task 1753 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_unpack)
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 1788 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_patch)
NOTE: recipe cmake-3.19.6-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1840 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_patch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to d67e3de5f8350a86cf476b028fe4ba472fe80d9ea60681f4820dc1066b989feb
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_unpack: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_write_config: Started
NOTE: Running task 1897 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_patch)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_unpack: Started
NOTE: recipe dbus-1.12.20-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_write_config: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_patch: Started
NOTE: recipe procps-3.3.16-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_patch: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 698 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 699 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1911 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_patch)
NOTE: recipe dbus-test-1.12.20-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1912 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe procps-3.3.16-r0: task do_unpack: Succeeded
NOTE: Running task 1913 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.16.bb:do_patch)
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_patch: Succeeded
NOTE: Running task 1914 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_generate_toolchain_file)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_unpack: Succeeded
NOTE: Running task 1916 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_patch)
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_patch: Started
NOTE: recipe wayland-1.19.0-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_patch: Started
NOTE: recipe procps-3.3.16-r0: task do_patch: Started
NOTE: recipe expat-2.2.10-r0: task do_generate_toolchain_file: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_patch: Started
NOTE: recipe expat-2.2.10-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_patch: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_patch: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_patch: Succeeded
NOTE: recipe procps-3.3.16-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_247.3-r0: task do_unpack: Succeeded
NOTE: Running task 2011 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.3.bb:do_patch)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_unpack: Succeeded
NOTE: Running task 2013 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_patch)
NOTE: recipe systemd-1_247.3-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_patch: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 700 of 700 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_247.3-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe cmake-3.19.6-r0: task do_unpack: Succeeded
NOTE: Running task 2079 of 2219 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.19.6.bb:do_patch)
NOTE: recipe cmake-3.19.6-r0: task do_patch: Started
ERROR: cmake-3.19.6-r0 do_patch: Command Error: 'quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cmake/3.19.6-r0/recipe-sysroot-native/etc/quiltrc push' exited with 0  Output:
stdout: Patch 0002-cmake-Prevent-the-detection-of-Qt5.patch is already applied; check your series file

stderr: 
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/cmake/3.19.6-r0/temp/log.do_patch.19093
NOTE: recipe cmake-3.19.6-r0: task do_patch: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.19.6.bb:do_patch) failed with exit code '1'
WARNING: cmake-native-3.19.5-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.19.5.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.19.5-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.19.5.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.19.5.tar.gz_bad-checksum_c432296eb5dec6d71eae15d140f6297d63df44e9ffe3e453628d1dc8fc4201ce
WARNING: cmake-native-3.19.5-r0 do_fetch: Checksum failure encountered with download of https://cmake.org/files/v3.19/cmake-3.19.5.tar.gz - will attempt other sources if available
WARNING: cmake-native-3.19.5-r0 do_fetch: Checksum mismatch for local file /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.19.5.tar.gz
Cleaning and trying again.
WARNING: cmake-native-3.19.5-r0 do_fetch: Renaming /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.19.5.tar.gz to /home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.19.5.tar.gz_bad-checksum_c432296eb5dec6d71eae15d140f6297d63df44e9ffe3e453628d1dc8fc4201ce
ERROR: cmake-native-3.19.5-r0 do_fetch: Checksum failure fetching https://cmake.org/files/v3.19/cmake-3.19.5.tar.gz
ERROR: cmake-native-3.19.5-r0 do_fetch: Fetcher failure for URL: 'https://cmake.org/files/v3.19/cmake-3.19.5.tar.gz'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/cmake-3.19.5.tar.gz' has sha256 checksum c432296eb5dec6d71eae15d140f6297d63df44e9ffe3e453628d1dc8fc4201ce when ec87ab67c45f47c4285f204280c5cde48e1c920cfcfed1555b27fb3b1a1d20ba was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[sha256sum] = "c432296eb5dec6d71eae15d140f6297d63df44e9ffe3e453628d1dc8fc4201ce"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/cmake-native/3.19.5-r0/temp/log.do_fetch.16384
NOTE: recipe cmake-native-3.19.5-r0: task do_fetch: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.19.5.bb:do_fetch) failed with exit code '1'
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_patch: Succeeded
NOTE: Tasks Summary: Attempted 2079 tasks of which 2034 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake_3.19.6.bb:do_patch
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.19.5.bb:do_fetch
Summary: There were 9 WARNING messages shown.
Summary: There were 3 ERROR messages shown, returning a non-zero exit code.

--===============5836626875915487236==--
