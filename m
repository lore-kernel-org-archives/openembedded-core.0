Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2324E7C4F6
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 08:02:45 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.10447.1696492955774579242
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Oct 2023 01:02:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=gTSNbZ/x;
 spf=pass (domain: baylibre.com, ip: 209.85.218.46, mailfrom: jstephan@baylibre.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9b2f73e3af3so115898166b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 01:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696492954; x=1697097754; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1jE1rs0SGGmVIkAxbAG6VkgpYLjht5jCkGxw4rvqNLo=;
        b=gTSNbZ/xosmfaESZrs9kzAnfb/alZXCYbb5MUoAoMRmkv5FGW3jvJgA12DmHouPzQp
         u5NiblGlfkUFGLJeUcxotCsjg7v9c0MtdJ7mrzS2usfcsxkrp8IhnWfo5W6W+VuIA/Lz
         GLgVu581P+NRD/g4NGW2jloXvOJOBQvawTnGhf9Tn+GI0NgUKD3dSGH/kgMqBDIY6Kvi
         Pw9EK9ca5wycclygKz8Kv4vrdE14LDQZ8vH/OVCemw9+u7sWBdCszsu0gUnkfY4hs2vc
         xJ84TabxREIXBSjSfpb1arv/Sn7Gr54qLsl+VoZ8Zeahxsq8yjvWc4Ub9SqIskUGAv+T
         RDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696492954; x=1697097754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1jE1rs0SGGmVIkAxbAG6VkgpYLjht5jCkGxw4rvqNLo=;
        b=HQgz9XID7elFsPcI+7+q1bd7J6GJWeGJkQNOpKnfAskvOuTCwmgF6p44xeziv4sErc
         hDtBEEGg3YgXKAQKbRB/AZvfVnzW2Kf27B7Jeg/28uT2R4TW6SzWbC6IWVj3K9XBfCOK
         oqMstTjc8DGaCSuonJaPYCfDNDkHsizdQWFDpgY+ZRGJ6V+eQrjkVx2XPdOkAgsdf9aX
         X1kiao/e67XRuyvdvfNgtca3CWZ0EFHzGeBkL+1howmULbNq/vDDFMhxHiiGyeAjnvqt
         QCTC/OwGL7ZQ1oZB1T9aDlgT1hetKLOgD4Z6JT/t2A1kFmHEAi10ZTDRcjvkrXbtsl8C
         TGvQ==
X-Gm-Message-State: AOJu0YzY1oJ0W1saOLue5wPDuXg9z+El0zsHJD2z2UKXPfl2hXBWBylH
	AhTuO/aPsOtG0vXPkvFmpIRsUZ6j1e3TR+cXGvrVHw==
X-Google-Smtp-Source: AGHT+IFZAi5qnvYRFbWZQbTZHWudrHDfERccuoYP1wGe6jJ8eq2P4cInYWTeV1tH80RxfIAwh4rdQObJ4jf9J1VzLfc=
X-Received: by 2002:a17:906:5306:b0:9ae:51c8:ded1 with SMTP id
 h6-20020a170906530600b009ae51c8ded1mr3709043ejo.50.1696492953860; Thu, 05 Oct
 2023 01:02:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230925080452.803540-1-jstephan@baylibre.com>
 <20230927101614dd0d974d@mail.local> <CAEHHSvYxWAYjEXBxxyZ-Y4ra3hVPjGxD3+x0GPY_0YYANGxYOw@mail.gmail.com>
 <6f9dd65547742d68a2e3210070ce7efea80343e9.camel@linuxfoundation.org>
 <CAEHHSvYc-mDkfG0ok=thQ8OLcHae7M+rUNkMk7MKjiEd+S2GMA@mail.gmail.com> <CANPvuR=nx1dQcshoXU6m6NATHsSvQmAYc9=WS8+qv5u_8OBTdw@mail.gmail.com>
In-Reply-To: <CANPvuR=nx1dQcshoXU6m6NATHsSvQmAYc9=WS8+qv5u_8OBTdw@mail.gmail.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Thu, 5 Oct 2023 10:02:22 +0200
Message-ID: <CAEHHSvbZUi4Awcv9+d3KkdbURD5DM6aGUOKa_F-7Le-PEoemRQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 0/5] Add bblock helper scripts
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 08:02:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188705

Hi Jose,

