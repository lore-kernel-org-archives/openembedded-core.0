Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA6ACA600B
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 11:01:17 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13156.1791457269800057961
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2026 04:01:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BhkvOlf2;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8ab3fd8adb1so52879307b3.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 04:01:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791457269; cv=none;
        d=google.com; s=arc-20260327;
        b=ZhwVhF86Y0c83JLY53O+ZYKlzk7MG/RZtzERuav8cQStBUxJN1TuYzuk6RkjL+5PmS
         0xS2IDzmMURO18Rdk4JM9kx2AcXacAzuSuEAL6p+XuCXl9GWuqwfGQv0aGnyp5exBvXb
         O2e9gZtEBoYY4auXLSzeEb6rlsdaD8R8tAUUJloejvtPkU/BCuRbSi9CJDORgcSFbUOc
         YXzAHHXntum/92Zwimb4UBJyAmTJJxgFiifRpY0zKJV7JZ91u1EVNs8Z0RUNWDcBreRb
         ykNAE8bcrkQaOeIpQQOVruRqjNwm8FpzGn8JMYFtvu/FaqxVzuNa6ImSlZgXuEK2Ji24
         VRNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AC+TnYFJIj3YbTrWxURgpgmqDBqwbWlzBcljYITyivo=;
        fh=+/x7KPRUd500TULCMLg6NYM/Szu6Iy3tVQ1LLGBokEA=;
        b=lfT/xHPG0fFOTltc5Eo+q3uiE/uW+Aa2hzadZICJ4cn5y52u/Hw2egEPBIetzsUqY1
         42MHZqg6YGAlJjt48xFkWqdvb+CCPqoyXthpA4FEURX9NWpSGvzBL+FbwHJOsfjQroBq
         3Bh22Q3DbfIjciZaCXt31WJTwfjIz3Mf5iQ4NN77tbZfamP05m/dM1PQK4vptffCMcsp
         gkchcay0/hUXnlgHnq6JvCKxfhlppUTUS7A+5Nav0Ht+xziWA7YwssHLaM4ENqHnEhMm
         slP+498R4OaOg6lAwhtBg3VwYvDhwMVRiH4yxkU/xqamGTwO4WxHvxhpE1Nqbv7zMqtl
         /DYg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791457268; x=1792062068; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AC+TnYFJIj3YbTrWxURgpgmqDBqwbWlzBcljYITyivo=;
        b=BhkvOlf2fTZpER4npbo6hHglE9KJKcZVqYg+XPugjr2WQ8W44Hsew535tmhoxeh4UN
         vLH4Ich+MRx6HKAzjn3JVckggVFPfn9uz8X0mWKovnC+0+0zUw/51YoHu4CGWYCTk5YX
         GQ2IXxGgeE2z5TNREy++Da7/n2qW026IlSQc3/kM3oYlOnkEr33LfVrkd9rs+v1eDdVu
         x6eqZ5tdtfR/pa8yC/4y1gtTdIZf5zS6UFDRFhHLDirXLhQZrxOdPiHMYmhTNAmndm2D
         PeS0gQVmURowUyUGaZrIjs1Cw/N1dmrTeQENp8df1O8fnaoNCx2yjdTcv0ffrWgNySun
         5/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791457268; x=1792062068;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AC+TnYFJIj3YbTrWxURgpgmqDBqwbWlzBcljYITyivo=;
        b=2pbIIb9B9jClPuSsS4a1jg8LpfyD/Ln0o+U9ejNP5OxbzyWV6Ry48o3EKVOcmT+C9e
         QLU/O1NhozasEvoTm+Zw2iue7kcUTpvuWynY5iKoYliGnaVPWViE+fZSraempXWnmdra
         cd5rWglgI0WxfyLcP5sN4v7B8bPcpnAllL7jOMlun3CK/LpXEiRTwHQVxQRM1m3zXJ8p
         hjALWJXZKD2LI/JUZ6UB/WEL8rwJkLKFcDpG42VhEKxj3RN4FtJvm8UQPEF3n+48vxSU
         UAIIyeazeyrRV7FKZqgLq9qBgi/nwyystt7liuDzyK83bc9Ah9rr09Twj7oXlOolyK00
         FuEg==
