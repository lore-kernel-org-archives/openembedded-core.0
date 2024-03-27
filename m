Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD403CD11DD
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 00:11:42 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web11.25715.1711498293345009677
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Mar 2024 17:11:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KOvgIghs;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.176, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-61130dd21c1so40229817b3.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Mar 2024 17:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1711498292; x=1712103092; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JqLWRopVayQvk5YvHYM7nU6q2FegYAnpEGMAtCCGiUM=;
        b=KOvgIghsOyBPl1/2pHrv1Nu1Ckorpl+/PYKMtp7dabofT/997rEN19HUbgtKqICdWR
         jYQ32z2MM7iXtdmgAI7gUpqvJe//VPTPcVIpM9Bq7mjzNQMWdcCcnhP5xEHNnYwPmbql
         BvmMTXv532f9EzAVk3olIZlIrNvuNEyHBQt8K6oKuaoEgETtZSDVgEb3fqZGC4KDBNVV
         zbO4mV211w16bHEqXbYm0FbKO+uSndVwFAaUzNFkA5LwdPh1oxqOQMEeMKLy3HXHJz+1
         EYfJK7b+cnwR4to00/hvw9dpli/dFFw1b9T6d4Mf+R3SEWgaEnt2q8ZzTCBLGo8fKsaS
         LNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711498292; x=1712103092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JqLWRopVayQvk5YvHYM7nU6q2FegYAnpEGMAtCCGiUM=;
        b=iuyGuYGf85f3iBUNnm4xqztQs/ks2H1eg5iJsHCqt+u2vjUCZPRgbX9lEL0q7ynTIM
         Oegm/5H2cASE6epFhleC2HyPUXBgmwwc0WFsDyFpk44AgdbWrJXAwmwpr/XZtQ+LMVJ7
         7ppXqQqXF7IZDvWL1SbvtSXwXlh1ZFfzx5GxwBmAa7BXq3Tud3uHyav+Ib8LjrQL+j5J
         T9EQbAPWn1rpneJKqyGfUbXeibpdVb9LFC4Rt+XHkeK55lkP4Y35NAauV60wTHByU/8f
         uV2Vxq1lqUPDts81EliEAkclb+htNLcFHCTosUlWkaLV/zXhs+wUkyMpABL6tDU8gs74
         A3nw==
X-Forwarded-Encrypted: i=1; AJvYcCXjB7X7QMMamJ7j1XeT1jW7jzzywxtKrL5ytGMYAvv9Ze5l0TjN8Run5ExFRr4yw80+lqB9gDIuq7IUfBNQwaayXbArdYHrqVXcr6b9N7dgI9W1z20bZq9F
X-Gm-Message-State: AOJu0YztYxykyzDWDcggzo0aHmeqP05BR2EMBjEduh8UPN5Ro77B+woB
	oJEYA5WTsHtWGCC1n2/6REtc+PptxLKJkRQB2H5Tq7Hta3loTb72fKaTOZQv887j+D+7295FegL
	v17bXLhw+/qPWp8bx0W62saEeM0TbkS3+Yij1texAGhAmp/KiNwA=
X-Google-Smtp-Source: AGHT+IHZKS2x0zPvOIr+XN46K8F5mWqIk4qUoHDnvHgE0mzl6beEjBRu41UsXIjIsH5FHfgLWnsvv1jshAwh6HNcF54=
X-Received: by 2002:a0d:dbc3:0:b0:60c:beac:a69e with SMTP id
 d186-20020a0ddbc3000000b0060cbeaca69emr1291374ywe.23.1711498292250; Tue, 26
 Mar 2024 17:11:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240318065524.3337545-1-haitao.liu@windriver.com>
 <1bc87f74-e7b7-42b9-9c73-1f30846df519@windriver.com> <CAOSpxdapBOHDS6YX9LfApq1sbXeJ=FtHam3OBx0PfCaz5Pvsgw@mail.gmail.com>
 <785f2c07-1615-4435-8723-6d9b8aa0eb52@windriver.com>
In-Reply-To: <785f2c07-1615-4435-8723-6d9b8aa0eb52@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 26 Mar 2024 14:11:20 -1000
Message-ID: <CAOSpxdZvJJxmSsS4PP1x0-RUfhXSys66wmnPTS-Tujt3TobcfQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] openssl: Improve FIPS RSA keygen performac
To: randy.macleod@windriver.com
Cc: Haitao.Liu@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 00:11:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197542

