Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5943BC47DA2
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 16:10:10 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.6913.1705507809127967536
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 08:10:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VKG48LsM;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.49, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a2c67be31edso750059266b.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 08:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1705507807; x=1706112607; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XloScGx6VGRkkB1htNKPVwDkLdPHo7gQc51pW1MFx1w=;
        b=VKG48LsMRwSgGBr25MJJ4zk2KkkPBs+kCI++TrHXzWOA6UbJUrUMzrLmGNxkxGp3ik
         BESzCKTFNhgVopM63iwFSB7xx5bQRDlnKWzFn9Uv/eA1CPZqiJO2xxdZCYkyhzl9TAM4
         PvNjkcrrOs1h8HBk55oqLCwocM4tCz9aO/9PM3oAR0QhfiZiKQl2usLh7Ytw0xrA9+RT
         t/B94sQ8w7ydJOE83WzkANbMFmKgQZfj+TQCR6OgOjGxE4c7XjjH2IgUCMQEP2mpf08Z
         zUyrtL9hsShmBNcwK1IyuLJ9TmsZxmNWv99J4o6Qln8uoGGLOpZqV/Ip1RIPCfOfsiJD
         UreA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705507807; x=1706112607;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XloScGx6VGRkkB1htNKPVwDkLdPHo7gQc51pW1MFx1w=;
        b=QLYKMGowZMMixBxcZqnOfSVupvjenqS4BLBAewCiGNFnK93psDPSrb+PgsgCSPyehm
         jOGW76AqiinpmO0RJMogLMnfsKPA3FcTHfmZWZLMElDSABcqYRK0rrbPXz3ejFewEyCc
         vRaNBXGHhrfuDGDh6EZnM5FbBaPQUHxDqrpzxgquy2rGqcAeQUykifKfP0WQeCdN4m6x
         7gOVALCYkUm1jxVcnzjVj/gqzQxoFdCNNc0M/2icWBUNa7WRRmHryQYSQd9ZwVPJ/NuW
         nHET+pvpADZ4za7kJ90rqLq/jO1PEsIZxE97RNGpEMBTtDB2g8gYlUPnVVzU3VesP06H
         Izew==
X-Gm-Message-State: AOJu0YxF/2VIXM/GmI7oYi7BvzH5ZocFjGns0Mh3INe+h4y5n0scQj38
	wyMJYCd3fU80+0YngopFbtFhTVUkAzZ2V0nQTyFBBcwgQFTDM2LoMgyDOywQeAg=
X-Google-Smtp-Source: AGHT+IEAoJme6xGzlwELUkBspIheFRJI5SxUgM0hpFcQWa0ZJoVXfgKoZLcNpdL2STla9JB2Q+QVkI51f8sYRcTd7yQ=
X-Received: by 2002:a17:907:d049:b0:a2e:b6f7:11bc with SMTP id
 vb9-20020a170907d04900b00a2eb6f711bcmr633302ejc.197.1705507807341; Wed, 17
 Jan 2024 08:10:07 -0800 (PST)
MIME-Version: 1.0
References: <20240117114532.716702-1-hprajapati@mvista.com>
In-Reply-To: <20240117114532.716702-1-hprajapati@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 17 Jan 2024 06:09:56 -1000
Message-ID: <CAOSpxdZgVkLg6S0i=h-kxrrhdJkGYPVJyz3dbRearaZNxdbYqQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCHv2] openssl: fix CVE-2023-6237
 Excessive time spent checking invalid RSA public keys
To: hprajapati@mvista.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 16:10:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193933

