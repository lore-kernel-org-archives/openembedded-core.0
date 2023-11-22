Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A471C61DB1
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 11:08:37 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.16867.1700651312617586759
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 03:08:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=lTaFKKV9;
 spf=pass (domain: baylibre.com, ip: 209.85.167.51, mailfrom: jstephan@baylibre.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50aab3bf71fso4955195e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 03:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700651310; x=1701256110; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phpICPWFxBEcYAsV80r7Mo7i97DBXSsmdblfEu/4Wtc=;
        b=lTaFKKV9PFg18mh7mGMmtiJ2g0kUj5xrmn8fUOuUd+5rVzzwT3wy6W074tWQYOsFlB
         2M/af3A9H4KjDMP/dbkE2PRaEGEf3WpuHltqnBtxAcgZkY20Vemd7ws9HsMJKH07u4DJ
         RDEQkg/+BX3cZzQmnWBlVXkJ40M5n4uqOQlNERM8yqMNodYxGJo975xQhMHEXI6puiHw
         Ws9YNSyqHIvWsEsOAYiwxWtVPVqYwhs5iRrJU5hmmwWmB7LoK5rxT7oAqJ28Un8nF1Ha
         ya93sRCPvO+DHm+eNmjBkXQzecE4+nC68Ii22kwPgd0QVoUlpHZe1slkQAlLhzIJctPB
         GKhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700651310; x=1701256110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=phpICPWFxBEcYAsV80r7Mo7i97DBXSsmdblfEu/4Wtc=;
        b=n1fl+bwvS5N2DiI9xFnFn503Z9BiwNonFbIYxEXNiIjq8ixRcdGCu0+Xt9cYPE3XQg
         GInKgSmqaJnT9d509gsOprcJPLBEzS6q+tg8R2Wnu29+yfnCoNX/tU0ZCWC8CrAiOCvZ
         LFzVH3vjXBzOVllnjN3H9Ob03wV8dyMYgw6vN7VilDj1yQvxJLIG6Fo20HqlUmFi3Xca
         8/hgXYGBi4qWQr/MdtP3LW4lsKc09mv604kx8ghGy0avAxewYc0AwwyLSf4+/HnCfpgG
         UfuvAxnyJA7EZMa9twuF2zhYv6Xt5lZ7cgVYCWS9xKkRIRicr2CkxF4J5D8jAwh5f81J
         Gchg==
X-Gm-Message-State: AOJu0Ywy5suZ0ABA6pv6x8ykGg6DKMHHEic0Zb2p1GN7MYEJFiBKEgkE
	ksNE/b3pso/wGll3J4ZFHeiiZVnnFgqGhwa4rausgA==
X-Google-Smtp-Source: AGHT+IEcqCc6Hr5eF5s0EQBYnHv6LdiiRPenIPJRBBje5viWXlxm9jiVfK6tk8vBWekVcdoWaa2wnQ==
X-Received: by 2002:a05:6512:2082:b0:507:9a49:3f23 with SMTP id t2-20020a056512208200b005079a493f23mr1221720lfr.18.1700651309733;
        Wed, 22 Nov 2023 03:08:29 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id o23-20020aa7c7d7000000b0053e88c4d004sm5790713eds.66.2023.11.22.03.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 03:08:29 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH 5/6] oeqa/selftest/devtool: add test for git submodules
Date: Wed, 22 Nov 2023 12:08:17 +0100
Message-ID: <20231122110818.932618-6-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231122110818.932618-1-jstephan@baylibre.com>
References: <20231122110818.932618-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 11:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191065

Add a test for gitsm recipes.
This tests that we can do changes on submodules, commit them and
properly extract the patches

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 47 +++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index ab58971fec7..2a11886e4b5 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1598,6 +1598,53 @@ class DevtoolUpdateTests(DevtoolBase):
         # Try building
         bitbake('%s -c patch' % testrecipe)
 
+    def test_devtool_git_submodules(self):
+        # This tests if we can add a patch in a git submodule and extract it properly using devtool finish
+        # Check preconditions
+        self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
+        self.track_for_cleanup(self.workspacedir)
+        recipe = 'vulkan-samples'
+        src_uri = get_bb_var('SRC_URI', recipe)
+        self.assertIn('gitsm://', src_uri, 'This test expects the %s recipe to be a git recipe with submodules' % recipe)
+        oldrecipefile = get_bb_var('FILE', recipe)
+        recipedir = os.path.dirname(oldrecipefile)
+        result = runCmd('git status --porcelain .', cwd=recipedir)
+        if result.output.strip():
+            self.fail('Recipe directory for %s contains uncommitted changes' % recipe)
+        self.assertIn('/meta/', recipedir)
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        result = runCmd('devtool modify %s %s' % (recipe, tempdir))
+        self.assertExists(os.path.join(tempdir, 'CMakeLists.txt'), 'Extracted source could not be found')
+        # Test devtool status
+        result = runCmd('devtool status')
+        self.assertIn(recipe, result.output)
+        self.assertIn(tempdir, result.output)
+        # Modify a source file in a submodule, (grab the first one)
+        result = runCmd('git submodule --quiet foreach \'echo $sm_path\'', cwd=tempdir)
+        submodule = result.output.splitlines()[0]
+        submodule_path = os.path.join(tempdir, submodule)
+        runCmd('echo "#This is a first comment" >> testfile', cwd=submodule_path)
+        result = runCmd('git status --porcelain . ', cwd=submodule_path)
+        self.assertIn("testfile", result.output)
+        runCmd('git add testfile; git commit -m "Adding a new file"', cwd=submodule_path)
+
+        # Try finish to the original layer
+        self.add_command_to_tearDown('rm -rf %s ; cd %s ; git checkout %s' % (recipedir, os.path.dirname(recipedir), recipedir))
+        runCmd('devtool finish -f %s meta' % recipe)
+        result = runCmd('devtool status')
+        self.assertNotIn(recipe, result.output, 'Recipe should have been reset by finish but wasn\'t')
+        self.assertNotExists(os.path.join(self.workspacedir, 'recipes', recipe), 'Recipe directory should not exist after finish')
+        expected_status = [(' M', '.*/%s$' % os.path.basename(oldrecipefile)),
+                           ('??', '.*/.*-Adding-a-new-file.patch$')]
+        self._check_repo_status(recipedir, expected_status)
+        # Make sure the patch is added to the recipe with the correct "patchdir" option
+        result = runCmd('git diff .', cwd=recipedir)
+        addlines = [
+           'file://0001-Adding-a-new-file.patch;patchdir=%s \\\\' % submodule
+        ]
+        self._check_diff(result.output, addlines, [])
 
 class DevtoolExtractTests(DevtoolBase):
 
-- 
2.42.0


