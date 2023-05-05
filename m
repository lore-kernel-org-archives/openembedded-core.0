Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5DFBC77B7C
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 10:24:13 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web11.23577.1683282243173931334
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 03:24:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=mJtQ145N;
 spf=pass (domain: gmail.com, ip: 209.85.222.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-77d50a1c8deso490367241.3
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 03:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683282242; x=1685874242;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DaDONnYyLeHrQU/bpIL92RsWJkahwtj9zsVTjbwY6I0=;
        b=mJtQ145NK205KMLpEbJ/fpVh7loU99mpEbsKnw80wHfmrIW029o9nHDoptaU7DfCv/
         sACRyKApnynVGv2GxPI9sKuhN/9v1ea4GV/lEYXShU7fj3w8Y2QWPB4vJrRrPUUbN5x2
         XiTIlUCd8XaWEXh87cqI0XqKxsRQK44H1/xj/2JQzA9e/cbbumfAw5fDuAPA3PcEt+qo
         ZMChqLKafrd9VAtrTrbV/7VnZufWAVRVloK05NzQ9l4lDfVE1+yDz/j0kNhHnRCHPvp4
         WPj5MTlTOGZS8PDLZazXrtSKhdJISwdOSTfwMEPsoph7GCFCSwIpJM+GcAkCunynaweN
         RX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683282242; x=1685874242;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DaDONnYyLeHrQU/bpIL92RsWJkahwtj9zsVTjbwY6I0=;
        b=AOOTPb4q96dzzdS0yzpPZvXFOcrjt5AodPlxmWWjos/WFgiVa+XHfVsgggcgEu0nTh
         OFtmnajupQYAgOPuOFIKrnoSot+xxvl8YrKgPAJN5JJwwcKtxE2UqCJY00ixHSvts3+x
         9Mc6q2Blpi/vnpYqPNyaPQYczpVBT6SSZIGsEBHphNktRRhM1Kqsrmag0nOXO2XzCACX
         +KOZ3G93xK9ZoMEcpk91IuVuxcLSfngFKpAcYnyKQuAB/WycpTNLlvVCLu3k233zqSEt
         inDhiobLiFmwlrWDIit3l4cNDic9qEA8oRf3C5AmBVwf7M6g15OhLZC4zdvtr6UcICtd
         TBpg==
X-Gm-Message-State: AC+VfDwRu4SuMp479Nk8Y8yDDadUIH7/JhFXJZkvdjltgc/K6skMXQsX
	eWUrdcqUS7UQHzt7wZQ7AUCuYiW9/OZqp8jY4aA=
X-Google-Smtp-Source: ACHHUZ70qwKoR7+81/e+qgdwluPQI3PFLHdIPBL1ItEtqIx95Cx2QVByCoVEEEdftME7wMJDXSZQlxS81gHvVfgB68w=
X-Received: by 2002:a67:f3cb:0:b0:434:7392:eb2 with SMTP id
 j11-20020a67f3cb000000b0043473920eb2mr280302vsn.9.1683282242018; Fri, 05 May
 2023 03:24:02 -0700 (PDT)
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
 <175B9A4D7B213CC1.28444@lists.openembedded.org>
In-Reply-To: <175B9A4D7B213CC1.28444@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 5 May 2023 11:23:50 +0100
Message-ID: <CANPvuRkqDP_uoHdFdjKWuKsWY_h5CzCDjOfydQ1LgK3=hg=f7g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] make-mod-scripts: preserve libraries when
 rm_work is used
To: quaresma.jose@gmail.com
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, Christoph Lauer <Christoph.Lauer@email.de>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Christoph Lauer <christoph.lauer@xtronic.de>
Content-Type: multipart/alternative; boundary="00000000000017a1be05faefb098"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 10:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180904

--00000000000017a1be05faefb098
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu no dia quarta, 3/05/2023 =C3=A0(=
s)
11:09:

>
>
> Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia ter=C3=A7a,
> 2/05/2023 =C3=A0(s) 22:12:
>
>> Attached is v2 of the patch. I've consolidated the suggested changes.
>>
>> I'm soaking it a bit longer, and then will send it as part of my next
>> consolidated pull request.
>>
>
> I will do some more tests with the v2 and post my comment later if
> anything new comes up.
>

Nothing new and the v2 patch works pretty well in my kernels.

