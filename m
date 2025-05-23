Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A56AC3DA6D
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 07:32:18 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.42999.1747985533270014639
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 May 2025 00:32:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ncDsInyY;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-afc857702d1so7512219a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 00:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747985532; x=1748590332; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oA52vESquG5eOyZL3hwah+d7R3jeT67Ns3uwv5kDEDo=;
        b=ncDsInyY4R1374EHtnqt4G9m2PU2AK3fOUc7hdD8cge4QQUnPucWXr7vwiiGk0sTEq
         YArCRXAZxyvvPKhgRG1KepxeiY13Z711cyc2xY0iqEKuaxxsspODFSnPYWZ546dEgLrx
         J7dayI8yJ2ri1xMdqKyZ8gDoSaJ7C4pjbDXzEybb/4M50hP4P8Ip8MU4EGAd6Uskp+7o
         6oGk4zFKGZbNTHxke/CA4hDZ+m8r6UEipes+fSugz2wgjnzAp8qBFeLhDWXm4BQq26iy
         lRs2IOQi0blLYYfChBjvuNXTqK8KEh0rrOtPs5k6zipRJ48c2QGUob/e8Z3LYWBhCh7i
         Dbbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747985532; x=1748590332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oA52vESquG5eOyZL3hwah+d7R3jeT67Ns3uwv5kDEDo=;
        b=LlFWRIM1oWtw06LBkFvptzmzfve6qlXoYG2p1IbzjjyeXfb5L1w2k416QKGE91gn73
         V4cqk8v13uy7KbCLdKEigQGz6RFQvxFDleejrozwNyngXBprhj/ljiW3c4V8RwhxqCOs
         CnZPT3dooG1i1/txEQ4orFPjMOMMU5nXtEC/31vCbmvnGRNaq8RiRrAYK5jLlG7HTvMu
         Oo5I0/HTb/hgr1kXV1daaKC2PEbyh9jWNpaFCwSOV5y64iymTJVlX7BKR9YM4hpYyB7M
         VMn1KbdSQc8O0qQPWQMSgjn582jJktdEItL4U24seYhJkxNqOtjCVHNVeSZrMwL+8r8k
         07mw==
X-Gm-Message-State: AOJu0YwPTX1RIfMujNyXbx1OOwppjnLV2cc17BhHR+Ojy4LznV7SVh5i
	TxqQ46OXi7wkouBBIzr5+0BAQKyHREgjgCWcVxFPv1zy3y8HKKlZj/QKofbpiTJv
X-Gm-Gg: ASbGncsu0BJSTwpvnaFlpcfH+99iJ5yoywKG9/c0PViYRy8r4Hols6gWE5Cz+dzwrEh
	T6mGjGNV+TPMziafwWXf+EJ9HSaXPOrfZhJeJormjazPRgHmuRr54+LuAljT9Ydl+w2f98x6K2x
	3lTZ/ROhQkm9/W+HLymUzmZmEEIxLyaAczw2194+7dMW7WZLaBBHiCjMqek6WMff7zvjSdF6U0V
	O5ormUCf+TIQr8sIbFTDV0yvJPIwLnASeaDuvJsv5/PL35X3AmstMFeu+E6CoQEw+zTFryNIQBc
	uim6HmtoRLxTEmbAayT5rURT7H9fn4RcpZ06qQRqbgqhQnHN/nrFOg==
X-Google-Smtp-Source: AGHT+IGpR9yRLU1aaqDqkKvjfjxHMT978wikNsi7A+GilHOdT/VjUYmIgJPgOX0TCddBlusANw/c6Q==
X-Received: by 2002:a17:902:dad0:b0:231:bfbc:3081 with SMTP id d9443c01a7336-231d45a9e30mr407442715ad.44.1747985532274;
        Fri, 23 May 2025 00:32:12 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5f56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e98082sm118843255ad.122.2025.05.23.00.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 00:32:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] compiler-rt-sanitizers: Fix build on mips
Date: Fri, 23 May 2025 00:32:07 -0700
Message-ID: <20250523073208.211042-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 07:32:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217179

uintptr_t size is not consistent between compiler-rt and clang
for mips

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...code-uptr-sptr-typedefs-on-Mips-Linu.patch | 35 +++++++++++++++++++
 meta/recipes-devtools/clang/common.inc        |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/clang/clang/0038-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch

diff --git a/meta/recipes-devtools/clang/clang/0038-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch b/meta/recipes-devtools/clang/clang/0038-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch
new file mode 100644
index 00000000000..b54c1638578
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0038-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch
@@ -0,0 +1,35 @@
+From 9f88f2e4efa56e53c78f9b67775c71afa711a69c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 22 May 2025 21:50:45 -0700
+Subject: [PATCH] [compiler-rt] Hardcode uptr/sptr typedefs on Mips/Linux
+
+Sanitizer build on Mips/Linux faills to build due to assertion errors
+mismatched definitions. This is due to inconsistent definitions of
+`uptr` of either `unsigned long` or `unsigned int` in compiler-rt. This
+is caused by clang defining
+
+__UINTPTR_TYPE__ long unsigned int where as gcc defines it as
+unsigned int
+
+As a workaround, this hardcodes `uptr`/`sptr` in compiler-rt to
+`unsigned int`/`int` on Linux Mips, matching gcc.
+
+Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/141201]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ compiler-rt/lib/sanitizer_common/sanitizer_internal_defs.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/compiler-rt/lib/sanitizer_common/sanitizer_internal_defs.h b/compiler-rt/lib/sanitizer_common/sanitizer_internal_defs.h
+index fff60c96f632..511ee8fe49cc 100644
+--- a/compiler-rt/lib/sanitizer_common/sanitizer_internal_defs.h
++++ b/compiler-rt/lib/sanitizer_common/sanitizer_internal_defs.h
+@@ -139,7 +139,7 @@
+ namespace __sanitizer {
+ 
+ #if defined(__UINTPTR_TYPE__)
+-#  if defined(__arm__) && defined(__linux__)
++#  if (defined(__arm__) || _ABIO32 == 1) && defined(__linux__)
+ // Linux Arm headers redefine __UINTPTR_TYPE__ and disagree with clang/gcc.
+ typedef unsigned int uptr;
+ typedef int sptr;
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index f661a6283e5..24f82f38128 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -58,6 +58,7 @@ SRC_URI = "\
     file://0035-llvm-config-remove-LLVM_LDFLAGS-from-ldflags-output.patch \
     file://0036-openmp-Do-not-emit-date-and-time-into-generate-files.patch \
     file://0038-compiler-rt-Exclude-sync_fetch_and_-for-any-pre-ARMv.patch \
+    file://0038-compiler-rt-Hardcode-uptr-sptr-typedefs-on-Mips-Linu.patch \
 "
 # Fallback to no-PIE if not set
 GCCPIE ??= ""

