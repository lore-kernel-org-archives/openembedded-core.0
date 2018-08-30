Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2685A60069
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 03:34:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7U3Y3Eg031753
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 20:34:04 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 29 Aug 2018 20:34:02 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Aug 2018 20:33:58 -0700
Message-ID: <20180830033358.117202-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] openssh: update from 7.7p1 to 7.8p1
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
X-List-Received-Date: Thu, 30 Aug 2018 03:34:03 -0000
Content-Type: text/plain

Drop the disable-ciphers patch since it has been integrated:
   cec33896 Omit 3des-cbc if OpenSSL built without DES.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 ...ciphers-not-supported-by-OpenSSL-DES.patch | 39 -------------------
 .../{openssh_7.7p1.bb => openssh_7.8p1.bb}    |  5 +--
 2 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/disable-ciphers-not-supported-by-OpenSSL-DES.patch
 rename meta/recipes-connectivity/openssh/{openssh_7.7p1.bb => openssh_7.8p1.bb} (96%)

diff --git a/meta/recipes-connectivity/openssh/openssh/disable-ciphers-not-supported-by-OpenSSL-DES.patch b/meta/recipes-connectivity/openssh/openssh/disable-ciphers-not-supported-by-OpenSSL-DES.patch
deleted file mode 100644
index 8a2d1a0a7c..0000000000
--- a/meta/recipes-connectivity/openssh/openssh/disable-ciphers-not-supported-by-OpenSSL-DES.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 265eaab8b39d8d8721224a48eefed5bf1696d353 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 18 Apr 2018 21:58:32 +0800
-Subject: [PATCH] disable ciphers not supported by OpenSSL DES
-
-While compiling openssl with option `no-des', it caused the openssh
-build failure
-...
-cipher.c:85:41: error: 'EVP_des_ede3_cbc' undeclared here (not in a function);
-...
-
-OpenSSL configured that way defines OPENSSL_NO_DES to disable des
-
-Suggested by dtucker@
-
-Upstream-Status: Submitted [openssh-unix-dev@mindrot.org]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- cipher.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/cipher.c b/cipher.c
-index c3cd5dc..86558e1 100644
---- a/cipher.c
-+++ b/cipher.c
-@@ -82,7 +82,9 @@ struct sshcipher {
- 
- static const struct sshcipher ciphers[] = {
- #ifdef WITH_OPENSSL
-+#ifndef OPENSSL_NO_DES
- 	{ "3des-cbc",		8, 24, 0, 0, CFLAG_CBC, EVP_des_ede3_cbc },
-+#endif
- 	{ "aes128-cbc",		16, 16, 0, 0, CFLAG_CBC, EVP_aes_128_cbc },
- 	{ "aes192-cbc",		16, 24, 0, 0, CFLAG_CBC, EVP_aes_192_cbc },
- 	{ "aes256-cbc",		16, 32, 0, 0, CFLAG_CBC, EVP_aes_256_cbc },
--- 
-2.7.4
-
diff --git a/meta/recipes-connectivity/openssh/openssh_7.7p1.bb b/meta/recipes-connectivity/openssh/openssh_7.8p1.bb
similarity index 96%
rename from meta/recipes-connectivity/openssh/openssh_7.7p1.bb
rename to meta/recipes-connectivity/openssh/openssh_7.8p1.bb
index b3da5f6761..f4b295f2df 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.7p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.8p1.bb
@@ -25,13 +25,12 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
-           file://disable-ciphers-not-supported-by-OpenSSL-DES.patch \
            "
 
 PAM_SRC_URI = "file://sshd"
 
-SRC_URI[md5sum] = "68ba883aff6958297432e5877e9a0fe2"
-SRC_URI[sha256sum] = "d73be7e684e99efcd024be15a30bffcbe41b012b2f7b3c9084aed621775e6b8f"
+SRC_URI[md5sum] = "ce1d090fa6239fd38eb989d5e983b074"
+SRC_URI[sha256sum] = "1a484bb15152c183bb2514e112aa30dd34138c3cfb032eee5490a66c507144ca"
 
 inherit useradd update-rc.d update-alternatives systemd
 
-- 
2.17.1


