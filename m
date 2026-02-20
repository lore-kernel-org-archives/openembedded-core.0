Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD92DC55184
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 09:57:51 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35135.1771581467503846953
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 01:57:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=G9VeA+WS;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4377174e1ebso1391698f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 01:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771581466; x=1772186266; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D47HxwCLabQO34/w3TAvFr3UVWSLIckWTJ67SGUQBT4=;
        b=G9VeA+WS0GskCsPGs5CxZB11gYb+XitjjD2Fr412ApsNtgQMS+QYk0+/9qAWIJ+WkG
         Fm1F1Mj14Y+XmoL8lnP1wFzPibRsJu6GWa5UYpWNstpVIjXXA6Naibf6BNmCFzx+jjZN
         kwW+TFNpR1/8zwlbs/CFjfrdCEX3JkrxN+Pl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771581466; x=1772186266;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D47HxwCLabQO34/w3TAvFr3UVWSLIckWTJ67SGUQBT4=;
        b=YTbWVGMZcUIQVaKB7kfAa37IJXybvIb3vUH/cURyduBH2bH5IbeMjmcURD7+BirYEq
         to0tj55ZUt9E0rBF0lFBTBH8ImOyNMJaII6+Z3l+TmFBekza6yvdSsGH0Q1tLcSuu2Ht
         +LqNNqcW7DJi5M2npy2uRkAqPFAzYduTG/LZ52umIia78LpiNrsczuexDAVmd7+tOzzV
         pJxqHGWRNoNMwwLTCAH7mjB9Nf9061bc0MUp2cP3ShW+cXo/LoaTL42V74OH4bNNBrgt
         fy9dOlkb50kDi5ik0CXQ+23g285/1IB8/9YGNtqTyLAHdyp29OqxJWBLcgYawTpqzGON
         SxJQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2uL6sNYEKims9YXX2f2dmZuH6JvgtJt2Y4E8WtmfIuj6pVrVKhzcxHFbQi1oHR7IuxBu7NrWC5bUDEs6WoQd5EA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzSk6FNTvECNRjIauFT72rpClQoNdhOk9W2ObKgPCGErygC12y/
	kL1mzTvqHSQ0rseC8K9YCmyZ3BCRRnOva/X4zAN1l/iZbHtJjfvchirqo00c4o1lPLU=
X-Gm-Gg: AZuq6aI52W9U+3RfmsAxsrnkdJGFWmGZR6UbXEFtDA0zacDA9wZKHe8YvjxrDuMpuvI
	V1sfsSOqZv/eICN4tpK29NjgSeyv9VZ/Jd3mwT6iW44RePGabGdbGzKk4nsTI7j2B6wbTggL7Je
	rvAGtJPBLaW6Rj0EhDId3J4wyVJ45thcaeabOHmO9tfSEB42xL7HQ6ziIIzM/MCz2EeNNSVnoRt
	sBShA4MSIi1hzVfoyImP7ffiMqu9/ywm+i3W9J9FEjohoPXQdw1NRd4M06VSku87//HFWnFwKBB
	Ex7jXyOZ3iYoYTnT4vvEUJ8FGkjMZTllPZPS28yy6sw1elR5fEUBMBWDuwVt5glVzpsWjwaTBC5
	VjPS+0zSieo5AVSBZg9MNtyT5FboG8hQ3F0tScWkdf055j99MXDkWbyjF8Pz7UCwA2AsqOPaivA
	Thb6X3xVWDWFpIfnHq8DF3xp+sDvHlQzTi3PvlAh6XhqLOIyd61/O3JKgvWake3a3cCDNcTy/5O
	Zg9SrfeALdT3kM=
X-Received: by 2002:a5d:5d88:0:b0:439:56ec:4f33 with SMTP id ffacd0b85a97d-4395fd2aba5mr10089972f8f.13.1771581465697;
        Fri, 20 Feb 2026 01:57:45 -0800 (PST)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8d46sm56084517f8f.32.2026.02.20.01.57.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 01:57:45 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 10:57:45 +0100
