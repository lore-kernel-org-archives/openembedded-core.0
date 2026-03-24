Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2062EFC72D2
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 23:08:46 +0000 (UTC)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10518.1774393722394200181
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 16:08:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YubpW4DI;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c1092cc08cso1934697eec.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 16:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774393721; x=1774998521; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=izB1jiyP6THzJEJrOixehqaFOzLIxCGqPSQK1cKlHMA=;
        b=YubpW4DI6LIr9XiI8uHhvjT75FpOWeL7gErEmi9EsoDHFQ8XuaVtSpJQQF7X0VZOv0
         WUUUn2yU+nD8E74JceNpr75RKjZv0bCgc3uGXZUX6ks4uuw1pyxQtpZv2whx4XeKksI+
         wEepSN0kgELtej/VSgNfUGJCf6kmOwNvRbEACqtw/gvQTUbQqwrJJ05kyHi5T4y8+lS5
         5jPAivJhSdBpvG7v4GFqEzI5F6yKHmD7pphKMIq15q5j9MPLcc1NMlweL0OJ7CaRAdjb
         zLmzyHExYoj897mLmgw9mNw7F0yaNGVW0QTPJce1BIwFUxLgICcAWVQonnhgJ37Mn8QZ
         kEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774393721; x=1774998521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=izB1jiyP6THzJEJrOixehqaFOzLIxCGqPSQK1cKlHMA=;
        b=EkuhLQ0+xiZUkHUWzMi7aWAeFyRpPsLd0SbeMC/B5GYbvWDH/XOfBLpRVBvHvB3R8+
         TITdm75VJcw63jB2pGSAqdwYIXPI93RFq6Rix59wKtygymZPtDnojct6FJ/Y02RHUF8n
         1dfXbbJ8+dOwzLLQylKQKgR1bpcxlam+fkyHkHAXw9V9WC1lkGA9IEj4UBbhyTIiTBkb
         +OVTyh8GpwaOfr8AOQbJ2ofybpN1F45EmRgLWWa7hio2rrYYGguspfJOCsqMI7Yi7ndk
         TKKhlrYB6tVIm4ngZSyDThXyUVxjJAx6xYgYhzHMJyNfuDtk3/1rWMoXKqAmpt1Laz1r
         zFZg==
X-Gm-Message-State: AOJu0Ywkbu8qcHxwbraqWr4BzLupoQ+NjvYAuCMSMqm1+HkmZEz74mbc
	3dzXgNM/Prrin4jQjCOofy1yTvkRmOhqX8/dydTj+j/LTc6WVm5a1CXIAovstABK+mQ=
X-Gm-Gg: ATEYQzwIFcGusYO8wqf3hDteZreGfAPMUgJ0wBo9wJ/QlbIUgevyspXT3J8v0dE8eHi
	l1YrKMGnBHgSQ5LelYIxxXJy2dDsoaPyiIrgACVtjeH3axR7/LZ+TBylqf39tgROd5qSX8jD+eY
	1BU+TFb5TRsFXhrARAE8i7zaa+jaG9OvYpbMlz/WBULZH0kHtLashjJ/wnhkujwqVEA3qLFhWup
	QMwI9vx+o1ou0YrxGMvfo+MR1Z6Z0tOsNKaME3azhaatS72yqwx01q8+AqL+l+6wV1bN7axn/5K
	Z0rqMV7vv2CVyza65eI/HI/R8Kc+Wcjf+RvNqOPrmoJBP7AV0bzywAtbQcMAq2PBm7lYBXU9U5u
	vpA7LQkYhHLskDjyr7FljwWGBJx3PblOJSxHZcfmX7iIs/dsh7wBA6U2zr9/BoVNvw8iS7/pa+W
	3CR7zIB6DWPHLMdYTGQmO5ToXzgVMgXYpw3VQgPAmtaZ3xVbMEaRnF9Z/FMCKj0os6zRSZ1RP2Y
	cCTaSD2X4l5bKg+4wOHROQ8Hm+VsEQFTq/DuQZRitx/T1qugc7Bljc5BJOQ
X-Received: by 2002:a05:7300:cd8e:b0:2c1:571f:b821 with SMTP id 5a478bee46e88-2c15d49f242mr655495eec.28.1774393721570;
        Tue, 24 Mar 2026 16:08:41 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b17d1ddsm16235874eec.11.2026.03.24.16.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 16:08:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 4/5] libclc: Adjust path to prepare_builtins utility
Date: Tue, 24 Mar 2026 16:08:34 -0700
Message-ID: <20260324230835.2363568-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324230835.2363568-1-khem.raj@oss.qualcomm.com>
References: <20260324230835.2363568-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 23:08:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233832

From: Khem Raj <raj.khem@gmail.com>

In llvm-22 onwards the utility is built inside its own directory
instead of parent directory as was the case prior to llvm-22

Adjust the path to point to new location

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/clang/libclc_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/clang/libclc_git.bb b/meta/recipes-devtools/clang/libclc_git.bb
index c4b4881542..db846d59a8 100644
--- a/meta/recipes-devtools/clang/libclc_git.bb
+++ b/meta/recipes-devtools/clang/libclc_git.bb
@@ -22,8 +22,8 @@ B_NATIVE = "${B}-native"
 LIBCLC_TARGETS ?= "all"
 
 EXTRA_OECMAKE += "-DLIBCLC_TARGETS_TO_BUILD='${LIBCLC_TARGETS}'"
-EXTRA_OECMAKE:append:class-target = " -DPREPARE_BUILTINS=${B_NATIVE}/prepare_builtins"
-EXTRA_OECMAKE:append:class-nativesdk = " -DPREPARE_BUILTINS=${B_NATIVE}/prepare_builtins"
+EXTRA_OECMAKE:append:class-target = " -DPREPARE_BUILTINS=${B_NATIVE}/utils/prepare_builtins"
+EXTRA_OECMAKE:append:class-nativesdk = " -DPREPARE_BUILTINS=${B_NATIVE}/utils/prepare_builtins"
 
 # Need to build a native prepare_builtins binary in target builds. The easiest
 # way to do this is with a second native cmake build tree.

