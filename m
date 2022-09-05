Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD287ECAAD5
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 19:07:04 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.28658.1662404821556908541
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 12:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@redrectangle.org header.s=gm1 header.b=VsgU6/KV;
 spf=none, err=permanent DNS error (domain: redrectangle.org,
 ip: 217.70.183.196, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id 4E265E0004;
	Mon,  5 Sep 2022 19:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redrectangle.org;
	s=gm1; t=1662404819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y2OHaqfRIg4IFsMTYqkSbOLKlRtkVVIU4xhF/VZa+zM=;
	b=VsgU6/KVzBgBRN9sJLYMU4DuVdEdjOD9A37vifxXbu3xp9z6UcEzagQOof8vrnr/ynJkd+
	ZYlw1SoqhDojFkptbB8DwMeWC7NhKssd6PThBH64bB3YPBtL6sLKJj6CFPdqD/F5fMG2Rs
	cVhbSM6HJWJ800YRnc1H5NfG5/6AhpCOlXLJvDVXTcpZ2zZeFen5FdVCSG73tvsVi6D2/d
	rPj5jtT05wqCUpR2dT6dI0suEI66ciQ2+0ZMkb5rzqkBw5/3naO41NaX3uNvmmgc/rZ2i1
	nfX7k+fB7Q4ZcIm0nSt6ZqwudIYk2QnKVhfKjFkHrIHzM6MuFe+NxfmLYmPuHQ==
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [kirkstone][PATCH] curl: Backport patch for CVE-2022-35252
Date: Mon,  5 Sep 2022 12:06:08 -0700
Message-Id: <20220905190608.3007795-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Sep 2022 19:07:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170326

https://curl.se/docs/CVE-2022-35252.html

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 .../curl/curl/CVE-2022-35252.patch            | 72 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 2 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-35252.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2022-35252.patch b/meta/recipes-support/curl/curl/CVE-2022-35252.patch
new file mode 100644
index 0000000000..7b6f81bd02
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2022-35252.patch
@@ -0,0 +1,72 @@
+From 62c09239ac4e08239c8e363b06901fc80637d8c7 Mon Sep 17 00:00:00 2001
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
+index cb0c03b..e0470a1 100644
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -438,6 +438,30 @@ static bool bad_domain(const char *domain)
+   return TRUE;
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
+ /*
+  * Curl_cookie_add
+  *
+@@ -590,6 +614,11 @@ Curl_cookie_add(struct Curl_easy *data,
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
+           /*
+-- 
+2.35.1
+
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 67de0220c6..5368c91f5c 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -28,6 +28,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2022-32206.patch \
            file://CVE-2022-32207.patch \
            file://CVE-2022-32208.patch \
+           file://CVE-2022-35252.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.35.1


