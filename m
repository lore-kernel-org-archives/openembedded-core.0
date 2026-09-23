Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F3BC98308
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:12:26 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2844.1790154742843308926
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Ak1TOGy9;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so3523175e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154741; x=1790759541; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cNMQAkxz12NFSeN3eoDwFlPhL4l17v3wO0WOwdmh+zU=;
        b=Ak1TOGy9xcuBSNr3ib8uTSIYN8V5W3VR+f1HI0xnBXSKd07hSUTfkhSov8LSMLvLAh
         cl2D4+tmObU02XYD+xi8hdkuWnYSQgST0PSQaou4Mf9AxYS8rP1Mdx+fzcNJbUdmjgqS
         nRAB05P7xi3PO5Yy1EpHoNBOHeXhp84B5Bb4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154741; x=1790759541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cNMQAkxz12NFSeN3eoDwFlPhL4l17v3wO0WOwdmh+zU=;
        b=Ad0pZrGFtscbrPpruNpkYWlyglM25y2YWUeLxTJIIRzgghG5ij6t1Sh3D0iqhbYuWp
         IICE4QgbdLz+s2j/Da9XnAyANZeR+bbZLr4c6+imFRvyi673QYAhHioo7xIsFIcKUvt9
         l1I6zhjYTaBpbiuee5Tq6PQhE1VpVe3DszdIWtvzBvnHnMIIPLzAUcBK+twk9XV86gm4
         0zmi5H+NZwkVUCNAYvqsVHLRMg+8vb+Traqdi/JhcEClBhqKd4YNGa3CRHsO4zlO2C5j
         sn2Ia45DzYysJwzJAn07AjqFOTBlAdKWOJE4t/JZxCtW0zStbLfn73OqOC2Tf4xuKGjV
         J+ZQ==
X-Gm-Message-State: AFuF++kB93ftKxweE+G9oz7nfEwI5HiFn0y4cBnRPB9Qw2VD258HfpRb
	iEeUn+NGCSJZpHXzgI+YGb2qNwG7+pRvj724iB4/aU5sycCx9PvmnFSG9hPomoRQQDCTqvH8JOm
	CcDC/6gs=
X-Gm-Gg: AYBFou2oWoozbPqTWFF4XLnJQ3XZrQnv8jUMRSsIJsYGaHmGlyOma2CTXFxurws5Phc
	lN2SlXEYJifn1bVRElc8jA0YvtsL8UkH7ex3EbKNKLFnMP2ff5BH/WkUaOufy7R1QBfxYxLreq1
	qOYpS1jYVGOx/NV9srSVNTVK6dpCoyaYbE3mjtbC1q0ByMoJn4GZNbcZSuXcnIY/7joCJTDywmd
	MLSSSEzKJvEJ/oz8v4mPI38Zrb8JPhj9DBQfg1BPCUW55MD9vOf+xcuFgbbUwjcdmMa/lwFzXlB
	+mMLC2rLt4suzR8iKLlJRULPz1Jk6t90WvqbVYbA0VSwIjygxF/b9zvgy3b+GgZeLk4mUJbFIg/
	25wlHLYZuDH0z07Hwi0eFZsGiKqO08zo2daGwcmOokbmwip/I4SPUhkfOVcDTukTMvbre81RSz+
	toh084JEuwjVWKO8VUKbEz/ZnfXFMfeQLpeaqj75uvNcLkXDsC/oTS57lTbHeipcotsWhdiMAtA
	+a8aDagXxnq+u7mZP8cHyPqJHDp2f3YcAoi6Dmms+EoiLCd/OMKpJLeVk1nlhqIhH8S61cJ
X-Received: by 2002:a05:600c:1908:b0:49f:ce78:3560 with SMTP id 5b1f17b1804b1-49fdee0a35emr21455475e9.17.1790154741005;
        Wed, 23 Sep 2026 02:12:21 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.12.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:12:20 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 46/48] curl: Security Fix for CVE-2026-18924
Date: Wed, 23 Sep 2026 11:10:48 +0200
Message-ID: <8305fd4d8e6e4a7a4435989c57fedd470306f0e6.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:12:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246508

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

[1] https://curl.se/docs/CVE-2026-18924.html
[2] https://security-tracker.debian.org/tracker/CVE-2026-18924

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-18924.patch            | 39 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-18924.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-18924.patch b/meta/recipes-support/curl/curl/CVE-2026-18924.patch
new file mode 100644
index 00000000000..28934ababee
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-18924.patch
@@ -0,0 +1,39 @@
+From 90325ff0444cbdff368bda5d26d6405a0bb6ee43 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 5 Aug 2026 10:02:53 +0200
+Subject: [PATCH] http2: make server push transfers inherit share from parent
+
+Reported-by: Stephan Zeisberg
+Closes #22488
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/90325ff0444cbdff368bda5d26d6405a0bb6ee43]
+CVE: CVE-2026-18924
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ lib/http2.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/lib/http2.c b/lib/http2.c
+index 99d7f3b..e6305c9 100644
+--- a/lib/http2.c
++++ b/lib/http2.c
+@@ -47,6 +47,7 @@
+ #include "transfer.h"
+ #include "dynbuf.h"
+ #include "headers.h"
++#include "curl_share.h"
+ /* The last 3 #include files should be in this order */
+ #include "curl_printf.h"
+ #include "curl_memory.h"
+@@ -776,6 +777,8 @@ static struct Curl_easy *h2_duphandle(struct Curl_cfilter *cf,
+       second->req.p.http = http;
+       http2_data_setup(cf, second, &second_stream);
+       second->state.priority.weight = data->state.priority.weight;
++      if(data->share)
++        (void)Curl_share_easy_link(second, data->share);
+     }
+   }
+   return second;
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 3f44cf02d31..905d0b47335 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -42,6 +42,7 @@ SRC_URI = " \
     file://CVE-2026-6253.patch \
     file://CVE-2026-4873.patch \
     file://CVE-2026-13608.patch \
+    file://CVE-2026-18924.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

