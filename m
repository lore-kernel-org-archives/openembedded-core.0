Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B4E0C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 16:11:44 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web12.8175.1657123901934063958
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 09:11:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nRfjRmew;
 spf=pass (domain: gmail.com, ip: 209.85.167.41,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id t25so26731851lfg.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 09:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nCE825nWS7r7p4uLVRjC1CQGLDwzcaHCGGycukNlcJ4=;
        b=nRfjRmewr9GrNUezjPuot4ioPG+YUcIQRIXEgpBjohr6jN+LkiXnwnvuzgWvlKQ94t
         3EkbHK1zI5yonEzphmw/XRXN4xtl4/RlU41HRhZM0U9ZM7sRZUZduKUtn7Y1DuToF/cX
         W723hFuwQreqrW5YyetUX2CKt130B7tcU5ZfKtniqHu1eDbFClWX/SVJv/iIJGIpCu2X
         63YIaQ2drMtCx4G5G8+NOMMsNiMns2yUCNcR/ALW32NAGnhvpYyquPGbpIniLNnKRo7v
         FFHU7fij7os6oEwHM5nmACDJDHVECVe1N+z8+xE8L4TBCboIRpj8M7gRiPsphRaK2vrD
         /4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nCE825nWS7r7p4uLVRjC1CQGLDwzcaHCGGycukNlcJ4=;
        b=HLJyGW8E/CrZrs5Lo0qC7m9Lah42YSQWCJHfO3tj7IMxe7f+m3QKXhZzolDBzWbyQF
         vlH2dB0/4931U5oM5pqgJ4TxwyBtry0RE79ZJi1bWpnlyT1QpuAuLKC+8gJghRLBDekq
         OaqVka5gVTgynbrhCFppUG4z46OJ8R1P7llmluk2beWBCNW2o+GfW545+H+NOgEm7HCw
         jFIa4BKDP8780XkLNQ2MXvw/zggcgEf/Vw4xm0P4Qv0ouDMAzJPgAeRJoSvDfTVDdLHl
         XTZxVgWcVYhjPKHaD6q9+ZVLCmgBWGcQSiOml9biJTo2IkraATuYKGT0vclR62pxm77L
         QK+A==
X-Gm-Message-State: AJIora8HxUbVdr1h8WgCy5LcKdozNqTmFExWlxYYXrd5AjbU8WIRetoj
	htxVh5a310D61YAvJpFGLG5wMyuLPi9kuAhSoXM=
X-Google-Smtp-Source: 
 AGRyM1vRJFpPF3kQmyUvZqakB8APdEdTjWB71Wtzmm8+8tIYHJCEGqijXtx1SyKwAzfKhQAi3NcZ6rXMT/kWq5uCIkY=
X-Received: by 2002:a05:6512:234c:b0:47f:8fd9:16f3 with SMTP id
 p12-20020a056512234c00b0047f8fd916f3mr27148707lfu.543.1657123899662; Wed, 06
 Jul 2022 09:11:39 -0700 (PDT)
MIME-Version: 1.0
References: <16D467EAE661BF11.21797@lists.openembedded.org>
 <CANPvuRn8mgL6FMWj0143ZTPXY5VyzHfA81kJruqFEq0xdpBgnQ@mail.gmail.com>
 <CA+chaQesUNm2tKAVLH2jx_NY_QXJXwqb597=HTv9HANfQFKnnQ@mail.gmail.com>
In-Reply-To: 
 <CA+chaQesUNm2tKAVLH2jx_NY_QXJXwqb597=HTv9HANfQFKnnQ@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Wed, 6 Jul 2022 11:11:28 -0500
Message-ID: 
 <CAJdd5Ga+tpo=CogC-kwRTuDK=vmK1Pu1adcqK+yiPdsiwqVbYw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] icecc.bbclass: enable networking in all tasks
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: Jose Quaresma <quaresma.jose@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 16:11:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167732

On Wed, Jul 6, 2022 at 10:54 AM Martin Jansa <Martin.Jansa@gmail.com> wrote=
:
>
> FWIW: I have noticed yesterday that some of our builds were able to fetch=
 external dependencies in do_configure again and found that it was caused b=
