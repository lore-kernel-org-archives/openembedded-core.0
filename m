Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A89C43219
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 06:28:58 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web08.3943.1668061736085350882
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Nov 2022 22:28:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=kNgjXlhd;
 spf=pass (domain: mvista.com, ip: 209.85.215.169, mailfrom: vkumbhar@mvista.com)
Received: by mail-pg1-f169.google.com with SMTP id 136so880391pga.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Nov 2022 22:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cUkKUGxiwuImVMOmS3Bt9c/QXJSzJJV1fzcUwyQFyA0=;
        b=kNgjXlhdLuTRf8c+lTqkoYriQqvb3o5Qwl0W3DIekwyCL/3Ik5eeFlTzPGn+fqVYsl
         aGz94bVOwpcRVJdqjWU1wvgEPnt6ZE2qpX/6zK6I9+GTVRtmnZ2JvevH3xrMd3MOei0b
         QbicgEw5k2XsSBnV6mU9FW+fLISd59Dcyx94U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cUkKUGxiwuImVMOmS3Bt9c/QXJSzJJV1fzcUwyQFyA0=;
        b=AUag7OKDm3WO0DqO19gT5pQ0roYqpOSC06ydvrj8CPxGzFtbxhKBk6iuYKfa/HvUfF
         io8PRI4nmAk7jTUEefdjLTE75/+eM98vpyx0W4MyD8f/46Mz0Vm4SRuSgLah86PF1cKX
         /o+/kPIz+9kNz/EcyFKFcc5L1+WV5zmhIVevLWNyvWZILi/+WdwWIEmujPRPoOtHqqBZ
         fGwgCt1vByCAyJKqSEAN3bHCE2fKfW8M8Qti4vdVEw1mZ8BsXpbIRc4FrDzLMB62y2xP
         tLuEuZZTgYgJ1yqIrvTsKnpFACvpQkA2+xXzOFzf/5fMUzWajcKrImE9+Iy1HOY7T2Pz
         HriQ==
X-Gm-Message-State: ACrzQf10ikVABBIS5D+ePaqxSiUnzp4/onUG3BSUZXcrftvZMiSJD1AO
	TipG9MYdD5ppVCit1+XZ9HACiaI4GGDpaA==
X-Google-Smtp-Source: AMsMyM5d+Sm55Zq4zCUQ1k4QHOlLFURSDlPFOTdTgiKRM087mHwE59LuBa1+1ETBSJw1ydoT6PoXKQ==
X-Received: by 2002:a63:4461:0:b0:43c:dbdb:90c4 with SMTP id t33-20020a634461000000b0043cdbdb90c4mr52536046pgk.340.1668061735123;
        Wed, 09 Nov 2022 22:28:55 -0800 (PST)
Received: from vivek-Latitude-3400.mvista.com ([116.74.159.74])
        by smtp.gmail.com with ESMTPSA id x10-20020a1709027c0a00b00186b8752a78sm10347693pll.80.2022.11.09.22.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 22:28:54 -0800 (PST)
From: vkumbhar@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][dunfell][PATCH] curl: fix CVE-2022-32221 POST following PUT confusion
Date: Thu, 10 Nov 2022 11:58:40 +0530
Message-Id: <20221110062840.52346-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 06:28:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173069

From: Vivek Kumbhar <vkumbhar@mvista.com>

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../curl/curl/CVE-2022-32221.patch            | 29 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32221.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2022-32221.patch b/meta/recipes-support/curl/curl/CVE-2022-32221.patch
new file mode 100644
index 0000000000..ad1769e19a
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-32221.patch
@@ -0,0 +1,29 @@
+From 9f9f2ed81151b1063eac5fb0eca5bbb195cbfe79 Mon Sep 17 00:00:00 2001
+From: Vivek Kumbhar <vkumbhar@mvista.com>
+Date: Mon, 7 Nov 2022 12:51:19 +0530
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
+index 4648c87..48f789c 100644
+--- a/lib/setopt.c
++++ b/lib/setopt.c
+@@ -486,6 +486,7 @@ CURLcode Curl_vsetopt(struct Curl_easy *data, CURLoption option, va_list param)
+     }
+     else
+       data->set.httpreq = HTTPREQ_GET;
++      data->set.upload = FALSE;
+     break;
+ 
+   case CURLOPT_COPYPOSTFIELDS:
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index c3d629108a..a5795c5038 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2020-8284.patch \
            file://CVE-2020-8285.patch \
            file://CVE-2020-8286.patch \
+           file://CVE-2022-32221.patch \
 "
 
 SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
-- 
2.25.1


