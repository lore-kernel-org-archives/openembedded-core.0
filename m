Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57922C433FE
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 18:06:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.311.1640023575000194397
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 10:06:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8EE40D6E
	for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 10:06:14 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1CA2C3F774
	for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 10:06:13 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/2] openssl: upgrade to 3.0.1
Date: Mon, 20 Dec 2021 18:05:59 +0000
Message-Id: <20211220180559.880221-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220180559.880221-1-ross.burton@arm.com>
References: <20211220180559.880221-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 18:06:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159894

Major changes in 3.0.1:

  * Fixed invalid handling of X509_verify_cert() internal errors in libss=
l
    ([CVE-2021-4044])
  * Allow fetching an operation from the provider that owns an unexportab=
le key
    as a fallback if that is still allowed by the property query.

Drop patches which were backported.

Add sed to openssl-ptest as the tests use 'sed -u', which isn't supported
by busybox.

Ensure that we package the dummy async engine, needed by the test suite.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...-EVP_PKEY_CTX_get_rsa_pss_saltlen-no.patch | 108 ------------------
 .../openssl/openssl/armv8-32bit.patch         |  29 -----
 .../{openssl_3.0.0.bb =3D> openssl_3.0.1.bb}    |  20 ++--
 3 files changed, 9 insertions(+), 148 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Fix-EV=
