Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.357.1615826521192946096
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 09:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 9EFBD38C1375
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 16:42:01 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-loader: upgrading to 1.2.170.0 FAILED
Message-ID: <MADEUP.166C91A9268D8243.27320@lists.openembedded.org>
X-Groupsio-MsgNum: 149509
Content-Type: multipart/mixed; boundary="===============5508285993268164991=="

--===============5508285993268164991==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-loader* to *1.2.170.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-vulkan-loader-upgrade-1.2.162.0-1.2.170.0.patch
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

--===============5508285993268164991==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-vulkan-loader-upgrade-1.2.162.0-1.2.170.0.patch"

From a841f9009003f369f763d9fa32cfbdf2c00f3e6e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Mar 2021 12:54:24 +0000
Subject: [PATCH] vulkan-loader: upgrade 1.2.162.0 -> 1.2.170.0

---
 ...name-LIB_SUFFIX-to-VULKAN_LIB_SUFFIX.patch | 40 -------------------
 ....2.162.0.bb => vulkan-loader_1.2.170.0.bb} |  6 +--
 2 files changed, 2 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-graphics/vulkan/vulkan-loader/0001-Rename-LIB_SUFFIX-to-VULKAN_LIB_SUFFIX.patch
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.2.162.0.bb => vulkan-loader_1.2.170.0.bb} (87%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader/0001-Rename-LIB_SUFFIX-to-VULKAN_LIB_SUFFIX.patch b/meta/recipes-graphics/vulkan/vulkan-loader/0001-Rename-LIB_SUFFIX-to-VULKAN_LIB_SUFFIX.patch
deleted file mode 100644
index 26b1a40f26..0000000000
--- a/meta/recipes-graphics/vulkan/vulkan-loader/0001-Rename-LIB_SUFFIX-to-VULKAN_LIB_SUFFIX.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 5ae24ece75f2caa69216da7075334711642f5588 Mon Sep 17 00:00:00 2001
-From: Michel Zou <xantares09@hotmail.com>
-Date: Wed, 16 Dec 2020 15:03:23 +0100
-Subject: [PATCH] Rename LIB_SUFFIX to VULKAN_LIB_SUFFIX
-
-Closes #527
-
-Upstream-Status: Backport [https://github.com/KhronosGroup/Vulkan-Loader/commit/66a23ac8c566299343668f094de50798a5f4a0e4]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- loader/CMakeLists.txt | 2 +-
- loader/vulkan.pc.in   | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/loader/CMakeLists.txt b/loader/CMakeLists.txt
-index 659511855..ba9f460f1 100644
---- a/loader/CMakeLists.txt
-+++ b/loader/CMakeLists.txt
-@@ -327,7 +327,7 @@ if(PKG_CONFIG_FOUND)
-         set(PRIVATE_LIBS "${PRIVATE_LIBS} -l${LIB}")
-     endforeach()
-     if(WIN32)
--        set(LIB_SUFFIX "-1")
-+        set(VULKAN_LIB_SUFFIX "-1")
-     endif ()
-     configure_file("vulkan.pc.in" "vulkan.pc" @ONLY)
-     install(FILES "${CMAKE_CURRENT_BINARY_DIR}/vulkan.pc" DESTINATION "${CMAKE_INSTALL_LIBDIR}/pkgconfig")
-diff --git a/loader/vulkan.pc.in b/loader/vulkan.pc.in
-index fc17cb1f3..44049ee34 100644
---- a/loader/vulkan.pc.in
-+++ b/loader/vulkan.pc.in
-@@ -6,7 +6,7 @@ includedir=@CMAKE_INSTALL_FULL_INCLUDEDIR@
- Name: @CMAKE_PROJECT_NAME@
- Description: Vulkan Loader
- Version: @VK_API_VERSION@
--Libs: -L${libdir} -lvulkan@LIB_SUFFIX@
-+Libs: -L${libdir} -lvulkan@VULKAN_LIB_SUFFIX@
- Libs.private: @PRIVATE_LIBS@
- Cflags: -I${includedir}
- 
diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.162.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.170.0.bb
similarity index 87%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.2.162.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.2.170.0.bb
index d39e7af975..492651c86b 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.2.162.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.2.170.0.bb
@@ -9,10 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git \
-           file://0001-Rename-LIB_SUFFIX-to-VULKAN_LIB_SUFFIX.patch \
-           "
-SRCREV = "7a313093b5c4af964d50a5a64e73d7df6152ea3f"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git"
+SRCREV = "c5678a03db383fd0dc5bfb8e9a383043bdbcb57b"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


--===============5508285993268164991==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1438 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (813 cached, 1 parsed). 1438 targets, 31 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.2+snapshot-d8c866bbf5b08b8da90b91ae09d60ec0a0dca1dc"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d8c866bbf5b08b8da90b91ae09d60ec0a0dca1dc"
workspace            = "master:eec64066073428e38d5b0b6947ff302943188f65"

Initialising tasks...done.
Sstate summary: Wanted 215 Local 206 Network 0 Missed 9 Current 520 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1570 of 2317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.170.0.bb:do_fetch)
NOTE: recipe vulkan-loader-1.2.170.0-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.2.170.0-r0: task do_fetch: Succeeded
NOTE: Running task 2303 of 2317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.170.0.bb:do_unpack)
NOTE: Running task 2304 of 2317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.170.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-loader-1.2.170.0-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.2.170.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vulkan-loader-1.2.170.0-r0: task do_unpack: Succeeded
NOTE: Running task 2305 of 2317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.170.0.bb:do_patch)
NOTE: recipe vulkan-loader-1.2.170.0-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.2.170.0-r0: task do_patch: Succeeded
NOTE: Running task 2306 of 2317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.170.0.bb:do_generate_toolchain_file)
NOTE: Running task 2307 of 2317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.170.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2308 of 2317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.170.0.bb:do_populate_lic)
NOTE: recipe vulkan-loader-1.2.170.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vulkan-loader-1.2.170.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe vulkan-loader-1.2.170.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe vulkan-loader-1.2.170.0-r0: task do_populate_lic: Started
NOTE: recipe vulkan-loader-1.2.170.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-loader-1.2.170.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe vulkan-loader-1.2.170.0-r0: task do_populate_lic: Succeeded
NOTE: Running task 2309 of 2317 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.170.0.bb:do_configure)
NOTE: recipe vulkan-loader-1.2.170.0-r0: task do_configure: Started
ERROR: vulkan-loader-1.2.170.0-r0 do_configure: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.170.0-r0/temp/run.do_configure.22878' failed with exit code 1:
-- The C compiler identification is GNU 10.2.0
-- The CXX compiler identification is GNU 10.2.0
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.170.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.170.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Could NOT find VulkanHeaders (missing: VulkanHeaders_INCLUDE_DIR) 
-- Could NOT find VulkanRegistry (missing: VulkanRegistry_DIR) 
CMake Error at cmake/FindVulkanHeaders.cmake:114 (file):
  file STRINGS file
  "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.170.0-r0/git/VulkanHeaders_INCLUDE_DIR-NOTFOUND/vulkan/vulkan.h"
  cannot be read.