Jose


>
> Jose
>
>
>>
>> Bruce
>>
>> On Thu, Apr 27, 2023 at 9:26=E2=80=AFPM Bruce Ashfield via
>> lists.openembedded.org
>> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>> >
>> > On Thu, Apr 27, 2023 at 6:32=E2=80=AFPM Jose Quaresma <quaresma.jose@g=
mail.com>
>> wrote:
>> > >
>> > > Hi Bruce,
>> > >
>> > > I have been testing your patch and have some comments.
>> > > In some of my kernels I don't have the pkg-config changes and so I
>> have some fails linking the scripts/sign-file
>> > > because for static linking with the libcrypto we need the -ldl
>> -pthread.
>> > >
>> > > To fix my build I need to override the CRYPTO_LIBS in my kernel
>> because they use the hardcoded pkg-config
>> > > where it is not possible to pass the --static argument.
>> > >
>> > > With following change on top of your patch I can build moist of my
>> kernels:
>> > >
>> > >         export HOSTLDFLAGS=3D"-lz"
>> > >
>> > > +       HOSTPKG_CONFIG=3D"pkg-config --static"
>> > > +       # override CRYPTO_LIBS since HOSTPKG_CONFIG lands only in
>> v5.19-rc1
>> > > +       #
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commi=
t/?id=3Dd5ea4fece4508bf8e72b659cd22fa4840d8d61e5
>> > > +       CRYPTO_LIBS=3D"$(pkg-config --static --libs libcrypto
>> 2>/dev/null || echo -lcrypto)"
>> > > +
>> > >         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>> > >         for t in prepare scripts_basic scripts; do
>> > >                 oe_runmake CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" \
>> > >                 AR=3D"${KERNEL_AR}" OBJCOPY=3D"${KERNEL_OBJCOPY}" \
>> > > -               HOSTPKG_CONFIG=3D"pkg-config --static" \
>> > > +               HOSTPKG_CONFIG=3D"${HOSTPKG_CONFIG}"
>> CRYPTO_LIBS=3D"${CRYPTO_LIBS}" \
>> > >                 -C ${STAGING_KERNEL_DIR} O=3D${STAGING_KERNEL_BUILDD=
IR}
>> $t
>> > >         done
>> > >
>> > >
>> > > I think belive that the LIBELF_LIBS needs the same fix for the cases
>> where HOSTPKG_CONFIG is not available.
>> > > Also I think there is a typo in the LIBELF_LIBS because you first
>> populate it with pkg-config but on the export the variable is redefined
>> > > with the HOST_LIBELF_LIBS. I made a litle change too on that:
>> > >
>> > >         # for pre-5.15 kernels
>> > > -       LIBELF_LIBS=3D$(pkg-config libelf --libs 2>/dev/null || echo
>> -lelf)
>> > > -       export LIBELF_LIBS=3D"$HOST_LIBELF_LIBS -lz"
>> > > +       LIBELF_LIBS=3D$(pkg-config --static libelf --libs 2>/dev/nul=
l
>> || echo -lelf)
>> > > +       export LIBELF_LIBS=3D"$LIBELF_LIBS -lz"
>> > >         export HOSTLDFLAGS=3D"-lz"
>> > >
>> > > Thanks for you help.
>> >
>> > Those are definitely plausible tweaks to the patch, I was providing
>> > the two techniques for that reason, and you've used them
>> > appropriately.
>> >
>> > Let me roll your changes into my patch, re-test and I'll submit it to
>> > the mailing list as a v2.
>> >
>> > Thanks for the testing, and fixup, I knew there would be things
>> missing! :)
>> >
>> > Bruce
>> >
>> > >
>> > > Jose
>> > >
>> > > Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia segunda,
>> 24/04/2023 =C3=A0(s) 20:25:
>> > >>
>> > >> On Mon, Apr 24, 2023 at 6:30=E2=80=AFAM Jose Quaresma <
>> quaresma.jose@gmail.com> wrote:
>> > >> >
>> > >> >
>> > >> >
>> > >> > Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia
>> domingo, 23/04/2023 =C3=A0(s) 20:55:
>> > >> >>
>> > >> >> On Sat, Apr 22, 2023 at 9:06=E2=80=AFAM Christoph Lauer
>> > >> >> <Christoph.Lauer@email.de> wrote:
>> > >> >> >
>> > >> >> > Am 21.04.23 um 22:28 schrieb Bruce Ashfield:
>> > >> >> > > On Wed, Apr 19, 2023 at 11:03=E2=80=AFPM Bruce Ashfield via
>> > >> >> > > lists.openembedded.org
>> > >> >> > > <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>> > >> >> > >>
>> > >> >> > >> On Wed, Apr 19, 2023 at 6:54=E2=80=AFPM Richard Purdie
>> > >> >> > >> <richard.purdie@linuxfoundation.org> wrote:
>> > >> >> > >>>
>> > >> >> > >>> On Wed, 2023-04-19 at 23:34 +0100, Jose Quaresma wrote:
>> > >> >> > >>>> Hi,
>> > >> >> > >>>>
>> > >> >> > >>>> Not related with the previous discussion but just for
>> > >> >> > >>>> your information.
>> > >> >> > >>>> The rm_work.bbclass has an exception for the kernel
>> recipes [1].
>> > >> >> > >>>> So I don't understand why we can't do the same for the
>> make-mod-
>> > >> >> > >>>> scripts
>> > >> >> > >>>> who is the twin brother of all these kernel recipes.
>> > >> >> > >>>>
>> > >> >> > >>>> [1]
>> > >> >> > >>>>
>> https://git.openembedded.org/openembedded-core/tree/meta/classes/rm_work=
.bbclass#n168
>> > >> >> > >>>
>> > >> >> > >>> Ideally we wouldn't be doing this for the kernel recipes.
>> > >> >> > >>>
>> > >> >> > >>> There is also a big difference to that and the proposed
>> patch. The
>> > >> >> > >>> proposed patch was preserving a specific directory rather
>> than an
>> > >> >> > >>> entire recipe. Removing the task stamps but leaving a smal=
l
>> piece of
>> > >> >> > >>> WORKDIR is quite different to preserving WORKDIR and STAMP=
S
>> for a
>> > >> >> > >>> specific recipe. The former is not tested and will break
>> things. The
>> > >> >> > >>> latter is better tolerated by bitbake.
>> > >> >> > >>
>> > >> >> > >> Agreed.
>> > >> >> > >>
>> > >> >> > >> Plus, I am working on this now.
>> > >> >> > >>
>> > >> >> > >> I have static linking of the scripts/tools working, but wha=
t
>> I haven't
>> > >> >> > >> figured out is how to do that without patching the Makefile=
s.
>> > >> >> > >>
>> > >> >> > >
>> > >> >> > > It turned out to be quite the battle to get older kernels
>> what was
>> > >> >> > > required for static linking of the tools.
>> > >> >> > >
>> > >> >> > > Attached is my WIP patch. I'm out of the office early next
>> week, but
>> > >> >> > > will revisit it once I'm back.
>> > >> >> > >
>> > >> >> > > Bruce
>> > >> >> > >
>> > >> >> > >> Next up will be some rpath trickery.
>> > >> >> > >>
>> > >> >> > >> Bruce
>> > >> >> > >>
>> > >> >> > >>>
>> > >> >> > >>> So yes, we could do the same. I'm sure there will be other
>> recipes
>> > >> >> > >>> people want to preserve for other reasons. Where do we dra=
w
>> the line?
>> > >> >> > >>> We could preserve everything and drop rm_work, then we
>> wouldn't have
>> > >> >> > >>> these problems? :)
>> > >> >> > >>>
>> > >> >> > >>> Cheers,
>> > >> >> > >>>
>> > >> >> > >>> Richard
>> > >> >> > >>
>> > >> >> > >>
>> > >> >> > >>
>> > >> >> > >> --
>> > >> >> > >> - Thou shalt not follow the NULL pointer, for chaos and
>> madness await
>> > >> >> > >> thee at its end
>> > >> >> > >> - "Use the force Harry" - Gandalf, Star Trek II
>> > >> >> > >>
>> > >> >> > >>
>> > >> >> > >>
>> > >> >> > >
>> > >> >> > >
>> > >> >> >
>> > >> >> > Thank you for your work, I see you put some time and effort
>> into it.
>> > >> >> > HOSTPKG_CONFIG is, as you mentioned, available since kernel
>> version 5.19
>> > >> >>
>> > >> >> Yes, I realize that and documented it in the patch ... but I als=
o
>> > >> >> tested on pre-5.19 kernels and what I have in the patch works.
>> Did it
>> > >> >> not work in your testing ?
>> > >> >
>> > >> >
>> > >> > I will test the patch on a couple of kernel versions with some of
>> them pre-5.19
>> > >> > but all in 5 major versions.
>> > >> > I will say something about my results later this week.
>> > >>
>> > >> 5.15-stable also has the pkg-config changes
>> > >>
>> > >> Bruce
>> > >>
>> > >> >
>> > >> > Thanks for working on this one.
>> > >> >
>> > >> > Jose
>> > >> >
>> > >> >>
>> > >> >>
>> > >> >> > (see kernel patch [1]), so we need a way to call 'pkg-config
>> --static'
>> > >> >> > with pre-5.19 kernels. A way without modifying the Makefile
>> would be to
>> > >> >> > modify openssls pkg-config in recipe-sysroot-native of
>> make-mod-script,
>> > >> >> > so 'pkg-config --libs' actually shows the dependencies of
>> 'pkg-config
>> > >> >> > --static --libs', but it's a bit hacky.
>> > >> >>
>> > >> >> Already considered, and discarded. That's not going to fly.
>> > >> >>
>> > >> >> >
>> > >> >> > Also fully-static executables still need the same glibc during
>> runtime
>> > >> >> > that they were built with, which makes them error-prone and is
>> generally
>> > >> >> > discouraged. As an alternative, we could build dynamic
>> executables that
>> > >> >> > use the static libcrypto library. The linker links by default
>> against
>> > >> >> > the shared library, so we could remove them from
>> recipe-sysroot-native
>> > >> >> > to force linking against the static library (again, somewhat
>> hacky).
>> > >> >>
>> > >> >> Also considered and discarded.
>> > >> >>
>> > >> >> As do the dynamically linked ones for the c runtime. We aren't
>> talking
>> > >> >> about using these outside of a single build and they are
>> generated on
>> > >> >> the fly, so again, there's very little concern about runtimes
>> changing
>> > >> >> after linking.. There's less risk in static than in the
>> alternatives.
>> > >> >>
>> > >> >> Bruce
>> > >> >>
>> > >> >>
>> > >> >> >
>> > >> >> > [1]
>> > >> >> >
>> https://github.com/torvalds/linux/commit/d5ea4fece4508bf8e72b659cd22fa48=
40d8d61e5
>> > >> >>
>> > >> >>
>> > >> >>
>> > >> >> --
>> > >> >> - Thou shalt not follow the NULL pointer, for chaos and madness
>> await
>> > >> >> thee at its end
>> > >> >> - "Use the force Harry" - Gandalf, Star Trek II
>> > >> >
>> > >> >
>> > >> >
>> > >> > --
>> > >> > Best regards,
>> > >> >
>> > >> > Jos=C3=A9 Quaresma
>> > >>
>> > >>
>> > >>
>> > >> --
>> > >> - Thou shalt not follow the NULL pointer, for chaos and madness awa=
it
>> > >> thee at its end
>> > >> - "Use the force Harry" - Gandalf, Star Trek II
>> > >
>> > >
>> > >
>> > > --
>> > > Best regards,
>> > >
>> > > Jos=C3=A9 Quaresma
>> >
>> >
>> >
>> > --
>> > - Thou shalt not follow the NULL pointer, for chaos and madness await
>> > thee at its end
>> > - "Use the force Harry" - Gandalf, Star Trek II
>> >
>> >
>> >
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>>
>
>
> --
> Best regards,
>
> Jos=C3=A9 Quaresma
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180805):
> https://lists.openembedded.org/g/openembedded-core/message/180805
> Mute This Topic: https://lists.openembedded.org/mt/98296212/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000017a1be05faefb098
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Bruce,</div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">Jose Quaresma via <a href=3D"http://lists.op=
enembedded.org">lists.openembedded.org</a> &lt;quaresma.jose=3D<a href=3D"m=
ailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a=
>&gt; escreveu no dia quarta, 3/05/2023 =C3=A0(s) 11:09:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">=
<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=
=3D"_blank">bruce.ashfield@gmail.com</a>&gt; escreveu no dia ter=C3=A7a, 2/=
05/2023 =C3=A0(s) 22:12:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Attached is v2 of the patch. I&#39;ve consolidated the suggested=
 changes.<br>
