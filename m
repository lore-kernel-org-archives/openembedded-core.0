Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE0B10F931B
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 02:42:51 +0000 (UTC)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4312.1775011362922145091
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Mar 2026 19:42:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=J0nom34W;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2c18af885c0so7369843eec.0
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Mar 2026 19:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775011362; x=1775616162; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FV+EOVZO9oCW53PK4okIr0eua281Jq5OimMiOTHsjzk=;
        b=J0nom34W6DVsecyFKler3qTJf31nLjVKtwhh89Kg3sQf/yqnPWYl5CJ7PvDdZ5XEqO
         nLI9ZK6dLjoA/+NCp0B544nanR1So9eEXfoJ0YGK4QKY1O45UvfEmD2gnRVikC+qtkIR
         uloMfx6db3vhquD8WS8FAtobh3Nk5LeGNgD89n/9bmCryQvmWPCt3k4HabACOO83rOfV
         yCaGFMNaQnBhzMqxpxMAojlhYVZKPQc0SW1rrp32sGPnWEZaU1mwa3EijhVuJYnOSrsT
         45ShQ+pJAj3pE+8EoX2lWBuzqyvWIm57B1LkRvkuy4rz0uB8/wddBesTUNUrkzv2WNLr
         VFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775011362; x=1775616162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FV+EOVZO9oCW53PK4okIr0eua281Jq5OimMiOTHsjzk=;
        b=EER/6y1sReO6tteQj2vxXSCzXMP8EhpkTMyNSV1A6RgGTNFwDibjWxrRTC+1B0AP3E
         FahISw6nx2p2vBUx/dFYvgbSSgVDNEp7k1OTlP0czxO3YOcmFq/K/SVFH+VMEeVUQAMX
         iBjxrv8EHH8VEZx4OYaHL4xD7aYTyk5Hsv1FRf4nS4fzhkJXZ99ela0HGWPPEhQhUAUn
         muyWtBkfVXW39Wc/zwDQHKhvjZQ3oocvgOurjHTLNGTGcI76ukIOUKuqw5JyVXz/MdVC
         w2iWWJlomhtCTX+fhAY79FDdM8yp760n01i4LB0qaCojGbiobLsrX+9mgoNFpuTLUAYi
         6n4A==
X-Gm-Message-State: AOJu0YyrKfXEW+GycsBZTtqR8n7LHt5HhLNq+T0PMkYT0mdNcr+T4zg3
	Xx/vdQufg2OtJLSiFRrsVNKutm/GUZLwazES4Q/0Gx6IFp1Nomj+1E5noE8xOSrB
X-Gm-Gg: ATEYQzyP7+YgGuGH2EWREVvlBOQ97p6fYEg3AH0SdP0eYMiAm1OPDHE4Arl4fmURbqQ
	XM4BWV2Piwj8Kq0lf/HbppjgSrE/piZZMp6DfN2X8RlXvmfQYS82U7yuDiYj72un+119/95tC/y
	zAk3rTN/sB8ilXb7nxjeK3xtkpN0gk+lfQ9ui1xynSKcBGnwNn47NaEnDTe3lVNAiOGe/zsW9g0
	MV8sRbJZOS0yJM8H0+BkY4KN7fQUgf0UDTvx7rlQtTplC7FLIys6VlO+zdVjS1fecJLyW8D4hED
	CfO78CMQfzgnXM7RT+Ha5zxeAhZv2oZL25jyx3CowUxCp6dX7aR8OBzuudcqvO05hUA0T2c16UP
	qn1yTXjyN0I7ubJjGFXCva2sedq+TCs9g7IMhsKC1wDVErTkcfO26LrV5Xb5FUoJ75TLOI7B/3Q
	q/79LmCLEAs56YF0ffx0FnmJGmisjK0etELo+V1n1LXlKOgAdkmvd1Vf/J3SLz/B66KzXUXbzOB
	S/9TKCAWAzzv2hVawoeeFYjIHNZ66AyaiMHTLKvV75SPw/RQZsyE3aip4KP
X-Received: by 2002:a05:7301:3d12:b0:2c7:357a:3347 with SMTP id 5a478bee46e88-2c9323bb066mr1060609eec.16.1775011361801;
        Tue, 31 Mar 2026 19:42:41 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c4cbbc1fsm11190736eec.13.2026.03.31.19.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 19:42:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH] libcxx: Fix build failure on arm targets
Date: Tue, 31 Mar 2026 19:42:38 -0700
Message-ID: <20260401024238.3714433-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 02:42:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234324

Add needed forward declaration

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
Cc: Ross Burton <ross.burton@arm.com>
---
 ...e-__gnu_unwind_frame-in-cxa_personal.patch | 33 +++++++++++++++++++
 meta/recipes-devtools/clang/common.inc        |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/clang/clang/0040-libcxxabi-declare-__gnu_unwind_frame-in-cxa_personal.patch

diff --git a/meta/recipes-devtools/clang/clang/0040-libcxxabi-declare-__gnu_unwind_frame-in-cxa_personal.patch b/meta/recipes-devtools/clang/clang/0040-libcxxabi-declare-__gnu_unwind_frame-in-cxa_personal.patch
new file mode 100644
index 0000000000..f458fd0cf8
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0040-libcxxabi-declare-__gnu_unwind_frame-in-cxa_personal.patch
@@ -0,0 +1,33 @@
+From 5dbd0a05f64a43849a7edde95a0e5f2323cd1f9d Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Tue, 31 Mar 2026 19:33:29 -0700
+Subject: [PATCH] libcxxabi: declare __gnu_unwind_frame in cxa_personality
+
+ARM EHABI builds of libcxxabi fail with clang-22+ because
+cxa_personality.cpp calls __gnu_unwind_frame without a visible
+declaration, triggering:
+
+  error: use of undeclared identifier '__gnu_unwind_frame'
+
+Add an extern "C" forward declaration before the EHABI unwind helper
+so the source compiles correctly.
+
+Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/189787]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ libcxxabi/src/cxa_personality.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libcxxabi/src/cxa_personality.cpp b/libcxxabi/src/cxa_personality.cpp
+index 35f4e3807724..ddff277cc7b8 100644
+--- a/libcxxabi/src/cxa_personality.cpp
++++ b/libcxxabi/src/cxa_personality.cpp
+@@ -1116,6 +1116,8 @@ __gxx_personality_seh0(PEXCEPTION_RECORD ms_exc, void *this_frame,
+
+ #else
+
++extern "C" _Unwind_Reason_Code __gnu_unwind_frame(_Unwind_Exception*,
++                                                  _Unwind_Context*);
+ // Helper function to unwind one frame.
+ // ARM EHABI 7.3 and 7.4: If the personality function returns _URC_CONTINUE_UNWIND, the
+ // personality routine should update the virtual register set (VRS) according to the
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index afb79129b3..3b1070ef93 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -60,6 +60,7 @@ SRC_URI = "\
     file://0037-clang-Only-build-clang-tblgen-if-it-is-actually-need.patch \
     file://0038-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch \
     file://0039-Clang-Rename-OffloadArch-UNUSED-to-UNUSED_-to-avoid-.patch \
+    file://0040-libcxxabi-declare-__gnu_unwind_frame-in-cxa_personal.patch \
 "
 # Fallback to no-PIE if not set
 GCCPIE ??= ""

