Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B2F2C41513
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 10:43:08 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.70011.1718966578655085886
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jun 2024 03:42:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mIhEhKg5;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a6f1c4800easo204641966b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 03:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718966577; x=1719571377; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L1VVr5bDEPNd9qI/lFXD+1ZaBheV50MScFx58O85tow=;
        b=mIhEhKg5UG5fE9z1ostqozKZsdnAKAXxcGkyvZ74RzVjiR1WtKZvluNo6y2oAej13A
         lkxl+Ki82NiF4vUbZx4E9lBGz1HcZH+uTsH2/wih7UvGVhUD6GCwi0wA6I4QywJGHbwT
         e/CgN6uCbJdR5Z9K67Bk1g1f+9ercBhCqEW6UXsD9eRviVZPUEjOeyjlqweMQy6IbA2X
         /+87L5nERGpFQahRVLWdKv0q8jK+vome2fEhM1vNaKVvMW8bjd/H02gudzHPKbpu/3NL
         brPRRHUTVKfIRMl8wAXRAoD2pMFOKY5wrU6/dWO4JW+2nRKxv8DiuY3gp9l7mBDkUm24
         hEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718966577; x=1719571377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L1VVr5bDEPNd9qI/lFXD+1ZaBheV50MScFx58O85tow=;
        b=eB51qfIoUu1uhORUAkNZnaefdKdraC22OvPJ9oxO1jXRsdgdPwWDIuqRxMcgYlIGs8
         vxSSceBl6GkpFE8m/hSt9eI49bOpW9oo2tSIrCqRiO+zfveWKlqSye6Dyd5ELPJSvUmf
         I7suRYQfH/vnpj40MBMqYttsVNl0sn5K3q0svzFWekOxnWr5Pgyab90VvLC69DGYFDK7
         fCRQbPvjHazDHPFDQByGBApWi+NgynIsM9LVivm4YukKrmSW9sZuIYvQkqmQr3LBanf1
         KnJn/VbrkcswW5MGAdlk06LHk49NaAw8ezXNLZco52hKjblvzEqLQ9dqjK2BKL8WbC6b
         jHIg==
X-Gm-Message-State: AOJu0Yz/ImiFpoAzu3zTPZ46X3TiYmI2bNw8f2jxDujq4Y1Hl2DVBNtM
	HO/v12s427y6VBet33tL1bHjcvLtRYuwSlD+BL3SqwxGWFHPyEi/Tq4HJQ==
X-Google-Smtp-Source: AGHT+IECdReVYmCVbT2YoDHB5oeAv875KB3lu2fStV0ZQ6qhv3iocFk6gspxnEaf8HiePp/fz4pI1w==
X-Received: by 2002:a17:906:1cd9:b0:a6f:1f40:600a with SMTP id a640c23a62f3a-a6fab62f44amr404587266b.30.1718966576705;
        Fri, 21 Jun 2024 03:42:56 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf560addsm71378066b.175.2024.06.21.03.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 03:42:56 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/11] devtool/upgrade: rename RECIPE_UPDATE_EXTRA_TASKS -> RECIPE_UPGRADE_EXTRA_TASKS
Date: Fri, 21 Jun 2024 12:34:04 +0200
Message-Id: <20240621103414.2842509-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 10:43:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201006

From: Alexander Kanavin <alex@linutronix.de>

'UPDATE' as a name is somewhat unfortunate as the variable is intended only for
the 'devtool upgrade' operation and devtool also has an 'update-recipe' operation.

I also intend to introduce additional variables in RECIPE_UPGRADE_* space,
so it's best to unify names now, while RECIPE_UPDATE_EXTRA_TASKS is very fresh.

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
index 8e13833b51c..1dd965d98d4 100644
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


