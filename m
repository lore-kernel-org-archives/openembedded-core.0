Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D169CA0EDC
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 07:46:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.17592.1755157596829919724
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Aug 2025 00:46:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=032163b29f=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57E5c7AU1033450
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 07:46:35 GMT
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48fv002vy2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 07:46:35 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 14 Aug 2025 00:46:02 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 14 Aug 2025 00:46:02 -0700
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH] openssl: fix CVE-2023-50781
Date: Thu, 14 Aug 2025 15:46:33 +0800
Message-ID: <20250814074633.2379357-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=JKQ7s9Kb c=1 sm=1 tr=0 ts=689d945b cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=bwGbKnmsAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8
 a=Ntg_Zx-WAAAA:8 a=hxKxilOPujZe-_Xou_kA:9 a=J3qhny13eix6__H1:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=nuVVIWbBudwLbAahYuja:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=RUfouJl5KNV7104ufCm4:22
X-Proofpoint-ORIG-GUID: 94qHUeImh5HTLYHOB0A1BQ2M8GDwoSMz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE0MDA2MiBTYWx0ZWRfX1Q5nYZyRem0D
 1w9F9RwZx3HCyL2sfk0YZF/QClmLbTZaYAS7xrjRvjhsPxlKBCpLhtuRe6xgKh+9DC3In7PalBv
 5+4Z5fTZuNvwW1+aH4VrAxB8T80vnAw7NvsXvD1GxCOlh7H1G7wfHwhgkTq+jRoeZxd44XR0mff
 fXLL/Vkz8JOshog9PHW09JM1TN1Gj3ZZNjb3I0HuhB+1ulu2lLs2j25BL4ejmX6E3y80m5DXxQb
 6xNLGdTxHsMCrLqukkfCL+zyJfSYGRFG4jTZ/BAjbFAmrrd+KWT/Jpg0igoXU/txErwwIn3JLvy
 oTPM1MHVPyHGl32lKlt0Ceo4lJIc83rbJJShcWstl3f1OM6YLykdp5N2gzOsWs=
X-Proofpoint-GUID: 94qHUeImh5HTLYHOB0A1BQ2M8GDwoSMz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 57E5c7AU1033450
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 07:46:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221853

From: Jiaying Song <jiaying.song.cn@windriver.com>

A flaw was found in m2crypto. This issue may allow a remote attacker to
decrypt captured messages in TLS servers that use RSA key exchanges,
which may lead to exposure of confidential or sensitive data.

The CVE-2023-50781 in M2Crypto is addressed by modifying OpenSSL because
M2Crypto relies on OpenSSL for its cryptographic operations.The issue
stems from OpenSSL=E2=80=99s RSA PKCS#1 v1.5 padding verification being
vulnerable to Bleichenbacher-type attacks.To mitigate this, OpenSSL
introduced an implicit rejection mechanism in the RSA PKCS#1 v1.5
padding.Therefore, resolving the vulnerability requires changes within
OpenSSL itself to ensure M2Crypto=E2=80=99s security.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-50781
https://github.com/openssl/openssl/pull/13817/commits
https://todo.sr.ht/~mcepl/m2crypto/342?__goaway_challenge=3Dmeta-refresh&=
__goaway_id=3D45a03d6accb7b343867110db1f7fb334

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 .../openssl/openssl/CVE-2023-50781-1.patch    | 618 ++++++++++++++++++
 .../openssl/openssl/CVE-2023-50781-2.patch    | 358 ++++++++++
 .../openssl/openssl/CVE-2023-50781-3.patch    |  41 ++
 .../openssl/openssl_3.0.17.bb                 |   3 +
 4 files changed, 1020 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-50=
