Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3CE4C4167D
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:39 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.4712.1642588899203745411
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MNUofo6n;
 spf=pass (domain: gmail.com, ip: 209.85.128.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id w26so4581843wmi.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kfq3FAZQLfOY0+QP0Tccu9yykIhOJJHJ76B2w2xOUJ4=;
        b=MNUofo6nM9jvGIdTRKNpG3MpP92Q02Ph4xziIOkLuh8PUePGMtAm4o1X7qTAKuy0UF
         Mz+t1Zhppn9Wy3PZt37Q7J8RnFAEW9ScGpKizzVvjJO3DHjVS3gxZCeS0FFjYqdgMZOL
         W6WxLV51cz6UdJGN/V11IiHqJHfkjI2i02Gp/EdEL76MnziehvPneFRNLEsLB0MB49uJ
         g6rnzSNKBdKp55FvG+VvN6kpDbfkSbvvFF6r6vCrS6QphPluoqKP3sM0bz42i1SmqY0Q
         llG0qab803xM31rsYWtrB8iETGDwRHeuJ4mqLb+x2Cr09sVEnogZ35wm4T8kiS+7wsca
         Hz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kfq3FAZQLfOY0+QP0Tccu9yykIhOJJHJ76B2w2xOUJ4=;
        b=e5gj6eGqsP1pGxABFiUlfRD5d53dcekpxkOnf3T8WA+Gc2/V5ovO6EtbI1gpniKn7b
         bNPFIxBqzsqaKwdYWWThpLUqzBfQJI09ob4B3xjHCjvBWRY5BHW4zo28rX+sB9CZCHcA
         wEfZAOXSaV8lC5VR9EM2kCFWhgqhP408F6ZMht4HoYOZHlvj5y0PAN0jTvh7aQHREFrX
         DRkWVPaKMQ/JR9DUhePlYcSZF/ntGacIIJjRxnlloSI7K6JAWMXXdqgJxa5Phxf03BAz
         RjVvBNh7r3dvnLi4YSSfXb+zMPyO0t/M1/AEApLXPKP4uSucp29nLTacK2BbKznxVvUJ
         /AzA==
X-Gm-Message-State: AOAM532dFDF7pf8uscmoSMvf9fz/OxjH1ibTdMZqzI61RvoE/cKlFUit
	nORkE55lU2RgkzmFlFp/9IqGSbCM9CA=
X-Google-Smtp-Source: 
 ABdhPJyRFZ5tL3VGJXc9AXwzkW2T2WCL1B39PWmQP9ddwpQcjizKeF2+rruKQaI/Pyfm+Flqt8228w==
X-Received: by 2002:a5d:5151:: with SMTP id u17mr2395715wrt.544.1642588897809;
        Wed, 19 Jan 2022 02:41:37 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o5sm4667956wmc.39.2022.01.19.02.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:37 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 17/39] repo: upgrade 2.19 -> 2.20
Date: Wed, 19 Jan 2022 11:40:55 +0100
Message-Id: <20220119104117.2120127-17-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160708

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/repo/{repo_2.19.bb => repo_2.20.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.19.bb => repo_2.20.bb} (95%)

diff --git a/meta/recipes-devtools/repo/repo_2.19.bb b/meta/recipes-devtools/repo/repo_2.20.bb
similarity index 95%
rename from meta/recipes-devtools/repo/repo_2.19.bb
rename to meta/recipes-devtools/repo/repo_2.20.bb
index 730540cfa0..b56559fd9a 100644
--- a/meta/recipes-devtools/repo/repo_2.19.bb
+++ b/meta/recipes-devtools/repo/repo_2.20.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            file://0001-python3-shebang.patch \
            "
-SRCREV = "2a089cfee4a3eb0c28cfb441861fc1fcb05797d3"
+SRCREV = "98bb76577d9e7e0ffdeb643f1654ec006f6bbc8c"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.20.1


