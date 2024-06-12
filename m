Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA71C27C77
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 17:31:36 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.503.1718213489462819306
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jun 2024 10:31:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=nehbl3TQ;
 spf=pass (domain: konsulko.com, ip: 209.85.210.173, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-70599522368so25138b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 10:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1718213488; x=1718818288; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=su7S7nl6POkQPwbEixMPxwjqQXRow7oLXlxBqnILGNM=;
        b=nehbl3TQPvhCgghoXWcNmKkxAXEqNvopvzd5HMMdP8SeyTtJJIGfIXRJVXW9o809pF
         K96ik0/WJ8tKJnFKFWXmqcXRMdE7SZzJuC5c1Ez2jEQOKLUjgZH+sdcsCT3TpU8HnbmQ
         fCzcPMBNDPHIX8IFnIKPNCu+/qxmn1LZ2ZwsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718213488; x=1718818288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=su7S7nl6POkQPwbEixMPxwjqQXRow7oLXlxBqnILGNM=;
        b=FTvgDdUxCLl4pYAD8qCbb4t3jjo88HtO72WzBhLqI7muDSRCmG9TcvT2H+EVsvVtAT
         Ce5lwBON5QhRtFf7cloTFOyP+NUBlsh6c13c4Ft0kPWui3MSWPG4dqnCx+tMuLbvI9Vf
         8OagH2e103bTvi/ELrVi0WT4i4WFR35EHbYZkfRikcW51E6y6SjiLmP88koPUyBa81V9
         boEMZ+iYyzONKBR+gsYC/xvQ64Ghx5ZB9YFkusuop999Mifc7CGiOBrLYsHVDZYJiSxe
         kBl56vhNbIa9w6JaEw3CCW2QQF8o/Uvgj7DR90hTJ2JKT+bq61Bw+dOD/ilywPDAJybt
         WiOg==
X-Gm-Message-State: AOJu0YxMPklHEe6hSTCDMqTX3QX2GSgm0+G5xDxs0DuWLyoLxbSv2bl3
	4SsfqrLBS6q+NFQ70KUIzmJVf30GQY1SJhCCEluTwGcfa09XMxDuO2VeUKWrlxcy6BoSLHkzbDC
	aMB0=
X-Google-Smtp-Source: AGHT+IHJB3DGFfgmpuwpb/wc0nXeJcuHQcvMQOITi2Bx6LyyGfqoL9dPERsliBQX9FOFqWxRyTE35Q==
X-Received: by 2002:a05:6a21:8197:b0:1b5:2fbb:2d84 with SMTP id adf61e73a8af0-1b8a9b86440mr2287984637.28.1718213488203;
        Wed, 12 Jun 2024 10:31:28 -0700 (PDT)
Received: from localhost ([2601:1c2:c182:4da0::2bc4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f84619fcfasm9508045ad.282.2024.06.12.10.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 10:31:27 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v3 1/5] devtool upgrade: enable RECIPE_UPDATE_EXTRA_TASKS
Date: Wed, 12 Jun 2024 10:28:49 -0700
Message-ID: <20240612172847.3487329-3-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <42b2ce8cde32d269a78b31f39e75467986508eee.1718120117.git.tim.orling@konsulko.com>
References: <42b2ce8cde32d269a78b31f39e75467986508eee.1718120117.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 17:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200578

From: Tim Orling <tim.orling@konsulko.com>

For some recipes, such as those that inherit cargo-update-recipe-crates,
we need to run additional tasks once the new sources have been unpacked.

Introduce a new variable RECIPE_UPDATE_EXTRA_TASKS which is a space-
delimited list of tasks to run after the new sources have been
unpacked in scripts/lib/devtool/upgrade.py ugrade() method.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Changes in v3:
  * Address rburton review comment
  * Since the variable is recipe scoped (as is the class being tested),
    we do not need the :${PN} appended to RECIPE_UPDATE_EXTRA_TASKS

Changes in v2:
  * Drop the try/except in the _run_recipe_update_extra_tasks method
  * Check the result of each task (tinfoil.build_targets) and raise
    a DevtoolError on failure

 scripts/lib/devtool/upgrade.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index a8130ed23f5..8e13833b51c 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -534,6 +534,15 @@ def _generate_license_diff(old_licenses, new_licenses):
             diff = diff + line
     return diff
 
+def _run_recipe_update_extra_tasks(pn, rd, tinfoil):
+    tasks = []
+    for task in (rd.getVar('RECIPE_UPDATE_EXTRA_TASKS') or '').split():
+        logger.info('Running extra recipe update task: %s' % task)
+        res = tinfoil.build_targets(pn, task, handle_events=True)
+
+        if not res:
+            raise DevtoolError('Running extra recipe update task %s for %s failed' % (task, pn))
+
 def upgrade(args, config, basepath, workspace):
     """Entry point for the devtool 'upgrade' subcommand"""
 
@@ -609,6 +618,8 @@ def upgrade(args, config, basepath, workspace):
                         copied, config.workspace_path, rd)
         standard._add_md5(config, pn, af)
 
+        _run_recipe_update_extra_tasks(pn, rd, tinfoil)
+
         update_unlockedsigs(basepath, workspace, args.fixed_setup, [pn])
 
         logger.info('Upgraded source extracted to %s' % srctree)
-- 
2.45.2


