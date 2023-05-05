Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60056C77B7C
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 17:32:50 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web10.566.1683307966888753348
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 10:32:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=QvVEzc1b;
 spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3311691ebd0so5071255ab.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 10:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683307966; x=1685899966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVpEoXdP+2bjLwTW1k9nbiCW2Br7TWfOGUKI+GZr600=;
        b=QvVEzc1bDGlLbZuWtpDbCsvWXUVTwAXl69c5mYhBFw1NBHOVb4XWkITs9W9101gHi6
         gD3NE7zqloxoEOXo5lElHW1dsihcdbe8vNnHA2xVtstsbaCG5FqlMDb49cXQP+ndghkp
         QU/XBqBfv9MbCoyjSH4AVMYitD7UNxnfPuR7tXwuDhOJZw2nTZnkks2yH9a6fW7al2wa
         XjJjfM6nbkrluDS1uvtl2KDhni6Ucswx5dT3ZeivaWxxw3LICIev6TQR74GRGWYLJHBl
         5a9eiIXwi5QE7ii2ToslvfavWOlrn5Hsqj5DaHapeGw0yOGta0YuMLdt5lneRKMNdBae
         gA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683307966; x=1685899966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bVpEoXdP+2bjLwTW1k9nbiCW2Br7TWfOGUKI+GZr600=;
        b=S4l8VjSwuJXgyUIM8b/MiVhHPM3ws4ZUCMiFKSU9xew1Fwsa/CnZUBBk1W5cCbhljd
         S+Gd/uZK+O5sbLABsoc2ehP5EsJOWNqKJOnm6RYmvWPXncUUP+80w6W/+EyChSCXSgR0
         OW5/NxVBVP13M0GpuotNf5/E6iWaXLp5VuUJvPaeynUSc/IZR20zQM75AeTRZTCwEXw5
         keX36Xx1+uqaVHEUvX2usn6RuBxA9jgNaJfxkQpAvkRzIT19zuk73NomcATWvztuif35
         1Y2qoXkwcMY3NkWE/Cj/yJZl8T/cCnRi2otGTrAI74GSMMphcW7I15g3RQYtPlD4vWqu
         9yMg==
X-Gm-Message-State: AC+VfDwdCDpEar9yVco1B24ATdMjdFdLIbBIx/4LKfb2iAIe5IXWajZj
	oByNlTzcs4KfiVW9AEglxeQT9nPbPhbICca48vs=