<br>
I&#39;m soaking it a bit longer, and then will send it as part of my next<b=
r>
consolidated pull request.<br></blockquote><div><br></div><div>I will do so=
me more tests with the v2 and post my comment later if anything new comes u=
p.</div></div></div></blockquote><div><br></div><div>Nothing new and the v2=
 patch works pretty=C2=A0well in my kernels.</div><div><br></div><div>Jose<=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v dir=3D"ltr"><div class=3D"gmail_quote"><div><br></div><div>Jose</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Bruce<br>
<br>
On Thu, Apr 27, 2023 at 9:26=E2=80=AFPM Bruce Ashfield via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a><br>
&lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" ta=
rget=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Thu, Apr 27, 2023 at 6:32=E2=80=AFPM Jose Quaresma &lt;<a href=3D"m=
ailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a=
>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hi Bruce,<br>
&gt; &gt;<br>
&gt; &gt; I have been testing your patch and have some comments.<br>
&gt; &gt; In some of my kernels I don&#39;t have the pkg-config changes and=
 so I have some fails linking the scripts/sign-file<br>
&gt; &gt; because for static linking with the libcrypto we need the -ldl -p=
thread.<br>
&gt; &gt;<br>
&gt; &gt; To fix my build I need to override the CRYPTO_LIBS in my kernel b=
ecause they use the hardcoded pkg-config<br>
&gt; &gt; where it is not possible to pass the --static argument.<br>
&gt; &gt;<br>
&gt; &gt; With following change on top of your patch I can build moist of m=
y kernels:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export HOSTLDFLAGS=3D&quot;-lz&q=
uot;<br>
&gt; &gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0HOSTPKG_CONFIG=3D&quot;pkg-config --s=
tatic&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0# override CRYPTO_LIBS since HOSTPKG_=
CONFIG lands only in v5.19-rc1<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0# <a href=3D"https://git.kernel.org/p=
ub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3Dd5ea4fece4508bf8e72=
b659cd22fa4840d8d61e5" rel=3D"noreferrer" target=3D"_blank">https://git.ker=
nel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3Dd5ea4fece4=
508bf8e72b659cd22fa4840d8d61e5</a><br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0CRYPTO_LIBS=3D&quot;$(pkg-config --st=
atic --libs libcrypto 2&gt;/dev/null || echo -lcrypto)&quot;<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unset CFLAGS CPPFLAGS CXXFLAGS L=
DFLAGS<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for t in prepare scripts_basic s=
cripts; do<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_r=
unmake CC=3D&quot;${KERNEL_CC}&quot; LD=3D&quot;${KERNEL_LD}&quot; \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AR=
=3D&quot;${KERNEL_AR}&quot; OBJCOPY=3D&quot;${KERNEL_OBJCOPY}&quot; \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HOSTPKG_C=
ONFIG=3D&quot;pkg-config --static&quot; \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HOSTPKG_C=
ONFIG=3D&quot;${HOSTPKG_CONFIG}&quot; CRYPTO_LIBS=3D&quot;${CRYPTO_LIBS}&qu=
ot; \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-C $=
{STAGING_KERNEL_DIR} O=3D${STAGING_KERNEL_BUILDDIR} $t<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; I think belive that the LIBELF_LIBS needs the same fix for the ca=
ses where HOSTPKG_CONFIG is not available.<br>
&gt; &gt; Also I think there is a typo in the LIBELF_LIBS because you first=
 populate it with pkg-config but on the export the variable is redefined<br=
