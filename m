Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0645874506
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2018 14:25:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w3IEPOEQ023467
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 18 Apr 2018 07:25:24 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 18 Apr 2018 07:25:23 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Apr 2018 22:32:54 +0800
Message-ID: <1524061974-26633-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1524037571-3202-1-git-send-email-hongxu.jia@windriver.com>
References: <1524037571-3202-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2] openssh: disable ciphers not supported by OpenSSL DES
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
X-List-Received-Date: Wed, 18 Apr 2018 14:25:24 -0000
Content-Type: text/plain

While compiling openssl with option `no-des', it caused the openssh
build failure
...
cipher.c:85:41: error: 'EVP_des_ede3_cbc' undeclared here (not in a function);
...

OpenSSL configured that way defines OPENSSL_NO_DES to disable des

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...able-ciphers-not-supported-by-OpenSSL-DES.patch | 39 ++++++++++++++++++++++
 meta/recipes-connectivity/openssh/openssh_7.6p1.bb |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/disable-ciphers-not-supported-by-OpenSSL-DES.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/disable-ciphers-not-supported-by-OpenSSL-DES.patch b/meta/recipes-connectivity/openssh/openssh/disable-ciphers-not-supported-by-OpenSSL-DES.patch
new file mode 100644
index 0000000..8a2d1a0
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/disable-ciphers-not-supported-by-OpenSSL-DES.patch
@@ -0,0 +1,39 @@
+From 265eaab8b39d8d8721224a48eefed5bf1696d353 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 18 Apr 2018 21:58:32 +0800
+Subject: [PATCH] disable ciphers not supported by OpenSSL DES
+
+While compiling openssl with option `no-des', it caused the openssh
+build failure
+...
+cipher.c:85:41: error: 'EVP_des_ede3_cbc' undeclared here (not in a function);
+...
+
+OpenSSL configured that way defines OPENSSL_NO_DES to disable des
+
+Suggested by dtucker@
+
+Upstream-Status: Submitted [openssh-unix-dev@mindrot.org]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ cipher.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/cipher.c b/cipher.c
+index c3cd5dc..86558e1 100644
+--- a/cipher.c
++++ b/cipher.c
+@@ -82,7 +82,9 @@ struct sshcipher {
+ 
+ static const struct sshcipher ciphers[] = {
+ #ifdef WITH_OPENSSL
++#ifndef OPENSSL_NO_DES
+ 	{ "3des-cbc",		8, 24, 0, 0, CFLAG_CBC, EVP_des_ede3_cbc },
++#endif
+ 	{ "aes128-cbc",		16, 16, 0, 0, CFLAG_CBC, EVP_aes_128_cbc },
+ 	{ "aes192-cbc",		16, 24, 0, 0, CFLAG_CBC, EVP_aes_192_cbc },
+ 	{ "aes256-cbc",		16, 32, 0, 0, CFLAG_CBC, EVP_aes_256_cbc },
+-- 
+2.7.4
+
diff --git a/meta/recipes-connectivity/openssh/openssh_7.6p1.bb b/meta/recipes-connectivity/openssh/openssh_7.6p1.bb
index a2288df..e11e8d7 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.6p1.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
+           file://disable-ciphers-not-supported-by-OpenSSL-DES.patch \
            "
 
 PAM_SRC_URI = "file://sshd"
-- 
2.7.4