X-Google-Smtp-Source: ACHHUZ78DKWQ1/iUuNBcAq7oMUugbFtRXyIzi+WBmEJz/oQFRTYqhg3NqjmsR7U0DxO/Xjx5nMe9yipX+V6EqClQ49U=
X-Received: by 2002:a6b:da04:0:b0:769:c95b:29d3 with SMTP id
 x4-20020a6bda04000000b00769c95b29d3mr1323704iob.14.1683307966043; Fri, 05 May
 2023 10:32:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230416103052.28268-1-christoph.lauer@email.de>
 <27b6976546dae12e92dd3af28f657c02eca4afe8.camel@linuxfoundation.org>
 <CANPvuRnSPULJzxC0qt=sQLWS5jyx4OkJ2cQobDzHs0LmmBG6MQ@mail.gmail.com>
 <CADkTA4N9Sypxccr0OU6KQxPK5rbsL_mNFGaJ2Zn_jYHL1tNSEg@mail.gmail.com>
 <652908a6640ffc911d46613cb99159086131416f.camel@linuxfoundation.org>
 <CADkTA4MBh46pqJoQjW4dhOc3Sw-4+rr-u4d48OPSs9eC1VPx8A@mail.gmail.com>
 <CANPvuR=M0-ndA609d2i43rgVVSPrHzEeo5o7orRjmeR9BA5_QQ@mail.gmail.com>
 <CADkTA4MMj6qUNHyjNV6QxE0iZAwA8=Ur6Ks4_7ETJtmrv6TrNA@mail.gmail.com>
 <CANPvuRmb7Kh3hgjZEcr1vU4czrULvLYabk3apBERQbo4RJ8y3w@mail.gmail.com>
 <afb0f1d6405256d9dfc6bd5bc0a642ddb1dd82c5.camel@linuxfoundation.org>
 <175785898B60CE37.9727@lists.openembedded.org> <CADkTA4MQty2wAcBrDGT=vqVeAHpMbzKjpf8-6xbH7UKa2R6wsg@mail.gmail.com>
 <7b254d25-03b9-5d0a-4257-4d43c50d069f@email.de> <CADkTA4OPx0hNnp1MfAyB45H8j4Degyz9JtVcXxK_sta=X1AKaw@mail.gmail.com>
 <CANPvuRnWCXKCyYEmrLfGRxmrC0w4dDnSNN_H3-LfmOyctQ9XwA@mail.gmail.com>
 <CADkTA4MwPcPnqQaAPDP-5vR=aEzKFDq9OaA=NA0hspKB2Nzz6w@mail.gmail.com>
 <CANPvuRk3UyMX7Szh7gc5Ha5E2gWZaOVZXWzuZEd66-zavpnS9Q@mail.gmail.com>
 <1759F4E68EA4E1CC.26969@lists.openembedded.org> <CADkTA4PhAgXd4F+V9hwXW6Fqg3T5ztc5Zr5BBfSDN6AFsYV9gw@mail.gmail.com>
 <175B9A4D7B213CC1.28444@lists.openembedded.org> <CANPvuRkqDP_uoHdFdjKWuKsWY_h5CzCDjOfydQ1LgK3=hg=f7g@mail.gmail.com>
In-Reply-To: <CANPvuRkqDP_uoHdFdjKWuKsWY_h5CzCDjOfydQ1LgK3=hg=f7g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 5 May 2023 13:32:34 -0400
Message-ID: <CADkTA4NKXAC5sVF+kkD95G4KsMZw8SSsi64yd22BnoxVo84Lqg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] make-mod-scripts: preserve libraries when
 rm_work is used
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Christoph Lauer <Christoph.Lauer@email.de>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Christoph Lauer <christoph.lauer@xtronic.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 17:32:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180961

On Fri, May 5, 2023 at 6:24=E2=80=AFAM Jose Quaresma <quaresma.jose@gmail.c=
om> wrote:
>
> Hi Bruce,
>
> Jose Quaresma via lists.openembedded.org <quaresma.jose=3Dgmail.com@lists=
.openembedded.org> escreveu no dia quarta, 3/05/2023 =C3=A0(s) 11:09:
>>
>>
>>
>> Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia ter=C3=A7a, 2/=
05/2023 =C3=A0(s) 22:12:
>>>
>>> Attached is v2 of the patch. I've consolidated the suggested changes.
>>>
>>> I'm soaking it a bit longer, and then will send it as part of my next
>>> consolidated pull request.
>>
>>
>> I will do some more tests with the v2 and post my comment later if anyth=
ing new comes up.
>
>
> Nothing new and the v2 patch works pretty well in my kernels.
>

Awesome. Thanks for the test and update!

Bruce

> Jose
>
>>
>>
>> Jose
>>
>>>
>>>
>>> Bruce
>>>
>>> On Thu, Apr 27, 2023 at 9:26=E2=80=AFPM Bruce Ashfield via
>>> lists.openembedded.org
>>> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>>> >
>>> > On Thu, Apr 27, 2023 at 6:32=E2=80=AFPM Jose Quaresma <quaresma.jose@=
gmail.com> wrote:
>>> > >
>>> > > Hi Bruce,
>>> > >
>>> > > I have been testing your patch and have some comments.
>>> > > In some of my kernels I don't have the pkg-config changes and so I =
have some fails linking the scripts/sign-file
>>> > > because for static linking with the libcrypto we need the -ldl -pth=
read.
>>> > >
>>> > > To fix my build I need to override the CRYPTO_LIBS in my kernel bec=
ause they use the hardcoded pkg-config
>>> > > where it is not possible to pass the --static argument.
>>> > >
>>> > > With following change on top of your patch I can build moist of my =
kernels:
>>> > >
>>> > >         export HOSTLDFLAGS=3D"-lz"
>>> > >
>>> > > +       HOSTPKG_CONFIG=3D"pkg-config --static"
>>> > > +       # override CRYPTO_LIBS since HOSTPKG_CONFIG lands only in v=
5.19-rc1
>>> > > +       # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/=
linux.git/commit/?id=3Dd5ea4fece4508bf8e72b659cd22fa4840d8d61e5
>>> > > +       CRYPTO_LIBS=3D"$(pkg-config --static --libs libcrypto 2>/de=
v/null || echo -lcrypto)"
>>> > > +
>>> > >         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>>> > >         for t in prepare scripts_basic scripts; do
>>> > >                 oe_runmake CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" =
\
>>> > >                 AR=3D"${KERNEL_AR}" OBJCOPY=3D"${KERNEL_OBJCOPY}" \
>>> > > -               HOSTPKG_CONFIG=3D"pkg-config --static" \
>>> > > +               HOSTPKG_CONFIG=3D"${HOSTPKG_CONFIG}" CRYPTO_LIBS=3D=
"${CRYPTO_LIBS}" \
>>> > >                 -C ${STAGING_KERNEL_DIR} O=3D${STAGING_KERNEL_BUILD=
DIR} $t
>>> > >         done
>>> > >
>>> > >
>>> > > I think belive that the LIBELF_LIBS needs the same fix for the case=
s where HOSTPKG_CONFIG is not available.
>>> > > Also I think there is a typo in the LIBELF_LIBS because you first p=
opulate it with pkg-config but on the export the variable is redefined
>>> > > with the HOST_LIBELF_LIBS. I made a litle change too on that:
>>> > >
>>> > >         # for pre-5.15 kernels
>>> > > -       LIBELF_LIBS=3D$(pkg-config libelf --libs 2>/dev/null || ech=
o -lelf)
>>> > > -       export LIBELF_LIBS=3D"$HOST_LIBELF_LIBS -lz"
>>> > > +       LIBELF_LIBS=3D$(pkg-config --static libelf --libs 2>/dev/nu=
ll || echo -lelf)
>>> > > +       export LIBELF_LIBS=3D"$LIBELF_LIBS -lz"
>>> > >         export HOSTLDFLAGS=3D"-lz"
>>> > >
>>> > > Thanks for you help.
>>> >
>>> > Those are definitely plausible tweaks to the patch, I was providing
>>> > the two techniques for that reason, and you've used them
>>> > appropriately.
>>> >
>>> > Let me roll your changes into my patch, re-test and I'll submit it to
>>> > the mailing list as a v2.
>>> >
>>> > Thanks for the testing, and fixup, I knew there would be things missi=
ng! :)
>>> >
>>> > Bruce
>>> >
>>> > >
>>> > > Jose
>>> > >
>>> > > Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia segunda, =
24/04/2023 =C3=A0(s) 20:25:
>>> > >>
>>> > >> On Mon, Apr 24, 2023 at 6:30=E2=80=AFAM Jose Quaresma <quaresma.jo=
se@gmail.com> wrote:
>>> > >> >
>>> > >> >
>>> > >> >
>>> > >> > Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia doming=
o, 23/04/2023 =C3=A0(s) 20:55:
>>> > >> >>
>>> > >> >> On Sat, Apr 22, 2023 at 9:06=E2=80=AFAM Christoph Lauer
>>> > >> >> <Christoph.Lauer@email.de> wrote:
>>> > >> >> >
>>> > >> >> > Am 21.04.23 um 22:28 schrieb Bruce Ashfield:
>>> > >> >> > > On Wed, Apr 19, 2023 at 11:03=E2=80=AFPM Bruce Ashfield via
>>> > >> >> > > lists.openembedded.org
>>> > >> >> > > <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>>> > >> >> > >>
>>> > >> >> > >> On Wed, Apr 19, 2023 at 6:54=E2=80=AFPM Richard Purdie
>>> > >> >> > >> <richard.purdie@linuxfoundation.org> wrote:
>>> > >> >> > >>>
>>> > >> >> > >>> On Wed, 2023-04-19 at 23:34 +0100, Jose Quaresma wrote:
>>> > >> >> > >>>> Hi,
>>> > >> >> > >>>>
>>> > >> >> > >>>> Not related with the previous discussion but just for
>>> > >> >> > >>>> your information.
>>> > >> >> > >>>> The rm_work.bbclass has an exception for the kernel reci=
pes [1].
>>> > >> >> > >>>> So I don't understand why we can't do the same for the m=
ake-mod-
>>> > >> >> > >>>> scripts
>>> > >> >> > >>>> who is the twin brother of all these kernel recipes.
>>> > >> >> > >>>>
>>> > >> >> > >>>> [1]
>>> > >> >> > >>>> https://git.openembedded.org/openembedded-core/tree/meta=
/classes/rm_work.bbclass#n168
>>> > >> >> > >>>
>>> > >> >> > >>> Ideally we wouldn't be doing this for the kernel recipes.
>>> > >> >> > >>>
>>> > >> >> > >>> There is also a big difference to that and the proposed p=
atch. The
>>> > >> >> > >>> proposed patch was preserving a specific directory rather=
 than an
