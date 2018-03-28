Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 0B3397865E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 12:49:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Mar 2018 05:49:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,371,1517904000"; d="scan'208";a="215609421"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 28 Mar 2018 05:49:44 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Mar 2018 15:43:08 +0300
Message-Id: <20180328124308.14893-3-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180328124308.14893-1-alexander.kanavin@linux.intel.com>
References: <20180328124308.14893-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/3] openssl: update 1.1.0g -> 1.1.0h
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Mar 2018 12:49:44 -0000

Please see this security advisory:
https://www.openssl.org/news/secadv/20180327.txt

Remove 0001-Remove-test-that-requires-running-as-non-root.patch
(issue fixed upstream)
Remove 0001-aes-asm-aes-armv4-bsaes-armv7-.pl-make-it-work-with-.patch
(backport)

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...ve-test-that-requires-running-as-non-root.patch | 49 ------------
 ...-armv4-bsaes-armv7-.pl-make-it-work-with-.patch | 88 ----------------------
 .../{openssl_1.1.0g.bb => openssl_1.1.0h.bb}       | 10 +--
 3 files changed, 4 insertions(+), 143 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Remove-test-that-requires-running-as-non-root.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-aes-asm-aes-armv4-bsaes-armv7-.pl-make-it-work-with-.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.1.0g.bb => openssl_1.1.0h.bb} (91%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Remove-test-that-requires-running-as-non-root.patch b/meta/recipes-connectivity/openssl/openssl/0001-Remove-test-that-requires-running-as-non-root.patch
deleted file mode 100644
index 736bb39acd1..00000000000
--- a/meta/recipes-connectivity/openssl/openssl/0001-Remove-test-that-requires-running-as-non-root.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 3fdb1e2a16ea405c6731447a8994f222808ef7e6 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 7 Apr 2017 18:01:52 +0300
-Subject: [PATCH] Remove test that requires running as non-root
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- test/recipes/40-test_rehash.t | 17 +----------------
- 1 file changed, 1 insertion(+), 16 deletions(-)
-
-diff --git a/test/recipes/40-test_rehash.t b/test/recipes/40-test_rehash.t
-index f902c23..c7567c1 100644
---- a/test/recipes/40-test_rehash.t
-+++ b/test/recipes/40-test_rehash.t
-@@ -23,7 +23,7 @@ setup("test_rehash");
- plan skip_all => "test_rehash is not available on this platform"
-     unless run(app(["openssl", "rehash", "-help"]));
- 
--plan tests => 5;
-+plan tests => 3;
- 
- indir "rehash.$$" => sub {
-     prepare();
-@@ -42,21 +42,6 @@ indir "rehash.$$" => sub {
-        'Testing rehash operations on empty directory');
- }, create => 1, cleanup => 1;
- 
--indir "rehash.$$" => sub {
--    prepare();
--    chmod 0500, curdir();
--  SKIP: {
--      if (!ok(!open(FOO, ">unwritable.txt"),
--              "Testing that we aren't running as a privileged user, such as root")) {
--          close FOO;
--          skip "It's pointless to run the next test as root", 1;
--      }
--      isnt(run(app(["openssl", "rehash", curdir()])), 1,
--           'Testing rehash operations on readonly directory');
--    }
--    chmod 0700, curdir();       # make it writable again, so cleanup works
--}, create => 1, cleanup => 1;
--
- sub prepare {
-     my @pemsourcefiles = sort glob(srctop_file('test', "*.pem"));
-     my @destfiles = ();
--- 
-2.11.0
-
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-aes-asm-aes-armv4-bsaes-armv7-.pl-make-it-work-with-.patch b/meta/recipes-connectivity/openssl/openssl/0001-aes-asm-aes-armv4-bsaes-armv7-.pl-make-it-work-with-.patch
deleted file mode 100644
index bb0a1689ed5..00000000000
--- a/meta/recipes-connectivity/openssl/openssl/0001-aes-asm-aes-armv4-bsaes-armv7-.pl-make-it-work-with-.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From bcc096a50811bf0f0c4fd34b2993fed7a7015972 Mon Sep 17 00:00:00 2001
-From: Andy Polyakov <appro@openssl.org>
-Date: Fri, 3 Nov 2017 23:30:01 +0100
-Subject: [PATCH] aes/asm/{aes-armv4|bsaes-armv7}.pl: make it work with
- binutils-2.29.
-
-It's not clear if it's a feature or bug, but binutils-2.29[.1]
-interprets 'adr' instruction with Thumb2 code reference differently,
-in a way that affects calculation of addresses of constants' tables.
-
-Upstream-Status: Backport
-
-Reviewed-by: Tim Hudson <tjh@openssl.org>
-Reviewed-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
-Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
-(Merged from https://github.com/openssl/openssl/pull/4669)
-
-(cherry picked from commit b82acc3c1a7f304c9df31841753a0fa76b5b3cda)
----
- crypto/aes/asm/aes-armv4.pl   | 6 +++---
- crypto/aes/asm/bsaes-armv7.pl | 6 +++---
- 2 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/crypto/aes/asm/aes-armv4.pl b/crypto/aes/asm/aes-armv4.pl
-index 16d79aae53..c6474b8aad 100644
---- a/crypto/aes/asm/aes-armv4.pl
-+++ b/crypto/aes/asm/aes-armv4.pl
-@@ -200,7 +200,7 @@ AES_encrypt:
- #ifndef	__thumb2__
- 	sub	r3,pc,#8		@ AES_encrypt
- #else
--	adr	r3,AES_encrypt
-+	adr	r3,.
- #endif
- 	stmdb   sp!,{r1,r4-r12,lr}
- #ifdef	__APPLE__
-@@ -450,7 +450,7 @@ _armv4_AES_set_encrypt_key:
- #ifndef	__thumb2__
- 	sub	r3,pc,#8		@ AES_set_encrypt_key
- #else
--	adr	r3,AES_set_encrypt_key
-+	adr	r3,.
- #endif
- 	teq	r0,#0
- #ifdef	__thumb2__
-@@ -976,7 +976,7 @@ AES_decrypt:
- #ifndef	__thumb2__
- 	sub	r3,pc,#8		@ AES_decrypt
- #else
--	adr	r3,AES_decrypt
-+	adr	r3,.
- #endif
- 	stmdb   sp!,{r1,r4-r12,lr}
- #ifdef	__APPLE__
-diff --git a/crypto/aes/asm/bsaes-armv7.pl b/crypto/aes/asm/bsaes-armv7.pl
-index 9f288660ef..a27bb4a179 100644
---- a/crypto/aes/asm/bsaes-armv7.pl
-+++ b/crypto/aes/asm/bsaes-armv7.pl
-@@ -744,7 +744,7 @@ $code.=<<___;
- .type	_bsaes_decrypt8,%function
- .align	4
- _bsaes_decrypt8:
--	adr	$const,_bsaes_decrypt8
-+	adr	$const,.
- 	vldmia	$key!, {@XMM[9]}		@ round 0 key
- #ifdef	__APPLE__
- 	adr	$const,.LM0ISR
-@@ -843,7 +843,7 @@ _bsaes_const:
- .type	_bsaes_encrypt8,%function
- .align	4
- _bsaes_encrypt8:
--	adr	$const,_bsaes_encrypt8
-+	adr	$const,.
- 	vldmia	$key!, {@XMM[9]}		@ round 0 key
- #ifdef	__APPLE__
- 	adr	$const,.LM0SR
-@@ -951,7 +951,7 @@ $code.=<<___;
- .type	_bsaes_key_convert,%function
- .align	4
- _bsaes_key_convert:
--	adr	$const,_bsaes_key_convert
-+	adr	$const,.
- 	vld1.8	{@XMM[7]},  [$inp]!		@ load round 0 key
- #ifdef	__APPLE__
- 	adr	$const,.LM0
--- 
-2.15.0
-
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0g.bb b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
similarity index 91%
rename from meta/recipes-connectivity/openssl/openssl_1.1.0g.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
index 0fd6819fff1..94b75eb92a8 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.0g.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.0h.bb
@@ -6,20 +6,18 @@ SECTION = "libs/network"
 
 # "openssl | SSLeay" dual license
 LICENSE = "openssl"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=cae6da10f4ffd9703214776d2aabce32"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d57d511030c9d66ef5f5966bee5a7eff"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "ba5f1b8b835b88cadbce9b35ed9531a6"
-SRC_URI[sha256sum] = "de4d501267da39310905cb6dc8c6121f7a2cad45a7707f76df828fe1b85073af"
+SRC_URI[md5sum] = "5271477e4d93f4ea032b665ef095ff24"
+SRC_URI[sha256sum] = "5835626cde9e99656585fc7aaa2302a73a7e1340bf8c14fd635a62c66802a517"
 
 SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
            file://openssl-c_rehash.sh \
            file://0001-Take-linking-flags-from-LDFLAGS-env-var.patch \
-           file://0001-Remove-test-that-requires-running-as-non-root.patch \
-           file://0001-aes-asm-aes-armv4-bsaes-armv7-.pl-make-it-work-with-.patch \
-          "
+           "
 
 S = "${WORKDIR}/openssl-${PV}"
 
-- 
2.16.1


