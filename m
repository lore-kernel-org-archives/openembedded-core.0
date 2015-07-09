Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2C33375BCF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 07:52:03 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jul 2015 00:52:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,438,1432623600"; d="scan'208";a="761101058"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga002.jf.intel.com with ESMTP; 09 Jul 2015 00:52:02 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jul 2015 10:52:45 +0300
Message-Id: <099c3ad6560f56e9f8d3cf80a74306f73596469e.1436427694.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <52cb25bbbd0e0fc90193b412850d018828aa33da.1436427694.git.jussi.kukkonen@intel.com>
References: <52cb25bbbd0e0fc90193b412850d018828aa33da.1436427694.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1436427694.git.jussi.kukkonen@intel.com>
References: <cover.1436427694.git.jussi.kukkonen@intel.com>
Subject: [PATCH 4/5] clutter-1.0: Upgrade 1.20.0 -> 1.22.4
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
X-List-Received-Date: Thu, 09 Jul 2015 07:52:03 -0000

* Update test TAP output patch

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../run-installed-tests-with-tap-output.patch      | 30 +++++++++++++++-------
 ...clutter-1.0_1.20.0.bb => clutter-1.0_1.22.4.bb} |  4 +--
 2 files changed, 23 insertions(+), 11 deletions(-)
 rename meta/recipes-graphics/clutter/{clutter-1.0_1.20.0.bb => clutter-1.0_1.22.4.bb} (60%)

diff --git a/meta/recipes-graphics/clutter/clutter-1.0/run-installed-tests-with-tap-output.patch b/meta/recipes-graphics/clutter/clutter-1.0/run-installed-tests-with-tap-output.patch
index 80acab8..86d841b 100644
--- a/meta/recipes-graphics/clutter/clutter-1.0/run-installed-tests-with-tap-output.patch
+++ b/meta/recipes-graphics/clutter/clutter-1.0/run-installed-tests-with-tap-output.patch
@@ -1,20 +1,32 @@
-Configure output from installed-tests to be TAP compliant, such that gnome-desktop-testing-runner properly interprets the results.
+From 668e1d14af13249384ab324c7d79ec4147f07e48 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Mon, 27 Apr 2015 20:12:33 +0300
+Subject: [PATCH] Run installed tests with tap output
+
+Configure output from installed-tests to be TAP compliant such that
+gnome-desktop-testing-runner properly interprets the results.
 
 Upstream-status: Pending
 
 Signed-off-by: Tim Orling <TicoTimo@gmail.com>
+---
+ build/autotools/glib-tap.mk | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
 
-Index: clutter-1.20.0/build/autotools/glib-tap.mk
-===================================================================
---- clutter-1.20.0.orig/build/autotools/glib-tap.mk
-+++ clutter-1.20.0/build/autotools/glib-tap.mk
-@@ -128,7 +128,8 @@ installed_test_meta_DATA = $(installed_t
+diff --git a/build/autotools/glib-tap.mk b/build/autotools/glib-tap.mk
+index 7c5f82b..844e17e 100644
+--- a/build/autotools/glib-tap.mk
++++ b/build/autotools/glib-tap.mk
+@@ -127,7 +127,8 @@ installed_test_meta_DATA = $(installed_testcases:=.test)
+ %.test: %$(EXEEXT) Makefile
  	$(AM_V_GEN) (echo '[Test]' > $@.tmp; \
  	echo 'Type=session' >> $@.tmp; \
- 	echo 'TestEnvironment=G_ENABLE_DIAGNOSTIC=0;CLUTTER_ENABLE_DIAGNOSTIC=0;' >> $@.tmp; \
--	echo 'Exec=$(installed_testdir)/$<' >> $@.tmp; \
-+	echo 'Exec=$(installed_testdir)/$< --tap' >> $@.tmp; \
+-	echo 'Exec=env G_ENABLE_DIAGNOSTIC=0 CLUTTER_ENABLE_DIAGNOSTIC=0 $(installed_testdir)/$<' >> $@.tmp; \
++	echo 'Exec=env G_ENABLE_DIAGNOSTIC=0 CLUTTER_ENABLE_DIAGNOSTIC=0 $(installed_testdir)/$< --tap' >> $@.tmp; \
 +	echo 'Output=TAP' >> $@.tmp; \
  	mv $@.tmp $@)
  
  CLEANFILES += $(installed_test_meta_DATA)
+-- 
+2.1.4
+
diff --git a/meta/recipes-graphics/clutter/clutter-1.0_1.20.0.bb b/meta/recipes-graphics/clutter/clutter-1.0_1.22.4.bb
similarity index 60%
rename from meta/recipes-graphics/clutter/clutter-1.0_1.20.0.bb
rename to meta/recipes-graphics/clutter/clutter-1.0_1.22.4.bb
index 5f39a3a..418cdfd 100644
--- a/meta/recipes-graphics/clutter/clutter-1.0_1.20.0.bb
+++ b/meta/recipes-graphics/clutter/clutter-1.0_1.22.4.bb
@@ -2,8 +2,8 @@ require clutter-1.0.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[archive.md5sum] = "a8a33a57a944c6d7c7c013ce9aa3222b"
-SRC_URI[archive.sha256sum] = "cc940809e6e1469ce349c4bddb0cbcc2c13c087d4fc15cda9278d855ee2d1293"
+SRC_URI[archive.md5sum] = "26494256c980d49703a553916e3083cd"
+SRC_URI[archive.sha256sum] = "1d77ce16025f87667a1d00dc4fa617a1935156f63fd17635fdadf138866c9e1e"
 
 SRC_URI += "file://install-examples.patch \
             file://run-installed-tests-with-tap-output.patch \
-- 
2.1.4


