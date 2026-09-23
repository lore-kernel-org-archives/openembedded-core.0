Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D223C982FA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:12:26 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2843.1790154741858295228
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=oE2J0WO1;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so5657545e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154740; x=1790759540; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qFjIm41PCn/v34mzQG/gZlENNac9G1Z2HGZpDOVuRZg=;
        b=oE2J0WO19c1wIvgwnUOnmYbbXDKUW4IdbX19xYYBJP51YkaOo2Jnzt2JlOy3Cj55If
         lXfXx6oLchveF4qRgwoEIs6nt4R9ZXiK9+/4l8p4rbNvmRUQ48a8urGZ6Zexrko7VNp3
         7IMNwc2WCGDfdTvRpYdM1MPYshosgorCBxO64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154740; x=1790759540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qFjIm41PCn/v34mzQG/gZlENNac9G1Z2HGZpDOVuRZg=;
        b=GMY6ivN7jtiwYaLsumja2rE0zh72ApoyrcmOyC0Gz575q72DsHWCPnY6OlIeCFJXAY
         N6cM04Z1Dwm30CMzxWEBKFmfErFTlAGj5M8/2y4qauMDCmTOll4QieBHAXuXxDRcpvHY
         y5OQMQRTDNfwIksGC3TxPv/40f3+XWGRJS5uTZWfxZDC44gH5gTrAWQNu+4WGcrQXv7O
         9PHPmK4u9uhIVw47SHA//OBsNmr4L7f6DyePCc5hLgbZbmEd2zOm0OCWNw9okiaV7QPk
         CibCl8TAviKKkM5U6VusRGYzUvim7QzIYCXnS4RJHlIsW8oz48QcbG/n/JmV6qpSaF5O
         /YKw==
X-Gm-Message-State: AFuF++lP0kNb6lbU++hAeZH1GZN+EaPEdSCgGTNCnKkBNuer7sXq9h2T
	H2wi9CF+J1K+0nurwxFgWo17/rfz9X/AxM6DVtwJgRl7sawHqU/BLSN91uyaGaSmKdpehyysRDS
	vZqNDM0o=
X-Gm-Gg: AYBFou1ODGNHuVSYkUc3/RuoS77yfBYvxUACvgO+Kk61KuS8qM2mVTEzyUBd9zDHFTM
	MpgOkhyB8DF7Vmv5CFMX5rCELxT7b/3nx2ER9mDIR2EDELOoZe+26t+hA2mWwVgUtyHlnKtNRO+
	rMl1CSjgs2TIFoYPrjhbpvDxbWp7hnejh+LdRzwR/ZRS1YNlQOmwnGlbZ29tJyMsU3DB85QpMzB
	JDEbQUiGR1F2eUZggIkLhemqbRPlB38Kh5B+qcBu1J3x2/capQuQVRz7h0jU7kfi/lBmcaYIN0p
	6jhSO3SrNpJXa3YTIOVrYzyaaURlWI+qKShpkUj0K27vMS2bJjsk4UC7FfPSSyzGyoa5J3Exrub
	7tCKJCaV3GkRfkC0Es3rai5dRfO13hNFJjixlj+GLyORhgRTGfFEe+wnS/Vimb0l71MtBv61ypQ
	o3J4PsyWYtYBOndpmdYp0TvMLg0s3GOUg+V5qolsc/8CN6SeOV2gHnGm0iZ/ZQPMdj+CIWUWwuU
	Xuam172vx9LE5v2WvUSN4n2P6zfoCY74gMbx85iTttVGcrEkP1rZCMLYR8GhqHbjCAFGHGv
X-Received: by 2002:a05:600c:500d:b0:49d:28c4:b304 with SMTP id 5b1f17b1804b1-49fdf1485e3mr24931425e9.29.1790154740097;
        Wed, 23 Sep 2026 02:12:20 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.12.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:12:19 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 45/48] curl: Security Fix for CVE-2026-13608
Date: Wed, 23 Sep 2026 11:10:47 +0200
Message-ID: <f6723c7d390e1901dd422eb72aeebf145fabdfab.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:12:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246507

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

[1] https://curl.se/docs/CVE-2026-13608.html
[2] https://security-tracker.debian.org/tracker/CVE-2026-13608

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-13608.patch            | 48 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-13608.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-13608.patch b/meta/recipes-support/curl/curl/CVE-2026-13608.patch
new file mode 100644
index 00000000000..bb1662fa4c0
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-13608.patch
@@ -0,0 +1,48 @@
+From 25df759f0f0c1aeaee066a4502bb36a8a86fb22e Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 29 Jun 2026 10:44:47 +0200
+Subject: [PATCH 1/5] openldap: handle Curl_sasl_continue() returns better
+
+Similar to how it gets treated already in other protocol handlers.
+
+Follow-up to eeca818b1e8d1e61c2d4
+
+Reported-by: Eunsoo Kim
+Closes #22213
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/ea71c3b6b60e563651ea8596a975aef0c8199519]
+CVE: CVE-2026-13608
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ lib/openldap.c | 15 +++++++++++++--
+ 1 file changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/lib/openldap.c b/lib/openldap.c
+index 47266f6..b566d1a 100644
+--- a/lib/openldap.c
++++ b/lib/openldap.c
+@@ -682,8 +682,19 @@ static CURLcode oldap_state_sasl_resp(struct Curl_easy *data,
+   }
+   else {
+     result = Curl_sasl_continue(&li->sasl, data, code, &progress);
+-    if(!result && progress != SASL_INPROGRESS)
+-      oldap_state(data, OLDAP_STOP);
++    if(!result) {
++      switch(progress) {
++      case SASL_DONE:
++        oldap_state(data, li, OLDAP_STOP);   /* Authenticated */
++        break;
++      case SASL_IDLE:            /* No mechanism left after cancellation */
++        failf(data, "Authentication cancelled");
++        result = CURLE_LOGIN_DENIED;
++        break;
++      default:
++        break;
++      }
++    }
+   }
+ 
+   if(li->servercred)
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index f2479a33643..3f44cf02d31 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -41,6 +41,7 @@ SRC_URI = " \
     file://CVE-2026-5545.patch \
     file://CVE-2026-6253.patch \
     file://CVE-2026-4873.patch \
+    file://CVE-2026-13608.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

