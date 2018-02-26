Return-Path: <maxin.john@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 881307874E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 08:55:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Feb 2018 00:55:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,396,1515484800"; d="scan'208";a="207057661"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 26 Feb 2018 00:55:56 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id AEA3B580575
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 00:55:55 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Feb 2018 10:58:48 +0200
Message-Id: <1519635528-21824-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] pkgconf: revert changes to pkg-config-wrapper
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
X-List-Received-Date: Mon, 26 Feb 2018 08:55:55 -0000

To maintain the status quo, revert changes to pkgconf wrappers.
This helps to keep it compatible with freedesktop.org pkg-config.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-devtools/pkgconf/pkgconf/pkg-config-esdk.in   | 4 +++-
 meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in | 1 +
 meta/recipes-devtools/pkgconf/pkgconf/pkg-config-wrapper   | 9 +++++++++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-esdk.in b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-esdk.in
index d4ac71d..4fc9b0a 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-esdk.in
+++ b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-esdk.in
@@ -5,6 +5,7 @@
 if [ "pkg-config-native" = "`basename $0`" ] ; then
 	PKG_CONFIG_PATH="@PATH_NATIVE@"
 	PKG_CONFIG_LIBDIR="@LIBDIR_NATIVE@"
+	unset PKG_CONFIG_SYSROOT_DIR
 else
 	# in this case check if we are in the esdk
 	if [ "$OE_SKIP_SDK_CHECK" = "1" ] ; then
@@ -15,8 +16,9 @@ else
 		if ( echo $parentpid_info | grep -q check-lxdialog ) ; then
 			PKG_CONFIG_PATH="@PATH_NATIVE@"
 			PKG_CONFIG_LIBDIR="@LIBDIR_NATIVE@"
+			unset PKG_CONFIG_SYSROOT_DIR
 		fi
 	fi
 fi
 
-pkg-config "$@"
+pkg-config.real "$@"
diff --git a/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in
index c2e86e5..9ed30a0 100644
--- a/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in
+++ b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-native.in
@@ -1,5 +1,6 @@
 #! /bin/sh
 
 PKG_CONFIG_PATH="@PATH_NATIVE@"
+unset PKG_CONFIG_SYSROOT_DIR
 
 pkg-config "$@"
diff --git a/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-wrapper b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-wrapper
index fc9b488..695f349 100755
--- a/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-wrapper
+++ b/meta/recipes-devtools/pkgconf/pkgconf/pkg-config-wrapper
@@ -4,4 +4,13 @@
 # Copyright (C) 2015 Christopher Larson <chris_larson@mentor.com>
 # License: MIT (see COPYING.MIT at the root of the repository for terms)
 
+for arg; do
+    case "$arg" in
+        --variable|--variable=*)
+            # pkg-config doesn't sysroot-prefix user variables
+            unset PKG_CONFIG_SYSROOT_DIR
+            ;;
+    esac
+done
+
 exec pkgconf "$@"
-- 
2.4.0


