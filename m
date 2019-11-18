Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 9FDB57F965
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 18:59:09 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id t1so20824898wrv.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 10:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=IynEXo5xhpRbAgdT3hkczehGovRMsOhZJvoL9Bk8uTs=;
	b=ET8anyemCdI90CI+qdBs0tSFdygAaUw8uEc7fUKMJNc7JBPrCQ3BVKIfOUwzGzc7N9
	NqJFJU+kjulGP+62CsaZR+oJaNMJ/lDkhnxEeVGWcUtx4lC4kGlqS2IblGO8JdR8sr3M
	hrcKHiywQWNBWO2vaDfDBz23Gscavk/DMYanNJRDnnzu6rs6uwlUtlFpZ5ONlrPn42o3
	9bxU3pkCfz+rH9wCBkz2O4u/D+IS2nujjwIY6uorj3aYE4V53a16G1YSh/KuFHKshrxP
	aEMDnvynIkadK9JJtZ1nUTruOzyMS8eKTkrRWgV+3d5Tb8P04KY8Zu2uQY93JCkBKTNb
	zhIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=IynEXo5xhpRbAgdT3hkczehGovRMsOhZJvoL9Bk8uTs=;
	b=AXj2jBKPQfmMvBmBiKfYOCN9blxqgBUqU2vz1jNNfkiXFv7hLYhnHb888asV8Wsuky
	0V7Sbc7JspvVTBV/f4jrROlGWsZoyfNETAz8aHZLlEtQZYrBJS6RStl67VvicfusozK6
	KfPeDRqVRv33viO9hHmmXJHQbONcJkI8mlmPcGgj6BP+/NpKl2lwz1GmwG+B4zUUyFSK
	DJTmVQWJmtMeHlQP5pKT4Tr+UGT6/bUraBHBS/Nj7bHsE4hsg9L0OeyxUq4TwIXh4PfF
	meScbu5wuxDzYzCzWDAKbRL4bpPogktIz5aTh0dYjsjMHCELs1E0/5bV74EOO6H1MdRF
	P5OA==
X-Gm-Message-State: APjAAAX13kMiypCBII5ZsFk66YraHAWAD9KuCWC8Sg1sSBTwHLcgVpDH
	voruioPvncmArs+wcgrFvwlV55Jk
X-Google-Smtp-Source: APXvYqyBrHhzWeeV2vqse5BWq3I4YHSi6+FMIQ5DBp8MAfuzX2oBPWeAhR5Q7BisEIkQ3uMZNz514A==
X-Received: by 2002:adf:f20f:: with SMTP id p15mr27060311wro.370.1574103549653;
	Mon, 18 Nov 2019 10:59:09 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id f67sm332571wme.16.2019.11.18.10.59.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 10:59:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 19:59:03 +0100
Message-Id: <20191118185903.18087-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191118185903.18087-1-alex.kanavin@gmail.com>
References: <20191118185903.18087-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] selftest: check that 'devtool upgrade' correctly drops backported patches
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
X-List-Received-Date: Mon, 18 Nov 2019 18:59:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There was a regression in this functionality that went unnoticed
due to lack of tests.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../backported.patch                          | 37 +++++++++++++++++++
 .../devtool/devtool-upgrade-test1_1.5.3.bb    |  4 +-
 .../devtool-upgrade-test1_1.5.3.bb.upgraded   |  4 +-
 meta/lib/oeqa/selftest/cases/devtool.py       | 25 +++++++++++--
 4 files changed, 65 insertions(+), 5 deletions(-)
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/backported.patch

diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/backported.patch b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/backported.patch
new file mode 100644
index 00000000000..c4f3f12666c
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1-1.5.3/backported.patch
@@ -0,0 +1,37 @@
+commit ced2ec32b657a7f52604b2e16e5d5881041c517a
+Author: OpenEmbedded <oe.patch@oe>
+Date:   Mon Nov 18 18:43:15 2019 +0100
+
+    Backport of the NEWS file from version 1.6.0
+
+diff --git a/doc/NEWS b/doc/NEWS
+index 69793fc..fd49b1c 100644
+--- a/doc/NEWS
++++ b/doc/NEWS
+@@ -1,3 +1,26 @@
++1.6.0 - 15 March 2015
++  - fix lstat64 support when unavailable - separate patches supplied by
++    Ganael Laplanche and Peter Korsgaard
++  - (#1506) new option "-D" / "--delay-start" to only show bar after N
++    seconds (Damon Harper)
++  - new option "--fineta" / "-I" to show ETA as time of day rather than time
++    remaining - patch supplied by Erkki Seppälä (r147)
++  - (#1509) change ETA (--eta / -e) so that days are given if the hours
++    remaining are 24 or more (Jacek Wielemborek)
++  - (#1499) repeat read and write attempts on partial buffer fill/empty to
++    work around post-signal transfer rate drop reported by Ralf Ramsauer
++  - (#1507) do not try to calculate total size in line mode, due to bug
++    reported by Jacek Wielemborek and Michiel Van Herwegen
++  - cleanup: removed defunct RATS comments and unnecessary copyright notices
++  - clean up displayed lines when using --watchfd PID, when PID exits
++  - output errors on a new line to avoid overwriting transfer bar
++
++1.5.7 - 26 August 2014
++  - show KiB instead of incorrect kiB (Debian bug #706175)
++  - (#1284) do not gzip man page, for non-Linux OSes (Bob Friesenhahn)
++  - work around "awk" bug in tests/016-numeric-timer in decimal "," locales
++  - fix "make rpm" and "make srpm", extend "make release" to sign releases
++
+ 1.5.3 - 4 May 2014
+   - remove SPLICE_F_NONBLOCK to fix problem with slow splice() (Jan Seda)
+ 
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb
index 333ecac7ed8..fee5bee7398 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb
@@ -3,7 +3,9 @@ LICENSE = "Artistic-2.0"
 LIC_FILES_CHKSUM = "file://doc/COPYING;md5=9c50db2589ee3ef10a9b7b2e50ce1d02"
 
 SRC_URI = "http://www.ivarch.com/programs/sources/pv-${PV}.tar.gz \
-           file://0001-Add-a-note-line-to-the-quick-reference.patch"
+           file://0001-Add-a-note-line-to-the-quick-reference.patch \
+           file://backported.patch \
+          "
 UPSTREAM_CHECK_URI = "http://www.ivarch.com/programs/pv.shtml"
 RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
 
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb.upgraded b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb.upgraded
index 9d94f671dbf..66e45c7e846 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb.upgraded
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb.upgraded
@@ -3,7 +3,9 @@ LICENSE = "Artistic-2.0"
 LIC_FILES_CHKSUM = "file://doc/COPYING;md5=9c50db2589ee3ef10a9b7b2e50ce1d02"
 
 SRC_URI = "http://www.ivarch.com/programs/sources/pv-${PV}.tar.gz \
-           file://0001-Add-a-note-line-to-the-quick-reference.patch"
+           file://0001-Add-a-note-line-to-the-quick-reference.patch \
+           file://backported.patch \
+          "
 UPSTREAM_CHECK_URI = "http://www.ivarch.com/programs/pv.shtml"
 RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
 
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 3a25da2033b..21e6002f063 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1496,11 +1496,13 @@ class DevtoolUpgradeTests(DevtoolBase):
         recipedir = os.path.dirname(oldrecipefile)
         olddir = os.path.join(recipedir, recipe + '-' + oldversion)
         patchfn = '0001-Add-a-note-line-to-the-quick-reference.patch'
+        backportedpatchfn = 'backported.patch'
         self.assertExists(os.path.join(olddir, patchfn), 'Original patch file does not exist')
-        return recipe, oldrecipefile, recipedir, olddir, newversion, patchfn
+        self.assertExists(os.path.join(olddir, backportedpatchfn), 'Backported patch file does not exist')
+        return recipe, oldrecipefile, recipedir, olddir, newversion, patchfn, backportedpatchfn
 
     def test_devtool_finish_upgrade_origlayer(self):
-        recipe, oldrecipefile, recipedir, olddir, newversion, patchfn = self._setup_test_devtool_finish_upgrade()
+        recipe, oldrecipefile, recipedir, olddir, newversion, patchfn, backportedpatchfn = self._setup_test_devtool_finish_upgrade()
         # Ensure the recipe is where we think it should be (so that cleanup doesn't trash things)
         self.assertIn('/meta-selftest/', recipedir)
         # Try finish to the original layer
@@ -1511,14 +1513,23 @@ class DevtoolUpgradeTests(DevtoolBase):
         self.assertNotExists(os.path.join(self.workspacedir, 'recipes', recipe), 'Recipe directory should not exist after finish')
         self.assertNotExists(oldrecipefile, 'Old recipe file should have been deleted but wasn\'t')
         self.assertNotExists(os.path.join(olddir, patchfn), 'Old patch file should have been deleted but wasn\'t')
+        self.assertNotExists(os.path.join(olddir, backportedpatchfn), 'Old backported patch file should have been deleted but wasn\'t')
         newrecipefile = os.path.join(recipedir, '%s_%s.bb' % (recipe, newversion))
         newdir = os.path.join(recipedir, recipe + '-' + newversion)
         self.assertExists(newrecipefile, 'New recipe file should have been copied into existing layer but wasn\'t')
         self.assertExists(os.path.join(newdir, patchfn), 'Patch file should have been copied into new directory but wasn\'t')
+        self.assertNotExists(os.path.join(newdir, backportedpatchfn), 'Backported patch file should not have been copied into new directory but was')
         self.assertExists(os.path.join(newdir, '0002-Add-a-comment-to-the-code.patch'), 'New patch file should have been created but wasn\'t')
+        with open(newrecipefile, 'r') as f:
+            newcontent = f.read()
+        self.assertNotIn(backportedpatchfn, newcontent, "Backported patch should have been removed from the recipe but wasn't")
+        self.assertIn(patchfn, newcontent, "Old patch should have not been removed from the recipe but was")
+        self.assertIn("0002-Add-a-comment-to-the-code.patch", newcontent, "New patch should have been added to the recipe but wasn't")
+        self.assertIn("http://www.ivarch.com/programs/sources/pv-${PV}.tar.gz", newcontent, "New recipe no longer has upstream source in SRC_URI")
+
 
     def test_devtool_finish_upgrade_otherlayer(self):
-        recipe, oldrecipefile, recipedir, olddir, newversion, patchfn = self._setup_test_devtool_finish_upgrade()
+        recipe, oldrecipefile, recipedir, olddir, newversion, patchfn, backportedpatchfn = self._setup_test_devtool_finish_upgrade()
         # Ensure the recipe is where we think it should be (so that cleanup doesn't trash things)
         self.assertIn('/meta-selftest/', recipedir)
         # Try finish to a different layer - should create a bbappend
@@ -1534,10 +1545,18 @@ class DevtoolUpgradeTests(DevtoolBase):
         self.assertNotExists(os.path.join(self.workspacedir, 'recipes', recipe), 'Recipe directory should not exist after finish')
         self.assertExists(oldrecipefile, 'Old recipe file should not have been deleted')
         self.assertExists(os.path.join(olddir, patchfn), 'Old patch file should not have been deleted')
+        self.assertExists(os.path.join(olddir, backportedpatchfn), 'Old backported patch file should not have been deleted')
         newdir = os.path.join(newrecipedir, recipe + '-' + newversion)
         self.assertExists(newrecipefile, 'New recipe file should have been copied into existing layer but wasn\'t')
         self.assertExists(os.path.join(newdir, patchfn), 'Patch file should have been copied into new directory but wasn\'t')
+        self.assertNotExists(os.path.join(newdir, backportedpatchfn), 'Backported patch file should not have been copied into new directory but was')
         self.assertExists(os.path.join(newdir, '0002-Add-a-comment-to-the-code.patch'), 'New patch file should have been created but wasn\'t')
+        with open(newrecipefile, 'r') as f:
+            newcontent = f.read()
+        self.assertNotIn(backportedpatchfn, newcontent, "Backported patch should have been removed from the recipe but wasn't")
+        self.assertIn(patchfn, newcontent, "Old patch should have not been removed from the recipe but was")
+        self.assertIn("0002-Add-a-comment-to-the-code.patch", newcontent, "New patch should have been added to the recipe but wasn't")
+        self.assertIn("http://www.ivarch.com/programs/sources/pv-${PV}.tar.gz", newcontent, "New recipe no longer has upstream source in SRC_URI")
 
     def _setup_test_devtool_finish_modify(self):
         # Check preconditions
-- 
2.17.1