On Tue, Mar 26, 2024 at 11:34=E2=80=AFAM Randy MacLeod via
lists.openembedded.org
<randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>
> On 2024-03-19 7:23 p.m., Steve Sakoman wrote:
>
> On Tue, Mar 19, 2024 at 11:45=E2=80=AFAM Randy MacLeod
> <randy.macleod@windriver.com> wrote:
>
> Hi Haitao, et al,
>
>
> Summary:
>
> I think we could bring these two commits back to kirkstone even though up=
stream openssl mtc
> does not plan to do so, at least not without "very good reasons".
>
> but I have some comments and questions below that I'd like you to respond=
 to before sending a v2.
>
> ../Randy
>
>
>
> Typo in the subject:
>    [OE-core][kirkstone][PATCH] openssl: Improve FIPS RSA keygen performac
> should be:
>    [OE-core][kirkstone][PATCH] openssl: Improve FIPS RSA keygen performan=
ce
>
> On 2024-03-18 2:55 a.m., jason.lau via lists.openembedded.org wrote:
>
> The ssh-keygen would take a long time to generate the entropy of a key
>
> It's best to be more specific.
>
> You mentioned in:
>
> https://github.com/openssl/openssl/issues/23766
>
> that "ssh-keygen (built with openssl3.0) is taking 1-2s to execute wherea=
s in openssl3.1 it was hardly half a second"
>
> so you should mention that in the commit log.
>
> You should also include a link to the upstream issue you opened to explai=
n that:
>
>    "Performance fixes are in general not eligible for backports to stable=
 release branches.
>     In specific cases an exception could be given by OTC but there would =
have to be very good reasons for such an exception."
>
> I saw that comment last week and wondered if we should push harder for up=
stream to backport these commits but
> I understand your reluctance to do that when it might make sense to just =
backport here in oe-core.
>
> Note that the commits are only part of 3.2.0+:
>
> =E2=9D=AF git tag --contains dd1d7bcb69994d81662e709b0ad838880b943870
> openssl-3.2.0
> openssl-3.2.0-alpha1
> openssl-3.2.0-alpha2
> openssl-3.2.0-beta1
> openssl-3.2.1
>
> =E2=9D=AF git tag --contains d2f6e66d2837bff1f5f7636bb2118e3a45c9df61
> openssl-3.2.0
> openssl-3.2.0-alpha1
> openssl-3.2.0-alpha2
> openssl-3.2.0-beta1
> openssl-3.2.1
>
> so they'd also have to be back-ported to nanbield technically:
>    https://git.openembedded.org/openembedded-core/tree/meta/recipes-conne=
ctivity/openssl/openssl_3.1.4.bb?h=3Dnanbield
>
> Steve,
> Given that nanbield is a week or so away from EOL, is it worth doing that=
?
>
> I'm going to close down changes to nanbield in the next day or so, so
> there probably isn't time to get such a change in.
>
> And I suspect that the kirkstone v2 patch won't make it through
>
> Haitao,
>
> Steve has NOT merged this to kirkstone:
>   https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/=
kirkstone-nut
>
>   https://git.openembedded.org/openembedded-core/log/?h=3Dkirkstone

Correct, I've been waiting for V2

Steve