>
&gt; &gt; with the HOST_LIBELF_LIBS. I made a litle change too on that:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# for pre-5.15 kernels<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0LIBELF_LIBS=3D$(pkg-config libelf --l=
ibs 2&gt;/dev/null || echo -lelf)<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0export LIBELF_LIBS=3D&quot;$HOST_LIBE=
LF_LIBS -lz&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0LIBELF_LIBS=3D$(pkg-config --static l=
ibelf --libs 2&gt;/dev/null || echo -lelf)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0export LIBELF_LIBS=3D&quot;$LIBELF_LI=
BS -lz&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export HOSTLDFLAGS=3D&quot;-lz&q=
uot;<br>
&gt; &gt;<br>
&gt; &gt; Thanks for you help.<br>
&gt;<br>
&gt; Those are definitely plausible tweaks to the patch, I was providing<br=
>
&gt; the two techniques for that reason, and you&#39;ve used them<br>
&gt; appropriately.<br>
&gt;<br>
&gt; Let me roll your changes into my patch, re-test and I&#39;ll submit it=
 to<br>
&gt; the mailing list as a v2.<br>
&gt;<br>
&gt; Thanks for the testing, and fixup, I knew there would be things missin=
g! :)<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; Jose<br>
&gt; &gt;<br>
&gt; &gt; Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" ta=
rget=3D"_blank">bruce.ashfield@gmail.com</a>&gt; escreveu no dia segunda, 2=
4/04/2023 =C3=A0(s) 20:25:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On Mon, Apr 24, 2023 at 6:30=E2=80=AFAM Jose Quaresma &lt;<a =
href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gma=
il.com</a>&gt; wrote:<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmai=
l.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt; escreveu no dia d=
omingo, 23/04/2023 =C3=A0(s) 20:55:<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; On Sat, Apr 22, 2023 at 9:06=E2=80=AFAM Christoph La=
uer<br>
&gt; &gt;&gt; &gt;&gt; &lt;<a href=3D"mailto:Christoph.Lauer@email.de" targ=
et=3D"_blank">Christoph.Lauer@email.de</a>&gt; wrote:<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; Am 21.04.23 um 22:28 schrieb Bruce Ashfield:<br=
>
&gt; &gt;&gt; &gt;&gt; &gt; &gt; On Wed, Apr 19, 2023 at 11:03=E2=80=AFPM B=
ruce Ashfield via<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt; <a href=3D"http://lists.openembedded.org" =
rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a><br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt; &lt;bruce.ashfield=3D<a href=3D"mailto:gma=
il.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedd=
ed.org</a>&gt; wrote:<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt; On Wed, Apr 19, 2023 at 6:54=E2=80=AFP=
M Richard Purdie<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt; &lt;<a href=3D"mailto:richard.purdie@l=
inuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a=
>&gt; wrote:<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; On Wed, 2023-04-19 at 23:34 +0100,=
 Jose Quaresma wrote:<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt; Hi,<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt; Not related with the previous =
