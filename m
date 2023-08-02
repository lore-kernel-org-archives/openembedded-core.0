Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C760C001DF
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 14:24:39 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.16620.1690986278288863561
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 07:24:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=n54M7ak6;
 spf=pass (domain: baylibre.com, ip: 209.85.221.48, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-31751d7d96eso5884269f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 07:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690986276; x=1691591076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+I6XDFBaTn8V7kyBaNTIJ4iu87wSZOjTRTUfXfYTh5c=;
        b=n54M7ak6LCsofMFAfVbxMp56omjybpcEEJvhTLAtFkS/MZnNgzGS4n4ZSqB73Mb7be
         nf7Fy0Vu3D0n2wZ0NucGeopysxk512eGiiuilKP3eADdA65TOessdXrZjQDEyuuIRZkB
         9KEDxgm8RMzmJjRWSTH/vlIsV4NrJqdKeJsnl8U/tmIPpoThHzI3e7cA/RZvcwwnil53
         Lz0k0O8Psv2TNWXmRX0LIuhmKwd0Z7uB66ERIo8aLPvEWlKAC9xc0XWa1MtzV4HAoAGp
         cxsexP9uhCRI/HxMpn++T0h6WdxEuvvA1/BtOcEtnwXIZEbQThd3ALlj+JyxGvCzcIvg
         2AtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690986276; x=1691591076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+I6XDFBaTn8V7kyBaNTIJ4iu87wSZOjTRTUfXfYTh5c=;
        b=SEWxT6iGdGzJDMKIhOiBAudcn+dAxbNLqicxnFQTkXGtieWRvOWiAfMukJspqu9imN
         a4l8cirrIBwLBsOJQp/n8v9rlV++gkj1eP9irh9di8XogGwY2SYfAyerOsJ8zkV27cde
         pCgi3eAL+/BsL8hK3hHXPGyj0iBh7dQDbuJDUivoalPpuACherbveaCIYHcqezYWUQsg
         BXMHLQ6xXuFfdma4SiOj6xUUQlBXDbSDSWxyDv98R2w6DVSCf1UYMnhXGxmX2qW9Wqxq
         eAURWsL7BuXpDlZhmJekalSUVTJSR5xp0Pst7evFu1+3UQbMb9ZQcImkZ1ga7aLNsvQ8
         yu/A==
X-Gm-Message-State: ABy/qLZbxe2QduBahwVL0X1faFPEdDbiT9GHlTLW6wn/SRWC0+Wyoonr
	IjAs9bs83blghd5e1SoPxZxB+b9y++fhrvcjnzamVA==
X-Google-Smtp-Source: APBJJlHzmOcRz/jF2wOtioAQSOwjF6ijyVpPSGNBu89cFHWxpN2Ia/zc2TkqnRdxCI+Ncwoj2IeBHA==
X-Received: by 2002:adf:f0cf:0:b0:314:2e95:1ec9 with SMTP id x15-20020adff0cf000000b003142e951ec9mr5148841wro.10.1690986276621;
        Wed, 02 Aug 2023 07:24:36 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id y17-20020adfd091000000b003178dc2371bsm15707079wrh.7.2023.08.02.07.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 07:24:36 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v4 5/5] oeqa/selftest/bblock: add self test for bblock tool
Date: Wed,  2 Aug 2023 16:24:32 +0200
Message-ID: <20230802142432.2296716-6-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802142432.2296716-1-jstephan@baylibre.com>
References: <20230802142432.2296716-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 14:24:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185408

it implements various combination of locking single/multiple recipe(s)/task(s)

it also tests that locked sig are architecture dependant

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/lib/oeqa/selftest/cases/bblock.py | 146 +++++++++++++++++++++++++
 1 file changed, 146 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/bblock.py

