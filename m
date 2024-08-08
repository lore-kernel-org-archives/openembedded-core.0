Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9DF2C3DA7F
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 02:29:03 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.50953.1723084135268107528
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Aug 2024 19:28:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vLAESxP9;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-7c1f480593bso383559a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Aug 2024 19:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1723084134; x=1723688934; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ARe7hP371k3Og3CmWOfaXh0StwbtkCnt0rqnppAwQKg=;
        b=vLAESxP9guojmshfuG2o5te+hQQL7BCpPPPE3ffwMVvSTmx6IqfapNvXXDaLK9TT4p
         xb+oNEgi/d/+kbxJgE5Us7avjvCqEFltYQiLDjXNqFoyQSXGGRA8PGzdvpm9Bd9hKqrX
         ErLbETgrkMbffDGIP7Dg4AA90fqJQLZWokUz8Ed3n6IttlvSVM3uwC+sViihHrXr+1yK
         DLENIyvFdm2Y5p9OcIV8QfBWsqlbREt2gv9lK9kzDDZoq116ryLq0KOTGr6q3KwM6Dak
         s9c4dfgwHWszP75+kBX7Eqy6qSNUIiOvB+useNearJhf+7iYBfu9A60gDBJQdl8nmDhj
         7iSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723084134; x=1723688934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ARe7hP371k3Og3CmWOfaXh0StwbtkCnt0rqnppAwQKg=;
        b=E+TZOCtYhby+zK2UKq7fQQMmtP9DENr7zkFPNlAiR43axTdA0V/+sYTThWQoIwqjlb
         TOCpld5bHeK7ezvLaZ3h7c9mx0qA3tKM6PCKXy7QvYEL4WfN/7Hw1jcBOXczoqPGoF7a
         Y8A9FoWeU+HRdNbkaw8NrNMHsMMeWrcVgyiVe/x22c3cuH37h3vJrqOg4883RSNR7v7H
         nPl5P0XkrPVCcCxoZ+HC8yUVanZedtxTZ2Uouee4S3/vD336AJcPDauq09FHfNZPT/+P
         1vOMOfWGXzIZBWiJKomNE0MIeBDcV9EsSBeYEGwdwT0TvUv+NN3WUDoHkZqMweIu9SxL
         INaA==
X-Gm-Message-State: AOJu0YzIK2hFoH0BcG6IY3Bd5XsdcIS5xfvCp0SAxaNH8ssmvN7395hT
	iepSlwuJ0o8haKtEggF1sIaCsgYIFYgYLH64R84/ucMM2JZarvUegc0ekEfQImD8mLnK18gldRt
	PZhA=
X-Google-Smtp-Source: AGHT+IGWk7Z/SWNO/dvzgu1ZqMaUqhWe+ERaj470LUONSx2ksYpr/4Kt3d6//GeRx5cO1sbklazWNg==
X-Received: by 2002:a05:6a20:3952:b0:1c6:a048:45a2 with SMTP id adf61e73a8af0-1c6fcf22144mr487907637.24.1723084134438;
        Wed, 07 Aug 2024 19:28:54 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1b3b0c796sm2269198a91.33.2024.08.07.19.28.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 19:28:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/10] curl: Patch CVE-2024-6197
Date: Wed,  7 Aug 2024 19:28:37 -0700
Message-Id: <0f172ed0c94d287c96ec465e4724c8b47f846a4c.1723083840.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1723083840.git.steve@sakoman.com>
References: <cover.1723083840.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 02:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203101

From: Peter Marko <peter.marko@siemens.com>

Picked commit per https://curl.se/docs/CVE-2024-6197.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2024-6197.patch             | 24 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-6197.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2024-6197.patch b/meta/recipes-support/curl/curl/CVE-2024-6197.patch
new file mode 100644
index 0000000000..0622e70dc8
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2024-6197.patch
@@ -0,0 +1,24 @@
+From 3a537a4db9e65e545ec45b1b5d5575ee09a2569d Mon Sep 17 00:00:00 2001
+From: z2_ <88509734+z2-2z@users.noreply.github.com>
+Date: Fri, 28 Jun 2024 14:45:47 +0200
+Subject: [PATCH] x509asn1: remove superfluous free()
+
+CVE: CVE-2024-6197
+Upstream-Status: Backport [https://github.com/curl/curl/commit/3a537a4db9e65e545ec45b1b5d5575ee09a2569d.patch]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/vtls/x509asn1.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/lib/vtls/x509asn1.c b/lib/vtls/x509asn1.c
+index f71ab0b90a5931..1bc4243ddae343 100644
+--- a/lib/vtls/x509asn1.c
++++ b/lib/vtls/x509asn1.c
+@@ -393,7 +393,6 @@ utf8asn1str(struct dynbuf *to, int type, const char *from, const char *end)
+         if(wc >= 0x00000800) {
+           if(wc >= 0x00010000) {
+             if(wc >= 0x00200000) {
+-              free(buf);
+               /* Invalid char. size for target encoding. */
+               return CURLE_WEIRD_SERVER_REPLY;
+             }
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 3fdad6a4cf..136782ffec 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -15,6 +15,7 @@ SRC_URI = " \
     file://run-ptest \
     file://disable-tests \
     file://no-test-timeout.patch \
+    file://CVE-2024-6197.patch \
 "
 SRC_URI[sha256sum] = "6fea2aac6a4610fbd0400afb0bcddbe7258a64c63f1f68e5855ebc0c659710cd"
 
-- 
2.34.1


