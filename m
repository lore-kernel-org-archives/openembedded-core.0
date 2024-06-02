Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 120C3C27C44
	for <webhook@archiver.kernel.org>; Sun,  2 Jun 2024 21:01:22 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.68309.1717362072460149319
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jun 2024 14:01:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=TsFCnIdE;
 spf=pass (domain: konsulko.com, ip: 209.85.215.173, mailfrom: tim.orling@konsulko.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-6c4926bf9bbso1542800a12.2
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 14:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1717362071; x=1717966871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FaskyS7vTtJuLRZ/q+YWeMmDIM37+lz9fX1mc9Ft+oU=;
        b=TsFCnIdEjQdLHWqaX7HQH/UI0IQm7i8LGUOIzko9qfbTBtrJKaaukOorPJ58cAxGt9
         EYcyfVYEBXNiWYIV+TUbkmHB0vCI22dWJe2rtqUvIFeMTv6NAbbqHY1opJ7gWR0jWL0f
         GDTjkJf3a7lkbetis6qU4wxUk3Omfnhk8iy00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717362071; x=1717966871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FaskyS7vTtJuLRZ/q+YWeMmDIM37+lz9fX1mc9Ft+oU=;
        b=SuQUoEaadrk8v5WCkJwV5T6qmQRYj9Y7d6ibGWEgZ6Fnl5L1QChf3MjuU0014XzP/w
         z4CNFl5WSd5E1OZ6dYMwVZMkpa0O8HhUo1kOpD/DfGy5Nal6IXmyyQxQszS6TmqzayF2
         w27aH3Kuf+JOCMCpfBILQ0whaTH0CDHdVQLfM2gSIeBgJWq2fc92ihkbomIEUz1jhYmk
         CCE6WOfiMTBL0yL6NTlTXyIyuubJtqkFvqe/bdndhqhEeRhmWTWSgLmXGE3vgptISuxn
         LXG0Xr8EfPtHucSLzik1vj6A+Zpn8MKM6LeQao+GWUJHMEg5TyprTNxCm8n4VA9F1JMc
         CFiQ==
X-Gm-Message-State: AOJu0YwVAJlSDsHULTBy5s1fy59Abm7y/M4nXRcdZams5AE6Zn2g7xH+
	2q9gnb5kPk0T5rzJ6WeSEO+OBaKm6R9OBc4wTmDH9PlRBglwscd+dFXPGrnon0JyaL3nd7WoYiy
	mEhE=
X-Google-Smtp-Source: AGHT+IFzsr516sollSExuTQP6nRVscB4K1AmYYGCUcyzNA1msbxr2rNN011WAKTOIeemxt48+81ZsA==
X-Received: by 2002:a05:6a20:3d92:b0:1b0:1bae:6a9c with SMTP id adf61e73a8af0-1b26f1393b5mr7905543637.20.1717362071324;
        Sun, 02 Jun 2024 14:01:11 -0700 (PDT)
Received: from localhost ([2601:1c0:ca00:bd60:3fc2:5771:b380:483a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70242aec012sm4306578b3a.138.2024.06.02.14.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 14:01:10 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: bluelightning@bluelightning.org
Subject: [RFC PATCH 1/5] devtool upgrade: enable RECIPE_UPDATE_EXTRA_TASKS
Date: Sun,  2 Jun 2024 14:00:38 -0700
Message-ID: <3244936f4100150c4cf829ffaafd3fcfc8242f35.1717361301.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1717361301.git.tim.orling@konsulko.com>
References: <cover.1717361301.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Jun 2024 21:01:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200217

From: Tim Orling <tim.orling@konsulko.com>

For some recipes, such as those that inherit cargo-update-recipe-crates,
we need to run additional tasks once the new sources have been unpacked.

Introduce a new variable RECIPE_UPDATE_EXTRA_TASKS which is a space-
delimited list of tasks to run after the new sources have been
unpacked in scripts/lib/devtool/upgrade.py ugrade() method.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 scripts/lib/devtool/upgrade.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index a8130ed23f5..a378f910523 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -534,6 +534,16 @@ def _generate_license_diff(old_licenses, new_licenses):
             diff = diff + line
     return diff
 
+def _run_recipe_update_extra_tasks(pn, rd, tinfoil):
+    tasks = []
+    for task in rd.getVar('RECIPE_UPDATE_EXTRA_TASKS:%s' % pn).split():
+        try:
+            logger.info('Running extra recipe update task: %s' % task)
+            res = tinfoil.build_targets(pn, task, handle_events=True)
+        except (bb.process.ExecutionError, Exception) as e:
+            logger.fatal("Failed to run recipe task (%s): %s" % (task, e.msg))
+    return res
+
 def upgrade(args, config, basepath, workspace):
     """Entry point for the devtool 'upgrade' subcommand"""
 
@@ -609,6 +619,8 @@ def upgrade(args, config, basepath, workspace):
                         copied, config.workspace_path, rd)
         standard._add_md5(config, pn, af)
 
+        _run_recipe_update_extra_tasks(pn, rd, tinfoil)
+
         update_unlockedsigs(basepath, workspace, args.fixed_setup, [pn])
 
         logger.info('Upgraded source extracted to %s' % srctree)
-- 
2.45.2


