Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4FDB278246
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 12:13:15 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id 22so1716702wrb.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Oct 2017 05:13:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PjO0u5yaInhUkujg95ycNGRx0oXyeozi6FHnBTip/fQ=;
	b=Sh1ncvB8J2xvNLLiA/E8EG3/nMlZPyMd9CJ7C89hbv84pQ82T5nxlB8/u6Y7oPrit+
	uRsHlqtJN3QuLy5llSqx43zHOOy2X07ylODHLQZrCBZrElO2o6Mhx5+PJWUVqs1OAxOL
	ODuLjEpJrACI/U2O8iWeLQqXDonGQfVKMiDch+PIwwccCmRF2hIDjZUF7Z2CEjwsfDqd
	WMCWPOPKiwTe1Z9JG7uctxc7M9iQUZtxjCur7fg6k5FOYJDZwU3YzgvcjmI5AA5gb+zw
	HIhZziKUqRshPHLEbalQ+Vkalmp66ZtnV4F35WNjEWf8miKnVvW36Hn7xWDw+vA6iuaT
	pwAQ==
X-Gm-Message-State: AMCzsaXRoX2LC9VDiQZLx9ksEdsYWiJBV7ggpCLvPiRlGBHRycUJ61KB
	3l6aC5ivSpw/BURhA+Fy/1MX0Tna
X-Google-Smtp-Source: AOwi7QC/dFYaUM6FmQ6fAlf5w0dhtWcKIw+dlW0CCB8VMmxcuErEuEmOvGOA2i/dgWxjvHW2vsteSw==
X-Received: by 10.223.162.202 with SMTP id t10mr1942832wra.42.1507291995874;
	Fri, 06 Oct 2017 05:13:15 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id r15sm994045wrc.30.2017.10.06.05.13.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 05:13:15 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Oct 2017 13:12:47 +0100
Message-Id: <20171006121259.5817-6-git@andred.net>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006121259.5817-1-git@andred.net>
References: <20171006121259.5817-1-git@andred.net>
MIME-Version: 1.0
Subject: [pyro][PATCH 05/17] selftest/archiver: add tests for recipe type filtering
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
X-List-Received-Date: Fri, 06 Oct 2017 12:13:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

The archiver used to be able to filter based on COPYLEFT_RECIPE_TYPES.

Unfortunately, this got broken with the fix for
  https://bugzilla.yoctoproject.org/show_bug.cgi?id=6929
in commit ae9102bda398 ("copyleft_filter.bbclass: Allow to filter on name")

Add two tests to prevent that from happening again.

Signed-off-by: André Draszik <adraszik@tycoint.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>

(cherry picked from commit 709f02c5cb25983090251c6237bac4fc0a295c4f)
Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/lib/oeqa/selftest/archiver.py | 76 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/meta/lib/oeqa/selftest/archiver.py b/meta/lib/oeqa/selftest/archiver.py
index d7f215cbf6..06b2597050 100644
--- a/meta/lib/oeqa/selftest/archiver.py
+++ b/meta/lib/oeqa/selftest/archiver.py
@@ -41,3 +41,79 @@ class Archiver(oeSelfTest):
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
2.14.2


