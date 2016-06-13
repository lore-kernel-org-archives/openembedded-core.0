Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0FD256FF6B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 13:11:45 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 13 Jun 2016 06:11:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,466,1459839600"; d="scan'208";a="1000862875"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 13 Jun 2016 06:11:45 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jun 2016 16:11:25 +0300
Message-Id: <1465823485-32386-1-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] webkitgtk: do not inherit pythonnative
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
X-List-Received-Date: Mon, 13 Jun 2016 13:11:47 -0000

Set the path to python 2.x explicitly instead; pythonnative
and python3native classes cannot be used in the same recipe.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.12.3.bb | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
index 265fedb..a77b086 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
@@ -21,10 +21,12 @@ SRC_URI = "\
 SRC_URI[md5sum] = "aebb4029c09dd81664aa830e4a584c85"
 SRC_URI[sha256sum] = "173cbb9a2eca23eee52e99965483ab25aa9c0569ef5b57041fc0c129cc26c307"
 
-# pythonnative must come after gobject-introspection, otherwise
-# webkit build configuration will not attempt to find Python 2.x after
-# finding (and rejecting) Python 3.x
-inherit cmake lib_package pkgconfig gobject-introspection perlnative pythonnative distro_features_check upstream-version-is-even
+inherit cmake lib_package pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even
+
+# We cannot inherit pythonnative because that would conflict with inheriting python3native
+# (which is done by gobject-introspection). But webkit only needs the path to native Python 2.x binary
+# so we simply set it explicitly here.
+EXTRANATIVEPATH += "python-native"
 
 # depends on libxt
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.8.1


