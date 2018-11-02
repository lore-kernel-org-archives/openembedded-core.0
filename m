Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5F48B79F21
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 08:51:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wA28p6pZ024022
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Nov 2018 01:51:06 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Fri, 2 Nov 2018 01:51:05 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Nov 2018 16:02:14 +0800
Message-ID: <65046ca9708330bafc42d6151591caf311286218.1541145029.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1541145029.git.kai.kang@windriver.com>
References: <cover.1541145029.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] openssl: fix CVE-2018-0735 for 1.1.1
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
X-List-Received-Date: Fri, 02 Nov 2018 08:51:05 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix CVE-2018-0735 for openssl 1.1.1.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../openssl/0003-fix-CVE-2018-0735.patch      | 50 +++++++++++++++++++
 .../openssl/openssl_1.1.1.bb                  |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0003-fix-CVE-2018-0735.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0003-fix-CVE-2018-0735.patch b/meta/recipes-connectivity/openssl/openssl/0003-fix-CVE-2018-0735.patch
new file mode 100644
index 0000000000..736323f0ce
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0003-fix-CVE-2018-0735.patch
@@ -0,0 +1,50 @@
+CVE: CVE-2018-0735
+
+Upstream-Status: Backport
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From b1d6d55ece1c26fa2829e2b819b038d7b6d692b4 Mon Sep 17 00:00:00 2001
+From: Pauli <paul.dale@oracle.com>
+Date: Fri, 26 Oct 2018 10:54:58 +1000
+Subject: [PATCH] Timing vulnerability in ECDSA signature generation
+ (CVE-2018-0735)
+
+Preallocate an extra limb for some of the big numbers to avoid a reallocation
+that can potentially provide a side channel.
+
+Reviewed-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
+(Merged from https://github.com/openssl/openssl/pull/7486)
+
+(cherry picked from commit 99540ec79491f59ed8b46b4edf130e17dc907f52)
+---
+ crypto/ec/ec_mult.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/crypto/ec/ec_mult.c b/crypto/ec/ec_mult.c
+index 7e1b3650e7..0e0a5e1394 100644
+--- a/crypto/ec/ec_mult.c
++++ b/crypto/ec/ec_mult.c
+@@ -206,8 +206,8 @@ int ec_scalar_mul_ladder(const EC_GROUP *group, EC_POINT *r,
+      */
+     cardinality_bits = BN_num_bits(cardinality);
+     group_top = bn_get_top(cardinality);
+-    if ((bn_wexpand(k, group_top + 1) == NULL)
+-        || (bn_wexpand(lambda, group_top + 1) == NULL)) {
++    if ((bn_wexpand(k, group_top + 2) == NULL)
++        || (bn_wexpand(lambda, group_top + 2) == NULL)) {
+         ECerr(EC_F_EC_SCALAR_MUL_LADDER, ERR_R_BN_LIB);
+         goto err;
+     }
+@@ -244,7 +244,7 @@ int ec_scalar_mul_ladder(const EC_GROUP *group, EC_POINT *r,
+      * k := scalar + 2*cardinality
+      */
+     kbit = BN_is_bit_set(lambda, cardinality_bits);
+-    BN_consttime_swap(kbit, k, lambda, group_top + 1);
++    BN_consttime_swap(kbit, k, lambda, group_top + 2);
+ 
+     group_top = bn_get_top(group->field);
+     if ((bn_wexpand(s->X, group_top) == NULL)
+-- 
+2.17.0
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
index 052f246aad..b44089e82e 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://openssl-c_rehash.sh \
            file://0001-skip-test_symbol_presence.patch \
            file://0002-fix-CVE-2018-0734.patch \
+           file://0003-fix-CVE-2018-0735.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
-- 
2.18.0


