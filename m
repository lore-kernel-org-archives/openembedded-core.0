Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A9AEA811B
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 13:48:34 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19940.1770731312532170373
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 05:48:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=nz+EtgPE;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so7448895e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 05:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770731311; x=1771336111; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hb9vute3pzl38G595oDUW2OAmKxXTtUnTC6xVqNmpaI=;
        b=nz+EtgPEX1rfwhOfKT1dCM1kXFC2r3+QWEeiw5bgMv8DPsd88ba1wXDzOAzfVfr51+
         E0wP1OZCTwKd0w4dMZprPJHtl3pD36LoEYtLyLHOVd4s445/7TNM3+MKq88FdSL41SIb
         vBjPy0WIlzKS6sc7yvPlO18xfkDyeLLKTwOj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770731311; x=1771336111;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hb9vute3pzl38G595oDUW2OAmKxXTtUnTC6xVqNmpaI=;
        b=sDEXGKgJgvkvOGAieIZIQbhj0wkpjUCxRc+I1G4FpZ1kHw5jioUfRzYOh+LaUX++2l
         Skns+/btA4czijZnfJ2Uv3wcG05MqDU5QaGjwNGLncfdIKQLVaw368MNc4RurVDfx9Gl
         NdKEV7rI8APeMVBqejwG1sI3FK50LjiQAoXrwF7e2iv/Wyu5CzKLd5L5rPMkn/6wKL7t
         QsPcq5Okmljy7t40sz6bJS+X336qjyl6+rJluWaaCZ+LZ3fNRnXLaX+OSyviXJ8++ay+
         DAgllhGZM8YfD6UA2ux/VryD5PDwS2z4DFrcGnnOm1SqIRPkJhxHtTBECXa2JJRjzuRf
         G74w==
X-Forwarded-Encrypted: i=1; AJvYcCXpFigCYBAEM4kgRWkxRDfOsu9o2DHke5c0DN0a5/zcY29to+9L8Df5RKnaYz1cRAiKLKaAPFN7WY6wDsm5EgTCdg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzqV4R789GHUOaWWKYarvTTX8IqRi6L5B7K0cFKV3kjHFUwXGo2
	vHC7GYJ708W/LP4nqLBQRCPVcqeQoF77uYmMUDjCglKzlVTgdFTz+dtlaheGFnqzL8YEurD+bZf
	Km1+e
X-Gm-Gg: AZuq6aJ5OoXgF7Jy8gJzsfxZ0wTemTlVf63lt7/VopjEGhA2eLmqElTwfqrXn9+IEm+
	2NMOBAAYDgT1TBH60l4a/HdHfVu64MAXzBY/Cwq7OzTk9HyySz5fTZDPnpe9hxtkpsSt+oPnxG7
	ZUfKLn9s87K58+cHsUBKCs5jRMKHNmHfvHkuBCmmo3QfEc0Xu8yPvSVneuXj/bxVaUpLS4pMn+T
	SGw+xv2JTG8M0fDEraTCG2LCnPPt64zivMjWL1lE8Z8Ea1rYL80as7vYHbdeV+VmdHDkYQ9QAdR
	hvFx6FM6n/aFH7h7plxCjdOJbhxredds/GeomZfZ83zJzLejNCTP6nePAmN1k7Tleg576K7Jf04
	RECQ9PXY4AcsUhR3oBgcN9pe+AKZnj2I74YU6M6OCsjA1koN6jfMTXCpEgkjBjnxpsFRXMdUWNZ
	EsZFS4mjhfOSSYRtV6IdlEC50qvs9iTIucrqJSrFGAtmu1CsxvXr2++Wd4p1Y3O/eEC9co7vsnn
	AM/5bX2amTN8Mqx
X-Received: by 2002:a05:6000:248a:b0:436:8058:449 with SMTP id ffacd0b85a97d-436805809e9mr17716963f8f.45.1770731310300;
        Tue, 10 Feb 2026 05:48:30 -0800 (PST)
Received: from localhost (2a01cb001331aa00c483744cb4924df7.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:c483:744c:b492:4df7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43768d07fa7sm21882406f8f.35.2026.02.10.05.48.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 05:48:29 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 14:48:29 +0100
Message-Id: <DGBBV1LUK4HQ.YBNXOVNJADDU@smile.fr>
To: "Vijay Anusuri" <vanusuri@mvista.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][kirkstone][PATCH] openssl: upgrade 3.0.18 -> 3.0.19
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260130114208.3509471-1-vanusuri@mvista.com>
 <CANQUz1_noZ2ugqDV_qLHvTeqy_gw0dxVuCKei2Dr12brxwarng@mail.gmail.com>
In-Reply-To: <CANQUz1_noZ2ugqDV_qLHvTeqy_gw0dxVuCKei2Dr12brxwarng@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 13:48:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230899

On Tue Feb 10, 2026 at 2:38 PM CET, Vijay Anusuri wrote:
> Hi Team,
>
> Any Update on this ?

Hello,

I will look at it before the upcoming kirstone 4.0.34 (build date: February=
, 23rd)

Thanks!

