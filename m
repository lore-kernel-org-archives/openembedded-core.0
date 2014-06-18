Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AD9086FFA1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jun 2014 09:41:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5I9fXfh016709
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jun 2014 02:41:33 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 18 Jun 2014 02:41:33 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Jun 2014 05:41:30 -0400
Message-ID: <1403084491-1614-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [PATCH 1/2] nss-3.15.1: fix CVE-2013-1739
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
X-List-Received-Date: Wed, 18 Jun 2014 09:41:42 -0000
Content-Type: text/plain

From: yzhu1 <yanjun.zhu@windriver.com>

Mozilla Network Security Services (NSS) before 3.15.2 does
not ensure that data structures are initialized before
read operations, which allows remote attackers to cause a
denial of service or possibly have unspecified other
impact via vectors that trigger a decryption failure.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-1739
Signed-off-by: yzhu1 <yanjun.zhu@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../nss/files/nss-3.15.1-fix-CVE-2013-1739.patch   | 81 ++++++++++++++++++++++
 meta/recipes-support/nss/nss.inc                   |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-support/nss/files/nss-3.15.1-fix-CVE-2013-1739.patch

diff --git a/meta/recipes-support/nss/files/nss-3.15.1-fix-CVE-2013-1739.patch b/meta/recipes-support/nss/files/nss-3.15.1-fix-CVE-2013-1739.patch
new file mode 100644
index 0000000..1a159c3
--- /dev/null
+++ b/meta/recipes-support/nss/files/nss-3.15.1-fix-CVE-2013-1739.patch
@@ -0,0 +1,81 @@
+Upstream-Status: Backport
+Signed-off-by: yzhu1 <yanjun.zhu@windriver.com>
+
+--- a/nss/lib/ssl/ssl3con.c
++++ b/nss/lib/ssl/ssl3con.c
+@@ -10509,7 +10509,7 @@ ssl_RemoveSSLv3CBCPadding(sslBuffer *pla
+     /* SSLv3 padding bytes are random and cannot be checked. */
+     t = plaintext->len;
+     t -= paddingLength+overhead;
+-    /* If len >= padding_length+overhead then the MSB of t is zero. */
++    /* If len >= paddingLength+overhead then the MSB of t is zero. */
+     good = DUPLICATE_MSB_TO_ALL(~t);
+     /* SSLv3 requires that the padding is minimal. */
+     t = blockSize - (paddingLength+1);
+@@ -10742,7 +10742,7 @@ ssl3_HandleRecord(sslSocket *ss, SSL3Cip
+ 	}
+     }
+ 
+-    good = (unsigned)-1;
++    good = ~0U;
+     minLength = crSpec->mac_size;
+     if (cipher_def->type == type_block) {
+ 	/* CBC records have a padding length byte at the end. */
+@@ -10756,14 +10756,7 @@ ssl3_HandleRecord(sslSocket *ss, SSL3Cip
+     /* We can perform this test in variable time because the record's total
+      * length and the ciphersuite are both public knowledge. */
+     if (cText->buf->len < minLength) {
+-	SSL_DBG(("%d: SSL3[%d]: HandleRecord, record too small.",
+-		 SSL_GETPID(), ss->fd));
+-	/* must not hold spec lock when calling SSL3_SendAlert. */
+-	ssl_ReleaseSpecReadLock(ss);
+-	SSL3_SendAlert(ss, alert_fatal, bad_record_mac);
+-	/* always log mac error, in case attacker can read server logs. */
+-	PORT_SetError(SSL_ERROR_BAD_MAC_READ);
+-	return SECFailure;
++	goto decrypt_loser;
+     }
+ 
+     if (cipher_def->type == type_block &&
+@@ -10831,11 +10824,18 @@ ssl3_HandleRecord(sslSocket *ss, SSL3Cip
+ 	return SECFailure;
+     }
+ 
++    if (cipher_def->type == type_block &&
++	((cText->buf->len - ivLen) % cipher_def->block_size) != 0) {
++	goto decrypt_loser;
++    }
++
+     /* decrypt from cText buf to plaintext. */
+     rv = crSpec->decode(
+ 	crSpec->decodeContext, plaintext->buf, (int *)&plaintext->len,
+ 	plaintext->space, cText->buf->buf + ivLen, cText->buf->len - ivLen);
+-    good &= SECStatusToMask(rv);
++    if (rv != SECSuccess) {
++	goto decrypt_loser;
++    }
+ 
+     PRINT_BUF(80, (ss, "cleartext:", plaintext->buf, plaintext->len));
+ 
+@@ -10843,7 +10843,7 @@ ssl3_HandleRecord(sslSocket *ss, SSL3Cip
+ 
+     /* If it's a block cipher, check and strip the padding. */
+     if (cipher_def->type == type_block) {
+-	const unsigned int blockSize = cipher_def->iv_size;
++	const unsigned int blockSize = cipher_def->block_size;
+ 	const unsigned int macSize = crSpec->mac_size;
+ 
+ 	if (crSpec->version <= SSL_LIBRARY_VERSION_3_0) {
+@@ -10899,10 +10899,11 @@ ssl3_HandleRecord(sslSocket *ss, SSL3Cip
+     }
+ 
+     if (good == 0) {
++decrypt_loser:
+ 	/* must not hold spec lock when calling SSL3_SendAlert. */
+ 	ssl_ReleaseSpecReadLock(ss);
+ 
+-	SSL_DBG(("%d: SSL3[%d]: mac check failed", SSL_GETPID(), ss->fd));
++	SSL_DBG(("%d: SSL3[%d]: decryption failed", SSL_GETPID(), ss->fd));
+ 
+ 	if (!IS_DTLS(ss)) {
+ 	    SSL3_SendAlert(ss, alert_fatal, bad_record_mac);
diff --git a/meta/recipes-support/nss/nss.inc b/meta/recipes-support/nss/nss.inc
index 5afd639..cc9e7b9 100644
--- a/meta/recipes-support/nss/nss.inc
+++ b/meta/recipes-support/nss/nss.inc
@@ -20,6 +20,7 @@ SRC_URI = "\
     file://nss-3.15.1-fix-CVE-2013-5605.patch \
     file://nss-CVE-2014-1492.patch \
     file://nss-CVE-2013-1740.patch \
+    file://nss-3.15.1-fix-CVE-2013-1739.patch \
 "
 SRC_URI_append_class-target = "\
     file://nss.pc.in \
-- 
2.0.0


