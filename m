Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA7DF36B91
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 23:11:41 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.144836.1775776291306698915
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 16:11:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=AvHpthUG;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488ba840146so13523875e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775776289; x=1776381089; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ImvltFtUT4cB6LZ4Yhh3fO4WvYNXpQvW2K3n+YAiVQk=;
        b=AvHpthUGaO9Tdie2v0Ezh8E0JonQ8lsUWuWr3C2xXlupghJTCMYuIin9PAgig1e5lR
         /MkioXfMKgioMBtOG+x9OQ//21Lrj/YMnvUPuJfrVW1HziVhsmWAB02R0JKLV9G7WPS7
         PnsLddUdF+uKNsjuRw7ap5zwMhnpPrDYTtcfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775776289; x=1776381089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ImvltFtUT4cB6LZ4Yhh3fO4WvYNXpQvW2K3n+YAiVQk=;
        b=P6xddTY2NdHKlLFDW2TNth3oKD33EPShHKt04+PLBslfFIt99SHsNNjMTdcaCfXEcN
         Mq1XKDx7mMFgzp7neiEzjT/tSBehqNS9HGPaixYY0Ttnw7mgyyeoFej2cl77YZlTTE9g
         CfJHqPkIHMJTsgFiR3iOKGj7oU16r/omKzstMIQ5T9Dz8aWCbcpo4v5dFm2s831w6YvI
         rlZXVcS+ECp1la3jyd6TTh5kp2iYQB7MyqCBe72/zheu0Noof2K464EOAZOE/KybhXcq
         rMuCo14bkCHCI33Pc4Vjwb8X4J+LDl1NA+9SVK+K/T4zVLJe30RDwd0dLu9ogrjkM5GF
         1hNQ==
X-Gm-Message-State: AOJu0YywiNxfyNavmXCjD+yhQbeabqCpc1j/wVKZ9FX/Cv1tGRScebeo
	fbjT/r5jIQ0/ahHGVbG8fyzbww4DhKOsdgse7mMfl9BRuGuUJW/+enIuCmptusqIZAyqXF7ovYA
	nY2najtmQfiwN
X-Gm-Gg: AeBDietZiC6BrFrup9sjWz3J7o8khN58DanZzqidQPDRIIebBAx4NzRXJ5COggrL57w
	84zJdSS0OyeIHmubFYkzSf+ZTqO/+jNUqGv7qyRzk78U8NDFf4LV+TwjPxMCE89oEfpnEoSD7iS
	qLXYg83wzMB+Kk/Um2JgR5MOa60guBmA4FVixJcoCGybDZ/6qp1osdNoRR9scR5EcglXV6VkYlL
	0whcEXd8KtPW99/ckrVuysHQitZ9sykJuCxhebVQhlPVk9lbDlkOGuwhiMFmNf3WRrV9Q/5lDx+
	l+LiSXotK8sU19hOp1Ubt6AGhGY8uG6FffbZaTyMwQaXg/w+3qXoDQ5JVp3uMDTw/Y79dp1CYrM
	RBRpC9iiilzauXRf0VrHpCSNmNNlx2pGdJy0iIFuXfC65Hv/RQDj702SK726CaVSyPgL5NXmgQ7
	6XlmpnXy+8+ROsykPigbs7XYZ+2161iFloJdF0hzAF6kH3YNrpercbRuNRTdDiE3dgxqmjsGeRh
	0mbSYfmaH5h540iVSYRfceqC02w
X-Received: by 2002:a05:600c:630d:b0:488:79a3:f04c with SMTP id 5b1f17b1804b1-488d687cfd0mr8271595e9.27.1775776289390;
        Thu, 09 Apr 2026 16:11:29 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00af4acfc73fc9518a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:af4a:cfc7:3fc9:518a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67e685csm7708855e9.6.2026.04.09.16.11.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 16:11:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v4 17/30] curl: patch CVE-2026-3784
