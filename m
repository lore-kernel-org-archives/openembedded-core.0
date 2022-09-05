Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A06ECAAD3
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 19:07:54 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web08.28432.1662404871652449911
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 12:07:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@redrectangle.org header.s=gm1 header.b=Q/1QaiUp;
 spf=none, err=permanent DNS error (domain: redrectangle.org,
 ip: 217.70.183.196, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id 7E991E0003;
	Mon,  5 Sep 2022 19:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redrectangle.org;
	s=gm1; t=1662404870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=M88Gye8PCxA1ceEeIz0nKZM9NEl1w5G2JIwEx2HGflQ=;
	b=Q/1QaiUpASuoAHlpRFTou8Le/yYuTx+POcUiUNjN5sbeRjSNb1YSAqFHTu4Yu/6RhGEbG9
	KfkyYRNl5kLUp2ZPZigis4SOPpEhQRiliYGafsJ3C+Yg2VL/4cZKW1Rwn3IWsasVfsysVr
	/jY8QDuQrS/Pkct7zA2qpi28ZQC5RZvs35omwlYtsCOVXIvzjvP3LnsZiOoW3hDKAsvPOT
	tBKdYUKAHl6q95pd/gWanpzkFfuytiBmFYO13tDsSn70kUTHoF0iU0jQWCcsx0wHJoZJ2v
	xWg1/WGylsd5VCwPBcGRjTlUEB0ygKMN2n6aZKSDvvh8ih7D51CHtx9+qLGCiw==
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [dunfell][PATCH] curl: Backport patch for CVE-2022-35252
Date: Mon,  5 Sep 2022 12:07:43 -0700
Message-Id: <20220905190743.3007812-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Sep 2022 19:07:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170327

https://curl.se/docs/CVE-2022-35252.html

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 .../curl/curl/CVE-2022-35252.patch            | 72 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-35252.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2022-35252.patch b/meta/recipes-support/curl/curl/CVE-2022-35252.patch
new file mode 100644
index 0000000000..a5160c01f4
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-35252.patch
@@ -0,0 +1,72 @@
+From c9212bdb21f0cc90a1a60dfdbb716deefe78fd40 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 29 Aug 2022 00:09:17 +0200
+Subject: [PATCH] cookie: reject cookies with "control bytes"
+
+Rejects 0x01 - 0x1f (except 0x09) plus 0x7f
+
+Reported-by: Axel Chong
+
+Bug: https://curl.se/docs/CVE-2022-35252.html
+
+CVE-2022-35252
+
+Closes #9381
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/8dfc93e573ca740544a2d79ebb]
+
+Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
+---
+ lib/cookie.c | 29 +++++++++++++++++++++++++++++
+ 1 file changed, 29 insertions(+)
+
+diff --git a/lib/cookie.c b/lib/cookie.c
+index a9ad20a..66c7715 100644
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -412,6 +412,30 @@ static bool bad_domain(const char *domain)
+   return !strchr(domain, '.') && !strcasecompare(domain, "localhost");
+ }
+ 
++/*
++  RFC 6265 section 4.1.1 says a server should accept this range:
++
++  cookie-octet    = %x21 / %x23-2B / %x2D-3A / %x3C-5B / %x5D-7E
++
++  But Firefox and Chrome as of June 2022 accept space, comma and double-quotes
++  fine. The prime reason for filtering out control bytes is that some HTTP
++  servers return 400 for requests that contain such.
++*/
++static int invalid_octets(const char *p)
++{
++  /* Reject all bytes \x01 - \x1f (*except* \x09, TAB) + \x7f */
++  static const char badoctets[] = {
++    "\x01\x02\x03\x04\x05\x06\x07\x08\x0a"
++    "\x0b\x0c\x0d\x0e\x0f\x10\x11\x12\x13\x14"
++    "\x15\x16\x17\x18\x19\x1a\x1b\x1c\x1d\x1e\x1f\x7f"
++  };
++  size_t vlen, len;
++  /* scan for all the octets that are *not* in cookie-octet */
++  len = strcspn(p, badoctets);
++  vlen = strlen(p);
++  return (len != vlen);
++}
++
+ /****************************************************************************
+  *
+  * Curl_cookie_add()
+@@ -558,6 +582,11 @@ Curl_cookie_add(struct Curl_easy *data,
+             badcookie = TRUE;
+             break;
+           }
++          if(invalid_octets(whatptr) || invalid_octets(name)) {
++            infof(data, "invalid octets in name/value, cookie dropped");
++            badcookie = TRUE;
++            break;
++          }
+         }
+         else if(!len) {
+           /* this was a "<name>=" with no content, and we must allow
+-- 
+2.35.1
+
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index 7b67b68f1d..ed37094049 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -38,6 +38,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2022-32206.patch \
            file://CVE-2022-32207.patch \
            file://CVE-2022-32208.patch \
+           file://CVE-2022-35252.patch \
 "
 
 SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
-- 
2.35.1


