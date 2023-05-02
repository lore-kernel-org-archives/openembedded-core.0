Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA7C1C77B78
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 21:12:05 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web10.2694.1683061923208624064
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 14:12:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=sOlCvN/a;
 spf=pass (domain: gmail.com, ip: 209.85.166.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-331430faba8so1598805ab.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 14:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683061922; x=1685653922;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a16UQMnj8XOniKn9fBB9Zo5oKyv9HjfLyyUdaia6UbQ=;
        b=sOlCvN/aFUFfRS963VHxHvUqkaENI+gwEl55ogCR3M4SHX+cp3gAcn1f2D/HuvxuXO
         wohYIYQM8s50RWWY/+i7iePHw+UAMzJ4YfOwIh1PP0a4poZDBS+AyQHNrXFgoZDjaim5
         JBeMXS1DJdj8ZXTUb6M0OcDd4ZSP5VYtbtstqkxJteb7lw/LG21EaiGDEFT25r2zXleI
         dcQ6f+1Qj4SPMODo+jiKu7yPYergUvOkvy1BvDEqUflTow6mfu1qCpU5HRzTdYN9D8sE
         uTWltUPJuMsuyMNVNU8vuUmoFKPHtnBAoSk3FeL/0Nfze1gagN4YT6YEUHi4XF9f4Oue
         S6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683061922; x=1685653922;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a16UQMnj8XOniKn9fBB9Zo5oKyv9HjfLyyUdaia6UbQ=;
        b=MqMU0NEBnBiUT3bCfh450pMyBnwOh7G11gFznTEVsgA9WekWlpPIiaSziwQu4ems6u
         2qRAkhcX7VTb2d9I3nIKGXIIl/50r1Vpjfmnsg58crcc06qOWwE9snEpNylGtcPk82N6
         aKwAWhs1lDE10XleHVS/ivnbpVigB+lwQGPoEs7wPWgmiMzAwNQGRP0XM470ydcZiiwt
         qZmWCxvf+WIyIOMuJfk7IqhloBiISqzK93U2XSjyTvBR7XUkzMSNODJv6JPckMbwM+EJ
         E3WW3phRR9UkKxIGDFAauDTU5n6FyBekhq3OWGVyHarh6p+s14vJD6qMu6yJQpiV/aBj
         Ucyg==
X-Gm-Message-State: AC+VfDwOm5X7KJP6jc2BviMq9+FsABWMrkU/zr7wsNr8HhNbE1z59CLR
	5fZEWt8GuiDW6vtZndtocXbH8RD3neJsk1AjhKc=
X-Google-Smtp-Source: ACHHUZ6I3Gh20ESrxknu43wKEfThwJEF5x9NHA2gJOIjNeCW8JbFN74yKQ/IX8W7o8lMvlmI55VBIRo4RGbGSFDqGSo=
X-Received: by 2002:a92:c6c3:0:b0:331:1f0e:79b8 with SMTP id
 v3-20020a92c6c3000000b003311f0e79b8mr2486321ilm.0.1683061922276; Tue, 02 May
 2023 14:12:02 -0700 (PDT)
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
 <CANPvuRk3UyMX7Szh7gc5Ha5E2gWZaOVZXWzuZEd66-zavpnS9Q@mail.gmail.com> <1759F4E68EA4E1CC.26969@lists.openembedded.org>
In-Reply-To: <1759F4E68EA4E1CC.26969@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 2 May 2023 17:11:54 -0400
Message-ID: <CADkTA4PhAgXd4F+V9hwXW6Fqg3T5ztc5Zr5BBfSDN6AFsYV9gw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] make-mod-scripts: preserve libraries when
 rm_work is used
To: bruce.ashfield@gmail.com
Cc: Jose Quaresma <quaresma.jose@gmail.com>, Christoph Lauer <Christoph.Lauer@email.de>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Christoph Lauer <christoph.lauer@xtronic.de>
Content-Type: multipart/mixed; boundary="000000000000033ff005fabc64d2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 21:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180771

--000000000000033ff005fabc64d2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Attached is v2 of the patch. I've consolidated the suggested changes.

I'm soaking it a bit longer, and then will send it as part of my next
consolidated pull request.

Bruce

