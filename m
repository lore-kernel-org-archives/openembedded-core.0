Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FF5EB64DA
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 18:46:04 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.1281.1689878757920184732
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 11:45:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=YNQxYjVi;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-4fbb281eec6so1832291e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 11:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689878756; x=1690483556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5y96/OQ5w59dmUYywdxEqXb7FBltmXRbDt1ZsbMlMKw=;
        b=YNQxYjVizsrPrKmgoJjYZ/N9BZ/uKbB5MiCzmHfv3UvKsv+CTYEjVLj4/DQxgTIxmT
         C08DP/tIRMkJh9UPXaJOefUWkaVel/s1Rb1w8cg0wRnRL93RU3CkAb0DQ5OisG1exXp1
         +QCHzngmA7G0IlkNmRizsJc7tZvHLwGOeClhopvcSnm6NiemE1WtJWqZBaYsiXj1aWZ7
         lspq/MT/fj92uEmjGtsqMKWHzH+idaKQYZVz0StgRN/OR+v3gGy7+oBLJMSoQ6R94mQv
         rJ7upu3n7xHZ1piFcfJfz65wPsNS2seeZTjZDxlfleboWDpSXI5H0/GUeR0t+tzjTlAu
         xlAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689878756; x=1690483556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5y96/OQ5w59dmUYywdxEqXb7FBltmXRbDt1ZsbMlMKw=;
        b=fBlzYsW6dtZbuVSpczuniImeMIFbe0xh3775sB7EP/Hhc5hqXBjhUiDPCud0MjwAsH
         LkVwE4XihA1wZ0qov1eNGXrrnB8dfD+IlBfE4b2VoABlh/3aiwWFcKc5zYEgwsf3/2MX
         djGqWbidygV87CZkCMJckMCN9PlB6+x4Sebhbf80wNg7QIbQ3Kfpw7S9T59e1msvY770
         GKiEPnFDIRveBv0TftJv7o2prIWrZL/HmRcUCeNof1zGXUfQAzALEWorSgz7lQoIiZY8
         s/Q25wpgphcSL5ULel7eI3i81BVAA4ODvT9B1arc5qbjqQyoanRuitKJBhjSEp3+/FYu
         aqdg==
X-Gm-Message-State: ABy/qLZiXAUXWFK8vhSlqQ6g0wbZMmzGcxXCa9WgxAqjAfh7OXyx0xD3
	AKFAgN6d+BgFzApf0q4obHN/1CCCpKU0PwP6DGU=
X-Google-Smtp-Source: APBJJlG1UC/RbcVbItTtDYsT+ay0YHXynpNClXjj1eJ2Gj47bBVjwwkemSw6hmXvYFTD2oUKCBrbVTWUzwn39MOsR94=
X-Received: by 2002:a05:6512:10d6:b0:4fb:76a5:2325 with SMTP id
 k22-20020a05651210d600b004fb76a52325mr3108109lfg.24.1689878755819; Thu, 20
 Jul 2023 11:45:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230720133655.1266273-1-r.czerwinski@pengutronix.de> <CANNYZj8jB0bA3eQs2ULb40Ox1q2NE_W4LOs8Ch0HVOWS6fhF2g@mail.gmail.com>
In-Reply-To: <CANNYZj8jB0bA3eQs2ULb40Ox1q2NE_W4LOs8Ch0HVOWS6fhF2g@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 20 Jul 2023 20:45:44 +0200
Message-ID: <CANNYZj-e2ze=-GS8i5vN+eqxP=N787TRXkPLt1_Z1C81NLZ=hw@mail.gmail.com>
Subject: Re: [OE-core] [meta][kirkstone][PATCH] json-c: disable -Werror for x86-64
To: Rouven Czerwinski <r.czerwinski@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de, 
	Rouven Czerwinski <rcz@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 18:46:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184654

Also, does the issue occur on oe-core master?

Alex

On Thu, 20 Jul 2023 at 20:44, Alexander Kanavin <alex.kanavin@gmail.com> wr=
ote:
>
> This needs to be reported upstream and the ticket linked (ideally,
> develop a patch to fix the issue). The tweak needs to be :class-native
> only.
>
> Alex
>
> On Thu, 20 Jul 2023 at 15:37, Rouven Czerwinski
> <r.czerwinski@pengutronix.de> wrote:
> >
> > From: Rouven Czerwinski <rcz@pengutronix.de>
> >
> > Disable -Werror using OECMAKE_C_FLAGS on x86-64. This ensures that json=
-c can
> > build on newer distributions where the host compiler is new enough to t=
reat
> > implicit fallthrough warnings as errors:
> >   | NOTE: VERBOSE=3D1 cmake --build /=E2=80=A6/work/x86_64-linux/json-c=
-native/0.15-r0/build --target all --
> >   | [1/34] /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/recipe-sy=
sroot-native/usr/bin/ice/gcc -D_GNU_SOURCE -Djson_c_EXPORTS -I/=E2=80=A6/wo=
rk/x86_64-linux/json-c-native/0.15-r0/json-c-0.15 -I/=E2=80=A6/work/x86_64-=
linux/json-c-native/0.15-r0/build -isystem/=E2=80=A6/work/x86_64-linux/j
> >   son-c-native/0.15-r0/recipe-sysroot-native/usr/include -O2 -pipe -ffu=
nction-sections -fdata-sections -Werror -Wall -Wcast-qual -Wno-error=3Ddepr=
ecated-declarations -Wextra -Wwrite-strings -Wno-unused-parameter -Wstrict-=
prototypes -g -fPIC -D_REENTRANT -MD -MT CMakeFiles/json-c.dir/linkhash.c.o=
 -MF CMakeFiles/json-c.dir/linkhash.c.o.d -o CMakeFiles/json-c.dir/linkhash=
