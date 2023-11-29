Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E455C4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 13:05:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.32345.1701263101796059514
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 05:05:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=MkuVcrqi;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701263101; x=1732799101;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RpONR+i7DZ7pmTJulyrGFJDZRI7YodFVkMnMd4ZMfNg=;
  b=MkuVcrqiIt9ytR7zgbRsK1Rt+6KFBvBq2EcfKQKA5CRR5vb/8XxjGTwd
   o2u2rvp+cXSzJt6bRc2v3GcxdjxK5n8xi4+/p6A3m15Dev7JkddR1wnPk
   0uNDOjfIYPoRGEBgo4iz3ZxYfzw0HPdSR7L72kFA8j/m+Sr6jneOYED/B
   EflUU969n42tU+Z0bBwRWxWMH9cjYRxglX8mq7xYCg1JnqdgRR8yxrsfW
   vrlFqp9mB3qbV7l8gXHUUUtpMUH8yzJSybY8XT5+P4lg5wK93G6heqbKU
   QQVGdKwpDpP9uW+v8eiwKdtZHSLxmvxdS+RZKBNugSA06EuwV1bNzuRR8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="392902909"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="392902909"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 05:05:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="768913627"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="768913627"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga002.jf.intel.com with ESMTP; 29 Nov 2023 05:04:55 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssl: upgrade to 3.2.0
Date: Wed, 29 Nov 2023 20:45:17 +0800
Message-Id: <20231129124517.1047008-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 13:05:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191450

From: Lee Chee Yang <chee.yang.lee@intel.com>

upgrade include fix for CVE-2023-5678.

Changes in 3.2.0
https://www.openssl.org/news/cl32.txt

drop upstreamed 0001-Link-libatomic-on-riscv32.patch.
drop fix_random_labels.patch as fixed by
https://github.com/openssl/openssl/commit/0fbc50ef0cb8894973d4739af62e95be825b7ccf

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../0001-Link-libatomic-on-riscv32.patch      | 35 -------------------
 .../openssl/openssl/fix_random_labels.patch   | 22 ------------
 .../{openssl_3.1.4.bb => openssl_3.2.0.bb}    |  4 +--
 3 files changed, 1 insertion(+), 60 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Link-libatomic-on-riscv32.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/fix_random_labels.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.1.4.bb => openssl_3.2.0.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Link-libatomic-on-riscv32.patch b/meta/recipes-connectivity/openssl/openssl/0001-Link-libatomic-on-riscv32.patch
deleted file mode 100644
index 2c54d8f685..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/0001-Link-libatomic-on-riscv32.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 73266b8573c71e6720453c4c5a9e6e8fa4daec65 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 21 Oct 2023 13:03:52 -0700
-Subject: [PATCH] Link libatomic on riscv32
-
-GCC toolchains on linux are not able to build libcrypto without linking
-to libatomic as it does not have all needed atomics implemented as
-intrinsics
-
-Fixes errors like
-
-| ld: ./libcrypto.so: undefined reference to `__atomic_is_lock_free'
-
-Upstream-Status: Submitted [https://github.com/openssl/openssl/pull/22460]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Configurations/10-main.conf | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Configurations/10-main.conf b/Configurations/10-main.conf
-index 46094f59c2..d1a15a1152 100644
---- a/Configurations/10-main.conf
-+++ b/Configurations/10-main.conf
-@@ -816,7 +816,7 @@ my %targets = (
-     },
- 
-     "linux32-riscv32" => {
--        inherit_from     => [ "linux-generic32"],
-+        inherit_from     => [ "linux-latomic" ],
-         perlasm_scheme   => "linux32",
-         asm_arch         => 'riscv32',
-     },
--- 
-2.42.0
-
diff --git a/meta/recipes-connectivity/openssl/openssl/fix_random_labels.patch b/meta/recipes-connectivity/openssl/openssl/fix_random_labels.patch
deleted file mode 100644
index 78dcd81685..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/fix_random_labels.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-The perl script adds random suffixes to the local function names to ensure
-it doesn't clash with other parts of openssl. Set the random number seed
-to something predictable so the assembler files are generated consistently
-and our own reproducible builds tests pass.
-
-Upstream-Status: Pending
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: openssl-3.1.0/crypto/modes/asm/aes-gcm-avx512.pl
-===================================================================
---- openssl-3.1.0.orig/crypto/modes/asm/aes-gcm-avx512.pl
-+++ openssl-3.1.0/crypto/modes/asm/aes-gcm-avx512.pl
-@@ -191,6 +191,9 @@ my $CTX_OFFSET_HTable    = (16 * 6);
- # ;;; Helper functions
- # ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
- 
-+# Ensure the local labels are reproduicble
-+srand(10000);
-+
- # ; Generates "random" local labels
- sub random_string() {
-   my @chars  = ('a' .. 'z', 'A' .. 'Z', '0' .. '9', '_');
diff --git a/meta/recipes-connectivity/openssl/openssl_3.1.4.bb b/meta/recipes-connectivity/openssl/openssl_3.2.0.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_3.1.4.bb
rename to meta/recipes-connectivity/openssl/openssl_3.2.0.bb
index c6c70a1213..ab0562bd73 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.1.4.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.2.0.bb
@@ -11,8 +11,6 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
-           file://fix_random_labels.patch \
-           file://0001-Link-libatomic-on-riscv32.patch \
            file://0001-Added-handshake-history-reporting-when-test-fails.patch \
            "
 
@@ -20,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "840af5366ab9b522bde525826be3ef0fb0af81c6a9ebd84caa600fea1731eee3"
+SRC_URI[sha256sum] = "14c826f07c7e433706fb5c69fa9e25dab95684844b4c962a2cf1bf183eb4690e"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.37.3


