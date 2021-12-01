Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A715C433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 10:28:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.90409.1638354467163368932
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 02:27:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04D3611B3
	for <openembedded-core@lists.openembedded.org>;
 Wed,  1 Dec 2021 02:27:46 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A30F63F694
	for <openembedded-core@lists.openembedded.org>;
 Wed,  1 Dec 2021 02:27:45 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssl: fix EVP_PKEY_CTX_get_rsa_pss_saltlen() not returning
 a value
Date: Wed,  1 Dec 2021 10:27:43 +0000
Message-Id: <20211201102743.3904612-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 10:28:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159024

Backport a patch from upstream. Specifically, this fixes signature
validation in trusted-firmware-a with OpenSSL 3.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...-EVP_PKEY_CTX_get_rsa_pss_saltlen-no.patch | 108 ++++++++++++++++++
 .../openssl/openssl_3.0.0.bb                  |   1 +
 2 files changed, 109 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Fix-EV=
P_PKEY_CTX_get_rsa_pss_saltlen-no.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Fix-EVP_PKEY_=
CTX_get_rsa_pss_saltlen-no.patch b/meta/recipes-connectivity/openssl/open=
ssl/0001-Fix-EVP_PKEY_CTX_get_rsa_pss_saltlen-no.patch
new file mode 100644
index 0000000000..b85a3ad7d2
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Fix-EVP_PKEY_CTX_get=
_rsa_pss_saltlen-no.patch
@@ -0,0 +1,108 @@
+Fix EVP_PKEY_CTX_get_rsa_pss_saltlen, and also disable the tests in non-=
default
+context (required when backporting, not needed with 3.0.1).
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 6b5c02f6173e5fd46a3685e676fcb5eee9ac43ea Mon Sep 17 00:00:00 2001
+From: Tom Cosgrove <tom.cosgrove@arm.com>
+Date: Thu, 25 Nov 2021 15:49:26 +0000
+Subject: [PATCH] Fix EVP_PKEY_CTX_get_rsa_pss_saltlen() not returning a =
value
+
+When an integer value was specified, it was not being passed back via
+the orig_p2 weirdness.
+
+Regression test included.
+
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+Reviewed-by: Paul Dale <pauli@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/17136)
+---
+ crypto/evp/ctrl_params_translate.c | 12 +++++++-----
+ test/evp_extra_test.c              | 30 ++++++++++++++++++++++++++++++
+ 2 files changed, 37 insertions(+), 5 deletions(-)
+
+diff --git a/crypto/evp/ctrl_params_translate.c b/crypto/evp/ctrl_params=
_translate.c
+index 88945e13e6..6638209a8d 100644
+--- a/crypto/evp/ctrl_params_translate.c
++++ b/crypto/evp/ctrl_params_translate.c
+@@ -1379,21 +1379,23 @@ static int fix_rsa_pss_saltlen(enum state state,
+     if ((ctx->action_type =3D=3D SET && state =3D=3D PRE_PARAMS_TO_CTRL=
)
+         || (ctx->action_type =3D=3D GET && state =3D=3D POST_CTRL_TO_PA=
RAMS)) {
+         size_t i;
++        int val;
+=20
+         for (i =3D 0; i < OSSL_NELEM(str_value_map); i++) {
+             if (strcmp(ctx->p2, str_value_map[i].ptr) =3D=3D 0)
+                 break;
+         }
+-        if (i =3D=3D OSSL_NELEM(str_value_map)) {
+-            ctx->p1 =3D atoi(ctx->p2);
+-        } else if (state =3D=3D POST_CTRL_TO_PARAMS) {
++
++        val =3D i =3D=3D OSSL_NELEM(str_value_map) ? atoi(ctx->p2)
++                                             : (int)str_value_map[i].id=
;
++        if (state =3D=3D POST_CTRL_TO_PARAMS) {
+             /*
+              * EVP_PKEY_CTRL_GET_RSA_PSS_SALTLEN weirdness explained fu=
rther
+              * up
+              */
+-            *(int *)ctx->orig_p2 =3D str_value_map[i].id;
++            *(int *)ctx->orig_p2 =3D val;
+         } else {
+-            ctx->p1 =3D (int)str_value_map[i].id;
++            ctx->p1 =3D val;
+         }
+         ctx->p2 =3D NULL;
+     }
+diff --git a/test/evp_extra_test.c b/test/evp_extra_test.c
+index 83f8902d24..9ad37a2bce 100644
+--- a/test/evp_extra_test.c
++++ b/test/evp_extra_test.c
+@@ -3049,6 +3049,35 @@ static int test_EVP_rsa_pss_with_keygen_bits(void=
)
+     return ret;
+ }
+=20
++static int test_EVP_rsa_pss_set_saltlen(void)
++{
++    int ret =3D 0;
++    EVP_PKEY *pkey =3D NULL;
++    EVP_PKEY_CTX *pkey_ctx =3D NULL;
++    EVP_MD *sha256 =3D NULL;
++    EVP_MD_CTX *sha256_ctx =3D NULL;
++    int saltlen =3D 9999; /* buggy EVP_PKEY_CTX_get_rsa_pss_saltlen() d=
idn't update this */
++    const int test_value =3D 32;
++
++    if (nullprov !=3D NULL)
++        return TEST_skip("Test does not support a non-default library c=
ontext");
++
++    ret =3D TEST_ptr(pkey =3D load_example_rsa_key())
++        && TEST_ptr(sha256 =3D EVP_MD_fetch(testctx, "sha256", NULL))
++        && TEST_ptr(sha256_ctx =3D EVP_MD_CTX_new())
++        && TEST_true(EVP_DigestSignInit(sha256_ctx, &pkey_ctx, sha256, =
NULL, pkey))
++        && TEST_true(EVP_PKEY_CTX_set_rsa_padding(pkey_ctx, RSA_PKCS1_P=
SS_PADDING))
++        && TEST_true(EVP_PKEY_CTX_set_rsa_pss_saltlen(pkey_ctx, test_va=
lue))
++        && TEST_true(EVP_PKEY_CTX_get_rsa_pss_saltlen(pkey_ctx, &saltle=
n))
++        && TEST_int_eq(saltlen, test_value);
++
++    EVP_MD_CTX_free(sha256_ctx);
++    EVP_PKEY_free(pkey);
++    EVP_MD_free(sha256);
++
++    return ret;
++}
++
+ static int success =3D 1;
+ static void md_names(const char *name, void *vctx)
+ {
+@@ -3966,6 +3995,7 @@ int setup_tests(void)
+     ADD_ALL_TESTS(test_evp_iv_des, 6);
+ #endif
+     ADD_TEST(test_EVP_rsa_pss_with_keygen_bits);
++    ADD_TEST(test_EVP_rsa_pss_set_saltlen);
+ #ifndef OPENSSL_NO_EC
+     ADD_ALL_TESTS(test_ecpub, OSSL_NELEM(ecpub_nids));
+ #endif
+--=20
+2.25.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.0.bb b/meta/re=
cipes-connectivity/openssl/openssl_3.0.0.bb
index 8852a51ca8..4b1ae71a85 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.0.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.0.bb
@@ -13,6 +13,7 @@ SRC_URI =3D "http://www.openssl.org/source/openssl-${PV=
}.tar.gz \
            file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://armv8-32bit.patch \
+           file://0001-Fix-EVP_PKEY_CTX_get_rsa_pss_saltlen-no.patch \
            "
=20
 SRC_URI:append:class-nativesdk =3D " \
--=20
2.25.1


