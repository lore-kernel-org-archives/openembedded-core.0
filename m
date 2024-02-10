Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A00C4829F
	for <webhook@archiver.kernel.org>; Sat, 10 Feb 2024 13:17:51 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.13256.1707571062101626031
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Feb 2024 05:17:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QnoMn7/k;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d0d799b55cso23675321fa.0
        for <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 05:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707571059; x=1708175859; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssydrgK8pU3ak8xwbtLbq1Fj+EJVpCtOL+AElnez6M8=;
        b=QnoMn7/k1lK/WKXHy8aEEWJ9wUGv0xYzHEh458Ogqp9te0xMKq5IIcQnP243KfoRMg
         MiL1CM4nnGH9+zA5/OXa4qRXFeIctKboe/EVO/Il1s7qqiAgVazdaMaxvHQ9dLweQKUf
         ZLq/U0ZfCW8bqEt9epVxgti26HOPuT+xvuzPkmKkHAOS1/MmZSb1B4Jid0dIm/UIcwPq
         yyeOVBwmNPYMX1sAQAvXjGFEFSPk8uDrjm6b5VKJsKFS2qVKNky0dz3ET6ze93BCLXYB
         jhsVsq/G4JjDm9umQ0jCETpFlNz1uDOXKGnn11XBEdTQz5Gaea+qRkL522Q+7oBPs8ov
         kSsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707571059; x=1708175859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ssydrgK8pU3ak8xwbtLbq1Fj+EJVpCtOL+AElnez6M8=;
        b=PstAhCX2KzVI+URusEJAli0ikTH96CVzrxeL+VzVQOxpYm4VQQGg7TM5ueNq8swin3
         p839QlOg6HT8YQG5LAeVEPx+K0f9hJMh4mWcXVBvJjV3tn0CfH/llkWYv0ynSAYQxOOP
         OC1RsawF8jmaTCWouCFHyoThSCgismFdDmbIkIlRfV3tkcuHeEYZSzcVh1csjjObRDsG
         Bu0reDh5E6GVqVzp/tQm/+SDiYlTWAeOvVrAnXl8XlhK32tiL9dIn9IBFE5lXIA9A0Li
         KMjwwMV9Nkr5rAHOrNCK0s6zwKQWoHvLF2SgQbWrwaDv0F7yVf8DlJyMcevobanSWKow
         rIvQ==
X-Gm-Message-State: AOJu0YzVWCDPGIjLGuX/9A94EFuljcYijLaXrfEB+UbUH4WSlW+omh5Q
	GfvoixGmFq5ERaPvcgp8wnF8bY9V99XAfwHt4OhE8O/F+8F9IzpPLKQDgAiC
X-Google-Smtp-Source: AGHT+IH05xvM5zOaxKinjDX4QNsukvrDAKzE5oTZ3qzNHFHd0aYeNldfjgXL/6aSqrMpnzI3WDgMcQ==
X-Received: by 2002:a05:6512:2395:b0:511:7b86:6d3b with SMTP id c21-20020a056512239500b005117b866d3bmr1886139lfv.59.1707571059450;
        Sat, 10 Feb 2024 05:17:39 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id hu20-20020a170907a09400b00a3bd0742a94sm1793064ejc.9.2024.02.10.05.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Feb 2024 05:17:39 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 3/7] bitbake/lib/bs4/tests/test_tree.py: python 3.12 regex
Date: Sat, 10 Feb 2024 14:15:55 +0100
Message-ID: <20240210131727.342583-4-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240210131727.342583-1-adrian.freihofer@siemens.com>
References: <20240210131727.342583-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Feb 2024 13:17:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195267

Python 3 interprets string literals as Unicode strings, and therefore
\s is treated as an escaped Unicode character which is not correct.
Declaring the RegEx pattern as a raw string instead of unicode is
required for Python 3.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 bitbake/lib/bs4/tests/test_tree.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bitbake/lib/bs4/tests/test_tree.py b/bitbake/lib/bs4/tests/test_tree.py
index 8e5c66426e8..cf0f1abe0cc 100644
--- a/bitbake/lib/bs4/tests/test_tree.py
+++ b/bitbake/lib/bs4/tests/test_tree.py
@@ -585,7 +585,7 @@ class SiblingTest(TreeTest):
                     </html>'''
         # All that whitespace looks good but makes the tests more
         # difficult. Get rid of it.
-        markup = re.compile("\n\s*").sub("", markup)
+        markup = re.compile(r"\n\s*").sub("", markup)
         self.tree = self.soup(markup)
 
 
-- 
2.43.0


