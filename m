Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DCE6C54E67
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 07:41:14 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.31914.1711525270795254178
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Mar 2024 00:41:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B37NPbq3;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-513d247e3c4so560800e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 00:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711525269; x=1712130069; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rYgXGAgyR7lE8HnbI3V08rgCPDfOSJDP41JHy75KpA=;
        b=B37NPbq3ahAOsbmizQ3cqkWP7kDeMt0CgTXsJ3SDBJduSRUun5UQ6ENQevAfDFxDRz
         cLM3bQ69eNL1rIHVxXgW7vzhEzRo+Krw1agzc8WMSVetb/j6qlBT/SBVfsEoA7VS5FLR
         BI35sUst5+Ms4vsz+R7WVU5nkS1wAfncfUSCZ9DIqg+NH1BZMGiybIl0CICS/vqbJy/M
         jUgw3fehRPrn3r3tW9mW4GFTIKr4/+DZNz4ao/kA/Stw9OylQ/1sczNVbQcfKXWeWcGO
         0GlIof0YG5dO/sGmqhmN36JqF5z6M6XGUuUlqdRb0gDPOaeBTq0bkdkFjpXpL9Nf06l1
         KOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711525269; x=1712130069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0rYgXGAgyR7lE8HnbI3V08rgCPDfOSJDP41JHy75KpA=;
        b=kSlGiVI4NwaISdgt+ncP6MO3bqi7llXnLN8V5GPuNRF0RaCRZPNtgDIy3W9LfKDoeD
         kWDUSmxMmiI3tDCU0jGWzKZLT2SoWawwt0oS8Qbh11/Z5tpun87Z6dYcY3BLnh9Uij14
         tv6mAGYHb9g7uNmBnVn5CS1LTt6oLt1Ano9iPByn6BcMFFFpvKWqXwAPGB3R3uKhd/FS
         g5lU9RvRhzI4ukj5qH0KbXlqEhBne/XaC1j8c5SwSCm/3tiiA8qwnb2IrDEYNeWxD0rS
         WheJODHV8YpgJ7eswh6v0huFZ3Bb8FisuarguWNrJyceVwVcYuUbQ3E/2LnocR8JloHN
         QnAg==
X-Forwarded-Encrypted: i=1; AJvYcCUwj6dRp/AvzGD6xl2nypuvTlstQAyjyse1Sk5v9hOGddB5CrqgMnJW0uzbZ0hyx+fVqAgMnbJt4FKz//ipf5L/D8EpFXmZWZLtCn4o8xjVKhjxix7wsFH5
X-Gm-Message-State: AOJu0YwjoQhIbKOvJJZTgmH8zWoW9RGxB2clU8zUwkJRxFV1oGnbubbr
	iT0o4h6W85XdZzAhLSJ/Wm178Ua3LYazZIGqGWTC1gNV/tF/QV10BLkCuseMmhWRCtQNa+d9qPg
	hzDeKjUV9GQcg8IBLxFNglWk/9h0=
X-Google-Smtp-Source: AGHT+IGyU6gMYc1Zgma16vCD/j/8yX10jrh+QDD1sCKMKNEeTTX8Y65X2JUTDw5gQsEKa38u93GeTw4ytHVfF6GW3EE=
X-Received: by 2002:ac2:5b88:0:b0:513:e29d:6840 with SMTP id
 o8-20020ac25b88000000b00513e29d6840mr1274766lfn.15.1711525267534; Wed, 27 Mar
 2024 00:41:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240318065524.3337545-1-haitao.liu@windriver.com>
 <1bc87f74-e7b7-42b9-9c73-1f30846df519@windriver.com> <CAOSpxdapBOHDS6YX9LfApq1sbXeJ=FtHam3OBx0PfCaz5Pvsgw@mail.gmail.com>
 <785f2c07-1615-4435-8723-6d9b8aa0eb52@windriver.com> <CAOSpxdZvJJxmSsS4PP1x0-RUfhXSys66wmnPTS-Tujt3TobcfQ@mail.gmail.com>
 <SJ2PR11MB840279AE24EA33503E2BFA1E9F342@SJ2PR11MB8402.namprd11.prod.outlook.com>
In-Reply-To: <SJ2PR11MB840279AE24EA33503E2BFA1E9F342@SJ2PR11MB8402.namprd11.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 27 Mar 2024 08:40:55 +0100
Message-ID: <CANNYZj-tQVcT5sQFChYAOPZkw_Kaxy6AX2ZPwsofG7nCrKGGFQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] openssl: Improve FIPS RSA keygen performac
To: Haitao.Liu@windriver.com
Cc: "steve@sakoman.com" <steve@sakoman.com>, "MacLeod, Randy" <Randy.MacLeod@windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 07:41:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197550

Sorry, but I have to strongly object to this. Performance improvements
are not bug/security fixes, and thus are not eligible for backports.

In addition, key generation in a key crypto component is a highly
sensitive area, it's very easy to get wrong and render the whole of
yocto insecure, and without upstream review none of us understand what
is going on, and what is being changed, and whether the backport is
correct.

If you need faster crypto, bring in a new openssl version in a private
layer, or better yet, contribute it to a lts-mixin layer.

Alex

