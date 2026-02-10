Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE2CEA8116
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 13:38:34 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19750.1770730713499847127
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 05:38:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=V4m9nNkd;
 spf=pass (domain: mvista.com, ip: 209.85.218.43, mailfrom: vanusuri@mvista.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b883c8dfb00so141928466b.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 05:38:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770730711; cv=none;
        d=google.com; s=arc-20240605;
        b=EbIJNvqScGSmPT7tLThFbCmD9Iif9RilvgriHGxxluNUOK22kyt1FqMY21oqq+DuND
         qS5RdTmOL5BxI/qcju35n3HYjrqcBkUXqiPBu28CPTMHTB5ZSRWhNFMEFP1c330eFGMa
         4uqrrqsJSumW5pDyXZGQW5G5GPwSgWwAWuskTaLtyUWrmrTfFSC31PZJ2YVrVwa++j1+
         sWCnLx6dIh32zI92nMdX8u6A9Nzzk3Bz7znT5v3l+Ch7hpkyG4GTu1yVGbynsy4LfiXo
         MUY3r4sEBbTVrZs93sK+nI2/+sBJWH7kfxOW3VJ+1hE/3nb6tZv+BLA0w4w2xVn+zBgS
         unFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=MQbiQSDZgcsWFEtCNYVZ3Si5RuJZA2/S9cYbPp08FOQ=;
        fh=PBMH0vnS+Vw0fKk9zyJKK1USyGhsPWdEwCClCz5VcdE=;
        b=AE/6D0ZApOBmWna/y1mqTbiC1LxXBZ7EY2aZUCbFYRbiXtjS1wrJ5hE7nQMd7ojpy4
         U8fx1AVZ9sXhopFkEzn6kAHvBGZh7upg1xnO5x7Jkb0rzMpGRXGENsOw5PBHHHFxrAsX
         Cl+ljchYLKLR1ksV3zf8lRvE2YJW6sLwxd6EJQ/PKlnxNhlZbrRDI+15c+V2g2eSD9FJ
         +IQZ5GPjCWva9pb/+NuBL2W7DJkluereh5oto8Q59PmWyG7z0Liil1FmS4qqRorhtCa3
         HHmK6JUJP9qLbRhXr4vkLPiGgjbmM/OO+Njxo1/3WqpcOV1ohEU1MG+mGVqlcvOhHA80
         0HHg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1770730711; x=1771335511; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MQbiQSDZgcsWFEtCNYVZ3Si5RuJZA2/S9cYbPp08FOQ=;
        b=V4m9nNkdn2ivpDH43K/7q7PUuY9MF2PkW0Sv7UlyodIwsCkGPY+XLWoy/EyKRGqeAk
         miqonQGQJU3CzjepRt1+0pDsz4huiKdZobRpzf9y25O3sVtkZGmtIY45dxsqfVKlEc9F
         Z1WPg6K2J63ZGRiEFz6linbkwb2iMx9IY31zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770730711; x=1771335511;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MQbiQSDZgcsWFEtCNYVZ3Si5RuJZA2/S9cYbPp08FOQ=;
        b=odDmWzL/QcfVZiEculj00em50UhdkHUro4JFaQ/DhoEfm0teMqZIZmDuk+SZW+HP0K
         Yg97q8Q75pL+cq0ihLF5JelOOlLPUVUu47+BOM49zNFk3DZIKMMA0swELlgw3L5eOkQ8
         sqzdihRHIR+IkngQHlWi9YIXRTMX6UhVsFgFxCV4nbZ4e0KaKmugUqJfoCkKhQbbWbl2
         elTaiBVMPPHK1k3zFL5k+P0mS/q4QBPyDGSqsLEpbwVUC8fYTID6vdcGLZqOngEpNJ44
         ee34Y8Yksjlh48F0dgK9bbgbsoG10bUfsAYoYpQTVCqCeyCoFREaUVR0kP8avrwMqUMW
         Hp3Q==
X-Gm-Message-State: AOJu0YxCIflwxhenp+0eqncZcOInP8UhDnNQMaTm4/Fd8nnKk1TMSxcY
	oG42OVN84V5pWx9FSw+8kwrL7ioDw60St3QzrZIb7/wUDqzV7WpUrLgowfXWqd10n+1WRNQ/E3+
	X4NtRtrexKGbZTAyNT/DZ5JJT8wFk6scdGhAaVZLJV6jGNxIYsvpIC68=
X-Gm-Gg: AZuq6aI3GnWWRJf3x1iVh3hpGL0pOTtOnVXgMNDY14iMI+KWkLEn9jyI0Pk6gLX4aJi
	ud6HaN+sLT0ULk+Myu/GqfM4gRZRsqPOjZsO9e9AVOr1Jfh5DQTEYMjdVU+g6nkrYn6hO38jMXQ
	sAxhA6iW3KcLJtDA/wYfUdLxiYtVEx8aWRAsvNNSlx7kWNHCg+8flY/am19a/4Ny8k4XP4gctwR
	9Ksz1I8EIQDw0BMrba917+v29Ug42Mi7pkds6lAUfk8aQo1zx94lutXa5ZYViE5utkMX6GkbBpb
	GPjHudCSa0/Br35IHH3aCySTcWe63vb7CDNRW0F1SFeQfun0
X-Received: by 2002:a17:907:9721:b0:b8a:fc17:56da with SMTP id
 a640c23a62f3a-b8edf45664amr918183066b.58.1770730710955; Tue, 10 Feb 2026
 05:38:30 -0800 (PST)
MIME-Version: 1.0
References: <20260130114208.3509471-1-vanusuri@mvista.com>
In-Reply-To: <20260130114208.3509471-1-vanusuri@mvista.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Tue, 10 Feb 2026 19:08:18 +0530
X-Gm-Features: AZwV_Qg5OMK_0MNwke3dKTgHvwevntsbf3IJgH-I3_tps9eQzHBEFZZ4Qwtt-RU
Message-ID: <CANQUz1_noZ2ugqDV_qLHvTeqy_gw0dxVuCKei2Dr12brxwarng@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] openssl: upgrade 3.0.18 -> 3.0.19
To: openembedded-core@lists.openembedded.org, 
	Yoann Congal <yoann.congal@smile.fr>
Content-Type: multipart/alternative; boundary="000000000000050dcc064a785f76"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 13:38:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230897

--000000000000050dcc064a785f76
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Team,

Any Update on this ?

Thanks & Regards,
Vijay

On Fri, Jan 30, 2026 at 5:12=E2=80=AFPM <vanusuri@mvista.com> wrote:

