Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C514AC79FBD
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 20:33:44 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.746.1788986017757451989
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 13:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=KPTNlEiI;
 spf=pass (domain: mvista.com, ip: 209.85.216.45, mailfrom: sdoshi@mvista.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so295562a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 13:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1788986017; x=1789590817; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9/bOqXrs/YSdhG8wplteHCggA6iGdtdLMurrNy5j0kg=;
        b=KPTNlEiIxWczwF8zUWFmmluymEcVqllTBaNF5UlM4de+4v4RMb+HMQcISr62xxBWoQ
         YlbwiQqsr2OeGC371xVYlgM34pefHSrPJ4IgMYSXZa1q5LRsHRU8bpzCCybQA7jvofle
         gr1nJym6f0NOiYLCw2Ls1n7eWLRFGHBr6Z9lQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788986017; x=1789590817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9/bOqXrs/YSdhG8wplteHCggA6iGdtdLMurrNy5j0kg=;
        b=aVZOzJQjzMEw7ijpq6EHgwN8647SXiSlxWxJLKO6iQLsYCmHbFHGVdYyP7LbPPFnUW
         9BQRN+Y03swY/h01uXbdVQ8999yhpecb2mS5ZQgPVXcXfbQYOzEHyM9rT88s6Lcn12Ng
         XYso0i+XqST5kOVAMOma4Qtp25xHWLi9PHtNEe/ESBjtS0bMN+s9UmMygB+pChFX/70W
         YQ+oqOHvJaWMdubOjba1A/N9Q52J76SQ/jcjwdGD5Wh+4ABsqOvGkS7WGJNlAcxp2hzP
         HXnCTgvWqd2VmRP24OruffM5r+8OTv2L6rf+lHRHZurdP3v+IXrgKoaYJCpSRiY6RqHF
         F8Tg==
X-Gm-Message-State: AFuF++nH9FXlxQwZUkVoiur/M0eU02UkhB3eNSKn8XcDofD6/dzihYe0
	H9qu0B5FeQOrISWemVMo89ox6Yu+gz3ANheDMiFfDpUWcXWuz1vpJp8HN3Kzw0rEZEsuR3N3pj1
	g+34VcsI=
X-Gm-Gg: AYBFou366vn/zRjZQ6dzUvrLsIET6cFR8Eb0VbqY5TDKDVlFglE2jRXOj5QY+YuKKF1
	ceT5u8/mUwSHdSf0pR5KsEov0KsJFaP3q04M5SaMrv0YF6AyG4DgqN+Agv2J+QkxUkKqYYLSGr2
	NKnTYygtkBMssrfaXu/mQql3tq7Qual5A5ilGC/28CNqCkpBP6QcF+He6ootRfpC/i7VmpO19p+
	KEjPu+eZxXhCSg+nq946th8BUmj4IftRc5Z4r6mv4d95JzfCY83CA9amsy5i8gI4XnMsGZgfTBC
	6+gsywFkLj/LNG3/yqyswOSwV824vKB/SaDLGHt8aqWUReL1IcqW0Lvs4U/FDoNVPqxbC9X8toB
	bulu1GJMl0e9LM8AxI59nBMBfYbxfiAxrSiK+J/2GCBn+JoHmNKPI2rTAumIFUlB5O/f9rPdkGy
	DNpQ9YwTCJu6ynim6L0BpBzp/ZAQcgtpncCtwjJRGd0H84rHM0Hz3CQbDGTOahBl0C5iwWploLK
	4bJgbcD3EkL7aJeeA==
X-Received: by 2002:a17:90b:2d0b:b0:380:8bb9:aba9 with SMTP id 98e67ed59e1d1-39d77914f7emr1120826a91.3.1788986017140;
        Wed, 09 Sep 2026 13:33:37 -0700 (PDT)
Received: from MVIN00030.mvista.com ([117.254.227.91])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1434c745a09sm14163385c88.7.2026.09.09.13.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 13:33:36 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][wrynose][PATCH 2/6] curl: Security Fix for CVE-2026-18924
Date: Thu, 10 Sep 2026 02:03:20 +0530
Message-Id: <20260909203324.765094-2-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260909203324.765094-1-sdoshi@mvista.com>
References: <20260909203324.765094-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 20:33:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245495

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

[1] https://curl.se/docs/CVE-2026-18924.html
[2] https://security-tracker.debian.org/tracker/CVE-2026-18924

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../curl/curl/CVE-2026-18924.patch            | 39 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-18924.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-18924.patch b/meta/recipes-support/curl/curl/CVE-2026-18924.patch
new file mode 100644
index 0000000000..fbf452e4e9
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
+index e1c5798..2ef1c28 100644
+--- a/lib/http2.c
++++ b/lib/http2.c
+@@ -46,6 +46,7 @@
+ #include "bufref.h"
+ #include "curlx/dynbuf.h"
+ #include "headers.h"
++#include "curl_share.h"
+ 
+ #if (NGHTTP2_VERSION_NUM < 0x010c00)
+ #error too old nghttp2 version, upgrade!
+@@ -709,6 +710,8 @@ static struct Curl_easy *h2_duphandle(struct Curl_cfilter *cf,
+     struct h2_stream_ctx *second_stream;
+     http2_data_setup(cf, second, &second_stream);
+     second->state.priority.weight = data->state.priority.weight;
++    if(data->share)
++      (void)Curl_share_easy_link(second, data->share);
+   }
+   return second;
+ }
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index c20987ca29..c466132ca4 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -28,6 +28,7 @@ SRC_URI = " \
     file://CVE-2026-8932-dependent.patch \
     file://CVE-2026-8932.patch \
     file://CVE-2026-13608.patch \
+    file://CVE-2026-18924.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.34.1