X-Forwarded-Encrypted: i=1; AKwUvBy/lGWeMpPIoFb5r3OllAm3JSiI2kb5HKUn6mv5vFM79sDx/Wgzxwod+fsHyfz61jYWt7p++eAf49hXwSQMyt5ORA==@lists.openembedded.org
X-Gm-Message-State: AFq9FYLoiC+jubk5HgjW6ZzPVEiqtCKJGBiS6lCq4WTtxhYO3Zn2q9pg
	58icoYkwEkF1dcBHmK/DhyxjAnVRUoYHB52yeQFR8kjzA2Ktfxh8TAhe6DO3jUmA+3QRGwPZKOg
	dksa+dccxWG8vYRQ0QC0H0lxqGuTJNJk=
X-Gm-Gg: AYBFou2yXU6qMAn3g+8xyCIKJDwC1Q1iz2ONRh3Pnu4VazJHdfGAdFNhE5a0Hp6LDWc
	lOTHjIqdnzwsGCsyl2P0feJTqPdW+WYcj+EfJW4kJKSb9woEBsGMYHKlfjiWDs9xJXaJM5q3FJd
	MiwEOrrZlS6mEzOa/6n+gH/fXJmerX65KHVNrrY/23/+/8haQpbOELNiclS2NLzdecYHsZFtYQN
	7ekp/qqVeFoWH4lG8WQv6hPsO88pC7wRwxusNxdpi1xHMQ3qoz5uG2an26i6W4l535Yjq1yIbRR
	ukgoWyxN0XVFSBdxrgOeVuBgMcNFWpM4UJ/2av+wgba+oP/DJLrJWLBCuBcrG8rLRNGRBe97wjd
	P6o6itiDrYvgEklDHiKFOjpCiWw30lLpr73rHYtRRnM97EW9B8nF3yBZyeAgEXZJlNmg7mokb9d
	56LWDa2e7YVBDFU9gBa885GSAufdqyvLVE0xsXjntZrxAdrRJ1D2xGdIJrODDrZOjMpTpGzW2uZ
	GmkRdW/AwQY0nGR3NA/Emfhj4I8YPueZNNzle0iWokb5M95vgAaS7GyYfJ5EICtlA7r6Ez6fPwU
	0CTdQz8=
X-Received: by 2002:a05:690c:c4e9:b0:89f:d85:f31e with SMTP id
 00721157ae682-8b05af6bf6cmr29581527b3.84.1791457267454; Thu, 08 Oct 2026
 04:01:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260930-riscv-tuning-rework-v2-0-9e29f3531d0e@baylibre.com> <549aa667517325c9a178dd71e0e2563910303ca8.camel@pbarker.dev>
In-Reply-To: <549aa667517325c9a178dd71e0e2563910303ca8.camel@pbarker.dev>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Oct 2026 12:56:18 +0200
X-Gm-Features: AclHuK9gXUX8Set42Qe1jJQFz0TcxMz5aVqZI5t0PidLXJwsnvSLwdyGmbnWr88
Message-ID: <CAMKF1srDRW04xpAa36w5PsdELfDU0uiSyf2y=5204D4C3qoVBQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH RFC v2 00/19] riscv: add new ISA extensions and
 profile support
To: Paul Barker <paul@pbarker.dev>
Cc: Trevor Gamblin <tgamblin@baylibre.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, mark.hatle@kernel.crashing.org
Content-Type: multipart/alternative; boundary="0000000000000e96c7065d522601"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 11:01:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247428

--0000000000000e96c7065d522601
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I will review rest of series in detail later

On Thu, Oct 1, 2026, 11:13=E2=80=AFAM Paul Barker <paul@pbarker.dev> wrote:

