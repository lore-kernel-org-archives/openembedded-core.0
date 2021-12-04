Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D02C43219
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 07:13:45 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.22348.1638602024410546489
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AaBwDpOn;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id o13so10477947wrs.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vtPvU6eCMm+NIgNfcozoh400UzuYBat0pfjzKmXHOC4=;
        b=AaBwDpOnyZ416iCKWpiXdaMRGTpWeKWPF1mplpKjJcQBVmBXpSykkTrrmnXgquXkUo
         wecGgCUQaNYNy/fP9g6i5ouNuwueWVR994ASU7J1lISELK9xWIzsqFKO4qTOcRTxwub5
         CNJ+RGqd01LxY278tdGDCMcvhif9xxTmRlJgjXcrJtxSvNpG9enKse21/m3TnurwPi+u
         fPvb9qUCBVL8n6EisMnNO5LxrJmk9OU8C3qJ2UMi54PueRxzJxnhSknDK4ZSAwWd+PT1
         UvZu+6oleZ7bTQIGlrW7XE85E87JL+BIlntSZDhKSf+g6JFsT8Whk7RwURb0Z2B9W6GM
         H4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vtPvU6eCMm+NIgNfcozoh400UzuYBat0pfjzKmXHOC4=;
        b=BiytlQgJxxVORuYxGJ9oYOmc12HQVwy0M431QJ1FKLdqfTn6vEZbkY3GDyTe3LgpNE
         sXuxnieRZL0jhTE+erQ8MTIE9fnuZetBREjRUcnc/l9vFp9QH7aMrCKwVCGldBmooPS5
         6rtIif82PAeO3wdSuMXzfl6HM3TcdPjhQPycqvsoA1seXUjO1ScYfSODLCpTDcwTxsx4
         DmIZQGpcwDKx1GIiIIO8DLrsC8Wutsq3KZAxPznrhe6uzV/LR0s03HSKMcrXD/Sx/EJL
         B38ZthIFj9XclQuki08bZq56TsbAWtmVBR8SlMxr/ILVTkEd90UauC8FCcTnEbLU8rv2
         QCOQ==
X-Gm-Message-State: AOAM533I2EEnQazjEaOOd0G+Z3k0uDEY2pngsaedWkpeRZQE1Q3KUAzC
	oR+4ZjixbZQTqnYH6OJT4T0mq5+LJX7Fvw==
X-Google-Smtp-Source: 
 ABdhPJy3tKTyzlbjWGnAjcLHpAiaCJ7LMN+bq3TDFF8bxZxWX2tq/VFWFl1tsrnNVCttCum1+9+2Qg==
X-Received: by 2002:adf:fb0c:: with SMTP id
 c12mr29231948wrr.614.1638602023085;
        Fri, 03 Dec 2021 23:13:43 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 y15sm5837992wry.72.2021.12.03.23.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 23:13:42 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 24/26] libgcrypt: submit patch upstream
Date: Sat,  4 Dec 2021 08:13:21 +0100
Message-Id: <20211204071323.2480163-24-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211204071323.2480163-1-alex@linutronix.de>
References: <20211204071323.2480163-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Dec 2021 07:13:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159171

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libgcrypt/files/0001-Makefile.am-add-a-missing-space.patch  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libgcrypt/files/0001-Makefile.am-add-a-missing-space.patch b/meta/recipes-support/libgcrypt/files/0001-Makefile.am-add-a-missing-space.patch
index 8fbed9add6..62b7484e45 100644
--- a/meta/recipes-support/libgcrypt/files/0001-Makefile.am-add-a-missing-space.patch
+++ b/meta/recipes-support/libgcrypt/files/0001-Makefile.am-add-a-missing-space.patch
@@ -3,7 +3,7 @@ From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 24 Feb 2021 19:43:07 +0000
 Subject: [PATCH] Makefile.am: add a missing space
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [by email to gniibe@fsij.org,gcrypt-devel@gnupg.org]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  cipher/Makefile.am | 2 +-
-- 
2.20.1