>
> Thanks & Regards,
> Vijay
>
> On Fri, Jan 30, 2026 at 5:12=E2=80=AFPM <vanusuri@mvista.com> wrote:
>
>> From: Vijay Anusuri <vanusuri@mvista.com>
>>
>> This release incorporates the following bug fixes and mitigations:
>>
>> Fixed Stack buffer overflow in CMS AuthEnvelopedData parsing.
>> (CVE-2025-15467)
>> Fixed Heap out-of-bounds write in BIO_f_linebuffer on short writes.
>> (CVE-2025-68160)
>> Fixed Unauthenticated/unencrypted trailing bytes with low-level OCB
>> function calls. (CVE-2025-69418)
>> Fixed Out of bounds write in PKCS12_get_friendlyname() UTF-8 conversion.
>> (CVE-2025-69419)
>> Fixed Missing ASN1_TYPE validation in TS_RESP_verify_response() function=
.
>> (CVE-2025-69420)
>> Fixed NULL Pointer Dereference in PKCS12_item_decrypt_d2i_ex() function.
>> (CVE-2025-69421)
>> Fixed Missing ASN1_TYPE validation in PKCS#12 parsing. (CVE-2026-22795)
>> Fixed ASN1_TYPE Type Confusion in the PKCS7_digest_from_attributes()
>> function. (CVE-2026-22796)
>>
>> Changelog:
>> https://github.com/openssl/openssl/blob/openssl-3.0.19/NEWS.md
>>
>> Refreshed CVE-2023-50781 patches for openssl-3.0.19
>>
>> Reference: https://openssl-library.org/news/secadv/20260127.txt
>>
>> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> ---
>>  .../openssl/openssl/CVE-2023-50781-1.patch    |  46 ++++---
>>  .../openssl/openssl/CVE-2023-50781-2.patch    | 112 +++++++++---------
>>  .../openssl/openssl/CVE-2023-50781-3.patch    |  16 ++-
>>  .../{openssl_3.0.18.bb =3D> openssl_3.0.19.bb}  |   2 +-
>>  4 files changed, 85 insertions(+), 91 deletions(-)
>>  rename meta/recipes-connectivity/openssl/{openssl_3.0.18.bb =3D>
>> openssl_3.0.19.bb} (99%)
>>
>> diff --git
>> a/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-1.patch
>> b/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-1.patch
>> index 234fe7b8aa..a00f67027d 100644
>> --- a/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-1.patch
>> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-1.patch
>> @@ -1,7 +1,7 @@
>> -From 24734088e1034392de981151dfe57e3a379ada18 Mon Sep 17 00:00:00 2001
>> +From 295485f5c4b3120b272b81f92356f6d24871c02e Mon Sep 17 00:00:00 2001
>>  From: Hubert Kario <hkario@redhat.com>
>>  Date: Tue, 15 Mar 2022 13:58:08 +0100
>> -Subject: [PATCH 1/3] rsa: add implicit rejection in PKCS#1 v1.5
>> +Subject: [PATCH] rsa: add implicit rejection in PKCS#1 v1.5
>>
>>  The RSA decryption as implemented before required very careful handling
>>  of both the exit code returned by OpenSSL and the potentially returned
>> @@ -43,6 +43,7 @@ Reviewed-by: Tomas Mraz <tomas@openssl.org>
>>  (Merged from https://github.com/openssl/openssl/pull/13817)
>>
>>  Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
>> +
>>  ---
>>   crypto/rsa/rsa_ossl.c                     |  95 +++++++-
>>   crypto/rsa/rsa_pk1.c                      | 252 ++++++++++++++++++++++
>> @@ -56,7 +57,7 @@ Signed-off-by: Jiaying Song <
>> jiaying.song.cn@windriver.com>
>>   9 files changed, 393 insertions(+), 5 deletions(-)
>>
>>  diff --git a/crypto/rsa/rsa_ossl.c b/crypto/rsa/rsa_ossl.c
>> -index 0fc642e777..330302ae55 100644
>> +index 6c32764..d658a3c 100644
>>  --- a/crypto/rsa/rsa_ossl.c
>>  +++ b/crypto/rsa/rsa_ossl.c
>>  @@ -17,6 +17,9 @@
>> @@ -68,8 +69,8 @@ index 0fc642e777..330302ae55 100644
>>  +#include <openssl/hmac.h>
>>
>>   static int rsa_ossl_public_encrypt(int flen, const unsigned char *from=
,
>> -                                   unsigned char *to, RSA *rsa, int
>> padding);
>> -@@ -377,8 +380,13 @@ static int rsa_ossl_private_decrypt(int flen, cons=
t
>> unsigned char *from,
>> +     unsigned char *to, RSA *rsa, int padding);
>> +@@ -373,8 +376,13 @@ static int rsa_ossl_private_decrypt(int flen, cons=
t
>> unsigned char *from,
>>       BIGNUM *f, *ret;
>>       int j, num =3D 0, r =3D -1;
>>       unsigned char *buf =3D NULL;
>> @@ -83,7 +84,7 @@ index 0fc642e777..330302ae55 100644
>>       /*
>>        * Used only if the blinding structure is shared. A non-NULL unbli=
nd
>>        * instructs rsa_blinding_convert() and rsa_blinding_invert() to
>> store
>> -@@ -408,6 +416,11 @@ static int rsa_ossl_private_decrypt(int flen, cons=
t
>> unsigned char *from,
>> +@@ -404,6 +412,11 @@ static int rsa_ossl_private_decrypt(int flen, cons=
t
>> unsigned char *from,
>>           goto err;
>>       }
>>
>> @@ -95,7 +96,7 @@ index 0fc642e777..330302ae55 100644
>>       /* make data into a big number */
>>       if (BN_bin2bn(from, (int)flen, f) =3D=3D NULL)
>>           goto err;
>> -@@ -472,13 +485,91 @@ static int rsa_ossl_private_decrypt(int flen, con=
st
>> unsigned char *from,
>> +@@ -464,13 +477,91 @@ static int rsa_ossl_private_decrypt(int flen, con=
st
>> unsigned char *from,
>>           if (!rsa_blinding_invert(blinding, ret, unblind, ctx))
>>               goto err;
>>
>> @@ -188,17 +189,17 @@ index 0fc642e777..330302ae55 100644
>>           break;
>>       case RSA_PKCS1_OAEP_PADDING:
>>           r =3D RSA_padding_check_PKCS1_OAEP(to, num, buf, j, num, NULL,=
 0);
>> -@@ -501,6 +592,8 @@ static int rsa_ossl_private_decrypt(int flen, const
>> unsigned char *from,
>> +@@ -493,6 +584,8 @@ static int rsa_ossl_private_decrypt(int flen, const
>> unsigned char *from,
>>   #endif
>>
>> -  err:
>> + err:
>>  +    HMAC_CTX_free(hmac);
>>  +    EVP_MD_free(md);
>>       BN_CTX_end(ctx);
>>       BN_CTX_free(ctx);
>>       OPENSSL_clear_free(buf, num);
>>  diff --git a/crypto/rsa/rsa_pk1.c b/crypto/rsa/rsa_pk1.c
>> -index 51507fc030..5cd2b26879 100644
>> +index bebb43a..3fe12b2 100644
>>  --- a/crypto/rsa/rsa_pk1.c
>>  +++ b/crypto/rsa/rsa_pk1.c
>>  @@ -21,10 +21,14 @@
>> @@ -214,7 +215,7 @@ index 51507fc030..5cd2b26879 100644
>>
>>  +
>>   int RSA_padding_add_PKCS1_type_1(unsigned char *to, int tlen,
>> -                                  const unsigned char *from, int flen)
>> +     const unsigned char *from, int flen)
>>   {
>>  @@ -273,6 +277,254 @@ int RSA_padding_check_PKCS1_type_2(unsigned char
>> *to, int tlen,
>>       return constant_time_select_int(good, mlen, -1);
>> @@ -472,7 +473,7 @@ index 51507fc030..5cd2b26879 100644
>>    * ossl_rsa_padding_check_PKCS1_type_2_TLS() checks and removes the
>> PKCS1 type 2
>>    * padding from a decrypted RSA message in a TLS signature. The result
>> is stored
>>  diff --git a/doc/man1/openssl-pkeyutl.pod.in b/doc/man1/
>> openssl-pkeyutl.pod.in
>> -index 2f6ef0021d..015265a74d 100644
>> +index 2f6ef00..015265a 100644
>>  --- a/doc/man1/openssl-pkeyutl.pod.in
>>  +++ b/doc/man1/openssl-pkeyutl.pod.in
>>  @@ -273,6 +273,11 @@ signed or verified directly instead of using a
>> B<DigestInfo> structure. If a
>> @@ -488,7 +489,7 @@ index 2f6ef0021d..015265a74d 100644
>>
>>   For B<x931> if the digest type is set it is used to format the block d=
ata
>>  diff --git a/doc/man1/openssl-rsautl.pod.in b/doc/man1/
>> openssl-rsautl.pod.in
>> -index 0a32fd965b..4c462abc8c 100644
>> +index 0a32fd9..4c462ab 100644
>>  --- a/doc/man1/openssl-rsautl.pod.in
>>  +++ b/doc/man1/openssl-rsautl.pod.in
>>  @@ -105,6 +105,11 @@ The padding to use: PKCS#1 v1.5 (the default),
>> PKCS#1 OAEP,
>> @@ -504,7 +505,7 @@ index 0a32fd965b..4c462abc8c 100644
>>
>>   Hex dump the output data.
>>  diff --git a/doc/man3/EVP_PKEY_CTX_ctrl.pod
>> b/doc/man3/EVP_PKEY_CTX_ctrl.pod
>> -index 3075eaafd6..e788f38809 100644
>> +index 3075eaa..e788f38 100644
>>  --- a/doc/man3/EVP_PKEY_CTX_ctrl.pod
>>  +++ b/doc/man3/EVP_PKEY_CTX_ctrl.pod
>>  @@ -386,6 +386,13 @@ this behaviour should be tolerated then
>> @@ -522,7 +523,7 @@ index 3075eaafd6..e788f38809 100644
>>
>>   EVP_PKEY_CTX_set_dsa_paramgen_bits() sets the number of bits used for =
DSA
>>  diff --git a/doc/man3/EVP_PKEY_decrypt.pod b/doc/man3/EVP_PKEY_decrypt.=
pod
>> -index b6f9bad5f1..898535a7a2 100644
>> +index b6f9bad..898535a 100644
>>  --- a/doc/man3/EVP_PKEY_decrypt.pod
>>  +++ b/doc/man3/EVP_PKEY_decrypt.pod
>>  @@ -51,6 +51,18 @@ return 1 for success and 0 or a negative value for
>> failure. In particular a
>> @@ -545,7 +546,7 @@ index b6f9bad5f1..898535a7a2 100644
>>
>>   Decrypt data using OAEP (for RSA keys):
>>  diff --git a/doc/man3/RSA_padding_add_PKCS1_type_1.pod
>> b/doc/man3/RSA_padding_add_PKCS1_type_1.pod
>> -index 9f7025c497..36ae18563f 100644
>> +index 9f7025c..36ae185 100644
>>  --- a/doc/man3/RSA_padding_add_PKCS1_type_1.pod
>>  +++ b/doc/man3/RSA_padding_add_PKCS1_type_1.pod
>>  @@ -121,8 +121,8 @@ L<ERR_get_error(3)>.
>> @@ -570,7 +571,7 @@ index 9f7025c497..36ae18563f 100644
>>
>>   L<RSA_public_encrypt(3)>,
>>  diff --git a/doc/man3/RSA_public_encrypt.pod
>> b/doc/man3/RSA_public_encrypt.pod
>> -index 1d38073aea..bd3f835ac6 100644
>> +index 1d38073..bd3f835 100644
>>  --- a/doc/man3/RSA_public_encrypt.pod
>>  +++ b/doc/man3/RSA_public_encrypt.pod
>>  @@ -52,8 +52,8 @@ Encrypting user data directly with RSA is insecure.
>> @@ -599,20 +600,17 @@ index 1d38073aea..bd3f835ac6 100644
>>
>>   SSL, PKCS #1 v2.0
>>  diff --git a/include/crypto/rsa.h b/include/crypto/rsa.h
>> -index 949873d0ee..f267e5d9d1 100644
>> +index 797dc1f..2f86e4c 100644
>>  --- a/include/crypto/rsa.h
>>  +++ b/include/crypto/rsa.h
>>  @@ -83,6 +83,10 @@ int ossl_rsa_param_decode(RSA *rsa, const X509_ALGOR
>> *alg);
>>   RSA *ossl_rsa_key_from_pkcs8(const PKCS8_PRIV_KEY_INFO *p8inf,
>> -                              OSSL_LIB_CTX *libctx, const char *propq);
>> +     OSSL_LIB_CTX *libctx, const char *propq);
>>
>>  +int ossl_rsa_padding_check_PKCS1_type_2(OSSL_LIB_CTX *ctx,
>>  +                                        unsigned char *to, int tlen,
>>  +                                        const unsigned char *from, int
>> flen,
>>  +                                        int num, unsigned char *kdk);
>>   int ossl_rsa_padding_check_PKCS1_type_2_TLS(OSSL_LIB_CTX *ctx, unsigne=
d
>> char *to,
>> -                                             size_t tlen,
>> -                                             const unsigned char *from,
>> ---
>> -2.34.1
>> -
>> +     size_t tlen,
>> +     const unsigned char *from,
>> diff --git
>> a/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-2.patch
>> b/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-2.patch
>> index b336d9e850..13ea3c717a 100644
>> --- a/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-2.patch
>> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-2.patch
>> @@ -1,7 +1,7 @@
>> -From e92f0cd3b03e5aca948b03df7e3d02e536700f68 Mon Sep 17 00:00:00 2001
>> +From 584936eb09cef64eb0755c0ccb2661e7ba1aea58 Mon Sep 17 00:00:00 2001
>>  From: Hubert Kario <hkario@redhat.com>
>>  Date: Thu, 27 Oct 2022 19:16:58 +0200
>> -Subject: [PATCH 2/3] rsa: Add option to disable implicit rejection
>> +Subject: [PATCH] rsa: Add option to disable implicit rejection
>>
>>  CVE: CVE-2023-50781
>>
>> @@ -14,6 +14,7 @@ Reviewed-by: Tomas Mraz <tomas@openssl.org>
>>  (Merged from https://github.com/openssl/openssl/pull/13817)
>>
>>  Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
>> +
>>  ---
>>   crypto/cms/cms_env.c                          |  7 +++++
>>   crypto/evp/ctrl_params_translate.c            |  6 +++++
>> @@ -28,10 +29,10 @@ Signed-off-by: Jiaying Song <
>> jiaying.song.cn@windriver.com>
>>   10 files changed, 95 insertions(+), 8 deletions(-)
>>
>>  diff --git a/crypto/cms/cms_env.c b/crypto/cms/cms_env.c
>> -index 445a16fb77..49b0289114 100644
>> +index 2326253..96e3315 100644
>>  --- a/crypto/cms/cms_env.c
>>  +++ b/crypto/cms/cms_env.c
>> -@@ -581,6 +581,13 @@ static int
>> cms_RecipientInfo_ktri_decrypt(CMS_ContentInfo *cms,
>> +@@ -576,6 +576,13 @@ static int
>> cms_RecipientInfo_ktri_decrypt(CMS_ContentInfo *cms,
>>       if (!ossl_cms_env_asn1_ctrl(ri, 1))
>>           goto err;
>>
>> @@ -43,15 +44,15 @@ index 445a16fb77..49b0289114 100644
>>  +        EVP_PKEY_CTX_ctrl_str(ktri->pctx,
>> "rsa_pkcs1_implicit_rejection", "0");
>>  +
>>       if (EVP_PKEY_decrypt(ktri->pctx, NULL, &eklen,
>> -                          ktri->encryptedKey->data,
>> -                          ktri->encryptedKey->length) <=3D 0)
>> +             ktri->encryptedKey->data,
>> +             ktri->encryptedKey->length)
>>  diff --git a/crypto/evp/ctrl_params_translate.c
>> b/crypto/evp/ctrl_params_translate.c
>> -index 44d0895bcf..db7325439a 100644
>> +index 14306a0..b481776 100644
>>  --- a/crypto/evp/ctrl_params_translate.c
>>  +++ b/crypto/evp/ctrl_params_translate.c
>> -@@ -2269,6 +2269,12 @@ static const struct translation_st
>> evp_pkey_ctx_translations[] =3D {
>> -       EVP_PKEY_CTRL_GET_RSA_OAEP_LABEL, NULL, NULL,
>> -       OSSL_ASYM_CIPHER_PARAM_OAEP_LABEL, OSSL_PARAM_OCTET_PTR, NULL },
>> +@@ -2249,6 +2249,12 @@ static const struct translation_st
>> evp_pkey_ctx_translations[] =3D {
>> +         EVP_PKEY_CTRL_GET_RSA_OAEP_LABEL, NULL, NULL,
>> +         OSSL_ASYM_CIPHER_PARAM_OAEP_LABEL, OSSL_PARAM_OCTET_PTR, NULL =
},
>>
>>  +    { SET, EVP_PKEY_RSA, 0, EVP_PKEY_OP_TYPE_CRYPT,
>>  +      EVP_PKEY_CTRL_RSA_IMPLICIT_REJECTION, NULL,
>> @@ -60,13 +61,13 @@ index 44d0895bcf..db7325439a 100644
>>  +      NULL },
>>  +
>>       { SET, EVP_PKEY_RSA_PSS, 0, EVP_PKEY_OP_TYPE_GEN,
>> -       EVP_PKEY_CTRL_MD, "rsa_pss_keygen_md", NULL,
>> -       OSSL_ALG_PARAM_DIGEST, OSSL_PARAM_UTF8_STRING, fix_md },
>> +         EVP_PKEY_CTRL_MD, "rsa_pss_keygen_md", NULL,
>> +         OSSL_ALG_PARAM_DIGEST, OSSL_PARAM_UTF8_STRING, fix_md },
>>  diff --git a/crypto/rsa/rsa_ossl.c b/crypto/rsa/rsa_ossl.c
>> -index 330302ae55..4bdacd5ed9 100644
>> +index d658a3c..5a0b160 100644
>>  --- a/crypto/rsa/rsa_ossl.c
>>  +++ b/crypto/rsa/rsa_ossl.c
>> -@@ -395,6 +395,12 @@ static int rsa_ossl_private_decrypt(int flen, cons=
t
>> unsigned char *from,
>> +@@ -391,6 +391,12 @@ static int rsa_ossl_private_decrypt(int flen, cons=
t
>> unsigned char *from,
>>       BIGNUM *unblind =3D NULL;
>>       BN_BLINDING *blinding =3D NULL;
>>
>> @@ -79,7 +80,7 @@ index 330302ae55..4bdacd5ed9 100644
>>       if ((ctx =3D BN_CTX_new_ex(rsa->libctx)) =3D=3D NULL)
>>           goto err;
>>       BN_CTX_start(ctx);
>> -@@ -489,7 +495,7 @@ static int rsa_ossl_private_decrypt(int flen, const
>> unsigned char *from,
>> +@@ -481,7 +487,7 @@ static int rsa_ossl_private_decrypt(int flen, const
>> unsigned char *from,
>>        * derive the Key Derivation Key from private exponent and public
>>        * ciphertext
>>        */
>> @@ -88,7 +89,7 @@ index 330302ae55..4bdacd5ed9 100644
>>           /*
>>            * because we use d as a handle to rsa->d we need to keep it
>> local and
>>            * free before any further use of rsa->d
>> -@@ -565,11 +571,11 @@ static int rsa_ossl_private_decrypt(int flen, con=
st
>> unsigned char *from,
>> +@@ -557,11 +563,11 @@ static int rsa_ossl_private_decrypt(int flen, con=
st
>> unsigned char *from,
>>           goto err;
>>
>>       switch (padding) {
>> @@ -105,7 +106,7 @@ index 330302ae55..4bdacd5ed9 100644
>>       case RSA_PKCS1_OAEP_PADDING:
>>           r =3D RSA_padding_check_PKCS1_OAEP(to, num, buf, j, num, NULL,=
 0);
>>  diff --git a/crypto/rsa/rsa_pmeth.c b/crypto/rsa/rsa_pmeth.c
>> -index 0bf5ac098a..81b031f81b 100644
>> +index 85cdfb4..7f3d810 100644
>>  --- a/crypto/rsa/rsa_pmeth.c
>>  +++ b/crypto/rsa/rsa_pmeth.c
>>  @@ -52,6 +52,8 @@ typedef struct {
>> @@ -133,17 +134,17 @@ index 0bf5ac098a..81b031f81b 100644
>>       if (sctx->oaep_label) {
>>           OPENSSL_free(dctx->oaep_label);
>>           dctx->oaep_label =3D OPENSSL_memdup(sctx->oaep_label,
>> sctx->oaep_labellen);
>> -@@ -347,6 +351,7 @@ static int pkey_rsa_decrypt(EVP_PKEY_CTX *ctx,
>> -                             const unsigned char *in, size_t inlen)
>> +@@ -345,6 +349,7 @@ static int pkey_rsa_decrypt(EVP_PKEY_CTX *ctx,
>> +     const unsigned char *in, size_t inlen)
>>   {
>>       int ret;
>>  +    int pad_mode;
>>       RSA_PKEY_CTX *rctx =3D ctx->data;
>>       /*
>>        * Discard const. Its marked as const because this may be a cached
>> copy of
>> -@@ -367,7 +372,12 @@ static int pkey_rsa_decrypt(EVP_PKEY_CTX *ctx,
>> -                                                 rctx->oaep_labellen,
>> -                                                 rctx->md, rctx->mgf1md=
);
>> +@@ -365,7 +370,12 @@ static int pkey_rsa_decrypt(EVP_PKEY_CTX *ctx,
>> +             rctx->oaep_labellen,
>> +             rctx->md, rctx->mgf1md);
>>       } else {
>>  -        ret =3D RSA_private_decrypt(inlen, in, out, rsa, rctx->pad_mod=
e);
>>  +        if (rctx->pad_mode =3D=3D RSA_PKCS1_PADDING &&
>> @@ -155,7 +156,7 @@ index 0bf5ac098a..81b031f81b 100644
>>       }
>>       *outlen =3D constant_time_select_s(constant_time_msb_s(ret), *outl=
en,
>> ret);
>>       ret =3D constant_time_select_int(constant_time_msb(ret), ret, 1);
>> -@@ -591,6 +601,14 @@ static int pkey_rsa_ctrl(EVP_PKEY_CTX *ctx, int
>> type, int p1, void *p2)
>> +@@ -587,6 +597,14 @@ static int pkey_rsa_ctrl(EVP_PKEY_CTX *ctx, int
>> type, int p1, void *p2)
>>           *(unsigned char **)p2 =3D rctx->oaep_label;
>>           return rctx->oaep_labellen;
>>
>> @@ -171,7 +172,7 @@ index 0bf5ac098a..81b031f81b 100644
>>       case EVP_PKEY_CTRL_PKCS7_SIGN:
>>   #ifndef OPENSSL_NO_CMS
>>  diff --git a/doc/man1/openssl-pkeyutl.pod.in b/doc/man1/
>> openssl-pkeyutl.pod.in
>> -index 015265a74d..5e62551d34 100644
>> +index 015265a..5e62551 100644
>>  --- a/doc/man1/openssl-pkeyutl.pod.in
>>  +++ b/doc/man1/openssl-pkeyutl.pod.in
>>  @@ -305,6 +305,16 @@ explicitly set in PSS mode then the signing digest
>> is used.
>> @@ -192,7 +193,7 @@ index 015265a74d..5e62551d34 100644
>>
>>   =3Dhead1 RSA-PSS ALGORITHM
>>  diff --git a/doc/man3/EVP_PKEY_CTX_ctrl.pod
>> b/doc/man3/EVP_PKEY_CTX_ctrl.pod
>> -index e788f38809..3844aa2199 100644
>> +index e788f38..3844aa2 100644
>>  --- a/doc/man3/EVP_PKEY_CTX_ctrl.pod
>>  +++ b/doc/man3/EVP_PKEY_CTX_ctrl.pod
>>  @@ -392,6 +392,8 @@ instead of padding errors in case padding checks
>> fail. Applications that
>> @@ -205,7 +206,7 @@ index e788f38809..3844aa2199 100644
>>   =3Dhead2 DSA parameters
>>
>>  diff --git a/doc/man7/provider-asym_cipher.pod
>> b/doc/man7/provider-asym_cipher.pod
>> -index 0976a263a8..2a8426a6ed 100644
>> +index 0976a26..2a8426a 100644
>>  --- a/doc/man7/provider-asym_cipher.pod
>>  +++ b/doc/man7/provider-asym_cipher.pod
>>  @@ -234,6 +234,15 @@ The TLS protocol version first requested by the
>> client.
>> @@ -225,50 +226,50 @@ index 0976a263a8..2a8426a6ed 100644
>>
>>   OSSL_FUNC_asym_cipher_gettable_ctx_params() and
>> OSSL_FUNC_asym_cipher_settable_ctx_params()
>>  diff --git a/include/openssl/core_names.h b/include/openssl/core_names.=
h
>> -index 6bed5a8a67..5a350b537f 100644
>> +index 02bebc6..9586a6d 100644
>>  --- a/include/openssl/core_names.h
>>  +++ b/include/openssl/core_names.h
>>  @@ -292,6 +292,7 @@ extern "C" {
>> - #define OSSL_PKEY_PARAM_DIST_ID             "distid"
>> - #define OSSL_PKEY_PARAM_PUB_KEY             "pub"
>> - #define OSSL_PKEY_PARAM_PRIV_KEY            "priv"
>> -+#define OSSL_PKEY_PARAM_IMPLICIT_REJECTION  "implicit-rejection"
>> + #define OSSL_PKEY_PARAM_DIST_ID "distid"
>> + #define OSSL_PKEY_PARAM_PUB_KEY "pub"
>> + #define OSSL_PKEY_PARAM_PRIV_KEY "priv"
>> ++#define OSSL_PKEY_PARAM_IMPLICIT_REJECTION "implicit-rejection"
>>
>>   /* Diffie-Hellman/DSA Parameters */
>> - #define OSSL_PKEY_PARAM_FFC_P               "p"
>> + #define OSSL_PKEY_PARAM_FFC_P "p"
>>  @@ -467,6 +468,7 @@ extern "C" {
>> - #define OSSL_ASYM_CIPHER_PARAM_OAEP_LABEL               "oaep-label"
>> - #define OSSL_ASYM_CIPHER_PARAM_TLS_CLIENT_VERSION
>>  "tls-client-version"
>> - #define OSSL_ASYM_CIPHER_PARAM_TLS_NEGOTIATED_VERSION
>>  "tls-negotiated-version"
>> -+#define OSSL_ASYM_CIPHER_PARAM_IMPLICIT_REJECTION
>>  "implicit-rejection"
>> + #define OSSL_ASYM_CIPHER_PARAM_OAEP_LABEL "oaep-label"
>> + #define OSSL_ASYM_CIPHER_PARAM_TLS_CLIENT_VERSION "tls-client-version"
>> + #define OSSL_ASYM_CIPHER_PARAM_TLS_NEGOTIATED_VERSION
>> "tls-negotiated-version"
>> ++#define OSSL_ASYM_CIPHER_PARAM_IMPLICIT_REJECTION "implicit-rejection"
>>
>>   /*
>>    * Encoder / decoder parameters
>>  diff --git a/include/openssl/rsa.h b/include/openssl/rsa.h
>> -index a55c9727c6..247f9014e3 100644
>> +index 36a780d..ceb05b2 100644
>>  --- a/include/openssl/rsa.h
>>  +++ b/include/openssl/rsa.h
>>  @@ -183,6 +183,8 @@ int EVP_PKEY_CTX_get0_rsa_oaep_label(EVP_PKEY_CTX
>> *ctx, unsigned char **label);
>>
>> - # define EVP_PKEY_CTRL_RSA_KEYGEN_PRIMES  (EVP_PKEY_ALG_CTRL + 13)
>> + #define EVP_PKEY_CTRL_RSA_KEYGEN_PRIMES (EVP_PKEY_ALG_CTRL + 13)
>>
>> -+# define EVP_PKEY_CTRL_RSA_IMPLICIT_REJECTION (EVP_PKEY_ALG_CTRL + 14)
>> ++#define EVP_PKEY_CTRL_RSA_IMPLICIT_REJECTION (EVP_PKEY_ALG_CTRL + 14)
>>  +
>> - # define RSA_PKCS1_PADDING          1
>> - # define RSA_NO_PADDING             3
>> - # define RSA_PKCS1_OAEP_PADDING     4
>> + #define RSA_PKCS1_PADDING 1
>> + #define RSA_NO_PADDING 3
>> + #define RSA_PKCS1_OAEP_PADDING 4
>>  @@ -192,6 +194,9 @@ int EVP_PKEY_CTX_get0_rsa_oaep_label(EVP_PKEY_CTX
>> *ctx, unsigned char **label);
>> - # define RSA_PKCS1_PSS_PADDING      6
>> - # define RSA_PKCS1_WITH_TLS_PADDING 7
>> + #define RSA_PKCS1_PSS_PADDING 6
>> + #define RSA_PKCS1_WITH_TLS_PADDING 7
>>
>>  +/* internal RSA_ only */
>> -+# define RSA_PKCS1_NO_IMPLICIT_REJECT_PADDING 8
>> ++#define RSA_PKCS1_NO_IMPLICIT_REJECT_PADDING 8
>>  +
>> - # define RSA_PKCS1_PADDING_SIZE    11
>> + #define RSA_PKCS1_PADDING_SIZE 11
>>
>> - # define RSA_set_app_data(s,arg)         RSA_set_ex_data(s,0,arg)
>> + #define RSA_set_app_data(s, arg) RSA_set_ex_data(s, 0, arg)
>>  diff --git a/providers/implementations/asymciphers/rsa_enc.c
>> b/providers/implementations/asymciphers/rsa_enc.c
>> -index c8921acd6e..11a91e62b1 100644
>> +index 799357f3..1e74150 100644
>>  --- a/providers/implementations/asymciphers/rsa_enc.c
>>  +++ b/providers/implementations/asymciphers/rsa_enc.c
>>  @@ -75,6 +75,8 @@ typedef struct {
>> @@ -288,7 +289,7 @@ index c8921acd6e..11a91e62b1 100644
>>
>>       switch (RSA_test_flags(prsactx->rsa, RSA_FLAG_TYPE_MASK)) {
>>       case RSA_FLAG_TYPE_RSA:
>> -@@ -199,6 +202,7 @@ static int rsa_decrypt(void *vprsactx, unsigned cha=
r
>> *out, size_t *outlen,
>> +@@ -203,6 +206,7 @@ static int rsa_decrypt(void *vprsactx, unsigned cha=
r
>> *out, size_t *outlen,
>>   {
>>       PROV_RSA_CTX *prsactx =3D (PROV_RSA_CTX *)vprsactx;
>>       int ret;
>> @@ -296,12 +297,12 @@ index c8921acd6e..11a91e62b1 100644
>>       size_t len =3D RSA_size(prsactx->rsa);
>>
>>       if (!ossl_prov_is_running())
>> -@@ -276,8 +280,12 @@ static int rsa_decrypt(void *vprsactx, unsigned ch=
ar
>> *out, size_t *outlen,
>> +@@ -280,8 +284,12 @@ static int rsa_decrypt(void *vprsactx, unsigned ch=
ar
>> *out, size_t *outlen,
>>           }
>>           OPENSSL_free(tbuf);
>>       } else {
>>  -        ret =3D RSA_private_decrypt(inlen, in, out, prsactx->rsa,
>> --                                  prsactx->pad_mode);
>> +-            prsactx->pad_mode);
>>  +        if ((prsactx->implicit_rejection =3D=3D 0) &&
>>  +                (prsactx->pad_mode =3D=3D RSA_PKCS1_PADDING))
>>  +            pad_mode =3D RSA_PKCS1_NO_IMPLICIT_REJECT_PADDING;
>> @@ -311,7 +312,7 @@ index c8921acd6e..11a91e62b1 100644
>>       }
>>       *outlen =3D constant_time_select_s(constant_time_msb_s(ret), *outl=
en,
>> ret);
>>       ret =3D constant_time_select_int(constant_time_msb(ret), 0, 1);
>> -@@ -401,6 +409,10 @@ static int rsa_get_ctx_params(void *vprsactx,
>> OSSL_PARAM *params)
>> +@@ -403,6 +411,10 @@ static int rsa_get_ctx_params(void *vprsactx,
>> OSSL_PARAM *params)
>>       if (p !=3D NULL && !OSSL_PARAM_set_uint(p, prsactx->alt_version))
>>           return 0;
>>
>> @@ -322,8 +323,8 @@ index c8921acd6e..11a91e62b1 100644
>>       return 1;
>>   }
>>
>> -@@ -412,6 +424,7 @@ static const OSSL_PARAM known_gettable_ctx_params[]=
 =3D
>> {
>> -                     NULL, 0),
>> +@@ -414,6 +426,7 @@ static const OSSL_PARAM known_gettable_ctx_params[]=
 =3D
>> {
>> +         NULL, 0),
>>       OSSL_PARAM_uint(OSSL_ASYM_CIPHER_PARAM_TLS_CLIENT_VERSION, NULL),
>>       OSSL_PARAM_uint(OSSL_ASYM_CIPHER_PARAM_TLS_NEGOTIATED_VERSION, NUL=
L),
>>  +    OSSL_PARAM_uint(OSSL_ASYM_CIPHER_PARAM_IMPLICIT_REJECTION, NULL),
>> @@ -353,6 +354,3 @@ index c8921acd6e..11a91e62b1 100644
>>       OSSL_PARAM_END
>>   };
>>
>> ---
>> -2.34.1
>> -
>> diff --git
>> a/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-3.patch
>> b/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-3.patch
>> index 0a1f63f30a..324e41ed2f 100644
>> --- a/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-3.patch
>> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-3.patch
>> @@ -1,7 +1,7 @@
>> -From ba78f7b0599ba5bfb5032dd2664465c5b13388e3 Mon Sep 17 00:00:00 2001
>> +From 156a6ca5791f9c642a77270a90d5dbd0a3a7a33d Mon Sep 17 00:00:00 2001
>>  From: Hubert Kario <hkario@redhat.com>
>>  Date: Tue, 22 Nov 2022 18:25:49 +0100
>> -Subject: [PATCH 3/3] smime/pkcs7: disable the Bleichenbacher workaround
>> +Subject: [PATCH] smime/pkcs7: disable the Bleichenbacher workaround
>>
>>  CVE: CVE-2023-50781
>>
>> @@ -14,15 +14,16 @@ Reviewed-by: Tomas Mraz <tomas@openssl.org>
>>  (Merged from https://github.com/openssl/openssl/pull/13817)
>>
>>  Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
>> +
>>  ---
>>   crypto/pkcs7/pk7_doit.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>>  diff --git a/crypto/pkcs7/pk7_doit.c b/crypto/pkcs7/pk7_doit.c
>> -index e9de097da1..6d3124da87 100644
>> +index a38e8a3..d751f5e 100644
>>  --- a/crypto/pkcs7/pk7_doit.c
>>  +++ b/crypto/pkcs7/pk7_doit.c
>> -@@ -170,6 +170,13 @@ static int pkcs7_decrypt_rinfo(unsigned char **pek=
,
>> int *peklen,
>> +@@ -168,6 +168,13 @@ static int pkcs7_decrypt_rinfo(unsigned char **pek=
,
>> int *peklen,
>>       if (EVP_PKEY_decrypt_init(pctx) <=3D 0)
>>           goto err;
>>
>> @@ -34,8 +35,5 @@ index e9de097da1..6d3124da87 100644
>>  +        EVP_PKEY_CTX_ctrl_str(pctx, "rsa_pkcs1_implicit_rejection", "0=
");
>>  +
>>       if (EVP_PKEY_decrypt(pctx, NULL, &eklen,
>> -                          ri->enc_key->data, ri->enc_key->length) <=3D =
0)
>> -         goto err;
>> ---
>> -2.34.1
>> -
>> +             ri->enc_key->data, ri->enc_key->length)
>> +         <=3D 0)
>> diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.18.bb
>> b/meta/recipes-connectivity/openssl/openssl_3.0.19.bb
>> similarity index 99%
>> rename from meta/recipes-connectivity/openssl/openssl_3.0.18.bb
>> rename to meta/recipes-connectivity/openssl/openssl_3.0.19.bb
>> index a8dd338327..293b450cd0 100644
>> --- a/meta/recipes-connectivity/openssl/openssl_3.0.18.bb
>> +++ b/meta/recipes-connectivity/openssl/openssl_3.0.19.bb
>> @@ -25,7 +25,7 @@ SRC_URI:append:class-nativesdk =3D " \
>>             file://environment.d-openssl.sh \
>>             "
>>
>> -SRC_URI[sha256sum] =3D
>> "d80c34f5cf902dccf1f1b5df5ebb86d0392e37049e5d73df1b3abae72e4ffe8b"
>> +SRC_URI[sha256sum] =3D
>> "fa5a4143b8aae18be53ef2f3caf29a2e0747430b8bc74d32d88335b94ab63072"
>>
>>  inherit lib_package multilib_header multilib_script ptest perlnative
>>  MULTILIB_SCRIPTS =3D "${PN}-bin:${bindir}/c_rehash"
>> --
>> 2.25.1
>>
>>


--=20
Yoann Congal
Smile ECS


