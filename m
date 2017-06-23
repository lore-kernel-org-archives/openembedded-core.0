Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id EE0CE780EC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 14:59:25 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id x23so13188229wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 07:59:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JzDENxg+o3o9ppl6Wh3zRC808BuikZkbHpxKNQkQ3SU=;
	b=FwpiJ2KHs/QGVwGxUZkVlCIB4qAwZFAKJ6oEt1QibDiQiFzLxAjo0urnKbmOyOjxth
	ZsRIUnUi79MulpADbFGTxxW8QhySTG8G0x4c7/vuuYDoTAwWStV+o6DBqtOphf0r9aQ/
	kt/aS3ovM4UZJkKgxfqdhBqahww+zjQT4gACefvN+fxkupBRI7ABngfjOBhSoiyJAk89
	0PWN5Iab3G55LSOJVWhcuDMHpm0Xwn/NqkAXru5HWZh1ic/4vBBbidtRE4+ZxS65dMS5
	DWDS1CWmzvBgAtdbXJhI6+3y7v/yprAA5Dqqk46QYeT7wK/j6q/XqqbzG1ROCsvZAKd8
	QcPw==
X-Gm-Message-State: AKS2vOwH8j6te32KkYailBUBM/mSyCuj4WUcWigu4X1Mdoz4ThR+W11x
	hZvrmJ2TZxlZPBqVhmI=
X-Received: by 10.223.146.161 with SMTP id 30mr6508331wrn.164.1498229966396;
	Fri, 23 Jun 2017 07:59:26 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	b94sm4041008wrd.40.2017.06.23.07.59.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Jun 2017 07:59:25 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Jun 2017 15:59:22 +0100
Message-Id: <20170623145924.21097-1-git@andred.net>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH 1/3] selftest/archiver: add tests for recipe type filtering
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
X-List-Received-Date: Fri, 23 Jun 2017 14:59:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

The archiver used to be able to filter based on COPYLEFT_RECIPE_TYPES.

Unfortunately, this got broken with the fix for
  https://bugzilla.yoctoproject.org/show_bug.cgi?id=6929
in commit ae9102bda398 ("copyleft_filter.bbclass: Allow to filter on name")

Add two tests to prevent that from happening again.

Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/lib/oeqa/selftest/cases/archiver.py | 78 ++++++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
index 70c7282f22..9f686debe6 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -39,3 +39,81 @@ class Archiver(OESelftestTestCase):
         # Check that exclude_recipe was excluded
         excluded_present = len(glob.glob(src_path + '/%s-*' % exclude_recipe))
         self.assertFalse(excluded_present, 'Recipe %s was not excluded.' % exclude_recipe)
+
+
+    @testcase(2012)
+    def test_archiver_filters_by_type(self):
+        """
+        Summary:     The archiver is documented to filter on the recipe type.
+        Expected:    1. included recipe type (target) should be included
+                     2. other types should be excluded
+        Product:     oe-core
+        Author:      André Draszik <adraszik@tycoint.com>
+        """
+
+        target_recipe = 'initscripts'
+        native_recipe = 'zlib-native'
+
+        features = 'INHERIT += "archiver"\n'
+        features += 'ARCHIVER_MODE[src] = "original"\n'
+        features += 'COPYLEFT_RECIPE_TYPES = "target"\n'
+        self.write_config(features)
+
+        bitbake('-c clean %s %s' % (target_recipe, native_recipe))
+        bitbake("%s -c deploy_archives %s" % (target_recipe, native_recipe))
+
+        bb_vars = get_bb_vars(['DEPLOY_DIR_SRC', 'TARGET_SYS', 'BUILD_SYS'])
+        src_path_target = os.path.join(bb_vars['DEPLOY_DIR_SRC'], bb_vars['TARGET_SYS'])
+        src_path_native = os.path.join(bb_vars['DEPLOY_DIR_SRC'], bb_vars['BUILD_SYS'])
+
+        # Check that target_recipe was included
+        included_present = len(glob.glob(src_path_target + '/%s-*' % target_recipe))
+        self.assertTrue(included_present, 'Recipe %s was not included.' % target_recipe)
+
+        # Check that native_recipe was excluded
+        excluded_present = len(glob.glob(src_path_native + '/%s-*' % native_recipe))
+        self.assertFalse(excluded_present, 'Recipe %s was not excluded.' % native_recipe)
+
+    @testcase(2013)
+    def test_archiver_filters_by_type_and_name(self):
+        """
+        Summary:     Test that the archiver archives by recipe type, taking the
+                     recipe name into account.
+        Expected:    1. included recipe type (target) should be included
+                     2. other types should be excluded
+                     3. recipe by name should be included / excluded,
+                        overriding previous decision by type
+        Product:     oe-core
+        Author:      André Draszik <adraszik@tycoint.com>
+        """
+
+        target_recipes = [ 'initscripts', 'zlib' ]
+        native_recipes = [ 'update-rc.d-native', 'zlib-native' ]
+
+        features = 'INHERIT += "archiver"\n'
+        features += 'ARCHIVER_MODE[src] = "original"\n'
+        features += 'COPYLEFT_RECIPE_TYPES = "target"\n'
+        features += 'COPYLEFT_PN_INCLUDE = "%s"\n' % native_recipes[1]
+        features += 'COPYLEFT_PN_EXCLUDE = "%s"\n' % target_recipes[1]
+        self.write_config(features)
+
+        bitbake('-c clean %s %s' % (' '.join(target_recipes), ' '.join(native_recipes)))
+        bitbake('-c deploy_archives %s %s' % (' '.join(target_recipes), ' '.join(native_recipes)))
+
+        bb_vars = get_bb_vars(['DEPLOY_DIR_SRC', 'TARGET_SYS', 'BUILD_SYS'])
+        src_path_target = os.path.join(bb_vars['DEPLOY_DIR_SRC'], bb_vars['TARGET_SYS'])
+        src_path_native = os.path.join(bb_vars['DEPLOY_DIR_SRC'], bb_vars['BUILD_SYS'])
+
+        # Check that target_recipe[0] and native_recipes[1] were included
+        included_present = len(glob.glob(src_path_target + '/%s-*' % target_recipes[0]))
+        self.assertTrue(included_present, 'Recipe %s was not included.' % target_recipes[0])
+
+        included_present = len(glob.glob(src_path_native + '/%s-*' % native_recipes[1]))
+        self.assertTrue(included_present, 'Recipe %s was not included.' % native_recipes[1])
+
+        # Check that native_recipes[0] and target_recipes[1] were excluded
+        excluded_present = len(glob.glob(src_path_native + '/%s-*' % native_recipes[0]))
+        self.assertFalse(excluded_present, 'Recipe %s was not excluded.' % native_recipes[0])
+
+        excluded_present = len(glob.glob(src_path_target + '/%s-*' % target_recipes[1]))
+        self.assertFalse(excluded_present, 'Recipe %s was not excluded.' % target_recipes[1])
-- 
2.11.0


