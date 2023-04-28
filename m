Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F2B7C77B73
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 01:26:55 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web11.9552.1682645206689628818
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Apr 2023 18:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=BZJFO9FY;
 spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-760c58486d3so225626139f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 18:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682645206; x=1685237206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1VvgjINCr63noCtbSxEv7Ob4W21DEOh2VviKoIO4F/c=;
        b=BZJFO9FY/mNuaEEwFnSdN0hiTSQ6yVCzLQDgYiwhSU9iCvt+aDI0Q3GWGpLNtzFs4E
         hA9lo579rcJ16ZbkqwBkF5WAmYS9A7v6m3mXJDdK393+4ocl4hKXLebXw8BHFiQXmLpg
         eWgKr+xSbf+XYSASDN1lAA/B8Vq2us4QCKbgcHCe7iOw5R78n+7+0/UnalALNYXtF6YX
         r2JweQSt/oTAgx3Dz5UU3DD4n0QuqP/GdThi3n5azG5/yNMVg0tSScRNkftFdbf/8i2l
         Zrf5VGhVrDXcbXRFq5eKNjGFtvI6PWbHyCqEDv51UQNeWl01PU3S7SpR/SDQ50WSjfro
         VdaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682645206; x=1685237206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1VvgjINCr63noCtbSxEv7Ob4W21DEOh2VviKoIO4F/c=;
        b=kGVnE6WPby5VkZjzuuslCAjsMkP8yw1Dy8kAF/LRd8amTjjVOnaWAHyyKCXGioN5Zv
         y58IY+q6fp4n+Yy58cnrmGC8HHvMSNv2o/HsXJbCT61wo7DPt7xDZ9Gm8QstQpwOGdl0
         kuaaVgO5vvC2TLxK0sI4f8ib/fLd4tNhW/hxVGAGxiRhx8lsm0ZOAT8oGsBxgOOxlyYC
         i95iA1XnMXqTOKh1xLKK8HnO7Ln8ao4MJqECtfkhdrw4c0bNwlxxUo2bnOcFAaar9JyM
         k8HEVxmoDqBU5R2u3TgFgU6mZ5CEhElc7926zeEqB1Ez1GqpRzK4u9Vmm4dqbhB0xA20
         iNDw==
X-Gm-Message-State: AC+VfDwJqTRc0kQVcPglgVQ/rl17//YsQrASy2R67J26MS6Z++MxfSJN
	lVdqbJd6uXBBjXw2XTbc5DjdsUfTAve1R4eroAE=
X-Google-Smtp-Source: ACHHUZ7FvbS1Y2psJhYqlZWergoKSbdUClB0W8rmATQNNm//0/Bt7MVZ4cAvXltZpEf6TzjqtqH0iryM1aADDArZHYQ=
X-Received: by 2002:a92:c74a:0:b0:32b:766c:21a5 with SMTP id
 y10-20020a92c74a000000b0032b766c21a5mr2438492ilp.26.1682645205680; Thu, 27
 Apr 2023 18:26:45 -0700 (PDT)
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
 <CADkTA4MwPcPnqQaAPDP-5vR=aEzKFDq9OaA=NA0hspKB2Nzz6w@mail.gmail.com> <CANPvuRk3UyMX7Szh7gc5Ha5E2gWZaOVZXWzuZEd66-zavpnS9Q@mail.gmail.com>
In-Reply-To: <CANPvuRk3UyMX7Szh7gc5Ha5E2gWZaOVZXWzuZEd66-zavpnS9Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 27 Apr 2023 21:26:46 -0400
Message-ID: <CADkTA4O6ur6gYLKcuPZX-yZFJDrAA3TeCNXpzQhdsrk2wpsVVw@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 01:26:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180502

On Thu, Apr 27, 2023 at 6:32=E2=80=AFPM Jose Quaresma <quaresma.jose@gmail.=
com> wrote:
>
> Hi Bruce,
>
> I have been testing your patch and have some comments.
> In some of my kernels I don't have the pkg-config changes and so I have s=
ome fails linking the scripts/sign-file
> because for static linking with the libcrypto we need the -ldl -pthread.
>
> To fix my build I need to override the CRYPTO_LIBS in my kernel because t=
hey use the hardcoded pkg-config
> where it is not possible to pass the --static argument.
>
> With following change on top of your patch I can build moist of my kernel=
s:
>
>         export HOSTLDFLAGS=3D"-lz"
>
> +       HOSTPKG_CONFIG=3D"pkg-config --static"
> +       # override CRYPTO_LIBS since HOSTPKG_CONFIG lands only in v5.19-r=
c1
> +       # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3Dd5ea4fece4508bf8e72b659cd22fa4840d8d61e5
> +       CRYPTO_LIBS=3D"$(pkg-config --static --libs libcrypto 2>/dev/null=
 || echo -lcrypto)"
