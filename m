Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF5ACA5FA5
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 09:14:04 +0000 (UTC)
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6936.1790846040510018248
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 02:14:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=Yo38eyQQ;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=vp1OldQU;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.145, mailfrom: paul@pbarker.dev)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id 897EAEC0114;
	Thu,  1 Oct 2026 05:13:59 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Thu, 01 Oct 2026 05:13:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1790846039;
	 x=1790932439; bh=lvyIJnLtm7Knf0ijId6YYa1BAa541ShNbhg/3ndwrCk=; b=
	Yo38eyQQU+PH0pNsxyPQQbJkOGAGUOf/GBFaoR7eqZnLxz8cqtbdc2UNmO/O+v5R
	WsKUmUOreuVv0/MAHtShkYGiPV3WJDKWqR2O5gEWnt2ywZraS93UJG1UdXT5omVa
	nbkJrsOVj92H8daMuA4tFggCfXRusNGNuN1TrumQ5EQRcHdD86g5VdRNjm+WyJN8
	DJ3Hc7Zv2za9SsXPQ7ujsN3GiGQVPuFfEqnVUJziur98FsAuv6lED7Q6AdjnKXvW
	BGYjuJ4CsVntdWAvxT6OWMJNOX7kv7GkTLmU4aWl2fc7vVlGCjz+IIQjfaz+/KTv
	ezXZ4KaWpuEk9iDBkb07dA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790846039; x=
	1790932439; bh=lvyIJnLtm7Knf0ijId6YYa1BAa541ShNbhg/3ndwrCk=; b=v
	p1OldQUYYh77e5wW3BV7BNtDAwc/eq5PmoSY5OxE3Afv5WQSaWTr3sAA49BK+8J/
	W7NhyIon0rHRy8l7f+9rzytf+PtiJ/aLrcr5v/i/RlUcWlI/UFfdwYMpHS8SYlMF
	0sghvKtYAeCk0j9ZGd4WMer2W8QmWhh+bJx69XxVD1UHsMw/FgqQumaUGD0fFqjw
	Vldy0vSScWfULCxufMeMAuHXaGqab0q1TObnI5dOQerttcoqavcd6YAKJ3gN+Rvr
	ypgLDji+epX136aqlvcsmYg2HX7hfWzrfLVM3acBz+Ao6Ynrv4zjOfAR0VLgCmqv
	jNjx8wcXCsbb6lKxc6HOA==
X-ME-Sender: <xms:ViS-akX2QYtZ_EXBG0N55FrAsACZsrH4TxWYvBMahReoRaj5dAjLVg>
    <xme:ViS-ambnE0VH9uo4fPWPhUudYd5gdur7MquHCIKP0JLrZe-QmBbZb9-oykb2cyxKo
    p1Ow_qhmRs7bxItpIDQjuX10xtNWmPuWH88xaDMTufNNmEx0R46YlIs>
X-ME-Received: <xmr:ViS-ai1gqL4_fKHNKgVGpKQm7fdJyWLvq3WnKiMYpjAvlPIxTW1ucdbtAxmczWyAzlmzuR4NGgqttVBOiToRskLd9lTXLqW_CTm0z61vsVc9>
X-ME-Proxy-Cause: dmFkZTF1bmfZZATELDXL62szFHAPcyrcx3JnV5r0qLtQviQ3qqjWJgZCnCPXrMwqDq7D0z
    eSuE09PmKf5K1Xwlf8gukpLwnQfH6aHbeO1zeEzA55bS2zauzpPYfxsvReuagzOWPvTZ/K
    ZIhK1QCIsxhpzV4hjKsNcPlduKekAV8CRGM3ebOnZFcIhbRCfs2Q8WqfT2RBpb5WLAt3CR
    5BZRXDMwr8W9yGNHy1N6sJyYyrA8nzMAiXdGFMRw7lcG9PLnPjWiLXsHmyGbviHxnqh+XL
    DfgBgj+DOsJ8MYGEV2+Be36jb6xI7v0YPR56tzF5yvjFFVQx5Bnz3+cRGt+WeECNY7wpTD
    epkGV2J3kBQK7+4l3DPiqXla4E/nu/mwk14BiXGw9MTAt4OUA87/grw736qQMblUVW/PyC
    xD7IlpGw+6ws4XM2q70kcfuWICyqsBrFcGn+ETdeJmNcZkgKJZz/pNgLZU/mtt57P+wUVA
    QrP9PAc+w2DIkpQ9fGh84OZ0mKuNSboskBmfON2Fpn8137iAI1DU9BlLSwTvaWyZtIoWuj
    YeDsCr7ng83LYEmAJuaERHR7y444EWLDFPJFZFTxqgVuJaDLws2dEJB5Qu0GKPd5lwLVuZ
    wZCSwplvV1DF9SsL80+WvKLY+KEDnImdyMDfL6XAzY61yUN1gfg5p6jr2Wsw
