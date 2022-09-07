Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 277DFC6FA86
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 14:20:45 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.8250.1662560442478025749
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:20:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=UQUF8ccm;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id t3so9636717ply.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 07:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=NA9h+i08h4oxJpfZP6mPV38dI1GRyGWASVRl0GbnCi0=;
        b=UQUF8ccmqc/qsFFA0E/Rn5MlQtyYKNGYMeUilkm32lyReKXtfGOTvriD2rgi4li3Ca
         o3UIBkX1FsUiR/S5dY4YjmXx5FFvG0QWoXljgqqhzgYI/N9GCRnsZ+NJiihqnDTdrmGI
         Ddzmr+H6jQN4v4uWTdPcC93pZ6Ai7F2a2OVduFj/Qg5sNrOD+4LCpjykHSWX0pbtou+B
         gaSquM/tX0UoxWnNBedAYliFtzPikyDqCxqwSSa6/Qu/KrRRzbWesaxsm6aIz2rdwzFX
         xs49MswkJaMgB2+FCnemVeoQqLqYCeBnbGsnle7XUHHBW1ZHlCsbCn7DR5GYe2SwGf9D
         INYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=NA9h+i08h4oxJpfZP6mPV38dI1GRyGWASVRl0GbnCi0=;
        b=QwnaAT4F+gv8BtjcYU1DchIufgcroW1UdMNgnkOwtUoXcZCOyi8nh2YpqMEHlpePZB
         Xyssl5oJBn++BO6AWL5fHrNLQRHaar3UUP8EPOa6QgUQwBXQpfdSaPmfrwfXUvhxSX72
         6h0khrF+ZaLf6O1MnzpyGpl/fKrqPziPmKDO/ZvyG6dPs/z0Eh9LCOGYbQAWofTtowws
         q8PGs96OeNbzREqis6myJgFTFFQrwtN7nwOylFoz1y++CLdb6aP/V3YYGW+6a+KqYP+O
         0VICQp3kElwqcDH3F8GrzOSOK04/Yryosxg0qjzz94pQ3UIAKvyZkfjnuzPfTug8boMJ
         fobQ==
X-Gm-Message-State: ACgBeo31P2aCA6SycUcus22ksE3a5yWQdVouUCJJIk94Q/USASoaCMyh
	mMAhp6BvgA6lDoQfZbKdqyRKkWy8gkJHMAyd
X-Google-Smtp-Source: 
 AA6agR6QyIyfXe2h+KRKwx3IA9pTX5Qab+wuSRV5tkLJn1hoc+EKkFQ9oY9CwAi5ukAZyqKUiFoWUg==
X-Received: by 2002:a17:903:514:b0:172:dab0:b228 with SMTP id
 jn20-20020a170903051400b00172dab0b228mr4124997plb.170.1662560441371;
        Wed, 07 Sep 2022 07:20:41 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x13-20020a17090a1f8d00b001f510175984sm14776198pja.41.2022.09.07.07.20.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 07:20:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/24] curl: Backport patch for CVE-2022-35252
Date: Wed,  7 Sep 2022 04:20:03 -1000
Message-Id: 
 <40bbdb43b247ffc5dd1990f51fb824a089c0987f.1662559557.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662559557.git.steve@sakoman.com>
References: <cover.1662559557.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 14:20:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170397

From: Robert Joslyn <robert.joslyn@redrectangle.org>

https://curl.se/docs/CVE-2022-35252.html

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


