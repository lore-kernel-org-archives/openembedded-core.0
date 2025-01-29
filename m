Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66713C02190
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 16:21:17 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.16455.1738167672933271552
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 08:21:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=s4HcDM86;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.178, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e3983426f80so10873351276.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 08:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1738167672; x=1738772472; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n6lJ+v6h/VQpge2SUU+MPgxhb4H9vNEFx5mBTmKNN0U=;
        b=s4HcDM86Ew+b1g1KYULND/fX8yc6uyubvE87Tp5FYW22Ss/j1UJb2Tca9ceLgnPni7
         iFzn4x+llwfVdKutd6qbIXR/ENccKwo6vocz5CHwpCRmK9bVTxxD162h0ygQUETjNhRh
         knvisE4yvKYLkiIA+ChTF6fz2X23XGZJdTRMK9VK4mjvFAj97BzFBO5QC6SzRFXfp9sk
         C4qbjiiigo4tMgAiLHjP+zBBk638ptpKgbSF8jK4GilUlB+TAIA3bKzjIcsrux8cI+FJ
         Km5Yr8qEV6Zf9k771GMgKTWH/gszAAG+GiuniagOmSLxo+B8/YVoyQuVNG2PvJA9CB0m
         erig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738167672; x=1738772472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6lJ+v6h/VQpge2SUU+MPgxhb4H9vNEFx5mBTmKNN0U=;
        b=kDeqzDKOa+3ensdSBns6zvzs5hunCR5lABKvFAhWJ8A9+voUYXL4AoX2bnsdjLA6yu
         Dq7/NNmZWgLL75EkKz0p+sqUlO5QvPfFFxsj8IFBUZC+wNzONAR0kEqDQ0RYuad3Z+tM
         HQko/wWzmqD8JJUAIWV4uaeATyFdpyvhRByeCs0bpss9yXwUeAOK5Hc6LYr1aou+3TuA
         3szCVHQgSAhW+Fo4jfCaNSI6TT9vRM8B88yy+rIwE7Ggsw42Ha30C0Xv3OKJiebNPnny
         GHMbV8XvI7bjMGYTkyVkfS5TUCasJU10lEYC2zt8sHVRz3/kwyRFCug6ri7fSAmiJJ1q
         gGJQ==
X-Gm-Message-State: AOJu0Yz1aj751FegF2srBY6hBTVuAnZUS6INPuOJtdRnGrJ3TpLNO4u5
	uqRUaOfER0aXNYmBcNDhVGMPYijr95SPTR7jL6YL2Y5Qed3ZR0XHUVsOEQDGZEsOLrgG9Bvj5VW
	UxP84hnLhsMTF5pYOwuAbLNAZVdDpSqU1ITItqmdQRXu6WUy9PPo=
X-Gm-Gg: ASbGnctCvyROhHLPWDa/akE4wEMtbyroG2sDFVVIhfPZk+afxiu+XygF70NgP0ntmB6
	dmvl/nteEpWJnTjBOQtCPQ7u1d/ydfFyZfZG6t6fQOG+hHWQ2rJPL8eODiUHKcme+gD0Zc4Kd
X-Google-Smtp-Source: AGHT+IHHJKnhBsP2O53auPU9D2ORf9Ar/Hd76dAr9UjIto5MOos1y47jUwXMxAMitHOaHmpsw1g7IsqoI3I9lfH1u5Q=
X-Received: by 2002:a05:690c:39a:b0:6f7:5025:8d0c with SMTP id
 00721157ae682-6f7a83342fdmr25847637b3.6.1738167671845; Wed, 29 Jan 2025
 08:21:11 -0800 (PST)
MIME-Version: 1.0
References: <20250122204157.4016363-1-peter.marko@siemens.com> <AS1PR10MB5697B7312D1466DA832BA091FDEE2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697B7312D1466DA832BA091FDEE2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 29 Jan 2025 08:21:00 -0800
X-Gm-Features: AWEUYZmhkdS2rl5CcfaU_LgmhL629PAfRFtMReLNetFyJ3_8IADc6aEFPXtupIo
Message-ID: <CAOSpxdb0=-TD9r-RKgR3gAG+So6gws3JadFKT8bevkRqaGBzNg@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH] openssl: patch CVE-2024-13176
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 16:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210390

I've got it, thanks for the reminder!

Steve

