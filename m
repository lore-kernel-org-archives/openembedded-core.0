Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B09CC79FB8
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 07:30:23 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6334.1788939018885887130
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 00:30:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JuPKRRpR;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49b8687630fso46277455e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 00:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788939017; x=1789543817; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SQVFAkc0LRgEfAgQZdw9j4YKAWZ4rNq+VtJOKM8D8PU=;
        b=JuPKRRpR6R3y7Pn3Ib9YKdnrTJVtAL90IWNUZWYKdnT5hJKL2i4hmBWiiHy1kEifvt
         P206dZU5v3TFIzzfwC0VQ0ueL8NB9+sDZfyrRKIfGqK4bYrodDaZ74fWPwqLEjcvml+i
         Ni7j/C/AjLm9cx0McyBcBIqjNrak7RXfkELl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788939017; x=1789543817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SQVFAkc0LRgEfAgQZdw9j4YKAWZ4rNq+VtJOKM8D8PU=;
        b=btEqUy5djWwVp7BDZgunN+60UW+48wSpXftNRe4Ps7j1cof3rTPTM9h8H1MgYNclqu
         Gty72eIy5dK4pbq5vMX5HJ/MlJSc2zN6ZxMUJnN8kyyukfLBROcXgE8rHYEHVyQzUWEy
         baqjDcM7KFsx2JrhOxM5UDNJCFCrQ3+7ymqBRGFBBNcRGqflzJnG6XIEjtpbxRZKDK9K
         BUqAWhT2aKTMxPg0Q23uHAD1WBGP/VeC/Nu80uEFUnjjweCV1vwgXSy2urbgwMaodUNo
         bYgOT1vUoDnGp84vp4o8z+q5oSmiIcuE+V1yDF3gtLnkSb9puxYMNmFXXoIRIqVYPeK+
         1l0Q==
X-Gm-Message-State: AFuF++mdkedfMqRUf88nQWpkyoYD1aE0T857KU0NHPPIWNPUJ/avMI7t
	IBfoHE26NqRGmvfR9pqwuwImef7Y1OA4eWjEDWA2qVBVMq1M8cLVgu3RCRFrGqhTvulsTsYVZsE
	DDW7BOrw=
X-Gm-Gg: AYBFou1qpA5B9AgekK442QIM+18nRV9AzOeniKcUlya1R0pFSx25zjDcTp3puJ5hQ2q
	bq81z/eTodiKKgfmtaN2SOuLYtwG4cJCpLJkexd+oTbGptPm+kNS0C9U8ecdWmNwZTi4KAynYbh
	Q6JpYos2qv95ZGgHD9YEmjjzPKsFrmh48vcUmFfwxrOhKxDKnz5MEo24FPFgnaxBzNV9v9Th1Wk
	dds73R8Fanrn4MECtj+FMtnhWcTpNZgPhbeKhmeQmHbWjPJVywTcUHDZ7ed6AAlTHpLD4EIxwRI
	XwZf9NfD8qRPtD4lAzZkI37CUt0WauErIpOwF7SUpiWXhp3pqEPNQC5R3c2tCiRBdHDrMyhOvZu
	GpKYxMTIvgzQwKyqn86Mk5glpnexcjVPpcCezae1AZocM/fnfDG64qBzSzy3K+7cDU1TmZeTYdz
	NHHA8Yx4gPTfxwy+UA6AnoYDxg9MjOPyn7+5Ef5p8vuQ4Zn+HlgutwxcvDHlAZ4czVUYw3FWdXx
	dYXAkLmhcei88SMWVyZU3QIsZmY/9mQG8t1YoBlOUn7YjbUvv1FgXKqiwtWzRAaPrpOwQWe1Qm7
	vFOfFeRqUQ==
X-Received: by 2002:a05:600c:350f:b0:499:b65d:124f with SMTP id 5b1f17b1804b1-49cf825d1dcmr336340165e9.11.1788939016984;
        Wed, 09 Sep 2026 00:30:16 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm40624310f8f.16.2026.09.09.00.30.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 00:30:16 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 32/38] curl: patch CVE-2026-11352
Date: Wed,  9 Sep 2026 09:29:31 +0200
Message-ID: <360087f55af6acb6c2325421208f9befc7d88589.1788938909.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788938908.git.yoann.congal@smile.fr>
References: <cover.1788938908.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 07:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245441

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://curl.se/docs/CVE-2026-11352.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-11352.patch            | 48 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-11352.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-11352.patch b/meta/recipes-support/curl/curl/CVE-2026-11352.patch
new file mode 100644
index 00000000000..df414b9112b
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-11352.patch
@@ -0,0 +1,48 @@
+From 56eca2afb4806f1032872fa97d1834b3c1385276 Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Fri, 5 Jun 2026 08:34:46 +0200
+Subject: [PATCH] quic: count zero length packets against max
+
+With a flood of zero lenght UDP packets to curl, the receive loop might
+run longer than intended to. Count such packets against the max to
+terminate the loop as intended.
+
+URL: https://hackerone.com/reports/3783438
+Reported-by: vectorqueue on hackerone
+Closes #21869
+
+CVE: CVE-2026-11352
+Upstream-Status: Backport [https://github.com/curl/curl/commit/56eca2afb4806f1032872fa97d1834b3c1385276]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/vquic/vquic.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/lib/vquic/vquic.c b/lib/vquic/vquic.c
+index 2f0e072951..475f18e04a 100644
+--- a/lib/vquic/vquic.c
++++ b/lib/vquic/vquic.c
+@@ -454,8 +454,10 @@ static CURLcode recvmmsg_packets(struct Curl_cfilter *cf,
+     VERBOSE(++calls);
+     for(i = 0; i < mcount; ++i) {
+       /* A zero-length UDP packet is no QUIC packet. Ignore. */
+-      if(!mmsg[i].msg_len)
++      if(!mmsg[i].msg_len) {
++        ++pkts;
+         continue;
++      }
+       total_nread += mmsg[i].msg_len;
+ 
+       gso_size = vquic_msghdr_get_udp_gro(&mmsg[i].msg_hdr);
+@@ -538,8 +540,10 @@ static CURLcode recvmsg_packets(struct Curl_cfilter *cf,
+     ++calls;
+ 
+     /* A 0-length UDP packet is no QUIC packet */
+-    if(!nread)
++    if(!nread) {
++      ++pkts;
+       continue;
++    }
+ 
+     gso_size = vquic_msghdr_get_udp_gro(&msg);
+     if(gso_size == 0)
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 7497337cb95..6c9801f8792 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -27,6 +27,7 @@ SRC_URI = " \
     file://CVE-2026-8927.patch \
     file://CVE-2026-8932-dependent.patch \
     file://CVE-2026-8932.patch \
+    file://CVE-2026-11352.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

