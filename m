Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B584C27C4F
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 10:10:48 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.69652.1718964642122075573
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jun 2024 03:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ewuwBMTb;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: peron.clem@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ec1ac1aed2so20885531fa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 03:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718964640; x=1719569440; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZGa8AsWbn6IBjtu6soeRt6Y34fKd7/2jA6+6WAk8jlE=;
        b=ewuwBMTbgzu4ZvEcXoAh5xqavoBG07R6xCjPllHbaPIu5iJ42ILswLzZsoPen1eJCv
         sa7/BAMA0GTtIcaYgtvdavp2mWOQEJ9e/91mkCDA/Bipaem2O3oQZnEemeh/Ci5+Ezuu
         byfdWEafIdN80P5kg/XOKN9W1LpIBiJrBPr6TRfCzigZie6HMcCMaf/r6lA/RQFQQd4f
         Yz8dFR4K3cfdlCdI9xES8DpygzDAGq5VqiWA/KGTxSy1I3M2QdJ72QdlNTD7d+onX2Kb
         gKREhdirRf+rA6P7qHucZB1tZzXQOESxtco8Td3o2TMoF/J9F+6A8nciL0vGnlvTiXB7
         7ZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718964640; x=1719569440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZGa8AsWbn6IBjtu6soeRt6Y34fKd7/2jA6+6WAk8jlE=;
        b=vy+OmfNnFwI8fFvLeqCD8yfjG7EQjlbzsxoEsU9hBA/P5UHZQnBL5IQPp0U6zWEJNr
         4/E793yLIo+XAJYDLMIqXtDYwZDaFu5vXZXPEbWwKHfHBL5kyR98wM3ikMP6gLDs5rrB
         9Zi8fXtneR0/9DpIDm4SBs9bKLPCC42uvWmK7k4Ia9pDb9FRGU8Ds4xtqE3ENUJ0wQ0e
         TnPcHAYCSYO3sfNgn88YYlpCxaMV8utv0I/6pjxXBOLNb0pcYneSNDpzH7Sjw5S8Raw5
         ZS6KiV99Tm50SGuFI28GdtjFcmLihp30yIqOK/MgqC/sLcxVOWAxRaGOzCLRAXECIGOV
         P+bg==
X-Forwarded-Encrypted: i=1; AJvYcCWeQG8943LnvyUV7IUcVvfT48Y+5ToqP1EiHtF54SOFFpnPxUD0ZNKL4z3NQrPcro15YeUgPEh7krgS6ocMZIWDnYGR+oMkokOCEzhEtwXM+wlIcmai0K0u
X-Gm-Message-State: AOJu0YzcWjoZ9vMnwnFnAVabaA2EH3krEx31b9VjgGJDCjZr4qFX4xpi
	2qOEAMe2zmzXk6ToZMkNkryUHkHXMPXLlrHBRe19NHI1qNv4apbL
X-Google-Smtp-Source: AGHT+IFPmNbZLg7Kzn5jLEO+gOX/dIzxbpgXmOf7aDJlADaTV4AZLBf5sKM7SwaCvM+LdqQfwX8wog==
X-Received: by 2002:ac2:4c35:0:b0:52c:910b:9c87 with SMTP id 2adb3069b0e04-52ccaa38026mr4022407e87.36.1718964639614;
        Fri, 21 Jun 2024 03:10:39 -0700 (PDT)
Received: from clements-macbook-pro.home (2a01cb0004909300e598541db2dfe8f7.ipv6.abo.wanadoo.fr. [2a01:cb00:490:9300:e598:541d:b2df:e8f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0c54besm57214105e9.25.2024.06.21.03.10.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 21 Jun 2024 03:10:39 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: peter.marko@siemens.com,
	openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH] openssl: Remove patch already upstreamed
Date: Fri, 21 Jun 2024 12:10:34 +0200
Message-Id: <20240621101034.83232-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 10:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201004

Since the bump to OpenSSL 3.3.1, riscv32 doesn't build anymore due to
the folowing error:
crypto/riscv32cpuid.s:77: Error: symbol `riscv_vlen_asm' is already
defined

This is due to the patch beeing already applied upstream:
Commit: 8702320db98d1346c230aff1282ade3ecdca681a

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 ...Implement-riscv_vlen_asm-for-riscv32.patch | 43 -------------------
 .../openssl/openssl_3.3.1.bb                  |  1 -
 2 files changed, 44 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Implement-riscv_vlen_asm-for-riscv32.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Implement-riscv_vlen_asm-for-riscv32.patch b/meta/recipes-connectivity/openssl/openssl/0001-Implement-riscv_vlen_asm-for-riscv32.patch
deleted file mode 100644
index e398d1074a..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/0001-Implement-riscv_vlen_asm-for-riscv32.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 725b1530456545e8511adc9cbdd265309dffad53 Mon Sep 17 00:00:00 2001
-From: Hongren Zheng <i@zenithal.me>
-Date: Fri, 26 Apr 2024 06:03:43 +0000
-Subject: [PATCH] Implement riscv_vlen_asm for riscv32
-
-riscvcap.c: undefined reference to 'riscv_vlen_asm'
-
-Upstream-Status: Backport [https://github.com/openssl/openssl/pull/24270]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- crypto/riscv32cpuid.pl | 17 +++++++++++++++++
- 1 file changed, 17 insertions(+)
-
-diff --git a/crypto/riscv32cpuid.pl b/crypto/riscv32cpuid.pl
-index 20694e7..ac1c043 100644
---- a/crypto/riscv32cpuid.pl
-+++ b/crypto/riscv32cpuid.pl
-@@ -84,5 +84,22 @@ OPENSSL_cleanse:
- ___
- }
- 
-+{
-+my ($ret) = ('a0');
-+$code .= <<___;
-+################################################################################
-+# size_t riscv_vlen_asm(void)
-+# Return VLEN (i.e. the length of a vector register in bits).
-+.p2align 3
-+.globl riscv_vlen_asm
-+.type riscv_vlen_asm,\@function
-+riscv_vlen_asm:
-+    csrr $ret, vlenb
-+    slli $ret, $ret, 3
-+    ret
-+.size riscv_vlen_asm,.-riscv_vlen_asm
-+___
-+}
-+
- print $code;
- close STDOUT or die "error closing STDOUT: $!";
--- 
-2.45.0
-
diff --git a/meta/recipes-connectivity/openssl/openssl_3.3.1.bb b/meta/recipes-connectivity/openssl/openssl_3.3.1.bb
index a8746842b2..0ad84951e6 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.3.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.3.1.bb
@@ -12,7 +12,6 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://0001-Added-handshake-history-reporting-when-test-fails.patch \
-           file://0001-Implement-riscv_vlen_asm-for-riscv32.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.39.3 (Apple Git-146)


