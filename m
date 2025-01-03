Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9144AC3DA4A
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 10:45:35 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.28158.1735901133268159240
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jan 2025 02:45:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DG+cfcJ3;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43675b1155bso109701315e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 02:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735901131; x=1736505931; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vpVg6HRwJ8o0CyY81c5pFmcx7B9dIrdslTlct4kS8QM=;
        b=DG+cfcJ3wcxsysmMEslzqfpPba6RcWLMhfn7v9DIzgeRcoIf+BvY9So3gVViwlNm/O
         yh/Ocs+ZKorAtq4JfezjOZoHfxo4FAOsIlU1VVnnhtDJf7mOgo+89AU/Zlo1IXwT/zyW
         /QH46QuRATLB99mSlMFPGX7+4cbIS+I2VlRAMNXrl7oyewiX1chqZm+EN/9Ueq5Ky0fu
         KVMn8Lu4AzNgcenpgbw7m2VUiR9k4kBo0t5kDBiSpJ/n9VAEXPFKzHs0Jql03zfjt8iV
         7T1Rv5tTHk50RMG3X7ugKeREuWISyiWwAIiCJThlG1EzBApepZJFdYGVLCQoVtKK4JbL
         Eexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735901131; x=1736505931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vpVg6HRwJ8o0CyY81c5pFmcx7B9dIrdslTlct4kS8QM=;
        b=RWlSP9HgNfWY2SldulctQ9tYUuEmLGmZslSdzd2X0UTPzvjbThyRgdu5O/P8IQ0mSE
         ZrXHEPumbJE4PvS8uk0byjWd230ihGUsF53AG3QtPlRPyW+lPYWaFLwj8RyLwN+FLFM2
         e53mdrfleiFhUzQvcqpIUnONXnWWrb03uGmi2oiHBKKMVUpMHN5GAnzVM1jo/vM4ZopQ
         1x280I2aHjvVjmOnuLq8AMPHhdOi+LrOZHOva87sDfaU7KoWj5MQfVg7flu66M6jRiwb
         15akyIUErELEJlwfDQxqMA4sW4Q3cQtDxdJqc+4Fo7Phozm3zaYFcDG/ijUBS6MlvFNP
         6gVw==
X-Gm-Message-State: AOJu0YyQuZ+9WKYoG3UboxXn19piS6h/sMZmXuUa1/lyS9SRlUTKKfNi
	cTVpz2AJRzuscvC6j98Q2T9ULrB55O0YmFgLwcV/yO5I2pSYV6juua8Ehw==
X-Gm-Gg: ASbGnctNdj3HjUV98C6/SkBnu1O4Bl0cXWa4DOPyBdM6Frot7OpFLkkElEvuLAMXyUX
	Gnu8iJOkP/zw/j2UUuP+YlNryLdA5aRJns1PVo6wKfsMUirqJ1GCUydg+vSaBmcKj6HBOja+3a3
	fqajkrL0ROQtgLyuIEYd/nbIi0iqYOKFszUd5oZkyz4lFZfd4dxfdy5sOqhylX5ul/qYMz40B8V
	HPtTdtE3HK42Z/7/kZraQCX6FYwotsPBUKYC+a9spM5FDk2t4bwYPBIqUBmh5+6LTMn7BsnPJya
	ZBe3Tw77sL9mymPkcQ==
X-Google-Smtp-Source: AGHT+IEawJcn6SX0Yp17QyN/VtWkQ0uAI8s3PyYvH3jW77aV8SOAiXSiQHY2UniA7/aPy2zvuISHag==
X-Received: by 2002:a05:600c:35ca:b0:434:e9ee:c3d with SMTP id 5b1f17b1804b1-43668b7860fmr365051025e9.20.1735901131248;
        Fri, 03 Jan 2025 02:45:31 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43661289995sm476935865e9.36.2025.01.03.02.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 02:45:30 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/11] libxshmfence: update 1.3.2 -> 1.3.3
Date: Fri,  3 Jan 2025 11:45:16 +0100
Message-Id: <20250103104524.4053846-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250103104524.4053846-1-alex.kanavin@gmail.com>
References: <20250103104524.4053846-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 10:45:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209334

From: Alexander Kanavin <alex@linutronix.de>

Drop patch as issue solved upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...h-Define-SYS_futex-if-it-does-not-ex.patch | 39 -------------------
 ...hmfence_1.3.2.bb => libxshmfence_1.3.3.bb} |  4 +-
 2 files changed, 1 insertion(+), 42 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxshmfence/0001-xshmfence_futex.h-Define-SYS_futex-if-it-does-not-ex.patch
 rename meta/recipes-graphics/xorg-lib/{libxshmfence_1.3.2.bb => libxshmfence_1.3.3.bb} (73%)

diff --git a/meta/recipes-graphics/xorg-lib/libxshmfence/0001-xshmfence_futex.h-Define-SYS_futex-if-it-does-not-ex.patch b/meta/recipes-graphics/xorg-lib/libxshmfence/0001-xshmfence_futex.h-Define-SYS_futex-if-it-does-not-ex.patch
deleted file mode 100644
index 3e87794d20d..00000000000
--- a/meta/recipes-graphics/xorg-lib/libxshmfence/0001-xshmfence_futex.h-Define-SYS_futex-if-it-does-not-ex.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 5827f6389a227157958d14a687fb29223cb3a03a Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Wed, 7 Apr 2021 07:48:42 +0000
-Subject: [PATCH] xshmfence_futex.h: Define SYS_futex if it does not exist
-
-_NR_futex is not defines by newer architectures e.g. riscv32 as
-they only have 64bit variant of time_t. Glibc defines SYS_futex
-interface based on __NR_futex, since this is used in applications,
-such applications start to fail to build for these newer architectures.
-This patch defines a fallback to alias __NR_futex to __NR_futex_time64
-to make SYS_futex keep working.
-
-Reference: https://git.openembedded.org/openembedded-core/commit/?id=7a218adf9990f5e18d0b6a33eb34091969f979c7
-
-Upstream-Status: Pending
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- src/xshmfence_futex.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/xshmfence_futex.h b/src/xshmfence_futex.h
-index 673ac0e..a71efa5 100644
---- a/src/xshmfence_futex.h
-+++ b/src/xshmfence_futex.h
-@@ -53,6 +53,10 @@ static inline int futex_wait(int32_t *addr, int32_t value) {
- #include <sys/time.h>
- #include <sys/syscall.h>
- 
-+#if !defined(SYS_futex) && defined(SYS_futex_time64)
-+#define SYS_futex SYS_futex_time64
-+#endif
-+
- static inline long sys_futex(void *addr1, int op, int val1, struct timespec *timeout, void *addr2, int val3)
- {
- 	return syscall(SYS_futex, addr1, op, val1, timeout, addr2, val3);
--- 
-2.29.2
-
diff --git a/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb
similarity index 73%
rename from meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb
rename to meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb
index 0a7da938e1f..5b5ecd5778a 100644
--- a/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb
+++ b/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb
@@ -13,8 +13,6 @@ DEPENDS += "virtual/libx11"
 
 EXTRA_OECONF += "--with-shared-memory-dir=/dev/shm"
 
-SRC_URI += "file://0001-xshmfence_futex.h-Define-SYS_futex-if-it-does-not-ex.patch"
-
-SRC_URI[sha256sum] = "870df257bc40b126d91b5a8f1da6ca8a524555268c50b59c0acd1a27f361606f"
+SRC_URI[sha256sum] = "d4a4df096aba96fea02c029ee3a44e11a47eb7f7213c1a729be83e85ec3fde10"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


