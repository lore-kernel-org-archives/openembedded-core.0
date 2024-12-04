Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 776A9E7716D
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 20:02:06 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.24601.1733342517422844048
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 12:01:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DdvkGxqb;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7259a26ad10so161944b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 12:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733342517; x=1733947317; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGRfXsHP+qG9+xo3tWerSnKKDFPGxUCmzbvyWkvZ6RM=;
        b=DdvkGxqbIK1exo678WK/dzVomOhd9enAKwMP8oUIHulljoHcMvG0r4AF713nPAEjuR
         8m7wAqBL34ZNJfaEGN3UVj8Syppl1NlfGdk1+YChVsjBfoDBpNG/j2VwJ2/JQv9HF/2+
         YO6r2r6KvvHLj5h76ZE2DLJR9DnTQqKJcEFeQwkT3KGNwshNVt0vHIxE4AqcqVFa2MO4
         F7eueGJe6XZyqQCqjAVuCWRb70NkfnKsA9aEA6G4ahsuF3TVj8aE02rS3KPaMoCxZ9MD
         /OLBFf+n/iAK62Wo+lKObgu/P9Mqh1c5Ln9lwZHvS0r34AfGDtn+0s2QpnWNYkFXPgVy
         nU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733342517; x=1733947317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vGRfXsHP+qG9+xo3tWerSnKKDFPGxUCmzbvyWkvZ6RM=;
        b=vymyQARrJgscXx9JlyPxG7bVPxW/Yum5i3x37QEQ1Ds2IicvoPcrQ/dHkg/QfHltJ5
         JQXPg9lpKw+cjQEH+54g/e/tk9/wvRltx/XqiXUuow0nYVv7jfA58qHChvLeBcwUxkZf
         zA5OOH58XuvG7+OKEqCUjVv8MdCW5V2dqWLRkoXUr9PYnU4YvDmFYYoT2fR3fFU7ik8c
         8HyoervN4s2VikVHm3/oAcZfe3yhUMOe3Jiwoa3O3vSQW0+o47Mf6iKXjn6U1BIRJXwg
         PqazKrpTMiPha1/uLzTm0vr6unaZrUqdoE1bTLdoNXap8U7psAYFKHqn1mBpOzaIlX21
         Tw7g==
X-Gm-Message-State: AOJu0YxznFktzMVFsubLAKy/iDEGPb0cUCsaDooDAwdojIUXzpTWO+q7
	75oJMOVaC6+vNbfACG4SYGZx5oiZdDjaw0egjYR6T1/irlRIXCM0In9/ksYy
X-Gm-Gg: ASbGncsPbS6D8xzdsY52BMZUmKrBkmx3MMBty7e6pnJXEN6k25W8z2B13IThiyiOfTz
	QHDCAalxXRaIoNgqZ843D0AH7yZklYz1sbrHjYvclBR4aErMWE3Xhrmr0Cw1Hk8t9b0i+z/Zl9H
	n9vDafQ7f/EvorcJKdawf6JwV0X8bz9+SgN3cz8blBeK0X8O+yZu7wTqiv3pTXnLnPRO+JBSkja
	Pwj4Rc+aL33s/+v1Hs3nQdjbnYhbcI2692895bzQ9jNc1VF7RTA
X-Google-Smtp-Source: AGHT+IH82Zov0+1LqapX5yh3LU4VNEJgmsQYFNJGSG+me7JBKxYZsAiFSJIxnGXU9h9TD+8xOOewXA==
X-Received: by 2002:a05:6a00:6607:b0:725:4196:5cee with SMTP id d2e1a72fcca58-7259d58d543mr982984b3a.4.1733342516442;
        Wed, 04 Dec 2024 12:01:56 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::9a42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254184943csm12749803b3a.191.2024.12.04.12.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:01:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] openssl: Fix build on risc64/musl
Date: Wed,  4 Dec 2024 12:01:52 -0800
Message-ID: <20241204200153.2360387-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241204200153.2360387-1-raj.khem@gmail.com>
References: <20241204200153.2360387-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 20:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208326

__NR_riscv_hwprobe is not exported in musl's hwprobe.h
this fails to build with newer kernels

Fixes
| :85:20: error: use of undeclared identifier '__NR_riscv_hwprobe'; did you mean 'riscv_hwprobe'?
|    85 |     return syscall(__NR_riscv_hwprobe, pairs, pair_count, cpu_count, cpus, flags);
|       |                    ^~~~~~~~~~~~~~~~~~

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-Fix-builds-on-riscv64-using-musl.patch | 36 +++++++++++++++++++
 .../openssl/openssl_3.4.0.bb                  |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Fix-builds-on-riscv64-using-musl.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Fix-builds-on-riscv64-using-musl.patch b/meta/recipes-connectivity/openssl/openssl/0001-Fix-builds-on-riscv64-using-musl.patch
new file mode 100644
index 00000000000..0ec8c937483
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Fix-builds-on-riscv64-using-musl.patch
@@ -0,0 +1,36 @@
+From 9131291716073c4ea65a29575880a9d796c22ed6 Mon Sep 17 00:00:00 2001
+From: Matt Caswell <matt@openssl.org>
+Date: Wed, 23 Oct 2024 14:57:20 +0100
+Subject: [PATCH] Fix builds on riscv64 using musl
+
+Some environments using musl are reported to have the hwprobe.h include
+file but not have the __NR_riscv_hwprobe define.
+
+Fixes #25772
+
+Upstream-Status: Backport [https://github.com/openssl/openssl/pull/25787]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/crypto/riscv_arch.h | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/include/crypto/riscv_arch.h b/include/crypto/riscv_arch.h
+index 4b3573f..8858427 100644
+--- a/include/crypto/riscv_arch.h
++++ b/include/crypto/riscv_arch.h
+@@ -15,7 +15,14 @@
+ 
+ # if defined(OPENSSL_SYS_LINUX) && !defined(FIPS_MODULE)
+ #  if __has_include(<asm/hwprobe.h>)
+-#   define OSSL_RISCV_HWPROBE
++#   include <sys/syscall.h>
++#   /*
++     * Some environments using musl are reported to have the hwprobe.h include
++     * file but not have the __NR_riscv_hwprobe define.
++     */
++#   ifdef __NR_riscv_hwprobe
++#    define OSSL_RISCV_HWPROBE
++#   endif
+ #  endif
+ # endif
+ 
diff --git a/meta/recipes-connectivity/openssl/openssl_3.4.0.bb b/meta/recipes-connectivity/openssl/openssl_3.4.0.bb
index 734e3c54ef0..b7f96db3941 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.4.0.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.4.0.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://0001-Added-handshake-history-reporting-when-test-fails.patch \
+           file://0001-Fix-builds-on-riscv64-using-musl.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \

