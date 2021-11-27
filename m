Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B33C43217
	for <webhook@archiver.kernel.org>; Sat, 27 Nov 2021 09:54:15 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web09.34435.1638006853902971299
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Nov 2021 01:54:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ItTPgW2K;
 spf=pass (domain: gmail.com, ip: 209.85.128.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id
 o19-20020a1c7513000000b0033a93202467so8370022wmc.2
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Nov 2021 01:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FaTnVQT47cZmiR7EDaolLLWCJrIdjpZBZRskIQ8q1xM=;
        b=ItTPgW2KG7+5PThCfihX6Mf+K7iBMrQF4O0lmUpcF7Hq+UKnnRvBH1Dek7GQZDHiRV
         92VG6lVXcgG5Sa/p83PKL83LknEIWTbRE9vTuiD1cxRaCPe9aFEplaQ7LkNJsmbG6GpR
         jv+uoetRhYVEN+FJSwzvF3uyzE93x+hl5/+vdNPjviKkNuUOcfAo42oZ8V0KrG9XHYA9
         uSLFQxLMQ5F7Y5+r+DsPY6Xbpiw6VXBq81/+1D5QgbBjOZ6Oq3z6vM2R5y6osCOwq78L
         OcV1RZDaia//xVzrRpMYNPwpJoF5RoUPKL3XILbnq87z9SgX0FJsCc9ABNItTlTi9ZqJ
         ptZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FaTnVQT47cZmiR7EDaolLLWCJrIdjpZBZRskIQ8q1xM=;
        b=zQnrUENTKTcZcll45G+XU8so18DoAoFCw6imcWb69eGaCH/nlPHxEihgS3aNmcaTt9
         b5QSoN4pcXm9cDxotmqzjYaYU1g9EQu/MnIVwrjWc1tRHY/XYcMFm+adeO9+y0ut0bf+
         qyAXQ8vliHXWQGinia0A5Z5RrIhGjMH4yfH79lyLIqwIrTuWSLhHFA3nNyDx06RfG6e2
         1yONDxkS48szV4WhvdSsZo97AKIULSKzMSGmRdtHd2hUKVtQ2/a+Z9nt3VLMtR/ipCh3
         NhaLr8zzp9HQe0zJ12IjcZ8jSOwC3167Y4Bxv8LewV/4CG5LHl1IQMeUPt1QUOgFjpc3
         BvLg==
X-Gm-Message-State: AOAM533xDiGnLaMpz+ZdLz1vVScNvGC714fpxVvfEdxQ07dfkNawIM4y
	DDLn55vALFNXmEGgP+VFXSl+tBaVd7GFPw==
X-Google-Smtp-Source: 
 ABdhPJye4fJ9VK0IP5YnSbtwCOlSrGkJPlLDYAAuOImFhxezpnvxLOkBZPUikquklXSpvRr16INfXg==
X-Received: by 2002:a1c:43c2:: with SMTP id
 q185mr21214193wma.30.1638006852421;
        Sat, 27 Nov 2021 01:54:12 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 w4sm8484302wrs.88.2021.11.27.01.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 01:54:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/13] perl-cross: submit patches upstream
Date: Sat, 27 Nov 2021 10:53:51 +0100
Message-Id: <20211127095357.1748429-7-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211127095357.1748429-1-alex@linutronix.de>
References: <20211127095357.1748429-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Nov 2021 09:54:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158856

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch | 2 +-
 ...1-configure_tool.sh-do-not-quote-the-argument-to-comma.patch | 2 +-
 .../0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/perl-cross/files/0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch b/meta/recipes-devtools/perl-cross/files/0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch
index 3b0fc453e5..386ea3f27f 100644
--- a/meta/recipes-devtools/perl-cross/files/0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch
+++ b/meta/recipes-devtools/perl-cross/files/0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch
@@ -4,7 +4,7 @@ Date: Wed, 2 Jan 2019 17:55:35 +0100
 Subject: [PATCH] configure_path.sh: do not hardcode $prefix/lib as library
  path
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/123]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
diff --git a/meta/recipes-devtools/perl-cross/files/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch b/meta/recipes-devtools/perl-cross/files/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch
index 0aaeaa29eb..1d90b0fda7 100644
--- a/meta/recipes-devtools/perl-cross/files/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch
+++ b/meta/recipes-devtools/perl-cross/files/0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] configure_tool.sh: do not quote the argument to 'command'
 
 As it seems to break things if the argument has spaces and arguments in it.
 
-Upstream-Status: Pending
+Upstream-Status: Backport [443f7bd08b19e71a2e838dcb6cde176998cd350f]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  cnf/configure_tool.sh | 2 +-
diff --git a/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch b/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
index e7985036a0..6c3f08c432 100644
--- a/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
+++ b/meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch
@@ -3,7 +3,7 @@ From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 27 Nov 2018 15:37:40 +0100
 Subject: [PATCH] perl-cross: add LDFLAGS when linking libperl
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/122]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  Makefile | 2 +-
-- 
2.20.1


