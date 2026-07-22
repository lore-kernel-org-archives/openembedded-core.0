Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F385FC531CD
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 17:24:10 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5466.1784741047471534740
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 10:24:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=FouVbe/S;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49571fea44eso1857445e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784741046; x=1785345846; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FuZ5ctE9tcxm/+B6DuH0pf2kZVX2gM+jbnvauP5Sqno=;
        b=FouVbe/SnExvHkzPz2Kj4wQOD6eRE425no2kMh0dtgLlUYX4pKnxt12tEj/rzIX/eg
         up+TMQ+EonSGaFP+sH9p09acjRRd8PFiYYZwkWOLfBFD9H50H+V9kT+vinQcr/O/P8w+
         Z1xNqgLfTJCNGjRJmN+1Edmq/J10Q9auMzWY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784741046; x=1785345846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FuZ5ctE9tcxm/+B6DuH0pf2kZVX2gM+jbnvauP5Sqno=;
        b=R6g6LR8NYmlvaL4Qyr1WF3+MjbaYMbBTqGv9Vcx9IHaw3oOJHyYttVYRO9hlzIgCXz
         Rgfztf+bPGL4mnefh0QweFPIZ7Sl8QwBIkcHBCebwKfa00yBwUSZ1VwSKBKVtnN8dc0l
         Y7hNQt3+Jq6U3Lm22XA8Dz47eb6vEwS5D3VV6Q1U7TLuwo2aMKxoYiJeJAJ5RCFEXsNs
         h08zx8Qbu3wop6nyVXC+WyBAoLvNI9yP96iEtxieXwvY56BePiwCFrqolL6cW7lWAT1K
         N4nWMZgq0gtY3xUkETA5FcySGhNMsxwxNxRrMIWvptpwnGPIFixdj3Lut2PhIvNMlUI7
         XXzw==
X-Gm-Message-State: AOJu0YxpLAiSl00AyFGOgud30x3EXxvsagVEImYigErVzAo7jVFW/LYg
	2Fo9zahPs/wqemvXpioKvDvrAK0ObgQOxgyG8pyhC0Ttr826lzHLafbbZ4p5qDNM0ozZzBq71YX
	UO2/PYpw=
X-Gm-Gg: AR+sD12tHHkpxMJSq06F9khnBJwAxQH8kAbKk2nqDC5tNPajVUQKu5MSpFuH1F810Iy
	iqhQ0SvPiIqdlouwSBzJNp3iSYCfS04sEktPSmPfQUO1rFZgVbcTUjjCuow4srZJgmjY9JLzN1X
	Ul7DLDB9MiqAx7axgLd4glRrkUGiArzMBJFSlot5wb7O69bO8QyJWxZTdlXkfq9vI63OBXNOVs/
	SydoQZLqbBxRrlpCpwaNfySx2DydV/Ou5rEv7LErtzsRdIzDK+Nld6Je7mui34L43VvFGGVBfOf
	Ozj9ySlK5VTtfGSgTbLYqsU1pEwC5+nDxElZ9LLWnwA9VBw6mTghwLE5SeSRPSUufGI7Zal4wk+
	8qL6rJL29euE2GJrfpNoJ0aT5XVvqXlGR2y+KayWkrCb78cJytGMbfMAPAfBx3urN8LEY1OP3wA
	HZ+nE3eRL/2gOZvhzrtbxXCQD85jg7FwAJdQQdqjBnMuCWxREgeNjVJap9CIBBRJnGTDZt8eBLh
	8Mf3S8/K/T0
X-Received: by 2002:a05:600c:3515:b0:495:6788:c21b with SMTP id 5b1f17b1804b1-4956788c2b1mr83769195e9.27.1784741045603;
        Wed, 22 Jul 2026 10:24:05 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c8760sm148275275e9.14.2026.07.22.10.24.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:24:05 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 14/27] curl: fix CVE-2026-5545
Date: Wed, 22 Jul 2026 19:23:27 +0200
Message-ID: <75a294ff9b5f67fd25abf9755c1270b619a8cdab.1784740870.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784740870.git.yoann.congal@smile.fr>
References: <cover.1784740870.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 17:24:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241724

From: Deepak Rathore <deeratho@cisco.com>

Backport the upstream fix [1] for the Negotiate-authenticated connection
reuse issue described in [2] and tracked by [3].

[1] https://github.com/curl/curl/commit/33e43985b8f3b9e66691d06e70be0395849856cd
[2] https://curl.se/docs/CVE-2026-5545.html
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-5545

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-5545.patch             | 43 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-5545.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-5545.patch b/meta/recipes-support/curl/curl/CVE-2026-5545.patch
new file mode 100644
index 00000000000..bb3b1407d47
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-5545.patch
@@ -0,0 +1,43 @@
+From 33e43985b8f3b9e66691d06e70be0395849856cd Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Thu, 2 Apr 2026 11:33:39 +0200
+Subject: [PATCH] url: improve connection reuse on negotiate
+
+Check state of negotiate to allow proper connection reuse.
+
+Closes #21203
+
+CVE: CVE-2026-5545
+Upstream-Status: Backport [https://github.com/curl/curl/commit/33e43985b8f3b9e66691d06e70be0395849856cd]
+
+(cherry picked from commit 33e43985b8f3b9e66691d06e70be0395849856cd)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ lib/url.c | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/lib/url.c b/lib/url.c
+index b9e308a..7c24f1a 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -1110,11 +1110,17 @@ static bool url_match_auth_ntlm(struct connectdata *conn,
+   if(m->want_ntlm_http) {
+     if(Curl_timestrcmp(m->needle->user, conn->user) ||
+        Curl_timestrcmp(m->needle->passwd, conn->passwd)) {
+-
+       /* we prefer a credential match, but this is at least a connection
+-         that can be reused and "upgraded" to NTLM */
+-      if(conn->http_ntlm_state == NTLMSTATE_NONE)
++         that can be reused and "upgraded" to NTLM if it does
++         not have any auth ongoing. */
++#ifdef USE_SPNEGO
++      if((conn->http_ntlm_state == NTLMSTATE_NONE)
++         && (conn->http_negotiate_state == GSS_AUTHNONE)) {
++#else
++      if(conn->http_ntlm_state == NTLMSTATE_NONE) {
++#endif
+         m->found = conn;
++      }
+       return FALSE;
+     }
+   }
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 1cda69401bc..558a2d311e4 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -17,6 +17,7 @@ SRC_URI = " \
     file://CVE-2026-6276.patch \
     file://CVE-2026-5773.patch \
     file://mbedtls.patch \
+    file://CVE-2026-5545.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