> From: Vijay Anusuri <vanusuri@mvista.com>
>
> This release incorporates the following bug fixes and mitigations:
>
> Fixed Stack buffer overflow in CMS AuthEnvelopedData parsing.
> (CVE-2025-15467)
> Fixed Heap out-of-bounds write in BIO_f_linebuffer on short writes.
> (CVE-2025-68160)
> Fixed Unauthenticated/unencrypted trailing bytes with low-level OCB
> function calls. (CVE-2025-69418)
> Fixed Out of bounds write in PKCS12_get_friendlyname() UTF-8 conversion.
> (CVE-2025-69419)
> Fixed Missing ASN1_TYPE validation in TS_RESP_verify_response() function.
> (CVE-2025-69420)
> Fixed NULL Pointer Dereference in PKCS12_item_decrypt_d2i_ex() function.
> (CVE-2025-69421)
> Fixed Missing ASN1_TYPE validation in PKCS#12 parsing. (CVE-2026-22795)
> Fixed ASN1_TYPE Type Confusion in the PKCS7_digest_from_attributes()
> function. (CVE-2026-22796)
>
> Changelog:
> https://github.com/openssl/openssl/blob/openssl-3.0.19/NEWS.md
>
> Refreshed CVE-2023-50781 patches for openssl-3.0.19
>
> Reference: https://openssl-library.org/news/secadv/20260127.txt
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../openssl/openssl/CVE-2023-50781-1.patch    |  46 ++++---
>  .../openssl/openssl/CVE-2023-50781-2.patch    | 112 +++++++++---------
>  .../openssl/openssl/CVE-2023-50781-3.patch    |  16 ++-
>  .../{openssl_3.0.18.bb =3D> openssl_3.0.19.bb}  |   2 +-
>  4 files changed, 85 insertions(+), 91 deletions(-)
>  rename meta/recipes-connectivity/openssl/{openssl_3.0.18.bb =3D>
> openssl_3.0.19.bb} (99%)
>
> diff --git
> a/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-1.patch
> b/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-1.patch
> index 234fe7b8aa..a00f67027d 100644
> --- a/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-1.patch
> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-1.patch
> @@ -1,7 +1,7 @@
> -From 24734088e1034392de981151dfe57e3a379ada18 Mon Sep 17 00:00:00 2001
> +From 295485f5c4b3120b272b81f92356f6d24871c02e Mon Sep 17 00:00:00 2001
>  From: Hubert Kario <hkario@redhat.com>
>  Date: Tue, 15 Mar 2022 13:58:08 +0100
> -Subject: [PATCH 1/3] rsa: add implicit rejection in PKCS#1 v1.5
> +Subject: [PATCH] rsa: add implicit rejection in PKCS#1 v1.5
>
>  The RSA decryption as implemented before required very careful handling
>  of both the exit code returned by OpenSSL and the potentially returned
> @@ -43,6 +43,7 @@ Reviewed-by: Tomas Mraz <tomas@openssl.org>
>  (Merged from https://github.com/openssl/openssl/pull/13817)
>
>  Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> +
>  ---
>   crypto/rsa/rsa_ossl.c                     |  95 +++++++-
>   crypto/rsa/rsa_pk1.c                      | 252 ++++++++++++++++++++++
> @@ -56,7 +57,7 @@ Signed-off-by: Jiaying Song <
> jiaying.song.cn@windriver.com>
>   9 files changed, 393 insertions(+), 5 deletions(-)
>
>  diff --git a/crypto/rsa/rsa_ossl.c b/crypto/rsa/rsa_ossl.c
> -index 0fc642e777..330302ae55 100644
> +index 6c32764..d658a3c 100644
>  --- a/crypto/rsa/rsa_ossl.c
>  +++ b/crypto/rsa/rsa_ossl.c
>  @@ -17,6 +17,9 @@
> @@ -68,8 +69,8 @@ index 0fc642e777..330302ae55 100644
>  +#include <openssl/hmac.h>
>
>   static int rsa_ossl_public_encrypt(int flen, const unsigned char *from,
> -                                   unsigned char *to, RSA *rsa, int
> padding);
> -@@ -377,8 +380,13 @@ static int rsa_ossl_private_decrypt(int flen, const
> unsigned char *from,
> +     unsigned char *to, RSA *rsa, int padding);
> +@@ -373,8 +376,13 @@ static int rsa_ossl_private_decrypt(int flen, const
> unsigned char *from,
>       BIGNUM *f, *ret;
>       int j, num =3D 0, r =3D -1;
>       unsigned char *buf =3D NULL;
> @@ -83,7 +84,7 @@ index 0fc642e777..330302ae55 100644
>       /*
>        * Used only if the blinding structure is shared. A non-NULL unblin=
d
>        * instructs rsa_blinding_convert() and rsa_blinding_invert() to
> store
> -@@ -408,6 +416,11 @@ static int rsa_ossl_private_decrypt(int flen, const
> unsigned char *from,
> +@@ -404,6 +412,11 @@ static int rsa_ossl_private_decrypt(int flen, const
> unsigned char *from,
>           goto err;
>       }
>
> @@ -95,7 +96,7 @@ index 0fc642e777..330302ae55 100644
>       /* make data into a big number */
>       if (BN_bin2bn(from, (int)flen, f) =3D=3D NULL)
>           goto err;
> -@@ -472,13 +485,91 @@ static int rsa_ossl_private_decrypt(int flen, cons=
t
> unsigned char *from,
> +@@ -464,13 +477,91 @@ static int rsa_ossl_private_decrypt(int flen, cons=
t
> unsigned char *from,
>           if (!rsa_blinding_invert(blinding, ret, unblind, ctx))
>               goto err;
>
> @@ -188,17 +189,17 @@ index 0fc642e777..330302ae55 100644
>           break;
>       case RSA_PKCS1_OAEP_PADDING:
>           r =3D RSA_padding_check_PKCS1_OAEP(to, num, buf, j, num, NULL, =
0);
> -@@ -501,6 +592,8 @@ static int rsa_ossl_private_decrypt(int flen, const
> unsigned char *from,
> +@@ -493,6 +584,8 @@ static int rsa_ossl_private_decrypt(int flen, const
> unsigned char *from,
>   #endif
>
> -  err:
> + err:
>  +    HMAC_CTX_free(hmac);
>  +    EVP_MD_free(md);
>       BN_CTX_end(ctx);
>       BN_CTX_free(ctx);
>       OPENSSL_clear_free(buf, num);
>  diff --git a/crypto/rsa/rsa_pk1.c b/crypto/rsa/rsa_pk1.c
> -index 51507fc030..5cd2b26879 100644
> +index bebb43a..3fe12b2 100644
>  --- a/crypto/rsa/rsa_pk1.c
>  +++ b/crypto/rsa/rsa_pk1.c
>  @@ -21,10 +21,14 @@
> @@ -214,7 +215,7 @@ index 51507fc030..5cd2b26879 100644
>
>  +
>   int RSA_padding_add_PKCS1_type_1(unsigned char *to, int tlen,
> -                                  const unsigned char *from, int flen)
> +     const unsigned char *from, int flen)
>   {
>  @@ -273,6 +277,254 @@ int RSA_padding_check_PKCS1_type_2(unsigned char
> *to, int tlen,
>       return constant_time_select_int(good, mlen, -1);
> @@ -472,7 +473,7 @@ index 51507fc030..5cd2b26879 100644
>    * ossl_rsa_padding_check_PKCS1_type_2_TLS() checks and removes the
> PKCS1 type 2
>    * padding from a decrypted RSA message in a TLS signature. The result
> is stored
>  diff --git a/doc/man1/openssl-pkeyutl.pod.in b/doc/man1/
> openssl-pkeyutl.pod.in
> -index 2f6ef0021d..015265a74d 100644
> +index 2f6ef00..015265a 100644
>  --- a/doc/man1/openssl-pkeyutl.pod.in
>  +++ b/doc/man1/openssl-pkeyutl.pod.in
>  @@ -273,6 +273,11 @@ signed or verified directly instead of using a
> B<DigestInfo> structure. If a
> @@ -488,7 +489,7 @@ index 2f6ef0021d..015265a74d 100644
>
>   For B<x931> if the digest type is set it is used to format the block da=
ta
>  diff --git a/doc/man1/openssl-rsautl.pod.in b/doc/man1/
> openssl-rsautl.pod.in
> -index 0a32fd965b..4c462abc8c 100644
> +index 0a32fd9..4c462ab 100644
>  --- a/doc/man1/openssl-rsautl.pod.in
>  +++ b/doc/man1/openssl-rsautl.pod.in
>  @@ -105,6 +105,11 @@ The padding to use: PKCS#1 v1.5 (the default),
> PKCS#1 OAEP,
> @@ -504,7 +505,7 @@ index 0a32fd965b..4c462abc8c 100644
>
>   Hex dump the output data.
>  diff --git a/doc/man3/EVP_PKEY_CTX_ctrl.pod
> b/doc/man3/EVP_PKEY_CTX_ctrl.pod
> -index 3075eaafd6..e788f38809 100644
> +index 3075eaa..e788f38 100644
>  --- a/doc/man3/EVP_PKEY_CTX_ctrl.pod
>  +++ b/doc/man3/EVP_PKEY_CTX_ctrl.pod
>  @@ -386,6 +386,13 @@ this behaviour should be tolerated then
> @@ -522,7 +523,7 @@ index 3075eaafd6..e788f38809 100644
>
>   EVP_PKEY_CTX_set_dsa_paramgen_bits() sets the number of bits used for D=
SA
>  diff --git a/doc/man3/EVP_PKEY_decrypt.pod b/doc/man3/EVP_PKEY_decrypt.p=
od
> -index b6f9bad5f1..898535a7a2 100644
> +index b6f9bad..898535a 100644
>  --- a/doc/man3/EVP_PKEY_decrypt.pod
>  +++ b/doc/man3/EVP_PKEY_decrypt.pod
>  @@ -51,6 +51,18 @@ return 1 for success and 0 or a negative value for
> failure. In particular a
> @@ -545,7 +546,7 @@ index b6f9bad5f1..898535a7a2 100644
>
>   Decrypt data using OAEP (for RSA keys):
>  diff --git a/doc/man3/RSA_padding_add_PKCS1_type_1.pod
> b/doc/man3/RSA_padding_add_PKCS1_type_1.pod
> -index 9f7025c497..36ae18563f 100644
> +index 9f7025c..36ae185 100644
>  --- a/doc/man3/RSA_padding_add_PKCS1_type_1.pod
>  +++ b/doc/man3/RSA_padding_add_PKCS1_type_1.pod
>  @@ -121,8 +121,8 @@ L<ERR_get_error(3)>.
> @@ -570,7 +571,7 @@ index 9f7025c497..36ae18563f 100644
>
>   L<RSA_public_encrypt(3)>,
>  diff --git a/doc/man3/RSA_public_encrypt.pod
> b/doc/man3/RSA_public_encrypt.pod
> -index 1d38073aea..bd3f835ac6 100644
> +index 1d38073..bd3f835 100644
>  --- a/doc/man3/RSA_public_encrypt.pod
>  +++ b/doc/man3/RSA_public_encrypt.pod
>  @@ -52,8 +52,8 @@ Encrypting user data directly with RSA is insecure.
> @@ -599,20 +600,17 @@ index 1d38073aea..bd3f835ac6 100644
>
>   SSL, PKCS #1 v2.0
>  diff --git a/include/crypto/rsa.h b/include/crypto/rsa.h
> -index 949873d0ee..f267e5d9d1 100644
> +index 797dc1f..2f86e4c 100644
>  --- a/include/crypto/rsa.h
>  +++ b/include/crypto/rsa.h
>  @@ -83,6 +83,10 @@ int ossl_rsa_param_decode(RSA *rsa, const X509_ALGOR
> *alg);
>   RSA *ossl_rsa_key_from_pkcs8(const PKCS8_PRIV_KEY_INFO *p8inf,
> -                              OSSL_LIB_CTX *libctx, const char *propq);
> +     OSSL_LIB_CTX *libctx, const char *propq);
>
>  +int ossl_rsa_padding_check_PKCS1_type_2(OSSL_LIB_CTX *ctx,
>  +                                        unsigned char *to, int tlen,
>  +                                        const unsigned char *from, int
> flen,
>  +                                        int num, unsigned char *kdk);
>   int ossl_rsa_padding_check_PKCS1_type_2_TLS(OSSL_LIB_CTX *ctx, unsigned
> char *to,
> -                                             size_t tlen,
> -                                             const unsigned char *from,
> ---
> -2.34.1
> -
> +     size_t tlen,
> +     const unsigned char *from,
> diff --git
> a/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-2.patch
> b/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-2.patch
> index b336d9e850..13ea3c717a 100644
> --- a/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-2.patch
> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-2.patch
> @@ -1,7 +1,7 @@
> -From e92f0cd3b03e5aca948b03df7e3d02e536700f68 Mon Sep 17 00:00:00 2001
> +From 584936eb09cef64eb0755c0ccb2661e7ba1aea58 Mon Sep 17 00:00:00 2001
>  From: Hubert Kario <hkario@redhat.com>
>  Date: Thu, 27 Oct 2022 19:16:58 +0200
> -Subject: [PATCH 2/3] rsa: Add option to disable implicit rejection
> +Subject: [PATCH] rsa: Add option to disable implicit rejection
>
>  CVE: CVE-2023-50781
>
> @@ -14,6 +14,7 @@ Reviewed-by: Tomas Mraz <tomas@openssl.org>
>  (Merged from https://github.com/openssl/openssl/pull/13817)
>
>  Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> +
>  ---
>   crypto/cms/cms_env.c                          |  7 +++++
>   crypto/evp/ctrl_params_translate.c            |  6 +++++
> @@ -28,10 +29,10 @@ Signed-off-by: Jiaying Song <
> jiaying.song.cn@windriver.com>
>   10 files changed, 95 insertions(+), 8 deletions(-)
>
>  diff --git a/crypto/cms/cms_env.c b/crypto/cms/cms_env.c
> -index 445a16fb77..49b0289114 100644
> +index 2326253..96e3315 100644
>  --- a/crypto/cms/cms_env.c
>  +++ b/crypto/cms/cms_env.c
> -@@ -581,6 +581,13 @@ static int
> cms_RecipientInfo_ktri_decrypt(CMS_ContentInfo *cms,
> +@@ -576,6 +576,13 @@ static int
> cms_RecipientInfo_ktri_decrypt(CMS_ContentInfo *cms,
>       if (!ossl_cms_env_asn1_ctrl(ri, 1))
>           goto err;
>
> @@ -43,15 +44,15 @@ index 445a16fb77..49b0289114 100644
>  +        EVP_PKEY_CTX_ctrl_str(ktri->pctx,
> "rsa_pkcs1_implicit_rejection", "0");
>  +
>       if (EVP_PKEY_decrypt(ktri->pctx, NULL, &eklen,
> -                          ktri->encryptedKey->data,
> -                          ktri->encryptedKey->length) <=3D 0)
> +             ktri->encryptedKey->data,
> +             ktri->encryptedKey->length)
>  diff --git a/crypto/evp/ctrl_params_translate.c
> b/crypto/evp/ctrl_params_translate.c
> -index 44d0895bcf..db7325439a 100644
> +index 14306a0..b481776 100644
>  --- a/crypto/evp/ctrl_params_translate.c
>  +++ b/crypto/evp/ctrl_params_translate.c
> -@@ -2269,6 +2269,12 @@ static const struct translation_st
> evp_pkey_ctx_translations[] =3D {
> -       EVP_PKEY_CTRL_GET_RSA_OAEP_LABEL, NULL, NULL,
> -       OSSL_ASYM_CIPHER_PARAM_OAEP_LABEL, OSSL_PARAM_OCTET_PTR, NULL },
> +@@ -2249,6 +2249,12 @@ static const struct translation_st
> evp_pkey_ctx_translations[] =3D {
> +         EVP_PKEY_CTRL_GET_RSA_OAEP_LABEL, NULL, NULL,
> +         OSSL_ASYM_CIPHER_PARAM_OAEP_LABEL, OSSL_PARAM_OCTET_PTR, NULL }=
,
>
>  +    { SET, EVP_PKEY_RSA, 0, EVP_PKEY_OP_TYPE_CRYPT,
>  +      EVP_PKEY_CTRL_RSA_IMPLICIT_REJECTION, NULL,
> @@ -60,13 +61,13 @@ index 44d0895bcf..db7325439a 100644
>  +      NULL },
>  +
>       { SET, EVP_PKEY_RSA_PSS, 0, EVP_PKEY_OP_TYPE_GEN,
> -       EVP_PKEY_CTRL_MD, "rsa_pss_keygen_md", NULL,
> -       OSSL_ALG_PARAM_DIGEST, OSSL_PARAM_UTF8_STRING, fix_md },
> +         EVP_PKEY_CTRL_MD, "rsa_pss_keygen_md", NULL,
> +         OSSL_ALG_PARAM_DIGEST, OSSL_PARAM_UTF8_STRING, fix_md },
>  diff --git a/crypto/rsa/rsa_ossl.c b/crypto/rsa/rsa_ossl.c
> -index 330302ae55..4bdacd5ed9 100644
> +index d658a3c..5a0b160 100644
>  --- a/crypto/rsa/rsa_ossl.c
>  +++ b/crypto/rsa/rsa_ossl.c
> -@@ -395,6 +395,12 @@ static int rsa_ossl_private_decrypt(int flen, const
> unsigned char *from,
> +@@ -391,6 +391,12 @@ static int rsa_ossl_private_decrypt(int flen, const
> unsigned char *from,
>       BIGNUM *unblind =3D NULL;
>       BN_BLINDING *blinding =3D NULL;
>
> @@ -79,7 +80,7 @@ index 330302ae55..4bdacd5ed9 100644
>       if ((ctx =3D BN_CTX_new_ex(rsa->libctx)) =3D=3D NULL)
>           goto err;
>       BN_CTX_start(ctx);
> -@@ -489,7 +495,7 @@ static int rsa_ossl_private_decrypt(int flen, const
> unsigned char *from,
> +@@ -481,7 +487,7 @@ static int rsa_ossl_private_decrypt(int flen, const
> unsigned char *from,
>        * derive the Key Derivation Key from private exponent and public
>        * ciphertext
>        */
> @@ -88,7 +89,7 @@ index 330302ae55..4bdacd5ed9 100644
>           /*
>            * because we use d as a handle to rsa->d we need to keep it
> local and
>            * free before any further use of rsa->d
> -@@ -565,11 +571,11 @@ static int rsa_ossl_private_decrypt(int flen, cons=
t
> unsigned char *from,
> +@@ -557,11 +563,11 @@ static int rsa_ossl_private_decrypt(int flen, cons=
t
> unsigned char *from,
>           goto err;
>
>       switch (padding) {
> @@ -105,7 +106,7 @@ index 330302ae55..4bdacd5ed9 100644
>       case RSA_PKCS1_OAEP_PADDING:
>           r =3D RSA_padding_check_PKCS1_OAEP(to, num, buf, j, num, NULL, =
0);
>  diff --git a/crypto/rsa/rsa_pmeth.c b/crypto/rsa/rsa_pmeth.c
> -index 0bf5ac098a..81b031f81b 100644
> +index 85cdfb4..7f3d810 100644
>  --- a/crypto/rsa/rsa_pmeth.c
>  +++ b/crypto/rsa/rsa_pmeth.c
>  @@ -52,6 +52,8 @@ typedef struct {
> @@ -133,17 +134,17 @@ index 0bf5ac098a..81b031f81b 100644
>       if (sctx->oaep_label) {
>           OPENSSL_free(dctx->oaep_label);
>           dctx->oaep_label =3D OPENSSL_memdup(sctx->oaep_label,
> sctx->oaep_labellen);
> -@@ -347,6 +351,7 @@ static int pkey_rsa_decrypt(EVP_PKEY_CTX *ctx,
> -                             const unsigned char *in, size_t inlen)
> +@@ -345,6 +349,7 @@ static int pkey_rsa_decrypt(EVP_PKEY_CTX *ctx,
> +     const unsigned char *in, size_t inlen)
>   {
>       int ret;
>  +    int pad_mode;
>       RSA_PKEY_CTX *rctx =3D ctx->data;
>       /*
>        * Discard const. Its marked as const because this may be a cached
> copy of
> -@@ -367,7 +372,12 @@ static int pkey_rsa_decrypt(EVP_PKEY_CTX *ctx,
> -                                                 rctx->oaep_labellen,
> -                                                 rctx->md, rctx->mgf1md)=
;
> +@@ -365,7 +370,12 @@ static int pkey_rsa_decrypt(EVP_PKEY_CTX *ctx,
> +             rctx->oaep_labellen,
> +             rctx->md, rctx->mgf1md);
>       } else {
>  -        ret =3D RSA_private_decrypt(inlen, in, out, rsa, rctx->pad_mode=
);
>  +        if (rctx->pad_mode =3D=3D RSA_PKCS1_PADDING &&
> @@ -155,7 +156,7 @@ index 0bf5ac098a..81b031f81b 100644
>       }
>       *outlen =3D constant_time_select_s(constant_time_msb_s(ret), *outle=
n,
> ret);
>       ret =3D constant_time_select_int(constant_time_msb(ret), ret, 1);
> -@@ -591,6 +601,14 @@ static int pkey_rsa_ctrl(EVP_PKEY_CTX *ctx, int
> type, int p1, void *p2)
> +@@ -587,6 +597,14 @@ static int pkey_rsa_ctrl(EVP_PKEY_CTX *ctx, int
> type, int p1, void *p2)
>           *(unsigned char **)p2 =3D rctx->oaep_label;
>           return rctx->oaep_labellen;
>
> @@ -171,7 +172,7 @@ index 0bf5ac098a..81b031f81b 100644
>       case EVP_PKEY_CTRL_PKCS7_SIGN:
>   #ifndef OPENSSL_NO_CMS
>  diff --git a/doc/man1/openssl-pkeyutl.pod.in b/doc/man1/
> openssl-pkeyutl.pod.in
> -index 015265a74d..5e62551d34 100644
> +index 015265a..5e62551 100644
>  --- a/doc/man1/openssl-pkeyutl.pod.in
>  +++ b/doc/man1/openssl-pkeyutl.pod.in
>  @@ -305,6 +305,16 @@ explicitly set in PSS mode then the signing digest
> is used.
> @@ -192,7 +193,7 @@ index 015265a74d..5e62551d34 100644
>
>   =3Dhead1 RSA-PSS ALGORITHM
>  diff --git a/doc/man3/EVP_PKEY_CTX_ctrl.pod
> b/doc/man3/EVP_PKEY_CTX_ctrl.pod
> -index e788f38809..3844aa2199 100644
> +index e788f38..3844aa2 100644
>  --- a/doc/man3/EVP_PKEY_CTX_ctrl.pod
>  +++ b/doc/man3/EVP_PKEY_CTX_ctrl.pod
>  @@ -392,6 +392,8 @@ instead of padding errors in case padding checks
> fail. Applications that
> @@ -205,7 +206,7 @@ index e788f38809..3844aa2199 100644
>   =3Dhead2 DSA parameters
>
>  diff --git a/doc/man7/provider-asym_cipher.pod
> b/doc/man7/provider-asym_cipher.pod
> -index 0976a263a8..2a8426a6ed 100644
> +index 0976a26..2a8426a 100644
>  --- a/doc/man7/provider-asym_cipher.pod
>  +++ b/doc/man7/provider-asym_cipher.pod
>  @@ -234,6 +234,15 @@ The TLS protocol version first requested by the
> client.
> @@ -225,50 +226,50 @@ index 0976a263a8..2a8426a6ed 100644
>
>   OSSL_FUNC_asym_cipher_gettable_ctx_params() and
> OSSL_FUNC_asym_cipher_settable_ctx_params()
>  diff --git a/include/openssl/core_names.h b/include/openssl/core_names.h
> -index 6bed5a8a67..5a350b537f 100644
> +index 02bebc6..9586a6d 100644
>  --- a/include/openssl/core_names.h
>  +++ b/include/openssl/core_names.h
>  @@ -292,6 +292,7 @@ extern "C" {
> - #define OSSL_PKEY_PARAM_DIST_ID             "distid"
> - #define OSSL_PKEY_PARAM_PUB_KEY             "pub"
> - #define OSSL_PKEY_PARAM_PRIV_KEY            "priv"
> -+#define OSSL_PKEY_PARAM_IMPLICIT_REJECTION  "implicit-rejection"
> + #define OSSL_PKEY_PARAM_DIST_ID "distid"
> + #define OSSL_PKEY_PARAM_PUB_KEY "pub"
> + #define OSSL_PKEY_PARAM_PRIV_KEY "priv"
> ++#define OSSL_PKEY_PARAM_IMPLICIT_REJECTION "implicit-rejection"
>
>   /* Diffie-Hellman/DSA Parameters */
> - #define OSSL_PKEY_PARAM_FFC_P               "p"
> + #define OSSL_PKEY_PARAM_FFC_P "p"
>  @@ -467,6 +468,7 @@ extern "C" {
> - #define OSSL_ASYM_CIPHER_PARAM_OAEP_LABEL               "oaep-label"
> - #define OSSL_ASYM_CIPHER_PARAM_TLS_CLIENT_VERSION
>  "tls-client-version"
> - #define OSSL_ASYM_CIPHER_PARAM_TLS_NEGOTIATED_VERSION
>  "tls-negotiated-version"
> -+#define OSSL_ASYM_CIPHER_PARAM_IMPLICIT_REJECTION
>  "implicit-rejection"
> + #define OSSL_ASYM_CIPHER_PARAM_OAEP_LABEL "oaep-label"
> + #define OSSL_ASYM_CIPHER_PARAM_TLS_CLIENT_VERSION "tls-client-version"
> + #define OSSL_ASYM_CIPHER_PARAM_TLS_NEGOTIATED_VERSION
> "tls-negotiated-version"
> ++#define OSSL_ASYM_CIPHER_PARAM_IMPLICIT_REJECTION "implicit-rejection"
>
>   /*
>    * Encoder / decoder parameters
>  diff --git a/include/openssl/rsa.h b/include/openssl/rsa.h
> -index a55c9727c6..247f9014e3 100644
> +index 36a780d..ceb05b2 100644
>  --- a/include/openssl/rsa.h
>  +++ b/include/openssl/rsa.h
>  @@ -183,6 +183,8 @@ int EVP_PKEY_CTX_get0_rsa_oaep_label(EVP_PKEY_CTX
> *ctx, unsigned char **label);
>
> - # define EVP_PKEY_CTRL_RSA_KEYGEN_PRIMES  (EVP_PKEY_ALG_CTRL + 13)
> + #define EVP_PKEY_CTRL_RSA_KEYGEN_PRIMES (EVP_PKEY_ALG_CTRL + 13)
>
> -+# define EVP_PKEY_CTRL_RSA_IMPLICIT_REJECTION (EVP_PKEY_ALG_CTRL + 14)
> ++#define EVP_PKEY_CTRL_RSA_IMPLICIT_REJECTION (EVP_PKEY_ALG_CTRL + 14)
>  +
> - # define RSA_PKCS1_PADDING          1
> - # define RSA_NO_PADDING             3
> - # define RSA_PKCS1_OAEP_PADDING     4
> + #define RSA_PKCS1_PADDING 1
> + #define RSA_NO_PADDING 3
> + #define RSA_PKCS1_OAEP_PADDING 4
>  @@ -192,6 +194,9 @@ int EVP_PKEY_CTX_get0_rsa_oaep_label(EVP_PKEY_CTX
> *ctx, unsigned char **label);
> - # define RSA_PKCS1_PSS_PADDING      6
> - # define RSA_PKCS1_WITH_TLS_PADDING 7
> + #define RSA_PKCS1_PSS_PADDING 6
> + #define RSA_PKCS1_WITH_TLS_PADDING 7
>
>  +/* internal RSA_ only */
> -+# define RSA_PKCS1_NO_IMPLICIT_REJECT_PADDING 8
> ++#define RSA_PKCS1_NO_IMPLICIT_REJECT_PADDING 8
>  +
> - # define RSA_PKCS1_PADDING_SIZE    11
> + #define RSA_PKCS1_PADDING_SIZE 11
>
> - # define RSA_set_app_data(s,arg)         RSA_set_ex_data(s,0,arg)
> + #define RSA_set_app_data(s, arg) RSA_set_ex_data(s, 0, arg)
>  diff --git a/providers/implementations/asymciphers/rsa_enc.c
> b/providers/implementations/asymciphers/rsa_enc.c
> -index c8921acd6e..11a91e62b1 100644
> +index 799357f3..1e74150 100644
>  --- a/providers/implementations/asymciphers/rsa_enc.c
>  +++ b/providers/implementations/asymciphers/rsa_enc.c
>  @@ -75,6 +75,8 @@ typedef struct {
> @@ -288,7 +289,7 @@ index c8921acd6e..11a91e62b1 100644
>
>       switch (RSA_test_flags(prsactx->rsa, RSA_FLAG_TYPE_MASK)) {
>       case RSA_FLAG_TYPE_RSA:
> -@@ -199,6 +202,7 @@ static int rsa_decrypt(void *vprsactx, unsigned char
> *out, size_t *outlen,
> +@@ -203,6 +206,7 @@ static int rsa_decrypt(void *vprsactx, unsigned char
> *out, size_t *outlen,
>   {
>       PROV_RSA_CTX *prsactx =3D (PROV_RSA_CTX *)vprsactx;
>       int ret;
> @@ -296,12 +297,12 @@ index c8921acd6e..11a91e62b1 100644
>       size_t len =3D RSA_size(prsactx->rsa);
>
>       if (!ossl_prov_is_running())
> -@@ -276,8 +280,12 @@ static int rsa_decrypt(void *vprsactx, unsigned cha=
r
> *out, size_t *outlen,
> +@@ -280,8 +284,12 @@ static int rsa_decrypt(void *vprsactx, unsigned cha=
r
> *out, size_t *outlen,
>           }
>           OPENSSL_free(tbuf);
>       } else {
>  -        ret =3D RSA_private_decrypt(inlen, in, out, prsactx->rsa,
> --                                  prsactx->pad_mode);
> +-            prsactx->pad_mode);
>  +        if ((prsactx->implicit_rejection =3D=3D 0) &&
>  +                (prsactx->pad_mode =3D=3D RSA_PKCS1_PADDING))
>  +            pad_mode =3D RSA_PKCS1_NO_IMPLICIT_REJECT_PADDING;
> @@ -311,7 +312,7 @@ index c8921acd6e..11a91e62b1 100644
>       }
>       *outlen =3D constant_time_select_s(constant_time_msb_s(ret), *outle=
n,
> ret);
>       ret =3D constant_time_select_int(constant_time_msb(ret), 0, 1);
> -@@ -401,6 +409,10 @@ static int rsa_get_ctx_params(void *vprsactx,
> OSSL_PARAM *params)
> +@@ -403,6 +411,10 @@ static int rsa_get_ctx_params(void *vprsactx,
> OSSL_PARAM *params)
>       if (p !=3D NULL && !OSSL_PARAM_set_uint(p, prsactx->alt_version))
>           return 0;
>
> @@ -322,8 +323,8 @@ index c8921acd6e..11a91e62b1 100644
>       return 1;
>   }
>
> -@@ -412,6 +424,7 @@ static const OSSL_PARAM known_gettable_ctx_params[] =
=3D
> {
> -                     NULL, 0),
> +@@ -414,6 +426,7 @@ static const OSSL_PARAM known_gettable_ctx_params[] =
=3D
> {
> +         NULL, 0),
>       OSSL_PARAM_uint(OSSL_ASYM_CIPHER_PARAM_TLS_CLIENT_VERSION, NULL),
>       OSSL_PARAM_uint(OSSL_ASYM_CIPHER_PARAM_TLS_NEGOTIATED_VERSION, NULL=
),
>  +    OSSL_PARAM_uint(OSSL_ASYM_CIPHER_PARAM_IMPLICIT_REJECTION, NULL),
> @@ -353,6 +354,3 @@ index c8921acd6e..11a91e62b1 100644
>       OSSL_PARAM_END
>   };
>
> ---
> -2.34.1
> -
> diff --git
> a/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-3.patch
> b/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-3.patch
> index 0a1f63f30a..324e41ed2f 100644
> --- a/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-3.patch
> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-3.patch
> @@ -1,7 +1,7 @@
> -From ba78f7b0599ba5bfb5032dd2664465c5b13388e3 Mon Sep 17 00:00:00 2001
> +From 156a6ca5791f9c642a77270a90d5dbd0a3a7a33d Mon Sep 17 00:00:00 2001
>  From: Hubert Kario <hkario@redhat.com>
>  Date: Tue, 22 Nov 2022 18:25:49 +0100
> -Subject: [PATCH 3/3] smime/pkcs7: disable the Bleichenbacher workaround
> +Subject: [PATCH] smime/pkcs7: disable the Bleichenbacher workaround
>
>  CVE: CVE-2023-50781
>
> @@ -14,15 +14,16 @@ Reviewed-by: Tomas Mraz <tomas@openssl.org>
>  (Merged from https://github.com/openssl/openssl/pull/13817)
>
>  Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> +
>  ---
>   crypto/pkcs7/pk7_doit.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
>  diff --git a/crypto/pkcs7/pk7_doit.c b/crypto/pkcs7/pk7_doit.c
> -index e9de097da1..6d3124da87 100644
> +index a38e8a3..d751f5e 100644
>  --- a/crypto/pkcs7/pk7_doit.c
>  +++ b/crypto/pkcs7/pk7_doit.c
> -@@ -170,6 +170,13 @@ static int pkcs7_decrypt_rinfo(unsigned char **pek,
> int *peklen,
> +@@ -168,6 +168,13 @@ static int pkcs7_decrypt_rinfo(unsigned char **pek,
> int *peklen,
>       if (EVP_PKEY_decrypt_init(pctx) <=3D 0)
>           goto err;
>
> @@ -34,8 +35,5 @@ index e9de097da1..6d3124da87 100644
>  +        EVP_PKEY_CTX_ctrl_str(pctx, "rsa_pkcs1_implicit_rejection", "0"=
);
>  +
>       if (EVP_PKEY_decrypt(pctx, NULL, &eklen,
> -                          ri->enc_key->data, ri->enc_key->length) <=3D 0=
)
> -         goto err;
> ---
> -2.34.1
> -
> +             ri->enc_key->data, ri->enc_key->length)
> +         <=3D 0)
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.18.bb
> b/meta/recipes-connectivity/openssl/openssl_3.0.19.bb
> similarity index 99%
> rename from meta/recipes-connectivity/openssl/openssl_3.0.18.bb
> rename to meta/recipes-connectivity/openssl/openssl_3.0.19.bb
> index a8dd338327..293b450cd0 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.0.18.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.0.19.bb
> @@ -25,7 +25,7 @@ SRC_URI:append:class-nativesdk =3D " \
>             file://environment.d-openssl.sh \
>             "
>
> -SRC_URI[sha256sum] =3D
> "d80c34f5cf902dccf1f1b5df5ebb86d0392e37049e5d73df1b3abae72e4ffe8b"
> +SRC_URI[sha256sum] =3D
> "fa5a4143b8aae18be53ef2f3caf29a2e0747430b8bc74d32d88335b94ab63072"
>
>  inherit lib_package multilib_header multilib_script ptest perlnative
>  MULTILIB_SCRIPTS =3D "${PN}-bin:${bindir}/c_rehash"
> --
> 2.25.1
>
>

--000000000000050dcc064a785f76
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi Team,<br><br></div>Any Update on this ?<=
br><br></div>Thanks &amp; Regards,<br></div>Vijay</div><br><div class=3D"gm=
ail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On F=
ri, Jan 30, 2026 at 5:12=E2=80=AFPM &lt;<a href=3D"mailto:vanusuri@mvista.c=
om">vanusuri@mvista.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@m=
vista.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
<br>
This release incorporates the following bug fixes and mitigations:<br>
<br>
Fixed Stack buffer overflow in CMS AuthEnvelopedData parsing. (CVE-2025-154=
67)<br>
Fixed Heap out-of-bounds write in BIO_f_linebuffer on short writes. (CVE-20=
25-68160)<br>
Fixed Unauthenticated/unencrypted trailing bytes with low-level OCB functio=
n calls. (CVE-2025-69418)<br>
Fixed Out of bounds write in PKCS12_get_friendlyname() UTF-8 conversion. (C=
VE-2025-69419)<br>
Fixed Missing ASN1_TYPE validation in TS_RESP_verify_response() function. (=
CVE-2025-69420)<br>
Fixed NULL Pointer Dereference in PKCS12_item_decrypt_d2i_ex() function. (C=
VE-2025-69421)<br>
Fixed Missing ASN1_TYPE validation in PKCS#12 parsing. (CVE-2026-22795)<br>
Fixed ASN1_TYPE Type Confusion in the PKCS7_digest_from_attributes() functi=
on. (CVE-2026-22796)<br>
<br>
Changelog:<br>
<a href=3D"https://github.com/openssl/openssl/blob/openssl-3.0.19/NEWS.md" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/openssl/openssl/blo=
b/openssl-3.0.19/NEWS.md</a><br>
<br>
Refreshed CVE-2023-50781 patches for openssl-3.0.19<br>
<br>
Reference: <a href=3D"https://openssl-library.org/news/secadv/20260127.txt"=
 rel=3D"noreferrer" target=3D"_blank">https://openssl-library.org/news/seca=
dv/20260127.txt</a><br>
<br>
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../openssl/openssl/CVE-2023-50781-1.patch=C2=A0 =C2=A0 |=C2=A0 46 ++=
++---<br>
=C2=A0.../openssl/openssl/CVE-2023-50781-2.patch=C2=A0 =C2=A0 | 112 +++++++=
++---------<br>
=C2=A0.../openssl/openssl/CVE-2023-50781-3.patch=C2=A0 =C2=A0 |=C2=A0 16 ++=
-<br>
=C2=A0.../{<a href=3D"http://openssl_3.0.18.bb" rel=3D"noreferrer" target=
=3D"_blank">openssl_3.0.18.bb</a> =3D&gt; <a href=3D"http://openssl_3.0.19.=
bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.0.19.bb</a>}=C2=A0 |=C2=
=A0 =C2=A02 +-<br>
=C2=A04 files changed, 85 insertions(+), 91 deletions(-)<br>
=C2=A0rename meta/recipes-connectivity/openssl/{<a href=3D"http://openssl_3=
.0.18.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.0.18.bb</a> =3D&gt=
; <a href=3D"http://openssl_3.0.19.bb" rel=3D"noreferrer" target=3D"_blank"=
>openssl_3.0.19.bb</a>} (99%)<br>
<br>
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-1.pat=
ch b/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-1.patch<br>
index 234fe7b8aa..a00f67027d 100644<br>
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-1.patch<br>
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-1.patch<br>
@@ -1,7 +1,7 @@<br>
-From 24734088e1034392de981151dfe57e3a379ada18 Mon Sep 17 00:00:00 2001<br>
+From 295485f5c4b3120b272b81f92356f6d24871c02e Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Hubert Kario &lt;<a href=3D"mailto:hkario@redhat.com" target=3D=
"_blank">hkario@redhat.com</a>&gt;<br>
=C2=A0Date: Tue, 15 Mar 2022 13:58:08 +0100<br>
-Subject: [PATCH 1/3] rsa: add implicit rejection in PKCS#1 v1.5<br>
+Subject: [PATCH] rsa: add implicit rejection in PKCS#1 v1.5<br>
<br>
=C2=A0The RSA decryption as implemented before required very careful handli=
ng<br>
=C2=A0of both the exit code returned by OpenSSL and the potentially returne=
d<br>
@@ -43,6 +43,7 @@ Reviewed-by: Tomas Mraz &lt;<a href=3D"mailto:tomas@opens=
sl.org" target=3D"_blank">tomas@openssl.org</a>&gt;<br>
=C2=A0(Merged from <a href=3D"https://github.com/openssl/openssl/pull/13817=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/openssl/openssl/p=
ull/13817</a>)<br>
<br>
=C2=A0Signed-off-by: Jiaying Song &lt;<a href=3D"mailto:jiaying.song.cn@win=
driver.com" target=3D"_blank">jiaying.song.cn@windriver.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 crypto/rsa/rsa_ossl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 95 +++++++-<br>
=C2=A0 crypto/rsa/rsa_pk1.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 252 ++++++++++++++++++++++<br>
@@ -56,7 +57,7 @@ Signed-off-by: Jiaying Song &lt;<a href=3D"mailto:jiaying=
.song.cn@windriver.com" target=3D"_blank">jiaying.song.cn@windriver.com</a>=
&gt;<br>
=C2=A0 9 files changed, 393 insertions(+), 5 deletions(-)<br>
<br>
=C2=A0diff --git a/crypto/rsa/rsa_ossl.c b/crypto/rsa/rsa_ossl.c<br>
-index 0fc642e777..330302ae55 100644<br>
+index 6c32764..d658a3c 100644<br>
=C2=A0--- a/crypto/rsa/rsa_ossl.c<br>
=C2=A0+++ b/crypto/rsa/rsa_ossl.c<br>
=C2=A0@@ -17,6 +17,9 @@<br>
@@ -68,8 +69,8 @@ index 0fc642e777..330302ae55 100644<br>
=C2=A0+#include &lt;openssl/hmac.h&gt;<br>
<br>
=C2=A0 static int rsa_ossl_public_encrypt(int flen, const unsigned char *fr=
om,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned char *to, RSA =
*rsa, int padding);<br>
-@@ -377,8 +380,13 @@ static int rsa_ossl_private_decrypt(int flen, const u=
nsigned char *from,<br>
+=C2=A0 =C2=A0 =C2=A0unsigned char *to, RSA *rsa, int padding);<br>
+@@ -373,8 +376,13 @@ static int rsa_ossl_private_decrypt(int flen, const u=
nsigned char *from,<br>
=C2=A0 =C2=A0 =C2=A0 BIGNUM *f, *ret;<br>
=C2=A0 =C2=A0 =C2=A0 int j, num =3D 0, r =3D -1;<br>
=C2=A0 =C2=A0 =C2=A0 unsigned char *buf =3D NULL;<br>
@@ -83,7 +84,7 @@ index 0fc642e777..330302ae55 100644<br>
=C2=A0 =C2=A0 =C2=A0 /*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0* Used only if the blinding structure is shared.=
 A non-NULL unblind<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0* instructs rsa_blinding_convert() and rsa_blind=
ing_invert() to store<br>
-@@ -408,6 +416,11 @@ static int rsa_ossl_private_decrypt(int flen, const u=
nsigned char *from,<br>
+@@ -404,6 +412,11 @@ static int rsa_ossl_private_decrypt(int flen, const u=
nsigned char *from,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
=C2=A0 =C2=A0 =C2=A0 }<br>
<br>
@@ -95,7 +96,7 @@ index 0fc642e777..330302ae55 100644<br>
=C2=A0 =C2=A0 =C2=A0 /* make data into a big number */<br>
=C2=A0 =C2=A0 =C2=A0 if (BN_bin2bn(from, (int)flen, f) =3D=3D NULL)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
-@@ -472,13 +485,91 @@ static int rsa_ossl_private_decrypt(int flen, const =
unsigned char *from,<br>
+@@ -464,13 +477,91 @@ static int rsa_ossl_private_decrypt(int flen, const =
unsigned char *from,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!rsa_blinding_invert(blinding, ret, =
unblind, ctx))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
<br>
@@ -188,17 +189,17 @@ index 0fc642e777..330302ae55 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 case RSA_PKCS1_OAEP_PADDING:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D RSA_padding_check_PKCS1_OAEP(to, n=
um, buf, j, num, NULL, 0);<br>
-@@ -501,6 +592,8 @@ static int rsa_ossl_private_decrypt(int flen, const un=
signed char *from,<br>
+@@ -493,6 +584,8 @@ static int rsa_ossl_private_decrypt(int flen, const un=
signed char *from,<br>
=C2=A0 #endif<br>
<br>
-=C2=A0 err:<br>
+ err:<br>
=C2=A0+=C2=A0 =C2=A0 HMAC_CTX_free(hmac);<br>
=C2=A0+=C2=A0 =C2=A0 EVP_MD_free(md);<br>
=C2=A0 =C2=A0 =C2=A0 BN_CTX_end(ctx);<br>
=C2=A0 =C2=A0 =C2=A0 BN_CTX_free(ctx);<br>
=C2=A0 =C2=A0 =C2=A0 OPENSSL_clear_free(buf, num);<br>
=C2=A0diff --git a/crypto/rsa/rsa_pk1.c b/crypto/rsa/rsa_pk1.c<br>
-index 51507fc030..5cd2b26879 100644<br>
+index bebb43a..3fe12b2 100644<br>
=C2=A0--- a/crypto/rsa/rsa_pk1.c<br>
=C2=A0+++ b/crypto/rsa/rsa_pk1.c<br>
=C2=A0@@ -21,10 +21,14 @@<br>
@@ -214,7 +215,7 @@ index 51507fc030..5cd2b26879 100644<br>
<br>
=C2=A0+<br>
=C2=A0 int RSA_padding_add_PKCS1_type_1(unsigned char *to, int tlen,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const unsigned char *from, in=
t flen)<br>
+=C2=A0 =C2=A0 =C2=A0const unsigned char *from, int flen)<br>
=C2=A0 {<br>
=C2=A0@@ -273,6 +277,254 @@ int RSA_padding_check_PKCS1_type_2(unsigned cha=
r *to, int tlen,<br>
=C2=A0 =C2=A0 =C2=A0 return constant_time_select_int(good, mlen, -1);<br>
@@ -472,7 +473,7 @@ index 51507fc030..5cd2b26879 100644<br>
=C2=A0 =C2=A0* ossl_rsa_padding_check_PKCS1_type_2_TLS() checks and removes=
 the PKCS1 type 2<br>
=C2=A0 =C2=A0* padding from a decrypted RSA message in a TLS signature. The=
 result is stored<br>
=C2=A0diff --git a/doc/man1/<a href=3D"http://openssl-pkeyutl.pod.in" rel=
=3D"noreferrer" target=3D"_blank">openssl-pkeyutl.pod.in</a> b/doc/man1/<a =
href=3D"http://openssl-pkeyutl.pod.in" rel=3D"noreferrer" target=3D"_blank"=
>openssl-pkeyutl.pod.in</a><br>
-index 2f6ef0021d..015265a74d 100644<br>
+index 2f6ef00..015265a 100644<br>
=C2=A0--- a/doc/man1/<a href=3D"http://openssl-pkeyutl.pod.in" rel=3D"noref=
errer" target=3D"_blank">openssl-pkeyutl.pod.in</a><br>
=C2=A0+++ b/doc/man1/<a href=3D"http://openssl-pkeyutl.pod.in" rel=3D"noref=
errer" target=3D"_blank">openssl-pkeyutl.pod.in</a><br>
=C2=A0@@ -273,6 +273,11 @@ signed or verified directly instead of using a B=
&lt;DigestInfo&gt; structure. If a<br>
@@ -488,7 +489,7 @@ index 2f6ef0021d..015265a74d 100644<br>
<br>
=C2=A0 For B&lt;x931&gt; if the digest type is set it is used to format the=
 block data<br>
=C2=A0diff --git a/doc/man1/<a href=3D"http://openssl-rsautl.pod.in" rel=3D=
"noreferrer" target=3D"_blank">openssl-rsautl.pod.in</a> b/doc/man1/<a href=
=3D"http://openssl-rsautl.pod.in" rel=3D"noreferrer" target=3D"_blank">open=
ssl-rsautl.pod.in</a><br>
-index 0a32fd965b..4c462abc8c 100644<br>
+index 0a32fd9..4c462ab 100644<br>
=C2=A0--- a/doc/man1/<a href=3D"http://openssl-rsautl.pod.in" rel=3D"norefe=
rrer" target=3D"_blank">openssl-rsautl.pod.in</a><br>
=C2=A0+++ b/doc/man1/<a href=3D"http://openssl-rsautl.pod.in" rel=3D"norefe=
rrer" target=3D"_blank">openssl-rsautl.pod.in</a><br>
=C2=A0@@ -105,6 +105,11 @@ The padding to use: PKCS#1 v1.5 (the default), P=
KCS#1 OAEP,<br>
@@ -504,7 +505,7 @@ index 0a32fd965b..4c462abc8c 100644<br>
<br>
=C2=A0 Hex dump the output data.<br>
=C2=A0diff --git a/doc/man3/EVP_PKEY_CTX_ctrl.pod b/doc/man3/EVP_PKEY_CTX_c=
trl.pod<br>
-index 3075eaafd6..e788f38809 100644<br>
+index 3075eaa..e788f38 100644<br>
=C2=A0--- a/doc/man3/EVP_PKEY_CTX_ctrl.pod<br>
=C2=A0+++ b/doc/man3/EVP_PKEY_CTX_ctrl.pod<br>
=C2=A0@@ -386,6 +386,13 @@ this behaviour should be tolerated then<br>
@@ -522,7 +523,7 @@ index 3075eaafd6..e788f38809 100644<br>
<br>
=C2=A0 EVP_PKEY_CTX_set_dsa_paramgen_bits() sets the number of bits used fo=
r DSA<br>
=C2=A0diff --git a/doc/man3/EVP_PKEY_decrypt.pod b/doc/man3/EVP_PKEY_decryp=
t.pod<br>
-index b6f9bad5f1..898535a7a2 100644<br>
+index b6f9bad..898535a 100644<br>
=C2=A0--- a/doc/man3/EVP_PKEY_decrypt.pod<br>
=C2=A0+++ b/doc/man3/EVP_PKEY_decrypt.pod<br>
=C2=A0@@ -51,6 +51,18 @@ return 1 for success and 0 or a negative value for=
 failure. In particular a<br>
@@ -545,7 +546,7 @@ index b6f9bad5f1..898535a7a2 100644<br>
<br>
=C2=A0 Decrypt data using OAEP (for RSA keys):<br>
=C2=A0diff --git a/doc/man3/RSA_padding_add_PKCS1_type_1.pod b/doc/man3/RSA=
_padding_add_PKCS1_type_1.pod<br>
-index 9f7025c497..36ae18563f 100644<br>
+index 9f7025c..36ae185 100644<br>
=C2=A0--- a/doc/man3/RSA_padding_add_PKCS1_type_1.pod<br>
=C2=A0+++ b/doc/man3/RSA_padding_add_PKCS1_type_1.pod<br>
=C2=A0@@ -121,8 +121,8 @@ L&lt;ERR_get_error(3)&gt;.<br>
@@ -570,7 +571,7 @@ index 9f7025c497..36ae18563f 100644<br>
<br>
=C2=A0 L&lt;RSA_public_encrypt(3)&gt;,<br>
=C2=A0diff --git a/doc/man3/RSA_public_encrypt.pod b/doc/man3/RSA_public_en=
crypt.pod<br>
-index 1d38073aea..bd3f835ac6 100644<br>
+index 1d38073..bd3f835 100644<br>
=C2=A0--- a/doc/man3/RSA_public_encrypt.pod<br>
=C2=A0+++ b/doc/man3/RSA_public_encrypt.pod<br>
=C2=A0@@ -52,8 +52,8 @@ Encrypting user data directly with RSA is insecure.=
<br>
@@ -599,20 +600,17 @@ index 1d38073aea..bd3f835ac6 100644<br>
<br>
=C2=A0 SSL, PKCS #1 v2.0<br>
=C2=A0diff --git a/include/crypto/rsa.h b/include/crypto/rsa.h<br>
-index 949873d0ee..f267e5d9d1 100644<br>
+index 797dc1f..2f86e4c 100644<br>
=C2=A0--- a/include/crypto/rsa.h<br>
=C2=A0+++ b/include/crypto/rsa.h<br>
=C2=A0@@ -83,6 +83,10 @@ int ossl_rsa_param_decode(RSA *rsa, const X509_ALG=
OR *alg);<br>
=C2=A0 RSA *ossl_rsa_key_from_pkcs8(const PKCS8_PRIV_KEY_INFO *p8inf,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OSSL_LIB_CTX *libctx, const char *propq);<b=
r>
+=C2=A0 =C2=A0 =C2=A0OSSL_LIB_CTX *libctx, const char *propq);<br>
<br>
=C2=A0+int ossl_rsa_padding_check_PKCS1_type_2(OSSL_LIB_CTX *ctx,<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u=
nsigned char *to, int tlen,<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c=
onst unsigned char *from, int flen,<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
nt num, unsigned char *kdk);<br>
=C2=A0 int ossl_rsa_padding_check_PKCS1_type_2_TLS(OSSL_LIB_CTX *ctx, unsig=
ned char *to,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0size_t tlen,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0const unsigned char *from,<br>
--- <br>
-2.34.1<br>
-<br>
+=C2=A0 =C2=A0 =C2=A0size_t tlen,<br>
+=C2=A0 =C2=A0 =C2=A0const unsigned char *from,<br>
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-2.pat=
ch b/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-2.patch<br>
index b336d9e850..13ea3c717a 100644<br>
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-2.patch<br>
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-2.patch<br>
@@ -1,7 +1,7 @@<br>
-From e92f0cd3b03e5aca948b03df7e3d02e536700f68 Mon Sep 17 00:00:00 2001<br>
+From 584936eb09cef64eb0755c0ccb2661e7ba1aea58 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Hubert Kario &lt;<a href=3D"mailto:hkario@redhat.com" target=3D=
"_blank">hkario@redhat.com</a>&gt;<br>
=C2=A0Date: Thu, 27 Oct 2022 19:16:58 +0200<br>
-Subject: [PATCH 2/3] rsa: Add option to disable implicit rejection<br>
+Subject: [PATCH] rsa: Add option to disable implicit rejection<br>
<br>
=C2=A0CVE: CVE-2023-50781<br>
<br>
@@ -14,6 +14,7 @@ Reviewed-by: Tomas Mraz &lt;<a href=3D"mailto:tomas@opens=
sl.org" target=3D"_blank">tomas@openssl.org</a>&gt;<br>
=C2=A0(Merged from <a href=3D"https://github.com/openssl/openssl/pull/13817=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/openssl/openssl/p=
ull/13817</a>)<br>
<br>
=C2=A0Signed-off-by: Jiaying Song &lt;<a href=3D"mailto:jiaying.song.cn@win=
driver.com" target=3D"_blank">jiaying.song.cn@windriver.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 crypto/cms/cms_env.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 7 +++++<br>
=C2=A0 crypto/evp/ctrl_params_translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 6 +++++<br>
@@ -28,10 +29,10 @@ Signed-off-by: Jiaying Song &lt;<a href=3D"mailto:jiayi=
ng.song.cn@windriver.com" target=3D"_blank">jiaying.song.cn@windriver.com</=
a>&gt;<br>
=C2=A0 10 files changed, 95 insertions(+), 8 deletions(-)<br>
<br>
=C2=A0diff --git a/crypto/cms/cms_env.c b/crypto/cms/cms_env.c<br>
-index 445a16fb77..49b0289114 100644<br>
+index 2326253..96e3315 100644<br>
=C2=A0--- a/crypto/cms/cms_env.c<br>
=C2=A0+++ b/crypto/cms/cms_env.c<br>
-@@ -581,6 +581,13 @@ static int cms_RecipientInfo_ktri_decrypt(CMS_Content=
Info *cms,<br>
+@@ -576,6 +576,13 @@ static int cms_RecipientInfo_ktri_decrypt(CMS_Content=
Info *cms,<br>
=C2=A0 =C2=A0 =C2=A0 if (!ossl_cms_env_asn1_ctrl(ri, 1))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
<br>
@@ -43,15 +44,15 @@ index 445a16fb77..49b0289114 100644<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EVP_PKEY_CTX_ctrl_str(ktri-&gt;pctx, &qu=
ot;rsa_pkcs1_implicit_rejection&quot;, &quot;0&quot;);<br>
=C2=A0+<br>
=C2=A0 =C2=A0 =C2=A0 if (EVP_PKEY_decrypt(ktri-&gt;pctx, NULL, &amp;eklen,<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ktri-&gt;encryptedKey-&gt;data,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ktri-&gt;encryptedKey-&gt;length) &lt;=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ktri-&gt;encryptedKey-&gt;=
data,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ktri-&gt;encryptedKey-&gt;=
length)<br>
=C2=A0diff --git a/crypto/evp/ctrl_params_translate.c b/crypto/evp/ctrl_par=
ams_translate.c<br>
-index 44d0895bcf..db7325439a 100644<br>
+index 14306a0..b481776 100644<br>
=C2=A0--- a/crypto/evp/ctrl_params_translate.c<br>
=C2=A0+++ b/crypto/evp/ctrl_params_translate.c<br>
-@@ -2269,6 +2269,12 @@ static const struct translation_st evp_pkey_ctx_tra=
nslations[] =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0EVP_PKEY_CTRL_GET_RSA_OAEP_LABEL, NULL, NULL,<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0OSSL_ASYM_CIPHER_PARAM_OAEP_LABEL, OSSL_PARAM_O=
CTET_PTR, NULL },<br>
+@@ -2249,6 +2249,12 @@ static const struct translation_st evp_pkey_ctx_tra=
nslations[] =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0EVP_PKEY_CTRL_GET_RSA_OAEP_LABEL, NULL, =
NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OSSL_ASYM_CIPHER_PARAM_OAEP_LABEL, OSSL_=
PARAM_OCTET_PTR, NULL },<br>
<br>
=C2=A0+=C2=A0 =C2=A0 { SET, EVP_PKEY_RSA, 0, EVP_PKEY_OP_TYPE_CRYPT,<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 EVP_PKEY_CTRL_RSA_IMPLICIT_REJECTION, NULL,<br>
@@ -60,13 +61,13 @@ index 44d0895bcf..db7325439a 100644<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 NULL },<br>
=C2=A0+<br>
=C2=A0 =C2=A0 =C2=A0 { SET, EVP_PKEY_RSA_PSS, 0, EVP_PKEY_OP_TYPE_GEN,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0EVP_PKEY_CTRL_MD, &quot;rsa_pss_keygen_md&quot;=
, NULL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0OSSL_ALG_PARAM_DIGEST, OSSL_PARAM_UTF8_STRING, =
fix_md },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0EVP_PKEY_CTRL_MD, &quot;rsa_pss_keygen_m=
d&quot;, NULL,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OSSL_ALG_PARAM_DIGEST, OSSL_PARAM_UTF8_S=
TRING, fix_md },<br>
=C2=A0diff --git a/crypto/rsa/rsa_ossl.c b/crypto/rsa/rsa_ossl.c<br>
-index 330302ae55..4bdacd5ed9 100644<br>
+index d658a3c..5a0b160 100644<br>
=C2=A0--- a/crypto/rsa/rsa_ossl.c<br>
=C2=A0+++ b/crypto/rsa/rsa_ossl.c<br>
-@@ -395,6 +395,12 @@ static int rsa_ossl_private_decrypt(int flen, const u=
nsigned char *from,<br>
+@@ -391,6 +391,12 @@ static int rsa_ossl_private_decrypt(int flen, const u=
nsigned char *from,<br>
=C2=A0 =C2=A0 =C2=A0 BIGNUM *unblind =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0 BN_BLINDING *blinding =3D NULL;<br>
<br>
@@ -79,7 +80,7 @@ index 330302ae55..4bdacd5ed9 100644<br>
=C2=A0 =C2=A0 =C2=A0 if ((ctx =3D BN_CTX_new_ex(rsa-&gt;libctx)) =3D=3D NUL=
L)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
=C2=A0 =C2=A0 =C2=A0 BN_CTX_start(ctx);<br>
-@@ -489,7 +495,7 @@ static int rsa_ossl_private_decrypt(int flen, const un=
signed char *from,<br>
+@@ -481,7 +487,7 @@ static int rsa_ossl_private_decrypt(int flen, const un=
signed char *from,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0* derive the Key Derivation Key from private exp=
onent and public<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0* ciphertext<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
@@ -88,7 +89,7 @@ index 330302ae55..4bdacd5ed9 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* because we use d as a handle to =
rsa-&gt;d we need to keep it local and<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* free before any further use of r=
sa-&gt;d<br>
-@@ -565,11 +571,11 @@ static int rsa_ossl_private_decrypt(int flen, const =
unsigned char *from,<br>
+@@ -557,11 +563,11 @@ static int rsa_ossl_private_decrypt(int flen, const =
unsigned char *from,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 switch (padding) {<br>
@@ -105,7 +106,7 @@ index 330302ae55..4bdacd5ed9 100644<br>
=C2=A0 =C2=A0 =C2=A0 case RSA_PKCS1_OAEP_PADDING:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D RSA_padding_check_PKCS1_OAEP(to, n=
um, buf, j, num, NULL, 0);<br>
=C2=A0diff --git a/crypto/rsa/rsa_pmeth.c b/crypto/rsa/rsa_pmeth.c<br>
-index 0bf5ac098a..81b031f81b 100644<br>
+index 85cdfb4..7f3d810 100644<br>
=C2=A0--- a/crypto/rsa/rsa_pmeth.c<br>
=C2=A0+++ b/crypto/rsa/rsa_pmeth.c<br>
=C2=A0@@ -52,6 +52,8 @@ typedef struct {<br>
@@ -133,17 +134,17 @@ index 0bf5ac098a..81b031f81b 100644<br>
=C2=A0 =C2=A0 =C2=A0 if (sctx-&gt;oaep_label) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OPENSSL_free(dctx-&gt;oaep_label);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dctx-&gt;oaep_label =3D OPENSSL_memdup(s=
ctx-&gt;oaep_label, sctx-&gt;oaep_labellen);<br>
-@@ -347,6 +351,7 @@ static int pkey_rsa_decrypt(EVP_PKEY_CTX *ctx,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const unsigned char *in, size_t inlen)<br>
+@@ -345,6 +349,7 @@ static int pkey_rsa_decrypt(EVP_PKEY_CTX *ctx,<br>
+=C2=A0 =C2=A0 =C2=A0const unsigned char *in, size_t inlen)<br>
=C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 int ret;<br>
=C2=A0+=C2=A0 =C2=A0 int pad_mode;<br>
=C2=A0 =C2=A0 =C2=A0 RSA_PKEY_CTX *rctx =3D ctx-&gt;data;<br>
=C2=A0 =C2=A0 =C2=A0 /*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0* Discard const. Its marked as const because thi=
s may be a cached copy of<br>
-@@ -367,7 +372,12 @@ static int pkey_rsa_decrypt(EVP_PKEY_CTX *ctx,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0rctx-&gt;oaep_labellen,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0rctx-&gt;md, rctx-&gt;mgf1md);<br>
+@@ -365,7 +370,12 @@ static int pkey_rsa_decrypt(EVP_PKEY_CTX *ctx,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rctx-&gt;oaep_labellen,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rctx-&gt;md, rctx-&gt;mgf1=
md);<br>
=C2=A0 =C2=A0 =C2=A0 } else {<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D RSA_private_decrypt(inlen, in, o=
ut, rsa, rctx-&gt;pad_mode);<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rctx-&gt;pad_mode =3D=3D RSA_PKCS1_P=
ADDING &amp;&amp;<br>
@@ -155,7 +156,7 @@ index 0bf5ac098a..81b031f81b 100644<br>
=C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 *outlen =3D constant_time_select_s(constant_time_msb_s=
(ret), *outlen, ret);<br>
=C2=A0 =C2=A0 =C2=A0 ret =3D constant_time_select_int(constant_time_msb(ret=
), ret, 1);<br>
-@@ -591,6 +601,14 @@ static int pkey_rsa_ctrl(EVP_PKEY_CTX *ctx, int type,=
 int p1, void *p2)<br>
+@@ -587,6 +597,14 @@ static int pkey_rsa_ctrl(EVP_PKEY_CTX *ctx, int type,=
 int p1, void *p2)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *(unsigned char **)p2 =3D rctx-&gt;oaep_=
label;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return rctx-&gt;oaep_labellen;<br>
<br>
@@ -171,7 +172,7 @@ index 0bf5ac098a..81b031f81b 100644<br>
=C2=A0 =C2=A0 =C2=A0 case EVP_PKEY_CTRL_PKCS7_SIGN:<br>
=C2=A0 #ifndef OPENSSL_NO_CMS<br>
=C2=A0diff --git a/doc/man1/<a href=3D"http://openssl-pkeyutl.pod.in" rel=
=3D"noreferrer" target=3D"_blank">openssl-pkeyutl.pod.in</a> b/doc/man1/<a =
href=3D"http://openssl-pkeyutl.pod.in" rel=3D"noreferrer" target=3D"_blank"=
>openssl-pkeyutl.pod.in</a><br>
-index 015265a74d..5e62551d34 100644<br>
+index 015265a..5e62551 100644<br>
=C2=A0--- a/doc/man1/<a href=3D"http://openssl-pkeyutl.pod.in" rel=3D"noref=
errer" target=3D"_blank">openssl-pkeyutl.pod.in</a><br>
=C2=A0+++ b/doc/man1/<a href=3D"http://openssl-pkeyutl.pod.in" rel=3D"noref=
errer" target=3D"_blank">openssl-pkeyutl.pod.in</a><br>
=C2=A0@@ -305,6 +305,16 @@ explicitly set in PSS mode then the signing dige=
st is used.<br>
@@ -192,7 +193,7 @@ index 015265a74d..5e62551d34 100644<br>
<br>
=C2=A0 =3Dhead1 RSA-PSS ALGORITHM<br>
=C2=A0diff --git a/doc/man3/EVP_PKEY_CTX_ctrl.pod b/doc/man3/EVP_PKEY_CTX_c=
trl.pod<br>
-index e788f38809..3844aa2199 100644<br>
+index e788f38..3844aa2 100644<br>
=C2=A0--- a/doc/man3/EVP_PKEY_CTX_ctrl.pod<br>
=C2=A0+++ b/doc/man3/EVP_PKEY_CTX_ctrl.pod<br>
=C2=A0@@ -392,6 +392,8 @@ instead of padding errors in case padding checks =
fail. Applications that<br>
@@ -205,7 +206,7 @@ index e788f38809..3844aa2199 100644<br>
=C2=A0 =3Dhead2 DSA parameters<br>
<br>
=C2=A0diff --git a/doc/man7/provider-asym_cipher.pod b/doc/man7/provider-as=
ym_cipher.pod<br>
-index 0976a263a8..2a8426a6ed 100644<br>
+index 0976a26..2a8426a 100644<br>
=C2=A0--- a/doc/man7/provider-asym_cipher.pod<br>
=C2=A0+++ b/doc/man7/provider-asym_cipher.pod<br>
=C2=A0@@ -234,6 +234,15 @@ The TLS protocol version first requested by the =
client.<br>
@@ -225,50 +226,50 @@ index 0976a263a8..2a8426a6ed 100644<br>
<br>
=C2=A0 OSSL_FUNC_asym_cipher_gettable_ctx_params() and OSSL_FUNC_asym_ciphe=
r_settable_ctx_params()<br>
=C2=A0diff --git a/include/openssl/core_names.h b/include/openssl/core_name=
s.h<br>
-index 6bed5a8a67..5a350b537f 100644<br>
+index 02bebc6..9586a6d 100644<br>
=C2=A0--- a/include/openssl/core_names.h<br>
=C2=A0+++ b/include/openssl/core_names.h<br>
=C2=A0@@ -292,6 +292,7 @@ extern &quot;C&quot; {<br>
- #define OSSL_PKEY_PARAM_DIST_ID=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&quot;distid&quot;<br>
- #define OSSL_PKEY_PARAM_PUB_KEY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&quot;pub&quot;<br>
- #define OSSL_PKEY_PARAM_PRIV_KEY=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &quot;priv&quot;<br>
-+#define OSSL_PKEY_PARAM_IMPLICIT_REJECTION=C2=A0 &quot;implicit-rejection=
&quot;<br>
+ #define OSSL_PKEY_PARAM_DIST_ID &quot;distid&quot;<br>
+ #define OSSL_PKEY_PARAM_PUB_KEY &quot;pub&quot;<br>
+ #define OSSL_PKEY_PARAM_PRIV_KEY &quot;priv&quot;<br>
++#define OSSL_PKEY_PARAM_IMPLICIT_REJECTION &quot;implicit-rejection&quot;=
<br>
<br>
=C2=A0 /* Diffie-Hellman/DSA Parameters */<br>
- #define OSSL_PKEY_PARAM_FFC_P=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0&quot;p&quot;<br>
+ #define OSSL_PKEY_PARAM_FFC_P &quot;p&quot;<br>
=C2=A0@@ -467,6 +468,7 @@ extern &quot;C&quot; {<br>
- #define OSSL_ASYM_CIPHER_PARAM_OAEP_LABEL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0&quot;oaep-label&quot;<br>
- #define OSSL_ASYM_CIPHER_PARAM_TLS_CLIENT_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;tls-client-version&quot;<br>
- #define OSSL_ASYM_CIPHER_PARAM_TLS_NEGOTIATED_VERSION=C2=A0 =C2=A0&quot;t=
ls-negotiated-version&quot;<br>
-+#define OSSL_ASYM_CIPHER_PARAM_IMPLICIT_REJECTION=C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;implicit-rejection&quot;<br>
+ #define OSSL_ASYM_CIPHER_PARAM_OAEP_LABEL &quot;oaep-label&quot;<br>
+ #define OSSL_ASYM_CIPHER_PARAM_TLS_CLIENT_VERSION &quot;tls-client-versio=
n&quot;<br>
+ #define OSSL_ASYM_CIPHER_PARAM_TLS_NEGOTIATED_VERSION &quot;tls-negotiate=
d-version&quot;<br>
++#define OSSL_ASYM_CIPHER_PARAM_IMPLICIT_REJECTION &quot;implicit-rejectio=
n&quot;<br>
<br>
=C2=A0 /*<br>
=C2=A0 =C2=A0* Encoder / decoder parameters<br>
=C2=A0diff --git a/include/openssl/rsa.h b/include/openssl/rsa.h<br>
-index a55c9727c6..247f9014e3 100644<br>
+index 36a780d..ceb05b2 100644<br>
=C2=A0--- a/include/openssl/rsa.h<br>
=C2=A0+++ b/include/openssl/rsa.h<br>
=C2=A0@@ -183,6 +183,8 @@ int EVP_PKEY_CTX_get0_rsa_oaep_label(EVP_PKEY_CTX=
 *ctx, unsigned char **label);<br>
<br>
- # define EVP_PKEY_CTRL_RSA_KEYGEN_PRIMES=C2=A0 (EVP_PKEY_ALG_CTRL + 13)<b=
r>
+ #define EVP_PKEY_CTRL_RSA_KEYGEN_PRIMES (EVP_PKEY_ALG_CTRL + 13)<br>
<br>
-+# define EVP_PKEY_CTRL_RSA_IMPLICIT_REJECTION (EVP_PKEY_ALG_CTRL + 14)<br=
>
++#define EVP_PKEY_CTRL_RSA_IMPLICIT_REJECTION (EVP_PKEY_ALG_CTRL + 14)<br>
=C2=A0+<br>
- # define RSA_PKCS1_PADDING=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1<br>
- # define RSA_NO_PADDING=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A03<=
br>
- # define RSA_PKCS1_OAEP_PADDING=C2=A0 =C2=A0 =C2=A04<br>
+ #define RSA_PKCS1_PADDING 1<br>
+ #define RSA_NO_PADDING 3<br>
+ #define RSA_PKCS1_OAEP_PADDING 4<br>
=C2=A0@@ -192,6 +194,9 @@ int EVP_PKEY_CTX_get0_rsa_oaep_label(EVP_PKEY_CTX=
 *ctx, unsigned char **label);<br>
- # define RSA_PKCS1_PSS_PADDING=C2=A0 =C2=A0 =C2=A0 6<br>
- # define RSA_PKCS1_WITH_TLS_PADDING 7<br>
+ #define RSA_PKCS1_PSS_PADDING 6<br>
+ #define RSA_PKCS1_WITH_TLS_PADDING 7<br>
<br>
=C2=A0+/* internal RSA_ only */<br>
-+# define RSA_PKCS1_NO_IMPLICIT_REJECT_PADDING 8<br>
++#define RSA_PKCS1_NO_IMPLICIT_REJECT_PADDING 8<br>
=C2=A0+<br>
- # define RSA_PKCS1_PADDING_SIZE=C2=A0 =C2=A0 11<br>
+ #define RSA_PKCS1_PADDING_SIZE 11<br>
<br>
- # define RSA_set_app_data(s,arg)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RSA_set=
_ex_data(s,0,arg)<br>
+ #define RSA_set_app_data(s, arg) RSA_set_ex_data(s, 0, arg)<br>
=C2=A0diff --git a/providers/implementations/asymciphers/rsa_enc.c b/provid=
ers/implementations/asymciphers/rsa_enc.c<br>
-index c8921acd6e..11a91e62b1 100644<br>
+index 799357f3..1e74150 100644<br>
=C2=A0--- a/providers/implementations/asymciphers/rsa_enc.c<br>
=C2=A0+++ b/providers/implementations/asymciphers/rsa_enc.c<br>
=C2=A0@@ -75,6 +75,8 @@ typedef struct {<br>
@@ -288,7 +289,7 @@ index c8921acd6e..11a91e62b1 100644<br>
<br>
=C2=A0 =C2=A0 =C2=A0 switch (RSA_test_flags(prsactx-&gt;rsa, RSA_FLAG_TYPE_=
MASK)) {<br>
=C2=A0 =C2=A0 =C2=A0 case RSA_FLAG_TYPE_RSA:<br>
-@@ -199,6 +202,7 @@ static int rsa_decrypt(void *vprsactx, unsigned char *=
out, size_t *outlen,<br>
+@@ -203,6 +206,7 @@ static int rsa_decrypt(void *vprsactx, unsigned char *=
out, size_t *outlen,<br>
=C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 PROV_RSA_CTX *prsactx =3D (PROV_RSA_CTX *)vprsactx;<br=
>
=C2=A0 =C2=A0 =C2=A0 int ret;<br>
@@ -296,12 +297,12 @@ index c8921acd6e..11a91e62b1 100644<br>
=C2=A0 =C2=A0 =C2=A0 size_t len =3D RSA_size(prsactx-&gt;rsa);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 if (!ossl_prov_is_running())<br>
-@@ -276,8 +280,12 @@ static int rsa_decrypt(void *vprsactx, unsigned char =
*out, size_t *outlen,<br>
+@@ -280,8 +284,12 @@ static int rsa_decrypt(void *vprsactx, unsigned char =
*out, size_t *outlen,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OPENSSL_free(tbuf);<br>
=C2=A0 =C2=A0 =C2=A0 } else {<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D RSA_private_decrypt(inlen, in, o=
ut, prsactx-&gt;rsa,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prsactx-&gt;pad_mode);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 prsactx-&gt;pad_mode);<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((prsactx-&gt;implicit_rejection =3D=
=3D 0) &amp;&amp;<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (prsactx-&gt=
;pad_mode =3D=3D RSA_PKCS1_PADDING))<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pad_mode =3D RSA_PKCS1_NO_=
IMPLICIT_REJECT_PADDING;<br>
@@ -311,7 +312,7 @@ index c8921acd6e..11a91e62b1 100644<br>
=C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 *outlen =3D constant_time_select_s(constant_time_msb_s=
(ret), *outlen, ret);<br>
=C2=A0 =C2=A0 =C2=A0 ret =3D constant_time_select_int(constant_time_msb(ret=
), 0, 1);<br>
-@@ -401,6 +409,10 @@ static int rsa_get_ctx_params(void *vprsactx, OSSL_PA=
RAM *params)<br>
+@@ -403,6 +411,10 @@ static int rsa_get_ctx_params(void *vprsactx, OSSL_PA=
RAM *params)<br>
=C2=A0 =C2=A0 =C2=A0 if (p !=3D NULL &amp;&amp; !OSSL_PARAM_set_uint(p, prs=
actx-&gt;alt_version))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
<br>
@@ -322,8 +323,8 @@ index c8921acd6e..11a91e62b1 100644<br>
=C2=A0 =C2=A0 =C2=A0 return 1;<br>
=C2=A0 }<br>
<br>
-@@ -412,6 +424,7 @@ static const OSSL_PARAM known_gettable_ctx_params[] =
=3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0NULL, 0),<br>
+@@ -414,6 +426,7 @@ static const OSSL_PARAM known_gettable_ctx_params[] =
=3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, 0),<br>
=C2=A0 =C2=A0 =C2=A0 OSSL_PARAM_uint(OSSL_ASYM_CIPHER_PARAM_TLS_CLIENT_VERS=
ION, NULL),<br>
=C2=A0 =C2=A0 =C2=A0 OSSL_PARAM_uint(OSSL_ASYM_CIPHER_PARAM_TLS_NEGOTIATED_=
VERSION, NULL),<br>
=C2=A0+=C2=A0 =C2=A0 OSSL_PARAM_uint(OSSL_ASYM_CIPHER_PARAM_IMPLICIT_REJECT=
ION, NULL),<br>
@@ -353,6 +354,3 @@ index c8921acd6e..11a91e62b1 100644<br>
=C2=A0 =C2=A0 =C2=A0 OSSL_PARAM_END<br>
=C2=A0 };<br>
<br>
--- <br>
-2.34.1<br>
-<br>
diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-3.pat=
ch b/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-3.patch<br>
index 0a1f63f30a..324e41ed2f 100644<br>
--- a/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-3.patch<br>
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-50781-3.patch<br>
@@ -1,7 +1,7 @@<br>
-From ba78f7b0599ba5bfb5032dd2664465c5b13388e3 Mon Sep 17 00:00:00 2001<br>
+From 156a6ca5791f9c642a77270a90d5dbd0a3a7a33d Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Hubert Kario &lt;<a href=3D"mailto:hkario@redhat.com" target=3D=
"_blank">hkario@redhat.com</a>&gt;<br>
=C2=A0Date: Tue, 22 Nov 2022 18:25:49 +0100<br>
-Subject: [PATCH 3/3] smime/pkcs7: disable the Bleichenbacher workaround<br=
>
+Subject: [PATCH] smime/pkcs7: disable the Bleichenbacher workaround<br>
<br>
=C2=A0CVE: CVE-2023-50781<br>
<br>
@@ -14,15 +14,16 @@ Reviewed-by: Tomas Mraz &lt;<a href=3D"mailto:tomas@ope=
nssl.org" target=3D"_blank">tomas@openssl.org</a>&gt;<br>
=C2=A0(Merged from <a href=3D"https://github.com/openssl/openssl/pull/13817=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/openssl/openssl/p=
ull/13817</a>)<br>
<br>
=C2=A0Signed-off-by: Jiaying Song &lt;<a href=3D"mailto:jiaying.song.cn@win=
driver.com" target=3D"_blank">jiaying.song.cn@windriver.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 crypto/pkcs7/pk7_doit.c | 7 +++++++<br>
=C2=A0 1 file changed, 7 insertions(+)<br>
<br>
=C2=A0diff --git a/crypto/pkcs7/pk7_doit.c b/crypto/pkcs7/pk7_doit.c<br>
-index e9de097da1..6d3124da87 100644<br>
+index a38e8a3..d751f5e 100644<br>
=C2=A0--- a/crypto/pkcs7/pk7_doit.c<br>
=C2=A0+++ b/crypto/pkcs7/pk7_doit.c<br>
-@@ -170,6 +170,13 @@ static int pkcs7_decrypt_rinfo(unsigned char **pek, i=
nt *peklen,<br>
+@@ -168,6 +168,13 @@ static int pkcs7_decrypt_rinfo(unsigned char **pek, i=
nt *peklen,<br>
=C2=A0 =C2=A0 =C2=A0 if (EVP_PKEY_decrypt_init(pctx) &lt;=3D 0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
<br>
@@ -34,8 +35,5 @@ index e9de097da1..6d3124da87 100644<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 EVP_PKEY_CTX_ctrl_str(pctx, &quot;rsa_pk=
cs1_implicit_rejection&quot;, &quot;0&quot;);<br>
=C2=A0+<br>
=C2=A0 =C2=A0 =C2=A0 if (EVP_PKEY_decrypt(pctx, NULL, &amp;eklen,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ri-&gt;enc_key-&gt;data, ri-&gt;enc_key-&gt;length) &lt;=
=3D 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err;<br>
--- <br>
-2.34.1<br>
-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ri-&gt;enc_key-&gt;data, r=
i-&gt;enc_key-&gt;length)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;=3D 0)<br>
diff --git a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.=
0.18.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.0.18.bb</a> b/meta/=
recipes-connectivity/openssl/<a href=3D"http://openssl_3.0.19.bb" rel=3D"no=
referrer" target=3D"_blank">openssl_3.0.19.bb</a><br>
similarity index 99%<br>
rename from meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.0=
.18.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.0.18.bb</a><br>
rename to meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.0.1=
9.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.0.19.bb</a><br>
index a8dd338327..293b450cd0 100644<br>
--- a/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.0.18.bb=
" rel=3D"noreferrer" target=3D"_blank">openssl_3.0.18.bb</a><br>
+++ b/meta/recipes-connectivity/openssl/<a href=3D"http://openssl_3.0.19.bb=
" rel=3D"noreferrer" target=3D"_blank">openssl_3.0.19.bb</a><br>
@@ -25,7 +25,7 @@ SRC_URI:append:class-nativesdk =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://<a href=3D"http://environm=
ent.d-openssl.sh" rel=3D"noreferrer" target=3D"_blank">environment.d-openss=
l.sh</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;d80c34f5cf902dccf1f1b5df5ebb86d0392e37049e5d7=
3df1b3abae72e4ffe8b&quot;<br>
+SRC_URI[sha256sum] =3D &quot;fa5a4143b8aae18be53ef2f3caf29a2e0747430b8bc74=
d32d88335b94ab63072&quot;<br>
<br>
=C2=A0inherit lib_package multilib_header multilib_script ptest perlnative<=
br>
=C2=A0MULTILIB_SCRIPTS =3D &quot;${PN}-bin:${bindir}/c_rehash&quot;<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--000000000000050dcc064a785f76--