>>> > >> >> > >>> entire recipe. Removing the task stamps but leaving a sma=
ll piece of
>>> > >> >> > >>> WORKDIR is quite different to preserving WORKDIR and STAM=
PS for a
>>> > >> >> > >>> specific recipe. The former is not tested and will break =
things. The
>>> > >> >> > >>> latter is better tolerated by bitbake.
>>> > >> >> > >>
>>> > >> >> > >> Agreed.
>>> > >> >> > >>
>>> > >> >> > >> Plus, I am working on this now.
>>> > >> >> > >>
>>> > >> >> > >> I have static linking of the scripts/tools working, but wh=
at I haven't
>>> > >> >> > >> figured out is how to do that without patching the Makefil=
es.
>>> > >> >> > >>
>>> > >> >> > >
>>> > >> >> > > It turned out to be quite the battle to get older kernels w=
hat was
>>> > >> >> > > required for static linking of the tools.
>>> > >> >> > >
>>> > >> >> > > Attached is my WIP patch. I'm out of the office early next =
week, but
>>> > >> >> > > will revisit it once I'm back.
>>> > >> >> > >
>>> > >> >> > > Bruce
>>> > >> >> > >
>>> > >> >> > >> Next up will be some rpath trickery.
>>> > >> >> > >>
>>> > >> >> > >> Bruce
>>> > >> >> > >>
>>> > >> >> > >>>
>>> > >> >> > >>> So yes, we could do the same. I'm sure there will be othe=
r recipes
>>> > >> >> > >>> people want to preserve for other reasons. Where do we dr=
aw the line?
>>> > >> >> > >>> We could preserve everything and drop rm_work, then we wo=
uldn't have
>>> > >> >> > >>> these problems? :)
>>> > >> >> > >>>
>>> > >> >> > >>> Cheers,
>>> > >> >> > >>>
>>> > >> >> > >>> Richard
>>> > >> >> > >>
>>> > >> >> > >>
>>> > >> >> > >>
>>> > >> >> > >> --
>>> > >> >> > >> - Thou shalt not follow the NULL pointer, for chaos and ma=
dness await
>>> > >> >> > >> thee at its end
>>> > >> >> > >> - "Use the force Harry" - Gandalf, Star Trek II
>>> > >> >> > >>
>>> > >> >> > >>
>>> > >> >> > >>
>>> > >> >> > >
>>> > >> >> > >
>>> > >> >> >
>>> > >> >> > Thank you for your work, I see you put some time and effort i=
nto it.
>>> > >> >> > HOSTPKG_CONFIG is, as you mentioned, available since kernel v=
ersion 5.19
>>> > >> >>
>>> > >> >> Yes, I realize that and documented it in the patch ... but I al=
so
>>> > >> >> tested on pre-5.19 kernels and what I have in the patch works. =
Did it
>>> > >> >> not work in your testing ?
>>> > >> >
>>> > >> >
>>> > >> > I will test the patch on a couple of kernel versions with some o=
f them pre-5.19
>>> > >> > but all in 5 major versions.
>>> > >> > I will say something about my results later this week.
>>> > >>
>>> > >> 5.15-stable also has the pkg-config changes
>>> > >>
>>> > >> Bruce
>>> > >>
>>> > >> >
>>> > >> > Thanks for working on this one.
>>> > >> >
>>> > >> > Jose
>>> > >> >
>>> > >> >>
>>> > >> >>
>>> > >> >> > (see kernel patch [1]), so we need a way to call 'pkg-config =
--static'
>>> > >> >> > with pre-5.19 kernels. A way without modifying the Makefile w=
ould be to
>>> > >> >> > modify openssls pkg-config in recipe-sysroot-native of make-m=
od-script,
>>> > >> >> > so 'pkg-config --libs' actually shows the dependencies of 'pk=
g-config
>>> > >> >> > --static --libs', but it's a bit hacky.
>>> > >> >>
>>> > >> >> Already considered, and discarded. That's not going to fly.
>>> > >> >>
>>> > >> >> >
>>> > >> >> > Also fully-static executables still need the same glibc durin=
g runtime
>>> > >> >> > that they were built with, which makes them error-prone and i=
s generally
>>> > >> >> > discouraged. As an alternative, we could build dynamic execut=
ables that
>>> > >> >> > use the static libcrypto library. The linker links by default=
 against
