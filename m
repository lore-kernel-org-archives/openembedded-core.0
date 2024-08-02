Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0B0CC52D70
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 16:09:24 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.96519.1722614954598924315
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 09:09:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fMcYl9tX;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52efbb55d24so13100149e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 09:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722614953; x=1723219753; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kn5M5ALUABROlziVg43CTSO6JrVy9ERHTjBfLsQyKEQ=;
        b=fMcYl9tXB6XtA00awwEOHT7LWMn0lnnqQLMbzuVnTcdCun2rXrVXZmAlBwuzVozc8u
         qseOKRqx4oLRArsUTDNgLAF1cVCNNwsEAJcZQmhMvHC8GN50rz+vHhMd1EBvHN4cLqt7
         S7w63Kz0B/mVEcpXLXVQTihg3Fm5tH/KwsICd2g5Z25JvEkgXmEAwxzYxXxZNnhlPuwn
         c7mFa9Slos+/Zc0/r4JKJ8Kj5hQilUoTGXqehssuu53Cc5kir2HzUhM6D3e1af33Nf+M
         RaIivkta12uhXvlSo2Lha8vA8gtlNcZIhIwSdNi4sXbsCADKyMmmYtOcchFqyI/PcMfC
         tkBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722614953; x=1723219753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kn5M5ALUABROlziVg43CTSO6JrVy9ERHTjBfLsQyKEQ=;
        b=TFZ1Rj3RUgxZPhQDA635jh4Jw4wILsUHXW0xB8BrFNsSXs3cG3Sk26XZiHlFH1faIl
         tUumOAhPeiygog9ro+WDXy9iQvciUWpPqLY+KOKm16XgGsiHMEf+omHKqBO6+fHjuLEG
         B2w/1T8uwQMTIl9Js0aqidB5fEVNZIZSEs3BsZMfoh2NtFu+ls/cT9PL79idHg7/4Wa9
         No0UDImTbKzUPY9G/b9CfMm+d8J0xjBxUD5heSYWAamSp81nhCk7ECJbOLbGcjKzNd+C
         59U6MT2Bnhmbr82FJEaWmpJS+8b/r5GcWRQ1A1hvqMwSnPS6r46mHCeI3IEW7tsyKdz/
         kzSg==
X-Gm-Message-State: AOJu0YxJcHiP1vkUvznD6JltBF28YDjKMz7ancby2AgFboY06A4HUWt3
	UHXRiNDZS0h4K3uWmfN5ENx0E/FWz3XexdI3sZYqh7do/47IfqbjYZkuU3yk
X-Google-Smtp-Source: AGHT+IHN8j+yGjU8IQKxs5AMoxLFECLkMg+eE+OYHInHsqN8eFqZA4EhutDjORXNbJDvkhrFXzZF5A==
X-Received: by 2002:a05:6512:b8d:b0:52e:8071:e89d with SMTP id 2adb3069b0e04-530bb3b45f5mr3768637e87.40.1722614952342;
        Fri, 02 Aug 2024 09:09:12 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e84340sm114289866b.185.2024.08.02.09.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 09:09:11 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/4] devtool/upgrade: rename RECIPE_UPDATE_EXTRA_TASKS -> RECIPE_UPGRADE_EXTRA_TASKS
Date: Fri,  2 Aug 2024 18:09:00 +0200
Message-Id: <20240802160903.2800657-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 16:09:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202922

From: Alexander Kanavin <alex@linutronix.de>

'UPDATE' as a name is somewhat unfortunate as the variable is intended only for
the 'devtool upgrade' operation and devtool also has an 'update-recipe' operation.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/cargo-update-recipe-crates.bbclass |  2 +-
 meta/lib/oeqa/selftest/cases/devtool.py                |  2 +-
 scripts/lib/devtool/upgrade.py                         | 10 +++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
index a19ce16b467..3251d5ef2e5 100644
--- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
+++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
@@ -18,7 +18,7 @@ do_update_crates[depends] = "python3-native:do_populate_sysroot"
 do_update_crates[nostamp] = "1"
 do_update_crates[doc] = "Update the recipe by reading Cargo.lock and write in ${THISDIR}/${BPN}-crates.inc"
 
-RECIPE_UPDATE_EXTRA_TASKS += "do_update_crates"
+RECIPE_UPGRADE_EXTRA_TASKS += "do_update_crates"
 
 # The directory where to search for Cargo.lock files
 CARGO_LOCK_SRC_DIR ??= "${S}"
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 432d9c9a673..7d617739809 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -2017,7 +2017,7 @@ class DevtoolUpgradeTests(DevtoolBase):
             newlines = f.readlines()
         self.assertEqual(desiredlines, newlines)
 
-    def test_devtool_upgrade_recipe_update_extra_tasks(self):
+    def test_devtool_upgrade_recipe_upgrade_extra_tasks(self):
         # Check preconditions
         self.assertTrue(not os.path.exists(self.workspacedir), 'This test cannot be run with a workspace directory under the build directory')
         self.track_for_cleanup(self.workspacedir)
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 9ec66488516..eed3a49e4b2 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -534,14 +534,14 @@ def _generate_license_diff(old_licenses, new_licenses):
             diff = diff + line
     return diff
 
-def _run_recipe_update_extra_tasks(pn, rd, tinfoil):
+def _run_recipe_upgrade_extra_tasks(pn, rd, tinfoil):
     tasks = []
-    for task in (rd.getVar('RECIPE_UPDATE_EXTRA_TASKS') or '').split():
-        logger.info('Running extra recipe update task: %s' % task)
+    for task in (rd.getVar('RECIPE_UPGRADE_EXTRA_TASKS') or '').split():
+        logger.info('Running extra recipe upgrade task: %s' % task)
         res = tinfoil.build_targets(pn, task, handle_events=True)
 
         if not res:
-            raise DevtoolError('Running extra recipe update task %s for %s failed' % (task, pn))
+            raise DevtoolError('Running extra recipe upgrade task %s for %s failed' % (task, pn))
 
 def upgrade(args, config, basepath, workspace):
     """Entry point for the devtool 'upgrade' subcommand"""
@@ -618,7 +618,7 @@ def upgrade(args, config, basepath, workspace):
                         copied, config.workspace_path, rd)
         standard._add_md5(config, pn, af)
 
-        _run_recipe_update_extra_tasks(pn, rd, tinfoil)
+        _run_recipe_upgrade_extra_tasks(pn, rd, tinfoil)
 
         update_unlockedsigs(basepath, workspace, args.fixed_setup, [pn])
 
-- 
2.39.2