y this commit.
>
> I understand why this was needed to make icecc.bbclass working again.
>
> Our (LGE) use-case is a bit special, because we inherit icecc by default =
(through INHERIT_DISTRO) even when most builders might have it disabled wit=
h ICECC_DISABLED - it's set this way, so that jenkins builders with icecc e=
nabled produce sstate-cache which can be re-used in local build machines wh=
ere icecc might be disabled.
>
> So to support this I've changed icecc.bbclass to respect ICECC_DISABLED w=
hen setting network varFlag:
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/=
kirkstone&id=3D5bbb735c3285a16bf2ec9548a58b887f93f4900e
>
> but that requires expand to be True in bitbake-worker as in:
> https://git.openembedded.org/bitbake-contrib/commit/?h=3Djansa/2.0&id=3D4=
a6c8e61a545152776c0c76304c4225f79de94d2
>
> But that has parsing performance penalty as discussed with RP on #yocto, =
here is relevant part:
>
> 16:03 < JaMa> RP: do you remember if there was specific reason for using =
expand=3DFalse for network varFlag in https://git.openembedded.org/bitbake/=
commit/?id=3D0746b6a2a32fec4c18bf1a52b1454ca4c04bf543 ? I wanted to change
>               https://git.openembedded.org/openembedded-core/commit/?h=3D=
kirkstone&id=3D25ea276a13a6ac2342c2b0945c8fafe878d56095 to enable network o=
nly when ICECC_DISABLED isn't set
> 16:24 < RP> JaMa: it was efficiency
> 16:24 < RP> JaMa: saved any expansion call
> 16:24 < RP> and any processing to determine if the value was true or fals=
e
> 16:26 < JaMa> RP: and would it be acceptable to enable to support https:/=
/git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/kirkstone=
&id=3D5bbb735c3285a16bf2ec9548a58b887f93f4900e ?
> 16:28 < JaMa> I guess I can delVarFlag when ICECC_DISABLED is set, but th=
en it would delete it even where it was explicitly enabled in the recipe
> 16:32 < RP> JaMa: well, I'd prefer not to as all these things mount up to=
 increase parsing time but I'm starting to feel like I should just not care=
. I'm tired of saying no
> 16:33 < RP> JaMa: you could just equally set or delete those in anon pyth=
on I guess. I really just don't know what to do for the best any more
> 16:34 < JaMa> RP: yes delVarFlag in anon python was my backup plan if the=
 price for expand is too high, thanks
> 16:35 < RP> JaMa: it is sad in that "0" won't work in there are a value t=
oday either but I really don't know what price people want to pay on parsin=
g speed vs usability and consistency
> 16:37 < JaMa> understood, thanks
> 16:39 < RP> JaMa: memories are paging back in, I think I did this to see =
whether anyone complained which they now have. It isn't unreasonable to pro=
perly check it :/
> 16:40 < RP> it is a bit like the cleandirs change for externalsrc. It wil=
l slow things down a lot :/
>
> Does anyone have some strong opinion either way or some other idea how to=
 support this without parsing time penalty?

The only thing I can think of is maybe anonymous python? If that
works, it would at least limit the performance penalty to the case
where icecc.bbclass is inherited.

>
> Regards,
>
> On Mon, Feb 28, 2022 at 5:10 PM Jose Quaresma <quaresma.jose@gmail.com> w=
rote:
>>
>> This patch can't be the right fix but currently the icecc.bbclass doesn'=
t work on master.
>>
>> Jose
>>
>> Jose Quaresma via lists.openembedded.org <quaresma.jose=3Dgmail.com@list=
s.openembedded.org> escreveu no dia quarta, 16/02/2022 =C3=A0(s) 23:27:
>>>
>>> The icecc.bbclass needs network access to work properly.
>>>
>>> Currently I build with icecc inside a container with network isolation =
and
>>> my icecc daemon runs outside of the build container in my host.
>>> The only thing I need to do for using the icecc inside my build contain=
er is
>>> mounting the unix socket /var/run/icecc/iceccd.socket inside the contai=
ner.
>>>
>>> I think we need something like this mount functionality to have access =
to
>>> some sockets connections inside the tasks that runs on the new namespac=
e
>>> created with unshare system call.
>>>
>>> This patch is not a the real solution for the problem and is more like
>>> an hack so we can use the icecc.bbclass again.
>>>
>>> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
>>> ---
>>>  meta/classes/icecc.bbclass | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
>>> index 3bbd2645af..68415b04c7 100644
>>> --- a/meta/classes/icecc.bbclass
>>> +++ b/meta/classes/icecc.bbclass
>>> @@ -428,18 +428,22 @@ set_icecc_env() {
>>>      bbnote "Using icecc tarball: $ICECC_VERSION"
>>>  }
>>>
>>> +do_configure[network] =3D "1"
>>>  do_configure:prepend() {
>>>      set_icecc_env
>>>  }
>>>
>>> +do_compile[network] =3D "1"
>>>  do_compile:prepend() {
>>>      set_icecc_env
>>>  }
>>>
>>> +do_compile_kernelmodules[network] =3D "1"
>>>  do_compile_kernelmodules:prepend() {
>>>      set_icecc_env
>>>  }
>>>
>>> +do_install[network] =3D "1"
>>>  do_install:prepend() {
>>>      set_icecc_env
>>>  }
>>> --
>>> 2.35.1
>>>
>>>
>>>
>>>
>>
>>
>> --
>> Best regards,
>>
>> Jos=C3=A9 Quaresma
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167731): https://lists.openembedded.org/g/openembedde=
d-core/message/167731
> Mute This Topic: https://lists.openembedded.org/mt/89198407/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

