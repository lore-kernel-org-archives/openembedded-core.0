Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 347BCEA719A
	for <webhook@archiver.kernel.org>; Sun, 19 Apr 2026 12:30:00 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7448.1776601796925086529
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Apr 2026 05:29:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IrNk1PBK;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-64eb84d1e37so1582043d50.2
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Apr 2026 05:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776601796; x=1777206596; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kbejNYDizBRKTScY76RHuXFbGV6FvcpVLZEmxHD9vuY=;
        b=IrNk1PBKYzPxHWBAC2x7w163+6vVI2xqHWARB2VS+JBTWe1SNhtnhnvhZ6hnCFAPIU
         Gy5l1bRqJvZkrcJ1qW2d4EQfu9svRGuy0wBtfGtivA8NrxdWbJIOhaV33y2V4cf01jny
         4x0bwwa3oTTZKP07SOXKkLOV52qpVfWhsffnPb2UWJIJGWARVhMWpOkNpNuR5pxpDuCR
         iBiTYp+pumHItpwVs1p24cDUF10L56r9RQFQdePo6xR3inwHHQP/UZcqd7uFJy/gOKx0
         EzTGJ0Ofp11aY0e2fuPN6ZD0wrR+2C5YE4tZWIfgm+PnQsc7Yyg63ni16D3BfKDsrB6P
         eDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776601796; x=1777206596;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbejNYDizBRKTScY76RHuXFbGV6FvcpVLZEmxHD9vuY=;
        b=MB/ttm3y7qLemLcekwxqOXvZ8b4gZEWlI/gtpcWlm88HPpUlYZCqiSzh9OTxOr7siI
         cASnOSPC4VzUJ/kVTOtD5YvacaKGeOyiMCUhlBPeUWRhGY77zETvI758fBKUmEGuKQ3e
         JhxQWQr6e3z8z7wq7tk1hGNLaAZqkmX6LfP0aU/v8HB5gvh6ysKUHKaPGobnClsMmAs9
         IWnufdSt87WSZxZ01YqblLQFhIqpP2dS7SL4vCwPOa/uq5cJqvNLkoOEsByTIZa5qrnp
         RTyn6kSxN9+G+huB3CYbrG9ZT0FJ9SY+lZiwAA3KO+lR5h0JZRVboP7Jd5YDA3Br6rSk
         N7lQ==
X-Gm-Message-State: AOJu0Yy9oWfX6K425C8gF0pFi+fZNLUV+WDd+s1HlLOpz677Iza6ShJC
	5peHMV0r8KQOMD49mFBsTwUJwQVJfGIEpmX3eZ0DR+IoO4Z/J5KQm7wHsbx5dOoD
X-Gm-Gg: AeBDiesZ6O+xC8AhQ6oFmyMAaCls7qIZl/FnckdDkJGAX+U00c2Cd1WkTUFhikI45Kb
	6fPHGMe9tRxqy+7oViSKJ9TY5yqKmoOkvzhC+Dedxh8sUx4bTXQnssCv6bRq4k5W/dj2ro3xaXm
	f26KfxGNmlXkJS8oubB2XMTZHuz7qe1jBue0f/jiKQMNvOio3zuhGVYp9argutr1cDOVuncJUjJ
	b5Is+KGBYMNSa5VGRImcLDYGQNoWSbabr9xQY3Gs+QAcn+MOWnBQRCktsxo7pGzqnshRdyBqxYd
	KUnu3SaYtozVUNldtn0kn4DD1knNfFC8Gwc3FMv9fnu0zdPXNCW8p2RduU9PKAOAmQ1oK7ndeE0
	Ck06Ad8wGbyvC+TmBcq1GbmQDPQ2+t79l0lJKlbb4qUOeY0sEk2Nxa/FQG0A9gzc/AE//140mDf
	1WwJiXpdeuFTu+X6NR1q0mbvTkK4PWri6ifWx5YeyMNudsvdj7CAN5JpRnZfsxGDg/W6g6x3oq9
	Pz7RQlRJ9hCyZZ+WA//Bnp3KJCyl4vsOPLcGnvZTAQKdMZj8mPPgM8cI2B8pQ==
X-Received: by 2002:a05:690c:498f:b0:79a:8f2f:cb3 with SMTP id 00721157ae682-7b9ecff6256mr102064277b3.44.1776601795301;
        Sun, 19 Apr 2026 05:29:55 -0700 (PDT)
Received: from localhost.localdomain ([71.54.207.93])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b9ee8c2083sm30338857b3.17.2026.04.19.05.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 05:29:54 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [PATCH] ruby: upgrade 4.0.1 -> 4.0.2
Date: Sun, 19 Apr 2026 08:29:25 -0400
Message-ID: <20260419122925.174545-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Apr 2026 12:30:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235525

Changelog: https://github.com/ruby/ruby/releases/tag/v4.0.2

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 meta/recipes-devtools/ruby/{ruby_4.0.1.bb => ruby_4.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ruby/{ruby_4.0.1.bb => ruby_4.0.2.bb} (98%)

diff --git a/meta/recipes-devtools/ruby/ruby_4.0.1.bb b/meta/recipes-devtools/ruby/ruby_4.0.2.bb
similarity index 98%
rename from meta/recipes-devtools/ruby/ruby_4.0.1.bb
rename to meta/recipes-devtools/ruby/ruby_4.0.2.bb
index 93df86333e..ba24e8601c 100644
--- a/meta/recipes-devtools/ruby/ruby_4.0.1.bb
+++ b/meta/recipes-devtools/ruby/ruby_4.0.2.bb
@@ -48,7 +48,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "3924be2d05db30f4e35f859bf028be85f4b7dd01714142fd823e4af5de2faf9d"
+SRC_URI[sha256sum] = "51502b26b50b68df4963336ca41e368cde92c928faf91654de4c4c1791f82aac"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-- 
2.43.0