> Please reply to and/or deal with my comments and send a v2.
>
> Thanks!
>
> ../Randy
>
>
> testing until after the nanbield final release is done, so I don't
> have an issue with taking it.
>
> Steve
>
> Note that the original commits were from Nov 2, 2022 so they've had some =
time to ummm, bake but
> the 3.2.0 release was 'only' on Nov 23, 2023:
>    https://www.openssl.org/source/old/3.2/index.html
> so it's got 3 or 4 months of the public being able to test it.
>
> I've taken a look at the commits and haven't seen a problem with the back=
port.
>
> Haitao,
> Did you have to adjust the patches at all? If so please explain what you =
did.
>
> Your tests show that openssl is faster, have you tested for correctness a=
t all?
> Does it make sense to run: test/bntest.c ? Steve will likely run the ptes=
ts of course.
>
> Do we need the oneline change: "Fix incorrect error branch in ossl_bn_rsa=
_fips186_4_derive_prime()"
> from:
> openssl.git on master
> =E2=9D=AF git log --oneline crypto/bn/bn_rsa_fips186_4.c
> da1c088f59 Copyright year updates
> 835b90a19c Fix incorrect error branch in ossl_bn_rsa_fips186_4_derive_pri=
me()
> d2f6e66d28 Improve FIPS RSA keygen performance.
> dd1d7bcb69 Improve FIPS RSA keygen performance.
>
>
> Are there any other changes to the files touched by these commits that wo=
uld affect
> the correctness or performance of the code introduced?
>
> ../Randy
>
>
>
> The following commits have fixed the issue.
> https://github.com/openssl/openssl/commit/dd1d7bcb69994d81662e709b0ad8388=
80b943870
> https://github.com/openssl/openssl/commit/d2f6e66d2837bff1f5f7636bb2118e3=
a45c9df61
>
> Signed-off-by: Haitao Liu <haitao.liu@windriver.com>
> ---
>  ...-Improve-FIPS-RSA-keygen-performance.patch | 271 ++++++++++++++++++
>  ...-Improve-FIPS-RSA-keygen-performance.patch | 185 ++++++++++++
>  .../openssl/openssl_3.0.13.bb                 |   2 +
>  3 files changed, 458 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Improv=
e-FIPS-RSA-keygen-performance.patch
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/0002-Improv=
e-FIPS-RSA-keygen-performance.patch
>
> diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Improve-FIPS-=
RSA-keygen-performance.patch b/meta/recipes-connectivity/openssl/openssl/00=
01-Improve-FIPS-RSA-keygen-performance.patch
> new file mode 100644
> index 0000000000..aed0e1a5c1
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/0001-Improve-FIPS-RSA-key=
gen-performance.patch
> @@ -0,0 +1,271 @@
> +From a940dfa152707ba82f3efc2c147f6313c28f7662 Mon Sep 17 00:00:00 2001
> +From: slontis <shane.lontis@oracle.com>
> +Date: Wed, 2 Nov 2022 12:01:34 +1000
> +Subject: [PATCH 1/2] Improve FIPS RSA keygen performance.
> +
> +FIPS 186-4 has 5 different algorithms for key generation,
> +and all of them rely on testing GCD(a,n) =3D=3D 1 many times.
> +
> +Cachegrind was showing that during a RSA keygen operation,
> +the function BN_gcd() was taking a considerable percentage
> +of the total cycles.
> +
> +The default provider uses multiprime keygen, which seemed to
> +be much faster. This is because it uses BN_mod_inverse()
> +instead.
> +
> +For a 4096 bit key, the entropy of a key that was taking a
> +long time to generate was recorded and fed back into subsequent
> +runs. Roughly 40% of the cycle time was BN_gcd() with most of the
> +remainder in the prime testing. Changing to use the inverse
> +resulted in the cycle count being 96% in the prime testing.
> +
> +Reviewed-by: Paul Dale <pauli@openssl.org>
> +Reviewed-by: Tomas Mraz <tomas@openssl.org>
> +(Merged from https://github.com/openssl/openssl/pull/19578)
> +
> +(cherry picked from commit dd1d7bcb69994d81662e709b0ad838880b943870)
> +
> +Upstream-Status: Backport [https://github.com/openssl/openssl/commit/dd1=
d7bcb69994d81662e709b0ad838880b943870]
> +
> +Signed-off-by: Haitao Liu <haitao.liu@windriver.com>
> +---
> + crypto/bn/bn_gcd.c           | 31 +++++++++++++++++++++++++++++++
> + crypto/bn/bn_rsa_fips186_4.c | 24 +++++++++++++++---------
> + doc/man3/BN_cmp.pod          | 14 +++++++++++++-
> + include/openssl/bn.h         |  1 +
> + test/bntest.c                | 26 ++++++++++++++++++++++++--
> + util/libcrypto.num           |  1 +
> + 6 files changed, 85 insertions(+), 12 deletions(-)
> +
> +diff --git a/crypto/bn/bn_gcd.c b/crypto/bn/bn_gcd.c
> +index cd0b015..879a84b 100644
> +--- a/crypto/bn/bn_gcd.c
> ++++ b/crypto/bn/bn_gcd.c
> +@@ -534,6 +534,37 @@ BIGNUM *BN_mod_inverse(BIGNUM *in,
> +     return rv;
> + }
> +
> ++/*
> ++ * The numbers a and b are coprime if the only positive integer that is=
 a
> ++ * divisor of both of them is 1.
> ++ * i.e. gcd(a,b) =3D 1.
> ++ *
> ++ * Coprimes have the property: b has a multiplicative inverse modulo a
> ++ * i.e there is some value x such that bx =3D 1 (mod a).
> ++ *
> ++ * Testing the modulo inverse is currently much faster than the constan=
t
> ++ * time version of BN_gcd().
> ++ */
> ++int BN_are_coprime(BIGNUM *a, const BIGNUM *b, BN_CTX *ctx)
> ++{
> ++    int ret =3D 0;
> ++    BIGNUM *tmp;
> ++
> ++    BN_CTX_start(ctx);
> ++    tmp =3D BN_CTX_get(ctx);
> ++    if (tmp =3D=3D NULL)
> ++        goto end;
> ++
> ++    ERR_set_mark();
> ++    BN_set_flags(a, BN_FLG_CONSTTIME);
> ++    ret =3D (BN_mod_inverse(tmp, a, b, ctx) !=3D NULL);
> ++    /* Clear any errors (an error is returned if there is no inverse) *=
/
> ++    ERR_pop_to_mark();
> ++end:
> ++    BN_CTX_end(ctx);
> ++    return ret;
> ++}
> ++
> + /*-
> +  * This function is based on the constant-time GCD work by Bernstein an=
d Yang:
> +  * https://eprint.iacr.org/2019/266
> +diff --git a/crypto/bn/bn_rsa_fips186_4.c b/crypto/bn/bn_rsa_fips186_4.c
> +index 62d8685..55efaf2 100644
> +--- a/crypto/bn/bn_rsa_fips186_4.c
> ++++ b/crypto/bn/bn_rsa_fips186_4.c
> +@@ -286,14 +286,20 @@ int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *Y, =
BIGNUM *X, const BIGNUM *Xin,
> +             goto err;
> +     }
> +
> ++    /*
> ++     * (Step 1) GCD(2r1, r2) =3D 1.
> ++     *    Note: This algorithm was doing a gcd(2r1, r2)=3D1 test before=
 doing an
> ++     *    mod_inverse(2r1, r2) which are effectively the same operation=
.
> ++     *    (The algorithm assumed that the gcd test would be faster). Si=
nce the
> ++     *    mod_inverse is currently faster than calling the constant tim=
e
> ++     *    BN_gcd(), the call to BN_gcd() has been omitted. The inverse =
result
> ++     *    is used further down.
> ++     */
> +     if (!(BN_lshift1(r1x2, r1)
> +-            /* (Step 1) GCD(2r1, r2) =3D 1 */
> +-            && BN_gcd(tmp, r1x2, r2, ctx)
> +-            && BN_is_one(tmp)
> ++            && (BN_mod_inverse(tmp, r1x2, r2, ctx) !=3D NULL)
> +             /* (Step 2) R =3D ((r2^-1 mod 2r1) * r2) - ((2r1^-1 mod r2)=
*2r1) */
> +-            && BN_mod_inverse(R, r2, r1x2, ctx)
> ++            && (BN_mod_inverse(R, r2, r1x2, ctx) !=3D NULL)
> +             && BN_mul(R, R, r2, ctx) /* R =3D (r2^-1 mod 2r1) * r2 */
> +-            && BN_mod_inverse(tmp, r1x2, r2, ctx)
> +             && BN_mul(tmp, tmp, r1x2, ctx) /* tmp =3D (2r1^-1 mod r2)*2=
r1 */
> +             && BN_sub(R, R, tmp)
> +             /* Calculate 2r1r2 */
> +@@ -305,7 +311,8 @@ int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *Y, BI=
GNUM *X, const BIGNUM *Xin,
> +
> +     /*
> +      * In FIPS 186-4 imax was set to 5 * nlen/2.
> +-     * Analysis by Allen Roginsky (See https://csrc.nist.gov/CSRC/media=
/Publications/fips/186/4/final/documents/comments-received-fips186-4-decemb=
er-2015.pdf
> ++     * Analysis by Allen Roginsky
> ++     * (See https://csrc.nist.gov/CSRC/media/Publications/fips/186/4/fi=
nal/documents/comments-received-fips186-4-december-2015.pdf
> +      * page 68) indicates this has a 1 in 2 million chance of failure.
> +      * The number has been updated to 20 * nlen/2 as used in
> +      * FIPS186-5 Appendix B.9 Step 9.
> +@@ -337,10 +344,9 @@ int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *Y, B=
IGNUM *X, const BIGNUM *Xin,
> +
> +             /* (Step 7) If GCD(Y-1) =3D=3D 1 & Y is probably prime then=
 return Y */
> +             if (BN_copy(y1, Y) =3D=3D NULL
> +-                    || !BN_sub_word(y1, 1)
> +-                    || !BN_gcd(tmp, y1, e, ctx))
> ++                    || !BN_sub_word(y1, 1))
> +                 goto err;
> +-            if (BN_is_one(tmp)) {
> ++            if (BN_are_coprime(y1, e, ctx)) {
> +                 int rv =3D BN_check_prime(Y, ctx, cb);
> +
> +                 if (rv > 0)
> +diff --git a/doc/man3/BN_cmp.pod b/doc/man3/BN_cmp.pod
> +index f302818..e9ddf8f 100644
> +--- a/doc/man3/BN_cmp.pod
> ++++ b/doc/man3/BN_cmp.pod
> +@@ -2,7 +2,8 @@
> +
> + =3Dhead1 NAME
> +
> +-BN_cmp, BN_ucmp, BN_is_zero, BN_is_one, BN_is_word, BN_abs_is_word, BN_=
is_odd - BIGNUM comparison and test functions
> ++BN_cmp, BN_ucmp, BN_is_zero, BN_is_one, BN_is_word, BN_abs_is_word, BN_=
is_odd, BN_are_coprime
> ++- BIGNUM comparison and test functions
> +
> + =3Dhead1 SYNOPSIS
> +
> +@@ -17,6 +18,8 @@ BN_cmp, BN_ucmp, BN_is_zero, BN_is_one, BN_is_word, BN=
_abs_is_word, BN_is_odd -
> +  int BN_abs_is_word(const BIGNUM *a, const BN_ULONG w);
> +  int BN_is_odd(const BIGNUM *a);
> +
> ++ int BN_are_coprime(BIGNUM *a, const BIGNUM *b, BN_CTX *ctx);
> ++
> + =3Dhead1 DESCRIPTION
> +
> + BN_cmp() compares the numbers I<a> and I<b>. BN_ucmp() compares their
> +@@ -26,6 +29,10 @@ BN_is_zero(), BN_is_one(), BN_is_word() and BN_abs_is=
_word() test if
> + I<a> equals 0, 1, I<w>, or E<verbar>I<w>E<verbar> respectively.
> + BN_is_odd() tests if I<a> is odd.
> +
> ++BN_are_coprime() determines if B<a> and B<b> are coprime.
> ++B<ctx> is used internally for storing temporary variables.
> ++The values of B<a> and B<b> and B<ctx> must not be NULL.
> ++
> + =3Dhead1 RETURN VALUES
> +
> + BN_cmp() returns -1 if I<a> E<lt> I<b>, 0 if I<a> =3D=3D I<b> and 1 if
> +@@ -35,11 +42,16 @@ of I<a> and I<b>.
> + BN_is_zero(), BN_is_one() BN_is_word(), BN_abs_is_word() and
> + BN_is_odd() return 1 if the condition is true, 0 otherwise.
> +
> ++BN_are_coprime() returns 1 if the B<BIGNUM>'s are coprime, otherwise it
> ++returns 0.
> ++
> + =3Dhead1 HISTORY
> +
> + Prior to OpenSSL 1.1.0, BN_is_zero(), BN_is_one(), BN_is_word(),
> + BN_abs_is_word() and BN_is_odd() were macros.
> +
> ++The function BN_are_coprime() was added in OpenSSL 3.1.
> ++
> + =3Dhead1 COPYRIGHT
> +
> + Copyright 2000-2021 The OpenSSL Project Authors. All Rights Reserved.
> +diff --git a/include/openssl/bn.h b/include/openssl/bn.h
> +index ecd7f01..73895a5 100644
> +--- a/include/openssl/bn.h
> ++++ b/include/openssl/bn.h
> +@@ -344,6 +344,7 @@ int BN_gcd(BIGNUM *r, const BIGNUM *a, const BIGNUM =
*b, BN_CTX *ctx);
> + int BN_kronecker(const BIGNUM *a, const BIGNUM *b, BN_CTX *ctx); /* ret=
urns
> +                                                                   * -2 =
for
> +                                                                   * err=
or */
> ++int BN_are_coprime(BIGNUM *a, const BIGNUM *b, BN_CTX *ctx);
> + BIGNUM *BN_mod_inverse(BIGNUM *ret,
> +                        const BIGNUM *a, const BIGNUM *n, BN_CTX *ctx);
> + BIGNUM *BN_mod_sqrt(BIGNUM *ret,
> +diff --git a/test/bntest.c b/test/bntest.c
> +index c5894c1..eec6222 100644
> +--- a/test/bntest.c
> ++++ b/test/bntest.c
> +@@ -38,6 +38,7 @@ typedef struct mpitest_st {
> +
> + static const int NUM0 =3D 100;           /* number of tests */
> + static const int NUM1 =3D 50;            /* additional tests for some f=
unctions */
> ++static const int NUM_PRIME_TESTS =3D 20;
> + static BN_CTX *ctx;
> +
> + /*
> +@@ -2573,6 +2574,25 @@ static int test_ctx_consttime_flag(void)
> +     return st;
> + }
> +
> ++static int test_coprime(void)
> ++{
> ++    BIGNUM *a =3D NULL, *b =3D NULL;
> ++    int ret =3D 0;
> ++
> ++    ret =3D TEST_ptr(a =3D BN_new())
> ++          && TEST_ptr(b =3D BN_new())
> ++          && TEST_true(BN_set_word(a, 66))
> ++          && TEST_true(BN_set_word(b, 99))
> ++          && TEST_int_eq(BN_are_coprime(a, b, ctx), 0)
> ++          && TEST_int_eq(BN_are_coprime(b, a, ctx), 0)
> ++          && TEST_true(BN_set_word(a, 67))
> ++          && TEST_int_eq(BN_are_coprime(a, b, ctx), 1)
> ++          && TEST_int_eq(BN_are_coprime(b, a, ctx), 1);
> ++    BN_free(a);
> ++    BN_free(b);
> ++    return ret;
> ++}
> ++
> + static int test_gcd_prime(void)
> + {
> +     BIGNUM *a =3D NULL, *b =3D NULL, *gcd =3D NULL;
> +@@ -2585,11 +2605,12 @@ static int test_gcd_prime(void)
> +
> +     if (!TEST_true(BN_generate_prime_ex(a, 1024, 0, NULL, NULL, NULL)))
> +             goto err;
> +-    for (i =3D 0; i < NUM0; i++) {
> ++    for (i =3D 0; i < NUM_PRIME_TESTS; i++) {
> +         if (!TEST_true(BN_generate_prime_ex(b, 1024, 0,
> +                                             NULL, NULL, NULL))
> +                 || !TEST_true(BN_gcd(gcd, a, b, ctx))
> +-                || !TEST_true(BN_is_one(gcd)))
> ++                || !TEST_true(BN_is_one(gcd))
> ++                || !TEST_true(BN_are_coprime(a, b, ctx)))
> +             goto err;
> +     }
> +
> +@@ -3066,6 +3087,7 @@ int setup_tests(void)
> +         ADD_ALL_TESTS(test_is_prime, (int)OSSL_NELEM(primes));
> +         ADD_ALL_TESTS(test_not_prime, (int)OSSL_NELEM(not_primes));
> +         ADD_TEST(test_gcd_prime);
> ++        ADD_TEST(test_coprime);
> +         ADD_ALL_TESTS(test_mod_exp, (int)OSSL_NELEM(ModExpTests));
> +         ADD_ALL_TESTS(test_mod_exp_consttime, (int)OSSL_NELEM(ModExpTes=
ts));
> +         ADD_TEST(test_mod_exp2_mont);
> +diff --git a/util/libcrypto.num b/util/libcrypto.num
> +index 0f6f30b..a1d1ed9 100644
> +--- a/util/libcrypto.num
> ++++ b/util/libcrypto.num
> +@@ -5429,3 +5429,4 @@ OPENSSL_strcasecmp                      5556 3_0_3=
 EXIST::FUNCTION:
> + OPENSSL_strncasecmp                     5557 3_0_3 EXIST::FUNCTION:
> + OSSL_CMP_CTX_reset_geninfo_ITAVs        5558 3_0_8 EXIST::FUNCTION:CMP
> + OSSL_CMP_MSG_update_recipNonce          5559 3_0_9 EXIST::FUNCTION:CMP
> ++BN_are_coprime                          5560 3_0_0 EXIST::FUNCTION:
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl/0002-Improve-FIPS-=
RSA-keygen-performance.patch b/meta/recipes-connectivity/openssl/openssl/00=
02-Improve-FIPS-RSA-keygen-performance.patch
> new file mode 100644
> index 0000000000..1a6b601f65
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/0002-Improve-FIPS-RSA-key=
gen-performance.patch
> @@ -0,0 +1,185 @@
> +From dfb8e0e716a1fd060eb13402d85cc46c8f64f929 Mon Sep 17 00:00:00 2001
> +From: slontis <shane.lontis@oracle.com>
> +Date: Wed, 2 Nov 2022 13:20:55 +1000
> +Subject: [PATCH 2/2] Improve FIPS RSA keygen performance.
> +
> +Reduce the Miller Rabin counts to the values specified by FIPS 186-5.
> +The old code was using a fixed value of 64.
> +
> +Reviewed-by: Paul Dale <pauli@openssl.org>
> +Reviewed-by: Tomas Mraz <tomas@openssl.org>
> +(Merged from https://github.com/openssl/openssl/pull/19579)
> +
> +(cherry picked from commit d2f6e66d2837bff1f5f7636bb2118e3a45c9df61)
> +
> +Upstream-Status: Backport [https://github.com/openssl/openssl/commit/d2f=
6e66d2837bff1f5f7636bb2118e3a45c9df61]
> +
> +Signed-off-by: Haitao Liu <haitao.liu@windriver.com>
> +---
> + crypto/bn/bn_prime.c         | 11 ++++++++
> + crypto/bn/bn_rsa_fips186_4.c | 49 ++++++++++++++++++++++++++++++------
> + include/crypto/bn.h          |  2 ++
> + 3 files changed, 54 insertions(+), 8 deletions(-)
> +
> +diff --git a/crypto/bn/bn_prime.c b/crypto/bn/bn_prime.c
> +index ddd31a0..79776f1 100644
> +--- a/crypto/bn/bn_prime.c
> ++++ b/crypto/bn/bn_prime.c
> +@@ -252,6 +252,17 @@ int ossl_bn_check_prime(const BIGNUM *w, int checks=
, BN_CTX *ctx,
> +     return bn_is_prime_int(w, checks, ctx, do_trial_division, cb);
> + }
> +
> ++/*
> ++ * Use this only for key generation.
> ++ * It always uses trial division. The number of checks
> ++ * (MR rounds) passed in is used without being clamped to a minimum val=
ue.
> ++ */
> ++int ossl_bn_check_generated_prime(const BIGNUM *w, int checks, BN_CTX *=
ctx,
> ++                                  BN_GENCB *cb)
> ++{
> ++    return bn_is_prime_int(w, checks, ctx, 1, cb);
> ++}
> ++
> + int BN_check_prime(const BIGNUM *p, BN_CTX *ctx, BN_GENCB *cb)
> + {
> +     return ossl_bn_check_prime(p, 0, ctx, 1, cb);
> +diff --git a/crypto/bn/bn_rsa_fips186_4.c b/crypto/bn/bn_rsa_fips186_4.c
> +index 55efaf2..c3466df 100644
> +--- a/crypto/bn/bn_rsa_fips186_4.c
> ++++ b/crypto/bn/bn_rsa_fips186_4.c
> +@@ -48,6 +48,34 @@ const BIGNUM ossl_bn_inv_sqrt_2 =3D {
> +     BN_FLG_STATIC_DATA
> + };
> +
> ++/*
> ++ * Refer to FIPS 186-5 Table B.1 for minimum rounds of Miller Rabin
> ++ * required for generation of RSA aux primes (p1, p2, q1 and q2).
> ++ */
> ++static int bn_rsa_fips186_5_aux_prime_MR_rounds(int nbits)
> ++{
> ++    if (nbits >=3D 4096)
> ++        return 44;
> ++    if (nbits >=3D 3072)
> ++        return 41;
> ++    if (nbits >=3D 2048)
> ++        return 38;
> ++    return 0; /* Error */
> ++}
> ++
> ++/*
> ++ * Refer to FIPS 186-5 Table B.1 for minimum rounds of Miller Rabin
> ++ * required for generation of RSA primes (p and q)
> ++ */
> ++static int bn_rsa_fips186_5_prime_MR_rounds(int nbits)
> ++{
> ++    if (nbits >=3D 3072)
> ++        return 4;
> ++    if (nbits >=3D 2048)
> ++        return 5;
> ++    return 0; /* Error */
> ++}
> ++
> + /*
> +  * FIPS 186-5 Table A.1. "Min length of auxiliary primes p1, p2, q1, q2=
".
> +  * (FIPS 186-5 has an entry for >=3D 4096 bits).
> +@@ -97,11 +125,13 @@ static int bn_rsa_fips186_5_aux_prime_max_sum_size_=
for_prob_primes(int nbits)
> +  *     Xp1 The passed in starting point to find a probably prime.
> +  *     p1 The returned probable prime (first odd integer >=3D Xp1)
> +  *     ctx A BN_CTX object.
> ++ *     rounds The number of Miller Rabin rounds
> +  *     cb An optional BIGNUM callback.
> +  * Returns: 1 on success otherwise it returns 0.
> +  */
> + static int bn_rsa_fips186_4_find_aux_prob_prime(const BIGNUM *Xp1,
> +                                                 BIGNUM *p1, BN_CTX *ctx=
,
> ++                                                int rounds,
> +                                                 BN_GENCB *cb)
> + {
> +     int ret =3D 0;
> +@@ -117,7 +147,7 @@ static int bn_rsa_fips186_4_find_aux_prob_prime(cons=
t BIGNUM *Xp1,
> +         i++;
> +         BN_GENCB_call(cb, 0, i);
> +         /* MR test with trial division */
> +-        tmp =3D BN_check_prime(p1, ctx, cb);
> ++        tmp =3D ossl_bn_check_generated_prime(p1, rounds, ctx, cb);
> +         if (tmp > 0)
> +             break;
> +         if (tmp < 0)
> +@@ -160,7 +190,7 @@ int ossl_bn_rsa_fips186_4_gen_prob_primes(BIGNUM *p,=
 BIGNUM *Xpout,
> + {
> +     int ret =3D 0;
> +     BIGNUM *p1i =3D NULL, *p2i =3D NULL, *Xp1i =3D NULL, *Xp2i =3D NULL=
;
> +-    int bitlen;
> ++    int bitlen, rounds;
> +
> +     if (p =3D=3D NULL || Xpout =3D=3D NULL)
> +         return 0;
> +@@ -177,6 +207,7 @@ int ossl_bn_rsa_fips186_4_gen_prob_primes(BIGNUM *p,=
 BIGNUM *Xpout,
> +     bitlen =3D bn_rsa_fips186_5_aux_prime_min_size(nlen);
> +     if (bitlen =3D=3D 0)
> +         goto err;
> ++    rounds =3D bn_rsa_fips186_5_aux_prime_MR_rounds(nlen);
> +
> +     /* (Steps 4.1/5.1): Randomly generate Xp1 if it is not passed in */
> +     if (Xp1 =3D=3D NULL) {
> +@@ -194,8 +225,8 @@ int ossl_bn_rsa_fips186_4_gen_prob_primes(BIGNUM *p,=
 BIGNUM *Xpout,
> +     }
> +
> +     /* (Steps 4.2/5.2) - find first auxiliary probable primes */
> +-    if (!bn_rsa_fips186_4_find_aux_prob_prime(Xp1i, p1i, ctx, cb)
> +-            || !bn_rsa_fips186_4_find_aux_prob_prime(Xp2i, p2i, ctx, cb=
))
> ++    if (!bn_rsa_fips186_4_find_aux_prob_prime(Xp1i, p1i, ctx, rounds, c=
b)
> ++            || !bn_rsa_fips186_4_find_aux_prob_prime(Xp2i, p2i, ctx, ro=
unds, cb))
> +         goto err;
> +     /* (Table B.1) auxiliary prime Max length check */
> +     if ((BN_num_bits(p1i) + BN_num_bits(p2i)) >=3D
> +@@ -243,11 +274,11 @@ err:
> +  */
> + int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *Y, BIGNUM *X, const BIGN=
UM *Xin,
> +                                        const BIGNUM *r1, const BIGNUM *=
r2,
> +-                                       int nlen, const BIGNUM *e, BN_CT=
X *ctx,
> +-                                       BN_GENCB *cb)
> ++                                       int nlen, const BIGNUM *e,
> ++                                       BN_CTX *ctx, BN_GENCB *cb)
> + {
> +     int ret =3D 0;
> +-    int i, imax;
> ++    int i, imax, rounds;
> +     int bits =3D nlen >> 1;
> +     BIGNUM *tmp, *R, *r1r2x2, *y1, *r1x2;
> +     BIGNUM *base, *range;
> +@@ -317,6 +348,7 @@ int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *Y, BI=
GNUM *X, const BIGNUM *Xin,
> +      * The number has been updated to 20 * nlen/2 as used in
> +      * FIPS186-5 Appendix B.9 Step 9.
> +      */
> ++    rounds =3D bn_rsa_fips186_5_prime_MR_rounds(nlen);
> +     imax =3D 20 * bits; /* max =3D 20/2 * nbits */
> +     for (;;) {
> +         if (Xin =3D=3D NULL) {
> +@@ -346,8 +378,9 @@ int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *Y, BI=
GNUM *X, const BIGNUM *Xin,
> +             if (BN_copy(y1, Y) =3D=3D NULL
> +                     || !BN_sub_word(y1, 1))
> +                 goto err;
> ++
> +             if (BN_are_coprime(y1, e, ctx)) {
> +-                int rv =3D BN_check_prime(Y, ctx, cb);
> ++                int rv =3D ossl_bn_check_generated_prime(Y, rounds, ctx=
, cb);
> +
> +                 if (rv > 0)
> +                     goto end;
> +diff --git a/include/crypto/bn.h b/include/crypto/bn.h
> +index fd1c09d..00544d9 100644
> +--- a/include/crypto/bn.h
> ++++ b/include/crypto/bn.h
> +@@ -95,6 +95,8 @@ int bn_div_fixed_top(BIGNUM *dv, BIGNUM *rem, const BI=
GNUM *m,
> +
> + int ossl_bn_miller_rabin_is_prime(const BIGNUM *w, int iterations, BN_C=
TX *ctx,
> +                                   BN_GENCB *cb, int enhanced, int *stat=
us);
> ++int ossl_bn_check_generated_prime(const BIGNUM *w, int checks, BN_CTX *=
ctx,
> ++                                  BN_GENCB *cb);
> +
> + const BIGNUM *ossl_bn_get0_small_factors(void);
> +
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.13.bb b/meta/r=
ecipes-connectivity/openssl/openssl_3.0.13.bb
> index 5e43fdc2de..5b09493ccd 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.0.13.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.0.13.bb
> @@ -12,6 +12,8 @@ SRC_URI =3D "http://www.openssl.org/source/openssl-${PV=
}.tar.gz \
>             file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from=
-co.patch \
>             file://afalg.patch \
>             file://0001-Configure-do-not-tweak-mips-cflags.patch \
> +           file://0001-Improve-FIPS-RSA-keygen-performance.patch \
> +           file://0002-Improve-FIPS-RSA-keygen-performance.patch \
>             "
>
>  SRC_URI:append:class-nativesdk =3D " \
>
>
>
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197541): https://lists.openembedded.org/g/openembedde=
d-core/message/197541
> Mute This Topic: https://lists.openembedded.org/mt/104998278/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