> +
>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>         for t in prepare scripts_basic scripts; do
>                 oe_runmake CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" \
>                 AR=3D"${KERNEL_AR}" OBJCOPY=3D"${KERNEL_OBJCOPY}" \
> -               HOSTPKG_CONFIG=3D"pkg-config --static" \
> +               HOSTPKG_CONFIG=3D"${HOSTPKG_CONFIG}" CRYPTO_LIBS=3D"${CRY=
PTO_LIBS}" \
>                 -C ${STAGING_KERNEL_DIR} O=3D${STAGING_KERNEL_BUILDDIR} $=
t
>         done
>
>
> I think belive that the LIBELF_LIBS needs the same fix for the cases wher=
e HOSTPKG_CONFIG is not available.
> Also I think there is a typo in the LIBELF_LIBS because you first populat=
e it with pkg-config but on the export the variable is redefined
> with the HOST_LIBELF_LIBS. I made a litle change too on that:
>
>         # for pre-5.15 kernels
> -       LIBELF_LIBS=3D$(pkg-config libelf --libs 2>/dev/null || echo -lel=
f)
> -       export LIBELF_LIBS=3D"$HOST_LIBELF_LIBS -lz"
> +       LIBELF_LIBS=3D$(pkg-config --static libelf --libs 2>/dev/null || =
echo -lelf)
> +       export LIBELF_LIBS=3D"$LIBELF_LIBS -lz"
>         export HOSTLDFLAGS=3D"-lz"
>
> Thanks for you help.

Those are definitely plausible tweaks to the patch, I was providing
the two techniques for that reason, and you've used them
appropriately.

Let me roll your changes into my patch, re-test and I'll submit it to
the mailing list as a v2.

Thanks for the testing, and fixup, I knew there would be things missing! :)

Bruce

>
> Jose
>
> Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia segunda, 24/04/=
2023 =C3=A0(s) 20:25:
>>
>> On Mon, Apr 24, 2023 at 6:30=E2=80=AFAM Jose Quaresma <quaresma.jose@gma=
il.com> wrote:
>> >
>> >
>> >
>> > Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia domingo, 23/=
04/2023 =C3=A0(s) 20:55:
>> >>
>> >> On Sat, Apr 22, 2023 at 9:06=E2=80=AFAM Christoph Lauer
>> >> <Christoph.Lauer@email.de> wrote:
>> >> >
>> >> > Am 21.04.23 um 22:28 schrieb Bruce Ashfield:
>> >> > > On Wed, Apr 19, 2023 at 11:03=E2=80=AFPM Bruce Ashfield via
>> >> > > lists.openembedded.org
>> >> > > <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>> >> > >>
>> >> > >> On Wed, Apr 19, 2023 at 6:54=E2=80=AFPM Richard Purdie
>> >> > >> <richard.purdie@linuxfoundation.org> wrote:
>> >> > >>>
>> >> > >>> On Wed, 2023-04-19 at 23:34 +0100, Jose Quaresma wrote:
>> >> > >>>> Hi,
>> >> > >>>>
>> >> > >>>> Not related with the previous discussion but just for
>> >> > >>>> your information.
>> >> > >>>> The rm_work.bbclass has an exception for the kernel recipes [1=
].
>> >> > >>>> So I don't understand why we can't do the same for the make-mo=
d-
>> >> > >>>> scripts
>> >> > >>>> who is the twin brother of all these kernel recipes.
>> >> > >>>>
>> >> > >>>> [1]
>> >> > >>>> https://git.openembedded.org/openembedded-core/tree/meta/class=
es/rm_work.bbclass#n168
>> >> > >>>
>> >> > >>> Ideally we wouldn't be doing this for the kernel recipes.
>> >> > >>>
>> >> > >>> There is also a big difference to that and the proposed patch. =
The
>> >> > >>> proposed patch was preserving a specific directory rather than =
an
>> >> > >>> entire recipe. Removing the task stamps but leaving a small pie=
ce of
>> >> > >>> WORKDIR is quite different to preserving WORKDIR and STAMPS for=
 a