781-1.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-50=
781-2.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-50=
781-3.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-1.p=
atch b/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-1.patch
new file mode 100644
index 0000000000..234fe7b8aa
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-1.patch
@@ -0,0 +1,618 @@
+From 24734088e1034392de981151dfe57e3a379ada18 Mon Sep 17 00:00:00 2001
+From: Hubert Kario <hkario@redhat.com>
+Date: Tue, 15 Mar 2022 13:58:08 +0100
+Subject: [PATCH 1/3] rsa: add implicit rejection in PKCS#1 v1.5
+
+The RSA decryption as implemented before required very careful handling
+of both the exit code returned by OpenSSL and the potentially returned
+ciphertext. Looking at the recent security vulnerabilities
+(CVE-2020-25659 and CVE-2020-25657) it is unlikely that most users of
+OpenSSL do it correctly.
+
+Given that correct code requires side channel secure programming in
+application code, we can classify the existing RSA decryption methods
+as CWE-676, which in turn likely causes CWE-208 and CWE-385 in
+application code.
+
+To prevent that, we can use a technique called "implicit rejection".
+For that we generate a random message to be returned in case the
+padding check fails. We generate the message based on static secret
+data (the private exponent) and the provided ciphertext (so that the
+attacker cannot determine that the returned value is randomly generated
+instead of result of decryption and de-padding). We return it in case
+any part of padding check fails.
+
+The upshot of this approach is that then not only is the length of the
+returned message useless as the Bleichenbacher oracle, so are the
+actual bytes of the returned message. So application code doesn't have
+to perform any operations on the returned message in side-channel free
+way to remain secure against Bleichenbacher attacks.
+
+Note: this patch implements a specific algorithm, shared with Mozilla
+NSS, so that the attacker cannot use one library as an oracle against th=
e
+other in heterogeneous environments.
+
+CVE: CVE-2023-50781
+
+Upstream-Status: Backport
+[https://github.com/openssl/openssl/commit/7fc67e0a33102aa47bbaa56533eee=
cb98c0450f7]
+
+Reviewed-by: Dmitry Belyavskiy <beldmit@gmail.com>
+Reviewed-by: Tim Hudson <tjh@openssl.org>
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/13817)
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ crypto/rsa/rsa_ossl.c                     |  95 +++++++-
+ crypto/rsa/rsa_pk1.c                      | 252 ++++++++++++++++++++++
+ doc/man1/openssl-pkeyutl.pod.in           |   5 +
+ doc/man1/openssl-rsautl.pod.in            |   5 +
+ doc/man3/EVP_PKEY_CTX_ctrl.pod            |   7 +
+ doc/man3/EVP_PKEY_decrypt.pod             |  12 ++
+ doc/man3/RSA_padding_add_PKCS1_type_1.pod |   7 +-
+ doc/man3/RSA_public_encrypt.pod           |  11 +-
+ include/crypto/rsa.h                      |   4 +
+ 9 files changed, 393 insertions(+), 5 deletions(-)
+
+diff --git a/crypto/rsa/rsa_ossl.c b/crypto/rsa/rsa_ossl.c
+index 0fc642e777..330302ae55 100644
+--- a/crypto/rsa/rsa_ossl.c
++++ b/crypto/rsa/rsa_ossl.c
+@@ -17,6 +17,9 @@
+ #include "crypto/bn.h"
+ #include "rsa_local.h"
+ #include "internal/constant_time.h"
++#include <openssl/evp.h>
++#include <openssl/sha.h>
++#include <openssl/hmac.h>
+=20
+ static int rsa_ossl_public_encrypt(int flen, const unsigned char *from,
+                                   unsigned char *to, RSA *rsa, int padd=
ing);
+@@ -377,8 +380,13 @@ static int rsa_ossl_private_decrypt(int flen, const=
 unsigned char *from,
+     BIGNUM *f, *ret;
+     int j, num =3D 0, r =3D -1;
+     unsigned char *buf =3D NULL;
++    unsigned char d_hash[SHA256_DIGEST_LENGTH] =3D {0};
++    HMAC_CTX *hmac =3D NULL;
++    unsigned int md_len =3D SHA256_DIGEST_LENGTH;
++    unsigned char kdk[SHA256_DIGEST_LENGTH] =3D {0};
+     BN_CTX *ctx =3D NULL;
+     int local_blinding =3D 0;
++    EVP_MD *md =3D NULL;
+     /*
+      * Used only if the blinding structure is shared. A non-NULL unblin=
d
+      * instructs rsa_blinding_convert() and rsa_blinding_invert() to st=
ore
+@@ -408,6 +416,11 @@ static int rsa_ossl_private_decrypt(int flen, const=
 unsigned char *from,
+         goto err;
+     }
+=20
++    if (flen < 1) {
++        ERR_raise(ERR_LIB_RSA, RSA_R_DATA_TOO_SMALL);
++        goto err;
++    }
++
+     /* make data into a big number */
+     if (BN_bin2bn(from, (int)flen, f) =3D=3D NULL)
+         goto err;
+@@ -472,13 +485,91 @@ static int rsa_ossl_private_decrypt(int flen, cons=
t unsigned char *from,
+         if (!rsa_blinding_invert(blinding, ret, unblind, ctx))
+             goto err;
+=20
++    /*
++     * derive the Key Derivation Key from private exponent and public
++     * ciphertext
++     */
++    if (!(rsa->flags & RSA_FLAG_EXT_PKEY)) {
++        /*
++         * because we use d as a handle to rsa->d we need to keep it lo=
cal and
++         * free before any further use of rsa->d
++         */
++        BIGNUM *d =3D BN_new();
++        if (d =3D=3D NULL) {
++            ERR_raise(ERR_LIB_RSA, ERR_R_MALLOC_FAILURE);
++            goto err;
++        }
++        if (rsa->d =3D=3D NULL) {
++            ERR_raise(ERR_LIB_RSA, RSA_R_MISSING_PRIVATE_KEY);
++            BN_free(d);
++            goto err;
++        }
++        BN_with_flags(d, rsa->d, BN_FLG_CONSTTIME);
++        if (BN_bn2binpad(d, buf, num) < 0) {
++            ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
++            BN_free(d);
++            goto err;
++        }
++        BN_free(d);
++
++        /*
++         * we use hardcoded hash so that migrating between versions tha=
t use
++         * different hash doesn't provide a Bleichenbacher oracle:
++         * if the attacker can see that different versions return diffe=
rent
++         * messages for the same ciphertext, they'll know that the mess=
age is
++         * syntethically generated, which means that the padding check =
failed
++         */
++        md =3D EVP_MD_fetch(rsa->libctx, "sha256", NULL);
++        if (md =3D=3D NULL) {
++            ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
++            goto err;
++        }
++
++        if (EVP_Digest(buf, num, d_hash, NULL, md, NULL) <=3D 0) {
++            ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
++            goto err;
++        }
++
++        hmac =3D HMAC_CTX_new();
++        if (hmac =3D=3D NULL) {
++            ERR_raise(ERR_LIB_RSA, ERR_R_MALLOC_FAILURE);
++            goto err;
++        }
++
++        if (HMAC_Init_ex(hmac, d_hash, sizeof(d_hash), md, NULL) <=3D 0=
) {
++            ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
++            goto err;
++        }
++
++        if (flen < num) {
++            memset(buf, 0, num - flen);
++            if (HMAC_Update(hmac, buf, num - flen) <=3D 0) {
++                ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
++                goto err;
++            }
++        }
++        if (HMAC_Update(hmac, from, flen) <=3D 0) {
++            ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
++            goto err;
++        }
++
++        md_len =3D SHA256_DIGEST_LENGTH;
++        if (HMAC_Final(hmac, kdk, &md_len) <=3D 0) {
++            ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
++            goto err;
++        }
++    }
++
+     j =3D BN_bn2binpad(ret, buf, num);
+     if (j < 0)
+         goto err;
+=20
+     switch (padding) {
+     case RSA_PKCS1_PADDING:
+-        r =3D RSA_padding_check_PKCS1_type_2(to, num, buf, j, num);
++        if (rsa->flags & RSA_FLAG_EXT_PKEY)
++            r =3D RSA_padding_check_PKCS1_type_2(to, num, buf, j, num);
++        else
++            r =3D ossl_rsa_padding_check_PKCS1_type_2(rsa->libctx, to, =
num, buf, j, num, kdk);
+         break;
+     case RSA_PKCS1_OAEP_PADDING:
+         r =3D RSA_padding_check_PKCS1_OAEP(to, num, buf, j, num, NULL, =
0);
+@@ -501,6 +592,8 @@ static int rsa_ossl_private_decrypt(int flen, const =
unsigned char *from,
+ #endif
+=20
+  err:
++    HMAC_CTX_free(hmac);
++    EVP_MD_free(md);
+     BN_CTX_end(ctx);
+     BN_CTX_free(ctx);
+     OPENSSL_clear_free(buf, num);
+diff --git a/crypto/rsa/rsa_pk1.c b/crypto/rsa/rsa_pk1.c
+index 51507fc030..5cd2b26879 100644
+--- a/crypto/rsa/rsa_pk1.c
++++ b/crypto/rsa/rsa_pk1.c
+@@ -21,10 +21,14 @@
+ #include <openssl/rand.h>
+ /* Just for the SSL_MAX_MASTER_KEY_LENGTH value */
+ #include <openssl/prov_ssl.h>
++#include <openssl/evp.h>
++#include <openssl/sha.h>
++#include <openssl/hmac.h>
+ #include "internal/cryptlib.h"
+ #include "crypto/rsa.h"
+ #include "rsa_local.h"
+=20
++
+ int RSA_padding_add_PKCS1_type_1(unsigned char *to, int tlen,
+                                  const unsigned char *from, int flen)
+ {
+@@ -273,6 +277,254 @@ int RSA_padding_check_PKCS1_type_2(unsigned char *=
to, int tlen,
+     return constant_time_select_int(good, mlen, -1);
+ }
+=20
++
++static int ossl_rsa_prf(OSSL_LIB_CTX *ctx,
++                        unsigned char *to, int tlen,
++                        const char *label, int llen,
++                        const unsigned char *kdk,
++                        uint16_t bitlen)
++{
++    int pos;
++    int ret =3D -1;
++    uint16_t iter =3D 0;
++    unsigned char be_iter[sizeof(iter)];
++    unsigned char be_bitlen[sizeof(bitlen)];
++    HMAC_CTX *hmac =3D NULL;
++    EVP_MD *md =3D NULL;
++    unsigned char hmac_out[SHA256_DIGEST_LENGTH];
++    unsigned int md_len;
++
++    if (tlen * 8 !=3D bitlen) {
++        ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
++        return ret;
++    }
++
++    be_bitlen[0] =3D (bitlen >> 8) & 0xff;
++    be_bitlen[1] =3D bitlen & 0xff;
++
++    hmac =3D HMAC_CTX_new();
++    if (hmac =3D=3D NULL) {
++        ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
++        goto err;
++    }
++
++    /*
++     * we use hardcoded hash so that migrating between versions that us=
e
++     * different hash doesn't provide a Bleichenbacher oracle:
++     * if the attacker can see that different versions return different
++     * messages for the same ciphertext, they'll know that the message =
is
++     * syntethically generated, which means that the padding check fail=
ed
++     */
++    md =3D EVP_MD_fetch(ctx, "sha256", NULL);
++    if (md =3D=3D NULL) {
++        ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
++        goto err;
++    }
++
++    if (HMAC_Init_ex(hmac, kdk, SHA256_DIGEST_LENGTH, md, NULL) <=3D 0)=
 {
++        ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
++        goto err;
++    }
++
++    for (pos =3D 0; pos < tlen; pos +=3D SHA256_DIGEST_LENGTH, iter++) =
{
++        if (HMAC_Init_ex(hmac, NULL, 0, NULL, NULL) <=3D 0) {
++            ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
++            goto err;
++        }
++
++        be_iter[0] =3D (iter >> 8) & 0xff;
++        be_iter[1] =3D iter & 0xff;
++
++        if (HMAC_Update(hmac, be_iter, sizeof(be_iter)) <=3D 0) {
++            ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
++            goto err;
++        }
++        if (HMAC_Update(hmac, (unsigned char *)label, llen) <=3D 0) {
++            ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
++            goto err;
++        }
++        if (HMAC_Update(hmac, be_bitlen, sizeof(be_bitlen)) <=3D 0) {
++            ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
++            goto err;
++        }
++
++        /*
++         * HMAC_Final requires the output buffer to fit the whole MAC
++         * value, so we need to use the intermediate buffer for the las=
t
++         * unaligned block
++         */
++        md_len =3D SHA256_DIGEST_LENGTH;
++        if (pos + SHA256_DIGEST_LENGTH > tlen) {
++            if (HMAC_Final(hmac, hmac_out, &md_len) <=3D 0) {
++                ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
++                goto err;
++            }
++            memcpy(to + pos, hmac_out, tlen - pos);
++        } else {
++            if (HMAC_Final(hmac, to + pos, &md_len) <=3D 0) {
++                ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
++                goto err;
++            }
++        }
++    }
++
++    ret =3D 0;
++
++err:
++    HMAC_CTX_free(hmac);
++    EVP_MD_free(md);
++    return ret;
++}
++
++/*
++ * ossl_rsa_padding_check_PKCS1_type_2() checks and removes the PKCS#1 =
type 2
++ * padding from a decrypted RSA message. Unlike the
++ * RSA_padding_check_PKCS1_type_2() it will not return an error in case=
 it
++ * detects a padding error, rather it will return a deterministically g=
enerated
++ * random message. In other words it will perform an implicit rejection
++ * of an invalid padding. This means that the returned value does not i=
ndicate
++ * if the padding of the encrypted message was correct or not, making
++ * side channel attacks like the ones described by Bleichenbacher impos=
sible
++ * without access to the full decrypted value and a brute-force search =
of
++ * remaining padding bytes
++ */
++int ossl_rsa_padding_check_PKCS1_type_2(OSSL_LIB_CTX *ctx,
++                                        unsigned char *to, int tlen,
++                                        const unsigned char *from, int =
flen,
++                                        int num, unsigned char *kdk)
++{
++/*
++ * We need to generate a random length for the synthethic message, to a=
void
++ * bias towards zero and avoid non-constant timeness of DIV, we prepare
++ * 128 values to check if they are not too large for the used key size,
++ * and use 0 in case none of them are small enough, as 2^-128 is a good=
 enough
++ * safety margin
++ */
++#define MAX_LEN_GEN_TRIES 128
++    unsigned char *synthetic =3D NULL;
++    int synthethic_length;
++    uint16_t len_candidate;
++    unsigned char candidate_lengths[MAX_LEN_GEN_TRIES * sizeof(len_cand=
idate)];
++    uint16_t len_mask;
++    uint16_t max_sep_offset;
++    int synth_msg_index =3D 0;
++    int ret =3D -1;
++    int i, j;
++    unsigned int good, found_zero_byte;
++    int zero_index =3D 0, msg_index;
++
++    /*
++     * If these checks fail then either the message in publicly invalid=
, or
++     * we've been called incorrectly. We can fail immediately.
++     * Since this code is called only internally by openssl, those are =
just
++     * sanity checks
++     */
++    if (num !=3D flen || tlen <=3D 0 || flen <=3D 0) {
++        ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
++        return -1;
++    }
++
++    /* Generate a random message to return in case the padding checks f=
ail */
++    synthetic =3D OPENSSL_malloc(flen);
++    if (synthetic =3D=3D NULL) {
++        ERR_raise(ERR_LIB_RSA, ERR_R_MALLOC_FAILURE);
++        return -1;
++    }
++
++    if (ossl_rsa_prf(ctx, synthetic, flen, "message", 7, kdk, flen * 8)=
 < 0)
++        goto err;
++
++    /* decide how long the random message should be */
++    if (ossl_rsa_prf(ctx, candidate_lengths, sizeof(candidate_lengths),
++                     "length", 6, kdk,
++                     MAX_LEN_GEN_TRIES * sizeof(len_candidate) * 8) < 0=
)
++        goto err;
++
++    /*
++     * max message size is the size of the modulus size less 2 bytes fo=
r
++     * version and padding type and a minimum of 8 bytes padding
++     */
++    len_mask =3D max_sep_offset =3D flen - 2 - 8;
++    /*
++     * we want a mask so lets propagate the high bit to all positions l=
ess
++     * significant than it
++     */
++    len_mask |=3D len_mask >> 1;
++    len_mask |=3D len_mask >> 2;
++    len_mask |=3D len_mask >> 4;
++    len_mask |=3D len_mask >> 8;
++
++    synthethic_length =3D 0;
++    for (i =3D 0; i < MAX_LEN_GEN_TRIES * (int)sizeof(len_candidate);
++            i +=3D sizeof(len_candidate)) {
++        len_candidate =3D (candidate_lengths[i] << 8) | candidate_lengt=
hs[i + 1];
++        len_candidate &=3D len_mask;
++
++        synthethic_length =3D constant_time_select_int(
++            constant_time_lt(len_candidate, max_sep_offset),
++            len_candidate, synthethic_length);
++    }
++
++    synth_msg_index =3D flen - synthethic_length;
++
++    /* we have alternative message ready, check the real one */
++    good =3D constant_time_is_zero(from[0]);
++    good &=3D constant_time_eq(from[1], 2);
++
++    /* then look for the padding|message separator (the first zero byte=
) */
++    found_zero_byte =3D 0;
++    for (i =3D 2; i < flen; i++) {
++        unsigned int equals0 =3D constant_time_is_zero(from[i]);
++        zero_index =3D constant_time_select_int(~found_zero_byte & equa=
ls0,
++                                              i, zero_index);
++        found_zero_byte |=3D equals0;
++    }
++
++    /*
++     * padding must be at least 8 bytes long, and it starts two bytes i=
nto
++     * |from|. If we never found a 0-byte, then |zero_index| is 0 and t=
he check
++     * also fails.
++     */
++    good &=3D constant_time_ge(zero_index, 2 + 8);
++
++    /*
++     * Skip the zero byte. This is incorrect if we never found a zero-b=
yte
++     * but in this case we also do not copy the message out.
++     */
++    msg_index =3D zero_index + 1;
++
++    /*
++     * old code returned an error in case the decrypted message wouldn'=
t fit
++     * into the |to|, since that would leak information, return the syn=
thethic
++     * message instead
++     */
++    good &=3D constant_time_ge(tlen, num - msg_index);
++
++    msg_index =3D constant_time_select_int(good, msg_index, synth_msg_i=
ndex);
++
++    /*
++     * since at this point the |msg_index| does not provide the signal
++     * indicating if the padding check failed or not, we don't have to =
worry
++     * about leaking the length of returned message, we still need to e=
nsure
++     * that we read contents of both buffers so that cache accesses don=
't leak
++     * the value of |good|
++     */
++    for (i =3D msg_index, j =3D 0; i < flen && j < tlen; i++, j++)
++        to[j] =3D constant_time_select_8(good, from[i], synthetic[i]);
++    ret =3D j;
++
++err:
++    /*
++     * the only time ret < 0 is when the ciphertext is publicly invalid
++     * or we were called with invalid parameters, so we don't have to p=
erform
++     * a side-channel secure raising of the error
++     */
++    if (ret < 0)
++        ERR_raise(ERR_LIB_RSA, ERR_R_INTERNAL_ERROR);
++    OPENSSL_free(synthetic);
++    return ret;
++}
++
+ /*
+  * ossl_rsa_padding_check_PKCS1_type_2_TLS() checks and removes the PKC=
S1 type 2
+  * padding from a decrypted RSA message in a TLS signature. The result =
is stored
+diff --git a/doc/man1/openssl-pkeyutl.pod.in b/doc/man1/openssl-pkeyutl.=
pod.in
+index 2f6ef0021d..015265a74d 100644
+--- a/doc/man1/openssl-pkeyutl.pod.in
++++ b/doc/man1/openssl-pkeyutl.pod.in
+@@ -273,6 +273,11 @@ signed or verified directly instead of using a B<Di=
gestInfo> structure. If a
+ digest is set, then the B<DigestInfo> structure is used and its length
+ must correspond to the digest type.
+=20
++Note, for B<pkcs1> padding, as a protection against Bleichenbacher atta=
ck,
++the decryption will not fail in case of padding check failures. Use B<n=
one>
++and manual inspection of the decrypted message to verify if the decrypt=
ed
++value has correct PKCS#1 v1.5 padding.
++
+ For B<oaep> mode only encryption and decryption is supported.
+=20
+ For B<x931> if the digest type is set it is used to format the block da=
ta
+diff --git a/doc/man1/openssl-rsautl.pod.in b/doc/man1/openssl-rsautl.po=
d.in
+index 0a32fd965b..4c462abc8c 100644
+--- a/doc/man1/openssl-rsautl.pod.in
++++ b/doc/man1/openssl-rsautl.pod.in
+@@ -105,6 +105,11 @@ The padding to use: PKCS#1 v1.5 (the default), PKCS=
#1 OAEP,
+ ANSI X9.31, or no padding, respectively.
+ For signatures, only B<-pkcs> and B<-raw> can be used.
+=20
++Note: because of protection against Bleichenbacher attacks, decryption
++using PKCS#1 v1.5 mode will not return errors in case padding check fai=
led.
++Use B<-raw> and inspect the returned value manually to check if the
++padding is correct.
++
+ =3Ditem B<-hexdump>
+=20
+ Hex dump the output data.
+diff --git a/doc/man3/EVP_PKEY_CTX_ctrl.pod b/doc/man3/EVP_PKEY_CTX_ctrl=
.pod
+index 3075eaafd6..e788f38809 100644
+--- a/doc/man3/EVP_PKEY_CTX_ctrl.pod
++++ b/doc/man3/EVP_PKEY_CTX_ctrl.pod
+@@ -386,6 +386,13 @@ this behaviour should be tolerated then
+ OSSL_ASYM_CIPHER_PARAM_TLS_NEGOTIATED_VERSION should be set to the actu=
al
+ negotiated protocol version. Otherwise it should be left unset.
+=20
++Similarly to the B<RSA_PKCS1_WITH_TLS_PADDING> above, since OpenSSL ver=
sion
++3.1.0, the use of B<RSA_PKCS1_PADDING> will return a randomly generated=
 message
++instead of padding errors in case padding checks fail. Applications tha=
t
++want to remain secure while using earlier versions of OpenSSL, still ne=
ed to
++handle both the error code from the RSA decryption operation and the
++returned message in a side channel secure manner.
++
+ =3Dhead2 DSA parameters
+=20
+ EVP_PKEY_CTX_set_dsa_paramgen_bits() sets the number of bits used for D=
SA
+diff --git a/doc/man3/EVP_PKEY_decrypt.pod b/doc/man3/EVP_PKEY_decrypt.p=
od
+index b6f9bad5f1..898535a7a2 100644
+--- a/doc/man3/EVP_PKEY_decrypt.pod
++++ b/doc/man3/EVP_PKEY_decrypt.pod
+@@ -51,6 +51,18 @@ return 1 for success and 0 or a negative value for fa=
ilure. In particular a
+ return value of -2 indicates the operation is not supported by the publ=
ic key
+ algorithm.
+=20
++=3Dhead1 WARNINGS
++
++In OpenSSL versions before 3.1.0, when used in PKCS#1 v1.5 padding,
++both the return value from the EVP_PKEY_decrypt() and the B<outlen> pro=
vided
++information useful in mounting a Bleichenbacher attack against the
++used private key. They had to processed in a side-channel free way.
++
++Since version 3.1.0, the EVP_PKEY_decrypt() method when used with PKCS#=
1
++v1.5 padding doesn't return an error in case it detects an error in pad=
ding,
++instead it returns a pseudo-randomly generated message, removing the ne=
ed
++of side-channel secure code from applications using OpenSSL.
++
+ =3Dhead1 EXAMPLES
+=20
+ Decrypt data using OAEP (for RSA keys):
+diff --git a/doc/man3/RSA_padding_add_PKCS1_type_1.pod b/doc/man3/RSA_pa=
dding_add_PKCS1_type_1.pod
+index 9f7025c497..36ae18563f 100644
+--- a/doc/man3/RSA_padding_add_PKCS1_type_1.pod
++++ b/doc/man3/RSA_padding_add_PKCS1_type_1.pod
+@@ -121,8 +121,8 @@ L<ERR_get_error(3)>.
+=20
+ =3Dhead1 WARNINGS
+=20
+-The result of RSA_padding_check_PKCS1_type_2() is a very sensitive
+-information which can potentially be used to mount a Bleichenbacher
++The result of RSA_padding_check_PKCS1_type_2() is exactly the
++information which is used to mount a classical Bleichenbacher
+ padding oracle attack. This is an inherent weakness in the PKCS #1
+ v1.5 padding design. Prefer PKCS1_OAEP padding. If that is not
+ possible, the result of RSA_padding_check_PKCS1_type_2() should be
+@@ -137,6 +137,9 @@ as this would create a small timing side channel whi=
ch could be
+ used to mount a Bleichenbacher attack against any padding mode
+ including PKCS1_OAEP.
+=20
++You should prefer the use of EVP PKEY APIs for PKCS#1 v1.5 decryption
++as they implement the necessary workarounds internally.
++
+ =3Dhead1 SEE ALSO
+=20
+ L<RSA_public_encrypt(3)>,
+diff --git a/doc/man3/RSA_public_encrypt.pod b/doc/man3/RSA_public_encry=
pt.pod
+index 1d38073aea..bd3f835ac6 100644
+--- a/doc/man3/RSA_public_encrypt.pod
++++ b/doc/man3/RSA_public_encrypt.pod
+@@ -52,8 +52,8 @@ Encrypting user data directly with RSA is insecure.
+=20
+ =3Dback
+=20
+-B<flen> must not be more than RSA_size(B<rsa>) - 11 for the PKCS #1 v1.=
5
+-based padding modes, not more than RSA_size(B<rsa>) - 42 for
++When encrypting B<flen> must not be more than RSA_size(B<rsa>) - 11 for=
 the
++PKCS #1 v1.5 based padding modes, not more than RSA_size(B<rsa>) - 42 f=
or
+ RSA_PKCS1_OAEP_PADDING and exactly RSA_size(B<rsa>) for RSA_NO_PADDING.
+ When a padding mode other than RSA_NO_PADDING is in use, then
+ RSA_public_encrypt() will include some random bytes into the ciphertext
+@@ -92,6 +92,13 @@ which can potentially be used to mount a Bleichenbach=
er padding oracle
+ attack. This is an inherent weakness in the PKCS #1 v1.5 padding
+ design. Prefer RSA_PKCS1_OAEP_PADDING.
+=20
++In OpenSSL before version 3.1.0, both the return value and the length o=
f
++returned value could be used to mount the Bleichenbacher attack.
++Since version 3.1.0, OpenSSL does not return an error in case of paddin=
g
++checks failed. Instead it generates a random message based on used priv=
ate
++key and provided ciphertext so that application code doesn't have to im=
plement
++a side-channel secure error handling.
++
+ =3Dhead1 CONFORMING TO
+=20
+ SSL, PKCS #1 v2.0
+diff --git a/include/crypto/rsa.h b/include/crypto/rsa.h
+index 949873d0ee..f267e5d9d1 100644
+--- a/include/crypto/rsa.h
++++ b/include/crypto/rsa.h
+@@ -83,6 +83,10 @@ int ossl_rsa_param_decode(RSA *rsa, const X509_ALGOR =
*alg);
+ RSA *ossl_rsa_key_from_pkcs8(const PKCS8_PRIV_KEY_INFO *p8inf,
+                              OSSL_LIB_CTX *libctx, const char *propq);
+=20
++int ossl_rsa_padding_check_PKCS1_type_2(OSSL_LIB_CTX *ctx,
++                                        unsigned char *to, int tlen,
++                                        const unsigned char *from, int =
flen,
++                                        int num, unsigned char *kdk);
+ int ossl_rsa_padding_check_PKCS1_type_2_TLS(OSSL_LIB_CTX *ctx, unsigned=
 char *to,
+                                             size_t tlen,
+                                             const unsigned char *from,
+--=20
+2.34.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-2.p=
atch b/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-2.patch
new file mode 100644
index 0000000000..b336d9e850
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-2.patch
@@ -0,0 +1,358 @@
+From e92f0cd3b03e5aca948b03df7e3d02e536700f68 Mon Sep 17 00:00:00 2001
+From: Hubert Kario <hkario@redhat.com>
+Date: Thu, 27 Oct 2022 19:16:58 +0200
+Subject: [PATCH 2/3] rsa: Add option to disable implicit rejection
+
+CVE: CVE-2023-50781
+
+Upstream-Status: Backport
+[https://github.com/openssl/openssl/commit/5ab3ec1bb1eaa795d775f5896818c=
faa84d33a1a]
+
+Reviewed-by: Dmitry Belyavskiy <beldmit@gmail.com>
+Reviewed-by: Tim Hudson <tjh@openssl.org>
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/13817)
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ crypto/cms/cms_env.c                          |  7 +++++
+ crypto/evp/ctrl_params_translate.c            |  6 +++++
+ crypto/rsa/rsa_ossl.c                         | 16 ++++++++----
+ crypto/rsa/rsa_pmeth.c                        | 20 +++++++++++++-
+ doc/man1/openssl-pkeyutl.pod.in               | 10 +++++++
+ doc/man3/EVP_PKEY_CTX_ctrl.pod                |  2 ++
+ doc/man7/provider-asym_cipher.pod             |  9 +++++++
+ include/openssl/core_names.h                  |  2 ++
+ include/openssl/rsa.h                         |  5 ++++
+ .../implementations/asymciphers/rsa_enc.c     | 26 +++++++++++++++++--
+ 10 files changed, 95 insertions(+), 8 deletions(-)
+
+diff --git a/crypto/cms/cms_env.c b/crypto/cms/cms_env.c
+index 445a16fb77..49b0289114 100644
+--- a/crypto/cms/cms_env.c
++++ b/crypto/cms/cms_env.c
+@@ -581,6 +581,13 @@ static int cms_RecipientInfo_ktri_decrypt(CMS_Conte=
ntInfo *cms,
+     if (!ossl_cms_env_asn1_ctrl(ri, 1))
+         goto err;
+=20
++    if (EVP_PKEY_is_a(pkey, "RSA"))
++        /* upper layer CMS code incorrectly assumes that a successful R=
SA
++         * decryption means that the key matches ciphertext (which neve=
r
++         * was the case, implicit rejection or not), so to make it work
++         * disable implicit rejection for RSA keys */
++        EVP_PKEY_CTX_ctrl_str(ktri->pctx, "rsa_pkcs1_implicit_rejection=
", "0");
++
+     if (EVP_PKEY_decrypt(ktri->pctx, NULL, &eklen,
+                          ktri->encryptedKey->data,
+                          ktri->encryptedKey->length) <=3D 0)
+diff --git a/crypto/evp/ctrl_params_translate.c b/crypto/evp/ctrl_params=
_translate.c
+index 44d0895bcf..db7325439a 100644
+--- a/crypto/evp/ctrl_params_translate.c
++++ b/crypto/evp/ctrl_params_translate.c
+@@ -2269,6 +2269,12 @@ static const struct translation_st evp_pkey_ctx_t=
ranslations[] =3D {
+       EVP_PKEY_CTRL_GET_RSA_OAEP_LABEL, NULL, NULL,
+       OSSL_ASYM_CIPHER_PARAM_OAEP_LABEL, OSSL_PARAM_OCTET_PTR, NULL },
+=20
++    { SET, EVP_PKEY_RSA, 0, EVP_PKEY_OP_TYPE_CRYPT,
++      EVP_PKEY_CTRL_RSA_IMPLICIT_REJECTION, NULL,
++      "rsa_pkcs1_implicit_rejection",
++      OSSL_ASYM_CIPHER_PARAM_IMPLICIT_REJECTION, OSSL_PARAM_UNSIGNED_IN=
TEGER,
++      NULL },
++
+     { SET, EVP_PKEY_RSA_PSS, 0, EVP_PKEY_OP_TYPE_GEN,
+       EVP_PKEY_CTRL_MD, "rsa_pss_keygen_md", NULL,
+       OSSL_ALG_PARAM_DIGEST, OSSL_PARAM_UTF8_STRING, fix_md },
+diff --git a/crypto/rsa/rsa_ossl.c b/crypto/rsa/rsa_ossl.c
+index 330302ae55..4bdacd5ed9 100644
+--- a/crypto/rsa/rsa_ossl.c
++++ b/crypto/rsa/rsa_ossl.c
+@@ -395,6 +395,12 @@ static int rsa_ossl_private_decrypt(int flen, const=
 unsigned char *from,
+     BIGNUM *unblind =3D NULL;
+     BN_BLINDING *blinding =3D NULL;
+=20
++    /*
++     * we need the value of the private exponent to perform implicit re=
jection
++     */
++    if ((rsa->flags & RSA_FLAG_EXT_PKEY) && (padding =3D=3D RSA_PKCS1_P=
ADDING))
++        padding =3D RSA_PKCS1_NO_IMPLICIT_REJECT_PADDING;
++
+     if ((ctx =3D BN_CTX_new_ex(rsa->libctx)) =3D=3D NULL)
+         goto err;
+     BN_CTX_start(ctx);
+@@ -489,7 +495,7 @@ static int rsa_ossl_private_decrypt(int flen, const =
unsigned char *from,
+      * derive the Key Derivation Key from private exponent and public
+      * ciphertext
+      */
+-    if (!(rsa->flags & RSA_FLAG_EXT_PKEY)) {
++    if (padding =3D=3D RSA_PKCS1_PADDING) {
+         /*
+          * because we use d as a handle to rsa->d we need to keep it lo=
cal and
+          * free before any further use of rsa->d
+@@ -565,11 +571,11 @@ static int rsa_ossl_private_decrypt(int flen, cons=
t unsigned char *from,
+         goto err;
+=20
+     switch (padding) {
++    case RSA_PKCS1_NO_IMPLICIT_REJECT_PADDING:
++        r =3D RSA_padding_check_PKCS1_type_2(to, num, buf, j, num);
++        break;
+     case RSA_PKCS1_PADDING:
+-        if (rsa->flags & RSA_FLAG_EXT_PKEY)
+-            r =3D RSA_padding_check_PKCS1_type_2(to, num, buf, j, num);
+-        else
+-            r =3D ossl_rsa_padding_check_PKCS1_type_2(rsa->libctx, to, =
num, buf, j, num, kdk);
++        r =3D ossl_rsa_padding_check_PKCS1_type_2(rsa->libctx, to, num,=
 buf, j, num, kdk);
+         break;
+     case RSA_PKCS1_OAEP_PADDING:
+         r =3D RSA_padding_check_PKCS1_OAEP(to, num, buf, j, num, NULL, =
0);
+diff --git a/crypto/rsa/rsa_pmeth.c b/crypto/rsa/rsa_pmeth.c
+index 0bf5ac098a..81b031f81b 100644
+--- a/crypto/rsa/rsa_pmeth.c
++++ b/crypto/rsa/rsa_pmeth.c
+@@ -52,6 +52,8 @@ typedef struct {
+     /* OAEP label */
+     unsigned char *oaep_label;
+     size_t oaep_labellen;
++    /* if to use implicit rejection in PKCS#1 v1.5 decryption */
++    int implicit_rejection;
+ } RSA_PKEY_CTX;
+=20
+ /* True if PSS parameters are restricted */
+@@ -72,6 +74,7 @@ static int pkey_rsa_init(EVP_PKEY_CTX *ctx)
+     /* Maximum for sign, auto for verify */
+     rctx->saltlen =3D RSA_PSS_SALTLEN_AUTO;
+     rctx->min_saltlen =3D -1;
++    rctx->implicit_rejection =3D 1;
+     ctx->data =3D rctx;
+     ctx->keygen_info =3D rctx->gentmp;
+     ctx->keygen_info_count =3D 2;
+@@ -97,6 +100,7 @@ static int pkey_rsa_copy(EVP_PKEY_CTX *dst, const EVP=
_PKEY_CTX *src)
+     dctx->md =3D sctx->md;
+     dctx->mgf1md =3D sctx->mgf1md;
+     dctx->saltlen =3D sctx->saltlen;
++    dctx->implicit_rejection =3D sctx->implicit_rejection;
+     if (sctx->oaep_label) {
+         OPENSSL_free(dctx->oaep_label);
+         dctx->oaep_label =3D OPENSSL_memdup(sctx->oaep_label, sctx->oae=
p_labellen);
+@@ -347,6 +351,7 @@ static int pkey_rsa_decrypt(EVP_PKEY_CTX *ctx,
+                             const unsigned char *in, size_t inlen)
+ {
+     int ret;
++    int pad_mode;
+     RSA_PKEY_CTX *rctx =3D ctx->data;
+     /*
+      * Discard const. Its marked as const because this may be a cached =
copy of
+@@ -367,7 +372,12 @@ static int pkey_rsa_decrypt(EVP_PKEY_CTX *ctx,
+                                                 rctx->oaep_labellen,
+                                                 rctx->md, rctx->mgf1md)=
;
+     } else {
+-        ret =3D RSA_private_decrypt(inlen, in, out, rsa, rctx->pad_mode=
);
++        if (rctx->pad_mode =3D=3D RSA_PKCS1_PADDING &&
++              rctx->implicit_rejection =3D=3D 0)
++            pad_mode =3D RSA_PKCS1_NO_IMPLICIT_REJECT_PADDING;
++        else
++            pad_mode =3D rctx->pad_mode;
++        ret =3D RSA_private_decrypt(inlen, in, out, rsa, pad_mode);
+     }
+     *outlen =3D constant_time_select_s(constant_time_msb_s(ret), *outle=
n, ret);
+     ret =3D constant_time_select_int(constant_time_msb(ret), ret, 1);
+@@ -591,6 +601,14 @@ static int pkey_rsa_ctrl(EVP_PKEY_CTX *ctx, int typ=
e, int p1, void *p2)
+         *(unsigned char **)p2 =3D rctx->oaep_label;
+         return rctx->oaep_labellen;
+=20
++    case EVP_PKEY_CTRL_RSA_IMPLICIT_REJECTION:
++        if (rctx->pad_mode !=3D RSA_PKCS1_PADDING) {
++            ERR_raise(ERR_LIB_RSA, RSA_R_INVALID_PADDING_MODE);
++            return -2;
++        }
++        rctx->implicit_rejection =3D p1;
++        return 1;
++
+     case EVP_PKEY_CTRL_DIGESTINIT:
+     case EVP_PKEY_CTRL_PKCS7_SIGN:
+ #ifndef OPENSSL_NO_CMS
+diff --git a/doc/man1/openssl-pkeyutl.pod.in b/doc/man1/openssl-pkeyutl.=
pod.in
+index 015265a74d..5e62551d34 100644
+--- a/doc/man1/openssl-pkeyutl.pod.in
++++ b/doc/man1/openssl-pkeyutl.pod.in
+@@ -305,6 +305,16 @@ explicitly set in PSS mode then the signing digest =
is used.
+ Sets the digest used for the OAEP hash function. If not explicitly set =
then
+ SHA1 is used.
+=20
++=3Ditem B<rsa_pkcs1_implicit_rejection:>I<flag>
++
++Disables (when set to 0) or enables (when set to 1) the use of implicit
++rejection with PKCS#1 v1.5 decryption. When enabled (the default), as a
++protection against Bleichenbacher attack, the library will generate a
++deterministic random plaintext that it will return to the caller in cas=
e
++of padding check failure.
++When disabled, it's the callers' responsibility to handle the returned
++errors in a side-channel free manner.
++
+ =3Dback
+=20
+ =3Dhead1 RSA-PSS ALGORITHM
+diff --git a/doc/man3/EVP_PKEY_CTX_ctrl.pod b/doc/man3/EVP_PKEY_CTX_ctrl=
.pod
+index e788f38809..3844aa2199 100644
+--- a/doc/man3/EVP_PKEY_CTX_ctrl.pod
++++ b/doc/man3/EVP_PKEY_CTX_ctrl.pod
+@@ -392,6 +392,8 @@ instead of padding errors in case padding checks fai=
l. Applications that
+ want to remain secure while using earlier versions of OpenSSL, still ne=
ed to
+ handle both the error code from the RSA decryption operation and the
+ returned message in a side channel secure manner.
++This protection against Bleichenbacher attacks can be disabled by setti=
ng
++the OSSL_ASYM_CIPHER_PARAM_IMPLICIT_REJECTION (an unsigned integer) to =
0.
+=20
+ =3Dhead2 DSA parameters
+=20
+diff --git a/doc/man7/provider-asym_cipher.pod b/doc/man7/provider-asym_=
cipher.pod
+index 0976a263a8..2a8426a6ed 100644
+--- a/doc/man7/provider-asym_cipher.pod
++++ b/doc/man7/provider-asym_cipher.pod
+@@ -234,6 +234,15 @@ The TLS protocol version first requested by the cli=
ent.
+=20
+ The negotiated TLS protocol version.
+=20
++=3Ditem "implicit-rejection" (B<OSSL_PKEY_PARAM_IMPLICIT_REJECTION>) <u=
nsigned integer>
++
++Gets of sets the use of the implicit rejection mechanism for RSA PKCS#1=
 v1.5
++decryption. When set (non zero value), the decryption API will return
++a deterministically random value if the PKCS#1 v1.5 padding check fails.
++This makes explotation of the Bleichenbacher significantly harder, even
++if the code using the RSA decryption API is not implemented in side-cha=
nnel
++free manner. Set by default.
++
+ =3Dback
+=20
+ OSSL_FUNC_asym_cipher_gettable_ctx_params() and OSSL_FUNC_asym_cipher_s=
ettable_ctx_params()
+diff --git a/include/openssl/core_names.h b/include/openssl/core_names.h
+index 6bed5a8a67..5a350b537f 100644
+--- a/include/openssl/core_names.h
++++ b/include/openssl/core_names.h
+@@ -292,6 +292,7 @@ extern "C" {
+ #define OSSL_PKEY_PARAM_DIST_ID             "distid"
+ #define OSSL_PKEY_PARAM_PUB_KEY             "pub"
+ #define OSSL_PKEY_PARAM_PRIV_KEY            "priv"
++#define OSSL_PKEY_PARAM_IMPLICIT_REJECTION  "implicit-rejection"
+=20
+ /* Diffie-Hellman/DSA Parameters */
+ #define OSSL_PKEY_PARAM_FFC_P               "p"
+@@ -467,6 +468,7 @@ extern "C" {
+ #define OSSL_ASYM_CIPHER_PARAM_OAEP_LABEL               "oaep-label"
+ #define OSSL_ASYM_CIPHER_PARAM_TLS_CLIENT_VERSION       "tls-client-ver=
sion"
+ #define OSSL_ASYM_CIPHER_PARAM_TLS_NEGOTIATED_VERSION   "tls-negotiated=
-version"
++#define OSSL_ASYM_CIPHER_PARAM_IMPLICIT_REJECTION       "implicit-rejec=
tion"
+=20
+ /*
+  * Encoder / decoder parameters
+diff --git a/include/openssl/rsa.h b/include/openssl/rsa.h
+index a55c9727c6..247f9014e3 100644
+--- a/include/openssl/rsa.h
++++ b/include/openssl/rsa.h
+@@ -183,6 +183,8 @@ int EVP_PKEY_CTX_get0_rsa_oaep_label(EVP_PKEY_CTX *c=
tx, unsigned char **label);
+=20
+ # define EVP_PKEY_CTRL_RSA_KEYGEN_PRIMES  (EVP_PKEY_ALG_CTRL + 13)
+=20
++# define EVP_PKEY_CTRL_RSA_IMPLICIT_REJECTION (EVP_PKEY_ALG_CTRL + 14)
++
+ # define RSA_PKCS1_PADDING          1
+ # define RSA_NO_PADDING             3
+ # define RSA_PKCS1_OAEP_PADDING     4
+@@ -192,6 +194,9 @@ int EVP_PKEY_CTX_get0_rsa_oaep_label(EVP_PKEY_CTX *c=
tx, unsigned char **label);
+ # define RSA_PKCS1_PSS_PADDING      6
+ # define RSA_PKCS1_WITH_TLS_PADDING 7
+=20
++/* internal RSA_ only */
++# define RSA_PKCS1_NO_IMPLICIT_REJECT_PADDING 8
++
+ # define RSA_PKCS1_PADDING_SIZE    11
+=20
+ # define RSA_set_app_data(s,arg)         RSA_set_ex_data(s,0,arg)
+diff --git a/providers/implementations/asymciphers/rsa_enc.c b/providers=
/implementations/asymciphers/rsa_enc.c
+index c8921acd6e..11a91e62b1 100644
+--- a/providers/implementations/asymciphers/rsa_enc.c
++++ b/providers/implementations/asymciphers/rsa_enc.c
+@@ -75,6 +75,8 @@ typedef struct {
+     /* TLS padding */
+     unsigned int client_version;
+     unsigned int alt_version;
++    /* PKCS#1 v1.5 decryption mode */
++    unsigned int implicit_rejection;
+ } PROV_RSA_CTX;
+=20
+ static void *rsa_newctx(void *provctx)
+@@ -107,6 +109,7 @@ static int rsa_init(void *vprsactx, void *vrsa, cons=
t OSSL_PARAM params[],
+     RSA_free(prsactx->rsa);
+     prsactx->rsa =3D vrsa;
+     prsactx->operation =3D operation;
++    prsactx->implicit_rejection =3D 1;
+=20
+     switch (RSA_test_flags(prsactx->rsa, RSA_FLAG_TYPE_MASK)) {
+     case RSA_FLAG_TYPE_RSA:
+@@ -199,6 +202,7 @@ static int rsa_decrypt(void *vprsactx, unsigned char=
 *out, size_t *outlen,
+ {
+     PROV_RSA_CTX *prsactx =3D (PROV_RSA_CTX *)vprsactx;
+     int ret;
++    int pad_mode;
+     size_t len =3D RSA_size(prsactx->rsa);
+=20
+     if (!ossl_prov_is_running())
+@@ -276,8 +280,12 @@ static int rsa_decrypt(void *vprsactx, unsigned cha=
r *out, size_t *outlen,
+         }
+         OPENSSL_free(tbuf);
+     } else {
+-        ret =3D RSA_private_decrypt(inlen, in, out, prsactx->rsa,
+-                                  prsactx->pad_mode);
++        if ((prsactx->implicit_rejection =3D=3D 0) &&
++                (prsactx->pad_mode =3D=3D RSA_PKCS1_PADDING))
++            pad_mode =3D RSA_PKCS1_NO_IMPLICIT_REJECT_PADDING;
++        else
++            pad_mode =3D prsactx->pad_mode;
++        ret =3D RSA_private_decrypt(inlen, in, out, prsactx->rsa, pad_m=
ode);
+     }
+     *outlen =3D constant_time_select_s(constant_time_msb_s(ret), *outle=
n, ret);
+     ret =3D constant_time_select_int(constant_time_msb(ret), 0, 1);
+@@ -401,6 +409,10 @@ static int rsa_get_ctx_params(void *vprsactx, OSSL_=
PARAM *params)
+     if (p !=3D NULL && !OSSL_PARAM_set_uint(p, prsactx->alt_version))
+         return 0;
+=20
++    p =3D OSSL_PARAM_locate(params, OSSL_ASYM_CIPHER_PARAM_IMPLICIT_REJ=
ECTION);
++    if (p !=3D NULL && !OSSL_PARAM_set_uint(p, prsactx->implicit_reject=
ion))
++        return 0;
++
+     return 1;
+ }
+=20
+@@ -412,6 +424,7 @@ static const OSSL_PARAM known_gettable_ctx_params[] =
=3D {
+                     NULL, 0),
+     OSSL_PARAM_uint(OSSL_ASYM_CIPHER_PARAM_TLS_CLIENT_VERSION, NULL),
+     OSSL_PARAM_uint(OSSL_ASYM_CIPHER_PARAM_TLS_NEGOTIATED_VERSION, NULL=
),
++    OSSL_PARAM_uint(OSSL_ASYM_CIPHER_PARAM_IMPLICIT_REJECTION, NULL),
+     OSSL_PARAM_END
+ };
+=20
+@@ -549,6 +562,14 @@ static int rsa_set_ctx_params(void *vprsactx, const=
 OSSL_PARAM params[])
+             return 0;
+         prsactx->alt_version =3D alt_version;
+     }
++    p =3D OSSL_PARAM_locate_const(params, OSSL_ASYM_CIPHER_PARAM_IMPLIC=
IT_REJECTION);
++    if (p !=3D NULL) {
++        unsigned int implicit_rejection;
++
++        if (!OSSL_PARAM_get_uint(p, &implicit_rejection))
++            return 0;
++        prsactx->implicit_rejection =3D implicit_rejection;
++    }
+=20
+     return 1;
+ }
+@@ -562,6 +583,7 @@ static const OSSL_PARAM known_settable_ctx_params[] =
=3D {
+     OSSL_PARAM_octet_string(OSSL_ASYM_CIPHER_PARAM_OAEP_LABEL, NULL, 0)=
,
+     OSSL_PARAM_uint(OSSL_ASYM_CIPHER_PARAM_TLS_CLIENT_VERSION, NULL),
+     OSSL_PARAM_uint(OSSL_ASYM_CIPHER_PARAM_TLS_NEGOTIATED_VERSION, NULL=
),
++    OSSL_PARAM_uint(OSSL_ASYM_CIPHER_PARAM_IMPLICIT_REJECTION, NULL),
+     OSSL_PARAM_END
+ };
+=20
+--=20
+2.34.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-3.p=
atch b/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-3.patch
new file mode 100644
index 0000000000..0a1f63f30a
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-3.patch
@@ -0,0 +1,41 @@
+From ba78f7b0599ba5bfb5032dd2664465c5b13388e3 Mon Sep 17 00:00:00 2001
+From: Hubert Kario <hkario@redhat.com>
+Date: Tue, 22 Nov 2022 18:25:49 +0100
+Subject: [PATCH 3/3] smime/pkcs7: disable the Bleichenbacher workaround
+
+CVE: CVE-2023-50781
+
+Upstream-Status: Backport
+[https://github.com/openssl/openssl/commit/056dade341d2589975a3aae71f81c=
8d7061583c7]
+
+Reviewed-by: Dmitry Belyavskiy <beldmit@gmail.com>
+Reviewed-by: Tim Hudson <tjh@openssl.org>
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/13817)
+
+Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
+---
+ crypto/pkcs7/pk7_doit.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/crypto/pkcs7/pk7_doit.c b/crypto/pkcs7/pk7_doit.c
+index e9de097da1..6d3124da87 100644
+--- a/crypto/pkcs7/pk7_doit.c
++++ b/crypto/pkcs7/pk7_doit.c
+@@ -170,6 +170,13 @@ static int pkcs7_decrypt_rinfo(unsigned char **pek,=
 int *peklen,
+     if (EVP_PKEY_decrypt_init(pctx) <=3D 0)
+         goto err;
+=20
++    if (EVP_PKEY_is_a(pkey, "RSA"))
++        /* upper layer pkcs7 code incorrectly assumes that a successful=
 RSA
++         * decryption means that the key matches ciphertext (which neve=
r
++         * was the case, implicit rejection or not), so to make it work
++         * disable implicit rejection for RSA keys */
++        EVP_PKEY_CTX_ctrl_str(pctx, "rsa_pkcs1_implicit_rejection", "0"=
);
++
+     if (EVP_PKEY_decrypt(pctx, NULL, &eklen,
+                          ri->enc_key->data, ri->enc_key->length) <=3D 0=
)
+         goto err;
+--=20
+2.34.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.17.bb b/meta/r=
ecipes-connectivity/openssl/openssl_3.0.17.bb
index ee0ab2e498..5da7bffae4 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.17.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.17.bb
@@ -13,6 +13,9 @@ SRC_URI =3D "https://github.com/openssl/openssl/release=
s/download/openssl-${PV}/op
            file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://CVE-2024-41996.patch \
+           file://CVE-2023-50781-1.patch \
+           file://CVE-2023-50781-2.patch \
+           file://CVE-2023-50781-3.patch \
            "
=20
 SRC_URI:append:class-nativesdk =3D " \
--=20
2.34.1


