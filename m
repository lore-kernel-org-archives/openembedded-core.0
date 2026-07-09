Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9AB8C44509
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 10:07:06 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5884.1783591624014797532
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 03:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hH5G0WMC;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so5713115e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 03:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783591622; x=1784196422; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t5VPrSHavVfy869WW692ro24kYliKX/7kj8ba71JJ7Q=;
        b=hH5G0WMCjIoqapTNvm/pbG4sJ465LkWBjkKsUqoyax37s6oWRiY2U6jJIEXj0wP8zi
         298yRCjZzel4D+1ECcYADYBOqab7jky/WUBPjGgYwJHKbWSXYTocwJjmWvABY1HvTkcE
         UeIpsNyT0mwPSbrR5kYlESbmUrsYMyFXRmogo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591622; x=1784196422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=t5VPrSHavVfy869WW692ro24kYliKX/7kj8ba71JJ7Q=;
        b=GBRvuEkA5FUZ9USY0mj6/+LeJ3YDYd4CJ48UlqaAOpfGpy/tvR+Xj/s/RUhJBtpS/Y
         NMwtFB2i7mBGYe5/i4Fko/YtaUK/JEa/DG0wgNijKDu7NW1tL5y32IPoqzF7SJ5sTGzn
         rc90U7Mlv8YX/lhjvGuRka5fmvrYBr1Tui7AMRUXsyxVUgqFU3K9AtMxIkNkF61QimF5
         6w/6WFAAmxgo96wEGl6wlz992FfguWU8pshSBWdumJzEMWjcohx5gQFNzdlzdwQ8zHVD
         PhAeNAU2r8atX7DxwU32tUNkZc0M2Y888y++kTB7IgUEfyRopiyvKjdx5Ok3n0UazJFf
         /gpQ==
X-Gm-Message-State: AOJu0Yw7clanOiJSpDcW5M1m1g96F8F6kyvUVZWGzdiNOWXV4dyLgNjR
	qh6dPcCMYzCa3tlDJMkI8qr5SJwNTzIvyOBIkuURhB/rn5jqHVRVIwapktkBa5zf73fK4QaD7Ph
	dutYT54k=
X-Gm-Gg: AfdE7cmjWTWtY3I+G4Hs9BCGxdqmlzU/UucfD/Uaii5nuk3zMeHsbZirPDm8ehkr+Gc
	ysv6F24WZF7BI90OLkFEpFkFGfp56u6XHbTNfGUIfv3shWiojE0T7iEzch4qz5WZKy8ErsdR+dW
	hYV//CwyMQ0xVa3nYwP7ISoocArrEydJyn0sN9SJyyvLrutVgN5mDk8p54QL7u7ldSmBwXKzzN1
	Lp5QogrRFEm0KsFY/+hGzxIhjUFpT5lj4z7XdXvDZzM6eOvj2pr15D0mhjbQhgaevPvcgwl2id4
	OacQ6G4FgAOoIN0X8FArM1I4Q7kTjbcIHN1y3HUt8WLQrn5T1Mrh66kE/bJpC2KujVxBMSl3C4+
	4hhUfPGYiQ9pQh65FviOCsLA20h+kTkkhTiiIe+pBdfOQiaTGj9nmR3jCabfGzQ3+6dLeZGMpoJ
	yQ4VPpSwCNoAdcWs5K6pNsCAYpJivie2UjGwQr9zBD+Ace5Vgu4CdsZWGJqQtXTSXIVAqQKlPwz
	Pj9PLOJm9TLzZRPUw==
X-Received: by 2002:a05:600c:528e:b0:492:4363:e7eb with SMTP id 5b1f17b1804b1-493e68f03damr64806985e9.32.1783591622172;
        Thu, 09 Jul 2026 03:07:02 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fd88810a86c49142.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fd88:810a:86c4:9142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a5d174sm149687135e9.2.2026.07.09.03.07.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:07:01 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/25] curl: fix CVE-2026-5773 - wrong reuse of SMB connection
Date: Thu,  9 Jul 2026 12:06:21 +0200
Message-ID: <7736f905e78162ac657d7a1c790dfa5701dd6b19.1783590688.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783590688.git.yoann.congal@smile.fr>
References: <cover.1783590688.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 10:07:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240552

From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>

libcurl's SMB handler marks connections for reuse (connkeep) without
verifying that subsequent requests target the same share. This allows
a second SMB request to the same host to reuse a connection
authenticated for a different share, potentially accessing data
without proper authorization.

The upstream fix removes connection reuse for SMB entirely in
lib/protocol.c, a file introduced in curl 8.20.0. For 8.7.1, the
equivalent fix is changing connkeep() to connclose() in lib/smb.c,
which prevents the connection from being returned to the pool.

Tested with SMBv1 server (Docker dperson/samba):
  Without patch: "Re-using existing connection" for different shares
  With patch: New connection per request, no reuse

Binary verified: Curl_conncontrol arg changes from 0 (KEEP) to 1 (CLOSE)

Reference: https://curl.se/docs/CVE-2026-5773.html

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-5773.patch             | 40 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-5773.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-5773.patch b/meta/recipes-support/curl/curl/CVE-2026-5773.patch
new file mode 100644
index 00000000000..42ec2b5a5ff
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-5773.patch
@@ -0,0 +1,40 @@
+From 74a169575d6412dc0ff532acdf94de35a6c2a571 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Sun, 5 Apr 2026 18:23:35 +0200
+Subject: [PATCH] protocol: disable connection reuse for SMB(S)
+
+Connections should only be reused when using the same "share" (and
+perhaps some additional conditions), but instead of fixing this flaw,
+this change completely disables connection reuse for SMB. This protocol
+is about to get dropped soon anyway.
+
+Reported-by: Osama Hamad
+Closes #21238
+
+CVE: CVE-2026-5773
+Upstream-Status: Backport [https://github.com/curl/curl/commit/74a169575d6412dc0ff532acdf94de35a6c2a571]
+
+Note: The upstream fix targets lib/protocol.c which was introduced in
+curl 8.20.0. In 8.7.1 the equivalent is changing connkeep() to
+connclose() in lib/smb.c, which prevents the connection from being
+returned to the pool. The effect is identical.
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ lib/smb.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/lib/smb.c b/lib/smb.c
+index 7c73cbcec..a1f5c9b31 100644
+--- a/lib/smb.c
++++ b/lib/smb.c
+@@ -461,8 +461,7 @@ static CURLcode smb_connect(struct Curl_easy *data, bool *done)
+   if(!smbc->send_buf)
+     return CURLE_OUT_OF_MEMORY;
+ 
+-  /* Multiple requests are allowed with this connection */
+-  connkeep(conn, "SMB default");
++  connclose(conn, "SMB default");
+ 
+   /* Parse the username, domain, and password */
+   slash = strchr(conn->user, '/');
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 14d63d63733..d0267317517 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -36,6 +36,7 @@ SRC_URI = " \
     file://CVE-2026-1965-2.patch \
     file://CVE-2026-3783.patch \
     file://CVE-2026-3784.patch \
+    file://CVE-2026-5773.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