> Hi Trevor,
>
> Snipping a lot of the cover letter to give some initial thoughts...
>
> On Wed, 2026-09-30 at 12:38 -0400, Trevor Gamblin wrote:
> > A list of changes, by group:
> >
> > 1. Basic clarification changes and extra tunings:
> >     a. tune-riscv: be explicit about riscv32gc, riscv64gc defaults
> >     b. tune-riscv.inc: add 'riscv64gcv' tune
>
> I think these changes make sense, and now master has diverged from
> blacksail it may be a good time to take them.
>
> > 2. Adding official RVA20 profile extensions, and supporting the explici=
t
> choice
> > of 'rva20u64' as a tuning option for builds:
> >     a. arch-riscv.inc: add missing RVA20 extensions
> >     b. meta/lib/oe/tune.py: support profile strings, add rva20u64
> >     c. tune-riscv.inc: add rva20u64 to AVAILTUNES
> > 3. Adding RVA22 profile support:
> >     a. arch-riscv.inc: add rva22u64 extensions
> >     b. meta/lib/oe/tune.py: add rva22u64 profile
> >     c. tune-riscv.inc: add rva22u64 to AVAILTUNES
> > 4. Adding RVA23 profile support:
> >     a. arch-riscv.inc: add rva23u64 extensions
> >     b. meta/lib/oe/tune.py: add rva23u64 profile
> >     c. tune-riscv.inc: add rva23u64 to AVAILTUNES
> > 5. Quality-of-life fixups after 1-4:
> >     a. meta/lib/oe/tune.py: add riscv_pkgarch()
> >     b. arch-riscv.inc: rename TUNE_RISCV_PKGARCH ->
> TUNE_RISCV_PKGARCH_EXACT
> >        in assignments
> >     c. tune.py: add implied tuning logic
> >     d. tune.py: add vector extensions to RISCV_IMPLIED
> >     e. tune-riscv.inc: add RISCV_PKGARCH vars, set PACKAGE_EXTRA_ARCHS
> >     f. tune-riscv.inc: clarify zifencei comment
> > 6. Selftests:
> >     a. selftest: oelib: add tune.py
> >     b. selftest: cases: add riscvtune.py
>
> There are no users of the RVA20, RVA22 or RVA23 profiles in OE-core, so
> it's hard to be confident that the approach is right here. I assume the
> goal is to convert some of the machines in meta-riscv to use the
> appropriate TUNE once these changes are merged? If so, it may be better
> to first add support for the new profiles in meta-riscv and update
> relevant machine configurations to use them. Once they've had some time
> to stabilise in meta-riscv we could then move them into OE-core.
>

Its better to handle it in one place in oe-core. We do similar for arm.
Where we have all kind of tunes in core its simpler to get the logic
working that way. Older editions of architectures aren't going away anytime
soon.

