Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C14BDC4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:29:13 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.11618.1713947347549197950
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:29:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iulV0CwK;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2db2f6cb312so112907471fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 01:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713947346; x=1714552146; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7eU0HD+avTIqFLiCk3wJHfjhUWyMI4wQAd0f1awNw8=;
        b=iulV0CwKu7R67oqSkFyT/3socjSmpKSNzJJHsMZrP3tq73LrFBAhXqBaoYpbIroMd+
         tpQ6zfJxhUGvbLRvvFqHm7+dQ1Sgl09ZH1B4Yr9klgW71AgOGE1+kMCgnJIAETMHSptU
         Nn7VOfNv5MfWftev7HyfkUtqAVs64Z6a3wznwUnDqNa6LsWFOXqzz6c9RzRgKPER0UGm
         dxTKNYZd2uKk4LFx32V8fRx6aGOekJoopWwXneSseXYAiijnX4w57aqmLljj01aileKd
         fmRh2Jdi78WnyfHmZZICSLqpYu4gj6tGo4k92hLwUZohf5HZUNNitJUlczevGlhcx+fu
         iyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713947346; x=1714552146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U7eU0HD+avTIqFLiCk3wJHfjhUWyMI4wQAd0f1awNw8=;
        b=StTcAhnL5i6cA4waZCAqbMKkxaCvSaBwvIDE4a8a/x5SeiIBTkoj19wkNLxEtTduTT
         FsusAvx73kwWW3NBvx+n+DX4WnnvLU9F2hGpW7N1ysY1hQovjoi+is+2pvINotrqT0SY
         wajxwlbU1XLrTfg/3q6FbKCX+4cqo/01hpQ2f/ScU8tuAQOk6JqbPlcurnrTYEGHIDWx
         X769eCby32YYNJJws2Wct7W4Uecj+eISHKxVut1GccHfZPSix1dOsS8nMLcspLeWP/2h
         ZLW7kPzs9LcSONDmeGLG7sF3AYU9HujPsChjQdghOoq7YwMqoQJPUFOdLk/97WtCBwUs
         xzCA==
X-Gm-Message-State: AOJu0Yw3Z7KsGDfQwPJPnrNc7s4/eUf+M/EeeP+Ls4JzQY1mBPhn7KXl
	7ZWplFdjDC4ifmf5IK8/8nalp/rhvGsOAtpv8yuvNu4KPPTAstQyA9kFs/9gT3q9bntgIN//+La
	mx96B8dSoeSECGDuaNrazqJqs2Vw=
X-Google-Smtp-Source: AGHT+IEXNYg+upnL/7pBDoAQheCfOkXW/9Tb8SL4/Wnwb5pGUknOzmG1OKGn6DSXITu1fJpCIiQ8xM8ZXIdmlQ32PFY=
X-Received: by 2002:a2e:81c2:0:b0:2d4:6893:24e1 with SMTP id
 s2-20020a2e81c2000000b002d4689324e1mr1159297ljg.50.1713947345256; Wed, 24 Apr
 2024 01:29:05 -0700 (PDT)
MIME-Version: 1.0
References: <e574884f-d13f-4e57-b55f-4ffdd9fe3103@gmail.com>
 <CANNYZj8De8ufESxPOFGodeaq8Lvu4-S-46NMNOzNVYuZUU+D_g@mail.gmail.com> <f553ffbc-16a7-4060-9b43-2625852ac55d@gmail.com>
In-Reply-To: <f553ffbc-16a7-4060-9b43-2625852ac55d@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Apr 2024 10:28:53 +0200
Message-ID: <CANNYZj_4vum5En3xs8nKNOOPCvHSPJ=0Z=VFyCDc4qVsvSq3Kw@mail.gmail.com>
Subject: Re: [OE-core] Set the CMake BUILD_TESTING option to OFF as the
 default setting
To: Fabio Berton <fbberton@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:29:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198642

You can build everything with 'bitbake world' (and it's going to be long).

Build times are recorded into tmp/buildstats, if that is enabled (see
default local.conf to see how if you're not already using that).

Alex

On Wed, 24 Apr 2024 at 09:56, Fabio Berton <fbberton@gmail.com> wrote:
>
> Hi Alex,
>
> What should I test to measure build time, all recipes that use cmake from=
 OE-Core and meta-openembedded? Is there a way to build all recipes, or sho=
uld I find all recipes that use cmake and run bitbake <all-recipes>?
>
> Regards,
>
> Fabio Berton
>
> On 4/23/2024 2:01 PM, Alexander Kanavin wrote:
>
> I'm not sure I like the idea. This is going to break ptests or other
> usage of CTest in cmake-based recipes that aren't under our control.
> Building tests is also a test in itself even if you don't run them.
> I'd say unless this adds significantly to build times we should leave
> it as it is.
>
> Alex
>
> On Tue, 23 Apr 2024 at 14:31, Fabio Berton via lists.openembedded.org
> <fbberton=3Dgmail.com@lists.openembedded.org> wrote:
>
> I've noticed that some recipes, like json-c [1], which use the cmake bbcl=
ass, are generating files that aren't being used. This is because CMake set=
s the BUILD_TESTING option to ON by default. According to the CMake documen=
tation [2], when CTest is included, as json-c does here [3], the module aut=
omatically creates a BUILD_TESTING option. This option determines whether t=
o enable testing support, and it is ON by default.
>
> In the json-c example, the tests used by the do_install_ptest task are al=
ways generated. Thus, ${B}/tests/ exists even when ptests are not included =
in DISTRO_FEATURES.
>
> As the behavior of CTest/CMake to build tests by default is rather surpri=
sing, we are wondering whether disabling this option by default is feasible=
 in the OpenEmbedded context. Recipes expecting tests to be built (e.g. bec=
ause of ptest support) would then turn on the flag explicitly.
>
> For example, adding this to cmake.bbclass:
>
> OECMAKE_BUILD_TESTING ??=3D "false"
>
> EXTRA_OECMAKE:append =3D "\\
>     ${@bb.utils.contains('OECMAKE_BUILD_TESTING', 'false', '-DBUILD_TESTI=
NG=3DOFF', '', d)} \\
> "
>
> and then set the OECMAKE_BUILD_TESTING in the recipe that requires BUILD_=
TESTING=3DON
>
> Do you have any suggestions on which steps we should take to verify that =
this does not introduce any regressions?
>
>
> 1 - https://git.openembedded.org/openembedded-core/tree/meta/recipes-devt=
ools/json-c/json-c_0.17.bb?h=3Dmaster
>
> 2 - https://cmake.org/cmake/help/latest/module/CTest.html
>
> 3 - https://github.com/json-c/json-c/blob/master/CMakeLists.txt#L19
>
>
> Regards,
>
> Fabio Berton
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198621): https://lists.openembedded.org/g/openembedde=
d-core/message/198621
> Mute This Topic: https://lists.openembedded.org/mt/105688417/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