Date: Fri, 10 Apr 2026 01:10:17 +0200
Message-ID: <659a32145680054823581ddcf6412410247df108.1775775155.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775775154.git.yoann.congal@smile.fr>
References: <cover.1775775154.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 23:11:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234976

From: Vijay Anusuri <vanusuri@mvista.com>

pick patch from ubuntu per [1]

[1] https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/curl/7.81.0-1ubuntu1.23/curl_7.81.0-1ubuntu1.23.debian.tar.xz
[2] https://ubuntu.com/security/CVE-2026-3784
[3] https://curl.se/docs/CVE-2026-3784.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-3784.patch             | 73 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3784.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-3784.patch b/meta/recipes-support/curl/curl/CVE-2026-3784.patch
new file mode 100644
index 00000000000..95784e47637
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-3784.patch
@@ -0,0 +1,73 @@
+From 5f13a7645e565c5c1a06f3ef86e97afb856fb364 Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Fri, 6 Mar 2026 14:54:09 +0100
+Subject: [PATCH] proxy-auth: additional tests
+
+Also eliminate the special handling for socks proxy match.
+
+Closes #20837
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/5f13a7645e565c5c1a06f3]
+Backported by Ubuntu team https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/curl/7.81.0-1ubuntu1.23/curl_7.81.0-1ubuntu1.23.debian.tar.xz
+
+CVE: CVE-2026-3784
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/url.c                        | 28 +++++++---------------------
+ tests/http/test_13_proxy_auth.py | 20 ++++++++++++++++++++
+ tests/http/testenv/curl.py       | 18 +++++++++++++++---
+ 3 files changed, 42 insertions(+), 24 deletions(-)
+
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -930,33 +930,15 @@ proxy_info_matches(const struct proxy_in
+ {
+   if((data->proxytype == needle->proxytype) &&
+      (data->port == needle->port) &&
+-     Curl_safe_strcasecompare(data->host.name, needle->host.name))
+-    return TRUE;
++     curl_strequal(data->host.name, needle->host.name)) {
+ 
++    if(Curl_timestrcmp(data->user, needle->user) ||
++       Curl_timestrcmp(data->passwd, needle->passwd))
++      return FALSE;
++    return TRUE;
++  }
+   return FALSE;
+ }
+-
+-static bool
+-socks_proxy_info_matches(const struct proxy_info *data,
+-                         const struct proxy_info *needle)
+-{
+-  if(!proxy_info_matches(data, needle))
+-    return FALSE;
+-
+-  /* the user information is case-sensitive
+-     or at least it is not defined as case-insensitive
+-     see https://datatracker.ietf.org/doc/html/rfc3986#section-3.2.1 */
+-
+-  /* curl_strequal does a case insentive comparison, so do not use it here! */
+-  if(Curl_timestrcmp(data->user, needle->user) ||
+-     Curl_timestrcmp(data->passwd, needle->passwd))
+-    return FALSE;
+-  return TRUE;
+-}
+-#else
+-/* disabled, won't get called */
+-#define proxy_info_matches(x,y) FALSE
+-#define socks_proxy_info_matches(x,y) FALSE
+ #endif
+ 
+ /* A connection has to have been idle for a shorter time than 'maxage_conn'
+@@ -1282,8 +1264,8 @@ ConnectionExists(struct Curl_easy *data,
+         continue;
+ 
+       if(needle->bits.socksproxy &&
+-        !socks_proxy_info_matches(&needle->socks_proxy,
+-                                  &check->socks_proxy))
++        !proxy_info_matches(&needle->socks_proxy,
++                            &check->socks_proxy))
+         continue;
+ #endif
+       if(needle->bits.conn_to_host != check->bits.conn_to_host)
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index f50af1d4722..a2ee5736810 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -75,6 +75,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-1965-2.patch \
            file://CVE-2026-3783-pre1.patch \
            file://CVE-2026-3783.patch \
+           file://CVE-2026-3784.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 

