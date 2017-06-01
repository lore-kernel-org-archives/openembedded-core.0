Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 53C4F77CF1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 10:37:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Jun 2017 03:37:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,279,1493708400"; d="scan'208";a="1155312115"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 01 Jun 2017 03:37:02 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 5A2465803AB;
	Thu,  1 Jun 2017 03:36:58 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Jun 2017 13:36:46 +0300
Message-Id: <c0da1e58df3f7707b1e4df3f95aaeb435bddc124.1496311679.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496311679.git.jussi.kukkonen@intel.com>
References: <cover.1496311679.git.jussi.kukkonen@intel.com>
Subject: [PATCH 01/10] vte: Upgrade 0.46.1 -> 0.48.3
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
X-List-Received-Date: Thu, 01 Jun 2017 10:37:03 -0000

Depend on gperf-native: The tarball used to include files generated
with gperf and this is no longer the case.
Use GIR_EXTRA_LIBS_PATH to fix introspection generation.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-support/vte/{vte_0.46.1.bb => vte_0.48.3.bb} | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)
 rename meta/recipes-support/vte/{vte_0.46.1.bb => vte_0.48.3.bb} (84%)

diff --git a/meta/recipes-support/vte/vte_0.46.1.bb b/meta/recipes-support/vte/vte_0.48.3.bb
similarity index 84%
rename from meta/recipes-support/vte/vte_0.46.1.bb
rename to meta/recipes-support/vte/vte_0.48.3.bb
index 0afe625..4720841 100644
--- a/meta/recipes-support/vte/vte_0.46.1.bb
+++ b/meta/recipes-support/vte/vte_0.48.3.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Virtual terminal emulator GTK+ widget library"
 BUGTRACKER = "https://bugzilla.gnome.org/buglist.cgi?product=vte"
 LICENSE = "LGPLv2.1+"
-DEPENDS = "glib-2.0 gtk+3 libpcre2 intltool-native libxml2-native"
+DEPENDS = "glib-2.0 gtk+3 libpcre2 intltool-native libxml2-native gperf-native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
@@ -11,8 +11,8 @@ inherit gnomebase gtk-doc distro_features_check upstream-version-is-even gobject
 SRC_URI += "file://0001-Don-t-enable-stack-protection-by-default.patch \
             ${@bb.utils.contains('PACKAGECONFIG', 'vala', '', 'file://0001-Add-m4-vapigen.m4.patch', d) } \
             "
-SRC_URI[archive.md5sum] = "e8f4393b9f1ec2e2f3cdb3fd4f5a16de"
-SRC_URI[archive.sha256sum] = "8800cf8bc259704a12ad1853fb0eb43bfe3857af15242e6fb9f2c3fd95b3f5c6"
+SRC_URI[archive.md5sum] = "b300675ac5f269aa6eb48fe89a0d726d"
+SRC_URI[archive.sha256sum] = "a3a9fb182740b392a45cd3f46fa61a985f68bb6b1817b52daec22034c46158c3"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
@@ -24,6 +24,11 @@ export STAGING_DATADIR
 # Upstream Vala >= 0.11 looks in XDG_DATA_DIRS for .vapi files
 export XDG_DATA_DIRS = "${STAGING_DATADIR}"
 
+# Help g-ir-scanner find the .so for linking
+do_compile_prepend() {
+        export GIR_EXTRA_LIBS_PATH="${B}/src/.libs"
+}
+
 # Package additional files
 FILES_${PN}-dev += "${datadir}/vala/vapi/*"
 
-- 
2.1.4


