Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B77B8C27C75
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 15:55:34 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.213.1718121325219771644
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 08:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kZSTS0zI;
 spf=pass (domain: konsulko.com, ip: 209.85.210.170, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7041f4553ccso3621067b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 08:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1718121324; x=1718726124; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KYhJOT12GQZCe0/faz/DV3rpbOf90Uqlu6yTIJ3vR8o=;
        b=kZSTS0zIPBR8q4AKc6v7ZUL+PQci0CnwjgISTFEGG6rU/0zsSKH7cJF06I/uyM19TI
         sOaomMyfot/cp+QPTeOC3YsRlWVvOFefXnQQNjkngOkQDbiMqgyqmGVLaUv07DtiJ2Q0
         dTwEJ/tPb+NBo7PIgv0aoQeB7RR4oOO2eH7a8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718121324; x=1718726124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KYhJOT12GQZCe0/faz/DV3rpbOf90Uqlu6yTIJ3vR8o=;
        b=RrJprp3VbA+X8L+07Qi4AjBkz5DurVsKCXjnnzmw8BDZN5F9Wgm9t35/U7yzdjk8P+
         mygEek2y+wybGChrq+FE/Ct5hfXpl4c4//LDlLuCLXOP4bXZZz1OYDXy+rRD/KCI3KhK
         Yec5CkZk03ugeHdPu8Z1gXZcYFbZytsjET586MXtK8lCmUw6zn7MD6CEF3M6Frmdod3X
         W5UqUPmX01TLJ4MsjrPGQWedlx3UZywIAXY8ED5J0z/Au33RZbYbnIABlrKh1+DrNUNw
         RdG8EoVQodDbiFOrN3KpgqkgeG3lFqp0B3+1zfkTxx3AE90Ftstmy+PP/hJr+FdUpeER
         wz0w==
X-Gm-Message-State: AOJu0YzdugS0GTS60ABzZXluLM8PQVX+K7zfyFK73ZQM+GVoD0RtrK6m
	huxbXX/wI+qrE9cA59q6KBHpmEWg9fVvIfoyslq2nyae2xd4iQagATZXj+scmvmRxnrUUGXytPv
	Ej0M=
X-Google-Smtp-Source: AGHT+IEq5gxXSO9NNx6oV0JY1elLZk7ZmKbBeL91Lei/EogDNebpqW11mufh4KxuTJsr1MLHMT6TJA==
X-Received: by 2002:a05:6a00:14c5:b0:704:3521:fb58 with SMTP id d2e1a72fcca58-70435228660mr8880465b3a.27.1718121324074;
        Tue, 11 Jun 2024 08:55:24 -0700 (PDT)
Received: from localhost ([2601:1c2:c182:4da0::2bc4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70410b976a9sm7597822b3a.147.2024.06.11.08.55.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 08:55:23 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/5] devtool upgrade: enable RECIPE_UPDATE_EXTRA_TASKS
Date: Tue, 11 Jun 2024 08:55:11 -0700
Message-ID: <42b2ce8cde32d269a78b31f39e75467986508eee.1718120117.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1718120117.git.tim.orling@konsulko.com>
References: <cover.1718120117.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 15:55:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200539

From: Tim Orling <tim.orling@konsulko.com>

For some recipes, such as those that inherit cargo-update-recipe-crates,
we need to run additional tasks once the new sources have been unpacked.

Introduce a new variable RECIPE_UPDATE_EXTRA_TASKS which is a space-
delimited list of tasks to run after the new sources have been
unpacked in scripts/lib/devtool/upgrade.py ugrade() method.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Changes in v2:
  * Drop the try/except in the _run_recipe_update_extra_tasks method
  * Check the result of each task (tinfoil.build_targets) and raise
    a DevtoolError on failure

 scripts/lib/devtool/upgrade.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index a8130ed23f5..87227df1a8f 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -534,6 +534,15 @@ def _generate_license_diff(old_licenses, new_licenses):
             diff = diff + line
     return diff
 
+def _run_recipe_update_extra_tasks(pn, rd, tinfoil):
+    tasks = []
+    for task in (rd.getVar('RECIPE_UPDATE_EXTRA_TASKS:%s' % pn) or '').split():
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


