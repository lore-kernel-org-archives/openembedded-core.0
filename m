Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id CC8CD71BF0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2018 15:36:56 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id b15-v6so29507815wrv.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2018 08:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=aURjs1n4wipQYnIDuCUOSQipRO5d1buxIDZG/KITx9M=;
	b=J2NmrN7t4OFr3PM+Y2Q/Wuk5dnjpvP9acRBB1dmwy+jKO4BBz+2WJNLMnvQtE9p6jD
	vh3wbBsGk3LQu0/TNUy/AIicM/3PbDEndakGLfCnj6mh5Hbd4friddDaaXWGe9asVyTT
	driCRskmL+YlhVZSNIPfGja3GgQJRxQazzlAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=aURjs1n4wipQYnIDuCUOSQipRO5d1buxIDZG/KITx9M=;
	b=Pi9y1X9M4h7IO2kBHiYXMwqAeA1eVDrswMYBJrwHDi9iir08d4C4MSLFNykQXYyVdQ
	sJ67lt0VTTVP3+55BYbwHmTesLsCXGdKfgNmnicmgRFwy60AyIjpJFjwkhr79fQyWUZC
	YeHasxPMYvUwuqG8jewlAANQwBPMOrt2HM22s8pwbg/JzElj4r+uk7SYj2LgwqXtd2aq
	zqMGpLbWUejYbO9YkpTSc2qvwy6vsY9rbC8hm3A1hyQipJsAZkIphNiESov1dN8EI3tP
	KUqDRzr+oQEQbszmgGlxk8M9MDsEzjuOZGDeS/9EXMnNmKaF8skxP6yyh81FdzegeINn
	VPnw==
X-Gm-Message-State: AOUpUlHZqa3rOrxqNLcEaE6Sh6ZBQb7+0BlwTori8akSMkCF3iJttoEA
	b+sGM/pSEYiJ2xZ+yT8VPwbAflXvRfM=
X-Google-Smtp-Source: AAOMgpewWuRqEPpHvKBGJ+ifZekDhEpg/YY0omjdRbehQmS6c4S3BglgC4BEtcaOhnT8avL6IKATuw==
X-Received: by 2002:a5d:4c4c:: with SMTP id
	n12-v6mr9468439wrt.71.1531669017361; 
	Sun, 15 Jul 2018 08:36:57 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z9-v6sm54571558wre.49.2018.07.15.08.36.55
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Jul 2018 08:36:56 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Jul 2018 16:36:38 +0100
Message-Id: <20180715153641.21029-9-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180715153641.21029-1-richard.purdie@linuxfoundation.org>
References: <20180715153641.21029-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 09/12] oeqa: Default to buffer mode for tests
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
X-List-Received-Date: Sun, 15 Jul 2018 15:36:57 -0000

Currently some tests run in buffer mode and some don't. Those that don't can
corrupt stdout/stderr. Switch to using buffer mode everywhere so we're consistent.

If there is useful output on stdout/stderr, it will be displayed if the test
fails.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/context.py                    | 2 +-
 meta/lib/oeqa/core/runner.py                     | 5 -----
 meta/lib/oeqa/selftest/cases/devtool.py          | 2 --
 meta/lib/oeqa/selftest/cases/efibootpartition.py | 1 -
 meta/lib/oeqa/selftest/cases/imagefeatures.py    | 2 --
 meta/lib/oeqa/selftest/cases/runqemu.py          | 2 --
 6 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index acd547416f9..10481b44b61 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -59,7 +59,7 @@ class OETestContext(object):
         self.suites = self.loader.discover()
 
     def runTests(self, skips=[]):
-        self.runner = self.runnerClass(self, descriptions=False, verbosity=2)
+        self.runner = self.runnerClass(self, descriptions=False, verbosity=2, buffer=True)
 
         # Dinamically skip those tests specified though arguments
         self.skipTests(skips)
diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 374d30cc38d..219102c6b0f 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -48,11 +48,6 @@ class OETestResult(_TestResult):
         self._tc_map_results()
 
     def startTest(self, test):
-        # Allow us to trigger the testcase buffer mode on a per test basis
-        # so stdout/stderr are only printed upon failure. Enables debugging
-        # but clean output
-        if hasattr(test, "buffer"):
-            self.buffer = test.buffer
         super(OETestResult, self).startTest(test)
 
     def _tc_map_results(self):
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 723d8e19cfd..f2b0f596771 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -13,8 +13,6 @@ from oeqa.core.decorator.oeid import OETestID
 
 class DevtoolBase(OESelftestTestCase):
 
-    buffer = True
-
     def _test_recipe_contents(self, recipefile, checkvars, checkinherits):
         with open(recipefile, 'r') as f:
             invar = None
diff --git a/meta/lib/oeqa/selftest/cases/efibootpartition.py b/meta/lib/oeqa/selftest/cases/efibootpartition.py
index 0c832566965..c6f39d5b162 100644
--- a/meta/lib/oeqa/selftest/cases/efibootpartition.py
+++ b/meta/lib/oeqa/selftest/cases/efibootpartition.py
@@ -11,7 +11,6 @@ from oeqa.utils.commands import bitbake, runqemu, get_bb_var
 class GenericEFITest(OESelftestTestCase):
     """EFI booting test class"""
 
-    buffer = True
     cmd_common = "runqemu nographic serial wic ovmf"
     efi_provider = "systemd-boot"
     image = "core-image-minimal"
diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index b60ab8ae7e1..8c95432e00b 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -10,8 +10,6 @@ class ImageFeatures(OESelftestTestCase):
     test_user = 'tester'
     root_user = 'root'
 
-    buffer = True
-
     @OETestID(1107)
     def test_non_root_user_can_connect_via_ssh_without_password(self):
         """
diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index 5ebdd57a41e..e57f503a577 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -14,8 +14,6 @@ class RunqemuTests(OESelftestTestCase):
 
     image_is_ready = False
     deploy_dir_image = ''
-    # We only want to print runqemu stdout/stderr if there is a test case failure
-    buffer = True
 
     def setUpLocal(self):
         super(RunqemuTests, self).setUpLocal()
-- 
2.17.1


