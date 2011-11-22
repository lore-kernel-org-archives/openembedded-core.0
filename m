Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RSzOE-0003b9-7J
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 00:04:34 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 22 Nov 2011 14:57:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,556,1315206000"; d="scan'208";a="40292575"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.38])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Nov 2011 14:57:58 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Nov 2011 14:57:53 -0800
Message-Id: <8753b3df2c652bd0fa0267e7542234ff4cc93c4d.1322001497.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <cover.1322001497.git.josh@linux.intel.com>
References: <cover.1322001497.git.josh@linux.intel.com>
In-Reply-To: <cover.1322001497.git.josh@linux.intel.com>
References: <cover.1322001497.git.josh@linux.intel.com>
Subject: [PATCH 10/10] clutter: move STDDEPENDS to inc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Nov 2011 23:04:34 -0000

We only build clutter-1.8 now so move the additional STDDEPENDS from the
recipe to the inc file. This has the added benefit of fixing
clutter_git.

This patch also fixes the LIC_FILES_CHKSUM for clutter_git

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-graphics/clutter/clutter-1.8_1.8.0.bb |    3 ---
 meta/recipes-graphics/clutter/clutter.inc          |    3 ++-
 meta/recipes-graphics/clutter/clutter_git.bb       |    4 +---
 3 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-graphics/clutter/clutter-1.8_1.8.0.bb b/meta/recipes-graphics/clutter/clutter-1.8_1.8.0.bb
index c67ea2a..690a161 100644
--- a/meta/recipes-graphics/clutter/clutter-1.8_1.8.0.bb
+++ b/meta/recipes-graphics/clutter/clutter-1.8_1.8.0.bb
@@ -5,9 +5,6 @@ PR = "r2"
 # We're API/ABI compatible and this may make things easier for layers
 PROVIDES += "clutter-1.6"
 
-# Internal json-glib was removed in Clutter 1.5.2
-STDDEPENDS += "json-glib cogl atk"
-
 PACKAGES =+ "${PN}-examples"
 FILES_${PN}-examples = "${bindir}/test-* ${pkgdatadir}/redhand.png"
 
diff --git a/meta/recipes-graphics/clutter/clutter.inc b/meta/recipes-graphics/clutter/clutter.inc
index 54f65c5..24cb30d 100644
--- a/meta/recipes-graphics/clutter/clutter.inc
+++ b/meta/recipes-graphics/clutter/clutter.inc
@@ -2,7 +2,8 @@ DESCRIPTION = "Clutter graphics library"
 HOMEPAGE = "http://www.clutter-project.org/"
 LICENSE = "LGPL"
 
-STDDEPENDS = "virtual/libx11 gtk-doc-native pango glib-2.0 libxfixes gtk+ libxi"
+# Internal json-glib was removed in Clutter 1.5.2, cogl was removed in 1.8, atk required since 1.8
+STDDEPENDS = "virtual/libx11 gtk-doc-native pango glib-2.0 libxfixes libxi json-glib cogl atk"
 BASE_CONF = "--disable-gtk-doc ${@get_clutter_fpu_setting(bb, d)}"
 
 DEPENDS = "${STDDEPENDS} virtual/libgl"
diff --git a/meta/recipes-graphics/clutter/clutter_git.bb b/meta/recipes-graphics/clutter/clutter_git.bb
index 897f5ff..db8c712 100644
--- a/meta/recipes-graphics/clutter/clutter_git.bb
+++ b/meta/recipes-graphics/clutter/clutter_git.bb
@@ -1,9 +1,7 @@
 require clutter.inc
 require clutter-package.inc
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
-
-DEPENDS += "cogl"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRCREV = "39db46123ed6bbbc3e6ad359a64d4d344ca9e11b"
 PV = "1.8.0+git${SRCPV}"
-- 
1.7.7.3



