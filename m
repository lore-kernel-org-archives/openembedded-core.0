Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 487ABC25B79
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 23:05:38 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.2254.1715641531933535623
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 May 2024 16:05:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O90FErqI;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1eeb1a4c10aso28960785ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 16:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715641531; x=1716246331; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CRPEdtFOMlZ/Neo7DZKM97cYsCQrZUVYHMuleeeDuIM=;
        b=O90FErqIYjZx0lt6dR6b/whVOuQoK0vuQVfeBQba/tefyR5QDwz+Eq/mG6aQAhmWud
         qbX/PnQD8lr9jaAiD1DQu6md5h8UIwd/5yAEL2sOFprv4p2lgrpk0qhlo3GQJgAquXEY
         9pKXYO30xrRmqYzjcpvQZlFuSUl04GP/dgyRz/9ztK18erAfT5/4IlBLp/9iLWa7Y221
         Evl+czTtv57TL8R3Sx8VZ6aEksaoZr83Pn3fGT2/G8D0qSAjWFWdvGzG6zIQGM35fhWA
         lC3TRrCgS4AqCGymflLVq5Wwz6kEANLn1jFQQf6lALh9BC6YqPpFdpuq/52qrlfNlkuB
         /4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715641531; x=1716246331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CRPEdtFOMlZ/Neo7DZKM97cYsCQrZUVYHMuleeeDuIM=;
        b=NmolrdmNWnLdb/KlpfDQG2cc+YUg/TUnp/ll+yFRJI/op3eqDn4XxN6mU1M5HbVdfK
         Zes/Mb7OF8TGcBNYH73mQDmra12gKc1ud8cY6bn0D2Pi6wjgbyGgsyECc8kf4wAec9xx
         ggbpzempBJ7PnbIl8azKYSMWulxX9ep3HhGIYMgsoB/F7G8p9qZwAx090QnZ3T0kPawT
         Qd22xjJs+8rOMBN/Bn32ypM2Ahe0eEbu64DvNFRAxS7N8Z6W5uY5Z/sO1sVJnZvhPhss
         1+Jt6LWTUSapJ9ZB8Di9qfG9YUtLdlOpjROXgUosVurYsqo1kV/uNzwGSu3UiCAMzfkj
         F77w==
X-Gm-Message-State: AOJu0YyaEu0HgiFkq2TUwOex63QygFWpF+Ki6e4bKnXcOjbT8SF4bfVP
	K8lTNAJrdpMbbU0icbmKK7hv4Am1PxkuAKgyoH7WCJxdMhiM8HuIbGwHB4tpPHU=
X-Google-Smtp-Source: AGHT+IHc4oaQqn45mZWH9A38Abi1Kl8koFGxxm3vuij0vfW7CsqRP1wIlHHeKq1isfMYOu/HV/GbtQ==
X-Received: by 2002:a17:902:9047:b0:1e9:320c:2ecf with SMTP id d9443c01a7336-1ef43d2eeefmr102444305ad.35.1715641530908;
        Mon, 13 May 2024 16:05:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::6fff])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bad9f3asm84998995ad.112.2024.05.13.16.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 16:05:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] openssl: Fix build on riscv
Date: Mon, 13 May 2024 16:05:28 -0700
Message-ID: <20240513230528.4115348-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 23:05:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199251

GCC-14 unearths this bug which is already fixed upstream so backport it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Implement-riscv_vlen_asm-for-riscv32.patch | 43 +++++++++++++++++++
 .../openssl/openssl_3.3.0.bb                  |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Implement-riscv_vlen_asm-for-riscv32.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Implement-riscv_vlen_asm-for-riscv32.patch b/meta/recipes-connectivity/openssl/openssl/0001-Implement-riscv_vlen_asm-for-riscv32.patch
new file mode 100644
index 00000000000..e398d1074a4
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Implement-riscv_vlen_asm-for-riscv32.patch
@@ -0,0 +1,43 @@
+From 725b1530456545e8511adc9cbdd265309dffad53 Mon Sep 17 00:00:00 2001
+From: Hongren Zheng <i@zenithal.me>
+Date: Fri, 26 Apr 2024 06:03:43 +0000
+Subject: [PATCH] Implement riscv_vlen_asm for riscv32
+
+riscvcap.c: undefined reference to 'riscv_vlen_asm'
+
+Upstream-Status: Backport [https://github.com/openssl/openssl/pull/24270]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ crypto/riscv32cpuid.pl | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+
+diff --git a/crypto/riscv32cpuid.pl b/crypto/riscv32cpuid.pl
+index 20694e7..ac1c043 100644
+--- a/crypto/riscv32cpuid.pl
++++ b/crypto/riscv32cpuid.pl
+@@ -84,5 +84,22 @@ OPENSSL_cleanse:
+ ___
+ }
+ 
++{
++my ($ret) = ('a0');
++$code .= <<___;
++################################################################################
++# size_t riscv_vlen_asm(void)
++# Return VLEN (i.e. the length of a vector register in bits).
++.p2align 3
++.globl riscv_vlen_asm
++.type riscv_vlen_asm,\@function
++riscv_vlen_asm:
++    csrr $ret, vlenb
++    slli $ret, $ret, 3
++    ret
++.size riscv_vlen_asm,.-riscv_vlen_asm
++___
++}
++
+ print $code;
+ close STDOUT or die "error closing STDOUT: $!";
+-- 
+2.45.0
+
diff --git a/meta/recipes-connectivity/openssl/openssl_3.3.0.bb b/meta/recipes-connectivity/openssl/openssl_3.3.0.bb
index d9233b356ad..b800d0de909 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.3.0.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.3.0.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://0001-Added-handshake-history-reporting-when-test-fails.patch \
+           file://0001-Implement-riscv_vlen_asm-for-riscv32.patch \
            file://bti.patch \
            "
 
-- 
2.45.0


