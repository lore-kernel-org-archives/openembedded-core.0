Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CC0EA79F37
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 08:51:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wA28oEWV031058
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Nov 2018 01:51:05 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Fri, 2 Nov 2018 01:51:00 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Nov 2018 16:02:13 +0800
Message-ID: <dcfd31c066d66101f047d3d8cc052f2e74ab53ab.1541145029.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1541145029.git.kai.kang@windriver.com>
References: <cover.1541145029.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] openssl: fix CVE-2018-0734 for both 1.0.2p and 1.1.1
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
X-List-Received-Date: Fri, 02 Nov 2018 08:51:13 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Backport patches to fix CVE-2018-0734 for both openssl 1.0.2p and 1.1.1
versions.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../openssl/0002-fix-CVE-2018-0734.patch      | 108 ++++++++++++++++++
 .../openssl10/0001-fix-CVE-2018-0734.patch    |  33 ++++++
 .../openssl/openssl10_1.0.2p.bb               |   1 +
 .../openssl/openssl_1.1.1.bb                  |   1 +
 4 files changed, 143 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0002-fix-CVE-2018-0734.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl10/0001-fix-CVE-2018-0734.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0002-fix-CVE-2018-0734.patch b/meta/recipes-connectivity/openssl/openssl/0002-fix-CVE-2018-0734.patch
new file mode 100644
index 0000000000..2a3e03fe2a
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0002-fix-CVE-2018-0734.patch
@@ -0,0 +1,108 @@
+Backport patch to fix CVE-2018-0734. Remove a section which only remove a
+space. It can't be applied because the context is different.
+
+CVE: CVE-2018-0734
+Upstream-Status: Backport
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 8abfe72e8c1de1b95f50aa0d9134803b4d00070f Mon Sep 17 00:00:00 2001
+From: Pauli <paul.dale@oracle.com>
+Date: Wed, 24 Oct 2018 07:42:46 +1000
+Subject: [PATCH] Timing vulnerability in DSA signature generation
+ (CVE-2018-0734).
+
+Avoid a timing attack that leaks information via a side channel that
+triggers when a BN is resized.  Increasing the size of the BNs
+prior to doing anything with them suppresses the attack.
+
+Thanks due to Samuel Weiser for finding and locating this.
+
+Reviewed-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
+(Merged from https://github.com/openssl/openssl/pull/7486)
+
+(cherry picked from commit a9cfb8c2aa7254a4aa6a1716909e3f8cb78049b6)
+---
+ crypto/dsa/dsa_ossl.c | 28 +++++++++++++++-------------
+ 1 file changed, 15 insertions(+), 13 deletions(-)
+
+diff --git a/crypto/dsa/dsa_ossl.c b/crypto/dsa/dsa_ossl.c
+index ca20811200..2dd2d7489a 100644
+--- a/crypto/dsa/dsa_ossl.c
++++ b/crypto/dsa/dsa_ossl.c
+@@ -9,6 +9,7 @@
+ 
+ #include <stdio.h>
+ #include "internal/cryptlib.h"
++#include "internal/bn_int.h"
+ #include <openssl/bn.h>
+ #include <openssl/sha.h>
+ #include "dsa_locl.h"
+@@ -180,9 +181,9 @@ static int dsa_sign_setup(DSA *dsa, BN_CTX *ctx_in,
+ {
+     BN_CTX *ctx = NULL;
+     BIGNUM *k, *kinv = NULL, *r = *rp;
+-    BIGNUM *l, *m;
++    BIGNUM *l;
+     int ret = 0;
+-    int q_bits;
++    int q_bits, q_words;
+ 
+     if (!dsa->p || !dsa->q || !dsa->g) {
+         DSAerr(DSA_F_DSA_SIGN_SETUP, DSA_R_MISSING_PARAMETERS);
+@@ -191,8 +192,7 @@ static int dsa_sign_setup(DSA *dsa, BN_CTX *ctx_in,
+ 
+     k = BN_new();
+     l = BN_new();
+-    m = BN_new();
+-    if (k == NULL || l == NULL || m == NULL)
++    if (k == NULL || l == NULL)
+         goto err;
+ 
+     if (ctx_in == NULL) {
+@@ -203,9 +203,9 @@ static int dsa_sign_setup(DSA *dsa, BN_CTX *ctx_in,
+ 
+     /* Preallocate space */
+     q_bits = BN_num_bits(dsa->q);
+-    if (!BN_set_bit(k, q_bits)
+-        || !BN_set_bit(l, q_bits)
+-        || !BN_set_bit(m, q_bits))
++    q_words = bn_get_top(dsa->q);
++    if (!bn_wexpand(k, q_words + 2)
++        || !bn_wexpand(l, q_words + 2))
+         goto err;
+ 
+     /* Get random k */
+@@ -240,14 +240,17 @@ static int dsa_sign_setup(DSA *dsa, BN_CTX *ctx_in,
+      * small timing information leakage.  We then choose the sum that is
+      * one bit longer than the modulus.
+      *
+-     * TODO: revisit the BN_copy aiming for a memory access agnostic
+-     * conditional copy.
++     * There are some concerns about the efficacy of doing this.  More
++     * specificly refer to the discussion starting with:
++     *     https://github.com/openssl/openssl/pull/7486#discussion_r228323705
++     * The fix is to rework BN so these gymnastics aren't required.
+      */
+     if (!BN_add(l, k, dsa->q)
+-        || !BN_add(m, l, dsa->q)
+-        || !BN_copy(k, BN_num_bits(l) > q_bits ? l : m))
++        || !BN_add(k, l, dsa->q))
+         goto err;
+ 
++    BN_consttime_swap(BN_is_bit_set(l, q_bits), k, l, q_words + 2);
++
+     if ((dsa)->meth->bn_mod_exp != NULL) {
+             if (!dsa->meth->bn_mod_exp(dsa, r, dsa->g, k, dsa->p, ctx,
+                                        dsa->method_mont_p))
+@@ -275,7 +278,6 @@ static int dsa_sign_setup(DSA *dsa, BN_CTX *ctx_in,
+         BN_CTX_free(ctx);
+     BN_clear_free(k);
+     BN_clear_free(l);
+-    BN_clear_free(m);
+     return ret;
+ }
+ 
+-- 
+2.17.0
+
diff --git a/meta/recipes-connectivity/openssl/openssl10/0001-fix-CVE-2018-0734.patch b/meta/recipes-connectivity/openssl/openssl10/0001-fix-CVE-2018-0734.patch
new file mode 100644
index 0000000000..b9865a69b5
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl10/0001-fix-CVE-2018-0734.patch
@@ -0,0 +1,33 @@
+CVE: CVE-2018-0734
+
+Upstream-Status: Backport
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 43e6a58d4991a451daf4891ff05a48735df871ac Mon Sep 17 00:00:00 2001
+From: Pauli <paul.dale@oracle.com>
+Date: Mon, 29 Oct 2018 08:24:22 +1000
+Subject: [PATCH] Merge DSA reallocation timing fix CVE-2018-0734.
+
+Reviewed-by: Richard Levitte <levitte@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/7513)
+---
+ crypto/dsa/dsa_ossl.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/crypto/dsa/dsa_ossl.c b/crypto/dsa/dsa_ossl.c
+index 2dcfedeeee..100e269268 100644
+--- a/crypto/dsa/dsa_ossl.c
++++ b/crypto/dsa/dsa_ossl.c
+@@ -279,7 +279,7 @@ static int dsa_sign_setup(DSA *dsa, BN_CTX *ctx_in, BIGNUM **kinvp,
+         goto err;
+ 
+     /* Preallocate space */
+-    q_bits = BN_num_bits(dsa->q);
++    q_bits = BN_num_bits(dsa->q) + sizeof(dsa->q->d[0]) * 16;
+     if (!BN_set_bit(&k, q_bits)
+         || !BN_set_bit(&l, q_bits)
+         || !BN_set_bit(&m, q_bits))
+-- 
+2.17.0
+
diff --git a/meta/recipes-connectivity/openssl/openssl10_1.0.2p.bb b/meta/recipes-connectivity/openssl/openssl10_1.0.2p.bb
index 766110958e..4325940701 100644
--- a/meta/recipes-connectivity/openssl/openssl10_1.0.2p.bb
+++ b/meta/recipes-connectivity/openssl/openssl10_1.0.2p.bb
@@ -40,6 +40,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-Fix-build-with-clang-using-external-assembler.patch \
            file://0001-openssl-force-soft-link-to-avoid-rare-race.patch \
            file://0001-allow-manpages-to-be-disabled.patch \
+           file://0001-fix-CVE-2018-0734.patch \
            "
 
 SRC_URI_append_class-target = " \
diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
index af9038abd5..052f246aad 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://run-ptest \
            file://openssl-c_rehash.sh \
            file://0001-skip-test_symbol_presence.patch \
+           file://0002-fix-CVE-2018-0734.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
-- 
2.18.0


