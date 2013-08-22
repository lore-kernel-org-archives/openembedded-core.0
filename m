Return-Path: <Xufeng.Zhang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CE4746AF4A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 03:11:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7M3B1xb010947
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 20:11:01 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.210) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Wed, 21 Aug 2013 20:11:00 -0700
From: Xufeng Zhang <xufeng.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Aug 2013 11:12:28 +0800
Message-ID: <1377141148-9271-1-git-send-email-xufeng.zhang@windriver.com>
X-Mailer: git-send-email 1.7.0.2
MIME-Version: 1.0
Subject: [PATCH v2] openssl: avoid NULL pointer dereference in three places
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
X-List-Received-Date: Thu, 22 Aug 2013 03:11:02 -0000
Content-Type: text/plain

There are three potential NULL pointer dereference in
EVP_DigestInit_ex(), dh_pub_encode() and dsa_pub_encode()
functions.
Fix them by adding proper null pointer check.

[YOCTO #4600]
[ CQID: WIND00373257 ]

Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
---
Changes in V2:
- Added Upstream-Status and SOB tags into every patch.
- Remove INC_PR bump.

 ...-pointer-dereference-in-EVP_DigestInit_ex.patch |   21 +++++++++++
 ...NULL-pointer-dereference-in-dh_pub_encode.patch |   39 ++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.1e.bb |    2 +
 3 files changed, 62 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
new file mode 100644
index 0000000..c161e62
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
@@ -0,0 +1,21 @@
+openssl: avoid NULL pointer dereference in EVP_DigestInit_ex()
+
+We should avoid accessing the type pointer if it's NULL,
+this could happen if ctx->digest is not NULL.
+
+Upstream-Status: Submitted
+http://www.mail-archive.com/openssl-dev@openssl.org/msg32860.html
+
+Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
+---
+--- a/crypto/evp/digest.c
++++ b/crypto/evp/digest.c
+@@ -199,7 +199,7 @@
+ 		return 0;
+ 		}
+ #endif
+-	if (ctx->digest != type)
++	if (type && (ctx->digest != type))
+ 		{
+ 		if (ctx->digest && ctx->digest->ctx_size)
+ 			OPENSSL_free(ctx->md_data);
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch
new file mode 100644
index 0000000..3e93fe4
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1e/openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch
@@ -0,0 +1,39 @@
+openssl: avoid NULL pointer dereference in dh_pub_encode()/dsa_pub_encode()
+
+We should avoid accessing the pointer if ASN1_STRING_new()
+allocates memory failed.
+
+Upstream-Status: Submitted
+http://www.mail-archive.com/openssl-dev@openssl.org/msg32859.html
+
+Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
+---
+--- a/crypto/dh/dh_ameth.c
++++ b/crypto/dh/dh_ameth.c
+@@ -139,6 +139,12 @@
+ 	dh=pkey->pkey.dh;
+ 
+ 	str = ASN1_STRING_new();
++	if (!str)
++		{
++		DHerr(DH_F_DH_PUB_ENCODE, ERR_R_MALLOC_FAILURE);
++		goto err;
++		}
++
+ 	str->length = i2d_DHparams(dh, &str->data);
+ 	if (str->length <= 0)
+ 		{
+--- a/crypto/dsa/dsa_ameth.c
++++ b/crypto/dsa/dsa_ameth.c
+@@ -148,6 +148,11 @@
+ 		{
+ 		ASN1_STRING *str;
+ 		str = ASN1_STRING_new();
++		if (!str)
++			{
++			DSAerr(DSA_F_DSA_PUB_ENCODE, ERR_R_MALLOC_FAILURE);
++			goto err;
++			}
+ 		str->length = i2d_DSAparams(dsa, &str->data);
+ 		if (str->length <= 0)
+ 			{
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
index bd6fd04..ac27dba 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
@@ -31,6 +31,8 @@ SRC_URI += "file://configure-targets.patch \
             file://openssl_fix_for_x32.patch \
             file://openssl-fix-doc.patch \
             file://fix-cipher-des-ede3-cfb1.patch \
+            file://openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch \
+            file://openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch \
             file://find.pl \
            "
 
-- 
1.7.1