On Thu, Apr 27, 2023 at 9:26=E2=80=AFPM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Thu, Apr 27, 2023 at 6:32=E2=80=AFPM Jose Quaresma <quaresma.jose@gmai=
l.com> wrote:
> >
> > Hi Bruce,
> >
> > I have been testing your patch and have some comments.
> > In some of my kernels I don't have the pkg-config changes and so I have=
 some fails linking the scripts/sign-file
> > because for static linking with the libcrypto we need the -ldl -pthread=
.
> >
> > To fix my build I need to override the CRYPTO_LIBS in my kernel because=
 they use the hardcoded pkg-config
> > where it is not possible to pass the --static argument.
> >
> > With following change on top of your patch I can build moist of my kern=
els:
> >
> >         export HOSTLDFLAGS=3D"-lz"
> >
> > +       HOSTPKG_CONFIG=3D"pkg-config --static"
> > +       # override CRYPTO_LIBS since HOSTPKG_CONFIG lands only in v5.19=
-rc1
> > +       # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git/commit/?id=3Dd5ea4fece4508bf8e72b659cd22fa4840d8d61e5
> > +       CRYPTO_LIBS=3D"$(pkg-config --static --libs libcrypto 2>/dev/nu=
ll || echo -lcrypto)"
> > +
> >         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> >         for t in prepare scripts_basic scripts; do
> >                 oe_runmake CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" \
> >                 AR=3D"${KERNEL_AR}" OBJCOPY=3D"${KERNEL_OBJCOPY}" \
> > -               HOSTPKG_CONFIG=3D"pkg-config --static" \
> > +               HOSTPKG_CONFIG=3D"${HOSTPKG_CONFIG}" CRYPTO_LIBS=3D"${C=
RYPTO_LIBS}" \
> >                 -C ${STAGING_KERNEL_DIR} O=3D${STAGING_KERNEL_BUILDDIR}=
 $t
> >         done
> >
> >
> > I think belive that the LIBELF_LIBS needs the same fix for the cases wh=
ere HOSTPKG_CONFIG is not available.
> > Also I think there is a typo in the LIBELF_LIBS because you first popul=
ate it with pkg-config but on the export the variable is redefined
> > with the HOST_LIBELF_LIBS. I made a litle change too on that:
> >
> >         # for pre-5.15 kernels
> > -       LIBELF_LIBS=3D$(pkg-config libelf --libs 2>/dev/null || echo -l=
elf)
> > -       export LIBELF_LIBS=3D"$HOST_LIBELF_LIBS -lz"
> > +       LIBELF_LIBS=3D$(pkg-config --static libelf --libs 2>/dev/null |=
| echo -lelf)
> > +       export LIBELF_LIBS=3D"$LIBELF_LIBS -lz"
> >         export HOSTLDFLAGS=3D"-lz"
> >
> > Thanks for you help.
>
> Those are definitely plausible tweaks to the patch, I was providing
> the two techniques for that reason, and you've used them
> appropriately.
>
> Let me roll your changes into my patch, re-test and I'll submit it to
> the mailing list as a v2.
>
> Thanks for the testing, and fixup, I knew there would be things missing! =
:)
>
> Bruce
>
> >
> > Jose
> >
> > Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia segunda, 24/0=
4/2023 =C3=A0(s) 20:25:
> >>
> >> On Mon, Apr 24, 2023 at 6:30=E2=80=AFAM Jose Quaresma <quaresma.jose@g=
mail.com> wrote:
> >> >
> >> >
> >> >
> >> > Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia domingo, 2=
3/04/2023 =C3=A0(s) 20:55:
> >> >>
> >> >> On Sat, Apr 22, 2023 at 9:06=E2=80=AFAM Christoph Lauer
> >> >> <Christoph.Lauer@email.de> wrote:
> >> >> >
> >> >> > Am 21.04.23 um 22:28 schrieb Bruce Ashfield:
> >> >> > > On Wed, Apr 19, 2023 at 11:03=E2=80=AFPM Bruce Ashfield via
> >> >> > > lists.openembedded.org
> >> >> > > <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> >> >> > >>
> >> >> > >> On Wed, Apr 19, 2023 at 6:54=E2=80=AFPM Richard Purdie
> >> >> > >> <richard.purdie@linuxfoundation.org> wrote:
> >> >> > >>>
> >> >> > >>> On Wed, 2023-04-19 at 23:34 +0100, Jose Quaresma wrote:
> >> >> > >>>> Hi,
> >> >> > >>>>
> >> >> > >>>> Not related with the previous discussion but just for
> >> >> > >>>> your information.
> >> >> > >>>> The rm_work.bbclass has an exception for the kernel recipes =
[1].
> >> >> > >>>> So I don't understand why we can't do the same for the make-=
mod-
> >> >> > >>>> scripts
> >> >> > >>>> who is the twin brother of all these kernel recipes.
> >> >> > >>>>
> >> >> > >>>> [1]
> >> >> > >>>> https://git.openembedded.org/openembedded-core/tree/meta/cla=
sses/rm_work.bbclass#n168
> >> >> > >>>
> >> >> > >>> Ideally we wouldn't be doing this for the kernel recipes.
> >> >> > >>>
> >> >> > >>> There is also a big difference to that and the proposed patch=
. The
> >> >> > >>> proposed patch was preserving a specific directory rather tha=
n an
> >> >> > >>> entire recipe. Removing the task stamps but leaving a small p=
iece of
> >> >> > >>> WORKDIR is quite different to preserving WORKDIR and STAMPS f=
or a
> >> >> > >>> specific recipe. The former is not tested and will break thin=
gs. The
> >> >> > >>> latter is better tolerated by bitbake.
> >> >> > >>
> >> >> > >> Agreed.
> >> >> > >>
> >> >> > >> Plus, I am working on this now.
> >> >> > >>
> >> >> > >> I have static linking of the scripts/tools working, but what I=
 haven't
