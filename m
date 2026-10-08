Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF8B6CA6012
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 17:41:35 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10013.1791443717578427763
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2026 00:15:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=BTZ1Yoz8;
 spf=pass (domain: baylibre.com, ip: 209.85.128.41, mailfrom: tgamblin@baylibre.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so39992135e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 00:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791443715; x=1792048515; darn=lists.openembedded.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hr6vrFNBV7ya+w2+wDc+GVUpl7rpOdNFVtkD0jaiyf4=;
        b=BTZ1Yoz8mfry0jM+gpSrgThL3ydXDeHcpuWvSPGu8MFZJlC3bkuFGbRJUz+1RFJAZ0
         9OW80BxIBtynyWVbwY6p9w8/Ugk+ooQBoul2o166WSbrpk8JfEpzQv4PRzA13BGNotL1
         HwRHj75OYlw3TTdbug8txkgT2xJ7Y86cx23EsulGDQqqppcQqtc8Ctygxvt5YbcbmEzQ
         rG3hgc0PDVmWvsJXdqvlODlBAD6gSnsR1df8Ek8Img5lmkoEIvyP0Dn/B3cNL2bWtkXG
         qUSqYLX2d+WHPbO4/CRvh7XS1oQEk4K0IILCbYF6eNqPdKzck6LKDxU8+t2LvkgGK/Pq
         zqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791443715; x=1792048515;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hr6vrFNBV7ya+w2+wDc+GVUpl7rpOdNFVtkD0jaiyf4=;
        b=lhsiV3GKMlAubzSg/BGq5PWB+xKJpWHaS5lcHVbVHgy9cPI06zkuT6DnDsFg++p6C9
         YvtN6YXMnC1GjCkZEZZjN745BsQssFw0hgzHvOn5zQJ2upWAyUStMYArlNRORTjU/TMb
         Fm3djKcPMvmBzk/uD2DHhdldfSJGlvz+n+YgGDef4Q6wTcm5j5LR0XTzxxef6q6Ayw2h
         97ZAEVLbY2xNNf3xnUl5y338vPrvP17NiZVD1km9s+Kan+K6phz/nsFDH2+zcXYVBNNY
         0RBX9xMrBtDylxDlSdpMa8uFtMWWrytH4LWwRq6oILZkYAr9jkqc25xmgWkBEnoNdnwu
         nSQw==
X-Forwarded-Encrypted: i=1; AKwUvByIG0Wu9wuTRdIy33Rd9r5xZGtDc3QlZ6Vt7xR6Hbge7ohfsiGoM4L/5vQqS8ii3IoAuDr57fmn7tmIAUBBYiuRZw==@lists.openembedded.org
X-Gm-Message-State: AFuF++miYsEaCW2D7ld/zjIv+//CrkZibD8aGEZffEmIi681suG6LD7l
	nt2jB9sr7niXenFZkSwwtL/6dHY3PcYObqaZQk4zZhZsrJj8fMODijmtCeEuj/5Ttl4=
X-Gm-Gg: AYBFou1xwrUHQbCzpaPfhEQgSfXR9a1qfLYL/wJrdxA+OYZfnx1hbZ/7Z1O2Zw8no3Z
	cBn38BYALrTq8n1vOT3CokfNX4x61zj+Mae6+IKtWNWY03AEjyVTZF8uPfqHxNEuvILxDaA74mu
	HeUlmMCsTc8rxB+8wKNwWH3DEIKgiE14aKqjX/x/a6xWNwePd4CnCvIKohgA5csPdlRXkAF11eu
	LHXXkqZ2hlyFI80lWfucHkhpZTVh1cmagyH29xxSa0o6TS0QeHfLt11lzd1gqXjafmYM0S7Y3p3
	tGj2olBj2VIWL7ZKJfE4crAnR/Ebv0Pd0NRKKEBiUg+e0mJWwWlh2EsSrbcCWEeTDr6ZIXdhM/x
	0GTsZ1cMINTPknTKrgP+6A6HHwdXO+rGNMyRzkizYpTS2gKcFr71nHPAdP5zZrYIi0VBdCeoPAI
	Mm00ah63VzT2WblPuhnGKcuP0k5ntCfcGrqxNfKOdCluiWs9c1CZSjxuxqpj2AW5pVTr455ZM/w
	PSUECBLriIYKLI2zSulh0CQ45zC0Ym9hA1HwQVgXlA7bWNP1YgMiTIvols=
X-Received: by 2002:a05:600c:64c9:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4a1800d417dmr79766625e9.1.1791443715151;
        Thu, 08 Oct 2026 00:15:15 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1843cb261sm50715585e9.3.2026.10.08.00.15.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 00:15:14 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 08 Oct 2026 03:15:13 -0400
Message-Id: <DLZ9SOQ8CZW5.1VEN26RC0389R@baylibre.com>
Subject: Re: [OE-core][PATCH RFC v2 00/19] riscv: add new ISA extensions and profile support
Cc: <raj.khem@gmail.com>, <mark.hatle@kernel.crashing.org>
To: "Paul Barker" <paul@pbarker.dev>, "Trevor Gamblin"
 <tgamblin@baylibre.com>, <openembedded-core@lists.openembedded.org>
From: "Trevor Gamblin" <tgamblin@baylibre.com>
X-Mailer: aerc 0.22.0
References: <20260930-riscv-tuning-rework-v2-0-9e29f3531d0e@baylibre.com>
 <549aa667517325c9a178dd71e0e2563910303ca8.camel@pbarker.dev>
In-Reply-To: <549aa667517325c9a178dd71e0e2563910303ca8.camel@pbarker.dev>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 17:41:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247438

On Thu Oct 1, 2026 at 5:13 AM EDT, Paul Barker wrote:
> Hi Trevor,
>
> Snipping a lot of the cover letter to give some initial thoughts...
>
> On Wed, 2026-09-30 at 12:38 -0400, Trevor Gamblin wrote:
>> A list of changes, by group:
>>=20
>> 1. Basic clarification changes and extra tunings:
>>     a. tune-riscv: be explicit about riscv32gc, riscv64gc defaults
>>     b. tune-riscv.inc: add 'riscv64gcv' tune
>
> I think these changes make sense, and now master has diverged from
> blacksail it may be a good time to take them.

Alright. Do you want me to resubmit them as a smaller, separate series?

>
>> 2. Adding official RVA20 profile extensions, and supporting the explicit=
 choice
>> of 'rva20u64' as a tuning option for builds:
>>     a. arch-riscv.inc: add missing RVA20 extensions
>>     b. meta/lib/oe/tune.py: support profile strings, add rva20u64
>>     c. tune-riscv.inc: add rva20u64 to AVAILTUNES
>> 3. Adding RVA22 profile support:
>>     a. arch-riscv.inc: add rva22u64 extensions
>>     b. meta/lib/oe/tune.py: add rva22u64 profile
>>     c. tune-riscv.inc: add rva22u64 to AVAILTUNES
>> 4. Adding RVA23 profile support:
>>     a. arch-riscv.inc: add rva23u64 extensions
>>     b. meta/lib/oe/tune.py: add rva23u64 profile
>>     c. tune-riscv.inc: add rva23u64 to AVAILTUNES
>> 5. Quality-of-life fixups after 1-4:
>>     a. meta/lib/oe/tune.py: add riscv_pkgarch()
>>     b. arch-riscv.inc: rename TUNE_RISCV_PKGARCH -> TUNE_RISCV_PKGARCH_E=
XACT
>>        in assignments
>>     c. tune.py: add implied tuning logic
>>     d. tune.py: add vector extensions to RISCV_IMPLIED
>>     e. tune-riscv.inc: add RISCV_PKGARCH vars, set PACKAGE_EXTRA_ARCHS
>>     f. tune-riscv.inc: clarify zifencei comment
>> 6. Selftests:
>>     a. selftest: oelib: add tune.py
>>     b. selftest: cases: add riscvtune.py
>
> There are no users of the RVA20, RVA22 or RVA23 profiles in OE-core, so
> it's hard to be confident that the approach is right here. I assume the
> goal is to convert some of the machines in meta-riscv to use the
> appropriate TUNE once these changes are merged? If so, it may be better
> to first add support for the new profiles in meta-riscv and update
> relevant machine configurations to use them. Once they've had some time
> to stabilise in meta-riscv we could then move them into OE-core.

Yes, that is the idea (in addition to supporting more profiles for developm=
ent).
I am fine with adding these to meta-riscv in the short-term.
>
>> One significant change to the way profile strings are processed with
>> these patches shows up in sstate/build path naming, and is part of the
>> reason for patch 5a-5d above. Before, a build directory
>> might have a path in it like:
>>=20
>> > build/tmp/work/riscv64imafdc_zicsr_zifencei-poky-linux/
>>=20
>> This was fine when the extension list was short (for riscv64gc), but wit=
h the
>> full RVA profiles, the paths started to get so long that bitbake would p=
roduce
>> this error:
>>=20
>> > ERROR: Unable to reduce sstate name to less than 255 chararacters
>>=20
>> To solve this problem, meta/lib/oe/tune.py now supports a very short
>> list of profile names, and includes new functions (riscv_pkgarch() and
>> riscv_implied()) designed to compare selected extensions against
>> dependencies (profile and otherwise), and shorten path names
>> appropriately. As an example, if you set the following in local.conf:
>>=20
>> > AVAILTUNES +=3D "my-rva20-tune"
>> > TUNE_FEATURES:tune-my-rva20-tune =3D "${@oe.tune.riscv_isa_to_tune('rv=
64gc')} ziccamoa ziccif zicclsm ziccrse zicntr za128rs"
>> > PACKAGE_EXTRA_ARCHS:tune-my-rva20-tune =3D "${TUNE_RISCV_PKGARCH}"
>> > DEFAULTTUNE =3D "my-rva20-tune"
>>=20
>> then 'bitbake-getvar --value TUNE_PKGARCH' shows that it is recognized
>> as the RVA20 profile:
>>=20
>> > rva20u64_zifencei
>>=20
>> Extensions implied by others (e.g. 'zmmul', implied by 'm') don't need
>> to be listed, but if they are the same result is obtained.
>>=20
>> With all of this combined, subdirectories in tmp/work/ look like:
>>=20
>> > tgamblin@megalith ~/workspace/ypbuilds/poky-qemuriscv64 $ ls build/tmp=
/work/
>> > all-poky-linux          qemuriscv64-poky-linux                   rva20=
u64_zcmop_zifencei_zihintpause_zimop_zvbb-poky-linux  rva23u64_zifencei-pok=
y-linux
>> > qemuriscv32-poky-linux  riscv32imafdc_zicsr_zifencei-poky-linux  rva20=
u64_zifencei-poky-linux                               x86_64-linux
>>=20
>> Note that 'rva20u64_zcmop_zifencei_zihintpause_zimop_zvbb-poky-linux' is
>> a custom configuration that I set in local.conf only for testing
>> purposes. Custom tunings still run the ris(c|k) of exceeding the naming
>> length, which we may need some extra hashing logic (maybe a bitmask?) to
>> handle if we want to enable freely customizing build tunings.=20
>
> I think this approach makes a lot of sense, given the way RISC-V
> extensions work it's probably the only way to make things readable.

Ack.

Trevor

>
>>=20
>> # Testing
>>=20
>> Testing different profiles' validity against the compiler involved
>> setting (for example) DEFAULTTUNE =3D "rva23u64" and then running 'bitba=
ke
>> opensbi' (which also results in a kernel rebuild) as a quick smoke test.
>> I've also opted to do full image builds to make sure that the new
>> profiles fully boot and run without any obvious errors. I've also run a
>> series of boot tests (including ptests for packages like coreutils).
>> Note that when the vector extension is enabled (riscv64gcv, rva23u64),
>> test durations will generally be higher.
>>=20
>> As of v2, I've added some selftests to help:
>>=20
>> 1. The 'oelib.tune' suite at meta/lib/oeqa/selftest/cases/oelib/tune.py,
>>    for testing the riscv_pkgarch(), riscv_isa_to_tune(), and
>>    riscv_implied() functions
>> 2. The 'riscvtune' suite at meta/lib/oeqa/selftest/cases/riscvtune.py,
>>    for parsing and building against defined and unusual custom tunes to
>>    ensure they each yield a usable package arch
>
> Looking at qemuriscv.inc we set QB_CPU to rva23s64 for qemuriscv64. I
> think we should do some boot testing with different QB_CPU values (e.g.
> build for rva20 and test with rva20 virtual CPU).
>
> Long term we may want to set the default TUNE for qemuriscv64 to align
> with RVA23.
>
> Best regards,



