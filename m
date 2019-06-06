Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 05E4B7E843
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 07:54:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.63,386,1557158400"; d="scan'208";a="67886054"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Jun 2019 15:54:35 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 8CA674CDDAE4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 15:54:32 +0800 (CST)
Received: from localhost.localdomain (10.167.225.227) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 18 Jun 2019 15:54:37 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Jun 2019 11:05:05 +0800
Message-ID: <1559790305-34116-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.227]
X-yoursite-MailScanner-ID: 8CA674CDDAE4.A0A21
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH v3] openssl: Fix a build bug on aarch64BE.
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
X-List-Received-Date: Tue, 18 Jun 2019 07:54:35 -0000
Content-Type: text/plain

Fix bug as following on aarch64BE:

Error: operand 1 must be an integer register -- `rev v31.16b,v31.16b'

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 ...01-Fix-build-error-for-aarch64-big-endian.patch | 43 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.1.1c.bb |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Fix-build-error-for-aarch64-big-endian.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-error-for-aarch64-big-endian.patch b/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-error-for-aarch64-big-endian.patch
new file mode 100644
index 0000000..9a90a68
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Fix-build-error-for-aarch64-big-endian.patch
@@ -0,0 +1,43 @@
+From 1f8c0f2feea5cdcae0bcd9dfc78198d9e2c4cf09 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Thu, 13 Jun 2019 12:17:30 +0900
+Subject: [PATCH] Fix build error for aarch64 big endian.
+
+Modified rev to rev64, because rev only takes integer registers.
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=90827
+Otherwise, the following error will occur.
+
+Error: operand 1 must be an integer register -- `rev v31.16b,v31.16b'
+
+Upstream-Status: Submitted [https://github.com/openssl/openssl/pull/9151]
+
+Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+---
+ crypto/sha/asm/keccak1600-armv8.pl | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/crypto/sha/asm/keccak1600-armv8.pl b/crypto/sha/asm/keccak1600-armv8.pl
+index dc72f18..6620690 100755
+--- a/crypto/sha/asm/keccak1600-armv8.pl
++++ b/crypto/sha/asm/keccak1600-armv8.pl
+@@ -731,7 +731,7 @@ $code.=<<___;
+ 	blo	.Lprocess_block_ce
+ 	ldr	d31,[$inp],#8		// *inp++
+ #ifdef	__AARCH64EB__
+-	rev	v31.16b,v31.16b
++	rev64	v31.16b,v31.16b
+ #endif
+ 	eor	$A[$j/5][$j%5],$A[$j/5][$j%5],v31.16b
+ 	beq	.Lprocess_block_ce
+@@ -740,7 +740,7 @@ ___
+ $code.=<<___;
+ 	ldr	d31,[$inp],#8		// *inp++
+ #ifdef	__AARCH64EB__
+-	rev	v31.16b,v31.16b
++	rev64	v31.16b,v31.16b
+ #endif
+ 	eor	$A[4][4],$A[4][4],v31.16b
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
index 669b1a1..ec85ccd 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-skip-test_symbol_presence.patch \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://afalg.patch \
+           file://0001-Fix-build-error-for-aarch64-big-endian.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
-- 
2.7.4




