Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA24FF8848
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:13 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31993.1777064228935825359
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=P2FazADx;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso77502035e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064227; x=1777669027; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8Dd+FrHpCNy79P3B933WiRSDFENewdEom0cBtxoJ3g=;
        b=P2FazADxGmYTkn/mPH8IEjNftUCVGvYydmpETmT5Cvfdg7xPFE9NOMqbeqDYqDspwV
         PxJkCdePQ9RDbGHvZxJOYQXWf26i/5dobHW5eG757rxi6fIcd/AEh9K6DXU3j8GWOIr2
         TCTs1ABoGIFejqSr8sIVcc0e0yubG2pEbCr3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064227; x=1777669027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a8Dd+FrHpCNy79P3B933WiRSDFENewdEom0cBtxoJ3g=;
        b=cNr5Kt6uS4ZKfTEUYCPt5aosrBCGMMkLK7MBmj+jBuSBcu250RGjcC0HwnYyvG08KR
         fICz3KtJiL4tyLCgB5NDQ86tRArghRlEXFcjwr+l9b4owyT0fXNtmQvCmzA3h3pkAKvv
         hOvDGOOzxG5QivDppCxSxJWmJSDJZG2sEYN6Qcpebu8yDFueoOMnmwYdAIWECR4C2tZO
         R9/y9OrzxQXP1kmdLVKyjD5AN7F1K6TiO1nfAQ3i2nB5WfSX3tAOOUk47H8EQKBRVcVk
         XJg+8BjzJ6lUXHbHFri4VGv1FxQuKYZPCNj4CDiHQRboUxrnUM2O5dFdz9sqFBnZptsM
         6Bog==
X-Gm-Message-State: AOJu0YybgJQulIA9Qz293s8mzxBl71MKm6p0NO54z3817ZkK/lLfqCfY
	ARy/YZ/aLLFkoB95jtopPqr7RGyaKuKbwzLnO670cx92A263r8AqFBbHzu1h5H6SYUysX75wwe7
	iZax1eJCnU8o1
X-Gm-Gg: AeBDiesBjI9hgXtp5Qwujo9sd8cD+ZhPnAoAbtsOMf2eoy/RRbfVd749VKllYHXZ3wL
	uIPG2hM16cx6xKqUerWtKjiWzPgjQmMTeJ33Yxk0vNGHE8zc0W9Z23puEP6p5PGk8zGEBrAfmkN
	EYHZ5pfsyPZcWJu2if1yB0ktUilWqQPRFuw2w8ZdPavudyDBndLLL0QFcEwC+AaQYiuG2ctvait
	QtBYx31s6H7EwcSNv4ZXq7/wvb7x3d3MpbXAU+HeTdV4gsyAhHB+o2lJ3iCXaikbss6eQFXwDY6
	W5eaecTtsjcIINwik5Gvy++KPts40N63woJDVu9NNIKFiC5LYoGd53uCGF9dO6UwUGzEaQM6zpN
	nDl49/yLBc21qlCr7h8S4XXQ7d7x30FwP6vUW79jRtChDPYfGEKrMchMecWi6QPKahSgkxIMYFO
	YsKrHRUSvzcM3sW2PORjKgQV3m7O4bSmcX6Pv45TLUG1tZMeBzTqn7rFvWkBu2VOFjPmbI6/f/+
	jyLOjFUxfJfQNJpZd9ZJoSpzO9/5tKsypPVgA==
X-Received: by 2002:a05:600c:a30b:b0:485:17a7:b9c7 with SMTP id 5b1f17b1804b1-488fb750a2bmr330943205e9.10.1777064227085;
        Fri, 24 Apr 2026 13:57:07 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.57.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:57:06 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 52/66] elfutils: don't add -Werror to avoid discarded-qualifiers
Date: Fri, 24 Apr 2026 22:55:51 +0200
Message-ID: <7d9d9bcb64094da7121c6d6ce89cf07640537182.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235925

From: Martin Jansa <martin.jansa@gmail.com>

With glibc-2.43 on host elfutils-native fails with:
elfutils-0.191/libcpu/riscv_disasm.c:1259:46: error: initialization discards âconstâ qualifier from pointer target type [-Werror=discarded-qualifiers]

elfutils-0.194 in master doesn't have this issue thanks to this patch avoiding -Werror from:
https://git.openembedded.org/openembedded-core/commit/?id=1d6ac3c811798732e6addc798656bbe104661d77

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../elfutils/elfutils_0.191.bb                |  1 +
 ...001-config-eu.am-do-not-force-Werror.patch | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-config-eu.am-do-not-force-Werror.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.191.bb b/meta/recipes-devtools/elfutils/elfutils_0.191.bb
index 0fd6d31af19..5156e5c9f6d 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.191.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.191.bb
@@ -23,6 +23,7 @@ SRC_URI = "https://sourceware.org/elfutils/ftp/${PV}/${BP}.tar.bz2 \
            file://0001-tests-Makefile.am-compile-test_nlist-with-standard-C.patch \
            file://0001-debuginfod-Remove-unused-variable.patch \
            file://0001-srcfiles-fix-unused-variable-BUFFER_SIZE.patch \
+           file://0001-config-eu.am-do-not-force-Werror.patch \
            file://CVE-2025-1352.patch \
            file://CVE-2025-1365.patch \
            file://CVE-2025-1372.patch \
diff --git a/meta/recipes-devtools/elfutils/files/0001-config-eu.am-do-not-force-Werror.patch b/meta/recipes-devtools/elfutils/files/0001-config-eu.am-do-not-force-Werror.patch
new file mode 100644
index 00000000000..d4e141927f1
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/files/0001-config-eu.am-do-not-force-Werror.patch
@@ -0,0 +1,34 @@
+From e169c3fc734be1783b3e1a4768dbec05fb64cb4f Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Fri, 22 Nov 2024 12:50:48 +0100
+Subject: [PATCH] config/eu.am: do not force -Werror
+
+This is undesirable when compiler versions may not be the same
+as what upstream is using for their own testing.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ config/eu.am | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/config/eu.am b/config/eu.am
+index 0b7dab5..5e7a03f 100644
+--- a/config/eu.am
++++ b/config/eu.am
+@@ -99,7 +99,6 @@ AM_CFLAGS = -std=gnu99 -Wall -Wshadow -Wformat=2 \
+ 	    $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
+ 	    $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING) \
+ 	    $(USE_AFTER_FREE3_WARNING) \
+-	    $(if $($(*F)_no_Werror),,-Werror) \
+ 	    $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
+ 	    $(if $($(*F)_no_Wstack_usage),,$(STACK_USAGE_WARNING)) \
+ 	    $(if $($(*F)_no_Wpacked_not_aligned),$(NO_PACKED_NOT_ALIGNED_WARNING),) \
+@@ -109,7 +108,6 @@ AM_CXXFLAGS = -std=c++11 -Wall -Wshadow \
+ 	   $(TRAMPOLINES_WARNING) \
+ 	   $(LOGICAL_OP_WARNING) $(DUPLICATED_COND_WARNING) \
+ 	   $(NULL_DEREFERENCE_WARNING) $(IMPLICIT_FALLTHROUGH_WARNING) \
+-	   $(if $($(*F)_no_Werror),,-Werror) \
+ 	   $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
+ 	   $(if $($(*F)_no_Wstack_usage),,$(STACK_USAGE_WARNING)) \
+ 	   $(if $($(*F)_no_Wpacked_not_aligned),$(NO_PACKED_NOT_ALIGNED_WARNING),) \

