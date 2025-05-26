Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E314DC5AD49
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 19:34:53 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.35979.1748288089698438437
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 May 2025 12:34:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=waeyVIGE;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20250526193446b4de041810f850f322-lymk8v@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20250526193446b4de041810f850f322
        for <openembedded-core@lists.openembedded.org>;
        Mon, 26 May 2025 21:34:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=NHxRc9qNTrSlLuCdZ8IlrCKsivHWW1+8GbhFzeT1FRk=;
 b=waeyVIGExAlJq7CTZbHMAqxRh27E6qjjYpLmUn79pDXLX8HdIAF55GaSB0PjPqPWgyorvW
 76WqZ7EkhVx7ot5uOVyvBxzgZxh8S/xgQZQL1ZzhBXjrJDG2cDszwSEvvgwI5c8izPGPeAzN
 Xa+80rV0NXBmNFQpmnZ+Wz1FlKh65sTzbUuzsyLSrbKZIthfjaysMwaBRjtXgjDookx9UgId
 ur2zqkQ+PeAzhlm1nC8bTW8vJa9/5en2QgUSjWMXQTvmt98tuBCX5icVXNWZ13/coyOJjC8i
 iMXa73KHIUDzWoFibqwN2gDBuhldeeL7R/6RlP37171+BGZ4S8vjWWrQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] libxml2: revert commit breaking patchs in cmake file
Date: Mon, 26 May 2025 21:33:58 +0200
Message-Id: <20250526193358.2239462-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 19:34:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217275

From: Peter Marko <peter.marko@siemens.com>

Make a revert of commit which breaks cross-compilation of depending
components.
This commit changes path calculation from relative to cmake file to
absolute from includedir, which points then the host /usr/include.
Submitted upstream ticket [1] to clarify how this should be fixed in
libxml2 upstream.

[1] https://gitlab.gnome.org/GNOME/libxml2/-/issues/898#note_2452864

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...-installation-directories-in-libxml2.patch | 81 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.14.3.bb    |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch

