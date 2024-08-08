Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB56AC52D6F
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 02:29:03 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.50954.1723084136765128261
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 19:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PlWv29To;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7a264a24ea7so364646a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 19:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1723084136; x=1723688936; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZBnIIixOCCzk01ikXuKO3ihUm08q6JzghWuAWyE6zms=;
        b=PlWv29TodkmqMkYDNRUvqvMW11FJYv0lQPKaDDDN+EFKLNORf3sIxMBcK2BRBT4uUP
         +pJV3BcM3OB99/WzWqq9AFf/Skz7oy8ZLv1DrEYtho7NIFlzwFfwHOFmYRh46TRxlAWo
         RjcMHG9tvTtWmGWsF2vL3/pp4Al06GwiwtypWsCcTRWCGOv8J3yQle48T7d7lQwoYyN/
         ZT1bmey0q11QrDd7P5LGUFP+vgzGSNir22zFYbxvi4jSd5+e1U9D2Q20Ddw6S988pA8H
         XEnq0Cbj/J2Cfgiocb3U6w3oxyMAGTf6JpsWYDIfE7v13vxFVfCHZI35NQ3URty+HQM0
         tVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723084136; x=1723688936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZBnIIixOCCzk01ikXuKO3ihUm08q6JzghWuAWyE6zms=;
        b=C2nSVU3cODKknlmVdMJP2AXIm8ILXMuAPBTWwp5PvgbWt9lbB1wEghWooehlmRGsp+
         zXx41kda7miN7X6A6BwR+tt16N/YXgmmvTnVdywDd13Ar2SKVG/wLpSNDPGolkUe7VU5
         7WCM9A9FLNquJz73atqUKKG5i6dhgKpKnGS1ovn2kVI6Lc019cCylbw2Cf0HnlJnQaHv
         5m7km5f5826Mqql9KTwveCOFxA16LYHMQEFUNUiAIy5VxKbi0CeRHnfqYIZ7Y/dvjZe6
         yJkv+0MoLkmZuzBtsktMOfZd7sqseYyjMDsbAWCPjHtho8ezyJ0n5Sybzj+o8YTfSvhn
         5G7Q==
X-Gm-Message-State: AOJu0YyMATKImfpawM5KIo4VsulzMf1uAIaDwvB+0lpXSY9pqGEonc6q
	e7p2iRLx7STXuL1Ax53xKigYPQdWeNACUjL/XJ2jVebnZ9Y87OUr6h1EXuUZ4hqwqLG+F68IQNi
	Z+ZA=
X-Google-Smtp-Source: AGHT+IHriw7SJMlXNryQRAWAC8qK+sOMa/27/MaP1VbQpPCKMXZLUl6XVt+KsY4sQGV+7x//+IveOg==
X-Received: by 2002:a17:90a:e681:b0:2ca:8baf:abe9 with SMTP id 98e67ed59e1d1-2d1c34944b8mr498408a91.40.1723084135976;
        Wed, 07 Aug 2024 19:28:55 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1b3b0c796sm2269198a91.33.2024.08.07.19.28.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 19:28:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 02/10] glibc: cleanup old cve status
Date: Wed,  7 Aug 2024 19:28:38 -0700
Message-Id: <35d55934cb6ec24098e4e8679b87066bf3bae6a9.1723083840.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1723083840.git.steve@sakoman.com>
References: <cover.1723083840.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 02:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203102

From: Peter Marko <peter.marko@siemens.com>

This CVE status should have been removed on version update.
CPE says >=2.34 and <2.39 while our version is already 2.39.

(From OE-Core rev: b568a8f428e76f75bb8c374983f62822325ebe8a)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index ad58bebcf1..955b22bc38 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -6,5 +6,3 @@ SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.(?!90)\d+)*)"
-
-CVE_STATUS[CVE-2023-4911] = "fixed-version: Fixed in stable branch updates"
-- 
2.34.1


