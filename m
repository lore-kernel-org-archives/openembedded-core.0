Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EEE9F60053
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2018 07:38:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w3I7cgFm008869
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 18 Apr 2018 00:38:42 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 18 Apr 2018 00:38:42 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Apr 2018 15:46:11 +0800
Message-ID: <1524037571-3202-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] openssh: check for OpenSSL with EVP_des_ede3_cbc
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
X-List-Received-Date: Wed, 18 Apr 2018 07:38:42 -0000
Content-Type: text/plain

While compiling openssl with option `no-des', it caused the openssh
build failure
...
cipher.c:85:41: error: 'EVP_des_ede3_cbc' undeclared here (not in a function);
...

Check for OpenSSL with EVP_des_ede3_cbc

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../openssh/check-for-openssl-with-evp_des.patch   | 67 ++++++++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_7.6p1.bb |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/check-for-openssl-with-evp_des.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/check-for-openssl-with-evp_des.patch b/meta/recipes-connectivity/openssh/openssh/check-for-openssl-with-evp_des.patch
new file mode 100644
index 0000000..1c5fa5d
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/check-for-openssl-with-evp_des.patch
@@ -0,0 +1,67 @@
+From aa943ac647e7c81345680e7050be83f0bc9deb55 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 17 Apr 2018 23:58:47 -0700
+Subject: [PATCH] configure.ac/cipher.c: Check for OpenSSL with EVP_des_ede3_cbc
+
+While compiling openssl with option `no-des', it caused the openssh
+build failure
+...
+cipher.c:85:41: error: 'EVP_des_ede3_cbc' undeclared here (not in a function);
+...
+
+Upstream-Status: Submitted [openssh-unix-dev@mindrot.org]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ cipher.c     |  2 ++
+ configure.ac | 20 ++++++++++++++++++++
+ 2 files changed, 22 insertions(+)
+
+diff --git a/cipher.c b/cipher.c
+index c3cd5dc..41dacfb 100644
+--- a/cipher.c
++++ b/cipher.c
+@@ -82,7 +82,9 @@ struct sshcipher {
+ 
+ static const struct sshcipher ciphers[] = {
+ #ifdef WITH_OPENSSL
++#ifdef OPENSSL_HAVE_DES
+ 	{ "3des-cbc",		8, 24, 0, 0, CFLAG_CBC, EVP_des_ede3_cbc },
++#endif
+ 	{ "aes128-cbc",		16, 16, 0, 0, CFLAG_CBC, EVP_aes_128_cbc },
+ 	{ "aes192-cbc",		16, 24, 0, 0, CFLAG_CBC, EVP_aes_192_cbc },
+ 	{ "aes256-cbc",		16, 32, 0, 0, CFLAG_CBC, EVP_aes_256_cbc },
+diff --git a/configure.ac b/configure.ac
+index 889f506..6c664ad 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2672,6 +2672,26 @@ if test "x$openssl" = "xyes" ; then
+ 		]
+ 	)
+ 
++	# Check for OpenSSL with EVP_des_ede3_cbc
++	AC_MSG_CHECKING([whether OpenSSL has DES support])
++	AC_LINK_IFELSE(
++		[AC_LANG_PROGRAM([[
++	#include <string.h>
++	#include <openssl/evp.h>
++	]], [[
++		exit(EVP_des_ede3_cbc() == NULL);
++	]])],
++	[
++		AC_MSG_RESULT([yes])
++		AC_DEFINE([OPENSSL_HAVE_DES], [1],
++		[libcrypto has DES support])
++	],
++	[
++		AC_MSG_RESULT([no])
++	]
++	)
++
++
+ 	# Check for OpenSSL with EVP_aes_*ctr
+ 	AC_MSG_CHECKING([whether OpenSSL has AES CTR via EVP])
+ 	AC_LINK_IFELSE(
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/openssh/openssh_7.6p1.bb b/meta/recipes-connectivity/openssh/openssh_7.6p1.bb
index a2288df..a00cc5c 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.6p1.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
+           file://check-for-openssl-with-evp_des.patch \
            "
 
 PAM_SRC_URI = "file://sshd"
-- 
2.7.4


