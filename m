Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56111C3064D
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 10:43:09 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.70013.1718966580204314215
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jun 2024 03:43:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dRqsZLJi;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a6e43dad8ecso316521266b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 03:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718966578; x=1719571378; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6i+Bp/AhSY1B5o+skPkcM+qXtna3pmcV6e76qqoMNg=;
        b=dRqsZLJiCjuOa9lrMGYdWf90mK6XMBeWxfSR6A9+2Qhibx8BiN0Wtvon+D4fXSIXMo
         jC9Aj1yQavd5Kva6eob2+4xAolsNwRlNfCYrSH0Z6Z8tYHtyZmd6tjD2DVMHDSSQtn1J
         8ffd/bKadLZAK6eaTz5x3gLFQP0pZFpLI/wjbQKB3Vcy7FbBsZfXmNjVt0qVy8tY42VH
         9VRqv9nSMsU/bo6jD4e8PVAHH2HdodtJs5c/A+KuSuardLenprdI+a+JpSug4b54mIm+
         Lo54IjwIm7HEPaFwqkNccnyHWqFIRQt9bSScm27MYyYX4HchPCo8fEw/a7vURH9/DySI
         M5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718966578; x=1719571378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L6i+Bp/AhSY1B5o+skPkcM+qXtna3pmcV6e76qqoMNg=;
        b=QmPQpChCaMygVXhpMXHs56ZBkwRW05OT1fwXMSXgeOOC8V4OFZdFPNBkQ3AZAd5D+f
         FxScmaqRuW/Bc8/NQ81oyPHpDUZ5qTRsnUGFZj0Bfv0wQ5rAQsJVT0xjkmJ7hjf1L3DF
         2cmXpdetJdbjM1HKjJQ/yFkzNp125I/knx69LAhnqXbKDXL4I289gHJ/H07mTxGIzsKL
         zH2tfw7BHwocKD6bS19hT1V+PdHHD3ARnBPw07hj6CKSkcBHrnDwg7mLvRnUc5aCwDUq
         Je/9VssTI7/ywFRNZzEoc8LTzCbGnSueJWVfU45ySZTdoXzDDBQOHTKeKb0BvDxNaQ7Y
         GfNQ==
X-Gm-Message-State: AOJu0YydnMSSkKUj4Pup0po0aMhK8uduBJykRNK8S4EpvwlIpJok6Kwl
	0Eiv+WziXGQwQzDNni3XmQUkwXFs2RI7lHpcjQG4hagYhRMlP0OGVVV/ng==
X-Google-Smtp-Source: AGHT+IFV9qrr8MNtxPzZWc7wk33iwzRNE/cNkk1Phzx7jsddTQPso+M9vle25KIGqHKt2ygjrQd56g==
X-Received: by 2002:a17:906:27d0:b0:a6d:fbed:7953 with SMTP id a640c23a62f3a-a6f9506efe1mr752529866b.27.1718966578517;
        Fri, 21 Jun 2024 03:42:58 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf560addsm71378066b.175.2024.06.21.03.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 03:42:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/11] glib-2.0: rename glib-initial recipe as well on version upgrades
Date: Fri, 21 Jun 2024 12:34:07 +0200
Message-Id: <20240621103414.2842509-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240621103414.2842509-1-alex.kanavin@gmail.com>
References: <20240621103414.2842509-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 10:43:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201009

From: Alexander Kanavin <alex@linutronix.de>

This makes use of all the facilities introduced in the previous commits.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb | 2 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb         | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb
index 7da28382650..d9ad8698be2 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0-initial_2.80.2.bb
@@ -2,4 +2,4 @@ require glib.inc
 PACKAGES = ""
 PACKAGECONFIG = ""
 
-
+RECIPE_NO_UPDATE_REASON = "Upgrades are handled in base glib-2.0 recipe"
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb
index ef80cc47cfb..9f3022ea772 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.80.2.bb
@@ -1,2 +1,4 @@
 require glib.inc
 
+inherit recipe-upgrade-additional-rename
+RECIPE_UPGRADE_ADDITIONAL_RENAME = "glib-2.0-initial_{pv}.bb"
-- 
2.39.2