discussion but just for<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt; your information.<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt; The rm_work.bbclass has an exc=
eption for the kernel recipes [1].<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt; So I don&#39;t understand why =
we can&#39;t do the same for the make-mod-<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt; scripts<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt; who is the twin brother of all=
 these kernel recipes.<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt; [1]<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;&gt; <a href=3D"https://git.openemb=
edded.org/openembedded-core/tree/meta/classes/rm_work.bbclass#n168" rel=3D"=
noreferrer" target=3D"_blank">https://git.openembedded.org/openembedded-cor=
e/tree/meta/classes/rm_work.bbclass#n168</a><br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; Ideally we wouldn&#39;t be doing t=
his for the kernel recipes.<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; There is also a big difference to =
that and the proposed patch. The<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; proposed patch was preserving a sp=
ecific directory rather than an<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; entire recipe. Removing the task s=
tamps but leaving a small piece of<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; WORKDIR is quite different to pres=
erving WORKDIR and STAMPS for a<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; specific recipe. The former is not=
 tested and will break things. The<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; latter is better tolerated by bitb=
ake.<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt; Agreed.<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt; Plus, I am working on this now.<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt; I have static linking of the scripts/t=
ools working, but what I haven&#39;t<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt; figured out is how to do that without =
patching the Makefiles.<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt; It turned out to be quite the battle to ge=
t older kernels what was<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt; required for static linking of the tools.<=
br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt; Attached is my WIP patch. I&#39;m out of t=
he office early next week, but<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt; will revisit it once I&#39;m back.<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt; Bruce<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt; Next up will be some rpath trickery.<b=
r>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt; Bruce<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; So yes, we could do the same. I&#3=
9;m sure there will be other recipes<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; people want to preserve for other =
reasons. Where do we draw the line?<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; We could preserve everything and d=
rop rm_work, then we wouldn&#39;t have<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; these problems? :)<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; Cheers,<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;&gt; Richard<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt; --<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt; - Thou shalt not follow the NULL point=
er, for chaos and madness await<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt; thee at its end<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt; - &quot;Use the force Harry&quot; - Ga=
ndalf, Star Trek II<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; Thank you for your work, I see you put some tim=
e and effort into it.<br>
&gt; &gt;&gt; &gt;&gt; &gt; HOSTPKG_CONFIG is, as you mentioned, available =
since kernel version 5.19<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; Yes, I realize that and documented it in the patch .=
.. but I also<br>
&gt; &gt;&gt; &gt;&gt; tested on pre-5.19 kernels and what I have in the pa=
tch works. Did it<br>
&gt; &gt;&gt; &gt;&gt; not work in your testing ?<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; I will test the patch on a couple of kernel versions wit=
h some of them pre-5.19<br>
&gt; &gt;&gt; &gt; but all in 5 major versions.<br>
&gt; &gt;&gt; &gt; I will say something about my results later this week.<b=
r>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; 5.15-stable also has the pkg-config changes<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Bruce<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Thanks for working on this one.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Jose<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; (see kernel patch [1]), so we need a way to cal=
l &#39;pkg-config --static&#39;<br>
&gt; &gt;&gt; &gt;&gt; &gt; with pre-5.19 kernels. A way without modifying =
the Makefile would be to<br>
&gt; &gt;&gt; &gt;&gt; &gt; modify openssls pkg-config in recipe-sysroot-na=
tive of make-mod-script,<br>
&gt; &gt;&gt; &gt;&gt; &gt; so &#39;pkg-config --libs&#39; actually shows t=
he dependencies of &#39;pkg-config<br>
&gt; &gt;&gt; &gt;&gt; &gt; --static --libs&#39;, but it&#39;s a bit hacky.=
<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; Already considered, and discarded. That&#39;s not go=
ing to fly.<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; Also fully-static executables still need the sa=
me glibc during runtime<br>
&gt; &gt;&gt; &gt;&gt; &gt; that they were built with, which makes them err=
or-prone and is generally<br>
&gt; &gt;&gt; &gt;&gt; &gt; discouraged. As an alternative, we could build =
dynamic executables that<br>
&gt; &gt;&gt; &gt;&gt; &gt; use the static libcrypto library. The linker li=
nks by default against<br>
&gt; &gt;&gt; &gt;&gt; &gt; the shared library, so we could remove them fro=
m recipe-sysroot-native<br>
&gt; &gt;&gt; &gt;&gt; &gt; to force linking against the static library (ag=
ain, somewhat hacky).<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; Also considered and discarded.<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; As do the dynamically linked ones for the c runtime.=
 We aren&#39;t talking<br>
