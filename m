Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
	[209.85.166.47])
	by mail.openembedded.org (Postfix) with ESMTP id A50D57F333
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 15:31:20 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id n197so5765694iod.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 08:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dU/QHQ+gt4/9zMv4PbPHtbjrqLxpEmjTf67sV5nnXf4=;
	b=KvWGtQb6l0ed68QGHnbOSJ1WdrhG3ZpqMlCG6Af8VBz5evmaP80poeuwe/XkoSnSWL
	wzmzI2MmLhUV/mM7m5g9PWyImPGnL84jZ+FH+wFeILsikoElREp8Xjwa1Rk+htLWn9JI
	Iue3wjhptmaXejiU2iTHrjUdrimX83YCKf6Cgis4+k19i29TObnQnAmzolmuuEXm82tl
	DLjqLgmPFoaOeY68p/g93XtiyIBVgaCEU6Tln4ZFllWP/b3QkPf2Ep52U7xEzhaNf3oE
	9OGFGTmZisyX9BlB82MB9mUzO+7p/tZvBBX9+xCQuGE+qRX8r4FqcJywy+NI8ATRXeKh
	gqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dU/QHQ+gt4/9zMv4PbPHtbjrqLxpEmjTf67sV5nnXf4=;
	b=YnjPucKdUbc/Oujfm79q3DUuqwds1TtZOAbbTpYoDUYebc8sRx8HsJ62lMWXzVinG/
	reW/UnbB/5wFLTMeUPGYGlRST3J/uGI+ajSyM82QjAEBPzPDJlAVmUIl3A3HnDmAg0En
	xMktlBaeCQnpQan7mJq+uRYotk9VIwqcKhq6PGog9HkXQlTpApveBNsKQn2aEHC0IGqE
	AAB4KJVsF25cvskbKby+k0fdzDuqK15YvR0gC6/zIw4VuZu/3y9q559sH0YNdMgzvLWG
	zv0TAXyI7j2KE/lJFLgpU7flVkuPKTsFHgu/zQnwZtard3Dv/eYE278wxr8ZCNbZhU2P
	5Avw==
X-Gm-Message-State: APjAAAXVKOLW+BZ8dP1AB03ZftCqSttKZ7vGJCXxqxIhHAtJFRURokiC
	Nb7+2fKceXAv+yykVd4YKMaSKFc0
X-Google-Smtp-Source: APXvYqwD/L0wp+j7LTaEH3gsZvYikS915iDbCWDSKK53FVWyNqzqW/pl4vxE/sGtflwN/lQ8HeyPyQ==
X-Received: by 2002:a5d:9746:: with SMTP id c6mr10540544ioo.235.1567092681322; 
	Thu, 29 Aug 2019 08:31:21 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	n22sm3531892iob.37.2019.08.29.08.31.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 29 Aug 2019 08:31:20 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2019 10:31:06 -0500
Message-Id: <20190829153106.21571-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] oeqa: reproducible: Do two clean builds
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
X-List-Received-Date: Thu, 29 Aug 2019 15:31:20 -0000
Content-Transfer-Encoding: 8bit

Perform two clean builds without sstate instead of one partial rebuild
with sstate and one clean build without. There are some classes of
reproducibility issues that this solves, and while we would like to
resolve them in the long term the direction to do so is not currently
clear.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 48 ++++++++++++--------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index c6cc0b7d0eb..b3bbb70158b 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -123,45 +123,53 @@ class ReproducibleTests(OESelftestTestCase):
     def test_reproducible_builds(self):
         capture_vars = ['DEPLOY_DIR_' + c.upper() for c in self.package_classes]
 
+        # Build native utilities
+        self.write_config('')
+        bitbake("diffutils-native -c addto_recipe_sysroot")
+        diffutils_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "diffutils-native")
+
+        # Reproducible builds should not pull from sstate or mirrors, but
+        # sharing DL_DIR is fine
         common_config = textwrap.dedent('''\
             INHERIT += "reproducible_build"
             PACKAGE_CLASSES = "%s"
+            SSTATE_DIR = "${TMPDIR}/sstate"
+            SSTATE_MIRROR = ""
             ''') % (' '.join('package_%s' % c for c in self.package_classes))
 
-        # Do an initial build. It's acceptable for this build to use sstate
-        self.write_config(common_config)
-        vars_reference = get_bb_vars(capture_vars)
-        bitbake(' '.join(self.images))
+        # Perform a build.
+        reproducibleA_tmp = os.path.join(self.topdir, 'reproducibleA', 'tmp')
+        if os.path.exists(reproducibleA_tmp):
+            bb.utils.remove(reproducibleA_tmp, recurse=True)
 
-        # Build native utilities
-        bitbake("diffutils-native -c addto_recipe_sysroot")
-        diffutils_sysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "diffutils-native")
+        self.write_config((textwrap.dedent('''\
+            TMPDIR = "%s"
+            ''') % reproducibleA_tmp) + common_config)
+        vars_A = get_bb_vars(capture_vars)
+        bitbake(' '.join(self.images))
 
-        reproducible_tmp = os.path.join(self.topdir, 'reproducible', 'tmp')
-        if os.path.exists(reproducible_tmp):
-            bb.utils.remove(reproducible_tmp, recurse=True)
+        # Perform another build.
+        reproducibleB_tmp = os.path.join(self.topdir, 'reproducibleB', 'tmp')
+        if os.path.exists(reproducibleB_tmp):
+            bb.utils.remove(reproducibleB_tmp, recurse=True)
 
-        # Perform another build. This build should *not* share sstate or pull
-        # from any mirrors, but sharing a DL_DIR is fine
         self.write_config((textwrap.dedent('''\
             TMPDIR = "%s"
-            SSTATE_DIR = "${TMPDIR}/sstate"
-            SSTATE_MIRROR = ""
-            ''') % reproducible_tmp) + common_config)
-        vars_test = get_bb_vars(capture_vars)
+            ''') % reproducibleB_tmp) + common_config)
+        vars_B = get_bb_vars(capture_vars)
         bitbake(' '.join(self.images))
 
-        # NOTE: The temp directory from the reproducible build is purposely
+        # NOTE: The temp directories from the reproducible build are purposely
         # kept after the build so it can be diffed for debugging.
 
         for c in self.package_classes:
             with self.subTest(package_class=c):
                 package_class = 'package_' + c
 
-                deploy_reference = vars_reference['DEPLOY_DIR_' + c.upper()]
-                deploy_test = vars_test['DEPLOY_DIR_' + c.upper()]
+                deploy_A = vars_A['DEPLOY_DIR_' + c.upper()]
+                deploy_B = vars_B['DEPLOY_DIR_' + c.upper()]
 
-                result = self.compare_packages(deploy_reference, deploy_test, diffutils_sysroot)
+                result = self.compare_packages(deploy_A, deploy_B, diffutils_sysroot)
 
                 self.logger.info('Reproducibility summary for %s: %s' % (c, result))
 
-- 
2.21.0


