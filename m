Return-Path: <bindudaniel1996@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B73C4332F
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 03:58:24 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.140462.1669694297290557522
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 19:58:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Bw0F0GEk;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: bindudaniel1996@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id t17so11470685pjo.3
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 19:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SxgDKzFDZFc4sBpbLJ7zGJdnXPTkKDlEnwVXJjqNkR0=;
        b=Bw0F0GEksIarPwmo9nQ0xPOt8iu/LA2D7mYq2JABfMmH0x2iu3Lo3pn5QqjxYcltrK
         HT9KOP+0qDbF79YlxLa0qwQbsmYDxFjHylcnuAQ5FzMmXlwKsWsrpl6YkTr+xE6uex7v
         tdLd7tsI8jLjYPur+ux8/KgXbq6FxNVUqo1g0P3hntepr9OGukkfSnSSM4iwwULJkiiW
         ZHuGlYf9sx2zfwMGlJ4ydvedsLjGU+JyMYq8nOOFaIROKfzd6J4/pMwXUQSKHST1wAys
         4vpQcvkyQM2tniN99gkZ1ynquc6jTFSBV2CoXKr6zbl8vrkgk14W5SVfFAj0O9bftber
         adIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SxgDKzFDZFc4sBpbLJ7zGJdnXPTkKDlEnwVXJjqNkR0=;
        b=QkmbvuASeIFjPNBQo6NzjdIWVryK2ybUHj7hzJdd/qcutJUIlID50qUWhuY1/18ii5
         YFE/zdEHwsnqWavdUnXjxHBDHpv3XUXLoJNsIB8+6xoHKWZg4xy7UcjDmDN9fIStVmQq
         oU5ufCCWy6ZvlmC/Xo/Hz+d5ZXRfpZsKskuuYznZwbJGywujx9ka8vpZaykyo4+3w0DX
         2zOKuxTK0yAtDQsCg/2IH3k3R37mvC5/CEzsmUPxB07lSnnDpHY4zcF3jOMhzewOYL3O
         0KZzNDOIYsgSSlFrl9Rx6h7cJAdNHYWvHaEpi84KYzQkvdgSM0IM9nYxvjh/ze/e4rhC
         mxFA==
X-Gm-Message-State: ANoB5plwB4P5sfGrQViN0YdR5b2QjdZzJjI28fnYxxAMc8V8OJraQHQK
	brqnBj6ld3UhmQvwE7nbxOw42BdMH28=
X-Google-Smtp-Source: AA0mqf7Eao2OZlE4VXnJyIhmE1VLd+xz1KzYEDwLdRdELiYzGNGfCAYQyCXCFz3ggvKZ6AURpkJkeA==
X-Received: by 2002:a17:90b:804:b0:20a:7ec2:c96d with SMTP id bk4-20020a17090b080400b0020a7ec2c96dmr56531152pjb.178.1669694296404;
        Mon, 28 Nov 2022 19:58:16 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1f26:1387:97d:de1f:a2d:f4b0])
        by smtp.gmail.com with ESMTPSA id x8-20020aa79568000000b005633a06ad67sm8783651pfq.64.2022.11.28.19.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 19:58:15 -0800 (PST)
From: Bhabu Bindu <bindudaniel1996@gmail.com>
To: openembedded-core@lists.openembedded.org,
	bhabu.bindu@kpit.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][kirkstone][PATCH 1/3] curl: Fix CVE-2022-32221
Date: Tue, 29 Nov 2022 09:27:17 +0530
Message-Id: <20221129035719.9207-1-bindudaniel1996@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Nov 2022 03:58:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173955

From: Bhabu Bindu <bhabu.bindu@kpit.com>

POST following PUT confusion

Link: https://ubuntu.com/security/CVE-2022-32221

Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
---
 .../curl/curl/CVE-2022-32221.patch            | 28 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32221.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2022-32221.patch b/meta/recipes-support/curl/curl/CVE-2022-32221.patch
new file mode 100644
index 0000000000..b78b2ce1a8
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-32221.patch
@@ -0,0 +1,28 @@
+From a64e3e59938abd7d667e4470a18072a24d7e9de9 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 15 Sep 2022 09:22:45 +0200
+Subject: [PATCH] setopt: when POST is set, reset the 'upload' field
+
+Reported-by: RobBotic1 on github
+Fixes #9507
+Closes #9511
+
+CVE: CVE-2022-32221
+Upstream-Status: Backport [https://github.com/curl/curl/commit/a64e3e59938abd7d667e4470a18072a24d7e9de9]
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+---
+ lib/setopt.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/setopt.c b/lib/setopt.c
+index 03c4efdbf1e58..7289a4e78bdd0 100644
+--- a/lib/setopt.c
++++ b/lib/setopt.c
+@@ -700,6 +700,7 @@ CURLcode Curl_vsetopt(struct Curl_easy *data, CURLoption option, va_list param)
+     }
+     else
+       data->set.method = HTTPREQ_GET;
++    data->set.upload = FALSE;
+     break;
+ 
+   case CURLOPT_HTTPPOST:
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index ae25b282f8..641614fb0d 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -29,6 +29,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2022-32207.patch \
            file://CVE-2022-32208.patch \
            file://CVE-2022-35252.patch \
+           file://CVE-2022-32221.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.17.1