> >> >> > >> figured out is how to do that without patching the Makefiles.
> >> >> > >>
> >> >> > >
> >> >> > > It turned out to be quite the battle to get older kernels what =
was
> >> >> > > required for static linking of the tools.
> >> >> > >
> >> >> > > Attached is my WIP patch. I'm out of the office early next week=
, but
> >> >> > > will revisit it once I'm back.
> >> >> > >
> >> >> > > Bruce
> >> >> > >
> >> >> > >> Next up will be some rpath trickery.
> >> >> > >>
> >> >> > >> Bruce
> >> >> > >>
> >> >> > >>>
> >> >> > >>> So yes, we could do the same. I'm sure there will be other re=
cipes
> >> >> > >>> people want to preserve for other reasons. Where do we draw t=
he line?
> >> >> > >>> We could preserve everything and drop rm_work, then we wouldn=
't have
> >> >> > >>> these problems? :)
> >> >> > >>>
> >> >> > >>> Cheers,
> >> >> > >>>
> >> >> > >>> Richard
> >> >> > >>
> >> >> > >>
> >> >> > >>
> >> >> > >> --
> >> >> > >> - Thou shalt not follow the NULL pointer, for chaos and madnes=
s await
> >> >> > >> thee at its end
> >> >> > >> - "Use the force Harry" - Gandalf, Star Trek II
> >> >> > >>
> >> >> > >>
> >> >> > >>
> >> >> > >
> >> >> > >
> >> >> >
> >> >> > Thank you for your work, I see you put some time and effort into =
it.
> >> >> > HOSTPKG_CONFIG is, as you mentioned, available since kernel versi=
on 5.19
> >> >>
> >> >> Yes, I realize that and documented it in the patch ... but I also
> >> >> tested on pre-5.19 kernels and what I have in the patch works. Did =
it
> >> >> not work in your testing ?
> >> >
> >> >
> >> > I will test the patch on a couple of kernel versions with some of th=
em pre-5.19
> >> > but all in 5 major versions.
> >> > I will say something about my results later this week.
> >>
> >> 5.15-stable also has the pkg-config changes
> >>
> >> Bruce
> >>
> >> >
> >> > Thanks for working on this one.
> >> >
> >> > Jose
> >> >
> >> >>
> >> >>
> >> >> > (see kernel patch [1]), so we need a way to call 'pkg-config --st=
atic'
> >> >> > with pre-5.19 kernels. A way without modifying the Makefile would=
 be to