>
> > One significant change to the way profile strings are processed with
> > these patches shows up in sstate/build path naming, and is part of the
> > reason for patch 5a-5d above. Before, a build directory
> > might have a path in it like:
> >
> > > build/tmp/work/riscv64imafdc_zicsr_zifencei-poky-linux/
> >
> > This was fine when the extension list was short (for riscv64gc), but
> with the
> > full RVA profiles, the paths started to get so long that bitbake would
> produce
> > this error:
> >
> > > ERROR: Unable to reduce sstate name to less than 255 chararacters
> >
> > To solve this problem, meta/lib/oe/tune.py now supports a very short
> > list of profile names, and includes new functions (riscv_pkgarch() and
> > riscv_implied()) designed to compare selected extensions against
> > dependencies (profile and otherwise), and shorten path names
> > appropriately. As an example, if you set the following in local.conf:
> >
> > > AVAILTUNES +=3D "my-rva20-tune"
> > > TUNE_FEATURES:tune-my-rva20-tune =3D
> "${@oe.tune.riscv_isa_to_tune('rv64gc')} ziccamoa ziccif zicclsm ziccrse
> zicntr za128rs"
> > > PACKAGE_EXTRA_ARCHS:tune-my-rva20-tune =3D "${TUNE_RISCV_PKGARCH}"
> > > DEFAULTTUNE =3D "my-rva20-tune"
> >
> > then 'bitbake-getvar --value TUNE_PKGARCH' shows that it is recognized
> > as the RVA20 profile:
> >
> > > rva20u64_zifencei
> >
> > Extensions implied by others (e.g. 'zmmul', implied by 'm') don't need
> > to be listed, but if they are the same result is obtained.
> >
> > With all of this combined, subdirectories in tmp/work/ look like:
> >
> > > tgamblin@megalith ~/workspace/ypbuilds/poky-qemuriscv64 $ ls
> build/tmp/work/
> > > all-poky-linux          qemuriscv64-poky-linux
>  rva20u64_zcmop_zifencei_zihintpause_zimop_zvbb-poky-linux
> rva23u64_zifencei-poky-linux
> > > qemuriscv32-poky-linux  riscv32imafdc_zicsr_zifencei-poky-linux
> rva20u64_zifencei-poky-linux                               x86_64-linux
> >
> > Note that 'rva20u64_zcmop_zifencei_zihintpause_zimop_zvbb-poky-linux' i=
s
> > a custom configuration that I set in local.conf only for testing
> > purposes. Custom tunings still run the ris(c|k) of exceeding the naming
> > length, which we may need some extra hashing logic (maybe a bitmask?) t=
o
> > handle if we want to enable freely customizing build tunings.
>
> I think this approach makes a lot of sense, given the way RISC-V
> extensions work it's probably the only way to make things readable.
>
> >
> > # Testing
> >
> > Testing different profiles' validity against the compiler involved
> > setting (for example) DEFAULTTUNE =3D "rva23u64" and then running 'bitb=
ake
> > opensbi' (which also results in a kernel rebuild) as a quick smoke test=
.
> > I've also opted to do full image builds to make sure that the new
> > profiles fully boot and run without any obvious errors. I've also run a
> > series of boot tests (including ptests for packages like coreutils).
> > Note that when the vector extension is enabled (riscv64gcv, rva23u64),
> > test durations will generally be higher.
> >
> > As of v2, I've added some selftests to help:
> >
> > 1. The 'oelib.tune' suite at meta/lib/oeqa/selftest/cases/oelib/tune.py=
,
> >    for testing the riscv_pkgarch(), riscv_isa_to_tune(), and
> >    riscv_implied() functions
> > 2. The 'riscvtune' suite at meta/lib/oeqa/selftest/cases/riscvtune.py,
> >    for parsing and building against defined and unusual custom tunes to
> >    ensure they each yield a usable package arch
>
> Looking at qemuriscv.inc we set QB_CPU to rva23s64 for qemuriscv64. I
> think we should do some boot testing with different QB_CPU values (e.g.
> build for rva20 and test with rva20 virtual CPU).
>
> Long term we may want to set the default TUNE for qemuriscv64 to align
> with RVA23.
>
> Best regards,
>
> --
> Paul Barker
>
>

