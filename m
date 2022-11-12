Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1E51C43217
	for <webhook@archiver.kernel.org>; Sat, 12 Nov 2022 14:10:19 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web09.2953.1668262213238848055
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Nov 2022 06:10:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=aYzyA8Hl;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id e129so6545895pgc.9
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Nov 2022 06:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h4XKkeJR1dh/jg4UFfsgiizqK2IqPcfvDxZaqYGc1Ag=;
        b=aYzyA8Hlt69kT1xoqziidfAy+VlFFjCzLNuv3EhzUctBJ58IWK/N9RgV7eJ/6JA+6V
         ebm/JtqVfSg1sY3puhCgz4MEVrIBoyfSeSnY75xODNKO+85JopgtChXAQbXDBqUqsgm0
         6lnCZWe+EvmtDzcwae0Kt8Y+WmJr7dFZLNEod1Jr/RaWuldNxYmM9xF8CJiwb9AGl8ea
         eSgZ1sYqk0OQcZjleLS250gcK4c9iWtsZ5GPEHhVqSzDheOXjv5ViWKrEqOZJgjWaeiD
         4v++uXPD1f53UiAnye3gO1+zE3T9MkAsD+hu4wuQVd1UM+GVUwOdAVOosY3ei54stOdY
         Gd5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h4XKkeJR1dh/jg4UFfsgiizqK2IqPcfvDxZaqYGc1Ag=;
        b=Qu+XKRgstPcddy9Zj3kdysg6kM0p5/ZkLwDfOpBuqQadZ2EF3/cCcWCnQDysGxenia
         a3RmANoUJ8QPlWODiqx8uTIY+0ohsEX2Mqt9X3U9C6uY2VlYKHMmGQlxER5st75LHz6j
         EWeyRDbEanKAwFsc/z9M9vo6Ur4WeS2/6NgmzMtDfQy2HY7YMH2BbX2ra2GKSbdr1Fu4
         uR4TQUeP+/y8Tbkors7V6MASU2jEXmOmc6DlQu2eOvg82VUdFl0dKPx9w70fHgTZ3nnn
         1gLGAxaRFpv+1Ct/5dZHvaFbyMR8Q9dFw1RhznM8zoAWX/f2lbZm3TqBdYB2OAybLjJH
         720Q==
X-Gm-Message-State: ANoB5plbrtEA2ZuF3RQAg9pQflW++xc/l9oumb6YsuyAfLiP3J9Rvm9H
	g0pPmsGVJ7Ttq6/61+9MrMkTtVNRJtqMrFsL
X-Google-Smtp-Source: AA0mqf45NoWHIl8Z7kZCnVVFn+1TTSgqizJHY2aPcyVC9y4x8FTjyde8/igyXMc4yfaIdwpR5bJxCQ==
X-Received: by 2002:a62:7b53:0:b0:56b:83d3:a22 with SMTP id w80-20020a627b53000000b0056b83d30a22mr7106259pfc.32.1668262212200;
        Sat, 12 Nov 2022 06:10:12 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id g10-20020a1709026b4a00b0018853dd8832sm3733883plt.4.2022.11.12.06.10.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Nov 2022 06:10:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/11] curl: fix CVE-2022-32221 POST following PUT
Date: Sat, 12 Nov 2022 04:09:51 -1000
Message-Id: <9af175e122acb93a412ad7a099f0eaa793a1c097.1668262073.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668262073.git.steve@sakoman.com>
References: <cover.1668262073.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Nov 2022 14:10:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173152

From: Vivek Kumbhar <vkumbhar@mvista.com>

Upstream-Status: Backport from https://github.com/curl/curl/commit/a64e3e59938abd7d6

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2022-32221.patch            | 29 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32221.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2022-32221.patch b/meta/recipes-support/curl/curl/CVE-2022-32221.patch
new file mode 100644
index 0000000000..8e662abd3a
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-32221.patch
@@ -0,0 +1,29 @@
+From 75c04a3e75e8e3025a17ca3033ca307da9691cd0 Mon Sep 17 00:00:00 2001
+From: Vivek Kumbhar <vkumbhar@mvista.com>
+Date: Fri, 11 Nov 2022 10:49:58 +0530
+Subject: [PATCH] CVE-2022-32221
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/a64e3e59938abd7d6]
+CVE: CVE-2022-32221
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+
+setopt: when POST is set, reset the 'upload' field.
+---
+ lib/setopt.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/setopt.c b/lib/setopt.c
+index bebb2e4..4d96f6b 100644
+--- a/lib/setopt.c
++++ b/lib/setopt.c
+@@ -486,6 +486,7 @@ CURLcode Curl_vsetopt(struct Curl_easy *data, CURLoption option, va_list param)
+     }
+     else
+       data->set.httpreq = HTTPREQ_GET;
++    data->set.upload = FALSE;
+     break;
+ 
+   case CURLOPT_COPYPOSTFIELDS:
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index ed37094049..31aa9d7185 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -39,6 +39,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2022-32207.patch \
            file://CVE-2022-32208.patch \
            file://CVE-2022-35252.patch \
+           file://CVE-2022-32221.patch \
 "
 
 SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
-- 
2.25.1


