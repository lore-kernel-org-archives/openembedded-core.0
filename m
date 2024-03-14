Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B656CC54E66
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 02:26:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by mx.groups.io with SMTP id smtpd.web11.2174.1710383203166834998
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 19:26:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=TGp/TWa8;
 spf=pass (domain: intel.com, ip: 192.198.163.8, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710383203; x=1741919203;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=w6uhvX71fM+b2V0of4A9nAu3cYG6JhOxALe7TDXITPM=;
  b=TGp/TWa8g9VX2x/QuNr83KmNPnmZU/1OsapcH3ZE74fC7wXeXpG7WPuO
   B5lZZmTIv09AbzNRACFGH7p1edLWJlLkZqIHdEp4gdDGDok7CdG98pnnM
   xWF9mfXQHo21N4/vt7VgEZHNVE8EZGXq79N3MBiz0WCbQyg0gRiN3DRvA
   Es/axXMBOxmGwx1UuSV2lYFRVJFx5MXJZpNmrax6a0hLeC40dXZ1EZ+eR
   8QE5cE4Av1XJ2Q4L9O93+ls9u2Yh0zDAuZNeA/xON5vXD4nzOIDQcd6XO
   5r/NRvurq2h2x7bgwJQJOM1kdwt2KPzoGkygc2ABo4IYmHWF/z3R3X5bj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="22701826"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="22701826"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 19:26:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="16875952"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orviesa005.jf.intel.com with ESMTP; 13 Mar 2024 19:26:42 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [nanbield][PATCH v2] openssl: upgrade to 3.1.5
Date: Thu, 14 Mar 2024 10:26:27 +0800
Message-Id: <20240314022627.1686293-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Mar 2024 02:26:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197095

From: Lee Chee Yang <chee.yang.lee@intel.com>

Changes between 3.1.4 and 3.1.5 [30 Jan 2024]
 * A file in PKCS12 format can contain certificates and keys and may
come from
   an untrusted source. The PKCS12 specification allows certain fields
to be
   NULL, but OpenSSL did not correctly check for this case. A fix has
been
   applied to prevent a NULL pointer dereference that results in OpenSSL
   crashing. If an application processes PKCS12 files from an untrusted
source
   using the OpenSSL APIs then that application will be vulnerable to
this
   issue prior to this fix.

   OpenSSL APIs that were vulnerable to this are: PKCS12_parse(),
   PKCS12_unpack_p7data(), PKCS12_unpack_p7encdata(),
PKCS12_unpack_authsafes()
   and PKCS12_newpass().

   We have also fixed a similar issue in SMIME_write_PKCS7(). However
since this
   function is related to writing data we do not consider it security
   significant.

   ([CVE-2024-0727])
https://www.openssl.org/news/cl31.txt

drop fix_random_labels.patch as fixed in
https://github.com/openssl/openssl/commit/99630a1b08fd6464d95052dee4a3500afeb95867

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
v2: install p_minimal.so for ptest package

 .../openssl/openssl/fix_random_labels.patch   | 22 -------------------
 .../{openssl_3.1.4.bb => openssl_3.1.5.bb}    |  4 ++--
 2 files changed, 2 insertions(+), 24 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/fix_random_labels.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.1.4.bb => openssl_3.1.5.bb} (98%)

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
diff --git a/meta/recipes-connectivity/openssl/openssl_3.1.4.bb b/meta/recipes-connectivity/openssl/openssl_3.1.5.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_3.1.4.bb
rename to meta/recipes-connectivity/openssl/openssl_3.1.5.bb
index 0fe4e76808..05bfeac45e 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.1.4.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.1.5.bb
@@ -11,7 +11,6 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
-           file://fix_random_labels.patch \
            file://0001-Added-handshake-history-reporting-when-test-fails.patch \
            "
 
@@ -19,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "840af5366ab9b522bde525826be3ef0fb0af81c6a9ebd84caa600fea1731eee3"
+SRC_URI[sha256sum] = "6ae015467dabf0469b139ada93319327be24b98251ffaeceda0221848dc09262"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
@@ -187,6 +186,7 @@ PTEST_BUILD_HOST_PATTERN = "perl_version ="
 do_install_ptest () {
 	install -d ${D}${PTEST_PATH}/test
 	install -m755 ${B}/test/p_test.so ${D}${PTEST_PATH}/test
+	install -m755 ${B}/test/p_minimal.so ${D}${PTEST_PATH}/test
 	install -m755 ${B}/test/provider_internal_test.cnf ${D}${PTEST_PATH}/test
 
 	# Prune the build tree
-- 
2.37.3


