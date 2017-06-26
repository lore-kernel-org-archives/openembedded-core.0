Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7B723779C1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 08:36:20 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id f134so231212wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Jun 2017 01:36:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qp0Mp3Mo8zeeq/s8PG32Q+cmCjaGk71YFjZIonSxnEE=;
	b=nbnOhf8lsXBd1n0P88IESQktsxQdf1qAi+e8e7/jCiWvLerdTD9LkHIklTGMgzXz0y
	ZxR3Fx9oqm6reUJEBg1xnPH8QTVgrE9mOcg1KMQJIH/0jjf6VXhkJ2NhTbGmN0ymK35O
	z3pcAHyvH6NL2LDh2LrEMOUXz24cj/17uPHWQ9xj09jAu+4k36fVNcJJM6gV2WQTfCox
	kkm6JEsMMeG3uXYFAiNjqbcX2Rs5bKYnglBXFQXHFHSAoOyyJySBK9wHxaBo3fNmP5OA
	KAZHolRwCY7UQwd0inl1lTxTx2hcBtigkPlMFgx3/u8hDxSpQ+Fobb6UNVA4mi4HvBhV
	t71A==
X-Gm-Message-State: AKS2vOy7QGzQHXLODrP708qaMxlyKmlWgDzAOSV3wuLFJxugXeKySA6E
	OexL0dzj9/657fj7/u4=
X-Received: by 10.80.168.102 with SMTP id j93mr16416445edc.32.1498466180882;
	Mon, 26 Jun 2017 01:36:20 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	w12sm5945579edd.21.2017.06.26.01.36.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jun 2017 01:36:20 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Jun 2017 09:36:17 +0100
Message-Id: <20170626083619.26198-1-git@andred.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170623145924.21097-1-git@andred.net>
References: <20170623145924.21097-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v3 1/3] selftest/archiver: add tests for recipe type filtering
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
X-List-Received-Date: Mon, 26 Jun 2017 08:36:21 -0000
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
 meta/lib/oeqa/selftest/cases/archiver.py | 76 ++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
index 70c7282f22..7ef92cddac 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -39,3 +39,79 @@ class Archiver(OESelftestTestCase):
         # Check that exclude_recipe was excluded
         excluded_present = len(glob.glob(src_path + '/%s-*' % exclude_recipe))
         self.assertFalse(excluded_present, 'Recipe %s was not excluded.' % exclude_recipe)
+
+
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


