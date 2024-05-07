Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B465C25B4F
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 11:46:55 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.9477.1715082405680189281
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 May 2024 04:46:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R89XfWOv;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-51f4d2676d1so3373456e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 04:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715082404; x=1715687204; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CW40iCFvydPp5MoN2fDg/DPqApO8GWg4L/F8hC/qqkA=;
        b=R89XfWOvt8DwMiNAp6Vp08j+HoVrtHQrjuz8VBCcvplBDjocsRGc/H9bH8dmBv1IuG
         sEnVCSU6be7VMgwQrWJErOm5WqIiGTu1WwuRizeRW8l4OtuB0OOYov2OhQcmBKtAT7ER
         ljg1geCL/36iKm/rw9XcR2dA/sVItRH1DieHviL40w6PYvqaBpf4/5y0fKUeUpvF0gV6
         qOgavacS+Cac4vyo4+Ehd226/KWwmx7GZaBo8ycryYZXwzx0x+mtjsIFMaOH7765B3B2
         UAgeE2Mrr2rRGkMuzomz7gbRHWZrqkb8MTxIUfcxodfa8CxddWiT4RT7skJSv9YTUmT+
         WM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715082404; x=1715687204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CW40iCFvydPp5MoN2fDg/DPqApO8GWg4L/F8hC/qqkA=;
        b=MwXSmbgaFIcuHSedMBY7zpqHU/80o7dRerAtSBkncZfyDTzB9aY7ib4NeRwjXWP4fp
         I12Cx8/N/stKTIJWo6p7hBUnItEKniYninH65PpPQ4qcsaChVsb/xllaQJyu/QLQpiU+
         +TYO2DkYq9n8wJERiGEsFHJhh7Ac0zozHUtOFbimkODWwXynqxEa5v0Kn8ioh6LBRbmS
         +LdWjrwuq7pNmPvIz85Nxsm47nxYVUY6qAQt1E5WKN0x5QuSSBHx7lS3fWzS/uH8qCVZ
         r2zZK9nth0LKn3ZhpK65FdHVlL8qh3hdoGYl15xI6gEgmNF1azqugWLP0IjHi3ZUHgXP
         D51Q==
X-Gm-Message-State: AOJu0YwJgGWhNk9kWiDqrtEadaiwvgQobVTkQlEZISNVxEi1oNdRoUle
	ZvfPYFgwEnLaqR3Uo6oRzYq+U3sEa0VoKjjlNJuvfXgwwGRlwKm94KPafA==
X-Google-Smtp-Source: AGHT+IG1umuQfqmZ6Xgd+SumBgG93hN8TfjA6+2ZyfdV2dYiPsUMxR3ckxG+GjkzdWn3y0aic0mHVQ==
X-Received: by 2002:a19:4357:0:b0:51d:5e16:517a with SMTP id m23-20020a194357000000b0051d5e16517amr7402014lfj.48.1715082403260;
        Tue, 07 May 2024 04:46:43 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id et4-20020a056402378400b00572d255e342sm5268215edb.10.2024.05.07.04.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 04:46:43 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/9] bblayers/makesetup: include local repository paths in discovered layer repo data
Date: Tue,  7 May 2024 13:46:22 +0200
Message-Id: <20240507114629.2591882-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240507114629.2591882-1-alex.kanavin@gmail.com>
References: <20240507114629.2591882-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 11:46:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199085

From: Alexander Kanavin <alex@linutronix.de>

This can be useful when the caller needs to know where the repos actually
are on local disk (for example to make a local copy of them or obtain
additional information about them).

This field however should be removed from the json output in oe-setup-layers
plugin, as it is host-specific and not part of the schema.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/lib/bblayers/makesetup.py                    | 1 +
 meta/lib/bblayers/setupwriters/oe-setup-layers.py | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/meta/lib/bblayers/makesetup.py b/meta/lib/bblayers/makesetup.py
index 8148b0d9ff4..48dc73c288d 100644
--- a/meta/lib/bblayers/makesetup.py
+++ b/meta/lib/bblayers/makesetup.py
@@ -76,6 +76,7 @@ class MakeSetupPlugin(LayerPlugin):
             repos_nopaths[r_nopath] = repos[r]
             r_relpath = os.path.relpath(r, top_path)
             repos_nopaths[r_nopath]['path'] = r_relpath
+            repos_nopaths[r_nopath]['originpath'] = r
         return repos_nopaths
 
     def do_make_setup(self, args):
diff --git a/meta/lib/bblayers/setupwriters/oe-setup-layers.py b/meta/lib/bblayers/setupwriters/oe-setup-layers.py
index 59ca968ff33..56c929471e6 100644
--- a/meta/lib/bblayers/setupwriters/oe-setup-layers.py
+++ b/meta/lib/bblayers/setupwriters/oe-setup-layers.py
@@ -85,6 +85,8 @@ class OeSetupLayersWriter():
             if not os.path.exists(args.destdir):
                 os.makedirs(args.destdir)
             repos = parent.make_repo_config(args.destdir)
+            for r in repos.values():
+                del r['originpath']
             json = {"version":"1.0","sources":repos}
             if not repos:
                 err = "Could not determine layer sources"
-- 
2.39.2


