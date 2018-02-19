Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8A8D17887D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 08:34:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Feb 2018 00:34:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,534,1511856000"; d="scan'208";a="21241465"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 19 Feb 2018 00:34:55 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 76AB85802D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 00:34:54 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Feb 2018 10:36:55 +0200
Message-Id: <1519029438-11092-5-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
References: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 04/27] webkitgtk: remove PKG_CONFIG_SYSROOT_DIR work-around
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
X-List-Received-Date: Mon, 19 Feb 2018 08:34:55 -0000

We are moving from freedesktop.org's pkg-config to pkgconf. This enables
us to remove the following patch as PKG_CONFIG_SYSROOT_DIR behaves
consistently with pkgconf:

        1. 0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...Introspection.cmake-prefix-variables-obta.patch | 27 ----------------------
 meta/recipes-sato/webkit/webkitgtk_2.18.6.bb       |  1 -
 2 files changed, 28 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
deleted file mode 100644
index fae3b0b..0000000
--- a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 317a5ac120c44987219bc03486cd2f2d1842c9b9 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 27 Oct 2015 16:02:19 +0200
-Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables obtained
- from pkg-config with PKG_CONFIG_SYSROOT_DIR
-
-Upstream-Status: Pending [review on oe-core list]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- Source/cmake/FindGObjectIntrospection.cmake | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Source/cmake/FindGObjectIntrospection.cmake b/Source/cmake/FindGObjectIntrospection.cmake
-index e1f49b4..03a4446 100644
---- a/Source/cmake/FindGObjectIntrospection.cmake
-+++ b/Source/cmake/FindGObjectIntrospection.cmake
-@@ -26,6 +26,7 @@ macro(_GIR_GET_PKGCONFIG_VAR _outvar _varname _extra_args)
-     else ()
-         string(REGEX REPLACE "[\r\n]" " " _result "${_result}")
-         string(REGEX REPLACE " +$" ""  _result "${_result}")
-+        string(CONCAT _result $ENV{PKG_CONFIG_SYSROOT_DIR} "${_result}")
-         separate_arguments(_result)
-         set(${_outvar} ${_result} CACHE INTERNAL "")
-     endif ()
--- 
-2.1.4
-
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.18.6.bb b/meta/recipes-sato/webkit/webkitgtk_2.18.6.bb
index ff0ff8f..f88306c 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.18.6.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.18.6.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d842
 		   "
 
 SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
-           file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch \
            file://0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch \
            file://0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch \
            file://0001-Fix-racy-parallel-build-of-WebKit2-4.0.gir.patch \
-- 
2.4.0


