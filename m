Return-Path: <Haiqing.Bai@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4DE2A6FEFA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Apr 2016 03:28:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u353SEqZ001796
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2016 20:28:15 -0700
Received: from pek-lpgtest5.wrs.com (128.224.153.85) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 4 Apr 2016 20:28:14 -0700
From: Haiqing Bai <Haiqing.Bai@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Apr 2016 11:27:02 +0800
Message-ID: <1459826822-13791-1-git-send-email-Haiqing.Bai@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] Make conditional compile for DES related code in python-m2crypto.
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
X-List-Received-Date: Tue, 05 Apr 2016 03:28:16 -0000
Content-Type: text/plain

The source code in python-m2crypto don't check whether the depended
DES cipher has been disabled in openssl or not, this fix added the
checking.

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
---
 .../conditional-compile-DES-related-code.patch     | 58 ++++++++++++++++++++++
 .../python/python-m2crypto_0.21.1.bb               |  3 +-
 2 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python-m2crypto/conditional-compile-DES-related-code.patch

diff --git a/meta-python/recipes-devtools/python/python-m2crypto/conditional-compile-DES-related-code.patch b/meta-python/recipes-devtools/python/python-m2crypto/conditional-compile-DES-related-code.patch
new file mode 100644
index 0000000..e7b8f3e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-m2crypto/conditional-compile-DES-related-code.patch
@@ -0,0 +1,58 @@
+From 85dbf29dcc3786ed101278721d60cc3bc4c182bc Mon Sep 17 00:00:00 2001
+From: Haiqing Bai <Haiqing.Bai@windriver.com>
+Date: Fri, 1 Apr 2016 14:44:33 +0800
+Subject: [PATCH] conditional compile DES related code.
+
+---
+ SWIG/_evp.i       | 2 ++
+ tests/test_evp.py | 4 ++++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/SWIG/_evp.i b/SWIG/_evp.i
+index 0593eed..f3156af 100644
+--- a/SWIG/_evp.i
++++ b/SWIG/_evp.i
+@@ -49,6 +49,7 @@ extern const EVP_MD *EVP_sha512(void);
+ %rename(digest_init) EVP_DigestInit;
+ extern int EVP_DigestInit(EVP_MD_CTX *, const EVP_MD *);
+
++#ifndef OPENSSL_NO_DES
+ %rename(des_ecb) EVP_des_ecb;
+ extern const EVP_CIPHER *EVP_des_ecb(void);
+ %rename(des_ede_ecb) EVP_des_ede;
+@@ -73,6 +74,7 @@ extern const EVP_CIPHER *EVP_des_ofb(void);
+ extern const EVP_CIPHER *EVP_des_ede_ofb(void);
+ %rename(des_ede3_ofb) EVP_des_ede3_ofb;
+ extern const EVP_CIPHER *EVP_des_ede3_ofb(void);
++#endif
+ %rename(bf_ecb) EVP_bf_ecb;
+ extern const EVP_CIPHER *EVP_bf_ecb(void);
+ %rename(bf_cbc) EVP_bf_cbc;
+diff --git a/tests/test_evp.py b/tests/test_evp.py
+index ba09092..8b7fb21 100644
+--- a/tests/test_evp.py
++++ b/tests/test_evp.py
+@@ -213,8 +213,10 @@ class CipherTestCase(unittest.TestCase):
+
+     def test_ciphers(self):
+         ciphers=[
++#ifndef OPENSSL_NO_DES
+             'des_ede_ecb', 'des_ede_cbc', 'des_ede_cfb', 'des_ede_ofb',
+             'des_ede3_ecb', 'des_ede3_cbc', 'des_ede3_cfb', 'des_ede3_ofb',
++#endif
+             'aes_128_ecb', 'aes_128_cbc', 'aes_128_cfb', 'aes_128_ofb',
+             'aes_192_ecb', 'aes_192_cbc', 'aes_192_cfb', 'aes_192_ofb',
+             'aes_256_ecb', 'aes_256_cbc', 'aes_256_cfb', 'aes_256_ofb']
+@@ -222,7 +224,9 @@ class CipherTestCase(unittest.TestCase):
+                          #'idea_ecb', 'idea_cbc', 'idea_cfb', 'idea_ofb',
+                          'cast5_ecb', 'cast5_cbc', 'cast5_cfb', 'cast5_ofb',
+                          #'rc5_ecb', 'rc5_cbc', 'rc5_cfb', 'rc5_ofb',
++#ifndef OPENSSL_NO_DES
+                          'des_ecb', 'des_cbc', 'des_cfb', 'des_ofb',
++#endif
+                          'rc4', 'rc2_40_cbc']
+         if not fips_mode: # Disabled algorithms
+             ciphers += nonfips_ciphers
+--
+1.9.1
+
diff --git a/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb b/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
index a3f9a09..a1b0a4c 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
+++ b/meta-python/recipes-devtools/python/python-m2crypto_0.21.1.bb
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=b0e1f0b7d0ce8a62c18b1287b991800e"
 
 SRC_URI = " \
            file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch \
-           file://0001-M2Crypto-Error-fix.patch"
+           file://0001-M2Crypto-Error-fix.patch \
+           file://conditional-compile-DES-related-code.patch"
 
 SRC_URI[md5sum] = "f93d8462ff7646397a9f77a2fe602d17"
 SRC_URI[sha256sum] = "25b94498505c2d800ee465db0cc1aff097b1615adc3ac042a1c85ceca264fc0a"
-- 
1.9.1