I just pushed my branch on poky-contrib
(https://git.yoctoproject.org/poky-contrib/log/?h=3Djstephan/bblock)
with the fix you just suggested.

I do not reproduce the issue locally, so I am not sure this fix the problem=
..
Richard, Alexandre what do you think?  Can you restart a build on autobuidl=
er?

Cheers
Julien

Le lun. 2 oct. 2023 =C3=A0 12:25, Jose Quaresma <quaresma.jose@gmail.com> a=
 =C3=A9crit :
>
> Hi Julien,
>
> Julien Stephan <jstephan@baylibre.com> escreveu no dia s=C3=A1bado, 30/09=
/2023 =C3=A0(s) 15:13:
>>
>> Le mer. 27 sept. 2023 =C3=A0 23:17, Richard Purdie
>> <richard.purdie@linuxfoundation.org> a =C3=A9crit :
>> >
>> > On Wed, 2023-09-27 at 14:47 +0200, Julien Stephan wrote:
>> > > Le mer. 27 sept. 2023 =C3=A0 12:16, Alexandre Belloni
>> > > <alexandre.belloni@bootlin.com> a =C3=A9crit :
>> > > >
>> > > > Hello,
>> > > >
>> > > > I had a build were all the tests passed, then I had this failure:
>> > > >
>> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/=
5812/steps/14/logs/stdio
>> > > >
>> > >
>> > > Hi Alexandre,
>> > > I only see
>> > >
>> > >    bblock.BBLock.test_lock_single_recipe_all_tasks: FAILED
>> > >
>> > > but I can't see the actual error :( Is it possible to have it somewh=
ere?
>> >
>> > I am a bit worried this will be hard to reproduce/debug so I had a loo=
k
>> > at things as I do really want to get things resolved.
>> >
>> > The error log says:
>> >
>> > WARNING: The quilt:do_build sig is computed to be 255536826e64d835fcc6=
b5a277e9a3dacaae75318e608fa2df289bdfa23df40e, but the sig is locked to 0f48=
875f011499948d53edc6abbe9e4efd617d5ef9233055e4b61411cf01cb87 in SIGGEN_LOCK=
EDSIGS_core2-64
>> >
>> > and I couldn't reproduce those stamps in a local build or on the
>> > builder where it failed (once I got access which took a while).
>> >
>> > The "while" is important as I think in the meantime things changed
>> > which effected the results.
>> >
>> > On the autobuilder, "bitbake quilt -S none" generated stamp files for
>> > quilt. I did this for "build" and "build-st-3046552", the latter being
>> > the one where the test failed. There were two different do_build stamp=
s
>> > generated. The diff:
>> >
>> > bitbake-diffsigs tmp/stamps/core2-64-poky-linux/quilt/0.67.do_build.si=
gdata.b502a759bb6bceb6c8ccd76b57db2612501bb66bd9c46ece5f99f8bf16d7ac4a  ../=
build/tmp/stamps/core2-64-poky-linux/quilt/0.67.do_build.sigdata.7cf16a1f87=
d5058e134f3f6fc02612515e28784625413c87d3545e93ae0ab407
>> > NOTE: Reconnecting to bitbake server...
>> > Hash for task dependency diffstat:do_package_write_rpm changed from 41=
171f7938a2ddbe244372c1cc4300d91b7dca425eb8b214c19262e4949a7f18 to 2211ac205=
53e9dddc710970cf1a663412ece5b5a2071e47c5471b3ee01efa2ce
>> >     Hash for task dependency diffstat:do_package changed from f3fe4868=
31eede23d2ebbc1efe2e2510f49f5df6d5d8a8ceb7aa2ddc6e11b1ec to e5ff0ed8a81d802=
2b0981162e9b4e286886d9e281adee81175725072c3d413ec
>> >     Unable to find matching sigdata for diffstat:do_package with hash =
e5ff0ed8a81d8022b0981162e9b4e286886d9e281adee81175725072c3d413ec
>> >
>> > i.e. a couple of dependencies were different.
>> >
>> > bitbake-diffsigs tmp/stamps/core2-64-poky-linux/diffstat/1.65.do_packa=
ge.sigdata.f3fe486831eede23d2ebbc1efe2e2510f49f5df6d5d8a8ceb7aa2ddc6e11b1ec=
  ../build/tmp/stamps/core2-64-poky-linux/diffstat/1.65.do_package.sigdata.=
af8ebe96c5cf424e1094c1599400a56096302e16d0f691daaeec380b963f37b2
>> >
>> > showed no output, i.e. they appear to be the same but different.
>> >
>> > My best guess at what is going on here is hash equivalence causing
>> > problems.
>> >
>> > So in summary, I think the best solution will be to disable hash
>> > equivalence for these tests.
>> >
>> >
>>
>> Hi Richard,
>>
>> Thank you a lot for digging into this!
>> How can I disable the hash equivalence for these tests?
>
>
> Can you try with BB_SIGNATURE_HANDLER using the bibake default config
>
> self.write_config('BB_SIGNATURE_HANDLER =3D "OEBasicHash"')
>
> Jose
>
>>
>> Should I use BB_BASEHASH_IGNORE_VARS for that?
>>
>> I tried the following:
>> self.write_config("BB_BASEHASH_IGNORE_VARS +=3D \"TOPDIR\"")
>>
>> But this doesn't work, I get a lot of errors like the following:
>> ERROR: When reparsing
>> /home/jstephan/upstream/yocto/poky/meta/recipes-devtools/quilt/quilt_0.6=
7.bb:do_packagedata,
>> the basehash value changed from
>> 8b6adb69d1f05eddb3e86143bf9a51060f4fac153742964bb4a3d53bee93d377 to
>> 9dee5dada20d7f8ccfc89ed3114c428af8c96d665234fead22c25fb118f9f62b. The
>> metadata is not deterministic and this needs to be fixed.
>> ERROR: The following commands may help:
>> ERROR: $ bitbake quilt -cdo_packagedata -Snone
>> ERROR: Then:
>> ERROR: $ bitbake quilt -cdo_packagedata -Sprintdiff
>>
>>
>>
>> Cheers
>> Julien
>>
>> > Cheers,
>> >
>>
>> > Richard
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#188459): https://lists.openembedded.org/g/openembedd=
ed-core/message/188459
>> Mute This Topic: https://lists.openembedded.org/mt/101570279/5052612
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [q=
uaresma.jose@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma

