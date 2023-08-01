Return-Path: <narpat.mali@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 225A7C0015E
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 16:06:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.17070.1690905975719877323
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 09:06:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hC9x/bRA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75774bb12a=narpat.mali@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 371CdW8E009349
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Aug 2023 09:06:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=1vUor
	1btaXvCWJu2SQ+MbcNu4esTGIsbK1guqV5XHlU=; b=hC9x/bRAGqia0VhbJSfVL
	19CuwGK/aCZsb5KdpUeq+E96DZzyoU49yV3hc7RF9X93qMqZl+22ciNNayW4jiwS
	MZEHVfid6gSZ6JGcQVG69cLKeWM9Vy/VM9705ok83z3vaQz1srpJrNJ48/LaJiH/
	plLgwRDEGg7qrHHx5Z6tAHcMcz+FebiRoTSyuKJ2ueFfcbo6LdK88C8HX6UWzOHG
	r6WH8We94bJq9SF1nuRadmF19PEVwMX0r/i9PnhmYwMqr4DdH0ctFe3eJ/yQxcDV
	G3uZRP8d0XlZbHSpEQ0NLsxIkz1bbLAkS4YkNs2zfUMUl53cuO71MSEgbAgGS046
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s6daqs845-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 09:06:15 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 1 Aug 2023 09:06:13 -0700
From: nmali <narpat.mali@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>
Subject: [OE-core][kirkstone][PATCH 1/1] openssl: fix for CVE-2023-2975 & CVE-2023-3446
Date: Tue, 1 Aug 2023 16:05:55 +0000
Message-ID: <20230801160555.1469395-1-narpat.mali@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: oox3z6bKDz2obxDMBhm1Yi49AeQpFTbj
X-Proofpoint-GUID: oox3z6bKDz2obxDMBhm1Yi49AeQpFTbj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-01_13,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 malwarescore=0 clxscore=1011 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308010145
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 16:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185254

From: Narpat Mali <narpat.mali@windriver.com>

CVE-2023-2975: AES-SIV implementation ignores empty associated data entries
https://nvd.nist.gov/vuln/detail/CVE-2023-2975

CVE-2023-3446: Excessive time spent checking DH keys and parameters
https://nvd.nist.gov/vuln/detail/CVE-2023-3446

Have also tested openssl ptest with both the CVE patches and it has been
successfully passed.

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 .../openssl/openssl/CVE-2023-2975.patch       | 62 +++++++++++++++
 .../openssl/openssl/CVE-2023-3446.patch       | 79 +++++++++++++++++++
 .../openssl/openssl_3.0.9.bb                  |  2 +
 3 files changed, 143 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-2975.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-3446.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-2975.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2023-2975.patch
new file mode 100644
index 0000000000..b1c72de111
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-2975.patch
@@ -0,0 +1,62 @@
+From 00e2f5eea29994d19293ec4e8c8775ba73678598 Mon Sep 17 00:00:00 2001
+From: Tomas Mraz <tomas@openssl.org>
+Date: Tue, 4 Jul 2023 17:30:35 +0200
+Subject: [PATCH] Do not ignore empty associated data with AES-SIV mode
+
+The AES-SIV mode allows for multiple associated data items
+authenticated separately with any of these being 0 length.
+
+The provided implementation ignores such empty associated data
+which is incorrect in regards to the RFC 5297 and is also
+a security issue because such empty associated data then become
+unauthenticated if an application expects to authenticate them.
+
+Fixes CVE-2023-2975
+
+Reviewed-by: Matt Caswell <matt@openssl.org>
+Reviewed-by: Paul Dale <pauli@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/21384)
+
+(cherry picked from commit c426c281cfc23ab182f7d7d7a35229e7db1494d9)
+
+CVE: CVE-2023-2975
+
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/00e2f5eea29994d19293ec4e8c8775ba73678598]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ .../implementations/ciphers/cipher_aes_siv.c   | 18 +++++++++++-------
+ 1 file changed, 11 insertions(+), 7 deletions(-)
+
+diff --git a/providers/implementations/ciphers/cipher_aes_siv.c b/providers/implementations/ciphers/cipher_aes_siv.c
+index 45010b90db..b396c8651a 100644
+--- a/providers/implementations/ciphers/cipher_aes_siv.c
++++ b/providers/implementations/ciphers/cipher_aes_siv.c
+@@ -120,14 +120,18 @@ static int siv_cipher(void *vctx, unsigned char *out, size_t *outl,
+     if (!ossl_prov_is_running())
+         return 0;
+
+-    if (inl == 0) {
+-        *outl = 0;
+-        return 1;
+-    }
++    /* Ignore just empty encryption/decryption call and not AAD. */
++    if (out != NULL) {
++        if (inl == 0) {
++            if (outl != NULL)
++                *outl = 0;
++            return 1;
++        }
+
+-    if (outsize < inl) {
+-        ERR_raise(ERR_LIB_PROV, PROV_R_OUTPUT_BUFFER_TOO_SMALL);
+-        return 0;
++        if (outsize < inl) {
++            ERR_raise(ERR_LIB_PROV, PROV_R_OUTPUT_BUFFER_TOO_SMALL);
++            return 0;
++        }
+     }
+
+     if (ctx->hw->cipher(ctx, out, in, inl) <= 0)
+--
+2.40.0
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-3446.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2023-3446.patch
new file mode 100644
index 0000000000..c34b19a649
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-3446.patch
@@ -0,0 +1,79 @@
+From 1fa20cf2f506113c761777127a38bce5068740eb Mon Sep 17 00:00:00 2001
+From: Matt Caswell <matt@openssl.org>
+Date: Thu, 6 Jul 2023 16:36:35 +0100
+Subject: [PATCH] Fix DH_check() excessive time with over sized modulus
+
+The DH_check() function checks numerous aspects of the key or parameters
+that have been supplied. Some of those checks use the supplied modulus
+value even if it is excessively large.
+
+There is already a maximum DH modulus size (10,000 bits) over which
+OpenSSL will not generate or derive keys. DH_check() will however still
+perform various tests for validity on such a large modulus. We introduce a
+new maximum (32,768) over which DH_check() will just fail.
+
+An application that calls DH_check() and supplies a key or parameters
+obtained from an untrusted source could be vulnerable to a Denial of
+Service attack.
+
+The function DH_check() is itself called by a number of other OpenSSL
+functions. An application calling any of those other functions may
+similarly be affected. The other functions affected by this are
+DH_check_ex() and EVP_PKEY_param_check().
+
+CVE-2023-3446
+
+Reviewed-by: Paul Dale <pauli@openssl.org>
+Reviewed-by: Tom Cosgrove <tom.cosgrove@arm.com>
+Reviewed-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/21451)
+
+(cherry picked from commit 9e0094e2aa1b3428a12d5095132f133c078d3c3d)
+
+CVE: CVE-2023-3446
+
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/1fa20cf2f506113c761777127a38bce5068740eb]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ crypto/dh/dh_check.c | 6 ++++++
+ include/openssl/dh.h | 6 +++++-
+ 2 files changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/crypto/dh/dh_check.c b/crypto/dh/dh_check.c
+index 0b391910d6..84a926998e 100644
+--- a/crypto/dh/dh_check.c
++++ b/crypto/dh/dh_check.c
+@@ -152,6 +152,12 @@ int DH_check(const DH *dh, int *ret)
+     if (nid != NID_undef)
+         return 1;
+
++    /* Don't do any checks at all with an excessively large modulus */
++    if (BN_num_bits(dh->params.p) > OPENSSL_DH_CHECK_MAX_MODULUS_BITS) {
++        ERR_raise(ERR_LIB_DH, DH_R_MODULUS_TOO_LARGE);
++        return 0;
++    }
++
+     if (!DH_check_params(dh, ret))
+         return 0;
+
+diff --git a/include/openssl/dh.h b/include/openssl/dh.h
+index b97871eca7..36420f51d8 100644
+--- a/include/openssl/dh.h
++++ b/include/openssl/dh.h
+@@ -89,7 +89,11 @@ int EVP_PKEY_CTX_get0_dh_kdf_ukm(EVP_PKEY_CTX *ctx, unsigned char **ukm);
+ #  include <openssl/dherr.h>
+
+ #  ifndef OPENSSL_DH_MAX_MODULUS_BITS
+-#   define OPENSSL_DH_MAX_MODULUS_BITS    10000
++#   define OPENSSL_DH_MAX_MODULUS_BITS        10000
++#  endif
++
++#  ifndef OPENSSL_DH_CHECK_MAX_MODULUS_BITS
++#   define OPENSSL_DH_CHECK_MAX_MODULUS_BITS  32768
+ #  endif
+
+ #  define OPENSSL_DH_FIPS_MIN_MODULUS_BITS 1024
+--
+2.40.0
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.9.bb b/meta/recipes-connectivity/openssl/openssl_3.0.9.bb
index 849bd7e5a6..82e393da4b 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.9.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.9.bb
@@ -12,6 +12,8 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
+           file://CVE-2023-2975.patch \
+           file://CVE-2023-3446.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.40.0