&gt; &gt;&gt; &gt;&gt; about using these outside of a single build and they=
 are generated on<br>
&gt; &gt;&gt; &gt;&gt; the fly, so again, there&#39;s very little concern a=
bout runtimes changing<br>
&gt; &gt;&gt; &gt;&gt; after linking.. There&#39;s less risk in static than=
 in the alternatives.<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; Bruce<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;&gt; &gt; [1]<br>
&gt; &gt;&gt; &gt;&gt; &gt; <a href=3D"https://github.com/torvalds/linux/co=
mmit/d5ea4fece4508bf8e72b659cd22fa4840d8d61e5" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/torvalds/linux/commit/d5ea4fece4508bf8e72b659cd=
22fa4840d8d61e5</a><br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; --<br>
&gt; &gt;&gt; &gt;&gt; - Thou shalt not follow the NULL pointer, for chaos =
and madness await<br>
&gt; &gt;&gt; &gt;&gt; thee at its end<br>
&gt; &gt;&gt; &gt;&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Tr=
ek II<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; --<br>
&gt; &gt;&gt; &gt; Best regards,<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Jos=C3=A9 Quaresma<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; - Thou shalt not follow the NULL pointer, for chaos and madne=
ss await<br>
&gt; &gt;&gt; thee at its end<br>
&gt; &gt;&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Best regards,<br>
&gt; &gt;<br>
&gt; &gt; Jos=C3=A9 Quaresma<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await<=
br>
&gt; thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div><br clear=3D"all"><div><br></div><span>-- </span><br><di=
v dir=3D"ltr"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</di=
v></div></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#180805): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/180805" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/180805</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98296212/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/98296212/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--00000000000017a1be05faefb098--

