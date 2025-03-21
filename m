Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F8EC36002
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 18:04:07 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.163.1742580239542093425
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Mar 2025 11:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QOsh1mnr;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-301c4850194so3454396a91.2
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 11:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742580238; x=1743185038; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zrZK10kSYRQN3A0L10OpeC/60NONUFJj7N0ErL93BKY=;
        b=QOsh1mnr5rMaHF4e01+2Jo49us452ZrKOcDRi0gARNm7roWmPq/ZHEBxmQBlnaxPHH
         Cl5eMeu05qBKAl2Am1QsEN0cbPLcVT3Xe9l7aNoipAlFAOoPgMFXhfgFOU+IZ8Yx5jDi
         dM01NtdDfln07J2yhKmOzybAZ04Bs9SigMhEzvUEVK8qSYTYoz4bbJMjeIiFanrcTy3b
         FGOCqk85skOogN2QWkVv5TsC7lkGIrKAOBuwtRA+pRF8AeeeS+2Iqq8QCtGgM4mFVs4E
         u75kzqaBNoCGHsh4wTKW+QAxS5MkT+RtEPY9jdzly+TbKB1SSdAWkzAGPcKGKAzGcBtx
         Ay5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742580239; x=1743185039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zrZK10kSYRQN3A0L10OpeC/60NONUFJj7N0ErL93BKY=;
        b=Ff/yb9qlUKMaoLRh5xiPnsN6eZicQZGRJKcNx6/jf71UUyP4s/5W286nD8dfpC9f4S
         6/trjrHiBngEjz20Ppi46mHtn/afXrdCRVSoRhOw1BwJvrV8asHSTFDUOCkiH6zbMiiy
         geh1pDBzhW2bQ83c7vcWKxvUf+xR+VJcu+MS6dSB0EMo7ZQjw1m8VvC616z3Rfu6BVQw
         B8hb6ZBhK5aQK8LrgPxDWYIo3UEu3c03aUuJSe+kjinOt2PdXR5757PJSCMTZGm3AnQb
         jjEQRBQKRls12nD/OhFdLfi/cX3nJZW8dvW0rXPKGTQU99plRfvnBwA+5z80PLXS0/Eb
         8E6A==
X-Gm-Message-State: AOJu0YwX/M/VuK+MWaf1aybG5uvu9NvrdXJJEq5OsML5XqDEhCF2Zxj2
	eZ02ZIIU9ZXsJikPfnaVIM7JJt5ar7Z0WLqlGWFlT2HqV/8XN/8FsJzeq76F
X-Gm-Gg: ASbGncscfzIKNU9enuVkWAQyX8c9s16VFEP3XbGng2pcMZuAKVtJQfDMCMfD68u46/i
	L8hxVsXJJgZ4KctDbwj9jUplMMwGqoBtg8OOsYu7oo2soOuNfUB+R+1EHwsrSV9dwAx+K0cFJ4W
	8jZxIAXcrapzR2pmGygBntKkXGWWMn7nPt5bpXMKm1vMEPtlBQNoL1vce63H7cWBgt8DEGUEuTG
	do50JQQP1ZX1t0dshBgXwNs5p9TyP1YZsICQ4Oy6Sj/WbUmVKF7dUVbcJ2DlF6KmNF3zbI/nWcC
	hVo8nbPbMOfb9MtAnSx5wwoVpp5TqxhCqZRf
X-Google-Smtp-Source: AGHT+IHm8UPEZvsXo/d84RtOiJUirNWCVcGXPEjeyrMTksYGWKKPJkaE1N2d5NzD/V98Yd4kHCLubw==
X-Received: by 2002:a17:90b:2782:b0:301:98fc:9b51 with SMTP id 98e67ed59e1d1-3030fe8d636mr5383323a91.5.1742580238432;
        Fri, 21 Mar 2025 11:03:58 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3030f80707fsm2342905a91.48.2025.03.21.11.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 11:03:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] webkitgtk: Fix build on RISCV
Date: Fri, 21 Mar 2025 11:03:55 -0700
Message-ID: <20250321180355.1072128-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250321180355.1072128-1-raj.khem@gmail.com>
References: <20250321180355.1072128-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Mar 2025 18:04:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213486

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-on-RISCV-https-bugs.webkit.org-show.patch | 30 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.48.0.bb  |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch
new file mode 100644
index 00000000000..40a71330522
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch
@@ -0,0 +1,30 @@
+From 984538dcce7b184269efc1e1b0fb78e1cb932b5d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 21 Mar 2025 01:21:22 -0700
+Subject: [PATCH] Fix build errors on RISCV
+ https://bugs.webkit.org/show_bug.cgi?id=290163
+
+Reviewed by NOBODY (OOPS!).
+
+Include c++ header <system_error> for std::error_code.
+
+* Source/WebCore/contentextensions/ContentExtensionActions.h: Include system_error
+
+Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/42802]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Source/WebCore/contentextensions/ContentExtensionActions.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Source/WebCore/contentextensions/ContentExtensionActions.h b/Source/WebCore/contentextensions/ContentExtensionActions.h
+index 0b75d2e1df78..61cb33c94ce8 100644
+--- a/Source/WebCore/contentextensions/ContentExtensionActions.h
++++ b/Source/WebCore/contentextensions/ContentExtensionActions.h
+@@ -28,6 +28,7 @@
+ #if ENABLE(CONTENT_EXTENSIONS)
+ 
+ #include "ContentExtensionStringSerialization.h"
++#include <system_error>
+ #include <wtf/JSONValues.h>
+ #include <wtf/Hasher.h>
+ 
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb b/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
index bfd33835d1f..6eb80da1dea 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://sys_futex.patch \
            file://0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch \
            file://0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch \
+           file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \
            "
 SRC_URI[sha256sum] = "94904a55cf12d44a4e36ceadafff02d46da73d76be9b4769f34cbfdf0eebf88e"
 