Call Stack (most recent call first):
  CMakeLists.txt:55 (find_package)


-- Detected Vulkan Version 0.0.0
CMake Error at CMakeLists.txt:57 (message):
  Could not find Vulkan headers path.  This can be fixed by setting
  VULKAN_HEADERS_INSTALL_DIR to an installation of the Vulkan-Headers
  repository.


-- Configuring incomplete, errors occurred!
See also "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.170.0-r0/build/CMakeFiles/CMakeOutput.log".
WARNING: exit code 1 from a shell command.

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.170.0-r0/temp/log.do_configure.22878
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.2.162.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.10.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cr
 oss_10.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.33.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.19.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.66.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['libx11', 'vulkan-headers', 'libxcb', 'ninja-native', 'pseudo-native', 'gcc-runtime', 'patch-native', 'gcc-cross-i686', 'glibc', 'wayland', 'libxrandr', 'cmake-native', 'quilt-native', 'xtrans', 'xorgproto', 'util-macros', 'zlib-native', 'bzip2-native', 'curl-native', 'xz-native', 'ncurses-native', 'libpthread-stubs', 'xcb-proto', 'libxdmcp', 'libxau', 're2c-native', 'libxrender', 'libxext', 'libtool-native', 'automake-native', 'autoconf-native', 'attr-native', 'libmpc-native', 'linux-libc-headers', 'texinfo-dummy-native', 'gnu-config-native', 'gmp-native', 'binutils-cross-i686', 'mpfr-native', 'flex-native', 'libffi', 'expat', 'libxml2', 'libgcc', 'openssl-native', 'pkgconfig-native', 'gettext-minimal-native', 'm4-native', 'zlib', 'python3', 'libnsl2', 'gdbm', 'xz', 'libxcrypt', 'opkg-utils', 'bzip2', 'readline', 'libtirpc', 'sqlite3', 'util-linux', 'openssl', 'ncurses', 'libpam', 'libcap-ng', 'bash-completion', 'util-linux-uuid', 'fle
 x', 'cracklib']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| -- The C compiler identification is GNU 10.2.0
| -- The CXX compiler identification is GNU 10.2.0
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Check for working C compiler: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.170.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc - skipped
| -- Detecting C compile features
| -- Detecting C compile features - done
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working CXX compiler: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.170.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ - skipped
| -- Detecting CXX compile features
| -- Detecting CXX compile features - done
| -- Could NOT find VulkanHeaders (missing: VulkanHeaders_INCLUDE_DIR)
| -- Could NOT find VulkanRegistry (missing: VulkanRegistry_DIR)
| CMake Error at cmake/FindVulkanHeaders.cmake:114 (file):
|   file STRINGS file
|   "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.170.0-r0/git/VulkanHeaders_INCLUDE_DIR-NOTFOUND/vulkan/vulkan.h"
|   cannot be read.
| Call Stack (most recent call first):
|   CMakeLists.txt:55 (find_package)
| 
| 
| -- Detected Vulkan Version 0.0.0
| CMake Error at CMakeLists.txt:57 (message):
|   Could not find Vulkan headers path.  This can be fixed by setting
|   VULKAN_HEADERS_INSTALL_DIR to an installation of the Vulkan-Headers
|   repository.
| 
| 
| -- Configuring incomplete, errors occurred!
| See also "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.170.0-r0/build/CMakeFiles/CMakeOutput.log".
| WARNING: exit code 1 from a shell command.
| ERROR: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.170.0-r0/temp/run.do_configure.22878' failed with exit code 1:
| -- The C compiler identification is GNU 10.2.0
| -- The CXX compiler identification is GNU 10.2.0
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Check for working C compiler: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.170.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-gcc - skipped
| -- Detecting C compile features
| -- Detecting C compile features - done
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working CXX compiler: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.170.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/i686-poky-linux-g++ - skipped
| -- Detecting CXX compile features
| -- Detecting CXX compile features - done
| -- Could NOT find VulkanHeaders (missing: VulkanHeaders_INCLUDE_DIR)
| -- Could NOT find VulkanRegistry (missing: VulkanRegistry_DIR)
| CMake Error at cmake/FindVulkanHeaders.cmake:114 (file):
|   file STRINGS file
|   "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.170.0-r0/git/VulkanHeaders_INCLUDE_DIR-NOTFOUND/vulkan/vulkan.h"
|   cannot be read.
| Call Stack (most recent call first):
|   CMakeLists.txt:55 (find_package)
| 
| 
| -- Detected Vulkan Version 0.0.0
| CMake Error at CMakeLists.txt:57 (message):
|   Could not find Vulkan headers path.  This can be fixed by setting
|   VULKAN_HEADERS_INSTALL_DIR to an installation of the Vulkan-Headers
|   repository.
| 
| 
| -- Configuring incomplete, errors occurred!
| See also "/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/vulkan-loader/1.2.170.0-r0/build/CMakeFiles/CMakeOutput.log".
| WARNING: exit code 1 from a shell command.
| 
NOTE: recipe vulkan-loader-1.2.170.0-r0: task do_configure: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.170.0.bb:do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2309 tasks of which 2301 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.2.170.0.bb:do_configure
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============5508285993268164991==--
