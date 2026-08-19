Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56399C5DF95
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:57:52 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10329.1787155071443540064
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:57:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=W2I7+WNl;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4813ea321cdso19359f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 08:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787155070; x=1787759870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HyyKoonaDP7tJP3PaqYD+D9D9mScXyTcYB+TqrJBElQ=;
        b=W2I7+WNlRqgiRcLfavo4JUauLHP7YnBWg7+rTsRvOJIa52AeuP9zzpU+sPbuiY4k1F
         tSzkk2UeYpnMo/WZYKSIPiUExt9LF840lMJr2bI0VAnMAWLeeyZa+RA0E5JxTZfcB+Xo
         +2lQjjAXPZS4zuIb9M3DHKEqaUaNA9H6ERwWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155070; x=1787759870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HyyKoonaDP7tJP3PaqYD+D9D9mScXyTcYB+TqrJBElQ=;
        b=s90zftDkWiaTSRXkFufD6f34WbPOdwvHhemESj721QvfiEWwYoS336RQ6tFI5vyUqs
         zCBVkgstdJFpA/tV6ClXomMCOrszhfhXOjN3d4jape+kK0VvbqjYTgTOfcZqJhNVntvN
         OxYWbIeAnLnLqcFudhwG+ANfst5bVrawz3bTb1DmJA4xoXYwfTybIGGxuZ0beGT7Zru+
         7j5zM9FT+fX5oTLAQFstBw2i/3FySj5QpEOEui8RgSDkdCXL5/TPgUkuBnLorjiXiVhC
         49/QFgGf/0aNqZkZk7LAd2ijWe6YF7VLDXti1EbLsyjc7Bqu7+GTuCxnveA3cCsnrUmF
         ftsA==
X-Gm-Message-State: AFuF++kIrE9H7xHqxyydi1usd2hvpoxrmaxq/Ln/4zhC+5y5NL5Qchg8
	CRBlbrVrtI9avBPaFOEPLTz2fYBukcH+tqwV468M/qGe7YIBksSw/5GXaBrogGGZTsgRqSTtaN/
	SlubKGws=
X-Gm-Gg: AR+sD10YySGz+WwZgBtF1mHi89boGwSRUdoUmBtwrf9poHnpiengLWsSIhhdnri+j8T
	UCBoCGc2dV3SZqlya32RHSGnuO33afDzwKVswXa95bT5PZMfh/xOpp5AGdLqtbvplkCJfiTI4Mz
	8QczfU9OaG6CgInQN1UNipMqY58+7A1QIU3k/tQLXIFBAD2tzyvwDyZNQsq7N3WNWGhmQnLdlJW
	S8Ve+c3/tdsDAsqytsjcIkNva3fz3OGQjTd2R/ThXRc/YWhTV+XDFjEWZx4v2lttpzqpS2VPUYx
	kD6p14FE5HuchDADxFlF3CjDiPl7a06M30+DKQ6DdLzU6A1uJcG6YJDGso3GYkPM6wyC2yEsfGo
	ZPBsYKu+3NeUHnyveZMmoDPhv/FcCTm0BQOn0IX/R/WtGjBFX0rV3nBt2BedHCeBSz4MI3cSd6m
	W5Q8C6Rblg8PVuOrWOzQbo02zforAjHllu6jVCZGw1TXc93uLOUcTsiiL8CBqDjLJTtLTFPjUUk
	VquTrPpvHS/k6p6CsBi+NarghEJKKhJ1wKa1ldvdHPtECLGMda/V76vpiNdGVYH0eWgrkXDFmS5
	JbL0P+WV8/LB8igl43huGDB8zNrmvN29Fu60enB4
X-Received: by 2002:a5d:5f07:0:b0:47f:86af:8fd8 with SMTP id ffacd0b85a97d-482b7837553mr304906f8f.11.1787155069684;
        Wed, 19 Aug 2026 08:57:49 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm7215698f8f.35.2026.08.19.08.57.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:57:49 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 20/37] curl: fix CVE-2026-5545
Date: Wed, 19 Aug 2026 17:56:51 +0200
Message-ID: <476e5ee5af648083fbf642e3c8218c55bd79ce7b.1787154074.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787154074.git.fabien.thomas@smile.fr>
References: <cover.1787154074.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:57:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243756

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream backport for CVE-2026-5545.
The upstream fix commit is referenced in [1], and the public
CVE advisory is referenced in [2].

[1] https://github.com/curl/curl/commit/33e43985b8f3b9e66691d06e70be0395849856cd
[2] https://curl.se/docs/CVE-2026-5545.html

(From OE-Core rev: dfb61bf303fc32257e32719df36344286b1a80e6)

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../curl/curl/CVE-2026-5545.patch             | 42 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-5545.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-5545.patch b/meta/recipes-support/curl/curl/CVE-2026-5545.patch
new file mode 100644
index 00000000000..d012f39b079
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-5545.patch
@@ -0,0 +1,42 @@
+From ab96b09b1163659b83b0716abe42662d1e1630ea Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Fri, 5 Jun 2026 01:17:44 -0700
+Subject: [PATCH] url: improve connection reuse on negotiate
+
+Check state of negotiate to allow proper connection reuse.
+
+Closes #21203
+
+CVE: CVE-2026-5545
+Upstream-Status: Backport [https://github.com/curl/curl/commit/33e43985b8f3b9e66691d06e70be0395849856cd]
+
+Backport Changes:
+- curl-8.7.1 still performs the NTLM/Negotiate reuse logic inline in
+  ConnectionExists(), so the upstream guard was adapted there.
+
+(cherry picked from commit 33e43985b8f3b9e66691d06e70be0395849856cd)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ lib/url.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index 30f215fd48..1d6e3309f5 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -1219,8 +1219,14 @@ ConnectionExists(struct Curl_easy *data,
+          Curl_timestrcmp(needle->passwd, check->passwd)) {
+
+         /* we prefer a credential match, but this is at least a connection
+-           that can be reused and "upgraded" to NTLM */
++           that can be reused and "upgraded" to NTLM if it does
++           not have any auth ongoing. */
++#ifdef USE_SPNEGO
++        if((check->http_ntlm_state == NTLMSTATE_NONE) &&
++           (check->http_negotiate_state == GSS_AUTHNONE))
++#else
+         if(check->http_ntlm_state == NTLMSTATE_NONE)
++#endif
+           chosen = check;
+         continue;
+       }
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 3e48c58fa78..7ea5723de07 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -38,6 +38,7 @@ SRC_URI = " \
     file://CVE-2026-3784.patch \
     file://CVE-2026-5773.patch \
     file://CVE-2026-6276.patch \
+    file://CVE-2026-5545.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

