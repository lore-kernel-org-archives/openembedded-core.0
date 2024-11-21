Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F31D6ED26
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 12:58:03 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.10005.1732193881136534885
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 04:58:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mAhUG3o1;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6eed41d2b12so4096707b3.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 04:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732193880; x=1732798680; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=daJJpSiYeKVzOCHS+nEn4YkQYubgLt9pgNKhncoLuUo=;
        b=mAhUG3o1xUDHm4lfLE43/hZM/CANM2tbjeuDh5ZvhwdMwKkkL41j0DdiHc8+dFmTID
         iobrKeIMv8EgxJUQsJ2klXEiw/qdVpjzDi59e00wqrdPa+x+BjG0RS9WEtXaOdXcci1W
         I21zEdfObh6nWupVgXasUdY9VzmppDxuJs/84ED5OSTYDrduzwxryC9N+QIf43LlGdCT
         Wavn9Y71kMUCuklBDECohw2AXzWUcjUanhBlbvUtg8M5FZi0Ocwsmmc0IywmYou5hzqs
         jsx/4K1S9SytBWxvpzzlP1hgGjQyqGsWPAdnG2CUlRHsCJmap6RxKaSD7ITPCKyB8ZGK
         1GXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732193880; x=1732798680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=daJJpSiYeKVzOCHS+nEn4YkQYubgLt9pgNKhncoLuUo=;
        b=jTfW08w55/BuwtQh5WIt8Dh5zi/TyF/+QNrXD/LQPloVjqhrDbdUBnX/oqu1bFJDiv
         LrsMmX83wcDN/muzsjJLs7/55sHdAco4ucPf8NVpW+Q6wCIIpG2VZ8yUGvNY9W+Gd1hr
         Fl0t9OVLzxn7tQl9BHDRTxZn4XjM2KiycaUNd0wTk8KK/Dhz/jdjB7/BmTXY20Zeq7V9
         pyZpkufMaLy0UK+c0gXWWayniQLsSFshNSvMuSXoMN3UiBK1V5etnrKmzqB7qOlysp7P
         C9ni2tUVJnp2ihEitRiA4L+zHQ/zPr/TM9dOw5/E+B0oWuBINctLptUbttHe9N9hUI8Y
         V0OA==
X-Gm-Message-State: AOJu0YxHX7zPPyGWcIlcdtwHFs4NzAfHKrJivSKVMgwKCrucnOTtu2dF
	9BV0ZrAIgrTEcWuIBNeNyKf73lKz0BWY3Kn0eb99GQPwAPZyjfsb
X-Gm-Gg: ASbGncuDADOaolyboVNNvzXr1uO7g7F5iAFuPdTepanHVRzHkts8YuhHgXgnoKQs5/k
	Sp1soAKsHy7o17Jp87ECNgxbhZTgzaQ/Xk1F8unZcGpwNRDWRt9N9w7uS40yJbLt9fSEcrB7OdW
	ujmHVMb6LztQWNvICcSdyTw/YAK9YbEt3mHxQkrlwpixHeqsP/L0/NS6oLkU77DeZ28ytH1c7cf
	TtzpaWCQIoDuxCATLyfIEniWkYC/7ZLE3dQ1g/rGVd/5igkRqo96KJu
X-Google-Smtp-Source: AGHT+IGtJtYSZS7Q0fBXDKCWG8iFkXImdc+KgIAcPtOjTyY1tG4uOIi1sEdgyaPgreq+xXf2fHsq8g==
X-Received: by 2002:a05:690c:7302:b0:6e5:adf8:b0a8 with SMTP id 00721157ae682-6eecd23cdeamr27192857b3.6.1732193879467;
        Thu, 21 Nov 2024 04:57:59 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ee71351989sm27331777b3.97.2024.11.21.04.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 04:57:59 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: martin.jansa@gmail.com
Cc: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org,
	Jason Schonberg <schonm@gmail.com>
Subject: [PATCH] webkitgtk: Update - add backported patch to support ICU-76.1
Date: Thu, 21 Nov 2024 07:57:37 -0500
Message-ID: <20241121125737.103202-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CA+chaQdFdW6pornv-wjU_+_xz8xvfJTrdJk2T-i2=rh1JavHmA@mail.gmail.com>
References: <CA+chaQdFdW6pornv-wjU_+_xz8xvfJTrdJk2T-i2=rh1JavHmA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 12:58:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207529

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