On Wed, Jan 29, 2025 at 8:16=E2=80=AFAM Marko, Peter <Peter.Marko@siemens.c=
om> wrote:
>
> Gentle ping
>
> > -----Original Message-----
> > From: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> > Sent: Wednesday, January 22, 2025 21:42
> > To: openembedded-core@lists.openembedded.org
> > Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> > Subject: [OE-core][scarthgap][PATCH] openssl: patch CVE-2024-13176
> >
> > From: Peter Marko <peter.marko@siemens.com>
> >
> > Picked [1] per link in [2]
> >
> > [1]
> > https://github.com/openssl/openssl/commit/4b1cb94a734a7d4ec363ac0a215a2
> > 5c181e11f65
> > [2] https://nvd.nist.gov/vuln/detail/CVE-2024-13176
> >
> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > ---
> >  .../openssl/openssl/CVE-2024-13176.patch      | 126 ++++++++++++++++++
> >  .../openssl/openssl_3.2.3.bb                  |   1 +
> >  2 files changed, 127 insertions(+)
> >  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-
> > 13176.patch
> >
> > diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-13176.p=
atch
> > b/meta/recipes-connectivity/openssl/openssl/CVE-2024-13176.patch
> > new file mode 100644
> > index 00000000000..28d4dd706a8
> > --- /dev/null
> > +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-13176.patch
> > @@ -0,0 +1,126 @@
> > +From 4b1cb94a734a7d4ec363ac0a215a25c181e11f65 Mon Sep 17 00:00:00
> > 2001
> > +From: Tomas Mraz <tomas@openssl.org>
> > +Date: Wed, 15 Jan 2025 18:27:02 +0100
> > +Subject: [PATCH] Fix timing side-channel in ECDSA signature computatio=
n
> > +
> > +There is a timing signal of around 300 nanoseconds when the top word o=
f
> > +the inverted ECDSA nonce value is zero. This can happen with significa=
nt
> > +probability only for some of the supported elliptic curves. In particu=
lar
> > +the NIST P-521 curve is affected. To be able to measure this leak, the
> > +attacker process must either be located in the same physical computer =
or
> > +must have a very fast network connection with low latency.
> > +
> > +Attacks on ECDSA nonce are also known as Minerva attack.
> > +
> > +Fixes CVE-2024-13176
> > +
> > +Reviewed-by: Tim Hudson <tjh@openssl.org>
> > +Reviewed-by: Neil Horman <nhorman@openssl.org>
> > +Reviewed-by: Paul Dale <ppzgs1@gmail.com>
> > +(Merged from https://github.com/openssl/openssl/pull/26429)
> > +
> > +(cherry picked from commit 63c40a66c5dc287485705d06122d3a6e74a6a203)
> > +(cherry picked from commit 392dcb336405a0c94486aa6655057f59fd3a0902)
> > +
> > +CVE: CVE-2024-13176
> > +Upstream-Status: Backport
> > [https://github.com/openssl/openssl/commit/4b1cb94a734a7d4ec363ac0a215a
> > 25c181e11f65]
> > +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > +---
> > + crypto/bn/bn_exp.c  | 21 +++++++++++++++------
> > + crypto/ec/ec_lib.c  |  7 ++++---
> > + include/crypto/bn.h |  3 +++
> > + 3 files changed, 22 insertions(+), 9 deletions(-)
> > +
> > +diff --git a/crypto/bn/bn_exp.c b/crypto/bn/bn_exp.c
> > +index b876edbfac36e..af52e2ced6914 100644
> > +--- a/crypto/bn/bn_exp.c
> > ++++ b/crypto/bn/bn_exp.c
> > +@@ -606,7 +606,7 @@ static int
> > MOD_EXP_CTIME_COPY_FROM_PREBUF(BIGNUM *b, int top,
> > +  * out by Colin Percival,
> > +  * http://www.daemonology.net/hyperthreading-considered-harmful/)
> > +  */
> > +-int BN_mod_exp_mont_consttime(BIGNUM *rr, const BIGNUM *a, const
> > BIGNUM *p,
> > ++int bn_mod_exp_mont_fixed_top(BIGNUM *rr, const BIGNUM *a, const
> > BIGNUM *p,
> > +                               const BIGNUM *m, BN_CTX *ctx,
> > +                               BN_MONT_CTX *in_mont)
> > + {
> > +@@ -623,10 +623,6 @@ int BN_mod_exp_mont_consttime(BIGNUM *rr, const
> > BIGNUM *a, const BIGNUM *p,
> > +     unsigned int t4 =3D 0;
> > + #endif
> > +
> > +-    bn_check_top(a);
> > +-    bn_check_top(p);
> > +-    bn_check_top(m);
> > +-
> > +     if (!BN_is_odd(m)) {
> > +         ERR_raise(ERR_LIB_BN, BN_R_CALLED_WITH_EVEN_MODULUS);
> > +         return 0;
> > +@@ -1146,7 +1142,7 @@ int BN_mod_exp_mont_consttime(BIGNUM *rr,
> > const BIGNUM *a, const BIGNUM *p,
> > +             goto err;
> > +     } else
> > + #endif
> > +-    if (!BN_from_montgomery(rr, &tmp, mont, ctx))
> > ++    if (!bn_from_mont_fixed_top(rr, &tmp, mont, ctx))
> > +         goto err;
> > +     ret =3D 1;
> > +  err:
> > +@@ -1160,6 +1156,19 @@ int BN_mod_exp_mont_consttime(BIGNUM *rr,
> > const BIGNUM *a, const BIGNUM *p,
> > +     return ret;
> > + }
> > +
> > ++int BN_mod_exp_mont_consttime(BIGNUM *rr, const BIGNUM *a, const
> > BIGNUM *p,
> > ++                              const BIGNUM *m, BN_CTX *ctx,
> > ++                              BN_MONT_CTX *in_mont)
> > ++{
> > ++    bn_check_top(a);
> > ++    bn_check_top(p);
> > ++    bn_check_top(m);
> > ++    if (!bn_mod_exp_mont_fixed_top(rr, a, p, m, ctx, in_mont))
> > ++        return 0;
> > ++    bn_correct_top(rr);
> > ++    return 1;
> > ++}
> > ++
> > + int BN_mod_exp_mont_word(BIGNUM *rr, BN_ULONG a, const BIGNUM *p,
> > +                          const BIGNUM *m, BN_CTX *ctx, BN_MONT_CTX *i=
n_mont)
> > + {
> > +diff --git a/crypto/ec/ec_lib.c b/crypto/ec/ec_lib.c
> > +index c92b4dcb0ac45..a79fbb98cf6fa 100644
> > +--- a/crypto/ec/ec_lib.c
> > ++++ b/crypto/ec/ec_lib.c
> > +@@ -21,6 +21,7 @@
> > + #include <openssl/opensslv.h>
> > + #include <openssl/param_build.h>
> > + #include "crypto/ec.h"
> > ++#include "crypto/bn.h"
> > + #include "internal/nelem.h"
> > + #include "ec_local.h"
> > +
> > +@@ -1261,10 +1262,10 @@ static int ec_field_inverse_mod_ord(const
> > EC_GROUP *group, BIGNUM *r,
> > +     if (!BN_sub(e, group->order, e))
> > +         goto err;
> > +     /*-
> > +-     * Exponent e is public.
> > +-     * No need for scatter-gather or BN_FLG_CONSTTIME.
> > ++     * Although the exponent is public we want the result to be
> > ++     * fixed top.
> > +      */
> > +-    if (!BN_mod_exp_mont(r, x, e, group->order, ctx, group->mont_data=
))
> > ++    if (!bn_mod_exp_mont_fixed_top(r, x, e, group->order, ctx, group-
> > >mont_data))
> > +         goto err;
> > +
> > +     ret =3D 1;
> > +diff --git a/include/crypto/bn.h b/include/crypto/bn.h
> > +index 302f031c2ff1d..499e1d10efab0 100644
> > +--- a/include/crypto/bn.h
> > ++++ b/include/crypto/bn.h
> > +@@ -73,6 +73,9 @@ int bn_set_words(BIGNUM *a, const BN_ULONG *words,
> > int num_words);
> > +  */
> > + int bn_mul_mont_fixed_top(BIGNUM *r, const BIGNUM *a, const BIGNUM *b=
,
> > +                           BN_MONT_CTX *mont, BN_CTX *ctx);
> > ++int bn_mod_exp_mont_fixed_top(BIGNUM *rr, const BIGNUM *a, const
> > BIGNUM *p,
> > ++                              const BIGNUM *m, BN_CTX *ctx,
> > ++                              BN_MONT_CTX *in_mont);
> > + int bn_to_mont_fixed_top(BIGNUM *r, const BIGNUM *a, BN_MONT_CTX
> > *mont,
> > +                          BN_CTX *ctx);
> > + int bn_from_mont_fixed_top(BIGNUM *r, const BIGNUM *a, BN_MONT_CTX
> > *mont,
> > diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.3.bb b/meta/=
recipes-
> > connectivity/openssl/openssl_3.2.3.bb
> > index 2c30dbd47ab..0b47bab5507 100644
> > --- a/meta/recipes-connectivity/openssl/openssl_3.2.3.bb
> > +++ b/meta/recipes-connectivity/openssl/openssl_3.2.3.bb
> > @@ -13,6 +13,7 @@ SRC_URI =3D
> > "https://github.com/openssl/openssl/releases/download/openssl-${PV}/op
> >             file://0001-Configure-do-not-tweak-mips-cflags.patch \
> >             file://0001-Added-handshake-history-reporting-when-test-fai=
ls.patch \
> >             file://CVE-2024-9143.patch \
> > +           file://CVE-2024-13176.patch \
> >             "
> >
> >  SRC_URI:append:class-nativesdk =3D " \
> > --
> > 2.30.2
>

