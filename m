Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACFC4CE7A97
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 08:05:09 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.56865.1695629101551783433
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Sep 2023 01:05:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=PrI71RHC;
 spf=pass (domain: baylibre.com, ip: 209.85.221.41, mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-323168869daso3230987f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 01:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695629100; x=1696233900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDGl7H9sTXMwHZMNo4kEhpWMHlVdQNts6Kvuv2MRZgQ=;
        b=PrI71RHCN4Pke1HyPVdRltxe8ua9feSiUhs2D1mn3J3JQJ59KHaJQnUCkfoGyiy/Vo
         LnPw1QYo3fhyBbGi58TBTLQQqN28SUVD8zHQ1Lnrgmy//jbmgfKcnXwgml2OD810ZKJf
         GcaMlP7vdzg/oL4zucSEY+EvjyoVRgwGLoGXI+yCeGKuOq5pTigvaHAePXbSayUEMfhl
         ljb+qAmGe6vWWFzoNQeWZ49zEm8pfEUYCvNxvjO3kZKYqCJWyUZkhz0lDUbe5PzBQeM7
         AjfjbblvdKhxeEtss8BcQlULc31Q1eFCcOoB2NshCfiFf6PjUeUuQWrHs56Dd8TbtgJN
         vAKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695629100; x=1696233900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MDGl7H9sTXMwHZMNo4kEhpWMHlVdQNts6Kvuv2MRZgQ=;
        b=EETAALc64qnp/Q8LhDSWosTlIVD6L7zvFHBpkq8trYAbTaakt0lvdpEkPxDQua/Zf5
         OyncyutjAOJEeOGYWNl3XodiRHmiFrzHv4d5BqLDWTqWMr/oYoMoZMMUWT9vZ2uy3MvG
         +9RwJQWySbsx0JG3IyI16hRMUfZ4O4vetPEjBXlRt9cthu1AkAv0vyrFp6NsK8k5xvM7
         Z/55AJnwpeSH5rrHe8uUrtxVOsHQHzi1zDzV3kcNyYFF37280gVneDUGvbekqA1sfeZA
         IVZvw/dngeOVQ7mAcuPnpSKX/sbWWXP8sDr1M3KqPLft6umzhiLbHtz5zpOR0+9iWP8H
         eB3w==
X-Gm-Message-State: AOJu0YzE33dom0KUivbZPVAN/WwnNqr7fxy8cdRnmqBVF9Sr7It74XLB
	tVzB/RTH+EAvZy4dx0mcSCVbpmYwSHzpWKUmUcE=
X-Google-Smtp-Source: AGHT+IFEMBb8yEOnYlp9QoHNlsHNQ7fCpObnW9w20ZX0AoG7/sZdfqXysVb1ubEKvrlq/9fVhYsb9Q==
X-Received: by 2002:a5d:4d83:0:b0:31a:d4d0:6e98 with SMTP id b3-20020a5d4d83000000b0031ad4d06e98mr4894978wru.8.1695629099873;
        Mon, 25 Sep 2023 01:04:59 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id q12-20020a05600c040c00b0040586360a36sm3196950wmb.17.2023.09.25.01.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 01:04:59 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v5 5/5] oeqa/selftest/bblock: add self test for bblock tool
Date: Mon, 25 Sep 2023 10:04:52 +0200
Message-ID: <20230925080452.803540-6-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230925080452.803540-1-jstephan@baylibre.com>
References: <20230925080452.803540-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Sep 2023 08:05:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188179

it implements various combination of locking single/multiple recipe(s)/task(s)

it also tests that locked sig are architecture dependant

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/lib/oeqa/selftest/cases/bblock.py | 201 +++++++++++++++++++++++++
 1 file changed, 201 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/bblock.py

