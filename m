Return-Path: <bbnpreetsingh@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5173EC44524
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 06:02:18 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17728.1784786531817912966
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 23:02:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JXL5KXJV;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: bbnpreetsingh@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso238793b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 23:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784786531; x=1785391331; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YdOigpHCbgevrsGmHcgW8rM9zT7/apjM1WPEBoVj4T0=;
        b=JXL5KXJVhhk/qPhTYiwE8QRMe1WuK1X8l5TJt4P303kTxlQFmwxUPH3cuLRoY1CRcP
         U7HbvYNvOxMFtADn5O79Omy3kQCS72QBPhiiA3StoHkjh/9a9q+8IlDg+drAxj31V6Tt
         u5bu7CwyzgvstY/r4l6e1Ralmm3qHL6nub4bBtNJSMrAcE/VwbVSvSVwPbvn2rYAkG7M
         83w5dZwA41mIORtJ4zAX2BngKKRln7aQDs7hRqluD39Tw690TuxsU8fF+RuEk4aB/vpC
         SjDRc8L4SAW4hJ9h+0FIcxjFYk0DWZse6eeukCX5iO5QT3slTcFajBwIxCaJeuhjsOGr
         hn2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784786531; x=1785391331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YdOigpHCbgevrsGmHcgW8rM9zT7/apjM1WPEBoVj4T0=;
        b=I9tMZJaZWSwwe/MB0kjbVCSJGrDk8YwVfBOpDi5L64fMR/QS/Kp1bMUDxjAlnqcOqY
         32vhIsiGe4Voc6hbE+J9tctBR2mIKF7GAJJ5Qars0SltCGgw4U2aabCUVuqMxVoz8hd9
         n7p3hpftcgA0YipDFOkrEtu+joUvSoQaQxAlkaK/kDH9+tem/04knUEXPxbkRnINNjmU
         fLO/CmZHffp4tBU6AqfWL+NfLCFJ3qtjQ36sX8hzSCVZDlaurtE0oA5Wjj6rfjsfFv+y
         /1uPb+XoDSFOa9qjCWQq0FrL4wQF10L4O1/snbQPlizy8ouLUSWGg9i80u9lB4k3oXo2
         x7/g==
X-Gm-Message-State: AOJu0YzCWVyvLe+cFauFPab+2sf1B8K+sc4OOhv6bCRnFZcWKynsRRJD
	kv8ZY36NWI5ZhX/Gx6/t0iOyTRgb5noOuPkLWrByvBaW2mqyj/NkCzZIGjHcJEkBQB8=
X-Gm-Gg: AR+sD11T35S1eDJUSEVWYH2JdEHKCA5yw8JtruuetVenM3N1dwG9a2S7Ty44MYwDiV4
	INnifT1B4ZxU8dweK41xW//NhbkhKhEwmt4NDPbmPq+foOSe5XMrRRP+qybW6vTV4TzaiXpyg79
	Ri7yD5wNCR7PU3US88QL5dTejTsydv/14EaL9q4VRhLQJEotgw1jn4IaBqzk7MwLcxjbynLD/dP
	1+PXwYnljD46z+5iYCZBh83d3LwFERmKTA6qjATs5tcO7N//BZcnCGVzi7ayBs3ydkBXvAsIWEf
	ivWalHuRi6q3wSLd4Thy12ITYJQRQfxbcCcE6sZ9AJRXucROg9bdYks4OxzWyYNOQNlCR84jr3x
	VAGVjz0MYI4t64Mc9BmecRgzkuUbJgMwEvmxuQkx9v4YYzJ5ZNiTCJoWV8tgC5qPITdMV8w7N8S
	w6jdQ3w9uuTLM/
X-Received: by 2002:a05:6a00:90a5:b0:848:7e85:f208 with SMTP id d2e1a72fcca58-84e2bb546c5mr2087601b3a.37.1784786531047;
        Wed, 22 Jul 2026 23:02:11 -0700 (PDT)
Received: from ydev.. ([108.180.130.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17602046sm2401550b3a.59.2026.07.22.23.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 23:02:10 -0700 (PDT)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Chris Laplante <chris.laplante@agilent.com>,
	Peter Kjellerstedt <pkj@axis.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [PATCH 2/2] oeqa/selftest/devtool: cover srcrev update mode guessing for gitsm://
Date: Thu, 23 Jul 2026 06:02:09 +0000
Message-ID: <20260723060209.8-2-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723060209.8-1-bbnpreetsingh@gmail.com>
References: <20260723060209.8-1-bbnpreetsingh@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 06:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241774

Add test_devtool_update_recipe_gitsm: devtool modify the
git-submodule-test recipe, move the source tree to the parent of the
pinned revision (an upstream commit, no local changes) while staying on
the devtool branch, run 'devtool update-recipe' in the default auto
mode, and assert the recipe's SRCREV is updated to the checked-out
revision.

Without the preceding fix the mode guesser cannot see gitsm:// URIs,
falls into patch mode, reports "No patches or files need updating" and
leaves the recipe untouched, and this test fails with:

    AssertionError: Missing file changes: [(' M', '.*/git-submodule-test.bb$')]

No existing test exercises the auto->srcrev guess for any URI scheme:
the auto-mode arm of test_devtool_update_recipe_git covers the
local-commits->patch direction only.

AI-Generated: Uses Claude (claude-sonnet-5)
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 33 +++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index a10eb0c784..6df07f8c5e 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1378,6 +1378,39 @@ class DevtoolUpdateTests(DevtoolBase):
                            ('??', '%s/0002-Add-a-new-file.patch' % relpatchpath)]
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
 
+    def test_devtool_update_recipe_gitsm(self):
+        # Check that auto mode guesses srcrev update mode for a gitsm:// recipe
+        # when HEAD is on the upstream branch, same as it does for git://
+        testrecipe = 'git-submodule-test'
+        bb_vars = get_bb_vars(['FILE', 'SRC_URI', 'SRCREV'], testrecipe)
+        recipefile = bb_vars['FILE']
+        src_uri = bb_vars['SRC_URI']
+        self.assertIn('gitsm://', src_uri, 'This test expects the %s recipe to be a gitsm recipe' % testrecipe)
+        self._check_repo_status(os.path.dirname(recipefile), [])
+        # First, modify a recipe
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
+        # Check git repo
+        self._check_src_repo(tempdir)
+        # Move the source tree to the parent of the pinned revision, staying
+        # on the devtool branch: a revision reachable from the upstream branch
+        # with no local commits, i.e. the "check out another upstream revision
+        # to move the recipe" workflow the srcrev guess exists to detect
+        result = runCmd('git rev-parse HEAD~1', cwd=tempdir)
+        prevrev = result.output.strip()
+        runCmd('git reset --hard %s' % prevrev, cwd=tempdir)
+        self.add_command_to_tearDown('cd %s; git checkout %s' % (os.path.dirname(recipefile), os.path.basename(recipefile)))
+        result = runCmd('devtool update-recipe %s' % testrecipe)
+        expected_status = [(' M', '.*/%s$' % os.path.basename(recipefile))]
+        self._check_repo_status(os.path.dirname(recipefile), expected_status)
+        result = runCmd('git diff %s' % os.path.basename(recipefile), cwd=os.path.dirname(recipefile))
+        addlines = ['SRCREV = "%s"' % prevrev]
+        removelines = ['SRCREV = "%s"' % bb_vars['SRCREV']]
+        self._check_diff(result.output, addlines, removelines)
+
     def test_devtool_update_recipe_append(self):
         # Check preconditions
         testrecipe = 'minicom'
-- 
2.43.0