>> >> > >>> specific recipe. The former is not tested and will break things=
. The
>> >> > >>> latter is better tolerated by bitbake.
>> >> > >>
>> >> > >> Agreed.
>> >> > >>
>> >> > >> Plus, I am working on this now.
>> >> > >>
>> >> > >> I have static linking of the scripts/tools working, but what I h=
aven't
>> >> > >> figured out is how to do that without patching the Makefiles.
>> >> > >>
>> >> > >
>> >> > > It turned out to be quite the battle to get older kernels what wa=
s
>> >> > > required for static linking of the tools.
>> >> > >
>> >> > > Attached is my WIP patch. I'm out of the office early next week, =
but
>> >> > > will revisit it once I'm back.
>> >> > >
>> >> > > Bruce
>> >> > >
>> >> > >> Next up will be some rpath trickery.
>> >> > >>
>> >> > >> Bruce
>> >> > >>
>> >> > >>>
>> >> > >>> So yes, we could do the same. I'm sure there will be other reci=
pes
>> >> > >>> people want to preserve for other reasons. Where do we draw the=
 line?
>> >> > >>> We could preserve everything and drop rm_work, then we wouldn't=
 have
>> >> > >>> these problems? :)
>> >> > >>>
>> >> > >>> Cheers,
>> >> > >>>
>> >> > >>> Richard
>> >> > >>
>> >> > >>
>> >> > >>
>> >> > >> --
>> >> > >> - Thou shalt not follow the NULL pointer, for chaos and madness =
await
>> >> > >> thee at its end
>> >> > >> - "Use the force Harry" - Gandalf, Star Trek II
>> >> > >>
>> >> > >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >> > >> Links: You receive all messages sent to this group.
>> >> > >> View/Reply Online (#180233): https://lists.openembedded.org/g/op=
enembedded-core/message/180233
>> >> > >> Mute This Topic: https://lists.openembedded.org/mt/98296212/1050=
810
>> >> > >> Group Owner: openembedded-core+owner@lists.openembedded.org
>> >> > >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/=
unsub [bruce.ashfield@gmail.com]
>> >> > >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >> > >>
>> >> > >
>> >> > >
>> >> >
>> >> > Thank you for your work, I see you put some time and effort into it=
.
>> >> > HOSTPKG_CONFIG is, as you mentioned, available since kernel version=
 5.19
>> >>
>> >> Yes, I realize that and documented it in the patch ... but I also
>> >> tested on pre-5.19 kernels and what I have in the patch works. Did it
>> >> not work in your testing ?
>> >
>> >
>> > I will test the patch on a couple of kernel versions with some of them=
 pre-5.19
>> > but all in 5 major versions.
>> > I will say something about my results later this week.
>>
>> 5.15-stable also has the pkg-config changes
>>
>> Bruce
>>
>> >
>> > Thanks for working on this one.
>> >
>> > Jose
>> >
>> >>
>> >>
>> >> > (see kernel patch [1]), so we need a way to call 'pkg-config --stat=
ic'
>> >> > with pre-5.19 kernels. A way without modifying the Makefile would b=
e to
>> >> > modify openssls pkg-config in recipe-sysroot-native of make-mod-scr=
ipt,
>> >> > so 'pkg-config --libs' actually shows the dependencies of 'pkg-conf=
ig
>> >> > --static --libs', but it's a bit hacky.
>> >>
>> >> Already considered, and discarded. That's not going to fly.
>> >>
>> >> >
>> >> > Also fully-static executables still need the same glibc during runt=
ime
>> >> > that they were built with, which makes them error-prone and is gene=
rally
>> >> > discouraged. As an alternative, we could build dynamic executables =
that
>> >> > use the static libcrypto library. The linker links by default again=
st
>> >> > the shared library, so we could remove them from recipe-sysroot-nat=
ive
>> >> > to force linking against the static library (again, somewhat hacky)=
.
>> >>
>> >> Also considered and discarded.
>> >>
>> >> As do the dynamically linked ones for the c runtime. We aren't talkin=
g
>> >> about using these outside of a single build and they are generated on
>> >> the fly, so again, there's very little concern about runtimes changin=
g
>> >> after linking.. There's less risk in static than in the alternatives.
>> >>
>> >> Bruce
>> >>
>> >>
>> >> >
>> >> > [1]
>> >> > https://github.com/torvalds/linux/commit/d5ea4fece4508bf8e72b659cd2=
2fa4840d8d61e5
>> >>
>> >>
>> >>
>> >> --
>> >> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> >> thee at its end
>> >> - "Use the force Harry" - Gandalf, Star Trek II
>> >
>> >
>> >
>> > --
>> > Best regards,
>> >
>> > Jos=C3=A9 Quaresma
>>
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>
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

