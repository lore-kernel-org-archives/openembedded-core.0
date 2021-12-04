Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E72C433F5
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 07:13:38 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.22422.1638602016889236075
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V+rB5T4U;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id q3so10518283wru.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mle40/J6wI8qfKHyk3bUGa9hxmvjnGx6xkI0y1dIbZ8=;
        b=V+rB5T4Ugc9qSNU/h6t1UDvbOolydrmg6Y6VRk85phgTqztjutHVsidlx91n7nuMaN
         0h99AOLgCkMy+tyJbBcZP9mZGwaoOZnB6pUtK30DIrPyVRlNqukg3TtEA/rQirjXPhKc
         e+g/igjle6AUY76suSGLEpgSHR8CKeuJNYy8lKFX0pMH+FLKsBdyGHCVDgettpSJzvvK
         DSK8UsBh+mMHUYtQoqlFCS/PxLeWmDb24HOsiHEbthCMLEL5J6JtsFLD8lBP1q68ptD3
         +uYRzMMiEiYzVw9+OUaiAxGPYNAoeI8hlkz2KN8qqrkjo4rSD+i9VCJGw5b2CyWC1TPo
         TyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mle40/J6wI8qfKHyk3bUGa9hxmvjnGx6xkI0y1dIbZ8=;
        b=6Fp4dk9wqsdCcRs7lKPcTIR4JlvcIFl2EhMu/TeW7SZpmAyIRq9PyUX5/KU+5AEWKE
         CgSzOgbxXdn0EqIWY96kJvSHFDHQMf33uMryW5QXT1qCNOkWksDkKt+SLLk2hc56Jkt+
         FcC2YJTt7Ht8cxeXr6hmrLyifpt5TyItYMoyAMe+Di3rh2ZWtSgkCeGWXXdKKEqg+xz0
         1w9B6NzlBU1YTEqGOhDrInPRcXoWmPXuzkj5c8N81UkalSt7daxHcost0XEH/tSnfqHP
         g4u03UJwZ69+wBfIR9fi7DFJST2l32Jck3+6p4sCyxgj+W9ErrTNw5+P2mhcFSuOlh5a
         83Xw==
X-Gm-Message-State: AOAM5313CJv2UODYXx9qO4IhOIo/wHQdt5MMVfjsdyTJhmol6VESFA3N
	xhEakwWhvF6AAuEMaUq+gemGvA8Yhl1wXw==
X-Google-Smtp-Source: 
 ABdhPJzuc4z4EWfL8NLZKnDdSmmPwZbtClaOhKmtM0ntKZh1BK3QMaVBTr8Pwf0NeThPgXgfvhmGLg==
X-Received: by 2002:a5d:64c4:: with SMTP id f4mr26679934wri.6.1638602015480;
        Fri, 03 Dec 2021 23:13:35 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 y15sm5837992wry.72.2021.12.03.23.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 23:13:35 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/26] sudo: submit patch upstream
Date: Sat,  4 Dec 2021 08:13:09 +0100
Message-Id: <20211204071323.2480163-12-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211204071323.2480163-1-alex@linutronix.de>
References: <20211204071323.2480163-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Dec 2021 07:13:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159159

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-lib-util-mksigname.c-correctly-include-header-for-ou.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sudo/files/0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch b/meta/recipes-extended/sudo/files/0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch
index e7875c96f7..f63ed553be 100644
--- a/meta/recipes-extended/sudo/files/0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch
+++ b/meta/recipes-extended/sudo/files/0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch
@@ -4,7 +4,7 @@ Date: Fri, 24 Sep 2021 13:36:24 +0200
 Subject: [PATCH] lib/util/mksigname.c: correctly include header for out of
  tree builds
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/sudo-project/sudo/pull/123]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
 ---
  lib/util/mksigname.c | 2 +-
-- 
2.20.1