> >> >> > modify openssls pkg-config in recipe-sysroot-native of make-mod-s=
cript,
> >> >> > so 'pkg-config --libs' actually shows the dependencies of 'pkg-co=
nfig
> >> >> > --static --libs', but it's a bit hacky.
> >> >>
> >> >> Already considered, and discarded. That's not going to fly.
> >> >>
> >> >> >
> >> >> > Also fully-static executables still need the same glibc during ru=
ntime
> >> >> > that they were built with, which makes them error-prone and is ge=
nerally
> >> >> > discouraged. As an alternative, we could build dynamic executable=
s that
> >> >> > use the static libcrypto library. The linker links by default aga=
inst
> >> >> > the shared library, so we could remove them from recipe-sysroot-n=
ative
> >> >> > to force linking against the static library (again, somewhat hack=
y).
> >> >>
> >> >> Also considered and discarded.
> >> >>
> >> >> As do the dynamically linked ones for the c runtime. We aren't talk=
ing
> >> >> about using these outside of a single build and they are generated =
on
> >> >> the fly, so again, there's very little concern about runtimes chang=
ing
> >> >> after linking.. There's less risk in static than in the alternative=
s.
> >> >>
> >> >> Bruce
> >> >>
> >> >>
> >> >> >
> >> >> > [1]
> >> >> > https://github.com/torvalds/linux/commit/d5ea4fece4508bf8e72b659c=
d22fa4840d8d61e5
> >> >>
> >> >>
> >> >>
> >> >> --
> >> >> - Thou shalt not follow the NULL pointer, for chaos and madness awa=
it
> >> >> thee at its end
> >> >> - "Use the force Harry" - Gandalf, Star Trek II
> >> >
> >> >
> >> >
> >> > --
> >> > Best regards,
> >> >
> >> > Jos=C3=A9 Quaresma
> >>
> >>
> >>
> >> --
> >> - Thou shalt not follow the NULL pointer, for chaos and madness await
> >> thee at its end
> >> - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
> > --
> > Best regards,
> >
> > Jos=C3=A9 Quaresma
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180502): https://lists.openembedded.org/g/openembedde=
d-core/message/180502
> Mute This Topic: https://lists.openembedded.org/mt/98296212/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000033ff005fabc64d2
Content-Type: application/octet-stream; 
	name="0001-make-mod-scripts-force-static-linking-and-make-depen.patch"
Content-Disposition: attachment; 
	filename="0001-make-mod-scripts-force-static-linking-and-make-depen.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_lh6rltmj0>
X-Attachment-Id: f_lh6rltmj0

