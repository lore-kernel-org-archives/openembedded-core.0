Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE30CC001DC
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:30:04 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.7375.1686734995806980625
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=TAodxZyL;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5147e40bbbbso9701541a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734994; x=1689326994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHtN9Wf4kmLcy0eBEBDjpi7qKhXVhbzsd/glUGNNbk0=;
        b=TAodxZyLW/gKwb5IM4ozuwXJ0tw/GcYDVWYT/JGhTCwbfOHae47btvq/hUqoFFDr1w
         +FgGZiQcirempe42uIDKsPfCrmKRqeS75leL/oc+A5R/I8N4hhfO6VHG+lrEtqahfUT/
         KtAZf4WSK3fYyeuKSbl40RC4wFmNg7Bbv8y9k+Mo1hI/rTgZ+NgdIQ8YdjUuQcAmFXZM
         hesGX/vYUfKSRtgDI1w5p1gPWvLLp2NeNxeEL8Ke1VgkLLnT8RnpbFUgX7LeUl8sU1MT
         DGRfy8K5iAX6ThHbhdnFx7CCIFjyY+tOxg/t/sjfMVd4GyvQ2qDbZY35Q5RTkwVXpNR6
         7Zwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734994; x=1689326994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MHtN9Wf4kmLcy0eBEBDjpi7qKhXVhbzsd/glUGNNbk0=;
        b=CSQPaJ4svnwG4XcGelSNaFsRLuCNQUhMyJflaLo6W9bfeDULKOAGnjfXRW1gamzpTi
         +Hq+NvoHSFZrW3Cp+koH+8Ftcg03MPSXsSKLAy0EtLN6cl/QH/UyMe5juKpClIc9EpAu
         7wll/pime9hWWZOXbyhF7RWIke1epLQ/QE4r2FzaF4eRFoQGh9s+lMbV+0d4whBfxgRa
         Iv4QM7Gh3dymPEjWCdghK5zLU3g2DvyV3LhjZZqZQa1WbCBWIDbAjVY9If8l7erUidOr
         oP3aHP3bcAuooYV0kd33w55afs2LyxZ3nmkXnh2qdsYmonX38vWzSWunYS0Bhlp9pGBq
         yG9w==
X-Gm-Message-State: AC+VfDyVlkwrOr4J1KQgUW8IUjCbevMGItcjUOreOlei9cBON82cVUZb
	bcApF7Mdyr6yb7jSMB6Z0WYAik8nJGc=
X-Google-Smtp-Source: ACHHUZ532slMMGoV7O4l5ZC8xY2M4gZtJAvClEq5xAkwHF5ifHbX5h9VJpBP5UfsUuAesvN0+hPphg==
X-Received: by 2002:a17:906:db06:b0:978:afbc:678f with SMTP id xj6-20020a170906db0600b00978afbc678fmr14332341ejb.1.1686734994245;
        Wed, 14 Jun 2023 02:29:54 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 49/55] vala: upgrade 0.56.6 -> 0.56.8
Date: Wed, 14 Jun 2023 11:29:12 +0200
Message-Id: <20230614092918.4065570-49-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182794

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/vala/vala_0.56.6.bb | 3 ---
 meta/recipes-devtools/vala/vala_0.56.8.bb | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)
 delete mode 100644 meta/recipes-devtools/vala/vala_0.56.6.bb
 create mode 100644 meta/recipes-devtools/vala/vala_0.56.8.bb

diff --git a/meta/recipes-devtools/vala/vala_0.56.6.bb b/meta/recipes-devtools/vala/vala_0.56.6.bb
deleted file mode 100644
index bc5f5477d73..00000000000
--- a/meta/recipes-devtools/vala/vala_0.56.6.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI[sha256sum] = "050e841cbfe2b8e7d0fb350c9506bd7557be1cd86a90c896765f1a09a1870013"
diff --git a/meta/recipes-devtools/vala/vala_0.56.8.bb b/meta/recipes-devtools/vala/vala_0.56.8.bb
new file mode 100644
index 00000000000..f55fb41ad39
--- /dev/null
+++ b/meta/recipes-devtools/vala/vala_0.56.8.bb
@@ -0,0 +1,3 @@
+require ${BPN}.inc
+
+SRC_URI[sha256sum] = "93f81dcfc6a93b77baa271d65e6be981ee3238ad451ef380af118e295d904bde"
-- 
2.30.2