X-ME-Proxy: <xmx:ViS-agivK3J3tphuBgtq2NnBiE4PARDrx79xmsLjuQquOlLR8djN9g>
    <xmx:ViS-aubJJa_bTvHKWCWjZKmObFYWy-wFvvotWZN84yAa91LkQoX99g>
    <xmx:ViS-aoSBsDW0QizZ5BmdKBORllc7cogYnWo8bD_qW4Oe1mz4nlxNVQ>
    <xmx:ViS-ahRQRvGulEVCjv_vWjbUmk4zaSkJOvpDeQ2iorJDoc7pOqsqlg>
    <xmx:VyS-ancpSCF3D0XVbRT5k4UtyA-hzuBEgkNeJmexztxdexluqyxl1kGa>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Oct 2026 05:13:57 -0400 (EDT)
Message-ID: <549aa667517325c9a178dd71e0e2563910303ca8.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH RFC v2 00/19] riscv: add new ISA extensions and
 profile support
From: Paul Barker <paul@pbarker.dev>
To: Trevor Gamblin <tgamblin@baylibre.com>, 
	openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com, mark.hatle@kernel.crashing.org
Date: Thu, 01 Oct 2026 10:13:57 +0100
In-Reply-To: <20260930-riscv-tuning-rework-v2-0-9e29f3531d0e@baylibre.com>
References: <20260930-riscv-tuning-rework-v2-0-9e29f3531d0e@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 09:14:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247019

Hi Trevor,

Snipping a lot of the cover letter to give some initial thoughts...

On Wed, 2026-09-30 at 12:38 -0400, Trevor Gamblin wrote:
> A list of changes, by group:
>=20
> 1. Basic clarification changes and extra tunings:
>     a. tune-riscv: be explicit about riscv32gc, riscv64gc defaults
>     b. tune-riscv.inc: add 'riscv64gcv' tune

I think these changes make sense, and now master has diverged from
blacksail it may be a good time to take them.

> 2. Adding official RVA20 profile extensions, and supporting the explicit =
choice
> of 'rva20u64' as a tuning option for builds:
>     a. arch-riscv.inc: add missing RVA20 extensions
>     b. meta/lib/oe/tune.py: support profile strings, add rva20u64
>     c. tune-riscv.inc: add rva20u64 to AVAILTUNES
> 3. Adding RVA22 profile support:
>     a. arch-riscv.inc: add rva22u64 extensions
>     b. meta/lib/oe/tune.py: add rva22u64 profile
>     c. tune-riscv.inc: add rva22u64 to AVAILTUNES
> 4. Adding RVA23 profile support:
>     a. arch-riscv.inc: add rva23u64 extensions
>     b. meta/lib/oe/tune.py: add rva23u64 profile
>     c. tune-riscv.inc: add rva23u64 to AVAILTUNES
> 5. Quality-of-life fixups after 1-4:
>     a. meta/lib/oe/tune.py: add riscv_pkgarch()
>     b. arch-riscv.inc: rename TUNE_RISCV_PKGARCH -> TUNE_RISCV_PKGARCH_EX=
ACT
>        in assignments
>     c. tune.py: add implied tuning logic
>     d. tune.py: add vector extensions to RISCV_IMPLIED
>     e. tune-riscv.inc: add RISCV_PKGARCH vars, set PACKAGE_EXTRA_ARCHS
>     f. tune-riscv.inc: clarify zifencei comment
> 6. Selftests:
>     a. selftest: oelib: add tune.py
>     b. selftest: cases: add riscvtune.py