On Wed, Jan 17, 2024 at 1:47=E2=80=AFAM Hitendra Prajapati via
lists.openembedded.org <hprajapati=3Dmvista.com@lists.openembedded.org>
wrote:
>
> Upstream-Status: Backport from https://github.com/openssl/openssl/commit/=
e09fc1d746a4fd15bb5c3d7bbbab950aadd005db
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../openssl/openssl/CVE-2023-6237.patch       | 127 ++++++++++++++++++
>  .../openssl/openssl_3.0.12.bb                 |   3 +-
>  2 files changed, 129 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-62=
37.patch
>
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-6237.patc=
h b/meta/recipes-connectivity/openssl/openssl/CVE-2023-6237.patch
> new file mode 100644
> index 0000000000..621dc6b0ab
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-6237.patch
> @@ -0,0 +1,127 @@
> +rom e09fc1d746a4fd15bb5c3d7bbbab950aadd005db Mon Sep 17 00:00:00 2001
> +From: Tomas Mraz <tomas@openssl.org>
> +Date: Fri, 22 Dec 2023 16:25:56 +0100
> +Subject: [PATCH] Limit the execution time of RSA public key check
> +
> +Fixes CVE-2023-6237
> +
> +If a large and incorrect RSA public key is checked with
> +EVP_PKEY_public_check() the computation could take very long time
> +due to no limit being applied to the RSA public key size and
> +unnecessarily high number of Miller-Rabin algorithm rounds
> +used for non-primality check of the modulus.
> +
> +Now the keys larger than 16384 bits (OPENSSL_RSA_MAX_MODULUS_BITS)
> +will fail the check with RSA_R_MODULUS_TOO_LARGE error reason.
> +Also the number of Miller-Rabin rounds was set to 5.
> +
> +Reviewed-by: Neil Horman <nhorman@openssl.org>
> +Reviewed-by: Matt Caswell <matt@openssl.org>
> +(Merged from https://github.com/openssl/openssl/pull/23243)
> +
> +Upstream-Status: Backport [https://github.com/openssl/openssl/commit/e09=
fc1d746a4fd15bb5c3d7bbbab950aadd005db]
> +CVE: CVE-2023-6237
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + crypto/rsa/rsa_sp800_56b_check.c              |  8 +++-
> + test/recipes/91-test_pkey_check.t             |  2 +-
> + .../91-test_pkey_check_data/rsapub_17k.pem    | 48 +++++++++++++++++++
> + 3 files changed, 56 insertions(+), 2 deletions(-)
> + create mode 100644 test/recipes/91-test_pkey_check_data/rsapub_17k.pem
> +
> +diff --git a/crypto/rsa/rsa_sp800_56b_check.c b/crypto/rsa/rsa_sp800_56b=
_check.c
> +index fc8f19b..bcbdd24 100644
> +--- a/crypto/rsa/rsa_sp800_56b_check.c
> ++++ b/crypto/rsa/rsa_sp800_56b_check.c
> +@@ -289,6 +289,11 @@ int ossl_rsa_sp800_56b_check_public(const RSA *rsa)
> +         return 0;
> +
> +     nbits =3D BN_num_bits(rsa->n);
> ++    if (nbits > OPENSSL_RSA_MAX_MODULUS_BITS) {
> ++        ERR_raise(ERR_LIB_RSA, RSA_R_MODULUS_TOO_LARGE);
> ++        return 0;
> ++    }
> ++
> + #ifdef FIPS_MODULE
> +     /*
> +      * (Step a): modulus must be 2048 or 3072 (caveat from SP800-56Br1)
> +@@ -324,7 +329,8 @@ int ossl_rsa_sp800_56b_check_public(const RSA *rsa)
> +         goto err;
> +     }
> +
> +-    ret =3D ossl_bn_miller_rabin_is_prime(rsa->n, 0, ctx, NULL, 1, &sta=
tus);
> ++    /* Highest number of MR rounds from FIPS 186-5 Section B.3 Table B.=
1 */
> ++    ret =3D ossl_bn_miller_rabin_is_prime(rsa->n, 5, ctx, NULL, 1, &sta=
tus);
> + #ifdef FIPS_MODULE
> +     if (ret !=3D 1 || status !=3D BN_PRIMETEST_COMPOSITE_NOT_POWER_OF_P=
RIME) {
> + #else
> +diff --git a/test/recipes/91-test_pkey_check.t b/test/recipes/91-test_pk=
ey_check.t
> +index dc7cc64..f8088df 100644
> +--- a/test/recipes/91-test_pkey_check.t
> ++++ b/test/recipes/91-test_pkey_check.t
> +@@ -70,7 +70,7 @@ push(@positive_tests, (
> +     "dhpkey.pem"
> +     )) unless disabled("dh");
> +
> +-my @negative_pubtests =3D ();
> ++my @negative_pubtests =3D ("rsapub_17k.pem");  # Too big RSA public key
> +
> + push(@negative_pubtests, (
> +     "dsapub_noparam.der"
> +diff --git a/test/recipes/91-test_pkey_check_data/rsapub_17k.pem b/test/=
recipes/91-test_pkey_check_data/rsapub_17k.pem
> +new file mode 100644
> +index 0000000..9a2eaed
> +--- /dev/null
> ++++ b/test/recipes/91-test_pkey_check_data/rsapub_17k.pem
> +@@ -0,0 +1,48 @@
> ++-----BEGIN PUBLIC KEY-----
> ++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
> ++AQAB
> ++-----END PUBLIC KEY-----
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.12.bb b/meta/r=
ecipes-connectivity/openssl/openssl_3.0.12.bb
> index 4602151d91..b1de72afd0 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.0.12.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.0.12.bb
> @@ -14,6 +14,7 @@ SRC_URI =3D "http://www.openssl.org/source/openssl-${PV=
}.tar.gz \
>             file://0001-Configure-do-not-tweak-mips-cflags.patch \
>             file://CVE-2023-5678.patch \
>             file://CVE-2023-6129.patch \
> +           file://CVE-2023-6237.patch \
>             "
>
>  SRC_URI:append:class-nativesdk =3D " \
> @@ -259,4 +260,4 @@ CVE_VERSION_SUFFIX =3D "alphabetical"
>
>  # Only affects OpenSSL >=3D 1.1.1 in combination with Apache < 2.4.37
>  # Apache in meta-webserver is already recent enough
> -CVE_CHECK_IGNORE +=3D "CVE-2019-0190"
> +CVE_STATUS +=3D "CVE-2019-0190"

I took the initial version of this patch.  Patchtest mistakenly called
out CVE_CHECK_IGNORE as an issue, it is not an issue for kirkstone
since CVE_STATUS is not implemented.

Steve

