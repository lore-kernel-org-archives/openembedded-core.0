Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 856D2C5320E
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 05:24:19 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.70878.1724736249714335674
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Aug 2024 22:24:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DBr05WDf;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5bec4e00978so4856877a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Aug 2024 22:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724736248; x=1725341048; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DcY/6YTQvrM3QQpQSNof/R6l0YTQDqpEDg6EWm1ncOY=;
        b=DBr05WDf9jZRDDoTNp81kQC1TnseBApPyMpmd/pjCWDsjUU/5lWb17nTt5Fa3XLEQ6
         r0P7hPeOT94mAsFr2BFawHzOAI/UWk+m43avsUwKirYTiNbajUsN6OAU6Jze2YWZhxIB
         wO7ImUcql3l4qa5a39I72acT/fvaLiT963c3cOUJvD8V76O0VONIpTRc3GuM5HsMj78m
         puVswwRVUHP59778T6ynxpEt7NKXJ9SFHwrJ3bJF6BPveipALhTQ4VlSQi7UQFleedaF
         3sm/0UUnXP2hHIo4rA5dWf7EZi4RKqztYLkL25QeKaB56yw9ZDkcCiFKzdGUy5VlnGRx
         JZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724736248; x=1725341048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DcY/6YTQvrM3QQpQSNof/R6l0YTQDqpEDg6EWm1ncOY=;
        b=CFda8+4OrNxpVPiSq/WlyO9wodYAPhvqssliBCYB7VX1yM4YrFc7r7eAl1JpjjhuEN
         rZAjM8Knp2pgO6On3ByuWQdw/qlHHNLg8Eq65XRCRziWptSXx4bre8rW/ZuR1Rm3FW8M
         z8rbqoRYkUKvfsS3x7iYXswqkXL45DqsqKMozP2acmkjNR+EU3wbABOP/n3bYagMqMki
         icl7ihVz3XJALYzXlA25yCKnOMFKFfPWCTmcpLQNu5WWJBWBR8WdlyPx4a5C3XpxLo40
         KioF7RNHj9lM35uhOWfJ6uow5kEj/FPCNaiWG4vL0H/oAcA8S4+zrM6wy52t9wWfClGC
         wx0Q==
X-Gm-Message-State: AOJu0YxCHom/Vs2hLlR1qmtTSASsRZFXWpHj+8qPsl5LEQzxHaNzAiKk
	mVf4fBHCUEzN6YV1wAg6gEZ1FUXc4+1y55z9lL03E1I1MEw/fFPRtXYb8Q==
X-Google-Smtp-Source: AGHT+IHY1+UOoeypfw44F8coZlPo00oL0wBUdj0s1F4OuyCfP2YIhvpm+4gue8pCiXf/+WVS4x0ULA==
X-Received: by 2002:a17:907:7da7:b0:a86:746a:dced with SMTP id a640c23a62f3a-a86a52b7406mr819178166b.19.1724736247794;
        Mon, 26 Aug 2024 22:24:07 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e675aa07sm57704166b.17.2024.08.26.22.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 22:24:07 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/34] go-helloworld: update to latest revision
Date: Tue, 27 Aug 2024 07:23:38 +0200
Message-Id: <20240827052354.1319810-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240827052354.1319810-1-alex.kanavin@gmail.com>
References: <20240827052354.1319810-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 05:24:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203793

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/go-examples/go-helloworld_0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
index 575ee81b50a..8d4dd49ab67 100644
--- a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
+++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 SRC_URI = "git://go.googlesource.com/example;branch=master;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX}"
-SRCREV = "32022caedd6a177a7717aa8680cbe179e1045935"
+SRCREV = "39e772fc26705bb170db248e5372a81ed5ffd67f"
 UPSTREAM_CHECK_COMMITS = "1"
 
 GO_IMPORT = "golang.org/x/example"
-- 
2.39.2


