Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A05F428F5
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 05:54:20 +0000 (UTC)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7102.1776318851220082714
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 22:54:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hird5Pfn;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2d832f2f44cso5222758eec.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 22:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776318850; x=1776923650; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YmXm+RQ2Q9H0AmiR3GE6tcs+FTw0WZTvI/r55e8z2gE=;
        b=hird5PfnOoaDVZVPS+Y7WJQOG8G7ay2qkiNOk8461/V586ZyhXiBHppHvZ7/8x+alz
         7a3VbINhbiTl2BrRmGaFHg1m9IsFMHNmJmZUdx7KCTHIVE9kPEfOGoFghwaMfc6NeqWT
         OyteMJMqtm3QCQST1rPm6OIlNWSH+82bLxC7yOq49fbFfF0cfm1BT+DVox2sLZGlzZZK
         D90e+ju33lImIW1gmInzd69zg2GAktGu+1NgDiQXwtdDhi2eRUn1XUzQSY3Qyx0w07hf
         MIUC15wq715ACi7SccIZ0eLurYK3vrdNJD8GAiFwRRghMYlK9oiBm4VF6Mivub9Yu2fx
         0XAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776318850; x=1776923650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YmXm+RQ2Q9H0AmiR3GE6tcs+FTw0WZTvI/r55e8z2gE=;
        b=NT7ZNZD7r1BFy2wNSXjZJ9MScZbhgU7BNp8LwehvHwaOKp4OszR+Lf/0k5QVSr6BZz
         3gz4vX+ZDom17nsRq1m5QIbgDHNMZBYq7XB3lCGDp4IaANTK76JGwUaOGUglfwoVQJvo
         WM4E0TBSIyxkkJ44XmJXQ/BhnIpfW7VSC59pNwU2kfTjN+2NVI/Gn5Z+FUphYHLGbDOr
         DVutcsBorm40zd5MfVpBAiZwFedH5/QWi1IYVW2iNPlkDEyx49yhPQtIBLmo4crlChzh
         5JTqU40IsCjxKBsQZLkCMGoAB8IQhNYi5QPVkOo7ZeEWnjwGCfQd+X+7awiYV5ZQ4A/f
         FBnA==
X-Gm-Message-State: AOJu0YyNU/+h5lxRFYIoFFJNopVmdy8mURqz5/u+lBOxW4fL2ldSHBiQ
	cWjk1HjB31vXfMdFVkcVvbwFQ2DdA704+LQY8bBrxSC1CZF0vYetJZ6YBtW8F1h9
X-Gm-Gg: AeBDiesNjyhSedmCstflyKYgj+do/Ma5bSikwhc3vkqQQqzOHimo/4QI24X+DJqMAw+
	/RV6hmyRQvu0GkJx0XaU6O80YHyYoRBjNLFCecS1czb8X2si89TJgORmZt88BAD7YE4iAmSRpZf
	t/3rMcVHiBEVthaXFuZYujw9/AZfTxhMWU1wd46LlXch/aK8/y2Mvg1B8SMokSxWVLu2lIvsrAx
	JsGnusqxtQ9cWtJjBSmGLr6lxqkrDZiKt6YYP8ouiJOIel348m7kWvzMNq8TvjHapuyqE+nusvY
	p+kpSK9DL9RnLjZtv+Bij8iyH+XWff8+Kum+NL0Z5TnP+NRTcMZk8E/NSrSBsvpV+o2OhaZazVK
	Qrww3tjqXK8/Ge945Acp+pbkzmAeCq5Ovk5EzEI2bcZmavT4CYdYF7qrU2Pc+43/Mv1k5IzXTKQ
	Z9I0vSykZwWWw5jN3tJ7wJ1KBEVq00E4cAwjV0blfJFvuXyv/n6qk1Y9pwNXrXOkm8Z19NspUE3
	JYbjCIsIWTkbtQ7x577NNj1p5MK0q6sKKuE8qBQ7/Ekzy6t/bBARNcfrCdOw4t75T7hnPobH3UJ
	DpEH4YAj1lTTlltppbpo7n5SKqqfMCjwHipLy0LNUW8NG3AnMDg=
X-Received: by 2002:a05:7300:fd0d:b0:2dd:8a02:e8bb with SMTP id 5a478bee46e88-2dd8a02eb3cmr4561104eec.27.1776318850224;
        Wed, 15 Apr 2026 22:54:10 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8eb8443csm6060212eec.14.2026.04.15.22.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 22:54:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH 1/7] gn: upgrade to latest revision
Date: Wed, 15 Apr 2026 22:54:01 -0700
Message-ID: <20260416055407.795016-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 05:54:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235333

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/recipes-devtools/gn/gn_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/gn/gn_git.bb
index 852c095861..8d2c0821a0 100644
--- a/meta/recipes-devtools/gn/gn_git.bb
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -7,7 +7,7 @@ DEPENDS += "ninja-native"
 UPSTREAM_CHECK_COMMITS = "1"
 
 SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main"
-SRCREV = "9d19a7870add65151ff91bcc26252bb7521065cf"
+SRCREV = "ec56d4d935a0e2ab9d52b88dd00c93ec51233055"
 PV = "0+git"
 
 BB_GIT_SHALLOW = ""

