Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D11D78763
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 14:14:33 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web10.11650.1732198466440763693
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Nov 2024 06:14:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Posr7ePv;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e3890093c13so962102276.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 06:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732198465; x=1732803265; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYT2jjiTPpbppF7MDQ9A9VKhzq9EkcCszCq2XzzgUMY=;
        b=Posr7ePvWSVHRe23Yl5KriJHIPvhHwqD5vEMspEBfe4yypzt8XqE95p6NiArxWcb8D
         3yxNCuY3nCuxOag1l78FVOf/lBTsdqtZSvWlBm7qHBfknWMKfahdhMcwMyJHCdT3jV1+
         Lk/GMiYlIdqilgLjIutsHaPuK6eDpP4nbuvyxJZS8Pn1lmeI/XsBLmTYf2JNdXbyHvX9
         q1DoGJcrkt/TXhH9w9+Cyilpi1sgck0rgF5XQ/uH2M/c66BadvpyTbXf0qap/Iu9t82E
         zdetZx/iIE53EYHHZTzBsvR4Q9Qo+bSpNiajG1vWQXOJOt/YMgs3VYN7vR2BejrqqH0m
         KfOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732198465; x=1732803265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SYT2jjiTPpbppF7MDQ9A9VKhzq9EkcCszCq2XzzgUMY=;
        b=Ivghpaal7ysiFnW0oJFls/fSv3caZeUzagekr/1i+V7nK0Xxgt9ccwqbJjZUOag16Q
         2NEGvNzYp08Ua2FE/DsWIn5q62s+aJflTuxMnez+jZxfAH69YlK/PDe9rCvnSqyObCCc
         8Apmj+Cx5KqF0YxPoJr7rXqns218hf6Hu1p1IyoXDUdb6N8OPWGl+he+3SbqUvDWhXd3
         YqSNDHBL8LapmCv2f3/Dq452cGNt3QtvC516OK/ai5T5PutxU5WW7nNRGBIknDiWdima
         h16sce58OttKn35iebzGClMegVE4Cxb/VCKLJZvRHFxg5SsAFqcnUqPG572V96XpUj7L
         Jgpw==
X-Gm-Message-State: AOJu0Ywgl7Oynwdc+D94CRVWzlwcJEi/LY26hc0lLTbAKdgxGP193Yz4
	0z/trlO1Di8qR2I+7YKvcfzqT1NQIzIzk9JUbLJ+WaciFLUuNOVZ
X-Gm-Gg: ASbGncsb1FOazkFVSQZ5f92sfLynKD9uCXa+6W97Qabh+62gIREHFDNeHTAxvhiUv85
	SNYBdQiPYbuJp2tamFz3lhCouw2QLf+u4PSJLhKRjnfUEyMN/T2Eg+G+gd3UcWFe2f6gSedmg0a
	SdP2C0MhmQGQht/UTYlzuiRhriHbh4nVPRArH1WZDi7Qosv/JZOXon0+YaUPVnV854rjtmy4CkM
	9OuIUCHiRDIFx2aw/WqYj0DuOoy1PyDKNCX9T6ph14LKbuvzT9EaZyz
X-Google-Smtp-Source: AGHT+IEiA8WfwisQuacaSMrRLghIk9wDYKwaH6WdWlm6CXtYxQB2GGYYlYGBT97FNrNpAGEHZ1vYDg==
X-Received: by 2002:a05:6902:218f:b0:e38:c03f:7883 with SMTP id 3f1490d57ef6-e38cb5585camr7116601276.1.1732198464973;
        Thu, 21 Nov 2024 06:14:24 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e387e72252fsm3716088276.1.2024.11.21.06.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 06:14:24 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: patchtest@automation.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org,
	Jason Schonberg <schonm@gmail.com>
Subject: [PATCH] webkitgtk: Update
Date: Thu, 21 Nov 2024 09:14:11 -0500
Message-ID: <20241121141411.4476-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <010101934edde36d-f9e0fb82-e00b-4a0a-a148-278f0f5b895b-000000@us-west-2.amazonses.com>
References: <010101934edde36d-f9e0fb82-e00b-4a0a-a148-278f0f5b895b-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Nov 2024 14:14:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207537

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


