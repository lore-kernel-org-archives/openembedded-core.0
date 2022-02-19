Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42296C433EF
	for <webhook@archiver.kernel.org>; Sat, 19 Feb 2022 18:23:23 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web08.12788.1645295001876660285
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 10:23:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=c8gTXTt+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id
 m126-20020a1ca384000000b0037bb8e379feso10848732wme.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 10:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kr7qBj6XjW3XxTA0k4pPsCVNHFkOvE667ASSfHeZkvk=;
        b=c8gTXTt+axLedQwZQJ9p0bBuKdohF74a5kyEtC1m7M/m0BdECsD4xOU1D8nv/BJ7d+
         QDzX2nAT3nzFtHKgYn7m2ygOICuaQOE07buVM3K6fhyyuikrE1Y9vjg0E5ey4Ek+2FUz
         VokbyBN/obUM2thDSQTejrIj+FjMgaqEu3Ti4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kr7qBj6XjW3XxTA0k4pPsCVNHFkOvE667ASSfHeZkvk=;
        b=4yjY1nb6bl/z6xInW4BtB5PLVibixnoNBfsY1BNT36Q6vhzWw7AHC8wJIZqEFc3zvH
         P8TSew6TpfJGlOJdxwcVUfyA9v5I67gvOVu7oUiFWjNO7TCePRXxs8sY0y9AGbCy+r6H
         1cVB0pwANuPvwqEiYvgVRxxMUdgo9JknRmcgeMaB7/oNl7oLg5mu8Ue6CofoCBZZXKME
         Sc8CfjxUbgka3h4S2mgLzJ8y60gmCzbPf6o6ZKHwuyTV8Yzz+mLbLg5WY96tBCrDuHo8
         2AbqQqerS58yLb1m9o6Mk1kzje3nPCm3EE4ZzFCh/vlLenuLBqJtTAneekaSI6MsvIda
         Ioqw==
X-Gm-Message-State: AOAM532i8HP5TRpc9hZDY81KHU0j0tAs8Y1Kya1JVoLSn7t/EuoRF+hK
	Mitb3egXy7WviqHxAEnG+2aFqy2koT6wGeFA
X-Google-Smtp-Source: 
 ABdhPJzKJvXxTg193AClBf3Yr63nL3Ta+FTLqEb/gWRyQ1leJ1Qjf22vmQKWm0dEpHmGPnxClpOb3A==
X-Received: by 2002:a05:600c:3505:b0:37b:bf81:97d8 with SMTP id
 h5-20020a05600c350500b0037bbf8197d8mr12150669wmq.30.1645294999687;
        Sat, 19 Feb 2022 10:23:19 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:bf04:d486:cfa0:deab])
        by smtp.gmail.com with ESMTPSA id
 f6sm26152921wrv.116.2022.02.19.10.23.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 10:23:19 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] sstate: Setup fetcher environment in advance
Date: Sat, 19 Feb 2022 18:23:15 +0000
Message-Id: <20220219182317.3083591-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Feb 2022 18:23:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161962

The threading code here can race as the fetcher changes the environment which is
shared between the threads. By setting it up in advance, it isn't changed and
therefore no longer races.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 2e1d9428c27..787172b408d 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -1022,15 +1022,18 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
                 msg = "Checking sstate mirror object availability"
                 bb.event.fire(bb.event.ProcessStarted(msg, len(tasklist)), d)
 
-            bb.event.enable_threadlock()
-            pool = oe.utils.ThreadedPool(nproc, len(tasklist),
-                    worker_init=checkstatus_init, worker_end=checkstatus_end,
-                    name="sstate_checkhashes-")
-            for t in tasklist:
-                pool.add_task(checkstatus, t)
-            pool.start()
-            pool.wait_completion()
-            bb.event.disable_threadlock()
+            # Have to setup the fetcher environment here rather than in each thread as it would race
+            fetcherenv = bb.fetch2.get_fetcher_environment(d)
+            with bb.utils.environment(**fetcherenv):
+                bb.event.enable_threadlock()
+                pool = oe.utils.ThreadedPool(nproc, len(tasklist),
+                        worker_init=checkstatus_init, worker_end=checkstatus_end,
+                        name="sstate_checkhashes-")
+                for t in tasklist:
+                    pool.add_task(checkstatus, t)
+                pool.start()
+                pool.wait_completion()
+                bb.event.disable_threadlock()
 
             if progress:
                 bb.event.fire(bb.event.ProcessFinished(msg), d)
-- 
2.32.0