diff --git a/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch b/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
new file mode 100644
index 0000000000..6ea5adafa2
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch
@@ -0,0 +1,81 @@
+From 55ed199fdb55a1a600616ba14ad0feedcf828d86 Mon Sep 17 00:00:00 2001
+From: Peter Marko <peter.marko@siemens.com>
+Date: Mon, 26 May 2025 21:11:14 +0200
+Subject: [PATCH] Revert "cmake: Fix installation directories in
+ libxml2-config.cmake"
+
+This reverts commit 75dde50b20215a2a3a445b62f36a67c8ed337cab.
+
+Upstream-Status: Inappropriate [upstream ticket https://gitlab.gnome.org/GNOME/libxml2/-/issues/898#note_2452864]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ configure.ac            | 11 -----------
+ libxml2-config.cmake.in | 11 +++++++----
+ meson.build             |  3 ---
+ 3 files changed, 7 insertions(+), 18 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 40e75151..d21ebfe5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1061,17 +1061,6 @@ AC_SUBST(XML_PRIVATE_LIBS)
+ AC_SUBST(XML_PRIVATE_CFLAGS)
+ AC_SUBST(XML_INCLUDEDIR)
+ 
+-# for libxml2-config.cmake.in
+-AX_RECURSIVE_EVAL(["$bindir"], [INSTALL_BINDIR])
+-AX_RECURSIVE_EVAL(["$includedir"], [INSTALL_INCLUDEDIR])
+-AX_RECURSIVE_EVAL(["$libdir"], [INSTALL_LIBDIR])
+-AC_SUBST(INSTALL_BINDIR)
+-AC_SUBST(INSTALL_INCLUDEDIR)
+-AC_SUBST(INSTALL_LIBDIR)
+-AM_SUBST_NOTMAKE(INSTALL_BINDIR)
+-AM_SUBST_NOTMAKE(INSTALL_INCLUDEDIR)
+-AM_SUBST_NOTMAKE(INSTALL_LIBDIR)
+-
+ AX_RECURSIVE_EVAL(["$sysconfdir"], [XML_SYSCONFDIR])
+ AC_DEFINE_UNQUOTED([XML_SYSCONFDIR], ["$XML_SYSCONFDIR"],
+                    [System configuration directory (/etc)])
+diff --git a/libxml2-config.cmake.in b/libxml2-config.cmake.in
+index 4945dda4..31036805 100644
+--- a/libxml2-config.cmake.in
++++ b/libxml2-config.cmake.in
+@@ -24,17 +24,20 @@
+ #   LibXml2::LibXml2          - the LibXml2 library
+ #   LibXml2::xmllint          - the xmllint command-line executable
+ 
++get_filename_component(_libxml2_rootdir ${CMAKE_CURRENT_LIST_DIR}/../../../ ABSOLUTE)
++
+ set(LIBXML2_VERSION_MAJOR  @LIBXML_MAJOR_VERSION@)
+ set(LIBXML2_VERSION_MINOR  @LIBXML_MINOR_VERSION@)
+ set(LIBXML2_VERSION_MICRO  @LIBXML_MICRO_VERSION@)
+ set(LIBXML2_VERSION_STRING "@VERSION@")
+ set(LIBXML2_DEFINITIONS    "@XML_CFLAGS@")
+-set(LIBXML2_INCLUDE_DIR    @INSTALL_INCLUDEDIR@/libxml2)
+-set(LIBXML2_LIBRARY_DIR    @INSTALL_LIBDIR@)
++set(LIBXML2_INSTALL_PREFIX ${_libxml2_rootdir})
++set(LIBXML2_INCLUDE_DIR    ${_libxml2_rootdir}/include/libxml2)
++set(LIBXML2_LIBRARY_DIR    ${_libxml2_rootdir}/lib)
+ 
+ find_library(LIBXML2_LIBRARY NAMES xml2 HINTS ${LIBXML2_LIBRARY_DIR} NO_DEFAULT_PATH)
+-find_program(LIBXML2_XMLCATALOG_EXECUTABLE NAMES xmlcatalog HINTS @INSTALL_BINDIR@ NO_DEFAULT_PATH)
+-find_program(LIBXML2_XMLLINT_EXECUTABLE NAMES xmllint HINTS @INSTALL_BINDIR@ NO_DEFAULT_PATH)
++find_program(LIBXML2_XMLCATALOG_EXECUTABLE NAMES xmlcatalog HINTS ${_libxml2_rootdir}/bin NO_DEFAULT_PATH)
++find_program(LIBXML2_XMLLINT_EXECUTABLE NAMES xmllint HINTS ${_libxml2_rootdir}/bin NO_DEFAULT_PATH)
+ 
+ set(LIBXML2_LIBRARIES ${LIBXML2_LIBRARY})
+ set(LIBXML2_INCLUDE_DIRS ${LIBXML2_INCLUDE_DIR})
+diff --git a/meson.build b/meson.build
+index 4c59211d..3e5f25d3 100644
+--- a/meson.build
++++ b/meson.build
+@@ -599,9 +599,6 @@ config_cmake = configuration_data()
+ config_cmake.set('LIBXML_MAJOR_VERSION', v_maj)
+ config_cmake.set('LIBXML_MINOR_VERSION', v_min)
+ config_cmake.set('LIBXML_MICRO_VERSION', v_mic)
+-config_cmake.set('INSTALL_BINDIR', dir_bin)
+-config_cmake.set('INSTALL_INCLUDEDIR', dir_include)
+-config_cmake.set('INSTALL_LIBDIR', dir_lib)
+ config_cmake.set('VERSION', meson.project_version())
+ config_cmake.set('WITH_HTTP', want_http.to_int().to_string())
+ config_cmake.set('WITH_ICONV', want_iconv.to_int().to_string())
diff --git a/meta/recipes-core/libxml/libxml2_2.14.3.bb b/meta/recipes-core/libxml/libxml2_2.14.3.bb
index d5d144f793..da75cbe450 100644
--- a/meta/recipes-core/libxml/libxml2_2.14.3.bb
+++ b/meta/recipes-core/libxml/libxml2_2.14.3.bb
@@ -17,6 +17,7 @@ inherit gnomebase
 SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testtar \
            file://run-ptest \
            file://install-tests.patch \
+           file://0001-Revert-cmake-Fix-installation-directories-in-libxml2.patch \
            "
 
 SRC_URI[archive.sha256sum] = "6de55cacc8c2bc758f2ef6f93c313cb30e4dd5d84ac5d3c7ccbd9344d8cc6833"