On Wed, 27 Mar 2024 at 04:16, jason.lau via lists.openembedded.org
<Haitao.Liu=3Dwindriver.com@lists.openembedded.org> wrote:
>
> Hey!
>
> Sorry for the late reply, I was on vacation for a week.
>
> >-----Original Message-----
> >From: openembedded-core@lists.openembedded.org <openembedded-
> >core@lists.openembedded.org> On Behalf Of Steve Sakoman via
> >lists.openembedded.org
> >Sent: Wednesday, March 27, 2024 8:11 AM
> >To: MacLeod, Randy <Randy.MacLeod@windriver.com>
> >Cc: Liu, Haitao <Haitao.Liu@windriver.com>; openembedded-
> >core@lists.openembedded.org
> >Subject: Re: [OE-core][kirkstone][PATCH] openssl: Improve FIPS RSA keyge=
n
> >performac
> >
> >CAUTION: This email comes from a non Wind River email account!
> >Do not click links or open attachments unless you recognize the sender a=
nd
> >know the content is safe.
> >
> >On Tue, Mar 26, 2024 at 11:34=E2=80=AFAM Randy MacLeod via lists.openemb=
edded.org
> ><randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
> >>
> >> On 2024-03-19 7:23 p.m., Steve Sakoman wrote:
> >>
> >> On Tue, Mar 19, 2024 at 11:45=E2=80=AFAM Randy MacLeod
> >> <randy.macleod@windriver.com> wrote:
> >>
> >> Hi Haitao, et al,
> >>
> >>
> >> Summary:
> >>
> >> I think we could bring these two commits back to kirkstone even though
> >> upstream openssl mtc does not plan to do so, at least not without "ver=
y good
> >reasons".
> >>
> >> but I have some comments and questions below that I'd like you to resp=
ond
> >to before sending a v2.
> >>
> >> ../Randy
> >>
> >>
> >>
> >> Typo in the subject:
> >>    [OE-core][kirkstone][PATCH] openssl: Improve FIPS RSA keygen
> >> performac should be:
> >>    [OE-core][kirkstone][PATCH] openssl: Improve FIPS RSA keygen
> >> performance
> >>
> >> On 2024-03-18 2:55 a.m., jason.lau via lists.openembedded.org wrote:
> >>
> >> The ssh-keygen would take a long time to generate the entropy of a key
> >>
> >> It's best to be more specific.
> >>
> >> You mentioned in:
> >>
> >> https://github.com/openssl/openssl/issues/23766
> >>
> >> that "ssh-keygen (built with openssl3.0) is taking 1-2s to execute whe=
reas in
> >openssl3.1 it was hardly half a second"
> >>
> >> so you should mention that in the commit log.
>
> I will add these comments into the V2 patch.
>
>
> >>
> >> You should also include a link to the upstream issue you opened to exp=
lain
> >that:
> >>
> >>    "Performance fixes are in general not eligible for backports to sta=
ble release
> >branches.
> >>     In specific cases an exception could be given by OTC but there wou=
ld have
> >to be very good reasons for such an exception."
> >>
> >> I saw that comment last week and wondered if we should push harder for
> >> upstream to backport these commits but I understand your reluctance to=
 do
> >that when it might make sense to just backport here in oe-core.
> >>
> >> Note that the commits are only part of 3.2.0+:
> >>
> >> =E2=9D=AF git tag --contains dd1d7bcb69994d81662e709b0ad838880b943870
> >> openssl-3.2.0
> >> openssl-3.2.0-alpha1
> >> openssl-3.2.0-alpha2
> >> openssl-3.2.0-beta1
> >> openssl-3.2.1
> >>
> >> =E2=9D=AF git tag --contains d2f6e66d2837bff1f5f7636bb2118e3a45c9df61
> >> openssl-3.2.0
> >> openssl-3.2.0-alpha1
> >> openssl-3.2.0-alpha2
> >> openssl-3.2.0-beta1
> >> openssl-3.2.1
> >>
> >> so they'd also have to be back-ported to nanbield technically:
> >>
> >> https://git.openembedded.org/openembedded-core/tree/meta/recipes-
> >conne
> >> ctivity/openssl/openssl_3.1.4.bb?h=3Dnanbield
> >>
> >> Steve,
> >> Given that nanbield is a week or so away from EOL, is it worth doing t=
hat?
> >>
> >> I'm going to close down changes to nanbield in the next day or so, so
> >> there probably isn't time to get such a change in.
> >>
> >> And I suspect that the kirkstone v2 patch won't make it through
> >>
> >> Haitao,
> >>
> >> Steve has NOT merged this to kirkstone:
> >>
> >> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable=
/k
> >> irkstone-nut
> >>
> >>   https://git.openembedded.org/openembedded-core/log/?h=3Dkirkstone
> >
> >Correct, I've been waiting for V2
> >
> >Steve
>
> I will sent the V2 Patch as soon as possible.
>
>
> >
> >> Please reply to and/or deal with my comments and send a v2.
> >>
> >> Thanks!
> >>
> >> ../Randy
> >>
> >>
> >> testing until after the nanbield final release is done, so I don't
> >> have an issue with taking it.
> >>
> >> Steve
> >>
> >> Note that the original commits were from Nov 2, 2022 so they've had
> >> some time to ummm, bake but the 3.2.0 release was 'only' on Nov 23, 20=
23:
> >>    https://www.openssl.org/source/old/3.2/index.html
> >> so it's got 3 or 4 months of the public being able to test it.
> >>
> >> I've taken a look at the commits and haven't seen a problem with the
> >backport.
> >>
> >> Haitao,
> >> Did you have to adjust the patches at all? If so please explain what y=
ou did.
> >>
>
> HI Randy,
> I did not adjust the content of patches a lot.
>
> 1. add a function definition for "BN_are_coprime()" in util/libcrypto.num=
 to indicate that the function was introduced on openssl 3.1.1
>
>    diff a/util/libcrypto.num b/util/libcrypto.num  (rejected hunks)
>    @@ -5432,3 +5432,4 @@ RAND_set0_public                        ? 3_1_0 =
  EXIST::FUNCTION:
>     RAND_set0_private                       ?  3_1_0   EXIST::FUNCTION:
>     EVP_MD_CTX_dup                          ?  3_1_0   EXIST::FUNCTION:
>     EVP_CIPHER_CTX_dup                      ?  3_1_0   EXIST::FUNCTION:
>    +BN_are_coprime                          ?  3_1_0   EXIST::FUNCTION:
>
> 2. And the second patch could be applied directly without any modificatio=
n.
>
>
> >> Your tests show that openssl is faster, have you tested for correctnes=
s at all?
> >> Does it make sense to run: test/bntest.c ? Steve will likely run the p=
tests of
> >course.
>
> I sure have tried about thousand times about it.  I also ran the Ptests o=
f OpenSSL before sending them to upstream.
>
> root@genericx86-64:/usr/lib/openssl/ptest# ./run-ptest
> SKIP: 00-prep_fipsmodule_cnf.t .. skipped: FIPS module config file only s=
upported in a fips build
> Files=3D1, Tests=3D0,  0 wallclock secs ( 0.01 usr  0.00 sys +  0.23 cusr=
  0.03 csys =3D  0.27 CPU)