--0000000000000e96c7065d522601
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>I will review rest of series in detail later=C2=A0<b=
r><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Thu, Oct 1, 2026, 11:13=E2=80=AFAM Paul Barker &lt;<a =
href=3D"mailto:paul@pbarker.dev">paul@pbarker.dev</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Hi Trevor,<br>
<br>
Snipping a lot of the cover letter to give some initial thoughts...<br>
<br>
On Wed, 2026-09-30 at 12:38 -0400, Trevor Gamblin wrote:<br>
&gt; A list of changes, by group:<br>
&gt; <br>
&gt; 1. Basic clarification changes and extra tunings:<br>
&gt;=C2=A0 =C2=A0 =C2=A0a. tune-riscv: be explicit about riscv32gc, riscv64=
gc defaults<br>
&gt;=C2=A0 =C2=A0 =C2=A0b. tune-riscv.inc: add &#39;riscv64gcv&#39; tune<br=
>
<br>
I think these changes make sense, and now master has diverged from<br>
blacksail it may be a good time to take them.<br>
<br>
&gt; 2. Adding official RVA20 profile extensions, and supporting the explic=
it choice<br>
&gt; of &#39;rva20u64&#39; as a tuning option for builds:<br>
&gt;=C2=A0 =C2=A0 =C2=A0a. arch-riscv.inc: add missing RVA20 extensions<br>
&gt;=C2=A0 =C2=A0 =C2=A0b. meta/lib/oe/tune.py: support profile strings, ad=
d rva20u64<br>
&gt;=C2=A0 =C2=A0 =C2=A0c. tune-riscv.inc: add rva20u64 to AVAILTUNES<br>
&gt; 3. Adding RVA22 profile support:<br>
&gt;=C2=A0 =C2=A0 =C2=A0a. arch-riscv.inc: add rva22u64 extensions<br>
&gt;=C2=A0 =C2=A0 =C2=A0b. meta/lib/oe/tune.py: add rva22u64 profile<br>
&gt;=C2=A0 =C2=A0 =C2=A0c. tune-riscv.inc: add rva22u64 to AVAILTUNES<br>
&gt; 4. Adding RVA23 profile support:<br>
&gt;=C2=A0 =C2=A0 =C2=A0a. arch-riscv.inc: add rva23u64 extensions<br>
&gt;=C2=A0 =C2=A0 =C2=A0b. meta/lib/oe/tune.py: add rva23u64 profile<br>
&gt;=C2=A0 =C2=A0 =C2=A0c. tune-riscv.inc: add rva23u64 to AVAILTUNES<br>
&gt; 5. Quality-of-life fixups after 1-4:<br>
&gt;=C2=A0 =C2=A0 =C2=A0a. meta/lib/oe/tune.py: add riscv_pkgarch()<br>
&gt;=C2=A0 =C2=A0 =C2=A0b. arch-riscv.inc: rename TUNE_RISCV_PKGARCH -&gt; =
TUNE_RISCV_PKGARCH_EXACT<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 in assignments<br>
&gt;=C2=A0 =C2=A0 =C2=A0c. tune.py: add implied tuning logic<br>
&gt;=C2=A0 =C2=A0 =C2=A0d. tune.py: add vector extensions to RISCV_IMPLIED<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0e. tune-riscv.inc: add RISCV_PKGARCH vars, set PACK=
AGE_EXTRA_ARCHS<br>
&gt;=C2=A0 =C2=A0 =C2=A0f. tune-riscv.inc: clarify zifencei comment<br>
&gt; 6. Selftests:<br>
&gt;=C2=A0 =C2=A0 =C2=A0a. selftest: oelib: add tune.py<br>
&gt;=C2=A0 =C2=A0 =C2=A0b. selftest: cases: add riscvtune.py<br>
<br>
There are no users of the RVA20, RVA22 or RVA23 profiles in OE-core, so<br>
it&#39;s hard to be confident that the approach is right here. I assume the=
<br>
goal is to convert some of the machines in meta-riscv to use the<br>
appropriate TUNE once these changes are merged? If so, it may be better<br>
to first add support for the new profiles in meta-riscv and update<br>
relevant machine configurations to use them. Once they&#39;ve had some time=
<br>
to stabilise in meta-riscv we could then move them into OE-core.<br></block=
quote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Its better =
to handle it in one place in oe-core. We do similar for arm. Where we have =
all kind of tunes in core its simpler to get the logic working that way. Ol=
der editions of architectures aren&#39;t going away anytime soon.</div><div=
 dir=3D"auto"><div class=3D"gmail_quote gmail_quote_container"><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
&gt; One significant change to the way profile strings are processed with<b=
r>
&gt; these patches shows up in sstate/build path naming, and is part of the=
<br>
&gt; reason for patch 5a-5d above. Before, a build directory<br>
&gt; might have a path in it like:<br>
&gt; <br>
&gt; &gt; build/tmp/work/riscv64imafdc_zicsr_zifencei-poky-linux/<br>
&gt; <br>
&gt; This was fine when the extension list was short (for riscv64gc), but w=
ith the<br>
&gt; full RVA profiles, the paths started to get so long that bitbake would=
 produce<br>