P_PKEY_CTX_get_rsa_pss_saltlen-no.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/armv8-32bit=
.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.0.0.bb =3D> openssl_=
3.0.1.bb} (93%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Fix-EVP_PKEY_=
CTX_get_rsa_pss_saltlen-no.patch b/meta/recipes-connectivity/openssl/open=
ssl/0001-Fix-EVP_PKEY_CTX_get_rsa_pss_saltlen-no.patch
deleted file mode 100644
index b85a3ad7d22..00000000000
--- a/meta/recipes-connectivity/openssl/openssl/0001-Fix-EVP_PKEY_CTX_get=
_rsa_pss_saltlen-no.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-Fix EVP_PKEY_CTX_get_rsa_pss_saltlen, and also disable the tests in non-=
default
-context (required when backporting, not needed with 3.0.1).
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 6b5c02f6173e5fd46a3685e676fcb5eee9ac43ea Mon Sep 17 00:00:00 2001
-From: Tom Cosgrove <tom.cosgrove@arm.com>
-Date: Thu, 25 Nov 2021 15:49:26 +0000
-Subject: [PATCH] Fix EVP_PKEY_CTX_get_rsa_pss_saltlen() not returning a =
value
-
-When an integer value was specified, it was not being passed back via
-the orig_p2 weirdness.
-
-Regression test included.
-
-Reviewed-by: Tomas Mraz <tomas@openssl.org>
-Reviewed-by: Paul Dale <pauli@openssl.org>
-(Merged from https://github.com/openssl/openssl/pull/17136)
----
- crypto/evp/ctrl_params_translate.c | 12 +++++++-----
- test/evp_extra_test.c              | 30 ++++++++++++++++++++++++++++++
- 2 files changed, 37 insertions(+), 5 deletions(-)
-
-diff --git a/crypto/evp/ctrl_params_translate.c b/crypto/evp/ctrl_params=
_translate.c
-index 88945e13e6..6638209a8d 100644
---- a/crypto/evp/ctrl_params_translate.c
-+++ b/crypto/evp/ctrl_params_translate.c
-@@ -1379,21 +1379,23 @@ static int fix_rsa_pss_saltlen(enum state state,
-     if ((ctx->action_type =3D=3D SET && state =3D=3D PRE_PARAMS_TO_CTRL=
)
-         || (ctx->action_type =3D=3D GET && state =3D=3D POST_CTRL_TO_PA=
RAMS)) {
-         size_t i;
-+        int val;
-=20
-         for (i =3D 0; i < OSSL_NELEM(str_value_map); i++) {
-             if (strcmp(ctx->p2, str_value_map[i].ptr) =3D=3D 0)
-                 break;
-         }
--        if (i =3D=3D OSSL_NELEM(str_value_map)) {
--            ctx->p1 =3D atoi(ctx->p2);
--        } else if (state =3D=3D POST_CTRL_TO_PARAMS) {
-+
-+        val =3D i =3D=3D OSSL_NELEM(str_value_map) ? atoi(ctx->p2)
-+                                             : (int)str_value_map[i].id=
;
-+        if (state =3D=3D POST_CTRL_TO_PARAMS) {
-             /*
-              * EVP_PKEY_CTRL_GET_RSA_PSS_SALTLEN weirdness explained fu=
rther
-              * up
-              */
--            *(int *)ctx->orig_p2 =3D str_value_map[i].id;
-+            *(int *)ctx->orig_p2 =3D val;
-         } else {
--            ctx->p1 =3D (int)str_value_map[i].id;
-+            ctx->p1 =3D val;
-         }
-         ctx->p2 =3D NULL;
-     }
-diff --git a/test/evp_extra_test.c b/test/evp_extra_test.c
-index 83f8902d24..9ad37a2bce 100644
---- a/test/evp_extra_test.c
-+++ b/test/evp_extra_test.c
-@@ -3049,6 +3049,35 @@ static int test_EVP_rsa_pss_with_keygen_bits(void=
)
-     return ret;
- }
-=20
-+static int test_EVP_rsa_pss_set_saltlen(void)
-+{
-+    int ret =3D 0;
-+    EVP_PKEY *pkey =3D NULL;
-+    EVP_PKEY_CTX *pkey_ctx =3D NULL;
-+    EVP_MD *sha256 =3D NULL;
-+    EVP_MD_CTX *sha256_ctx =3D NULL;
-+    int saltlen =3D 9999; /* buggy EVP_PKEY_CTX_get_rsa_pss_saltlen() d=
idn't update this */
-+    const int test_value =3D 32;
-+
-+    if (nullprov !=3D NULL)
-+        return TEST_skip("Test does not support a non-default library c=
ontext");
-+
-+    ret =3D TEST_ptr(pkey =3D load_example_rsa_key())
-+        && TEST_ptr(sha256 =3D EVP_MD_fetch(testctx, "sha256", NULL))
-+        && TEST_ptr(sha256_ctx =3D EVP_MD_CTX_new())
-+        && TEST_true(EVP_DigestSignInit(sha256_ctx, &pkey_ctx, sha256, =
NULL, pkey))
-+        && TEST_true(EVP_PKEY_CTX_set_rsa_padding(pkey_ctx, RSA_PKCS1_P=
SS_PADDING))
-+        && TEST_true(EVP_PKEY_CTX_set_rsa_pss_saltlen(pkey_ctx, test_va=
lue))
-+        && TEST_true(EVP_PKEY_CTX_get_rsa_pss_saltlen(pkey_ctx, &saltle=
n))
-+        && TEST_int_eq(saltlen, test_value);
-+
-+    EVP_MD_CTX_free(sha256_ctx);
-+    EVP_PKEY_free(pkey);
-+    EVP_MD_free(sha256);
-+
-+    return ret;
-+}
-+
- static int success =3D 1;
- static void md_names(const char *name, void *vctx)
- {
-@@ -3966,6 +3995,7 @@ int setup_tests(void)
-     ADD_ALL_TESTS(test_evp_iv_des, 6);
- #endif
-     ADD_TEST(test_EVP_rsa_pss_with_keygen_bits);
-+    ADD_TEST(test_EVP_rsa_pss_set_saltlen);
- #ifndef OPENSSL_NO_EC
-     ADD_ALL_TESTS(test_ecpub, OSSL_NELEM(ecpub_nids));
- #endif
---=20
-2.25.1
-
diff --git a/meta/recipes-connectivity/openssl/openssl/armv8-32bit.patch =
b/meta/recipes-connectivity/openssl/openssl/armv8-32bit.patch
deleted file mode 100644
index 1935651be05..00000000000
--- a/meta/recipes-connectivity/openssl/openssl/armv8-32bit.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Upstream-Status: Submitted [https://github.com/openssl/openssl/pull/1695=
1]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 5118e96a3dbedde2523e7726fa34af30923a9add Mon Sep 17 00:00:00 2001
-From: Tom Cosgrove <tom.cosgrove@arm.com>
-Date: Tue, 2 Nov 2021 15:26:21 +0000
-Subject: [PATCH] Fix builds on Armv8 systems without AArch64
-
-This fixes "undefined reference to `aes_gcm_dec_128_kernel' in function
-`armv8_aes_gcm_decrypt'" and similar
-
-Fixes #16949
----
- include/crypto/aes_platform.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/crypto/aes_platform.h b/include/crypto/aes_platform=
.h
-index 015c3bd4ab91..e95ad5aa5de6 100644
---- a/include/crypto/aes_platform.h
-+++ b/include/crypto/aes_platform.h
-@@ -100,7 +100,7 @@ void AES_xts_decrypt(const unsigned char *inp, unsig=
ned char *out, size_t len,
- #    define AES_PMULL_CAPABLE ((OPENSSL_armcap_P & ARMV8_PMULL) && (OPE=
NSSL_armcap_P & ARMV8_AES))
- #    define AES_GCM_ENC_BYTES 512
- #    define AES_GCM_DEC_BYTES 512
--#    if __ARM_MAX_ARCH__>=3D8
-+#    if __ARM_MAX_ARCH__>=3D8 && defined(__aarch64__)
- #     define AES_gcm_encrypt armv8_aes_gcm_encrypt
- #     define AES_gcm_decrypt armv8_aes_gcm_decrypt
- #     define AES_GCM_ASM(gctx) ((gctx)->ctr=3D=3Daes_v8_ctr32_encrypt_b=
locks && \
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.0.bb b/meta/re=
cipes-connectivity/openssl/openssl_3.0.1.bb
similarity index 93%
rename from meta/recipes-connectivity/openssl/openssl_3.0.0.bb
rename to meta/recipes-connectivity/openssl/openssl_3.0.1.bb
index da73ed6bc33..162435480c4 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.0.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.1.bb
@@ -12,15 +12,13 @@ SRC_URI =3D "http://www.openssl.org/source/openssl-${=
PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from=
-co.patch \
            file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
-           file://armv8-32bit.patch \
-           file://0001-Fix-EVP_PKEY_CTX_get_rsa_pss_saltlen-no.patch \
            "
=20
 SRC_URI:append:class-nativesdk =3D " \
            file://environment.d-openssl.sh \
            "
=20
-SRC_URI[sha256sum] =3D "59eedfcb46c25214c9bd37ed6078297b4df01d012267fe9e=
9eee31f61bc70536"
+SRC_URI[sha256sum] =3D "c311ad853353bce796edad01a862c50a8a587f62e7e2100e=
f465ab53ec9b06d1"
=20
 inherit lib_package multilib_header multilib_script ptest perlnative
 MULTILIB_SCRIPTS =3D "${PN}-bin:${bindir}/c_rehash"
@@ -194,21 +192,21 @@ do_install_ptest () {
 	install -m755 ${B}/apps/CA.pl ${D}${PTEST_PATH}/apps
=20
 	install -d ${D}${PTEST_PATH}/engines
-	install -m755 ${B}/engines/ossltest.so ${D}${PTEST_PATH}/engines
+	install -m755 ${B}/engines/dasync.so ${D}${PTEST_PATH}/engines
 	install -m755 ${B}/engines/loader_attic.so ${D}${PTEST_PATH}/engines
+	install -m755 ${B}/engines/ossltest.so ${D}${PTEST_PATH}/engines
=20
 	install -d ${D}${PTEST_PATH}/providers
 	install -m755 ${B}/providers/legacy.so ${D}${PTEST_PATH}/providers
=20
-        install -d ${D}${PTEST_PATH}/Configurations
-        cp -rf ${S}/Configurations/* ${D}${PTEST_PATH}/Configurations/
+	install -d ${D}${PTEST_PATH}/Configurations
+	cp -rf ${S}/Configurations/* ${D}${PTEST_PATH}/Configurations/
=20
-        # seems to be needed with perl 5.32.1
-        install -d ${D}${PTEST_PATH}/util/perl/recipes
-        cp ${D}${PTEST_PATH}/test/recipes/tconversion.pl ${D}${PTEST_PAT=
H}/util/perl/recipes/
+	# seems to be needed with perl 5.32.1
+	install -d ${D}${PTEST_PATH}/util/perl/recipes
+	cp ${D}${PTEST_PATH}/test/recipes/tconversion.pl ${D}${PTEST_PATH}/util=
/perl/recipes/
=20
 	sed 's|${S}|${PTEST_PATH}|g' -i ${D}${PTEST_PATH}/util/wrap.pl
-
 }
=20
 # Add the openssl.cnf file to the openssl-conf package. Make the libcryp=
to
@@ -234,7 +232,7 @@ CONFFILES:openssl-conf =3D "${sysconfdir}/ssl/openssl=
.cnf"
=20
 RRECOMMENDS:libcrypto +=3D "openssl-conf"
 RDEPENDS:${PN}-misc =3D "perl"
-RDEPENDS:${PN}-ptest +=3D "openssl-bin perl perl-modules bash"
+RDEPENDS:${PN}-ptest +=3D "openssl-bin perl perl-modules bash sed"
=20
 RDEPENDS:${PN}-bin +=3D "openssl-conf"
=20
--=20
2.25.1


