Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66406CC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 03:41:14 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6451.1792094461282830833
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 13:01:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=GMRtgJPk;
 spf=pass (domain: baylibre.com, ip: 209.85.160.177, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53397325663so17527991cf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 13:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792094460; x=1792699260; darn=lists.openembedded.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z1WsZC9OHU1vWxD7c2QhqAsxGg64vMz/13UztkKjWE0=;
        b=GMRtgJPk1ApMh5BB9Hosy5phqzz1AGsadzkU1YMrGqZ8kHF9DJEvre65RU5GpwwE2Z
         Di7BCKIJySIRrRsSGaL1iTQQomLsHiH+dOvPfpvokUEBQIZkXsc7cJVK736QI/8B1hoG
         uhyvny/PGzhJH/JBLlWCoX5Tx68opStx0POsq6yRWyT8fdbbg0pjbof3M80KUVvNZmLv
         RCMlo4R24xCO1zeAXH15p55lXwFoCxpcZLT/tv2BsmCz1tcvg8UixzZ8SZwQx5R/qmIo
         NWFOac7huVCoW1CEWAJz/GydS6xE/2Evn5nX588UsGDfCOuPCeGupyjmPiA8Sgd/XGC+
         xmeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094460; x=1792699260;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z1WsZC9OHU1vWxD7c2QhqAsxGg64vMz/13UztkKjWE0=;
        b=XjnVHfKp8K+HASGFIh2rhca4hAn76T2BUlYhoDdWmrGDRUtsmD7JbeS2KAIvfPfc18
         oSF9KxCPrORlYVAFHtYC77FXX69/y3eLqXjVfYeVQFTjaQwKMaYUCcBDtGpBsK0Gh2gc
         SMvyO30Y6TvW8E1kdlhqhRCgw4XvxM8f7DBAy+3seMSG/qW3Sc0KCQt/1kYuNNqh6swg
         WVZADne1pS+cE2Tkp7O7KOzuMscqyNl0ExWq3ri8dZF2dSXSI+MxiIYYNM3lKbxcBrL1
         cfPwHOGWJFTzk2mkKbrhghuaMOARP5PcG4GEqtidC6MjenwkTZr2p1atuUwIVFhpuqGI
         5Otw==
X-Forwarded-Encrypted: i=1; AKwUvBx4D5J3V4z4cEx0ygc/7aBcQWxBft3B778erC5wm+5XXtVyHF6Za4BvUF/QxHxnWwWbDpL0ZeBPEVObJ3ObriUYzQ==@lists.openembedded.org
X-Gm-Message-State: AFq9FYKR12Nub6NbrqoA/F+FwdAMxhM4jYza5AaaL3yA/MWUy44rUlcu
	chWDaGF1X9RGQTrAqQyNi7n6iZ5FNqZ+A2E3Vd3B8m3eVCLAJ+Uyj/d8lB2gc38AYVM=
X-Gm-Gg: AYBFou1Bcr2IspXFw4mp8YLGYVtAQpqo5pMhatheQVv41zOypmPltEDH6F18C1biLXw
	d+X2XTRk4vMtMLGvfBTZ7V1X+xgp4mCUL+DGB2t163e1apE4Mgdnl0g1tVkutG4OKZkP/0XRTsf
	b6dZnDRoy+7E0xgb9Twde49N/AOnwnY/0UIXxuCXGHbSCw2/+R+ld/wTQJB4gTNBD/lL3ZoTSh7
	4xdu4MVLVqZmuYZ4Pzq4M4dmZJnEoX04EbQOGZXCjYzRklgfiQazWELGB1cUC/aL3dS/EfQ1BAy
	FIsMNSAd/nrYLeelWa5nbDnNr2iGRCAc3xdsYjv9m9qqbop9xL7Pxnl9H1OaIzfnGheyU8PTIAz
	iBw1NoXTB6ZC+zhhM/f5QUUqPL0SKY/fW+2WA6gjXr8D3igYUNdqBjybhVvDjL2e4fir+tCypGE
	xLD/TDYrm+eunPpPrFuZ3XwGOA99bNTojJMA7MvYwwUliqPEQbp4jvuk5sUM2zWKlrUi+OtP4b7
	wtnEx1X+Nf7zXJCLSciBCti+tiJBBCuCXE=
X-Received: by 2002:a05:622a:1e13:b0:535:6cc1:5890 with SMTP id d75a77b69052e-5359fdd86b2mr343766641cf.51.1792094459820;
        Thu, 15 Oct 2026 13:00:59 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362aa332b0sm2066181cf.26.2026.10.15.13.00.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 13:00:57 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 15 Oct 2026 16:00:51 -0400
Message-Id: <DM5OGPFMNFNH.3O2MEOPE0BZ90@baylibre.com>
Subject: Re: [OE-core][PATCH RFC v2 00/19] riscv: add new ISA extensions and profile support
Cc: "Trevor Gamblin" <tgamblin@baylibre.com>, "Patches and discussions about
 the oe-core layer" <openembedded-core@lists.openembedded.org>
To: "Mark Hatle" <mark.hatle@kernel.crashing.org>, "Khem Raj"
 <raj.khem@gmail.com>, "Paul Barker" <paul@pbarker.dev>
From: "Trevor Gamblin" <tgamblin@baylibre.com>
X-Mailer: aerc 0.22.0
References: <20260930-riscv-tuning-rework-v2-0-9e29f3531d0e@baylibre.com>
 <549aa667517325c9a178dd71e0e2563910303ca8.camel@pbarker.dev>
 <CAMKF1srDRW04xpAa36w5PsdELfDU0uiSyf2y=5204D4C3qoVBQ@mail.gmail.com>
 <630fe2e1-f7b2-4443-98e9-b9aeb94fd0fc@kernel.crashing.org>
In-Reply-To: <630fe2e1-f7b2-4443-98e9-b9aeb94fd0fc@kernel.crashing.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 03:41:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247909

On Thu Oct 8, 2026 at 11:42 AM EDT, Mark Hatle wrote:
>
>
> On 10/8/26 5:56 AM, Khem Raj wrote:
>> I will review rest of series in detail later
>>=20
>> On Thu, Oct 1, 2026, 11:13=E2=80=AFAM Paul Barker <paul@pbarker.dev=20
>> <mailto:paul@pbarker.dev>> wrote:
>>=20
>>     Hi Trevor,
>>=20
>>     Snipping a lot of the cover letter to give some initial thoughts...
>>=20
>>     On Wed, 2026-09-30 at 12:38 -0400, Trevor Gamblin wrote:
>>      > A list of changes, by group:
>>      >
>>      > 1. Basic clarification changes and extra tunings:
>>      >=C2=A0 =C2=A0 =C2=A0a. tune-riscv: be explicit about riscv32gc, ri=
scv64gc defaults
>>      >=C2=A0 =C2=A0 =C2=A0b. tune-riscv.inc: add 'riscv64gcv' tune
>>=20
>>     I think these changes make sense, and now master has diverged from
>>     blacksail it may be a good time to take them.
>>=20
>>      > 2. Adding official RVA20 profile extensions, and supporting the e=
xplicit
>>     choice
>>      > of 'rva20u64' as a tuning option for builds:
>>      >=C2=A0 =C2=A0 =C2=A0a. arch-riscv.inc: add missing RVA20 extension=
s
>>      >=C2=A0 =C2=A0 =C2=A0b. meta/lib/oe/tune.py: support profile string=
s, add rva20u64
>>      >=C2=A0 =C2=A0 =C2=A0c. tune-riscv.inc: add rva20u64 to AVAILTUNES
>>      > 3. Adding RVA22 profile support:
>>      >=C2=A0 =C2=A0 =C2=A0a. arch-riscv.inc: add rva22u64 extensions
>>      >=C2=A0 =C2=A0 =C2=A0b. meta/lib/oe/tune.py: add rva22u64 profile
>>      >=C2=A0 =C2=A0 =C2=A0c. tune-riscv.inc: add rva22u64 to AVAILTUNES
>>      > 4. Adding RVA23 profile support:
>>      >=C2=A0 =C2=A0 =C2=A0a. arch-riscv.inc: add rva23u64 extensions
>>      >=C2=A0 =C2=A0 =C2=A0b. meta/lib/oe/tune.py: add rva23u64 profile
>>      >=C2=A0 =C2=A0 =C2=A0c. tune-riscv.inc: add rva23u64 to AVAILTUNES
>>      > 5. Quality-of-life fixups after 1-4:
>>      >=C2=A0 =C2=A0 =C2=A0a. meta/lib/oe/tune.py: add riscv_pkgarch()
>>      >=C2=A0 =C2=A0 =C2=A0b. arch-riscv.inc: rename TUNE_RISCV_PKGARCH -=
> TUNE_RISCV_PKGARCH_EXACT
>>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 in assignments
>>      >=C2=A0 =C2=A0 =C2=A0c. tune.py: add implied tuning logic
>>      >=C2=A0 =C2=A0 =C2=A0d. tune.py: add vector extensions to RISCV_IMP=
LIED
>>      >=C2=A0 =C2=A0 =C2=A0e. tune-riscv.inc: add RISCV_PKGARCH vars, set=
 PACKAGE_EXTRA_ARCHS
>>      >=C2=A0 =C2=A0 =C2=A0f. tune-riscv.inc: clarify zifencei comment
>>      > 6. Selftests:
>>      >=C2=A0 =C2=A0 =C2=A0a. selftest: oelib: add tune.py
>>      >=C2=A0 =C2=A0 =C2=A0b. selftest: cases: add riscvtune.py
>>=20
>>     There are no users of the RVA20, RVA22 or RVA23 profiles in OE-core,=
 so
>>     it's hard to be confident that the approach is right here. I assume =
the
>>     goal is to convert some of the machines in meta-riscv to use the
>>     appropriate TUNE once these changes are merged? If so, it may be bet=
ter
>>     to first add support for the new profiles in meta-riscv and update
>>     relevant machine configurations to use them. Once they've had some t=
ime
>>     to stabilise in meta-riscv we could then move them into OE-core.
>>=20
>>=20
>> Its better to handle it in one place in oe-core. We do similar for arm. =
Where we=20
>> have all kind of tunes in core its simpler to get the logic working that=
 way.=20
>> Older editions of architectures aren't going away anytime soon.
>
> I'm not attempting to speak for RP here, but when I did the initial code.=
  RP=20
> wanted to be sure that we did not introduce additional maintenance by jus=
t=20
> adding a boat load of new ISA options without someone willing to maintain=
 them,=20
> a way to test them (i.e. gcc/llvm/etc), and more to the point some sort o=
f=20
> target system(s) that were actively using them.

I've started by adding some selftests, but I think that was just the beginn=
ing.
This definitely does mean *some* more maintenance, but I think it's importa=
nt
for us to be explicit about which extensions are to be selected for an avai=
lable
tuning, rather than letting the compiler alone figure that out. That being =
said,
I'm not expecting ratified specifications to change significantly, so being=
 more
explicit about extensions in this way might help us with detecting when
something has gone wrong with the underlying toolchain - this is something =
I was
thinking about before, but it's on my mind more now that I've had feedback =
from
you all.

>
> The initial implementation was formed based on existing OE, plus the AMD =
FPGA=20
> based Risc-V components, so everything had an active "user" and test path=
.
>
> I think RP's request from the initial work is still valid.  We should be =
adding=20
> ISA items because they are useful to actual embedded users, and not just =
because=20
> someone defined them.  If they don't exist (yet) in gcc, llvm, etc, we sh=
ould=20
> not be including them.  If there is no hardware (qemu counts as hardware)=
 to=20
> exercise an ISA, I would be reluctant to include it as it just increases=
=20
> maintenance without a path for testing.

gcc definitely includes them, although there is a distinction between
riscv64gc/rv64gc and rva20u64, which I believe has been made confusing by s=
ome
vendors and/or marketing materials suggesting RV64GC hardware was RVA20
compatible (technically true, in that rva20 is a superset), or the opposite=
,
which recent gcc versions at least show to be different:

|tgamblin@alchemist ~/workspace/git/boardgarden (main)$ gcc --version
|gcc (GCC) 16.2.1 20260819 (Red Hat 16.2.1-2)
|Copyright (C) 2026 Free Software Foundation, Inc.
|This is free software; see the source for copying conditions.  There is NO
|warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE=
.
|
|tgamblin@alchemist ~/workspace/git/boardgarden (main)$ riscv64-linux-gnu-g=
cc -march=3Drv64gc -mabi=3Dlp64d -Q --help=3Dtarget | grep march
|  --print-supported-extensions 		-march=3Dhelp
|  -march=3D                     		rv64imafdc_zicsr_zifencei_zmmul_zaamo_za=
lrsc_zca_zcd
|  -march=3Dhelp                 		[disabled]
|  -print-supported-extensions 		-march=3Dhelp
|tgamblin@alchemist ~/workspace/git/boardgarden (main)$ riscv64-linux-gnu-g=
cc -march=3Drva20u64 -mabi=3Dlp64d -Q --help=3Dtarget | grep march
|  --print-supported-extensions 		-march=3Dhelp
|  -march=3D                     		rv64imafdc_ziccamoa_ziccif_zicclsm_ziccr=
se_zicntr_zicsr_zmmul_za128rs_zaamo_zalrsc_zca_zcd
|  -march=3Dhelp                 		[disabled]
|  -print-supported-extensions 		-march=3Dhelp

As for target systems using them, the "new" standard is the SpacemiT K3 pla=
tform
for now, which is RVA23 compliant and thus mandates all of the extensions w=
hich
haven't been superseded from earlier profiles, plus all of the RVA23-specif=
ic
ones. Right now we're still building with 'riscv64gc' as the package tuning=
 when
that BSP is enabled with meta-riscv, along with all other platforms (QEMU
included, which boots RVA23S64 by default in oe-core). The goal is definite=
ly to
allow building with package tunings which match the underlying hardware in
meta-riscv, although the hardware landscape means that most people will be
building against one of the following three cases in the short-term:

1. riscv64gc
2. rva22u64 + RVV (SpacemiT K1)
3. rva23u64

>
> With the above said, I don't have a good view of the risc-v world outside=
 of my=20
> specific workflows and use-cases, so I can't recommend any particular ISA=
=20
> extensions (in this patch set) that should or should not be included, but=
 I=20
> think the general design above is a good one to keep things reasonable an=
d bound=20
> the problem.  (We could try to implement ALL risc-v ISA extensions, but i=
t's=20
> pretty clear to me from reading the docs a lot of them are theoretical or=
 not=20
> used within the scope of what OE is current used for.

That could be true. I won't pretend that I have a thorough grasp of where m=
ost
of them come into play, but I have seen enough cases of certain extensions =
being
necessary for some packages (e.g. FFmpeg) that providing support for them s=
eems
more practical than not.=20

A related topic that came up repeatedly at LPC/OSS Prague last week was the=
 more
general future of RISC-V software support. I got the impression from some
conversations that moving to RVA23 as the baseline and deprecating older
profiles from distro and toolchain perspectives was desired by some maintai=
ners.
However, there are already some platforms in production using older profile=
s
that will need support for a long time. I don't want to speak for others ei=
ther,
but I think Yocto is uniquely positioned to provide that kind of support as
other distros move on, and in my mind Yocto and RISC-V align very well in t=
he
flexibility/customization sense (especially where we don't necessarily know
who's using which parts and in what capacity).

Anyway, I think I'll submit the first two patches in this series again as
standalone changes, and look at sending the rest to meta-riscv for now.

Trevor
>
>>=20
>>      > One significant change to the way profile strings are processed w=
ith
>>      > these patches shows up in sstate/build path naming, and is part o=
f the
>>      > reason for patch 5a-5d above. Before, a build directory
>>      > might have a path in it like:
>>      >
>>      > > build/tmp/work/riscv64imafdc_zicsr_zifencei-poky-linux/
>>      >
>>      > This was fine when the extension list was short (for riscv64gc), =
but with the
>>      > full RVA profiles, the paths started to get so long that bitbake =
would
>>     produce
>>      > this error:
>>      >
>>      > > ERROR: Unable to reduce sstate name to less than 255 chararacte=
rs
>>      >
>>      > To solve this problem, meta/lib/oe/tune.py now supports a very sh=
ort
>>      > list of profile names, and includes new functions (riscv_pkgarch(=
) and
>>      > riscv_implied()) designed to compare selected extensions against
>>      > dependencies (profile and otherwise), and shorten path names
>>      > appropriately. As an example, if you set the following in local.c=
onf:
>>      >
>>      > > AVAILTUNES +=3D "my-rva20-tune"
>>      > > TUNE_FEATURES:tune-my-rva20-tune =3D
>>     "${@oe.tune.riscv_isa_to_tune('rv64gc')} ziccamoa ziccif zicclsm zic=
crse
>>     zicntr za128rs"
>>      > > PACKAGE_EXTRA_ARCHS:tune-my-rva20-tune =3D "${TUNE_RISCV_PKGARC=
H}"
>>      > > DEFAULTTUNE =3D "my-rva20-tune"
>>      >
>>      > then 'bitbake-getvar --value TUNE_PKGARCH' shows that it is recog=
nized
>>      > as the RVA20 profile:
>>      >
>>      > > rva20u64_zifencei
>>      >
>>      > Extensions implied by others (e.g. 'zmmul', implied by 'm') don't=
 need
>>      > to be listed, but if they are the same result is obtained.
>>      >
>>      > With all of this combined, subdirectories in tmp/work/ look like:
>>      >
>>      > > tgamblin@megalith ~/workspace/ypbuilds/poky-qemuriscv64 $ ls
>>     build/tmp/work/
>>      > > all-poky-linux=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemuriscv64-po=
ky-linux                =20
>>      =C2=A0rva20u64_zcmop_zifencei_zihintpause_zimop_zvbb-poky-linux=20
>>     rva23u64_zifencei-poky-linux
>>      > > qemuriscv32-poky-linux=C2=A0 riscv32imafdc_zicsr_zifencei-poky-=
linux=20
>>     rva20u64_zifencei-poky-linux=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0x8=
6_64-linux
>>      >
>>      > Note that 'rva20u64_zcmop_zifencei_zihintpause_zimop_zvbb-poky-li=
nux' is
>>      > a custom configuration that I set in local.conf only for testing
>>      > purposes. Custom tunings still run the ris(c|k) of exceeding the =
naming
>>      > length, which we may need some extra hashing logic (maybe a bitma=
sk?) to
>>      > handle if we want to enable freely customizing build tunings.
>>=20
>>     I think this approach makes a lot of sense, given the way RISC-V
>>     extensions work it's probably the only way to make things readable.
>>=20
>>      >
>>      > # Testing
>>      >
>>      > Testing different profiles' validity against the compiler involve=
d
>>      > setting (for example) DEFAULTTUNE =3D "rva23u64" and then running=
 'bitbake
>>      > opensbi' (which also results in a kernel rebuild) as a quick smok=
e test.
>>      > I've also opted to do full image builds to make sure that the new
>>      > profiles fully boot and run without any obvious errors. I've also=
 run a
>>      > series of boot tests (including ptests for packages like coreutil=
s).
>>      > Note that when the vector extension is enabled (riscv64gcv, rva23=
u64),
>>      > test durations will generally be higher.
>>      >
>>      > As of v2, I've added some selftests to help:
>>      >
>>      > 1. The 'oelib.tune' suite at meta/lib/oeqa/selftest/cases/oelib/t=
une.py,
>>      >=C2=A0 =C2=A0 for testing the riscv_pkgarch(), riscv_isa_to_tune()=
, and
>>      >=C2=A0 =C2=A0 riscv_implied() functions
>>      > 2. The 'riscvtune' suite at meta/lib/oeqa/selftest/cases/riscvtun=
e.py,
>>      >=C2=A0 =C2=A0 for parsing and building against defined and unusual=
 custom tunes to
>>      >=C2=A0 =C2=A0 ensure they each yield a usable package arch
>>=20
>>     Looking at qemuriscv.inc we set QB_CPU to rva23s64 for qemuriscv64. =
I
>>     think we should do some boot testing with different QB_CPU values (e=
.g.
>>     build for rva20 and test with rva20 virtual CPU).
>>=20
>>     Long term we may want to set the default TUNE for qemuriscv64 to ali=
gn
>>     with RVA23.
>>=20
>>     Best regards,
>>=20
>>     --=20
>>     Paul Barker
>>=20



