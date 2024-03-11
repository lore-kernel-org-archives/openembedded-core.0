Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 631D2C54E6A
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 08:40:18 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by mx.groups.io with SMTP id smtpd.web10.57746.1710146410684632311
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 01:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Jj7aEUMN;
 spf=pass (domain: intel.com, ip: 198.175.65.19, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710146412; x=1741682412;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=MMetb81Lo5yLtt94Eu5rQUfLwkJt9F0WDUWu0G2xwdQ=;
  b=Jj7aEUMNDyLAZ1c0569hO2T91U245O1GLOqMcE7XGY7ZbNjcYmLZosG6
   NZP7JPCKu7IJw35lNAJTHCGUfsgsCn98Cjh+xIoaWraoUZGP/LAj8A6P3
   5SfJ/Dpmrzu7rxWijwYuYX+aiTVklh7X4ViAPK08LYFL+iPS12gG1Cf5Q
   4melbYhwwOxrpnn7Su1uei2WBCK+B9eX+LCGukYkTdhEKZ2FCwD5srqZi
   UDgP2zUP14L6GM1R9IgZmG0qYjyBUWPISu7IUVdc3FljwEmNALei0/3eh
   Bn2/+ee4TEjzNKAS5Sg1a0JaqaxtOHkiwc8fZOXXgM4qw8y0S5WjzrqX/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4656120"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="4656120"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 01:40:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="15593982"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmviesa005.fm.intel.com with ESMTP; 11 Mar 2024 01:40:10 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [nanbield][PATCH 2/7] openssl: upgrade to 3.1.5
Date: Mon, 11 Mar 2024 16:39:49 +0800
Message-Id: <20240311083954.418271-2-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240311083954.418271-1-chee.yang.lee@intel.com>
References: <20240311083954.418271-1-chee.yang.lee@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 08:40:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196921

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
 .../openssl/openssl/fix_random_labels.patch   | 22 -------------------
 .../{openssl_3.1.4.bb => openssl_3.1.5.bb}    |  3 +--
 2 files changed, 1 insertion(+), 24 deletions(-)
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
index 0fe4e76808..9c1d4e31be 100644
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
-- 
2.37.3


