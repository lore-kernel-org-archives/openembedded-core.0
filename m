Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C773DC25B78
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 11:35:30 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.19217.1717500922597296974
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jun 2024 04:35:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=IwTNnO5g;
 spf=pass (domain: snapchat.com, ip: 209.85.214.169, mailfrom: ecordonnier@snapchat.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1f44b4404dfso47653105ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 04:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1717500921; x=1718105721; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gGN8P6L5oj4z0qp4HUpeil4nsVZneCF1JXqBJTnws3U=;
        b=IwTNnO5gQmk7Q+0gUjebzWgbQJzNMsIRffgVSrLrgyaIIZDsDG1hKOrd94pYXzxnp4
         3Du2S0V5a1LCtL+R05mg8NFHVQ1GhDBdaqh4h30YbmGRdM2b8C/Bjgct+7/SmAxmbqgx
         2fAJ76MZ661opC9AOItevD5SKqFO95ykF5bhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717500921; x=1718105721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gGN8P6L5oj4z0qp4HUpeil4nsVZneCF1JXqBJTnws3U=;
        b=tNA87yzpoIcPtWEVhMS/OaUpLoIb1nUQrfhkAmWPfhsNQ+oeKS8JtcCJ7vM6QWLnV1
         RKQn8uW0TSA+yN5gdYz2uE9kbrY+Hpom6O+8u3fL3m73hNUbQ9Bi9935rRB4uK4psMDx
         Va7x9hLaFvTu9czk0xk0/aVUJmzTLLTeNRmuk7IJAkAv9dXdlk19d8U+l/rNv3WvFAsE
         utXtxnQae164G+Qx2FXvq7/+vWJ3DP4Kl+7aMtzFR0aVKdEwQPP/7CqxNbSfLy9/MI48
         2NpMqT9SZYoF47SOneoTopYD08PTclpNzORppcjCJAjvKNtVHyHvZcB6VOEdNEB3uXUB
         9ydg==
X-Gm-Message-State: AOJu0YxW1cvW6HZ45h/BASJjRLvuA0iPJTFxJ9F962wEMnGaSMyBIifD
	D0IaEaXYXG1XLKIwUJ+M4OMXomOlmIoI15Nx8ERZVGwh7gAipDdrakTeruI3JPOLZwdIHO4asnO
	D8As=
X-Google-Smtp-Source: AGHT+IG7zMQaeTlWY1gMLB+Y/8VtqtyIcBgCteKnFzL5tofxUBCr6sK0oS4qxfvtclt6CMIhvYUp4Q==
X-Received: by 2002:a17:902:6547:b0:1f3:35ff:ad25 with SMTP id d9443c01a7336-1f6370baef9mr132805165ad.63.1717500921045;
        Tue, 04 Jun 2024 04:35:21 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([213.249.125.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f67cc9fda7sm35103185ad.234.2024.06.04.04.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 04:35:20 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH] oeqa/runtime: make minidebuginfo test work with coreutils
Date: Tue,  4 Jun 2024 13:35:14 +0200
Message-Id: <20240604113514.2891313-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 11:35:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200325

From: Etienne Cordonnier <ecordonnier@snap.com>

The test was failing with core-image-full-cmdline which uses sleep from coreutils instead of sleep from busybox.

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/lib/oeqa/runtime/cases/systemd.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/cases/systemd.py b/meta/lib/oeqa/runtime/cases/systemd.py
index 8bf571663b..80fdae240a 100644
--- a/meta/lib/oeqa/runtime/cases/systemd.py
+++ b/meta/lib/oeqa/runtime/cases/systemd.py
@@ -157,7 +157,8 @@ class SystemdServiceTests(SystemdTest):
 
         (status, output) = self.target.run('coredumpctl info')
         self.assertEqual(status, 0, msg='MiniDebugInfo Test failed: %s' % output)
-        self.assertEqual('sleep_for_duration (busybox.nosuid' in output, True, msg='Call stack is missing minidebuginfo symbols (functions shown as "n/a"): %s' % output)
+        self.assertEqual('sleep_for_duration (busybox.nosuid' in output or 'xnanosleep (sleep.coreutils' in output,
+                         True, msg='Call stack is missing minidebuginfo symbols (functions shown as "n/a"): %s' % output)
 
 class SystemdJournalTests(SystemdTest):
 
-- 
2.36.1.vfs.0.0


