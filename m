Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA17BC3DA6E
	for <webhook@archiver.kernel.org>; Sun, 31 Dec 2023 10:03:22 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.217484.1704016997102079338
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Dec 2023 02:03:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=clRu2pWf;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50e7e6283bdso4873752e87.1
        for <openembedded-core@lists.openembedded.org>; Sun, 31 Dec 2023 02:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704016995; x=1704621795; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KwUGTzvGlQ9IjNchMvaNWJ97bISZ28BBAAqmW2n98CY=;
        b=clRu2pWfxlXejU6H6tH//TQhd5zK/p9+IqZCoKPrC5afBoWTjZvafBsqt9oJ/HiX6E
         wGlfH4ezw84rsOl56nFYj8j5CfukzBOq66pYKk8SDp9t1YdEL986mPoBw6Pja/hxRK78
         S6tKwtRVEJG9wPFRmd9w1eEWLpPyzuA8NuSN4hdZb8LqRpPO7tOftdY/fxtFP3t+VjoX
         HZ9ftqJEoUQEjAgX+P1iYM9n2qaOjFMMFHy7GGDXsg1vVUrdUn2yqEdhvXepaEq9XE7H
         BA68SYbcPZw8ZtBWkVOI+/b/ka1npCOYIUU2gfBCBOwzyHMg2dUeG9FbhomiZBHMcWe7
         60mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704016995; x=1704621795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KwUGTzvGlQ9IjNchMvaNWJ97bISZ28BBAAqmW2n98CY=;
        b=RNzS6gGhnAf6+NYXAZkG5+Vvw3yxeYKnXSf4a0MT4cOZgSZ86zEHoXzaUuGENDHlRI
         ZOCsI/G6BLZCOKDGCk1Pufq4dRK8AK/BDOkAx3B94uZ0RQK3XfmV5Jz1scqLaI3FgoDG
         Puu04hFZzrUnai3VGcJVnC8qP2grp8fnJQEBya0Ekvt1SY7mMpm0yW/rFuX+KPJ6POWJ
         Pg8OYQabywWNcKPxa23w44YkuDyyUYsDoidpgQcafk9pZ1pqos6jgIkNaViwKfDUrRy+
         c7uMfyvYV4UHw1D3xLvLuHPE2c96mgaA+Tqspq3MPaQUk2zWjMtw4hr9FrXpcuEVrV+C
         nW2w==
X-Gm-Message-State: AOJu0YyfcUfYKU9i5mg5V+NqI+qsVZfBb2ElP5+KZD+goR3irbrEo8S4
	pfl2j1RQS7pOKUiT8Oy+rSQiKLAHpi0qP4vnXlo=
X-Google-Smtp-Source: AGHT+IFK5JCeVEx1sQ5KkkdvcR5VPy4FjqsVXx1/tktXp7jF8qHA89bHlWZoYkjECH6tQtD6MXp3XY6k/nwM0naOCbw=
X-Received: by 2002:a05:6512:6d3:b0:50e:9132:5105 with SMTP id
 u19-20020a05651206d300b0050e91325105mr962857lff.181.1704016994884; Sun, 31
 Dec 2023 02:03:14 -0800 (PST)
MIME-Version: 1.0
References: <3cd66d19-6e0c-4b1b-a990-723cd445698f@gmail.com>
 <1be4aa623d61e40f52466e1cc3b65c4543b39b20.camel@linuxfoundation.org>
 <25c15f7d-d1e8-427f-a1ab-6edb854daaa0@gmail.com> <CA+chaQdMrEWZkXfyX=cGDt9uD0JodDFK68cedzGVN2fMDRh+Qg@mail.gmail.com>
 <29c6bdd6-72bf-48f6-9a8a-eb15c1225ba1@gmail.com> <06070e71-e3a7-4a14-ae3e-68397f1cc0ff@windriver.com>
 <CA+chaQcPNEQZSkwD6P9f0Xbf3q7jTp5NAPL56yow7bPAjSBngw@mail.gmail.com> <d11ce5f1-161b-4bd2-9bc5-2bd12d7659a9@windriver.com>
In-Reply-To: <d11ce5f1-161b-4bd2-9bc5-2bd12d7659a9@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 31 Dec 2023 11:03:03 +0100
Message-ID: <CANNYZj_L=rEwhgdWLchdzHYgdWMrkZ4rizCKvmF8hXotBcKgnw@mail.gmail.com>
Subject: Re: [OE-core] bitbake-server does not exit after build ends
To: randy.macleod@windriver.com
Cc: Martin Jansa <martin.jansa@gmail.com>, "steve@sakoman.com" <steve@sakoman.com>, zboszor@gmail.com, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Dec 2023 10:03:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193086

For what it's worth, I am not seeing any of these issues (hanging
processes after bitbake exit, timeouts on world builds with all
meta-oe-layers) with python 3.12 provided by buildtools-tarball. The
issues are probably real, but it's also possible python 3.12 per se is
not to blame.

It would probably help if you check if what you're seeing occurs with
python 3.12 from the tarball, which you can build from this branch:
https://git.yoctoproject.org/poky-contrib/log/?h=3Dakanavin/py3.12
(the log in the web ui isn't updated yet, I just pushed)

Alex

On Fri, 22 Dec 2023 at 00:06, Randy MacLeod via lists.openembedded.org
<randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>
> On 2023-12-21 1:56 p.m., Martin Jansa wrote:
>
> On Thu, Dec 21, 2023 at 7:47=E2=80=AFPM Randy MacLeod <randy.macleod@wind=
river.com> wrote:
>>
>> On 2023-11-28 4:26 a.m., Zoltan Boszormenyi via lists.openembedded.org w=
rote:
>>
>> So it's not just Fedora, but Python 3.12 in general.
>>
>> Googling for problem with threads + fork reveals that
>> it is indeed an issue even in C / POSIX: only the thread
>> executing fork() will become part of the new process,
>> but not the main process starting the thread or any
>> other threads from the original process.
>>
>> The warning is justified, and apparently the issue
>> not occurring in bitbake with previous Python versions
>> is pure luck.
>>
>> FYI: Fixed in Fedora 39 if you update to get python-3.12.1-1 or later.
>
>
> But this fixes it only for bitbake master, right?
>
> Even master might still have some problems.
> I can do a simple build of a package but in doing:
>
> $ bitbake -k world
>
> I see:
> NOTE: No reply from server in 30s (for command ping at 17:50:35.510798)
>
> After some time.
>
> I'm not going to try to debug it at this point in the day/year!
>
>
> With bitbake 2.0 used in kirkstone I still see bitbake processes still ru=
nning after the build is finished.
>
> I didn't try kirkstone. Maybe Steve has that on his list of things to do =
in his spare time! ;-)
>
> ../Randy
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192854): https://lists.openembedded.org/g/openembedde=
d-core/message/192854
> Mute This Topic: https://lists.openembedded.org/mt/102826186/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

