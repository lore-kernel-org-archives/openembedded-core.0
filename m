Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C4EDC4332F
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 05:41:01 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web09.2355.1668145250567305927
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 21:40:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=KE8WGWSv;
 spf=pass (domain: mvista.com, ip: 209.85.215.179, mailfrom: vkumbhar@mvista.com)
Received: by mail-pg1-f179.google.com with SMTP id q1so3580698pgl.11
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 21:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d27AHYD4NPAD4apfCLYY2qVNJgUBjc9aiauCgV8268A=;
        b=KE8WGWSv5/54rnxfIgvNfw7c/tkPWuggvwFJO8FnkxsKu21Xq0Dcu2DgbhFpTJUTtH
         9uJXO13sVw+wXmTVx58F3J+OhQogCJx4REIz+KNSQyGL8YcMklKctoiMnEOzMA9az3ut
         HLASv3oOyVCqosuCBipSfzoWGNm1XKm70nFb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d27AHYD4NPAD4apfCLYY2qVNJgUBjc9aiauCgV8268A=;
        b=N3VxMGmObkKnxal8q4gN1RYecyXtYHixNrFn+nz/3QKjutRWieETj2epd0nd2ogvk8
         KlCgPQVe679Wc699fQRcjwixUpdSsvN6DifcoakpjI+8muZboidYiMo4WjDIRywq84ov
         5PHrj38yxr0BmMn30t+ml+iD4s8DaWD1SaqA0wmqrX78QRVpXd0DLNHuqQVOymWJFkMO
         jjyLJjckO2DFsmMVQj0DWzDOTK2olKfYFtNc/G/QGY9iEk9GGlOCrd1XjFgZaQ1mtRyi
         6chZDBXUXfPaUeXHSsUErRkIW+rYxzAsQzQcg03znOBafyttTcfl9lPj4++FmMzxT2xE
         Rqdg==
X-Gm-Message-State: ANoB5plfaFju5oEN5O+wQCeyeKev9l5J1lVsYmto9NRGvUVN2jYeNLjV
	S7C+ReKn4c5aomL2RDLTMFqW1Uah4u7ptA==
X-Google-Smtp-Source: AA0mqf5pNa8tQULwcnDvb78Emj/1h7AkPzDMS/KXBwS1SN/4Ud2Bm9sMoYeWefA4FThhk+fXxY3Haw==
X-Received: by 2002:a62:506:0:b0:56d:4b31:c4d9 with SMTP id 6-20020a620506000000b0056d4b31c4d9mr1086581pff.44.1668145249439;
        Thu, 10 Nov 2022 21:40:49 -0800 (PST)
Received: from vivek-Latitude-3400.mvista.com ([116.74.153.153])
        by smtp.gmail.com with ESMTPSA id s7-20020a170902a50700b00182d25a1e4bsm656231plq.259.2022.11.10.21.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 21:40:49 -0800 (PST)
From: vkumbhar@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][dunfell][PATCH v2] curl: fix CVE-2022-32221 POST following PUT
Date: Fri, 11 Nov 2022 11:10:31 +0530
Message-Id: <20221111054031.878995-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 05:41:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173114

From: Vivek Kumbhar <vkumbhar@mvista.com>

Upstream-Status: Backport from https://github.com/curl/curl/commit/a64e3e59938abd7d6

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
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