diff --git a/meta/lib/oeqa/selftest/cases/bblock.py b/meta/lib/oeqa/selftest/cases/bblock.py
new file mode 100644
index 00000000000..07143c59676
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/bblock.py
@@ -0,0 +1,201 @@
+#
+# Copyright (c) 2023 BayLibre, SAS
+# Author: Julien Stepahn <jstephan@baylibre.com>
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+
+import os
+import re
+import bb.tinfoil
+
+import oeqa.utils.ftools as ftools
+from oeqa.utils.commands import runCmd, get_bb_var, get_bb_vars, bitbake
+
+from oeqa.selftest.case import OESelftestTestCase
+
+
+class BBLock(OESelftestTestCase):
+    @classmethod
+    def setUpClass(cls):
+        super(BBLock, cls).setUpClass()
+        cls.lockfile = cls.builddir + "/conf/bblock.conf"
+
+    def unlock_recipes(self, recipes=None, tasks=None):
+        cmd = "bblock -r "
+        if recipes:
+            cmd += " ".join(recipes)
+        if tasks:
+            cmd += " -t " + ",".join(tasks)
+        result = runCmd(cmd)
+
+        if recipes:
+            # ensure all signatures are removed from lockfile
+            contents = ftools.read_file(self.lockfile)
+            for recipe in recipes:
+                for task in tasks:
+                    find_in_contents = re.search(
+                        'SIGGEN_LOCKEDSIGS_.+\s\+=\s"%s:%s:.*"' % (recipe, task),
+                        contents,
+                    )
+                    self.assertFalse(
+                        find_in_contents,
+                        msg="%s:%s should not be present into bblock.conf anymore"
+                        % (recipe, task),
+                    )
+                self.assertExists(self.lockfile)
+        else:
+            self.assertNotExists(self.lockfile)
+
+    def lock_recipes(self, recipes, tasks=None):
+        cmd = "bblock " + " ".join(recipes)
+        if tasks:
+            cmd += " -t " + ",".join(tasks)
+
+        result = runCmd(cmd)
+
+        self.assertExists(self.lockfile)
+
+        # ensure all signatures are added to lockfile
+        contents = ftools.read_file(self.lockfile)
+        for recipe in recipes:
+            if tasks:
+                for task in tasks:
+                    find_in_contents = re.search(
+                        'SIGGEN_LOCKEDSIGS_.+\s\+=\s"%s:%s:.*"' % (recipe, task),
+                        contents,
+                    )
+                    self.assertTrue(
+                        find_in_contents,
+                        msg="%s:%s was not added into bblock.conf. bblock output: %s"
+                        % (recipe, task, result.output),
+                    )
+
+    def modify_tasks(self, recipes, tasks):
+        task_append = ""
+        for recipe in recipes:
+            bb_vars = get_bb_vars(["PV"], recipe)
+            recipe_pv = bb_vars["PV"]
+            recipe_append_file = recipe + "_" + recipe_pv + ".bbappend"
+
+            os.mkdir(os.path.join(self.testlayer_path, "recipes-test", recipe))
+            recipe_append_path = os.path.join(
+                self.testlayer_path, "recipes-test", recipe, recipe_append_file
+            )
+
+            for task in tasks:
+                task_append += "%s:append() {\n#modify task hash \n}\n" % task
+            ftools.write_file(recipe_append_path, task_append)
+            self.add_command_to_tearDown(
+                "rm -rf %s" % os.path.join(self.testlayer_path, "recipes-test", recipe)
+            )
+
+    def test_lock_single_recipe_single_task(self):
+        recipes = ["quilt"]
+        tasks = ["do_compile"]
+        self._run_test(recipes, tasks)
+
+    def test_lock_single_recipe_multiple_tasks(self):
+        recipes = ["quilt"]
+        tasks = ["do_compile", "do_install"]
+        self._run_test(recipes, tasks)
+
+    def test_lock_single_recipe_all_tasks(self):
+        recipes = ["quilt"]
+        self._run_test(recipes, None)
+
+    def test_lock_multiple_recipe_single_task(self):
+        recipes = ["quilt", "bc"]
+        tasks = ["do_compile"]
+        self._run_test(recipes, tasks)
+
+    def test_lock_architecture_specific(self):
+        # unlock all recipes and ensure no bblock.conf file exist
+        self.unlock_recipes()
+
+        recipes = ["quilt"]
+        tasks = ["do_compile"]
+
+        # lock quilt's do_compile task for another machine
+        if self.td["MACHINE"] == "qemux86-64":
+            machine = "qemuarm"
+        else:
+            machine = "qemux86-64"
+
+        self.write_config('MACHINE = "%s"\n' % machine)
+
+        self.lock_recipes(recipes, tasks)
+
+        self.write_config('MACHINE = "%s"\n' % self.td["MACHINE"])
+        # modify quilt's do_compile task
+        self.modify_tasks(recipes, tasks)
+
+        # build quilt using the default machine
+        # No Note/Warning should be emitted since sig is locked for another machine
+        # (quilt package is architecture dependant)
+        info_message = "NOTE: The following recipes have locked tasks: " + recipes[0]
+        warn_message = "The %s:%s sig is computed to be" % (recipes[0], tasks[0])
+        result = bitbake(recipes[0] + " -n")
+        self.assertNotIn(info_message, result.output)
+        self.assertNotIn(warn_message, result.output)
+
+        # unlock all recipes
+        self.unlock_recipes()
+
+    def _run_test(self, recipes, tasks=None):
+        # unlock all recipes and ensure no bblock.conf file exist
+        self.unlock_recipes()
+
+        # lock tasks for recipes
+        result = self.lock_recipes(recipes, tasks)
+
+        if not tasks:
+            tasks = []
+            result = bitbake("-c listtasks " + recipes[0])
+            with bb.tinfoil.Tinfoil() as tinfoil:
+                tinfoil.prepare(config_only=False, quiet=2)
+                d = tinfoil.parse_recipe(recipes[0])
+
+                for line in result.output.splitlines():
+                    if line.startswith("do_"):
+                        task = line.split()[0]
+                        if "setscene" in task:
+                            continue
+                        if d.getVarFlag(task, "nostamp"):
+                            continue
+                        tasks.append(task)
+
+        # build recipes. At this stage we should have a Note about recipes
+        # having locked task's sig, but no warning since sig still match
+        info_message = "NOTE: The following recipes have locked tasks: " + " ".join(
+            recipes
+        )
+        for recipe in recipes:
+            result = bitbake(recipe + " -n")
+            self.assertIn(info_message, result.output)
+            for task in tasks:
+                warn_message = "The %s:%s sig is computed to be" % (recipe, task)
+                self.assertNotIn(warn_message, result.output)
+
+        # modify all tasks that are locked to trigger a sig change then build the recipes
+        # at this stage we should have a Note as before, but also a Warning for all
+        # locked tasks indicating the sig mismatch
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
+
+        # unlock all recipes
+        self.unlock_recipes()
-- 
2.41.0


