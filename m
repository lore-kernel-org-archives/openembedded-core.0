Return-Path: <maxin.john@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 6E6D17867C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 08:34:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Feb 2018 00:34:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,534,1511856000"; d="scan'208";a="18705578"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga007.fm.intel.com with ESMTP; 19 Feb 2018 00:34:52 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 5A23658030D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 00:34:51 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Feb 2018 10:36:52 +0200
Message-Id: <1519029438-11092-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
References: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 01/27] pkgconf: upgrade to version 1.4.2
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
X-List-Received-Date: Mon, 19 Feb 2018 08:34:53 -0000

pkgconf improved compatibility with freedesktop.org pkg-config.
So, we don't need to unset PKG_CONFIG_SYSROOT_DIR in wrappers.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-devtools/pkgconf/pkgconf/pkg-config-esdk.in         | 4 +---
 meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in       | 1 -
 meta/recipes-devtools/pkgconf/pkgconf/pkg-config-wrapper         | 9 ---------
 .../pkgconf/{pkgconf_1.4.0.bb => pkgconf_1.4.2.bb}               | 4 ++--
 4 files changed, 3 insertions(+), 15 deletions(-)
 rename meta/recipes-devtools/pkgconf/{pkgconf_1.4.0.bb => pkgconf_1.4.2.bb} (95%)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-esdk.in b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-esdk.in
index 4fc9b0a..d4ac71d 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-esdk.in
+++ b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-esdk.in
@@ -5,7 +5,6 @@
 if [ "pkg-config-native" = "`basename $0`" ] ; then
 	PKG_CONFIG_PATH="@PATH_NATIVE@"
 	PKG_CONFIG_LIBDIR="@LIBDIR_NATIVE@"
-	unset PKG_CONFIG_SYSROOT_DIR
 else
 	# in this case check if we are in the esdk
 	if [ "$OE_SKIP_SDK_CHECK" = "1" ] ; then
@@ -16,9 +15,8 @@ else
 		if ( echo $parentpid_info | grep -q check-lxdialog ) ; then
 			PKG_CONFIG_PATH="@PATH_NATIVE@"
 			PKG_CONFIG_LIBDIR="@LIBDIR_NATIVE@"
-			unset PKG_CONFIG_SYSROOT_DIR
 		fi
 	fi
 fi
 
-pkg-config.real "$@"
+pkg-config "$@"
diff --git a/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in
index 9ed30a0..c2e86e5 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in
+++ b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in
@@ -1,6 +1,5 @@
 #! /bin/sh
 
 PKG_CONFIG_PATH="@PATH_NATIVE@"
-unset PKG_CONFIG_SYSROOT_DIR
 
 pkg-config "$@"
diff --git a/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-wrapper b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-wrapper
index 695f349..fc9b488 100755
--- a/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-wrapper
+++ b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-wrapper
@@ -4,13 +4,4 @@
 # Copyright (C) 2015 Christopher Larson <chris_larson@mentor.com>
 # License: MIT (see COPYING.MIT at the root of the repository for terms)
 
-for arg; do
-    case "$arg" in
-        --variable|--variable=*)
-            # pkg-config doesn't sysroot-prefix user variables
-            unset PKG_CONFIG_SYSROOT_DIR
-            ;;
-    esac
-done
-
 exec pkgconf "$@"
diff --git a/meta/recipes-devtools/pkgconf/pkgconf_1.4.0.bb b/meta/recipes-devtools/pkgconf/pkgconf_1.4.2.bb
similarity index 95%
rename from meta/recipes-devtools/pkgconf/pkgconf_1.4.0.bb
rename to meta/recipes-devtools/pkgconf/pkgconf_1.4.2.bb
index 48ba598..ea7b666 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf_1.4.0.bb
+++ b/meta/recipes-devtools/pkgconf/pkgconf_1.4.2.bb
@@ -21,8 +21,8 @@ SRC_URI = "\
     file://pkg-config-native.in \
     file://pkg-config-esdk.in \
 "
-SRC_URI[md5sum] = "c509c0dad5a70aa4bc3210557b7eafce"
-SRC_URI[sha256sum] = "1d112ff35dad516ffbfbdb013df3a035140618fe7632ec44ffa894a9c713301b"
+SRC_URI[md5sum] = "678d242b4eef1754bba6a58642af10bb"
+SRC_URI[sha256sum] = "bab39371d4ab972be1d539a8b10b6cc21f8eafc97f617102e667e82bd32eb234"
 
 inherit autotools update-alternatives
 
-- 
2.4.0


