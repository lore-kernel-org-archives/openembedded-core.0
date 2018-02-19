Return-Path: <maxin.john@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id E7EF6780BD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 08:34:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Feb 2018 00:35:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,534,1511856000"; d="scan'208";a="205329174"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 19 Feb 2018 00:35:00 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 76DCD5802D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 00:34:59 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Feb 2018 10:37:00 +0200
Message-Id: <1519029438-11092-10-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
References: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 09/27] libdnf: remove PKG_CONFIG_SYSROOT_DIR work-around
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Feb 2018 08:34:59 -0000

We are moving from freedesktop.org's pkg-config to pkgconf.
This helps us to remove the following patch as PKG_CONFIG_SYSROOT_DIR
behaves consistently with pkgconf:

 1) 0002-Prefix-sysroot-path-to-introspection-tools-path.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...-sysroot-path-to-introspection-tools-path.patch | 36 ----------------------
 meta/recipes-devtools/libdnf/libdnf_0.11.1.bb      |  1 -
 2 files changed, 37 deletions(-)
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/0002-Prefix-sysroot-path-to-introspection-tools-path.patch

diff --git a/meta/recipes-devtools/libdnf/libdnf/0002-Prefix-sysroot-path-to-introspection-tools-path.patch b/meta/recipes-devtools/libdnf/libdnf/0002-Prefix-sysroot-path-to-introspection-tools-path.patch
deleted file mode 100644
index 7eecc3d..0000000
--- a/meta/recipes-devtools/libdnf/libdnf/0002-Prefix-sysroot-path-to-introspection-tools-path.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From c8211ad99ccaa4af4a75e0ba639527267fcfd69e Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 30 Dec 2016 18:17:19 +0200
-Subject: [PATCH 2/4] Prefix sysroot path to introspection tools path.
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/libdnf/pull/312]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- libdnf/CMakeLists.txt | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libdnf/CMakeLists.txt b/libdnf/CMakeLists.txt
-index 63f07bf..837792b 100644
---- a/libdnf/CMakeLists.txt
-+++ b/libdnf/CMakeLists.txt
-@@ -133,7 +133,7 @@ if (GOBJECT_INTROSPECTION_FOUND)
-         set(GIR_TYPELIB "${GIR_PREFIX}.typelib")
- 
-         add_custom_command(OUTPUT ${GIR_XML}
--            COMMAND env CFLAGS=${CMAKE_C_FLAGS} ${GOBJECT_INTROSPECTION_1.0_G_IR_SCANNER}
-+            COMMAND env CFLAGS=${CMAKE_C_FLAGS} $ENV{PKG_CONFIG_SYSROOT_DIR}${GOBJECT_INTROSPECTION_1.0_G_IR_SCANNER}
-                     --namespace=Dnf
-                     --nsversion=${DNF_SO_VERSION}.0
-                     --library-path=${CMAKE_CURRENT_BINARY_DIR}
-@@ -153,7 +153,7 @@ if (GOBJECT_INTROSPECTION_FOUND)
-             WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR})
- 
-         add_custom_command(OUTPUT ${GIR_TYPELIB}
--            COMMAND ${GOBJECT_INTROSPECTION_1.0_G_IR_COMPILER}
-+            COMMAND $ENV{PKG_CONFIG_SYSROOT_DIR}${GOBJECT_INTROSPECTION_1.0_G_IR_COMPILER}
-                     -o ${GIR_TYPELIB}
-                     ${GIR_XML}
-             DEPENDS ${GIR_XML}
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.11.1.bb b/meta/recipes-devtools/libdnf/libdnf_0.11.1.bb
index 4fc1d6d..a79fcdf 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.11.1.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.11.1.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://github.com/rpm-software-management/libdnf \
            file://0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch \
-           file://0002-Prefix-sysroot-path-to-introspection-tools-path.patch \
            file://0003-Set-the-library-installation-directory-correctly.patch \
            file://0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch \
            file://0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch \
-- 
2.4.0


