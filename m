Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.23994.1608473714962596017
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:15:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id 13DB138C1349
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 14:15:15 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] shaderc: upgrading to 2020.4 SUCCEEDED
Message-ID: <MADEUP.165272529DEDEAC3.18165@lists.openembedded.org>
X-Groupsio-MsgNum: 145953
Content-Type: multipart/mixed; boundary="===============6497926481325258858=="

--===============6497926481325258858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *shaderc* to *2020.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-shaderc-upgrade-2020.3-2020.4.patch
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

--===============6497926481325258858==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-shaderc-upgrade-2020.3-2020.4.patch"

From 993e67b52aa2dce1e4b30375ffeb70b15bdddc1d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sun, 20 Dec 2020 09:00:49 +0000
Subject: [PATCH] shaderc: upgrade 2020.3 -> 2020.4

---
 ...ndor-libs-and-disable-git-versioning.patch | 19 +++++++------------
 .../{shaderc_2020.3.bb => shaderc_2020.4.bb}  |  2 +-
 2 files changed, 8 insertions(+), 13 deletions(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2020.3.bb => shaderc_2020.4.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/files/0003-cmake-de-vendor-libs-and-disable-git-versioning.patch b/meta/recipes-graphics/shaderc/files/0003-cmake-de-vendor-libs-and-disable-git-versioning.patch
index 0d58925adc..30a501a61e 100644
--- a/meta/recipes-graphics/shaderc/files/0003-cmake-de-vendor-libs-and-disable-git-versioning.patch
+++ b/meta/recipes-graphics/shaderc/files/0003-cmake-de-vendor-libs-and-disable-git-versioning.patch
@@ -1,11 +1,12 @@
-From e092619a9ef7910ad56acfb8728c66f0125d176a Mon Sep 17 00:00:00 2001
+From f5ab5533df5c6a0749aa45fb96e3777344dd5465 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sat, 17 Oct 2020 12:51:50 +0100
-Subject: [PATCH 3/3] cmake: de-vendor libs and disable git versioning
+Subject: [PATCH] cmake: de-vendor libs and disable git versioning
 
 Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+
 ---
  CMakeLists.txt              | 2 --
  glslc/CMakeLists.txt        | 1 -
@@ -14,18 +15,15 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 glslc/src/build-version.inc
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index a4e779b..cfa7bd8 100644
+index 5c74cd8..9451fbc 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -70,7 +70,6 @@ endif(MSVC)
+@@ -102,12 +102,10 @@ endif(MSVC)
  
  # Configure subdirectories.
  # We depend on these for later projects, so they should come first.
 -add_subdirectory(third_party)
  
- if(SHADERC_ENABLE_SPVC)
- add_subdirectory(libshaderc_spvc)
-@@ -79,7 +78,6 @@ endif()
  add_subdirectory(libshaderc_util)
  add_subdirectory(libshaderc)
  add_subdirectory(glslc)
@@ -34,10 +32,10 @@ index a4e779b..cfa7bd8 100644
  add_custom_target(build-version
    ${PYTHON_EXECUTABLE}
 diff --git a/glslc/CMakeLists.txt b/glslc/CMakeLists.txt
-index 0f5d888..08686e0 100644
+index 35b3f19..52006b8 100644
 --- a/glslc/CMakeLists.txt
 +++ b/glslc/CMakeLists.txt
-@@ -26,7 +26,6 @@ shaderc_default_compile_options(glslc_exe)
+@@ -53,7 +53,6 @@ shaderc_default_compile_options(glslc_exe)
  target_include_directories(glslc_exe PRIVATE ${CMAKE_CURRENT_BINARY_DIR}/.. ${spirv-tools_SOURCE_DIR}/include)
  set_target_properties(glslc_exe PROPERTIES OUTPUT_NAME glslc)
  target_link_libraries(glslc_exe PRIVATE glslc shaderc_util shaderc)
@@ -48,6 +46,3 @@ index 0f5d888..08686e0 100644
 diff --git a/glslc/src/build-version.inc b/glslc/src/build-version.inc
 new file mode 100644
 index 0000000..e69de29
--- 
-2.28.0
-
diff --git a/meta/recipes-graphics/shaderc/shaderc_2020.3.bb b/meta/recipes-graphics/shaderc/shaderc_2020.4.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2020.3.bb
rename to meta/recipes-graphics/shaderc/shaderc_2020.4.bb
index f5edf53caf..ee9b118371 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2020.3.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2020.4.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "1fce59794079f90ceb091190adbbb5499acd4e95"
+SRCREV = "0dbd899941a43ffd55df527d65128b3b66e75c9c"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-Fix-the-link-order-of-libglslang-and-libHLSL.patch \
            file://0003-cmake-de-vendor-libs-and-disable-git-versioning.patch \
-- 
2.20.1


--===============6497926481325258858==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/shaderc: PKGV changed from 2020.3 [default] to 2020.4 [default]
packages/core2-32-poky-linux/shaderc: PV changed from "2020.3" to "2020.4"
packages/core2-32-poky-linux/shaderc/shaderc-dbg: PKGV changed from 2020.3 [default] to 2020.4 [default]
packages/core2-32-poky-linux/shaderc/shaderc-dbg: PV changed from "2020.3" to "2020.4"
packages/core2-32-poky-linux/shaderc/shaderc-dev: PKGSIZE changed from 61064 to 61030 (-0%)
packages/core2-32-poky-linux/shaderc/shaderc-dev: PKGV changed from 2020.3 [default] to 2020.4 [default]
packages/core2-32-poky-linux/shaderc/shaderc-dev: PV changed from "2020.3" to "2020.4"
packages/core2-32-poky-linux/shaderc/shaderc-doc: PKGV changed from 2020.3 [default] to 2020.4 [default]
packages/core2-32-poky-linux/shaderc/shaderc-doc: PV changed from "2020.3" to "2020.4"
packages/core2-32-poky-linux/shaderc/shaderc-locale: PKGV changed from 2020.3 [default] to 2020.4 [default]
packages/core2-32-poky-linux/shaderc/shaderc-locale: PV changed from "2020.3" to "2020.4"
packages/core2-32-poky-linux/shaderc/shaderc-src: PKGSIZE changed from 314999 to 314965 (-0%)
packages/core2-32-poky-linux/shaderc/shaderc-src: PKGV changed from 2020.3 [default] to 2020.4 [default]
packages/core2-32-poky-linux/shaderc/shaderc-src: PV changed from "2020.3" to "2020.4"
packages/core2-32-poky-linux/shaderc/shaderc-staticdev: PKGSIZE changed from 2702940 to 2703040 (+0%)
packages/core2-32-poky-linux/shaderc/shaderc-staticdev: PKGV changed from 2020.3 [default] to 2020.4 [default]
packages/core2-32-poky-linux/shaderc/shaderc-staticdev: PV changed from "2020.3" to "2020.4"
packages/core2-32-poky-linux/shaderc/shaderc: PKGV changed from 2020.3 [default] to 2020.4 [default]
packages/core2-32-poky-linux/shaderc/shaderc: PV changed from "2020.3" to "2020.4"

--===============6497926481325258858==--