There are no users of the RVA20, RVA22 or RVA23 profiles in OE-core, so
it's hard to be confident that the approach is right here. I assume the
goal is to convert some of the machines in meta-riscv to use the
appropriate TUNE once these changes are merged? If so, it may be better
to first add support for the new profiles in meta-riscv and update
relevant machine configurations to use them. Once they've had some time
to stabilise in meta-riscv we could then move them into OE-core.

> One significant change to the way profile strings are processed with
> these patches shows up in sstate/build path naming, and is part of the
> reason for patch 5a-5d above. Before, a build directory
> might have a path in it like:
>=20
> > build/tmp/work/riscv64imafdc_zicsr_zifencei-poky-linux/
>=20
> This was fine when the extension list was short (for riscv64gc), but with=
 the
> full RVA profiles, the paths started to get so long that bitbake would pr=
oduce
> this error:
>=20
> > ERROR: Unable to reduce sstate name to less than 255 chararacters
>=20
> To solve this problem, meta/lib/oe/tune.py now supports a very short
> list of profile names, and includes new functions (riscv_pkgarch() and
> riscv_implied()) designed to compare selected extensions against
> dependencies (profile and otherwise), and shorten path names
> appropriately. As an example, if you set the following in local.conf:
>=20
> > AVAILTUNES +=3D "my-rva20-tune"
> > TUNE_FEATURES:tune-my-rva20-tune =3D "${@oe.tune.riscv_isa_to_tune('rv6=
4gc')} ziccamoa ziccif zicclsm ziccrse zicntr za128rs"
> > PACKAGE_EXTRA_ARCHS:tune-my-rva20-tune =3D "${TUNE_RISCV_PKGARCH}"
> > DEFAULTTUNE =3D "my-rva20-tune"
>=20
> then 'bitbake-getvar --value TUNE_PKGARCH' shows that it is recognized
> as the RVA20 profile:
>=20
> > rva20u64_zifencei
>=20
> Extensions implied by others (e.g. 'zmmul', implied by 'm') don't need
> to be listed, but if they are the same result is obtained.
>=20
> With all of this combined, subdirectories in tmp/work/ look like:
>=20
> > tgamblin@megalith ~/workspace/ypbuilds/poky-qemuriscv64 $ ls build/tmp/=
work/
> > all-poky-linux          qemuriscv64-poky-linux                   rva20u=
64_zcmop_zifencei_zihintpause_zimop_zvbb-poky-linux  rva23u64_zifencei-poky=
-linux
> > qemuriscv32-poky-linux  riscv32imafdc_zicsr_zifencei-poky-linux  rva20u=
64_zifencei-poky-linux                               x86_64-linux
>=20
> Note that 'rva20u64_zcmop_zifencei_zihintpause_zimop_zvbb-poky-linux' is
> a custom configuration that I set in local.conf only for testing
> purposes. Custom tunings still run the ris(c|k) of exceeding the naming
> length, which we may need some extra hashing logic (maybe a bitmask?) to
> handle if we want to enable freely customizing build tunings.=20

I think this approach makes a lot of sense, given the way RISC-V
extensions work it's probably the only way to make things readable.

>=20
> # Testing
>=20
> Testing different profiles' validity against the compiler involved
> setting (for example) DEFAULTTUNE =3D "rva23u64" and then running 'bitbak=
e
> opensbi' (which also results in a kernel rebuild) as a quick smoke test.
> I've also opted to do full image builds to make sure that the new
> profiles fully boot and run without any obvious errors. I've also run a
> series of boot tests (including ptests for packages like coreutils).
> Note that when the vector extension is enabled (riscv64gcv, rva23u64),
> test durations will generally be higher.
>=20
> As of v2, I've added some selftests to help:
>=20
> 1. The 'oelib.tune' suite at meta/lib/oeqa/selftest/cases/oelib/tune.py,
>    for testing the riscv_pkgarch(), riscv_isa_to_tune(), and
>    riscv_implied() functions
> 2. The 'riscvtune' suite at meta/lib/oeqa/selftest/cases/riscvtune.py,
>    for parsing and building against defined and unusual custom tunes to
>    ensure they each yield a usable package arch

Looking at qemuriscv.inc we set QB_CPU to rva23s64 for qemuriscv64. I
think we should do some boot testing with different QB_CPU values (e.g.
build for rva20 and test with rva20 virtual CPU).

Long term we may want to set the default TUNE for qemuriscv64 to align
with RVA23.

Best regards,

--=20
Paul Barker


