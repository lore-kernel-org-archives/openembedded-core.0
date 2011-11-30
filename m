Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RVYDv-0008Ew-KN
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 01:40:31 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Nov 2011 16:33:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="81378102"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.15.149])
	by orsmga002.jf.intel.com with ESMTP; 29 Nov 2011 16:33:50 -0800
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 16:33:43 -0800
Message-Id: <47900a2181fd194383bcf4f6f72469e1c166635a.1322606832.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <cover.1322606832.git.josh@linux.intel.com>
References: <cover.1322606832.git.josh@linux.intel.com>
In-Reply-To: <cover.1322606832.git.josh@linux.intel.com>
References: <cover.1322606832.git.josh@linux.intel.com>
Subject: [PATCH 07/11] clutter: move STDDEPENDS to inc
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
X-List-Received-Date: Wed, 30 Nov 2011 00:40:32 -0000

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