RnJvbSA0Y2Q4ZjE3YmFjODJjYjk3ZjUzZmVkZjIwZmE0ZmNhNGIyMjc3MzdlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2UuYXNoZmllbGRAZ21haWwu
Y29tPgpEYXRlOiBGcmksIDIxIEFwciAyMDIzIDEyOjMxOjMxIC0wNDAwClN1YmplY3Q6IFtQQVRD
SF0gbWFrZS1tb2Qtc2NyaXB0czogZm9yY2Ugc3RhdGljIGxpbmtpbmcgYW5kIG1ha2UgZGVwZW5k
ZW5jaWVzCiBleHBsaWNpdAoKV2hlbiB0aGUgc2NyaXB0cyBhcmUgcHJlcGFyZWQgZnJvbSB0aGUg
a2VybmVsIHNvdXJlLCB0aGVyZSBhcmUgc29tZQpleGVjdXRhYmxlcyB0aGF0IGNhbiBhbHNvIGJl
IGNyZWF0ZWQgKGRlcGVuZGluZyBvbiBrZXJuZWwKY29uZmlndXJhdGlvbikuIHNpZ24tZmlsZSBh
bmQgb2JqdG9vbCBhcmUgdHdvIGV4YW1wbGVzIHdoaWNoIGFyZQpjb21tb25seSBjcmVhdGVkLgoK
RHVlIHRvIHRoZSB3YXkgdGhhdCB0aGUga2VybmVsIHNvdXJjZSBpcyBzdGFnZWQsIGFuZCBidWls
ZCBhcnRpZmFjdHMKYXJlIHN0b3JlZCBmb3IgcmV1c2UgYW5kIHBlcmZvcm1hbmNlIHdlIGNhbiBl
bmQgdXAgaW4gYSBzY2VuYXJpbyB3aGVyZQp0aGUgYnVpbGQgYXJ0aWZhY3RzIGJhc2VkIGV4ZWN1
dGFibGUgaXMgbGlua2VkIGFnYWluc3Qgc2hhcmVkCmxpYnJhcmllcyBpbiB0aGUgcmVjaXBlIG5h
dGl2ZSBzeXNyb290IChzc2wgb3IgY3J5cHRvKS4KCldlIGNvdWxkIG1hbmlwdWxhdGUgcnBhdGgs
IGluc3RhbGwgdGhlIGxpYnJhcmllcyB0byBidWlsZC1hcnRpZmFjdHMKYW5kIGFycmFuZ2UgdG8g
aGF2ZSBhdmFpbGFibGUgd2hlbiB0aGUgaG9zdCB0b29scyBhcmUgdXNlZCBvciBldmVuCmNyZWF0
ZWQgYSBmdWxsIG5hdGl2ZSBwYWNrYWdlIGZyb20gdGhlIHRvb2xzIGdlbmVyYXRlZCBvdXQgb2Yg
c2NyaXB0cy4KClRob3NlIGFwcHJvYWNoZXMgaGF2ZSBkcmF3YmFja3MgaW4gY29tcGxleGl0eSwg
cmVsb2NhdGFiaWxpdHkgYW5kL29yCnN5bmNocm9uaXphdGlvbiBpc3N1ZXMgd2l0aCB0aGUga2Vy
bmVsIHNvdXJjZS4KClRoZSBjaG9zZW4gYXBwcm9hY2ggaGVyZSBpcyB0byBmb3JjZSBzdGF0aWMg
bGlua2luZyBvbiB0aGUgdG9vbHMsCndoaWNoIGFsbG93cyB0aGVtIHRvIGJlIHBsYWNlZCBpbnRv
IGJ1aWxkIGFydGlmYWN0cyB3aXRob3V0IGFueQpyZWZlcmVuY2VzIHRvIHRoZSByZWNpcGUgbmF0
aXZlIHN5c3Jvb3QuCgprZXJuZWwncyBuZXdlciB0aGFuIDUuMTUrIGFsbG93IHVzIHRvIGFkZCB0
aGUgLXN0YXRpYyBwYXJhbWV0ZXIKdG8gcGtnLWNvbmZpZywgYnV0IG9sZGVyIGtlcm5lbHMgZG8g
bm90IGhhdmUgdGhhdCBmbGV4aWJsaXR5LiBBcwphIHJlc3VsdCwgd2UgaGF2ZSB0d28gYXBwcm9h
Y2hlcyB0byBlbnN1cmUgdGhhdCB0aGUgbGlicmFyaWVzCm5lZWRlZCBmb3Igc3RhdGljIGxpbmtp
bmcgYXJlIGRldGVjdGVkIChvbmUgdmlhIHBrZy1jb25maWcgYW5kCnRoZSBvdGhlciB2aWEgaG9z
dCBsZGZsYWdzKS4gSW4gdGhlIGZ1dHVyZSB3ZSBjYW4gZHJvcCB0aGUgbGRmbGFncwphcHByb2Fj
aCAod2hlbiB0aGUgb2xkZXN0IHN1cHBvcnRlZCBrZXJuZWxzIGFyZSA+IDUuMTUpLgoKVGhlcmUg
YXJlIGFsc28gc29tZSBwb3RlbnRpYWxseSBtaXNzaW5nIGRlcGVuZGVuY2llcyB3aGVuIHRvb2xz
Cmxpa2Ugc2lnbi1maWxlIGFyZSBidWlsdCwgc28gd2UgYWRkIHRoZW0gZXhwbGljaXRseSB0byB0
aGUgcmVjaXBlCmFuZCBhdm9pZCBhbnkgcmFjZXMgb3IgaW1wbGljaXQgZGVwZW5kZW5jaWVzLgoK
U2lnbmVkLW9mZi1ieTogQnJ1Y2UgQXNoZmllbGQgPGJydWNlLmFzaGZpZWxkQGdtYWlsLmNvbT4K
LS0tCiAuLi4vbWFrZS1tb2Qtc2NyaXB0cy9tYWtlLW1vZC1zY3JpcHRzXzEuMC5iYiAgfCAzMCAr
KysrKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMta2VybmVsL21ha2UtbW9kLXNj
cmlwdHMvbWFrZS1tb2Qtc2NyaXB0c18xLjAuYmIgYi9tZXRhL3JlY2lwZXMta2VybmVsL21ha2Ut
bW9kLXNjcmlwdHMvbWFrZS1tb2Qtc2NyaXB0c18xLjAuYmIKaW5kZXggMjhlMDgwN2QxZC4uMWM5
NzJmMGQ0NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWtlcm5lbC9tYWtlLW1vZC1zY3JpcHRz
L21ha2UtbW9kLXNjcmlwdHNfMS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbWFrZS1t
b2Qtc2NyaXB0cy9tYWtlLW1vZC1zY3JpcHRzXzEuMC5iYgpAQCAtMTAsMjUgKzEwLDQ5IEBAIFBB
Q0tBR0VfQVJDSCA9ICIke01BQ0hJTkVfQVJDSH0iCiAKIFMgPSAiJHtXT1JLRElSfSIKIAotZG9f
Y29uZmlndXJlW2RlcGVuZHNdICs9ICJ2aXJ0dWFsL2tlcm5lbDpkb19zaGFyZWRfd29ya2RpciBv
cGVuc3NsLW5hdGl2ZTpkb19wb3B1bGF0ZV9zeXNyb290IgorIyB6bGliIGlzIHJlcXVpcmVkIHdo
ZW4gbW9kdWxlIHNpZ25pbmcgaXMgZW5hYmxlZAorZG9fY29uZmlndXJlW2RlcGVuZHNdICs9ICJ2
aXJ0dWFsL2tlcm5lbDpkb19zaGFyZWRfd29ya2RpciBvcGVuc3NsLW5hdGl2ZTpkb19wb3B1bGF0
ZV9zeXNyb290IHpsaWItbmF0aXZlOmRvX3BvcHVsYXRlX3N5c3Jvb3QiCiBkb19jb21waWxlW2Rl
cGVuZHNdICs9ICJ2aXJ0dWFsL2tlcm5lbDpkb19jb21waWxlX2tlcm5lbG1vZHVsZXMiCiAKIERF
Vl9QS0dfREVQRU5ERU5DWSA9ICIiCiAKIERFUEVORFMgKz0gImJjLW5hdGl2ZSBiaXNvbi1uYXRp
dmUiCiBERVBFTkRTICs9ICJnbXAtbmF0aXZlIgorIyByZXF1aXJlZCBmb3IgbW9kdWxlIHNpZ25p
bmcgc3VwcG9ydAorREVQRU5EUyArPSAiZWxmdXRpbHMtbmF0aXZlIgogCi1FWFRSQV9PRU1BS0Ug
PSAiIEhPU1RDQz0iJHtCVUlMRF9DQ30gJHtCVUlMRF9DRkxBR1N9ICR7QlVJTERfTERGTEFHU30i
IEhPU1RDUFA9IiR7QlVJTERfQ1BQfSIiCi1FWFRSQV9PRU1BS0UgKz0gIiBIT1NUQ1hYPSIke0JV
SUxEX0NYWH0gJHtCVUlMRF9DWFhGTEFHU30gJHtCVUlMRF9MREZMQUdTfSIgQ1JPU1NfQ09NUElM
RT0ke1RBUkdFVF9QUkVGSVh9IgorIyB3ZSBhcmUgc3RhdGljYWxseSBidWlsZGluZyB0aGUgc3Vw
cG9ydCB0b29scywgc2luY2UgdGhlIG91dHB1dCBvZiB0aGUgYnVpbGQgaXMKKyMgc3RvcmVkIGlu
IFNUQUdJTkdfS0VSTkVMX0JVSUxERElSLiBXZSBkbyBub3Qgd2FudCBhbnkgZHluYW1pYyByZWZl
cmVuY2VzIHRvCisjIGxpYnJhcmllcyB0aGF0IGFyZSBvbmx5IHByZXNlbnQgaW4gdGhlIHJlY2lw
ZSBuYXRpdmUgc3lzcm9vdAorRVhUUkFfT0VNQUtFID0gIiBIT1NUQ0M9IiR7QlVJTERfQ0N9ICR7
QlVJTERfQ0ZMQUdTfSAke0JVSUxEX0xERkxBR1N9IC1zdGF0aWMiIEhPU1RDUFA9IiR7QlVJTERf
Q1BQfSIiCitFWFRSQV9PRU1BS0UgKz0gIiBIT1NUQ1hYPSIke0JVSUxEX0NYWH0gJHtCVUlMRF9D
WFhGTEFHU30gJHtCVUlMRF9MREZMQUdTfSAtc3RhdGljIiBDUk9TU19DT01QSUxFPSR7VEFSR0VU
X1BSRUZJWH0iCiAKICMgQnVpbGQgc29tZSBob3N0IHRvb2xzIHVuZGVyIHdvcmstc2hhcmVkLiAg
Q0MsIExELCBhbmQgQVIgYXJlIHByb2JhYmx5CiAjIG5vdCB1c2VkLCBidXQgdGhpcyBpcyB0aGUg
aGlzdG9yaWNhbCB3YXkgb2YgaW52b2tpbmcgIm1ha2Ugc2NyaXB0cyIuCiAjCiBkb19jb25maWd1
cmUoKSB7CisJIyBzZXR1cCBuYXRpdmUgcGtnLWNvbmZpZyB2YXJpYWJsZXMsIEhPU1RQS0dfQ09O
RklHIGlzIGF2YWlsYWJsZSBpbiBuZXdlciBrZXJuZWxzCisJIyBidXQgd2Uga2VlcCB0aGVzZSB0
byBzdXBwb3J0IG9sZGVyIGtlcm5lbHMgdGhhdCBtYXkgbm90IGhhdmUgdGhlIHZhcmlhYmxlIHRv
CisJIyBhYnN0cmFjdCBjYWxscyB0byBwa2ctY29uZmlnCisJZXhwb3J0IFBLR19DT05GSUdfRElS
PSIke1NUQUdJTkdfRElSX05BVElWRX0ke2xpYmRpcl9uYXRpdmV9L3BrZ2NvbmZpZyIKKwlleHBv
cnQgUEtHX0NPTkZJR19QQVRIPSIkUEtHX0NPTkZJR19ESVI6JHtTVEFHSU5HX0RBVEFESVJfTkFU
SVZFfS9wa2djb25maWciCisJZXhwb3J0IFBLR19DT05GSUdfTElCRElSPSIkUEtHX0NPTkZJR19E
SVIiCisJZXhwb3J0IFBLR19DT05GSUdfU1lTUk9PVF9ESVI9IiIKKworCSMgb3ZlcnJpZGUgQ1JZ
UFRPX0xJQlMgdG8gc3VwcG9ydCBvbGRlciBrZXJuZWxzIHdpdGhvdXQgSE9TVFBLR19DT05GSUcK
KwlDUllQVE9fTElCUz0iJChwa2ctY29uZmlnIC0tc3RhdGljIC0tbGlicyBsaWJjcnlwdG8gMj4v
ZGV2L251bGwgfHwgZWNobyAtbGNyeXB0bykiCisKKwkjIGZvciBwcmUtNS4xNSBrZXJuZWxzCisJ
TElCRUxGX0xJQlM9JChwa2ctY29uZmlnIC0tc3RhdGljIGxpYmVsZiAtLWxpYnMgMj4vZGV2L251
bGwgfHwgZWNobyAtbGVsZikKKwlleHBvcnQgTElCRUxGX0xJQlM9IiRMSUJFTEZfTElCUyAtbHoi
CisJZXhwb3J0IEhPU1RMREZMQUdTPSItbHoiCisKIAl1bnNldCBDRkxBR1MgQ1BQRkxBR1MgQ1hY
RkxBR1MgTERGTEFHUwogCWZvciB0IGluIHByZXBhcmUgc2NyaXB0c19iYXNpYyBzY3JpcHRzOyBk
bwogCQlvZV9ydW5tYWtlIENDPSIke0tFUk5FTF9DQ30iIExEPSIke0tFUk5FTF9MRH0iIFwKIAkJ
QVI9IiR7S0VSTkVMX0FSfSIgT0JKQ09QWT0iJHtLRVJORUxfT0JKQ09QWX0iIFwKKwkJSE9TVFBL
R19DT05GSUc9InBrZy1jb25maWcgLS1zdGF0aWMiIFwKKwkJQ1JZUFRPX0xJQlM9IiR7Q1JZUFRP
X0xJQlN9IiBcCiAJCS1DICR7U1RBR0lOR19LRVJORUxfRElSfSBPPSR7U1RBR0lOR19LRVJORUxf
QlVJTERESVJ9ICR0CiAJZG9uZQogfQotLSAKMi4zNC4xCgo=
--000000000000033ff005fabc64d2--

