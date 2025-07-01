Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B893AC7EE30
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 13:27:33 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.10642.1751376449709495054
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 06:27:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=2f99eDpX;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4a818fdab84so39049721cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 06:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1751376448; x=1751981248; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KT8oAgdWJJGu/4iETWmUG8Rsb9QIAtAiLkn+MKuIv4Q=;
        b=2f99eDpXVdQyHAvwFQb6cAnjSWyZ5OqZ/0RAXfjLOrQwN0BNaBbMs9bR40XiZVy0zm
         Xq8RAmzt7AJTNFb3qwyN3HrYbzzilWXCPk8nLry3N7V3OjLBzTDE6XsBTk6D1O/VW3mA
         rJMA2ETCbxKQi4nB+J/N+0gwMUS9XGbvYjY25bUXT2d5yMNmQeKHNQ20yG8Tc4pqxRnB
         aECqf9OlDeJ8jCMRTSAR/v+MRTzz07lFZoa7Yuvhit8YwL5ezVB/W3nx9X8qt7m2+44m
         cY8HHvzLR+sfhs9WkpmB8P401PVM6lrCLXKPqpLOX5yHEZNJYdNz0RfFVw4t8VVFXTfH
         ZsLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751376448; x=1751981248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KT8oAgdWJJGu/4iETWmUG8Rsb9QIAtAiLkn+MKuIv4Q=;
        b=Z3bc9CwexLMza6Pq4oJ24RPxwamhL5Jj+xKi8zey1qXwmEdvVRR6R5KGurZwptHU2d
         tNFsjpvIb/VYl5/RGCyxIXuAr2QRZk9KsUg9rIJGd7s6yxd8Y/AVn10GbgYRaPQFcNzw
         3Y2hgWxaExKqfj9jR+MN++bfKhIdUUDCKv5ZyA6xe9Xcsl1Ei8fQcEYWOgKxRNo372M+
         mCYDQtLoKuH55XN0DctQTpzHqEzbQ1tAdDMyUfJA8hkaFGixgHNdFYYr3jX5AqWH6ldX
         sSx6N5STcghFsouPBkLgauQH2fp3hSvFhpEZ+I7CRPMSPwerj9VoH/ZGj5J4u9acEgG2
         G31g==
X-Gm-Message-State: AOJu0YykM4pdTNq2J0JnHOYXhv4bT0h68PolFLudUwus4rvetaoTA/LK
	Ykkz+l4SWMN3ZWH1qtW/+DNwdB+J0JexY7i+62er2s3JoTrcQa+oojJvZSLSEVpK3YMsi6Ejjtz
	GvUo=
X-Gm-Gg: ASbGncvZCy2u++qF7wvAk7ZQVUu3/AJ+7u6/Vgc5DSigHBk3WGRgsU1nQOmSxks2s4W
	SgG0YxV6kzRpF1lSs2ceOavoTa9INb9LZHb/5rlLc2WhhivbV9SypUFnMsGA9SxEzVEh0rFdu4i
	7Iez7Ua8Ou++WLLeNEVixKwAnQ4a3/ffQ7zjEf99A14OAJpgNHd/YyrxPvdr4huocyZdfufkKI1
	OlZ3kyxkQAIKT45b5m99AAGRusg+C/tKHMMB4EhPsqTYmuAmKhXgB4pwgfT6T3oDGjXyg+e36RG
	Ysd7LtZ2J/VJ+P+oKMzb7moRwMypThcrzAi5AcMv8RXRZAX9B/gcfQ==
X-Google-Smtp-Source: AGHT+IHL11ayaNsiNUDwF7DBw+KRNAiFH/QwmSfz0CesgsXhnX2q8u112Pl6qzNHWs5A33ehUDUjLw==
X-Received: by 2002:a05:6214:3015:b0:6e8:ddf6:d11e with SMTP id 6a1803df08f44-70002247794mr264223656d6.21.1751376447941;
        Tue, 01 Jul 2025 06:27:27 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ff154872c6sm81642046d6.80.2025.07.01.06.27.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 06:27:27 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] libucontext: use hard/soft float
Date: Tue,  1 Jul 2025 09:27:23 -0400
Message-Id: <20250701132723.3214755-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 13:27:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219570

From: Jon Mason <jon.mason@arm.com>

When building for qemuarm-secureboot in meta-arn with musl and clang,
the following compile error is seen:
- | ../sources/libucontext-1.3.2/arch/arm/swapcontext.S:23:11: error: unknown token in expression
- |  ldr r4, =#0x56465001
- |           ^

This is happening because 1.3 added ifdefs for assembly code for both
hard and soft float, and bcause neither is being defined, it is taking
this path with the issue.

Since we can tell if soft or hard float is being used via the TARGET_FPU
variable, use that and set the relevant makefile flag.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta/recipes-core/musl/libucontext_1.3.2.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/musl/libucontext_1.3.2.bb b/meta/recipes-core/musl/libucontext_1.3.2.bb
index 2362cba5c8a2..1d14a527a850 100644
--- a/meta/recipes-core/musl/libucontext_1.3.2.bb
+++ b/meta/recipes-core/musl/libucontext_1.3.2.bb
@@ -48,3 +48,9 @@ def map_kernel_arch(a, d):
 
 EXTRA_OEMESON = "-Dcpu=${@map_kernel_arch(d.getVar('TARGET_ARCH'), d)}"
 inherit meson
+
+ARM_TARGET_CPPFLAGS = ""
+ARM_TARGET_CPPFLAGS:append:arm = "${@bb.utils.contains('TARGET_FPU', 'hard', '-DFORCE_HARD_FLOAT', '', d)}"
+ARM_TARGET_CPPFLAGS:append:arm = "${@bb.utils.contains('TARGET_FPU', 'soft', '-DFORCE_SOFT_FLOAT', '', d)}"
+
+TARGET_CPPFLAGS .= "${ARM_TARGET_CPPFLAGS}"
-- 
2.39.5