diff --git a/meta/lib/oeqa/selftest/cases/bblock.py b/meta/lib/oeqa/selftest/cases/bblock.py
new file mode 100644
index 00000000000..803ea3d64c8
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/bblock.py
@@ -0,0 +1,146 @@
+#
+# Copyright (c) 2023 BayLibre, SAS
+# Author: Julien Stepahn <jstephan@baylibre.com>
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+import os
+import re
+
+import oeqa.utils.ftools as ftools
+from oeqa.utils.commands import runCmd, get_bb_var, get_bb_vars, bitbake
+
+from oeqa.selftest.case import OESelftestTestCase
+
+class BBLock(OESelftestTestCase):
+
+    @classmethod
+    def setUpClass(cls):
+        super(BBLock, cls).setUpClass()
+        cls.lockfile = cls.builddir+"/conf/bblock.conf"
+
+    def unlock_recipes(self, recipes=None, tasks=None):
+        cmd = 'bblock -r '
+        if recipes:
+            cmd += ' '.join(recipes)
+        if tasks:
+            cmd += ' -t ' + ','.join(tasks)
+        result = runCmd(cmd)
+
+        if recipes:
+            # ensure all signatures are removed from lockfile
+            contents = ftools.read_file(self.lockfile)
+            for recipe in recipes:
+                for task in tasks:
+                    find_in_contents = re.search("SIGGEN_LOCKEDSIGS_.+\s\+=\s\"%s:%s:.*\"" % (recipe, task), contents)
+                    self.assertFalse(find_in_contents, msg = "%s:%s should not be present into bblock.conf anymore" % (recipe, task))
+                self.assertExists(self.lockfile)
+        else:
+            self.assertNotExists(self.lockfile)
+
+    def lock_recipes(self, recipes, tasks=None, machine=None):
+        cmd = 'bblock ' + ' '.join(recipes)
+        if tasks:
+            cmd += ' -t ' + ','.join(tasks)
+
+        if machine:
+            cmd = "MACHINE=" + machine + " " + cmd
+        with open("/tmp/tmp.txt", "w") as file:
+            file.write(cmd)
+        result = runCmd(cmd)
+
+        self.assertExists(self.lockfile)
+
+        # ensure all signatures are added to lockfile
+        contents = ftools.read_file(self.lockfile)
+        for recipe in recipes:
+            for task in tasks:
+                find_in_contents = re.search("SIGGEN_LOCKEDSIGS_.+\s\+=\s\"%s:%s:.*\"" % (recipe, task), contents)
+                self.assertTrue(find_in_contents, msg = "%s:%s was not added into bblock.conf. bblock output: %s" % (recipe, task, result.output))
+
+    def modify_tasks(self, recipes, tasks):
+        task_append = ""
+        for recipe in recipes:
+            bb_vars = get_bb_vars(['PV'], recipe)
+            recipe_pv = bb_vars['PV']
+            recipe_append_file = recipe + '_' + recipe_pv + '.bbappend'
+
+            os.mkdir(os.path.join(self.testlayer_path, 'recipes-test', recipe))
+            recipe_append_path = os.path.join(self.testlayer_path, 'recipes-test', recipe, recipe_append_file)
+
+            for task in tasks:
+                task_append += "%s:append() {\necho \"modify task hash\"\n}\n" % task
+            ftools.write_file(recipe_append_path, task_append)
+            self.add_command_to_tearDown('rm -rf %s' % os.path.join(self.testlayer_path, 'recipes-test', recipe))
+
+    def test_lock_single_recipe_single_task(self):
+        recipes = ["quilt"]
+        tasks = ["do_compile"]
+        self._run_test(recipes, tasks)
+
+    def test_lock_single_recipe_multiple_tasks(self):
+        recipes = ["quilt"]
+        tasks = ["do_compile" ,"do_install"]
+        self._run_test(recipes, tasks)
+
+    def test_lock_architecture_specific(self):
+        recipes = ["quilt"]
+        tasks = ["do_compile"]
+
+        # lock quilt's do_compile task for qemuarm machine
+        self.lock_recipes(recipes, tasks, "qemuarm")
+
+        # modify quilt's do_compile task
+        self.modify_tasks(recipes, tasks)
+
+        # build quilt using by default qemux86-64.
+        # No Note/Warning should be emitted since sig is locked for qemuarm
+        # (quilt package is architecture dependant)
+        info_message = "NOTE: The following recipes have locked tasks: " + recipes[0]
+        warn_message = "The %s:%s sig is computed to be" % (recipes[0], tasks[0])
+        result = bitbake(recipes[0] + " -n")
+        self.assertNotIn(info_message, result.output)
+        self.assertNotIn(warn_message, result.output)
+
+    def test_lock_multiple_recipe_single_task(self):
+        recipes = ["quilt", "bc"]
+        tasks= ["do_compile"]
+        self._run_test(recipes, tasks)
+
+    def _run_test(self, recipes, tasks=None):
+        # unlock all recipes and ensure no bblock.conf file exist
+        self.unlock_recipes()
+
+        # lock tasks for recipes
+        result = self.lock_recipes(recipes, tasks)
+
+        # build recipes. At this stage we should have a Note about recipes
+        # having locked task's sig, but no warning since sig still match
+        info_message = "NOTE: The following recipes have locked tasks: " + " ".join(recipes)
+        for recipe in recipes:
+            result = bitbake(recipe + " -n")
+            self.assertIn(info_message, result.output)
+            for task in tasks:
+                warn_message = "The %s:%s sig is computed to be" % (recipe, task)
+                self.assertNotIn(warn_message, result.output)
+
+        ## modify all tasks that are locked to trigger a sig change then build the recipes
+        ## at this stage we should have a Note as before, but also a warning for all
+        ## locked stage indicating the sig mismatch
+        self.modify_tasks(recipes, tasks)
+        for recipe in recipes:
+            result = bitbake(recipe + " -n")
+            self.assertIn(info_message, result.output)
+            for task in tasks:
+                warn_message = "The %s:%s sig is computed to be" % (recipe, task)
+                self.assertIn(warn_message, result.output)
+
+        # unlock all tasks and rebuild, no more Note/Warning should remain
+        self.unlock_recipes(recipes, tasks)
+        for recipe in recipes:
+            result = bitbake(recipe + " -n")
+            self.assertNotIn(info_message, result.output)
+            for task in tasks:
+                warn_message = "The %s:%s sig is computed to be" % (recipe, task)
+                self.assertNotIn(warn_message, result.output)
-- 
2.41.0


