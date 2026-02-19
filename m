Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B45E9A048
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 10:02:14 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10556.1771495325754344416
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 02:02:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hX2ftkt8;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4837634de51so3639565e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 02:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771495324; x=1772100124; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ji3Z9YDnpVsXkVLh1yLS3ycr9CilxNue8+g6k/KG8qg=;
        b=hX2ftkt8832sFCUkrmPerPa+VCT0OOCB4gx5hOfvb1ydcmfk6bhRsDikWjOcJFxMdZ
         ljTZLfALLawuyxRjt8U8oiUp5pXldNS6RlWFxOtdE6efxig48cHW3v3w6D+eXhAiBoEM
         b58wpDZqGzc5MlpqPc2WlLslXCzFTOxGK/Gyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771495324; x=1772100124;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ji3Z9YDnpVsXkVLh1yLS3ycr9CilxNue8+g6k/KG8qg=;
        b=YlZgGnfdU6c3i+HA3wTcaSrrKx30ckIwPFOr7KkUzV52WzulrnDpysHdRP3MZywxTU
         u6K3Y5R6DvANXVk6UMnuAAVH6Y2P9iOoYY+u6BEWpEKZ6h7e2TxJlLTb+YT21a4NPuFd
         4A//dFy+XlbLMkNFO5AHxZhhs7+4SNQyBEhyZSniJpmF+4mvtomCP24xUag2DxzG4+SC
         5Bw67YS62h6ySofWUxVtIN/EOepP9mvQaCsNHR3B6k20ctDLmOZ4OsHkQEeN2xytpBJ/
         RsN1HGZyjQ+Swn5EozuAyZbLOPOWKldtvrGq3F8G+5iz4dCUEX9XWoZFu2dhNhjLEjQQ
         H3Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWATq3jlEdlLR8MtkJEQz27T7cPbVkAfZhmrP2P4d+409/f3bJ14Iawq3YlC7YCPuhogZi+hgIMZglC++hALZFqdw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxlP6SuUDpDtJv4+Vf3trANhuabksmz7p9hl+PWFFyky+gt52lC
	W+T5TUwY2ecbyJ+C7aPBq/XgOh7J6ghc8holc/v9Jdu8PxbtlF4rmE8fFHdvOzpxA38=
X-Gm-Gg: AZuq6aKQavwY+ZuBukaxxxgutcMKvBlRpLoSmcT/BFw7rGnoJ3j5qRby6az0p5mX3pR
	+SvZsGn3+xDH/jhdyezXvMjChSdxK1XBnW469Cw9krq9t/CgSdc6boha7U+9Uc/g2A5OpCuXcny
	5c+ohXua7Fi6T8bvvXm+fbMjATNCLSZYGCFuuKIuOgWXCgdqS6OuVBnGYEmjdTFLWbBncf0tf9Y
	/iVU1X11L124xS1A4SXK5XVXY/96KMjuZD8Vdt/B/2i8Z4MFsjEp4/F6mIM3C+d6ybuw/dtC7Op
	GNPrgCm3P8aAlG9p5z6RNDzgax8y0rCSPOAciFi+5RVaOQ7tq/VN47ETxzn+RA/wWCte93PRAou
	mbNrbSAeJNrUbw72nrwpee3iUjPENrS4wj121fjvMpkov1pWHltWqu0LUbBX0nAq8D/tvfbNZYZ
	YEb5vfLbYrOAOFhfGAps9M6aCzh+vG8eohuZdHeDakDGInCS5JOrCcjIT4vEX4hs3DbjexlfojY
	JaBclTDCd/SzxY=
X-Received: by 2002:a05:600c:474e:b0:479:3a86:dc1f with SMTP id 5b1f17b1804b1-4837109740amr364488085e9.37.1771495323754;
        Thu, 19 Feb 2026 02:02:03 -0800 (PST)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4837e565f5esm522093465e9.10.2026.02.19.02.02.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 02:02:03 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 11:02:02 +0100
Message-Id: <DGIUOKEX70I8.H1SWS5I9XCLT@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] openssl: fix CVE-2025-15467
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260130054350.300667-1-hprajapati@mvista.com>
In-Reply-To: <20260130054350.300667-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 10:02:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231419

Hello,

On Fri Jan 30, 2026 at 6:43 AM CET, Hitendra Prajapati via lists.openembedd=
ed.org wrote:
> Upstream-Status: Backport from https://github.com/openssl/openssl/commit/=
ce39170276daec87f55c39dad1f629b56344429e && https://github.com/openssl/open=
ssl/commit/cdccf8f2ef17ae020bd69360c43a39306b89c381 && https://github.com/o=
penssl/openssl/commit/e0666f72294691a808443970b654412a6d92fa0f

The Upstream-Status line is only useful in patches, not in commit
message body.

Can you add a justification as to why this patch does fix the CVE? (This
applies generally to all CVE patches). In this case, something like:
Backport patch from NVD report: https://nvd.nist.gov/vuln/detail/CVE-2025-1=
5467

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

Why do you backport a patch adding comments only?

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


Can you send a v2 with the above comments fixed?
Thanks!
--=20
Yoann Congal
Smile ECS