Message-Id: <DGJP7TOOXUPU.2BEYA9QQYTEC7@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCHv2] openssl: fix CVE-2025-15467
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260220045837.8726-1-hprajapati@mvista.com>
In-Reply-To: <20260220045837.8726-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 09:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231502

On Fri Feb 20, 2026 at 5:58 AM CET, Hitendra Prajapati via lists.openembedd=
ed.org wrote:
> patch has fix for Correct handling of AEAD-encrypted CMS with inadmissibl=
y long IV.
>
> Backport patch from NVD report:
> https://nvd.nist.gov/vuln/detail/CVE-2025-15467
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../openssl/openssl/CVE-2025-15467-01.patch   |  40 ++++++
>  .../openssl/openssl/CVE-2025-15467-02.patch   |  65 +++++++++
>  .../openssl/openssl/CVE-2025-15467-03.patch   | 128 ++++++++++++++++++
>  .../openssl/openssl_3.2.6.bb                  |   3 +
>  4 files changed, 236 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-15=
467-01.patch
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-15=
467-02.patch
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-15=
467-03.patch
>
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2025-15467-01.=
patch b/meta/recipes-connectivity/openssl/openssl/CVE-2025-15467-01.patch
> new file mode 100644
> index 0000000000..55809d4c03
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2025-15467-01.patch
> @@ -0,0 +1,40 @@
> +From ce39170276daec87f55c39dad1f629b56344429e Mon Sep 17 00:00:00 2001
> +From: Igor Ustinov <igus68@gmail.com>
> +Date: Mon, 12 Jan 2026 12:19:59 +0100
> +Subject: [PATCH] Correct handling of AEAD-encrypted CMS with inadmissibl=
y long
> + IV
> +
> +Fixes CVE-2025-15467
> +
> +Reviewed-by: Norbert Pocs <norbertp@openssl.org>
> +Reviewed-by: Eugene Syromiatnikov <esyr@openssl.org>
> +Reviewed-by: Tomas Mraz <tomas@openssl.org>
> +MergeDate: Mon Jan 26 19:34:29 2026
> +
> +CVE: CVE-2025-15467
> +Upstream-Status: Backport [https://github.com/openssl/openssl/commit/ce3=
9170276daec87f55c39dad1f629b56344429e]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + crypto/evp/evp_lib.c | 5 ++---
> + 1 file changed, 2 insertions(+), 3 deletions(-)
> +
> +diff --git a/crypto/evp/evp_lib.c b/crypto/evp/evp_lib.c
> +index f29d592..df38677 100644
> +--- a/crypto/evp/evp_lib.c
> ++++ b/crypto/evp/evp_lib.c
> +@@ -249,10 +249,9 @@ int evp_cipher_get_asn1_aead_params(EVP_CIPHER_CTX =
*c, ASN1_TYPE *type,
> +     if (type =3D=3D NULL || asn1_params =3D=3D NULL)
> +         return 0;
> +=20
> +-    i =3D ossl_asn1_type_get_octetstring_int(type, &tl, NULL, EVP_MAX_I=
V_LENGTH);
> +-    if (i <=3D 0)
> ++    i =3D ossl_asn1_type_get_octetstring_int(type, &tl, iv, EVP_MAX_IV_=
LENGTH);
> ++    if (i <=3D 0 || i > EVP_MAX_IV_LENGTH)
> +         return -1;
> +-    ossl_asn1_type_get_octetstring_int(type, &tl, iv, i);
> +=20
> +     memcpy(asn1_params->iv, iv, i);
> +     asn1_params->iv_len =3D i;
> +--=20
> +2.50.1
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2025-15467-02.=
patch b/meta/recipes-connectivity/openssl/openssl/CVE-2025-15467-02.patch
> new file mode 100644
> index 0000000000..52557bcaab
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2025-15467-02.patch
> @@ -0,0 +1,65 @@
> +From cdccf8f2ef17ae020bd69360c43a39306b89c381 Mon Sep 17 00:00:00 2001
> +From: Igor Ustinov <igus68@gmail.com>
> +Date: Mon, 12 Jan 2026 12:21:21 +0100
> +Subject: [PATCH] Some comments to clarify functions usage
> +
> +Reviewed-by: Norbert Pocs <norbertp@openssl.org>
> +Reviewed-by: Eugene Syromiatnikov <esyr@openssl.org>
> +Reviewed-by: Tomas Mraz <tomas@openssl.org>
> +MergeDate: Mon Jan 26 19:34:31 2026
> +
> +CVE: CVE-2025-15467
> +Upstream-Status: Backport [https://github.com/openssl/openssl/commit/cdc=
cf8f2ef17ae020bd69360c43a39306b89c381]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + crypto/asn1/evp_asn1.c | 20 ++++++++++++++++++++
> + 1 file changed, 20 insertions(+)
> +
> +diff --git a/crypto/asn1/evp_asn1.c b/crypto/asn1/evp_asn1.c
> +index 13d8ed3..6aca011 100644
> +--- a/crypto/asn1/evp_asn1.c
> ++++ b/crypto/asn1/evp_asn1.c
> +@@ -60,6 +60,12 @@ static ossl_inline void asn1_type_init_oct(ASN1_OCTET=
_STRING *oct,
> +     oct->flags =3D 0;
> + }
> +=20
> ++/*
> ++ * This function copies 'anum' to 'num' and the data of 'oct' to 'data'=
.
> ++ * If the length of 'data' > 'max_len', copies only the first 'max_len'
> ++ * bytes, but returns the full length of 'oct'; this allows distinguish=
ing
> ++ * whether all the data was copied.
> ++ */

This v2 does not address my comment about backporting a comment-only
patch in v1.

Also, when sending patches conflicting with each other (like in the
SRC_URI list of openssl), can you send as a series instead of individual
patches, that will help me by not having to guess the proper order to
apply them.

Thanks!

> + static int asn1_type_get_int_oct(ASN1_OCTET_STRING *oct, int32_t anum,
> +                                  long *num, unsigned char *data, int ma=
x_len)
> + {
> +@@ -106,6 +112,13 @@ int ASN1_TYPE_set_int_octetstring(ASN1_TYPE *a, lon=
g num, unsigned char *data,
> +     return 0;
> + }
> +=20
> ++/*
> ++ * This function decodes an int-octet sequence and copies the integer t=
o 'num'
> ++ * and the data of octet to 'data'.
> ++ * If the length of 'data' > 'max_len', copies only the first 'max_len'
> ++ * bytes, but returns the full length of 'oct'; this allows distinguish=
ing
> ++ * whether all the data was copied.
> ++ */
> + int ASN1_TYPE_get_int_octetstring(const ASN1_TYPE *a, long *num,
> +                                   unsigned char *data, int max_len)
> + {
> +@@ -162,6 +175,13 @@ int ossl_asn1_type_set_octetstring_int(ASN1_TYPE *a=
, long num,
> +     return 0;
> + }
> +=20
> ++/*
> ++ * This function decodes an octet-int sequence and copies the data of o=
ctet
> ++ * to 'data' and the integer to 'num'.
> ++ * If the length of 'data' > 'max_len', copies only the first 'max_len'
> ++ * bytes, but returns the full length of 'oct'; this allows distinguish=
ing
> ++ * whether all the data was copied.
> ++ */
> + int ossl_asn1_type_get_octetstring_int(const ASN1_TYPE *a, long *num,
> +                                        unsigned char *data, int max_len=
)
> + {
> +--=20
> +2.50.1
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2025-15467-03.=
patch b/meta/recipes-connectivity/openssl/openssl/CVE-2025-15467-03.patch
> new file mode 100644
> index 0000000000..8a2923d8fd
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2025-15467-03.patch
> @@ -0,0 +1,128 @@
> +From 31bf9ffbba8dce368cd2e47fbc77bdeee92a0699 Mon Sep 17 00:00:00 2001
> +From: Hitendra Prajapati <hprajapati@mvista.com>
> +Date: Fri, 30 Jan 2026 10:32:18 +0530
> +Subject: [PATCH 3/3]=20
> +
> +CVE: CVE-2025-15467
> +Upstream-Status: Backport [https://github.com/openssl/openssl/commit/e06=
66f72294691a808443970b654412a6d92fa0f]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + test/cmsapitest.c                             | 39 ++++++++++++++++++-
> + test/recipes/80-test_cmsapi.t                 |  3 +-
> + .../encDataWithTooLongIV.pem                  | 11 ++++++
> + 3 files changed, 50 insertions(+), 3 deletions(-)
> + create mode 100644 test/recipes/80-test_cmsapi_data/encDataWithTooLongI=
V.pem
> +
> +diff --git a/test/cmsapitest.c b/test/cmsapitest.c
> +index 5839eb7..ab412d3 100644
> +--- a/test/cmsapitest.c
> ++++ b/test/cmsapitest.c
> +@@ -9,10 +9,10 @@
> +=20
> + #include <string.h>
> +=20
> ++#include <openssl/pem.h>
> + #include <openssl/cms.h>
> + #include <openssl/bio.h>
> + #include <openssl/x509.h>
> +-#include <openssl/pem.h>
> + #include "../crypto/cms/cms_local.h" /* for d.signedData and d.envelope=
dData */
> +=20
> + #include "testutil.h"
> +@@ -20,6 +20,7 @@
> + static X509 *cert =3D NULL;
> + static EVP_PKEY *privkey =3D NULL;
> + static char *derin =3D NULL;
> ++static char *too_long_iv_cms_in =3D NULL;
> +=20
> + static int test_encrypt_decrypt(const EVP_CIPHER *cipher)
> + {
> +@@ -382,6 +383,38 @@ end:
> +     return ret;
> + }
> +=20
> ++static int test_cms_aesgcm_iv_too_long(void)
> ++{
> ++    int ret =3D 0;
> ++    BIO *cmsbio =3D NULL, *out =3D NULL;
> ++    CMS_ContentInfo *cms =3D NULL;
> ++    unsigned long err =3D 0;
> ++
> ++    if (!TEST_ptr(cmsbio =3D BIO_new_file(too_long_iv_cms_in, "r")))
> ++        goto end;
> ++
> ++    if (!TEST_ptr(cms =3D PEM_read_bio_CMS(cmsbio, NULL, NULL, NULL)))
> ++        goto end;
> ++
> ++    /* Must fail cleanly (no crash) */
> ++    if (!TEST_false(CMS_decrypt(cms, privkey, cert, NULL, out, 0)))
> ++        goto end;
> ++    err =3D ERR_peek_last_error();
> ++    if (!TEST_ulong_ne(err, 0))
> ++        goto end;
> ++    if (!TEST_int_eq(ERR_GET_LIB(err), ERR_LIB_CMS))
> ++        goto end;
> ++    if (!TEST_int_eq(ERR_GET_REASON(err), CMS_R_CIPHER_PARAMETER_INITIA=
LISATION_ERROR))
> ++        goto end;
> ++
> ++    ret =3D 1;
> ++end:
> ++    CMS_ContentInfo_free(cms);
> ++    BIO_free(cmsbio);
> ++    BIO_free(out);
> ++    return ret;
> ++}
> ++
> + OPT_TEST_DECLARE_USAGE("certfile privkeyfile derfile\n")
> +=20
> + int setup_tests(void)
> +@@ -396,7 +429,8 @@ int setup_tests(void)
> +=20
> +     if (!TEST_ptr(certin =3D test_get_argument(0))
> +             || !TEST_ptr(privkeyin =3D test_get_argument(1))
> +-            || !TEST_ptr(derin =3D test_get_argument(2)))
> ++            || !TEST_ptr(derin =3D test_get_argument(2))
> ++            || !TEST_ptr(too_long_iv_cms_in =3D test_get_argument(3)))
> +         return 0;
> +=20
> +     certbio =3D BIO_new_file(certin, "r");
> +@@ -429,6 +463,7 @@ int setup_tests(void)
> +     ADD_TEST(test_CMS_add1_cert);
> +     ADD_TEST(test_d2i_CMS_bio_NULL);
> +     ADD_ALL_TESTS(test_d2i_CMS_decode, 2);
> ++    ADD_TEST(test_cms_aesgcm_iv_too_long);
> +     return 1;
> + }
> +=20
> +diff --git a/test/recipes/80-test_cmsapi.t b/test/recipes/80-test_cmsapi=
.t
> +index af00355..182629e 100644
> +--- a/test/recipes/80-test_cmsapi.t
> ++++ b/test/recipes/80-test_cmsapi.t
> +@@ -18,5 +18,6 @@ plan tests =3D> 1;
> +=20
> + ok(run(test(["cmsapitest", srctop_file("test", "certs", "servercert.pem=
"),
> +              srctop_file("test", "certs", "serverkey.pem"),
> +-             srctop_file("test", "recipes", "80-test_cmsapi_data", "enc=
ryptedData.der")])),
> ++             srctop_file("test", "recipes", "80-test_cmsapi_data", "enc=
ryptedData.der"),
> ++             srctop_file("test", "recipes", "80-test_cmsapi_data", "enc=
DataWithTooLongIV.pem")])),
> +              "running cmsapitest");
> +diff --git a/test/recipes/80-test_cmsapi_data/encDataWithTooLongIV.pem b=
/test/recipes/80-test_cmsapi_data/encDataWithTooLongIV.pem
> +new file mode 100644
> +index 0000000..4323cd2
> +--- /dev/null
> ++++ b/test/recipes/80-test_cmsapi_data/encDataWithTooLongIV.pem
> +@@ -0,0 +1,11 @@
> ++-----BEGIN CMS-----
> ++MIIBmgYLKoZIhvcNAQkQARegggGJMIIBhQIBADGCATMwggEvAgEAMBcwEjEQMA4G
> ++A1UEAwwHUm9vdCBDQQIBAjANBgkqhkiG9w0BAQEFAASCAQC8ZqP1OqbletcUre1V
> ++b4XOobZzQr6wKMSsdjtGzVbZowUVv5DkOn9VOefrpg4HxMq/oi8IpzVYj8ZiKRMV
> ++NTJ+/d8FwwBwUUNNP/IDnfEpX+rT1+pGS5zAa7NenLoZgGBNjPy5I2OHP23fPnEd
> ++sm8YkFjzubkhAD1lod9pEOEqB3V2kTrTTiwzSNtMHggna1zPox6TkdZwFmMnp8d2
> ++CVa6lIPGx26gFwCuIDSaavmQ2URJ615L8gAvpYUlpsDqjFsabWsbaOFbMz3bIGJu
> ++GkrX2ezX7CpuC1wjix26ojlTySJHv+L0IrpcaIzLlC5lB1rqtuija8dGm3rBNm/P
> ++AAUNMDcGCSqGSIb3DQEHATAjBglghkgBZQMEAQYwFgQRzxwoRQzOHVooVn3CpaWl
> ++paUCARCABUNdolo6BBA55E9hYaYO2S8C/ZnD8dRO
> ++-----END CMS-----
> +--=20
> +2.50.1
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.6.bb b/meta/re=
cipes-connectivity/openssl/openssl_3.2.6.bb
> index 4756f5aaa6..fac62245d7 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.2.6.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.2.6.bb
> @@ -13,6 +13,9 @@ SRC_URI =3D "https://github.com/openssl/openssl/release=
s/download/openssl-${PV}/op
>             file://0001-Configure-do-not-tweak-mips-cflags.patch \
>             file://0001-Added-handshake-history-reporting-when-test-fails=
.patch \
>             file://CVE-2024-41996.patch \
> +           file://CVE-2025-15467-01.patch \
> +           file://CVE-2025-15467-02.patch \
> +           file://CVE-2025-15467-03.patch \
>             "
> =20
>  SRC_URI:append:class-nativesdk =3D " \


--=20
Yoann Congal
Smile ECS


