Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CAA1C6FA86
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 02:28:58 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web08.732.1662604132200304420
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 19:28:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=t29i4f1E;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id g4so1352215pgc.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 19:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=PqznmWnUPA6OhTFShFFhoSp4156+yqyXgD7NQxIL1ys=;
        b=t29i4f1EPCkJJTg7p1BwlUgQW5mCvZB+tTgu89eP8w9cYNub3KchP5MuKMG5f//r0T
         LkMtoupfiwlrUd3ZPm8hEOQgu4GJAAimrbjo0rE8bZYCbxzSaGuB6uzXby7+AT3EBcou
         2EBnUpAsMYiXOZLzVSxI5/n9445CpZe7+ZqZOWvsdFdpeM+VQmY452DmrV673qcAVoUp
         J0xTUgvttJs5+w70uSfDCxw58aHZ5lK0QRB8jWCZHGVMVuf1M4suNqJ5agFMywDgctkV
         ALlbjTGxmRyphQuPltNuWJ7RRHtH6R3BD/has8wVpeIa9wlp7KYK9uoONTx+UvrHUQq1
         TUJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=PqznmWnUPA6OhTFShFFhoSp4156+yqyXgD7NQxIL1ys=;
        b=L2QktLvxr/ByauQaOPiXrn3TTVVX1PAsWpJMHUCnHCBAaWY4ol7g8vmdHt1ZwcpuLM
         YdxHa88lS0SLP97Vaj3ph2eqJme5uQQrm0Ym27kqkW8BEN0wLoqk6TKBGBNwME5r5wSQ
         kHAwsAC9MOtzVJvEqfU9/Vi3wLHY32OXUPYVHrwkinGnvyRh+PFoe4r6FOQJbiriB35C
         +AXZqSHNQkJa6Xbg897l0pfchshl+nWDOUs7oFcampHxyvaY4rAkcoQhneaepvX6Zd6k
         e0XrcJuXu5zi533HjVW21qHALQcYMpQmzD/TKZTHnKLj/i1VVU+ZpQRnN54FlPWNNlQt
         zt6Q==
X-Gm-Message-State: ACgBeo08dCIM+TxKy4+bHJQtx9t4Dp4kZrpwcQ2NpnWLZc6Izj669sFe
	3SMGklA/N4CtHTFapMaz1vv6sLfiA6AAnTdD
X-Google-Smtp-Source: 
 AA6agR54gFBysa2m4wpmz+Gfq+wUpw1JR1smEMkJzq9jZAvUoqpSjLNyIrY4BwkBjvA93vQb0g7J5w==
X-Received: by 2002:a63:455:0:b0:434:e57c:d99d with SMTP id
 82-20020a630455000000b00434e57cd99dmr5511385pge.433.1662604131125;
        Wed, 07 Sep 2022 19:28:51 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 b11-20020a170902d50b00b0016c0c82e85csm1901398plg.75.2022.09.07.19.28.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 19:28:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/7] curl: Backport patch for CVE-2022-35252
Date: Wed,  7 Sep 2022 16:28:27 -1000
Message-Id: 
 <59344420eb62060c79265a2557d2364c8174e46c.1662603861.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662603861.git.steve@sakoman.com>
References: <cover.1662603861.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 02:28:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170441

From: Robert Joslyn <robert.joslyn@redrectangle.org>

https://curl.se/docs/CVE-2022-35252.html

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


