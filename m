Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.2133.1587563545005692550
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2020 06:52:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u42pvjzi;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id f13so2453948wrm.13
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2020 06:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6MGe0SwHGlNMbv7ozrcLeZncAB6ZA8InZGI32jsBBzU=;
        b=u42pvjziTv0uTf/Cy13p5w+wPocf3ATvaCYhaIVh67KBP9IeihGTwwIbzAoOnPJ4/O
         tMmU1ZQcsTRMjv+hNk1cs8ty3tTxkHTJcdtbgeh2F3SgMf6DRiKDETyNJ0QzD9NCvVvS
         zyffVyuh1fxSWEKfdqtn7/4HHiEiFFdOD6Ay+45VKtzh2vNCEaTwBD6G19sD8k+v5K4U
         L6ao/UzpVYZBn3V2yREins7RW87I4hrdYKz6QnVs74ImZS++GHpOzYzdcoilE0818Wd+
         5szRYpV+R1R+v2uB1TqvCPDpYpsQ+JpAO2wFXSMqTm3KnGqWEzuZbqL3pXOiyta2q+rq
         Vsnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6MGe0SwHGlNMbv7ozrcLeZncAB6ZA8InZGI32jsBBzU=;
        b=tn+jAbNgBKl4sjCNr8O6MnU0/xkNnOsit2PEQPWYK2YZ6Yaj+CCBnC0YjHFBG1msN3
         76dKrbuKbbr01SwETWJod+FQomdWS72dKVYJVQCf8A0lHi3s4efY/nXN/Cdto5u7lXhD
         W32zAIXJLsyO8RQB4cCffRACm9cd/wVk9DmhnUcE260rhMOb77R9SneGPmGaYRpTumCt
         tktghYHc1VhBlEosPb+93PnLNkV4nRczKgaJ0hpmbQln9zc7T+HGTCOQ1Pq/9BYcqFen
         NqvLHXbvLESWQiF3LyZccaO8CsWkxebM4YWHxnkiTL5d93YegPWNVAJeqOoYwvsBnW2p
         BORQ==
X-Gm-Message-State: AGi0PuZrwGK8m6mzGKEa+bCK3H6yuy8ZxWoFuKX5gyo2NmvzB4N4F8Su
	tL2r+TDBi/cKmiCL7XFy5Na7jxWO
X-Google-Smtp-Source: APiQypKuXVUgiTeuFv+PbQ3mLSkMZFN6YhPPtP4kq5xliEYe7QdCMQAMtoJ0gO/79UFPQcl1f1H/wg==
X-Received: by 2002:a5d:4ed1:: with SMTP id s17mr29224313wrv.310.1587563543162;
        Wed, 22 Apr 2020 06:52:23 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id d7sm8155846wrn.78.2020.04.22.06.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 06:52:22 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>,
	Ross Burton <ross.burton@intel.com>
Subject: [OE-Core][PATCH 4/6] run-postinsts: Set RemainAfterExit on systemd unit
Date: Wed, 22 Apr 2020 14:52:09 +0100
Message-Id: <20200422135211.121292-4-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200422135211.121292-1-alex.kiernan@gmail.com>
References: <20200422135211.121292-1-alex.kiernan@gmail.com>

run-postinsts is only expected to run once, but during startup, but if
any dependency is pulled into a transaction, even once it has been
marked disabled, then it can be restarted.

This leads to occasional failures during QA if an ssh session starts
whilst the existing transaction is still running:

  Finished Run pending postinsts.
  run-postinsts.service: Succeeded.
  Condition check resulted in Commit a transient machine-id on disk being skipped.
  Condition check resulted in Bind mount volatile /srv being skipped.
  Condition check resulted in Bind mount volatile /var/spool being skipped.
  Condition check resulted in Bind mount volatile /var/lib being skipped.
  Condition check resulted in Bind mount volatile /var/cache being skipped.
  Condition check resulted in Platform Persistent Storage Archival being skipped.
  Condition check resulted in Rebuild Hardware Database being skipped.
  Starting Run pending postinsts...
  Condition check resulted in Kernel Configuration File System being skipped.
  Condition check resulted in FUSE Control File System being skipped.
  Condition check resulted in Load Kernel Modules being skipped.
  Condition check resulted in File System Check on Root Device being skipped.
  Condition check resulted in Huge Pages File System being skipped.
  Condition check resulted in Journal Audit Socket being skipped.
  dropbear@125-192.168.7.2:22-192.168.7.1:44226.service: Succeeded.
  Condition check resulted in Platform Persistent Storage Archival being skipped.
  Started SSH Per-Connection Server (192.168.7.1:44226).
  dropbear@124-192.168.7.2:22-192.168.7.1:44224.service: Succeeded.
  Started SSH Per-Connection Server (192.168.7.1:44224).
  Condition check resulted in Commit a transient machine-id on disk being skipped.
  Condition check resulted in Bind mount volatile /srv being skipped.
  Condition check resulted in Bind mount volatile /var/spool being skipped.
  Condition check resulted in Bind mount volatile /var/lib being skipped.
  Condition check resulted in Bind mount volatile /var/cache being skipped.
  Condition check resulted in Platform Persistent Storage Archival being skipped.
  Condition check resulted in Rebuild Hardware Database being skipped.
  Failed to start Run pending postinsts.
  run-postinsts.service: Failed with result 'start-limit-hit'.
  run-postinsts.service: Start request repeated too quickly.

Setting RemainAfterExit ensures that the unit remains active and is not
gratuitously restarted, unless done so explicitly using systemctl
restart.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../run-postinsts/run-postinsts/run-postinsts.service           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
index d42addf510ce..7f72f3388afb 100644
--- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts.service
@@ -8,7 +8,7 @@ Before=sysinit.target
 Type=oneshot
 ExecStart=#SBINDIR#/run-postinsts
 ExecStartPost=#BASE_BINDIR#/systemctl --no-reload disable run-postinsts.service
-RemainAfterExit=No
+RemainAfterExit=yes
 TimeoutSec=0
 
 [Install]
-- 
2.17.1

