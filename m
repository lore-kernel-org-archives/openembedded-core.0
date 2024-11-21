Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8740DD78766
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 14:17:43 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web10.11733.1732198657962020940
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 06:17:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YJiANx3I;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e38938a55e7so893190276.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 06:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732198657; x=1732803457; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYT2jjiTPpbppF7MDQ9A9VKhzq9EkcCszCq2XzzgUMY=;
        b=YJiANx3I7gj68LfAd7JM36z/M9z/+pz9zcjcR0x/0pRAfNHURe1wZhKKNzA0JKutrK
         bREVvafXGBYDUvtSTEweYYNioD3Nr3q9UYM+2inj8aM8/oIbCbLsAC+9vazJhedhbBFa
         hWXHP0qoG1CaPecFkK1Zuk2wldNR3e7h6RPZwDxoQQV0rFJbSA1xV+c8iCHCdrFA5NHn
         mzepeJSLLGKMnGpO9r6BFVwRlwq8+zAQb8t67vr9wU0AOoaJVIOCjM3Yf8AKXXwHO9yA
         Hk/evevvoDWmb4tnC5PiL/GYkPhagWVRid35uDn8tMq3kwLM04JJcOdewQqmOzUaMY6F
         KFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732198657; x=1732803457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SYT2jjiTPpbppF7MDQ9A9VKhzq9EkcCszCq2XzzgUMY=;
        b=qbmh5i+yC9/uIdYMc6JqEm121XrJf5Dr5gTGKfNErWczA/v3/pvy0AaUri63TppK6a
         LZY4llBvhLYCX2/l9x8y/1U9LiUMXzN4aMnXI8bOYXurWOnyMvUqRFDSU6CHzAmdmtZl
         D3GwXNEgvtLuqvBCwA16NT5e+z87du9roC1h8jJJJnW8KVjT81jRYdsAt77w2wF6dA+M
         eqVgHwbYE20Lh1nS0AX4yucwWiFt97ktQvlm6tkXpIzdazOgmJyJV+o+SGBjVgwtWrsy
         Hl0og2u0f+Sg7i0OC46lKYr+g3fdL37JWNjMfWcTEoMV4t0sHanaxgYPIijyLDo39yJg
         cHvw==
X-Gm-Message-State: AOJu0YwlfvILacQlhfU2fkAmqn+rf84CesSY+yAiRxLIfrHpY6IoxLYx
	NVIFOLNadVi/vJJ+dO6OJLuQDA7jTfp0nsRv0mj8Vf+8g4C4SmylRI35IuK3
X-Gm-Gg: ASbGncumkNhmG5Lo+o1E0Q9nGYe5SbvGrA/rPCBY5crQUBq6tW2ZUdEaRwm2orL75QA
	nc1KxPj2NRS51Bxz4dIIaRaai/5XVRTTWFQD8Fab6pzzY3uv2mf8azjRLLjl4AQ2u3u98g7W5X7
	OLWELv7+2BIAWZ3bORDnxQ0U+ZKAEeJ5f8I82rAPIw2WV78unA8nBrIWvP8nOhYId/8qeiVMn9r
	CY0AA1M0OPAU/gS4z43sKreIWUqmTmB/YZGq+RH6VMx+2avrfqy7p4O
X-Google-Smtp-Source: AGHT+IEuzwx1SF5E797zFzGtXwyXNqEQBw/4+wNtviw/Dbb6lSCopukfVcAw3G5yZqiINh9rgtmh6A==
X-Received: by 2002:a05:6902:100b:b0:e30:cc34:af1a with SMTP id 3f1490d57ef6-e38cb5f6fa8mr6992323276.35.1732198656384;
        Thu, 21 Nov 2024 06:17:36 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e387e8062cbsm3734017276.55.2024.11.21.06.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 06:17:36 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [PATCH] webkitgtk: Update
Date: Thu, 21 Nov 2024 09:17:25 -0500
Message-ID: <20241121141725.4792-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <010101934edde36d-f9e0fb82-e00b-4a0a-a148-278f0f5b895b-000000@us-west-2.amazonses.com>
References: <010101934edde36d-f9e0fb82-e00b-4a0a-a148-278f0f5b895b-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 14:17:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207539

 Add backported patch to support ICU-76.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../0001-Support-ICU-76.1-build.patch         | 36 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.44.3.bb  |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Support-ICU-76.1-build.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Support-ICU-76.1-build.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Support-ICU-76.1-build.patch
new file mode 100644
index 0000000000..31535e7ae2
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Support-ICU-76.1-build.patch
@@ -0,0 +1,36 @@
+From 57b80aa00be614218552fda67b2bf8d535b4f4cf Mon Sep 17 00:00:00 2001
+From: Jason Schonberg <schonm@gmail.com>
+Date: Wed, 20 Nov 2024 11:05:52 -0500
+Subject: [PATCH]  Support ICU 76.1 build
+
+https://bugs.webkit.org/show_bug.cgi?id=282120
+
+Reviewed by Yusuke Suzuki.
+
+In ICU 76.1 an additional macro `U_SHOW_CPLUSPLUS_HEADER_API` was added to
+control visibility of the C++ API within ICU. Set this value to `0` since WebKit
+wants to only use the C API.
+
+* Source/WTF/wtf/Platform.h:
+
+Canonical link: https://commits.webkit.org/285727@main
+
+Upstream-Status: Backport [ from webkitgtk-2.47.1 https://github.com/WebKit/WebKit/commit/63f7badbada070ebaadd318b2801818ecf7e7ea0 ]
+
+Signed-off-by: Jason Schonberg <schonm@gmail.com>
+---
+ Source/WTF/wtf/Platform.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Source/WTF/wtf/Platform.h b/Source/WTF/wtf/Platform.h
+index 23070df2..51a8dce9 100644
+--- a/Source/WTF/wtf/Platform.h
++++ b/Source/WTF/wtf/Platform.h
+@@ -115,6 +115,7 @@
+ /* ICU configuration. Some of these match ICU defaults on some platforms, but we would like them consistently set everywhere we build WebKit. */
+ #define U_HIDE_DEPRECATED_API 1
+ #define U_SHOW_CPLUSPLUS_API 0
++#define U_SHOW_CPLUSPLUS_HEADER_API 0
+ #ifdef __cplusplus
+ #define UCHAR_TYPE char16_t
+ #endif
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb
index 00431407fa..2bb6316d89 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.44.3.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://t6-not-declared.patch \
            file://30e1d5e22213fdaca2a29ec3400c927d710a37a8.patch \
            file://0001-Fix-build-issues-with-latest-Clang.patch \
+           file://0001-Support-ICU-76.1-build.patch \
            "
 SRC_URI[sha256sum] = "dc82d042ecaca981a4852357c06e5235743319cf10a94cd36ad41b97883a0b54"
 
-- 
2.43.0