> Result: NOTESTS
> PASS: 01-test_abort.t .................... ok
> SKIP: 01-test_fipsmodule_cnf.t ........... skipped: Test only supported i=
n a fips build
> PASS: 01-test_sanity.t ................... ok
> PASS: 01-test_symbol_presence.t .......... ok
> PASS: 01-test_test.t ..................... ok
> PASS: 02-test_errstr.t ................... ok
> PASS: 02-test_internal_context.t ......... ok
> PASS: 02-test_internal_ctype.t ........... ok
> .....
> PASS: 99-test_fuzz_conf.t ................ ok
> PASS: 99-test_fuzz_crl.t ................. ok
> PASS: 99-test_fuzz_ct.t .................. ok
> PASS: 99-test_fuzz_server.t .............. ok
> PASS: 99-test_fuzz_x509.t ................ ok
> All tests successful.
> Files=3D253, Tests=3D3368, 463 wallclock secs (10.59 usr  0.77 sys + 323.=
66 cusr 65.69 csys =3D 400.71 CPU)
>
> ../haitao
>
>
>
> >>
> >> Do we need the oneline change: "Fix incorrect error branch in
> >ossl_bn_rsa_fips186_4_derive_prime()"
>
> This commit is not a fixed commit for "d2f6e66d28 Improve FIPS RSA keygen=
 performance" and " dd1d7bcb69 Improve FIPS RSA keygen performance".