&gt; this error:<br>
&gt; <br>
&gt; &gt; ERROR: Unable to reduce sstate name to less than 255 chararacters=
<br>
&gt; <br>
&gt; To solve this problem, meta/lib/oe/tune.py now supports a very short<b=
r>
&gt; list of profile names, and includes new functions (riscv_pkgarch() and=
<br>
&gt; riscv_implied()) designed to compare selected extensions against<br>
&gt; dependencies (profile and otherwise), and shorten path names<br>
&gt; appropriately. As an example, if you set the following in local.conf:<=
br>
&gt; <br>
&gt; &gt; AVAILTUNES +=3D &quot;my-rva20-tune&quot;<br>
&gt; &gt; TUNE_FEATURES:tune-my-rva20-tune =3D &quot;${@oe.tune.riscv_isa_t=
o_tune(&#39;rv64gc&#39;)} ziccamoa ziccif zicclsm ziccrse zicntr za128rs&qu=
ot;<br>
&gt; &gt; PACKAGE_EXTRA_ARCHS:tune-my-rva20-tune =3D &quot;${TUNE_RISCV_PKG=
ARCH}&quot;<br>
&gt; &gt; DEFAULTTUNE =3D &quot;my-rva20-tune&quot;<br>
&gt; <br>
&gt; then &#39;bitbake-getvar --value TUNE_PKGARCH&#39; shows that it is re=
cognized<br>
&gt; as the RVA20 profile:<br>
&gt; <br>
&gt; &gt; rva20u64_zifencei<br>
&gt; <br>
&gt; Extensions implied by others (e.g. &#39;zmmul&#39;, implied by &#39;m&=
#39;) don&#39;t need<br>
&gt; to be listed, but if they are the same result is obtained.<br>
&gt; <br>
&gt; With all of this combined, subdirectories in tmp/work/ look like:<br>
&gt; <br>
&gt; &gt; tgamblin@megalith ~/workspace/ypbuilds/poky-qemuriscv64 $ ls buil=
d/tmp/work/<br>
&gt; &gt; all-poky-linux=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemuriscv64-poky=
-linux=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
rva20u64_zcmop_zifencei_zihintpause_zimop_zvbb-poky-linux=C2=A0 rva23u64_zi=
fencei-poky-linux<br>
&gt; &gt; qemuriscv32-poky-linux=C2=A0 riscv32imafdc_zicsr_zifencei-poky-li=
nux=C2=A0 rva20u64_zifencei-poky-linux=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0x86_64-linux<br>
&gt; <br>
&gt; Note that &#39;rva20u64_zcmop_zifencei_zihintpause_zimop_zvbb-poky-lin=
ux&#39; is<br>
&gt; a custom configuration that I set in local.conf only for testing<br>
&gt; purposes. Custom tunings still run the ris(c|k) of exceeding the namin=
g<br>
&gt; length, which we may need some extra hashing logic (maybe a bitmask?) =
to<br>
&gt; handle if we want to enable freely customizing build tunings. <br>
<br>
I think this approach makes a lot of sense, given the way RISC-V<br>
extensions work it&#39;s probably the only way to make things readable.<br>
<br>
&gt; <br>
&gt; # Testing<br>
&gt; <br>
&gt; Testing different profiles&#39; validity against the compiler involved=
<br>
&gt; setting (for example) DEFAULTTUNE =3D &quot;rva23u64&quot; and then ru=
nning &#39;bitbake<br>
&gt; opensbi&#39; (which also results in a kernel rebuild) as a quick smoke=
 test.<br>
&gt; I&#39;ve also opted to do full image builds to make sure that the new<=
br>
&gt; profiles fully boot and run without any obvious errors. I&#39;ve also =
run a<br>
&gt; series of boot tests (including ptests for packages like coreutils).<b=
r>
&gt; Note that when the vector extension is enabled (riscv64gcv, rva23u64),=
<br>
&gt; test durations will generally be higher.<br>
&gt; <br>
&gt; As of v2, I&#39;ve added some selftests to help:<br>
&gt; <br>
&gt; 1. The &#39;oelib.tune&#39; suite at meta/lib/oeqa/selftest/cases/oeli=
b/tune.py,<br>
&gt;=C2=A0 =C2=A0 for testing the riscv_pkgarch(), riscv_isa_to_tune(), and=
<br>
&gt;=C2=A0 =C2=A0 riscv_implied() functions<br>
&gt; 2. The &#39;riscvtune&#39; suite at meta/lib/oeqa/selftest/cases/riscv=
tune.py,<br>
&gt;=C2=A0 =C2=A0 for parsing and building against defined and unusual cust=
om tunes to<br>
&gt;=C2=A0 =C2=A0 ensure they each yield a usable package arch<br>
<br>
Looking at qemuriscv.inc we set QB_CPU to rva23s64 for qemuriscv64. I<br>
think we should do some boot testing with different QB_CPU values (e.g.<br>
build for rva20 and test with rva20 virtual CPU).<br>
<br>
Long term we may want to set the default TUNE for qemuriscv64 to align<br>
with RVA23.<br>
<br>
Best regards,<br>
<br>
-- <br>
Paul Barker<br>
<br>
</blockquote></div></div></div>

--0000000000000e96c7065d522601--

