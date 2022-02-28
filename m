Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DD37C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 19:34:41 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web08.2000.1646076880150019753
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 11:34:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=o+uaHI9s;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id a1so14330229qvl.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 11:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=unAswOzzRwqPiYBb0KpFZ0SHB2dIOvfHuMK9QTAOVj0=;
        b=o+uaHI9s9L6lKQm1YWhzRFbosd9hGEIhintsSSmllEgwsW9gm6PMZH/NhhMsERIbQS
         JOiam9KHNVoc7wydQqoTPo9JqvmN8aOlBzl+6Tf1ZEtVyEukSPpTVuQGvqbDKdOvSjy0
         UAy/o/EN+kNXRc/pIa+cg/dfpN8iA/ZXxF8n56UxrMWHONYkRNVsElTHTa5lgnFcSPPv
         U41SRsY3dEGfXMI3j9dQKGaSzg7uYgumjFdH2k+GxvvCKMx2rOqDm+aOrTB/kMVzOFCe
         NSVlQJKdQ2m1dHk1kwL6cLR1rTWMSTSNptsnXM40OsTXUToHFfikIuKk6Wp5UhD3hG0c
         SAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=unAswOzzRwqPiYBb0KpFZ0SHB2dIOvfHuMK9QTAOVj0=;
        b=y3sK0s7T4XHJ1O0CptR2VygM/cDc3uwIDftI3N09DRt21nlv6NMemKHTaGrizydBlz
         ma1s3srLYY8KFithGWtiVSM0hqvWuUYHxgXHjrhxwl0qbtcppPz6O4G0U4X+O2xn3aO+
         U1QW1UBjjeSwAd277Nd1OXgMGu1XgjtyWVyWKnlP8CiI/bB++gyQT+rrInANlExcW+QM
         MXZfGSb9C/LEtIB2mWABBswBxkUipfBowjvlOLJuryfWmQsIxjmuBAXVjvhq+2qfgQw1
         wJDvXjytJ8Mz66OHubGxpuvQSAEF3+XHZ953SYQpWmEmukCOqj6IH+v3pmS/faZllt+q
         Fc4g==
X-Gm-Message-State: AOAM532W50MeEm27wPCsUNVneh4DQgmMpLplNkn9ToC6vfqPMCzgp3si
	n3wG7snY8wtOqrAyEvVqEXRpogFL1HeVke4KgSc=
X-Google-Smtp-Source: 
 ABdhPJyrTZcxK/JNQmh/naIgja42dSP/td3bQfJE036B9HtF+yab+dFLPngZGZhyL6y1qT56ui5o+N1ailHYo9upR54=
X-Received: by 2002:a05:6214:1c0d:b0:432:6487:9c53 with SMTP id
 u13-20020a0562141c0d00b0043264879c53mr14997098qvc.36.1646076879125; Mon, 28
 Feb 2022 11:34:39 -0800 (PST)
MIME-Version: 1.0
References: <20220228160600.42164-1-quaresma.jose@gmail.com>
 <CAMKF1soU_PaiWrsQ32grZmbSEUe90TUbj+fJ1sPOz4saEi=yZQ@mail.gmail.com>
 <CANPvuRne4_JgzWAAdN_tr_cAzSZ5yui9X5yC5EDNYN+WyfAiXA@mail.gmail.com>
In-Reply-To: 
 <CANPvuRne4_JgzWAAdN_tr_cAzSZ5yui9X5yC5EDNYN+WyfAiXA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Feb 2022 11:34:12 -0800
Message-ID: 
 <CAMKF1sqm7jaMs-N3L4GV0jYBOCgT4UqBaqOF5=GfNq5bk7-z1A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] buildhistory.bbclass: create the buildhistory
 directory when needed
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 19:34:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162515

On Mon, Feb 28, 2022 at 10:06 AM Jose Quaresma <quaresma.jose@gmail.com> wr=
ote:
>
>
>
> Khem Raj <raj.khem@gmail.com> escreveu no dia segunda, 28/02/2022 =C3=A0(=
s) 17:12:
>>
>> On Mon, Feb 28, 2022 at 8:06 AM Jose Quaresma <quaresma.jose@gmail.com> =
wrote:
>> >
>> > When the BUILDHISTORY_RESET is enabled we need to move the
>> > content from BUILDHISTORY_DIR to BUILDHISTORY_OLD_DIR but
>> > when we start a clean build in the first run we don't have the
>> > BUILDHISTORY_DIR so the move of files will fail.
>> >
>> > | ERROR: Command execution failed: Traceback (most recent call last):
>> > |  File "/xxx/poky/bitbake/lib/bb/command.py", line 110, in runAsyncCo=
mmand
>> > |    commandmethod(self.cmds_async, self, options)
>> > |  File "/xxx/poky/bitbake/lib/bb/command.py", line 564, in buildTarge=
ts
>> > |    command.cooker.buildTargets(pkgs_to_build, task)
>> > |  File "/xxx/poky/bitbake/lib/bb/cooker.py", line 1481, in buildTarge=
ts
>> > |    bb.event.fire(bb.event.BuildStarted(buildname, ntargets), self.da=
tabuilder.mcdata[mc])
>> > |  File "/xxx/home/builder/src/base/poky/bitbake/lib/bb/event.py", lin=
e 214, in fire
>> > |    fire_class_handlers(event, d)
>> > |  File "/xxx/poky/bitbake/lib/bb/event.py", line 121, in fire_class_h=
andlers
>> > |    execute_handler(name, handler, event, d)
>> > |  File "/xxx/poky/bitbake/lib/bb/event.py", line 93, in execute_handl=
er
>> > |    ret =3D handler(event)
>> > |  File "/xxx/poky/meta/classes/buildhistory.bbclass", line 919, in bu=
ildhistory_eventhandler
>> > |    entries =3D [ x for x in os.listdir(rootdir) if not x.startswith(=
'.') ]
>> > | FileNotFoundError: [Errno 2] No such file or directory: '/xxx/buildh=
istory'
>> >
>> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
>> > ---
>> >  meta/classes/buildhistory.bbclass | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhis=
tory.bbclass
>> > index 49797a6701..d416512f6d 100644
>> > --- a/meta/classes/buildhistory.bbclass
>> > +++ b/meta/classes/buildhistory.bbclass
>> > @@ -896,6 +896,8 @@ python buildhistory_eventhandler() {
>> >                  if os.path.isdir(olddir):
>> >                      shutil.rmtree(olddir)
>> >                  rootdir =3D e.data.getVar("BUILDHISTORY_DIR")
>> > +                if not os.path.exists(rootdir):
>> > +                    bb.utils.mkdirhier(rootdir)
>>
>> I wonder if the check is needed. Is there any downside if we did not
>> check for it pre-existing ?
>>
>
> The mkdirhier uses the python os.makedirs so it works like 'mkdir -p'
> but there are more places in the class that check if the directory exists
> before creating it.
> Use the os.path.exists is more consistent with what exists in class but
> I can send a v2 without the check.

yeah, I am not sure if there is advantage of checking before creating here.

>
> Jose
>
>> >                  entries =3D [ x for x in os.listdir(rootdir) if not x=
.startswith('.') ]
>> >                  bb.utils.mkdirhier(olddir)
>> >                  for entry in entries:
>> > --
>> > 2.35.1
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#162508): https://lists.openembedded.org/g/openembe=
dded-core/message/162508
>> > Mute This Topic: https://lists.openembedded.org/mt/89453662/1997914
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >
>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma

