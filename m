Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D237C677F1
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 19:31:30 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.3838.1676835068874059595
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 11:31:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X+pI6n78;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id e2so1054154wri.12
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 11:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bh1oxt0uxwu4iBLx+YCUxXfmHx2IxXCe+n1AdpmIbIs=;
        b=X+pI6n78hAH2Tt54Bc6Tw8GyxPxRyjNS1Gp0hYqqQWeUpK5HX1YJrnwD2462qqG3RK
         vg3LBdrIBt6EeczjrlDSxW9svThC+SdkmicjbOZnX2vcHe/T2xVVeWdBQ86/s4k+bIMO
         pW8B8m0lnNI/55v5zULkDXJH9Nqia1hBQFGBJpZwhObN87F/xU/h16XsVMEVJM8AIzqG
         FTwm1aAQ8qvblBWjgPO2ZyC45/U9UlBxKV7mpgUaGlXlAvKFfKbINjBlcqDLAV8uIDiq
         vQMPUv2oQSgG/i4Q9wFz4wmBTs+2jSlgVLXBvTrxG5rnfuzkM4GjRO1kaPlrr92BMvPl
         ZsPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bh1oxt0uxwu4iBLx+YCUxXfmHx2IxXCe+n1AdpmIbIs=;
        b=jArItfQ73C1VjDC6uycH2hCV9QAZUBCdUr2293oSRazFAQIskbWIu29367VBN0k+E9
         vnUBWAePCeppz8ZaZJY14cnxKCNKr05xgzu4rYrT4Cqd1SRYVOuGnTYjR+x1+dmKMy0/
         frOr88z3TmVZo8Bfn9/wxjVMw1Z16Ln5zrALcTTlWWxNdZ94OA5OcPZkKb+A5zHTnqQ+
         qgSJHBt75o43IN23uHZjc21ggRXU4GY8YZz0zTs8SKlZotC7ewl9Z5xd9g0vW3FSmMM8
         8oSpM69vYO6apnJROCgM/OxcrglHqxzE54p3fpUr1eatzCiqiBYlljUSFY9z4Z1k+J57
         ldCw==
X-Gm-Message-State: AO0yUKU1KrTQS/44Fb30NVX46P9VM3ynLy1priH9eBaF6gWJYeuiZ+kG
	Bekiv6pfprxz/bA5dE3/zVuv2ImBOzU=
X-Google-Smtp-Source: AK7set+kwb8/JGlcDdP+Vwbr9y/vIVxr1lalwo9ZtZNd5BjRVO0/GCGexZAnPz2rffXgiUAWoRIXXg==
X-Received: by 2002:adf:ffc6:0:b0:2c5:5ed0:7aaf with SMTP id x6-20020adfffc6000000b002c55ed07aafmr1142463wrs.19.1676835084067;
        Sun, 19 Feb 2023 11:31:24 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id d10-20020adffbca000000b002c54c8e70b1sm3347478wrs.9.2023.02.19.11.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 11:31:23 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 29/39] python3-setuptools: upgrade 67.2.0 -> 67.3.1
Date: Sun, 19 Feb 2023 20:30:51 +0100
Message-Id: <20230219193101.338397-29-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230219193101.338397-1-alex@linutronix.de>
References: <20230219193101.338397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 19:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177372

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-conditionally-do-not-fetch-code-by-easy_install.patch  | 2 +-
 ...ython3-setuptools_67.2.0.bb => python3-setuptools_67.3.1.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_67.2.0.bb => python3-setuptools_67.3.1.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index e22e757fcd..b12e4f5d05 100644
--- a/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 1a7fbd6b7ccf9d3f69bd591fa35fa48c0b8916ba Mon Sep 17 00:00:00 2001
+From 8a67710131fc1b8246edc4dbcd8077eed96e13f7 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
diff --git a/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb b/meta/recipes-devtools/python/python3-setuptools_67.3.1.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_67.2.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_67.3.1.bb
index a412043a8b..ef759c8bef 100644
--- a/meta/recipes-devtools/python/python3-setuptools_67.2.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_67.3.1.bb
@@ -11,7 +11,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "b440ee5f7e607bb8c9de15259dba2583dd41a38879a7abc1d43a71c59524da48"
+SRC_URI[sha256sum] = "daec07fd848d80676694d6bf69c009d28910aeece68a38dbe88b7e1bb6dba12e"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.30.2