>
> And it did not improve the performance at all after applying it.
>
> ../haitao
>
> >> from:
> >> openssl.git on master
> >> =E2=9D=AF git log --oneline crypto/bn/bn_rsa_fips186_4.c
> >> da1c088f59 Copyright year updates
> >> 835b90a19c Fix incorrect error branch in
> >> ossl_bn_rsa_fips186_4_derive_prime()
> >> d2f6e66d28 Improve FIPS RSA keygen performance.
> >> dd1d7bcb69 Improve FIPS RSA keygen performance.
> >>
> >>
> >> Are there any other changes to the files touched by these commits that
> >> would affect the correctness or performance of the code introduced?
> >>
>
> I have checked all the  files touched by these commits. We did not need t=
o introduce any other patches.
>
> hliu4@pek-lpd-susbld:openssl$git_log crypto/bn/bn_gcd.c
> e6e6113ebb 2023-10-24 14:40:29 +0100 Copyright year updates
> f41af715c1 2023-10-05 12:05:48 +0200 BN_gcd(): Avoid shifts of negative v=
alues
> 1136c4dc39 2022-11-21 11:20:38 +0100 Improve FIPS RSA keygen performance.
>
> hliu4@pek-lpd-susbld:openssl$git_log crypto/bn/bn_prime.c
> 3431dd4b3e 2022-11-23 08:27:42 +0100 Improve FIPS RSA keygen performance.
> 4b20cbbe1c 2022-10-11 13:20:27 +0100 Update copyright year
>
> ../haitao
>
> >> ../Randy
> >>
> >>
> >>
> >> The following commits have fixed the issue.
> >>
> >https://github.com/openssl/openssl/commit/dd1d7bcb69994d81662e709b0ad
> >8
> >> 38880b943870
> >>
> >https://github.com/openssl/openssl/commit/d2f6e66d2837bff1f5f7636bb211
> >> 8e3a45c9df61
> >>
> >> Signed-off-by: Haitao Liu <haitao.liu@windriver.com>
> >> ---
> >>  ...-Improve-FIPS-RSA-keygen-performance.patch | 271
> >> ++++++++++++++++++  ...-Improve-FIPS-RSA-keygen-performance.patch | 18=
5
> >++++++++++++
> >>  .../openssl/openssl_3.0.13.bb                 |   2 +
> >>  3 files changed, 458 insertions(+)
> >>  create mode 100644
> >> meta/recipes-connectivity/openssl/openssl/0001-Improve-FIPS-RSA-keygen
> >> -performance.patch  create mode 100644
> >> meta/recipes-connectivity/openssl/openssl/0002-Improve-FIPS-RSA-keygen
> >> -performance.patch
> >>
> >> diff --git
> >> a/meta/recipes-connectivity/openssl/openssl/0001-Improve-FIPS-RSA-keyg
> >> en-performance.patch
> >> b/meta/recipes-connectivity/openssl/openssl/0001-Improve-FIPS-RSA-keyg
> >> en-performance.patch
> >> new file mode 100644
> >> index 0000000000..aed0e1a5c1
> >> --- /dev/null
> >> +++ b/meta/recipes-connectivity/openssl/openssl/0001-Improve-FIPS-RSA-
> >> +++ keygen-performance.patch
> >> @@ -0,0 +1,271 @@
> >> +From a940dfa152707ba82f3efc2c147f6313c28f7662 Mon Sep 17 00:00:00
> >> +2001
> >> +From: slontis <shane.lontis@oracle.com>
> >> +Date: Wed, 2 Nov 2022 12:01:34 +1000
> >> +Subject: [PATCH 1/2] Improve FIPS RSA keygen performance.
> >> +
> >> +FIPS 186-4 has 5 different algorithms for key generation, and all of
> >> +them rely on testing GCD(a,n) =3D=3D 1 many times.
> >> +
> >> +Cachegrind was showing that during a RSA keygen operation, the
> >> +function BN_gcd() was taking a considerable percentage of the total
> >> +cycles.
> >> +
> >> +The default provider uses multiprime keygen, which seemed to be much
> >> +faster. This is because it uses BN_mod_inverse() instead.
> >> +
> >> +For a 4096 bit key, the entropy of a key that was taking a long time
> >> +to generate was recorded and fed back into subsequent runs. Roughly
> >> +40% of the cycle time was BN_gcd() with most of the remainder in the
> >> +prime testing. Changing to use the inverse resulted in the cycle
> >> +count being 96% in the prime testing.
> >> +
> >> +Reviewed-by: Paul Dale <pauli@openssl.org>
> >> +Reviewed-by: Tomas Mraz <tomas@openssl.org> (Merged from
> >> +https://github.com/openssl/openssl/pull/19578)
> >> +
> >> +(cherry picked from commit
> >dd1d7bcb69994d81662e709b0ad838880b943870)
> >> +
> >> +Upstream-Status: Backport
> >>
> >+[https://github.com/openssl/openssl/commit/dd1d7bcb69994d81662e709b0
> >a
> >> +d838880b943870]
> >> +
> >> +Signed-off-by: Haitao Liu <haitao.liu@windriver.com>
> >> +---
> >> + crypto/bn/bn_gcd.c           | 31 +++++++++++++++++++++++++++++++
> >> + crypto/bn/bn_rsa_fips186_4.c | 24 +++++++++++++++---------
> >> + doc/man3/BN_cmp.pod          | 14 +++++++++++++-
> >> + include/openssl/bn.h         |  1 +
> >> + test/bntest.c                | 26 ++++++++++++++++++++++++--
> >> + util/libcrypto.num           |  1 +
> >> + 6 files changed, 85 insertions(+), 12 deletions(-)
> >> +
> >> +diff --git a/crypto/bn/bn_gcd.c b/crypto/bn/bn_gcd.c index
> >> +cd0b015..879a84b 100644
> >> +--- a/crypto/bn/bn_gcd.c
> >> ++++ b/crypto/bn/bn_gcd.c
> >> +@@ -534,6 +534,37 @@ BIGNUM *BN_mod_inverse(BIGNUM *in,
> >> +     return rv;
> >> + }
> >> +
> >> ++/*
> >> ++ * The numbers a and b are coprime if the only positive integer that
> >> ++is a
> >> ++ * divisor of both of them is 1.
> >> ++ * i.e. gcd(a,b) =3D 1.
> >> ++ *
> >> ++ * Coprimes have the property: b has a multiplicative inverse modulo
> >> ++a
> >> ++ * i.e there is some value x such that bx =3D 1 (mod a).
> >> ++ *
> >> ++ * Testing the modulo inverse is currently much faster than the
> >> ++constant
> >> ++ * time version of BN_gcd().
> >> ++ */
> >> ++int BN_are_coprime(BIGNUM *a, const BIGNUM *b, BN_CTX *ctx) {
> >> ++    int ret =3D 0;
> >> ++    BIGNUM *tmp;
> >> ++
> >> ++    BN_CTX_start(ctx);
> >> ++    tmp =3D BN_CTX_get(ctx);
> >> ++    if (tmp =3D=3D NULL)
> >> ++        goto end;
> >> ++
> >> ++    ERR_set_mark();
> >> ++    BN_set_flags(a, BN_FLG_CONSTTIME);
> >> ++    ret =3D (BN_mod_inverse(tmp, a, b, ctx) !=3D NULL);
> >> ++    /* Clear any errors (an error is returned if there is no inverse=
) */
> >> ++    ERR_pop_to_mark();
> >> ++end:
> >> ++    BN_CTX_end(ctx);
> >> ++    return ret;
> >> ++}
> >> ++
> >> + /*-
> >> +  * This function is based on the constant-time GCD work by Bernstein=
 and
> >Yang:
> >> +  * https://eprint.iacr.org/2019/266
> >> +diff --git a/crypto/bn/bn_rsa_fips186_4.c
> >> +b/crypto/bn/bn_rsa_fips186_4.c index 62d8685..55efaf2 100644
> >> +--- a/crypto/bn/bn_rsa_fips186_4.c
> >> ++++ b/crypto/bn/bn_rsa_fips186_4.c
> >> +@@ -286,14 +286,20 @@ int
> >ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *Y, BIGNUM *X, const BIGNUM
> >*Xin,
> >> +             goto err;
> >> +     }
> >> +
> >> ++    /*
> >> ++     * (Step 1) GCD(2r1, r2) =3D 1.
> >> ++     *    Note: This algorithm was doing a gcd(2r1, r2)=3D1 test bef=
ore doing an
> >> ++     *    mod_inverse(2r1, r2) which are effectively the same operat=
ion.
> >> ++     *    (The algorithm assumed that the gcd test would be faster).=
 Since the
> >> ++     *    mod_inverse is currently faster than calling the constant =
time
> >> ++     *    BN_gcd(), the call to BN_gcd() has been omitted. The inver=
se result
> >> ++     *    is used further down.
> >> ++     */
> >> +     if (!(BN_lshift1(r1x2, r1)
> >> +-            /* (Step 1) GCD(2r1, r2) =3D 1 */
> >> +-            && BN_gcd(tmp, r1x2, r2, ctx)
> >> +-            && BN_is_one(tmp)
> >> ++            && (BN_mod_inverse(tmp, r1x2, r2, ctx) !=3D NULL)
> >> +             /* (Step 2) R =3D ((r2^-1 mod 2r1) * r2) - ((2r1^-1 mod =
r2)*2r1) */
> >> +-            && BN_mod_inverse(R, r2, r1x2, ctx)
> >> ++            && (BN_mod_inverse(R, r2, r1x2, ctx) !=3D NULL)
> >> +             && BN_mul(R, R, r2, ctx) /* R =3D (r2^-1 mod 2r1) * r2 *=
/
> >> +-            && BN_mod_inverse(tmp, r1x2, r2, ctx)
> >> +             && BN_mul(tmp, tmp, r1x2, ctx) /* tmp =3D (2r1^-1 mod r2=
)*2r1 */
> >> +             && BN_sub(R, R, tmp)
> >> +             /* Calculate 2r1r2 */
> >> +@@ -305,7 +311,8 @@ int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM
> >*Y,
> >> +BIGNUM *X, const BIGNUM *Xin,
> >> +
> >> +     /*
> >> +      * In FIPS 186-4 imax was set to 5 * nlen/2.
> >> +-     * Analysis by Allen Roginsky (See
> >https://csrc.nist.gov/CSRC/media/Publications/fips/186/4/final/documents=
/co
> >mments-received-fips186-4-december-2015.pdf
> >> ++     * Analysis by Allen Roginsky
> >> ++     * (See
> >> ++ https://csrc.nist.gov/CSRC/media/Publications/fips/186/4/final/docu
> >> ++ ments/comments-received-fips186-4-december-2015.pdf
> >> +      * page 68) indicates this has a 1 in 2 million chance of failur=
e.
> >> +      * The number has been updated to 20 * nlen/2 as used in
> >> +      * FIPS186-5 Appendix B.9 Step 9.
> >> +@@ -337,10 +344,9 @@ int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM
> >> +*Y, BIGNUM *X, const BIGNUM *Xin,
> >> +
> >> +             /* (Step 7) If GCD(Y-1) =3D=3D 1 & Y is probably prime t=
hen return Y */
> >> +             if (BN_copy(y1, Y) =3D=3D NULL
> >> +-                    || !BN_sub_word(y1, 1)
> >> +-                    || !BN_gcd(tmp, y1, e, ctx))
> >> ++                    || !BN_sub_word(y1, 1))
> >> +                 goto err;
> >> +-            if (BN_is_one(tmp)) {
> >> ++            if (BN_are_coprime(y1, e, ctx)) {
> >> +                 int rv =3D BN_check_prime(Y, ctx, cb);
> >> +
> >> +                 if (rv > 0)
> >> +diff --git a/doc/man3/BN_cmp.pod b/doc/man3/BN_cmp.pod index
> >> +f302818..e9ddf8f 100644
> >> +--- a/doc/man3/BN_cmp.pod
> >> ++++ b/doc/man3/BN_cmp.pod
> >> +@@ -2,7 +2,8 @@
> >> +
> >> + =3Dhead1 NAME
> >> +
> >> +-BN_cmp, BN_ucmp, BN_is_zero, BN_is_one, BN_is_word, BN_abs_is_word,
> >> +BN_is_odd - BIGNUM comparison and test functions
> >> ++BN_cmp, BN_ucmp, BN_is_zero, BN_is_one, BN_is_word, BN_abs_is_word,
> >> ++BN_is_odd, BN_are_coprime
> >> ++- BIGNUM comparison and test functions
> >> +
> >> + =3Dhead1 SYNOPSIS
> >> +
> >> +@@ -17,6 +18,8 @@ BN_cmp, BN_ucmp, BN_is_zero, BN_is_one,
> >BN_is_word,
> >> +BN_abs_is_word, BN_is_odd -
> >> +  int BN_abs_is_word(const BIGNUM *a, const BN_ULONG w);
> >> +  int BN_is_odd(const BIGNUM *a);
> >> +
> >> ++ int BN_are_coprime(BIGNUM *a, const BIGNUM *b, BN_CTX *ctx);
> >> ++
> >> + =3Dhead1 DESCRIPTION
> >> +
> >> + BN_cmp() compares the numbers I<a> and I<b>. BN_ucmp() compares
> >> +their @@ -26,6 +29,10 @@ BN_is_zero(), BN_is_one(), BN_is_word() and
> >> +BN_abs_is_word() test if  I<a> equals 0, 1, I<w>, or
> >E<verbar>I<w>E<verbar> respectively.
> >> + BN_is_odd() tests if I<a> is odd.
> >> +
> >> ++BN_are_coprime() determines if B<a> and B<b> are coprime.
> >> ++B<ctx> is used internally for storing temporary variables.
> >> ++The values of B<a> and B<b> and B<ctx> must not be NULL.
> >> ++
> >> + =3Dhead1 RETURN VALUES
> >> +
> >> + BN_cmp() returns -1 if I<a> E<lt> I<b>, 0 if I<a> =3D=3D I<b> and 1 =
if
> >> +@@ -35,11 +42,16 @@ of I<a> and I<b>.
> >> + BN_is_zero(), BN_is_one() BN_is_word(), BN_abs_is_word() and
> >> + BN_is_odd() return 1 if the condition is true, 0 otherwise.
> >> +
> >> ++BN_are_coprime() returns 1 if the B<BIGNUM>'s are coprime, otherwise
> >> ++it returns 0.
> >> ++
> >> + =3Dhead1 HISTORY
> >> +
> >> + Prior to OpenSSL 1.1.0, BN_is_zero(), BN_is_one(), BN_is_word(),
> >> + BN_abs_is_word() and BN_is_odd() were macros.
> >> +
> >> ++The function BN_are_coprime() was added in OpenSSL 3.1.
> >> ++
> >> + =3Dhead1 COPYRIGHT
> >> +
> >> + Copyright 2000-2021 The OpenSSL Project Authors. All Rights Reserved=
.
> >> +diff --git a/include/openssl/bn.h b/include/openssl/bn.h index
> >> +ecd7f01..73895a5 100644
> >> +--- a/include/openssl/bn.h
> >> ++++ b/include/openssl/bn.h
> >> +@@ -344,6 +344,7 @@ int BN_gcd(BIGNUM *r, const BIGNUM *a, const
> >> +BIGNUM *b, BN_CTX *ctx);  int BN_kronecker(const BIGNUM *a, const
> >BIGNUM *b, BN_CTX *ctx); /* returns
> >> +                                                                   * =
-2 for
> >> +                                                                   *
> >> +error */
> >> ++int BN_are_coprime(BIGNUM *a, const BIGNUM *b, BN_CTX *ctx);
> >> + BIGNUM *BN_mod_inverse(BIGNUM *ret,
> >> +                        const BIGNUM *a, const BIGNUM *n, BN_CTX
> >> +*ctx);  BIGNUM *BN_mod_sqrt(BIGNUM *ret, diff --git a/test/bntest.c
> >> +b/test/bntest.c index c5894c1..eec6222 100644
> >> +--- a/test/bntest.c
> >> ++++ b/test/bntest.c
> >> +@@ -38,6 +38,7 @@ typedef struct mpitest_st {
> >> +
> >> + static const int NUM0 =3D 100;           /* number of tests */
> >> + static const int NUM1 =3D 50;            /* additional tests for som=
e functions */
> >> ++static const int NUM_PRIME_TESTS =3D 20;
> >> + static BN_CTX *ctx;
> >> +
> >> + /*
> >> +@@ -2573,6 +2574,25 @@ static int test_ctx_consttime_flag(void)
> >> +     return st;
> >> + }
> >> +
> >> ++static int test_coprime(void)
> >> ++{
> >> ++    BIGNUM *a =3D NULL, *b =3D NULL;
> >> ++    int ret =3D 0;
> >> ++
> >> ++    ret =3D TEST_ptr(a =3D BN_new())
> >> ++          && TEST_ptr(b =3D BN_new())
> >> ++          && TEST_true(BN_set_word(a, 66))
> >> ++          && TEST_true(BN_set_word(b, 99))
> >> ++          && TEST_int_eq(BN_are_coprime(a, b, ctx), 0)
> >> ++          && TEST_int_eq(BN_are_coprime(b, a, ctx), 0)
> >> ++          && TEST_true(BN_set_word(a, 67))
> >> ++          && TEST_int_eq(BN_are_coprime(a, b, ctx), 1)
> >> ++          && TEST_int_eq(BN_are_coprime(b, a, ctx), 1);
> >> ++    BN_free(a);
> >> ++    BN_free(b);
> >> ++    return ret;
> >> ++}
> >> ++
> >> + static int test_gcd_prime(void)
> >> + {
> >> +     BIGNUM *a =3D NULL, *b =3D NULL, *gcd =3D NULL; @@ -2585,11 +260=
5,12
> >> +@@ static int test_gcd_prime(void)
> >> +
> >> +     if (!TEST_true(BN_generate_prime_ex(a, 1024, 0, NULL, NULL, NULL=
)))
> >> +             goto err;
> >> +-    for (i =3D 0; i < NUM0; i++) {
> >> ++    for (i =3D 0; i < NUM_PRIME_TESTS; i++) {
> >> +         if (!TEST_true(BN_generate_prime_ex(b, 1024, 0,
> >> +                                             NULL, NULL, NULL))
> >> +                 || !TEST_true(BN_gcd(gcd, a, b, ctx))
> >> +-                || !TEST_true(BN_is_one(gcd)))
> >> ++                || !TEST_true(BN_is_one(gcd))
> >> ++                || !TEST_true(BN_are_coprime(a, b, ctx)))
> >> +             goto err;
> >> +     }
> >> +
> >> +@@ -3066,6 +3087,7 @@ int setup_tests(void)
> >> +         ADD_ALL_TESTS(test_is_prime, (int)OSSL_NELEM(primes));
> >> +         ADD_ALL_TESTS(test_not_prime, (int)OSSL_NELEM(not_primes));
> >> +         ADD_TEST(test_gcd_prime);
> >> ++        ADD_TEST(test_coprime);
> >> +         ADD_ALL_TESTS(test_mod_exp, (int)OSSL_NELEM(ModExpTests));
> >> +         ADD_ALL_TESTS(test_mod_exp_consttime,
> >(int)OSSL_NELEM(ModExpTests));
> >> +         ADD_TEST(test_mod_exp2_mont); diff --git
> >> +a/util/libcrypto.num b/util/libcrypto.num index 0f6f30b..a1d1ed9
> >> +100644
> >> +--- a/util/libcrypto.num
> >> ++++ b/util/libcrypto.num
> >> +@@ -5429,3 +5429,4 @@ OPENSSL_strcasecmp                      5556 3_=
0_3
> >EXIST::FUNCTION:
> >> + OPENSSL_strncasecmp                     5557 3_0_3 EXIST::FUNCTION:
> >> + OSSL_CMP_CTX_reset_geninfo_ITAVs        5558 3_0_8
> >EXIST::FUNCTION:CMP
> >> + OSSL_CMP_MSG_update_recipNonce          5559 3_0_9
> >EXIST::FUNCTION:CMP
> >> ++BN_are_coprime                          5560 3_0_0 EXIST::FUNCTION:
> >> +--
> >> +2.25.1
> >> +
> >> diff --git
> >> a/meta/recipes-connectivity/openssl/openssl/0002-Improve-FIPS-RSA-keyg
> >> en-performance.patch
> >> b/meta/recipes-connectivity/openssl/openssl/0002-Improve-FIPS-RSA-keyg
> >> en-performance.patch
> >> new file mode 100644
> >> index 0000000000..1a6b601f65
> >> --- /dev/null
> >> +++ b/meta/recipes-connectivity/openssl/openssl/0002-Improve-FIPS-RSA-
> >> +++ keygen-performance.patch
> >> @@ -0,0 +1,185 @@
> >> +From dfb8e0e716a1fd060eb13402d85cc46c8f64f929 Mon Sep 17 00:00:00
> >> +2001
> >> +From: slontis <shane.lontis@oracle.com>
> >> +Date: Wed, 2 Nov 2022 13:20:55 +1000
> >> +Subject: [PATCH 2/2] Improve FIPS RSA keygen performance.
> >> +
> >> +Reduce the Miller Rabin counts to the values specified by FIPS 186-5.
> >> +The old code was using a fixed value of 64.
> >> +
> >> +Reviewed-by: Paul Dale <pauli@openssl.org>
> >> +Reviewed-by: Tomas Mraz <tomas@openssl.org> (Merged from
> >> +https://github.com/openssl/openssl/pull/19579)
> >> +
> >> +(cherry picked from commit d2f6e66d2837bff1f5f7636bb2118e3a45c9df61)
> >> +
> >> +Upstream-Status: Backport
> >> +[https://github.com/openssl/openssl/commit/d2f6e66d2837bff1f5f7636bb2
> >> +118e3a45c9df61]
> >> +
> >> +Signed-off-by: Haitao Liu <haitao.liu@windriver.com>
> >> +---
> >> + crypto/bn/bn_prime.c         | 11 ++++++++
> >> + crypto/bn/bn_rsa_fips186_4.c | 49 ++++++++++++++++++++++++++++++----
> >--
> >> + include/crypto/bn.h          |  2 ++
> >> + 3 files changed, 54 insertions(+), 8 deletions(-)
> >> +
> >> +diff --git a/crypto/bn/bn_prime.c b/crypto/bn/bn_prime.c index
> >> +ddd31a0..79776f1 100644
> >> +--- a/crypto/bn/bn_prime.c
> >> ++++ b/crypto/bn/bn_prime.c
> >> +@@ -252,6 +252,17 @@ int ossl_bn_check_prime(const BIGNUM *w, int
> >checks, BN_CTX *ctx,
> >> +     return bn_is_prime_int(w, checks, ctx, do_trial_division, cb);
> >> +}
> >> +
> >> ++/*
> >> ++ * Use this only for key generation.
> >> ++ * It always uses trial division. The number of checks
> >> ++ * (MR rounds) passed in is used without being clamped to a minimum
> >value.
> >> ++ */
> >> ++int ossl_bn_check_generated_prime(const BIGNUM *w, int checks, BN_CT=
X
> >*ctx,
> >> ++                                  BN_GENCB *cb) {
> >> ++    return bn_is_prime_int(w, checks, ctx, 1, cb); }
> >> ++
> >> + int BN_check_prime(const BIGNUM *p, BN_CTX *ctx, BN_GENCB *cb)  {
> >> +     return ossl_bn_check_prime(p, 0, ctx, 1, cb); diff --git
> >> +a/crypto/bn/bn_rsa_fips186_4.c b/crypto/bn/bn_rsa_fips186_4.c index
> >> +55efaf2..c3466df 100644
> >> +--- a/crypto/bn/bn_rsa_fips186_4.c
> >> ++++ b/crypto/bn/bn_rsa_fips186_4.c
> >> +@@ -48,6 +48,34 @@ const BIGNUM ossl_bn_inv_sqrt_2 =3D {
> >> +     BN_FLG_STATIC_DATA
> >> + };
> >> +
> >> ++/*
> >> ++ * Refer to FIPS 186-5 Table B.1 for minimum rounds of Miller Rabin
> >> ++ * required for generation of RSA aux primes (p1, p2, q1 and q2).
> >> ++ */
> >> ++static int bn_rsa_fips186_5_aux_prime_MR_rounds(int nbits) {
> >> ++    if (nbits >=3D 4096)
> >> ++        return 44;
> >> ++    if (nbits >=3D 3072)
> >> ++        return 41;
> >> ++    if (nbits >=3D 2048)
> >> ++        return 38;
> >> ++    return 0; /* Error */
> >> ++}
> >> ++
> >> ++/*
> >> ++ * Refer to FIPS 186-5 Table B.1 for minimum rounds of Miller Rabin
> >> ++ * required for generation of RSA primes (p and q)  */ static int
> >> ++bn_rsa_fips186_5_prime_MR_rounds(int nbits) {
> >> ++    if (nbits >=3D 3072)
> >> ++        return 4;
> >> ++    if (nbits >=3D 2048)
> >> ++        return 5;
> >> ++    return 0; /* Error */
> >> ++}
> >> ++
> >> + /*
> >> +  * FIPS 186-5 Table A.1. "Min length of auxiliary primes p1, p2, q1,=
 q2".
> >> +  * (FIPS 186-5 has an entry for >=3D 4096 bits).
> >> +@@ -97,11 +125,13 @@ static int
> >bn_rsa_fips186_5_aux_prime_max_sum_size_for_prob_primes(int nbits)
> >> +  *     Xp1 The passed in starting point to find a probably prime.
> >> +  *     p1 The returned probable prime (first odd integer >=3D Xp1)
> >> +  *     ctx A BN_CTX object.
> >> ++ *     rounds The number of Miller Rabin rounds
> >> +  *     cb An optional BIGNUM callback.
> >> +  * Returns: 1 on success otherwise it returns 0.
> >> +  */
> >> + static int bn_rsa_fips186_4_find_aux_prob_prime(const BIGNUM *Xp1,
> >> +                                                 BIGNUM *p1, BN_CTX *=
ctx,
> >> ++                                                int rounds,
> >> +                                                 BN_GENCB *cb)
> >> + {
> >> +     int ret =3D 0;
> >> +@@ -117,7 +147,7 @@ static int
> >bn_rsa_fips186_4_find_aux_prob_prime(const BIGNUM *Xp1,
> >> +         i++;
> >> +         BN_GENCB_call(cb, 0, i);
> >> +         /* MR test with trial division */
> >> +-        tmp =3D BN_check_prime(p1, ctx, cb);
> >> ++        tmp =3D ossl_bn_check_generated_prime(p1, rounds, ctx, cb);
> >> +         if (tmp > 0)
> >> +             break;
> >> +         if (tmp < 0)
> >> +@@ -160,7 +190,7 @@ int
> >ossl_bn_rsa_fips186_4_gen_prob_primes(BIGNUM *p, BIGNUM *Xpout,
> >> + {
> >> +     int ret =3D 0;
> >> +     BIGNUM *p1i =3D NULL, *p2i =3D NULL, *Xp1i =3D NULL, *Xp2i =3D N=
ULL;
> >> +-    int bitlen;
> >> ++    int bitlen, rounds;
> >> +
> >> +     if (p =3D=3D NULL || Xpout =3D=3D NULL)
> >> +         return 0;
> >> +@@ -177,6 +207,7 @@ int
> >ossl_bn_rsa_fips186_4_gen_prob_primes(BIGNUM *p, BIGNUM *Xpout,
> >> +     bitlen =3D bn_rsa_fips186_5_aux_prime_min_size(nlen);
> >> +     if (bitlen =3D=3D 0)
> >> +         goto err;
> >> ++    rounds =3D bn_rsa_fips186_5_aux_prime_MR_rounds(nlen);
> >> +
> >> +     /* (Steps 4.1/5.1): Randomly generate Xp1 if it is not passed in=
 */
> >> +     if (Xp1 =3D=3D NULL) {
> >> +@@ -194,8 +225,8 @@ int
> >ossl_bn_rsa_fips186_4_gen_prob_primes(BIGNUM *p, BIGNUM *Xpout,
> >> +     }
> >> +
> >> +     /* (Steps 4.2/5.2) - find first auxiliary probable primes */
> >> +-    if (!bn_rsa_fips186_4_find_aux_prob_prime(Xp1i, p1i, ctx, cb)
> >> +-            || !bn_rsa_fips186_4_find_aux_prob_prime(Xp2i, p2i, ctx,=
 cb))
> >> ++    if (!bn_rsa_fips186_4_find_aux_prob_prime(Xp1i, p1i, ctx, rounds=
, cb)
> >> ++            || !bn_rsa_fips186_4_find_aux_prob_prime(Xp2i, p2i, ctx,=
 rounds,
> >cb))
> >> +         goto err;
> >> +     /* (Table B.1) auxiliary prime Max length check */
> >> +     if ((BN_num_bits(p1i) + BN_num_bits(p2i)) >=3D
> >> +@@ -243,11 +274,11 @@ err:
> >> +  */
> >> + int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM *Y, BIGNUM *X, const
> >BIGNUM *Xin,
> >> +                                        const BIGNUM *r1, const BIGNU=
M *r2,
> >> +-                                       int nlen, const BIGNUM *e, BN=
_CTX *ctx,
> >> +-                                       BN_GENCB *cb)
> >> ++                                       int nlen, const BIGNUM *e,
> >> ++                                       BN_CTX *ctx, BN_GENCB *cb)
> >> + {
> >> +     int ret =3D 0;
> >> +-    int i, imax;
> >> ++    int i, imax, rounds;
> >> +     int bits =3D nlen >> 1;
> >> +     BIGNUM *tmp, *R, *r1r2x2, *y1, *r1x2;
> >> +     BIGNUM *base, *range;
> >> +@@ -317,6 +348,7 @@ int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM
> >*Y, BIGNUM *X, const BIGNUM *Xin,
> >> +      * The number has been updated to 20 * nlen/2 as used in
> >> +      * FIPS186-5 Appendix B.9 Step 9.
> >> +      */
> >> ++    rounds =3D bn_rsa_fips186_5_prime_MR_rounds(nlen);
> >> +     imax =3D 20 * bits; /* max =3D 20/2 * nbits */
> >> +     for (;;) {
> >> +         if (Xin =3D=3D NULL) {
> >> +@@ -346,8 +378,9 @@ int ossl_bn_rsa_fips186_4_derive_prime(BIGNUM
> >*Y, BIGNUM *X, const BIGNUM *Xin,
> >> +             if (BN_copy(y1, Y) =3D=3D NULL
> >> +                     || !BN_sub_word(y1, 1))
> >> +                 goto err;
> >> ++
> >> +             if (BN_are_coprime(y1, e, ctx)) {
> >> +-                int rv =3D BN_check_prime(Y, ctx, cb);
> >> ++                int rv =3D ossl_bn_check_generated_prime(Y, rounds, =
ctx, cb);
> >> +
> >> +                 if (rv > 0)
> >> +                     goto end;
> >> +diff --git a/include/crypto/bn.h b/include/crypto/bn.h
> >> +index fd1c09d..00544d9 100644
> >> +--- a/include/crypto/bn.h
> >> ++++ b/include/crypto/bn.h
> >> +@@ -95,6 +95,8 @@ int bn_div_fixed_top(BIGNUM *dv, BIGNUM *rem,
> >const BIGNUM *m,
> >> +
> >> + int ossl_bn_miller_rabin_is_prime(const BIGNUM *w, int iterations, B=
N_CTX
> >*ctx,
> >> +                                   BN_GENCB *cb, int enhanced, int *s=
tatus);
> >> ++int ossl_bn_check_generated_prime(const BIGNUM *w, int checks, BN_CT=
X
> >*ctx,
> >> ++                                  BN_GENCB *cb);
> >> +
> >> + const BIGNUM *ossl_bn_get0_small_factors(void);
> >> +
> >> +--
> >> +2.25.1
> >> +
> >> diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.13.bb
> >b/meta/recipes-connectivity/openssl/openssl_3.0.13.bb
> >> index 5e43fdc2de..5b09493ccd 100644
> >> --- a/meta/recipes-connectivity/openssl/openssl_3.0.13.bb
> >> +++ b/meta/recipes-connectivity/openssl/openssl_3.0.13.bb
> >> @@ -12,6 +12,8 @@ SRC_URI =3D "http://www.openssl.org/source/openssl-
> >${PV}.tar.gz \
> >>             file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-f=
rom-
> >co.patch \
> >>             file://afalg.patch \
> >>             file://0001-Configure-do-not-tweak-mips-cflags.patch \
> >> +           file://0001-Improve-FIPS-RSA-keygen-performance.patch \
> >> +           file://0002-Improve-FIPS-RSA-keygen-performance.patch \
> >>             "
> >>
> >>  SRC_URI:append:class-nativesdk =3D " \
> >>
> >>
> >>
> >>
> >>
> >> --
> >> # Randy MacLeod
> >> # Wind River Linux
> >>
> >>
> >> --
> >> # Randy MacLeod
> >> # Wind River Linux
> >>
> >>
> >>
> >>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197543): https://lists.openembedded.org/g/openembedde=
d-core/message/197543
> Mute This Topic: https://lists.openembedded.org/mt/104998278/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

