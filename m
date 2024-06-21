Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8E13C27C4F
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 10:43:08 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.70012.1718966579179358516
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jun 2024 03:42:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OLomlBeG;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a6fd513f18bso38979366b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 03:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718966577; x=1719571377; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ocosHAnEnei3QFnbg28O87Bb5abGSmGvAHsPTrUFKA=;
        b=OLomlBeGsYcCUb4VCO850E8Y+2mEyamahcIYsczsHCOj2McnLFH8kw57RZeXqhNh9x
         6Gmgas3El+ARiaVMPHVq/0+FzUD7qwv8CnEciwVSPvVLSfns+ob5K/m8g+3AS7JgjM7d
         XDSgc3Zig0hP/NpFmbYqNt++jhlqEO2xUsLlij0K0GdOMxHtDNAy29i7Db/9e+abCHXp
         VyAWOSx0ulhVRpotYUgvf+mIzZHTwX/1cqlYM1OGKhV00VolUMbr9n9qSIkMpFZKW7r6
         X480hvEUaa1cgyTzQXpJhWQXUISOQK7tDMQzZZKEmdlX8YFRu/0VSg2v2FD2pw24AgjG
         KfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718966577; x=1719571377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ocosHAnEnei3QFnbg28O87Bb5abGSmGvAHsPTrUFKA=;
        b=L37tz/UxVG1xkCwf0sMup5bW72QBr+M8Mb8o1/hYMCtvnSwtFafiPOCs8Q7wz6B2E+
         iexHmk2/DrJEi9Va/2Jxb5MNG63ovumzIOVD7fPTxwVPFab9jEnuXetlEN+A8gKuwTkM
         ErPj9y6RNBl06CoWfDQCus15TObIOKb2rUStU+cAdiE6N0f9s3S8X9/XQu6A3Y6gqTw+
         IhcuUL29ves3fmql9subD2kxuQdux4DyfezwNeT2oug4K+YaXyJtf6S85zc9GXsvmAIm
         ubVEjmqdxGkmtNV2HT6lmwLOOZBgGv8jz8Z5bvflT00XJWDzArK6WEjHIHqq3RQQYxKU
         xT4w==
X-Gm-Message-State: AOJu0YzAPCDDukIGjoQEWxo8Z0vDfDCfCuOAIlnYjuAS4zHF39W+cgls
	eDcnxa+LPS+BVxfo9J0zo7B67Px+wYF21gJnKvx0wRWxQIyJT5FAhs5nqQ==
X-Google-Smtp-Source: AGHT+IHQDZK4cmyewG3VMluIejLz1+RuZGm9XH7+GH2Zd711A/H9SEuZXtobMSuC4P58GZcyXohbVg==
X-Received: by 2002:a17:907:c713:b0:a6f:61c7:dead with SMTP id a640c23a62f3a-a6fab61398amr674795666b.17.1718966577289;
        Fri, 21 Jun 2024 03:42:57 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf560addsm71378066b.175.2024.06.21.03.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 03:42:57 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/11] devtool/upgrade: add RECIPE_UPGRADE_FINISH_EXTRA_TASKS
Date: Fri, 21 Jun 2024 12:34:05 +0200
Message-Id: <20240621103414.2842509-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240621103414.2842509-1-alex.kanavin@gmail.com>
References: <20240621103414.2842509-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 10:43:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201007

From: Alexander Kanavin <alex@linutronix.de>

This is modeled on RECIPE_UPGRADE_EXTRA_TASKS with the difference
being that the tasks run in 'devtool finish', and only when
finishing an upgrade operation. This allows recipes to define
custom operations, such as renaming additional supplementary
recipes (such as *-initial, *-native etc), or any other custom
handling that devtool cannot know about.

The idea is to teach glib, cmake, mesa, systemd, libva, rt-tests,
go, rust, etc etc about upgrading themselves properly with this,
improving success rates in AUH.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/lib/devtool/standard.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 1d0fe137887..d22bfe8e4a9 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -2088,7 +2088,6 @@ def _get_layer(layername, d):
         logger.warning("Consider using path instead of base name to specify layer:\n\t\t%s" % '\n\t\t'.join(layer_paths))
         return os.path.abspath(layer_paths[0])
 
-
 def finish(args, config, basepath, workspace):
     """Entry point for the devtool 'finish' subcommand"""
     import bb
@@ -2120,6 +2119,7 @@ def finish(args, config, basepath, workspace):
 
         destlayerdir = _get_layer(args.destination, tinfoil.config_data)
         recipefile = rd.getVar('FILE')
+        upgrade_finish_tasks = (rd.getVar('RECIPE_UPGRADE_FINISH_EXTRA_TASKS') or '').split()
         recipedir = os.path.dirname(recipefile)
         origlayerdir = oe.recipeutils.find_layerdir(recipefile)
 
@@ -2265,6 +2265,9 @@ def finish(args, config, basepath, workspace):
     else:
         _reset([args.recipename], no_clean=no_clean, remove_work=remove_work, config=config, basepath=basepath, workspace=workspace)
 
+        if removing_original:
+            for t in upgrade_finish_tasks:
+                exec_build_env_command(config.init_path, basepath, 'bitbake -c {} {}'.format(t, args.recipename))
     return 0
 
 
-- 
2.39.2