>>> > >> >> > the shared library, so we could remove them from recipe-sysro=
ot-native
>>> > >> >> > to force linking against the static library (again, somewhat =
hacky).
>>> > >> >>
>>> > >> >> Also considered and discarded.
>>> > >> >>
>>> > >> >> As do the dynamically linked ones for the c runtime. We aren't =
talking
>>> > >> >> about using these outside of a single build and they are genera=
ted on
>>> > >> >> the fly, so again, there's very little concern about runtimes c=
hanging
>>> > >> >> after linking.. There's less risk in static than in the alterna=
tives.
>>> > >> >>
>>> > >> >> Bruce
>>> > >> >>
>>> > >> >>
>>> > >> >> >
>>> > >> >> > [1]
>>> > >> >> > https://github.com/torvalds/linux/commit/d5ea4fece4508bf8e72b=
659cd22fa4840d8d61e5
>>> > >> >>
>>> > >> >>
>>> > >> >>
>>> > >> >> --
>>> > >> >> - Thou shalt not follow the NULL pointer, for chaos and madness=
 await
>>> > >> >> thee at its end
>>> > >> >> - "Use the force Harry" - Gandalf, Star Trek II
>>> > >> >
>>> > >> >
>>> > >> >
>>> > >> > --
>>> > >> > Best regards,
>>> > >> >
>>> > >> > Jos=C3=A9 Quaresma
>>> > >>
>>> > >>
>>> > >>
>>> > >> --
>>> > >> - Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait
>>> > >> thee at its end
>>> > >> - "Use the force Harry" - Gandalf, Star Trek II
>>> > >
>>> > >
>>> > >
>>> > > --
>>> > > Best regards,
>>> > >
>>> > > Jos=C3=A9 Quaresma
>>> >
>>> >
>>> >
>>> > --
>>> > - Thou shalt not follow the NULL pointer, for chaos and madness await
>>> > thee at its end
>>> > - "Use the force Harry" - Gandalf, Star Trek II
>>> >
>>> >
>>> >
>>>
>>>
>>> --
>>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end
>>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>>
>>
>> --
>> Best regards,
>>
>> Jos=C3=A9 Quaresma
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#180805): https://lists.openembedded.org/g/openembedd=
ed-core/message/180805
>> Mute This Topic: https://lists.openembedded.org/mt/98296212/5052612
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



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

