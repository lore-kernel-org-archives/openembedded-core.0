Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D34C4167D
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 13:46:18 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.22366.1702561568378200049
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 05:46:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z0RyLc4F;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40c2c65e6aaso84775315e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 05:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702561567; x=1703166367; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v1hGX18iW1UuGNhwHD/jhuyxl5vy1fWOligRo3zCdQw=;
        b=Z0RyLc4FAuY/TRcHkLd3X54koDAmpoPurnh5XVda1wVV+3Tb+s+koDJoMBVB4Cwb1P
         sYABYXqXA2MVahcA/IHGS49DJDgZBopVDE3ulcyQw6oCCf81f6I4FfH1RpleD0/cqJTu
         AiXczQPNho1rU2jtH6Dxp/E+eU3KaVdlv+h6kTByt8Qwoyb7jCK3/h6xLZqjaDm3ZzVC
         ZoTN9ocjjPTCBU7RaUQRcYvIjeUii+OLehKl/qiXZcgfSdEaHDEppNRhQQ86I9BLxXAI
         is59ql9dJyT+gBoKL5RFJxEd7TMZj+lMzZbt9LwHZ84HNV3WhTeQOY1Ug7+1BQyIijpb
         coVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702561567; x=1703166367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v1hGX18iW1UuGNhwHD/jhuyxl5vy1fWOligRo3zCdQw=;
        b=gKN5nLr9J3ivX4VlHk+bGBP/oRq1XsX8sMCEo9Hn+rNOIs7m5h3bDXrZOsJjdhC/NG
         KZvhbM71knpcUQdqOK88rrv0M7y4FbYLyWKggZUPLAA500CVKJ1n+p4XSbrTNVGZAHZc
         Wkv2Et49kP+9gZYpEXVlYIe4+zB4EpJ3zWeL7o+dJqmfgiHflqO1S+jCyOynfEZ5dvJq
         Ykhvf4MtbeGejV2l4EITHCU+IzDJJHgsmzUVBqYYgsLhZMUYQ1ZMq/pHwfcxtVJQpU44
         TsafvuHrvCroOkuP0jbfUFMR1euzdtvLD14vVsQkRTktBfZ5ydrnuSQUAJ9ijXOFEFb3
         lbzg==
X-Gm-Message-State: AOJu0YzjyZ/NlUiS+byWKywkn1oz/jDAZ8swGSn4Xyxrm2NE4P+1z2N0
	aj5Q/PGHwYzaUqv9DBH2BehR/zS8x2c=
X-Google-Smtp-Source: AGHT+IFE2+Gj+vl3LkVVocmcrYWABpepL0iD/juLDNRDOgMUJp+ccFmgdFXm8IV873WfydhzHOcQkQ==
X-Received: by 2002:a7b:c40d:0:b0:40c:3150:3d73 with SMTP id k13-20020a7bc40d000000b0040c31503d73mr4546953wmi.247.1702561566372;
        Thu, 14 Dec 2023 05:46:06 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l15-20020a05600c1d0f00b003feae747ff2sm27293710wms.35.2023.12.14.05.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 05:46:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/9] bitbake/runqueue: initialize RunQueueExecute before printdiff rather than after
Date: Thu, 14 Dec 2023 14:45:22 +0100
Message-Id: <20231214134528.1973602-3-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231214134528.1973602-1-alex@linutronix.de>
References: <20231214134528.1973602-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 13:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192373

printdiff needs setscene dependencies and they're available only
through that object. Previously it was instantianted just after
running printdiff, this moves the initilization to just prior.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 bitbake/lib/bb/runqueue.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/bitbake/lib/bb/runqueue.py b/bitbake/lib/bb/runqueue.py
index 864708ee4a5..1f59d18b71a 100644
--- a/bitbake/lib/bb/runqueue.py
+++ b/bitbake/lib/bb/runqueue.py
@@ -1555,6 +1555,11 @@ class RunQueue:
                                          ('bb.event.HeartbeatEvent',), data=self.cfgData)
                  self.dm_event_handler_registered = True
 
+            self.rqdata.init_progress_reporter.next_stage()
+            self.start_worker()
+            self.rqdata.init_progress_reporter.next_stage()
+            self.rqexe = RunQueueExecute(self)
+
             dump = self.cooker.configuration.dump_signatures
             if dump:
                 self.rqdata.init_progress_reporter.finish()
@@ -1566,11 +1571,6 @@ class RunQueue:
                 self.state = runQueueComplete
 
         if self.state is runQueueSceneInit:
-            self.rqdata.init_progress_reporter.next_stage()
-            self.start_worker()
-            self.rqdata.init_progress_reporter.next_stage()
-            self.rqexe = RunQueueExecute(self)
-
             # If we don't have any setscene functions, skip execution
             if not self.rqdata.runq_setscene_tids:
                 logger.info('No setscene tasks')
-- 
2.39.2