.c.o -c /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c
> >   -0.15/linkhash.c
> >   | FAILED: CMakeFiles/json-c.dir/linkhash.c.o
> >   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/recipe-sysroot-n=
ative/usr/bin/ice/gcc -D_GNU_SOURCE -Djson_c_EXPORTS -I/=E2=80=A6/work/x86_=
64-linux/json-c-native/0.15-r0/json-c-0.15 -I/=E2=80=A6/work/x86_64-linux/j=
son-c-native/0.15-r0/build -isystem/=E2=80=A6/work/x86_64-linux/json-c-n
> >   ative/0.15-r0/recipe-sysroot-native/usr/include -O2 -pipe -ffunction-=
sections -fdata-sections -Werror -Wall -Wcast-qual -Wno-error=3Ddeprecated-=
declarations -Wextra -Wwrite-strings -Wno-unused-parameter -Wstrict-prototy=
pes -g -fPIC -D_REENTRANT -MD -MT CMakeFiles/json-c.dir/linkhash.c.o -MF CM=
akeFiles/json-c.dir/linkhash.c.o.d -o CMakeFiles/json-c.dir/linkhash.c.o -c=
 /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/l
> >   inkhash.c
> >   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/link=
hash.c: In function 'hashlittle':
> >   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/link=
hash.c:367:13: error: this statement may fall through [-Werror=3Dimplicit-f=
allthrough=3D]
> >   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/link=
hash.c:368:3: note: here
> >   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/link=
hash.c:372:13: error: this statement may fall through [-Werror=3Dimplicit-f=
allthrough=3D]
> >   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/link=
hash.c:373:3: note: here
> >   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/link=
hash.c:376:13: error: this statement may fall through [-Werror=3Dimplicit-f=
allthrough=3D]
> >   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/link=
hash.c:377:3: note: here
> >   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/link=
hash.c:380:13: error: this statement may fall through [-Werror=3Dimplicit-f=
allthrough=3D]
> >   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/link=
hash.c:381:3: note: here
> >   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/link=
hash.c:383:13: error: this statement may fall through [-Werror=3Dimplicit-f=
allthrough=3D]
> >   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/link=
hash.c:384:3: note: here
> >   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/link=
hash.c:420:13: error: this statement may fall through [-Werror=3Dimplicit-f=
allthrough=3D]
> >   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/link=
hash.c:421:3: note: here
> >   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/link=
hash.c:421:13: error: this statement may fall through [-Werror=3Dimplicit-f=
allthrough=3D]
> >   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/link=
hash.c:422:3: note: here
> >   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/link=
hash.c:422:13: error: this statement may fall through [-Werror=3Dimplicit-f=
allthrough=3D]
> >   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/link=
hash.c:423:3: note: here
> >   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/link=
hash.c:423:13: error: this statement may fall through [-Werror=3Dimplicit-f=
allthrough=3D]
> >   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/link=
hash.c:424:3: note: here
> >   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/link=
hash.c:424:13: error: this statement may fall through [-Werror=3Dimplicit-f=
allthrough=3D]
> >   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/link=
hash.c:425:3: note: here
> >   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/link=
hash.c:425:13: error: this statement may fall through [-Werror=3Dimplicit-f=
allthrough=3D]
> >   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/link=
hash.c:426:3: note: here
> >   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/link=
hash.c:426:13: error: this statement may fall through [-Werror=3Dimplicit-f=
allthrough=3D]
> >   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/link=
hash.c:427:3: note: here
> >   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/link=
hash.c:427:13: error: this statement may fall through [-Werror=3Dimplicit-f=
allthrough=3D]
> >   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/link=
hash.c:428:3: note: here
> >   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/link=
hash.c:428:13: error: this statement may fall through [-Werror=3Dimplicit-f=
allthrough=3D]
> >   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/link=
hash.c:429:3: note: here
> >   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/link=
hash.c:429:13: error: this statement may fall through [-Werror=3Dimplicit-f=
allthrough=3D]
> >   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/link=
hash.c:430:3: note: here
> >   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/link=
hash.c:430:13: error: this statement may fall through [-Werror=3Dimplicit-f=
allthrough=3D]
> >   | /=E2=80=A6/work/x86_64-linux/json-c-native/0.15-r0/json-c-0.15/link=
hash.c:431:3: note: here
> >   | cc1: all warnings being treated as errors
> >
> > Passing -Wno-error x86-64 is the minimal invasive fix for older kirksto=
ne
> > releases.
> >
> > Signed-off-by: Rouven Czerwinski <rcz@pengutronix.de>
> > ---
> >  meta/recipes-devtools/json-c/json-c_0.15.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/recipes-devtools/json-c/json-c_0.15.bb b/meta/recipes=
-devtools/json-c/json-c_0.15.bb
> > index 7cbed55b3b..749eb078f8 100644
> > --- a/meta/recipes-devtools/json-c/json-c_0.15.bb
> > +++ b/meta/recipes-devtools/json-c/json-c_0.15.bb
> > @@ -18,6 +18,8 @@ RPROVIDES:${PN} =3D "libjson"
> >
> >  inherit cmake ptest
> >
> > +OECMAKE_C_FLAGS:append:x86-64 =3D " -Wno-error"
> > +
> >  do_install_ptest() {
> >      install -d ${D}/${PTEST_PATH}/tests
> >      install ${B}/tests/test* ${D}/${PTEST_PATH}/tests
> > --
> > 2.39.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#184639): https://lists.openembedded.org/g/openembed=
ded-core/message/184639
> > Mute This Topic: https://lists.openembedded.org/mt/100255913/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

