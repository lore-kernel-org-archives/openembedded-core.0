Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B095C77B73
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 22:32:44 +0000 (UTC)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
 by mx.groups.io with SMTP id smtpd.web10.6287.1682634754145273916
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Apr 2023 15:32:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=mR9y+/Yj;
 spf=pass (domain: gmail.com, ip: 209.85.217.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-43278f6d551so395842137.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 15:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682634753; x=1685226753;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g+jHRmf2nT7cFIdxN+pFbzxks1Ef5nHzl1pdSJM7KC0=;
        b=mR9y+/YjcAFifvvZ8lTLLVEEGWyKnNHuqgdpjavVeBCpHGmU2kUSk9bsqqS9MxmEqC
         MrFfWD168yjEYyx/5fVepjHEyEcF+6sH/Bc8C3rq04cvjX+Uljl8A0rHaBgjQVquVs4W
         gMTF85YErU4zHBbKkuecgz6rcKe7HyZWfwWMZYOjESG2Da7zVnz/VcJDv8UnoJELUd3h
         /mfxXJeX4VitdoGtVGKz4JknO66DXlw+Hew3iqjeK6hhvH3rnnyqeGvpoFFOBiEVS76P
         3akdR4CbNeNXe1lrEqRokwnn3bZYm9RzLL09huBnp2A/58igYDNm0yuQIvwigF0s+Duy
         5YNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682634753; x=1685226753;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g+jHRmf2nT7cFIdxN+pFbzxks1Ef5nHzl1pdSJM7KC0=;
        b=LQYJCvAUqaK1Re+8hI8+r51k4MYp5MFKgmsRtgjhGVuIiCOtTQp7TftR3A7RxZpy0v
         TUCWTLWZaR612FKOIgTkDNBRxjvJ8hHMNVixqJdntKSK0l42Mu4GF60lVQRNj4s4BGnV
         DIjm5PoMyd4dzKyQZrs52ig+6CwjujebywHLu+kkOUbQ8BMj4XqihpWrFt6sjkEdOr7O
         P0MJiOA/mW7CRDoy+9xJulSUkN05kCyza0z9cawLfQHr2Mn6uEsdf7+xqrh+rpd6hEQQ
         jhxEB13eBxfalZqPu5i8ZM6HA7ENyOysMkJRiKqDdabK9RYosv4jsxUzmX3uOvDpA561
         HN8g==
X-Gm-Message-State: AC+VfDya2suo1fIojUBa5lAonEKip1/GA0j6cyrzmyyE6n1bmZ5Vxvg0
	IJY91tFw+r/rknSmmOoQ3H/jhEeDppCmMKNdw00=
X-Google-Smtp-Source: ACHHUZ4Ur3TmOm+G7Hl+2jBo2rVlbgZcYF0DSffRekxNhU+uKAeEq2GN2XaRxKyZy+2CygI5RBi0vj7tF81nmkNfN14=
X-Received: by 2002:a05:6102:2826:b0:430:4b20:17c0 with SMTP id
 ba6-20020a056102282600b004304b2017c0mr1647948vsb.20.1682634752884; Thu, 27
 Apr 2023 15:32:32 -0700 (PDT)
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
 <CANPvuRnWCXKCyYEmrLfGRxmrC0w4dDnSNN_H3-LfmOyctQ9XwA@mail.gmail.com> <CADkTA4MwPcPnqQaAPDP-5vR=aEzKFDq9OaA=NA0hspKB2Nzz6w@mail.gmail.com>
In-Reply-To: <CADkTA4MwPcPnqQaAPDP-5vR=aEzKFDq9OaA=NA0hspKB2Nzz6w@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 27 Apr 2023 23:32:21 +0100
Message-ID: <CANPvuRk3UyMX7Szh7gc5Ha5E2gWZaOVZXWzuZEd66-zavpnS9Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] make-mod-scripts: preserve libraries when
 rm_work is used
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Christoph Lauer <Christoph.Lauer@email.de>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Christoph Lauer <christoph.lauer@xtronic.de>
Content-Type: multipart/alternative; boundary="000000000000bb840605fa58ee20"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 22:32:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180501

--000000000000bb840605fa58ee20
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

I have been testing your patch and have some comments.
In some of my kernels I don't have the pkg-config changes and so I have
some fails linking the scripts/sign-file
because for static linking with the libcrypto we need the -ldl -pthread.

To fix my build I need to override the CRYPTO_LIBS in my kernel because
they use the hardcoded pkg-config
where it is not possible to pass the --static argument.

With following change on top of your patch I can build moist of my kernels:

        export HOSTLDFLAGS=3D"-lz"

+       HOSTPKG_CONFIG=3D"pkg-config --static"
+       # override CRYPTO_LIBS since HOSTPKG_CONFIG lands only in v5.19-rc1
+       #
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3Dd5ea4fece4508bf8e72b659cd22fa4840d8d61e5
+       CRYPTO_LIBS=3D"$(pkg-config --static --libs libcrypto 2>/dev/null |=
|
echo -lcrypto)"
+
        unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
        for t in prepare scripts_basic scripts; do
                oe_runmake CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" \
                AR=3D"${KERNEL_AR}" OBJCOPY=3D"${KERNEL_OBJCOPY}" \
-               HOSTPKG_CONFIG=3D"pkg-config --static" \
+               HOSTPKG_CONFIG=3D"${HOSTPKG_CONFIG}"
CRYPTO_LIBS=3D"${CRYPTO_LIBS}" \
                -C ${STAGING_KERNEL_DIR} O=3D${STAGING_KERNEL_BUILDDIR} $t
        done


I think belive that the LIBELF_LIBS needs the same fix for the cases where
HOSTPKG_CONFIG is not available.
Also I think there is a typo in the LIBELF_LIBS because you first populate
it with pkg-config but on the export the variable is redefined
with the HOST_LIBELF_LIBS. I made a litle change too on that:

        # for pre-5.15 kernels
-       LIBELF_LIBS=3D$(pkg-config libelf --libs 2>/dev/null || echo -lelf)
-       export LIBELF_LIBS=3D"$HOST_LIBELF_LIBS -lz"
+       LIBELF_LIBS=3D$(pkg-config --static libelf --libs 2>/dev/null || ec=
ho
-lelf)
+       export LIBELF_LIBS=3D"$LIBELF_LIBS -lz"
        export HOSTLDFLAGS=3D"-lz"

Thanks for you help.

Jose

Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia segunda,
24/04/2023 =C3=A0(s) 20:25:

> On Mon, Apr 24, 2023 at 6:30=E2=80=AFAM Jose Quaresma <quaresma.jose@gmai=
l.com>
> wrote:
> >
> >
> >
> > Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia domingo,
> 23/04/2023 =C3=A0(s) 20:55:
> >>
> >> On Sat, Apr 22, 2023 at 9:06=E2=80=AFAM Christoph Lauer
> >> <Christoph.Lauer@email.de> wrote:
> >> >
> >> > Am 21.04.23 um 22:28 schrieb Bruce Ashfield:
> >> > > On Wed, Apr 19, 2023 at 11:03=E2=80=AFPM Bruce Ashfield via
> >> > > lists.openembedded.org
> >> > > <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> >> > >>
> >> > >> On Wed, Apr 19, 2023 at 6:54=E2=80=AFPM Richard Purdie
> >> > >> <richard.purdie@linuxfoundation.org> wrote:
> >> > >>>
> >> > >>> On Wed, 2023-04-19 at 23:34 +0100, Jose Quaresma wrote:
> >> > >>>> Hi,
> >> > >>>>
> >> > >>>> Not related with the previous discussion but just for
> >> > >>>> your information.
> >> > >>>> The rm_work.bbclass has an exception for the kernel recipes [1]=
.
> >> > >>>> So I don't understand why we can't do the same for the make-mod=
-
> >> > >>>> scripts
> >> > >>>> who is the twin brother of all these kernel recipes.
> >> > >>>>
> >> > >>>> [1]
> >> > >>>>
> https://git.openembedded.org/openembedded-core/tree/meta/classes/rm_work.=
bbclass#n168
> >> > >>>
> >> > >>> Ideally we wouldn't be doing this for the kernel recipes.
> >> > >>>
> >> > >>> There is also a big difference to that and the proposed patch. T=
he
> >> > >>> proposed patch was preserving a specific directory rather than a=
n
> >> > >>> entire recipe. Removing the task stamps but leaving a small piec=
e
> of
> >> > >>> WORKDIR is quite different to preserving WORKDIR and STAMPS for =
a
> >> > >>> specific recipe. The former is not tested and will break things.
> The
> >> > >>> latter is better tolerated by bitbake.
> >> > >>
> >> > >> Agreed.
> >> > >>
> >> > >> Plus, I am working on this now.
> >> > >>
> >> > >> I have static linking of the scripts/tools working, but what I
> haven't
> >> > >> figured out is how to do that without patching the Makefiles.
> >> > >>
> >> > >
> >> > > It turned out to be quite the battle to get older kernels what was
> >> > > required for static linking of the tools.
> >> > >
> >> > > Attached is my WIP patch. I'm out of the office early next week, b=
ut
> >> > > will revisit it once I'm back.
> >> > >
> >> > > Bruce
> >> > >
> >> > >> Next up will be some rpath trickery.
> >> > >>
> >> > >> Bruce
> >> > >>
> >> > >>>
> >> > >>> So yes, we could do the same. I'm sure there will be other recip=
es
> >> > >>> people want to preserve for other reasons. Where do we draw the
> line?
> >> > >>> We could preserve everything and drop rm_work, then we wouldn't
> have
> >> > >>> these problems? :)
> >> > >>>
> >> > >>> Cheers,
> >> > >>>
> >> > >>> Richard
> >> > >>
> >> > >>
> >> > >>
> >> > >> --
> >> > >> - Thou shalt not follow the NULL pointer, for chaos and madness
> await
> >> > >> thee at its end
> >> > >> - "Use the force Harry" - Gandalf, Star Trek II
> >> > >>
> >> > >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> > >> Links: You receive all messages sent to this group.
> >> > >> View/Reply Online (#180233):
> https://lists.openembedded.org/g/openembedded-core/message/180233
> >> > >> Mute This Topic:
> https://lists.openembedded.org/mt/98296212/1050810
> >> > >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> > >> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> >> > >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> > >>
> >> > >
> >> > >
> >> >
> >> > Thank you for your work, I see you put some time and effort into it.
> >> > HOSTPKG_CONFIG is, as you mentioned, available since kernel version
> 5.19
> >>
> >> Yes, I realize that and documented it in the patch ... but I also
> >> tested on pre-5.19 kernels and what I have in the patch works. Did it
> >> not work in your testing ?
> >
> >
> > I will test the patch on a couple of kernel versions with some of them
> pre-5.19
> > but all in 5 major versions.
> > I will say something about my results later this week.
>
> 5.15-stable also has the pkg-config changes
>
> Bruce
>
> >
> > Thanks for working on this one.
> >
> > Jose
> >
> >>
> >>
> >> > (see kernel patch [1]), so we need a way to call 'pkg-config --stati=
c'
> >> > with pre-5.19 kernels. A way without modifying the Makefile would be
> to
> >> > modify openssls pkg-config in recipe-sysroot-native of
> make-mod-script,
> >> > so 'pkg-config --libs' actually shows the dependencies of 'pkg-confi=
g
> >> > --static --libs', but it's a bit hacky.
> >>
> >> Already considered, and discarded. That's not going to fly.
> >>
> >> >
> >> > Also fully-static executables still need the same glibc during runti=
me
> >> > that they were built with, which makes them error-prone and is
> generally
> >> > discouraged. As an alternative, we could build dynamic executables
> that
> >> > use the static libcrypto library. The linker links by default agains=
t
> >> > the shared library, so we could remove them from recipe-sysroot-nati=
ve
> >> > to force linking against the static library (again, somewhat hacky).
> >>
> >> Also considered and discarded.
> >>
> >> As do the dynamically linked ones for the c runtime. We aren't talking
> >> about using these outside of a single build and they are generated on
> >> the fly, so again, there's very little concern about runtimes changing
> >> after linking.. There's less risk in static than in the alternatives.
> >>
> >> Bruce
> >>
> >>
> >> >
> >> > [1]
> >> >
> https://github.com/torvalds/linux/commit/d5ea4fece4508bf8e72b659cd22fa484=
0d8d61e5
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


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000bb840605fa58ee20
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Bruce,</div><div><br></div><div>I have been testin=
g your patch and have some comments.<br>In some of my kernels I don&#39;t h=
ave the pkg-config changes and so I have some fails linking the scripts/sig=
n-file<br></div>because for static linking with the libcrypto we need the -=
ldl -pthread.<br><div><br></div><div>To fix my build I need to override the=
 CRYPTO_LIBS in my kernel because they use the hardcoded pkg-config=C2=A0<b=
r><div>where it is not possible to pass the --static argument.</div><div><b=
r></div><div>With following change on top of your patch I can build moist=
=C2=A0of my kernels:<br><br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 export HOSTLDFLAGS=
=3D&quot;-lz&quot;<br>=C2=A0<br>+ =C2=A0 =C2=A0 =C2=A0 HOSTPKG_CONFIG=3D&qu=
ot;pkg-config --static&quot;<br>+ =C2=A0 =C2=A0 =C2=A0 # override CRYPTO_LI=
BS since HOSTPKG_CONFIG lands only in v5.19-rc1<br>+ =C2=A0 =C2=A0 =C2=A0 #=
 <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3Dd5ea4fece4508bf8e72b659cd22fa4840d8d61e5">https://git.kern=
el.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3Dd5ea4fece45=
08bf8e72b659cd22fa4840d8d61e5</a><br>+ =C2=A0 =C2=A0 =C2=A0 CRYPTO_LIBS=3D&=
quot;$(pkg-config --static --libs libcrypto 2&gt;/dev/null || echo -lcrypto=
)&quot;<br>+<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 unset CFLAGS CPPFLAGS CXXFLAGS =
LDFLAGS<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 for t in prepare scripts_basic scrip=
ts; do<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmak=
e CC=3D&quot;${KERNEL_CC}&quot; LD=3D&quot;${KERNEL_LD}&quot; \<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AR=3D&quot;${KERNEL_AR}&qu=
ot; OBJCOPY=3D&quot;${KERNEL_OBJCOPY}&quot; \<br>- =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 HOSTPKG_CONFIG=3D&quot;pkg-config --static&quot; \=
<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 HOSTPKG_CONFIG=3D&qu=
ot;${HOSTPKG_CONFIG}&quot; CRYPTO_LIBS=3D&quot;${CRYPTO_LIBS}&quot; \<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -C ${STAGING_KERNEL=
_DIR} O=3D${STAGING_KERNEL_BUILDDIR} $t<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 done=
<br><div class=3D"gmail_quote"><div class=3D"gmail_attr"><br></div><div cla=
ss=3D"gmail_attr"><br>I think belive that the LIBELF_LIBS needs the same fi=
x for the cases where HOSTPKG_CONFIG is not available.</div><div class=3D"g=
mail_attr">Also I think there is a typo in the LIBELF_LIBS because you firs=
t populate it with pkg-config but on the export the variable is redefined<b=
r></div><div class=3D"gmail_attr">with the HOST_LIBELF_LIBS. I made a litle=
 change too on that:</div><div class=3D"gmail_attr"><br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 # for pre-5.15 kernels<br>- =C2=A0 =C2=A0 =C2=A0 LIBELF_LIBS=3D$=
(pkg-config libelf --libs 2&gt;/dev/null || echo -lelf)<br>- =C2=A0 =C2=A0 =
=C2=A0 export LIBELF_LIBS=3D&quot;$HOST_LIBELF_LIBS -lz&quot;<br>+ =C2=A0 =
=C2=A0 =C2=A0 LIBELF_LIBS=3D$(pkg-config --static libelf --libs 2&gt;/dev/n=
ull || echo -lelf)<br>+ =C2=A0 =C2=A0 =C2=A0 export LIBELF_LIBS=3D&quot;$LI=
BELF_LIBS -lz&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 export HOSTLDFLAGS=3D&qu=
ot;-lz&quot;<br><br>Thanks for you help.<br><br>Jose</div><div dir=3D"ltr" =
class=3D"gmail_attr"><br>Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfiel=
d@gmail.com">bruce.ashfield@gmail.com</a>&gt; escreveu no dia segunda, 24/0=
4/2023 =C3=A0(s) 20:25:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On Mon, Apr 24, 2023 at 6:30=E2=80=AFAM Jose Quaresma &lt;<a href=
=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.c=
om</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=
=3D"_blank">bruce.ashfield@gmail.com</a>&gt; escreveu no dia domingo, 23/04=
/2023 =C3=A0(s) 20:55:<br>
&gt;&gt;<br>
&gt;&gt; On Sat, Apr 22, 2023 at 9:06=E2=80=AFAM Christoph Lauer<br>
&gt;&gt; &lt;<a href=3D"mailto:Christoph.Lauer@email.de" target=3D"_blank">=
Christoph.Lauer@email.de</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Am 21.04.23 um 22:28 schrieb Bruce Ashfield:<br>
&gt;&gt; &gt; &gt; On Wed, Apr 19, 2023 at 11:03=E2=80=AFPM Bruce Ashfield =
via<br>
&gt;&gt; &gt; &gt; <a href=3D"http://lists.openembedded.org" rel=3D"norefer=
rer" target=3D"_blank">lists.openembedded.org</a><br>
&gt;&gt; &gt; &gt; &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.o=
penembedded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt;=
 wrote:<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; On Wed, Apr 19, 2023 at 6:54=E2=80=AFPM Richard Purd=
ie<br>
&gt;&gt; &gt; &gt;&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation=
.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<b=
r>
&gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt; On Wed, 2023-04-19 at 23:34 +0100, Jose Quaresma=
 wrote:<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt; Hi,<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt; Not related with the previous discussion but=
 just for<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt; your information.<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt; The rm_work.bbclass has an exception for the=
 kernel recipes [1].<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt; So I don&#39;t understand why we can&#39;t d=
o the same for the make-mod-<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt; scripts<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt; who is the twin brother of all these kernel =
recipes.<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt; [1]<br>
&gt;&gt; &gt; &gt;&gt;&gt;&gt; <a href=3D"https://git.openembedded.org/open=
embedded-core/tree/meta/classes/rm_work.bbclass#n168" rel=3D"noreferrer" ta=
rget=3D"_blank">https://git.openembedded.org/openembedded-core/tree/meta/cl=
asses/rm_work.bbclass#n168</a><br>
&gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt; Ideally we wouldn&#39;t be doing this for the ke=
rnel recipes.<br>
&gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt; There is also a big difference to that and the p=
roposed patch. The<br>
&gt;&gt; &gt; &gt;&gt;&gt; proposed patch was preserving a specific directo=
ry rather than an<br>
&gt;&gt; &gt; &gt;&gt;&gt; entire recipe. Removing the task stamps but leav=
ing a small piece of<br>
&gt;&gt; &gt; &gt;&gt;&gt; WORKDIR is quite different to preserving WORKDIR=
 and STAMPS for a<br>
&gt;&gt; &gt; &gt;&gt;&gt; specific recipe. The former is not tested and wi=
ll break things. The<br>
&gt;&gt; &gt; &gt;&gt;&gt; latter is better tolerated by bitbake.<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; Agreed.<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; Plus, I am working on this now.<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; I have static linking of the scripts/tools working, =
but what I haven&#39;t<br>
&gt;&gt; &gt; &gt;&gt; figured out is how to do that without patching the M=
akefiles.<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; It turned out to be quite the battle to get older kernel=
s what was<br>
&gt;&gt; &gt; &gt; required for static linking of the tools.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Attached is my WIP patch. I&#39;m out of the office earl=
y next week, but<br>
&gt;&gt; &gt; &gt; will revisit it once I&#39;m back.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Bruce<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;&gt; Next up will be some rpath trickery.<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; Bruce<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt; So yes, we could do the same. I&#39;m sure there=
 will be other recipes<br>
&gt;&gt; &gt; &gt;&gt;&gt; people want to preserve for other reasons. Where=
 do we draw the line?<br>
&gt;&gt; &gt; &gt;&gt;&gt; We could preserve everything and drop rm_work, t=
hen we wouldn&#39;t have<br>
&gt;&gt; &gt; &gt;&gt;&gt; these problems? :)<br>
&gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt; Cheers,<br>
&gt;&gt; &gt; &gt;&gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;&gt; Richard<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; --<br>
&gt;&gt; &gt; &gt;&gt; - Thou shalt not follow the NULL pointer, for chaos =
and madness await<br>
&gt;&gt; &gt; &gt;&gt; thee at its end<br>
&gt;&gt; &gt; &gt;&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Tr=
ek II<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt; &gt;&gt; Links: You receive all messages sent to this group.<=
br>
&gt;&gt; &gt; &gt;&gt; View/Reply Online (#180233): <a href=3D"https://list=
s.openembedded.org/g/openembedded-core/message/180233" rel=3D"noreferrer" t=
arget=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message=
/180233</a><br>
&gt;&gt; &gt; &gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedd=
ed.org/mt/98296212/1050810" rel=3D"noreferrer" target=3D"_blank">https://li=
sts.openembedded.org/mt/98296212/1050810</a><br>
&gt;&gt; &gt; &gt;&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bo=
wner@lists.openembedded.org" target=3D"_blank">openembedded-core+owner@list=
s.openembedded.org</a><br>
&gt;&gt; &gt; &gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.o=
rg/g/openembedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://=
lists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:bru=
ce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt;&gt; &gt; &gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt; &gt;&gt;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Thank you for your work, I see you put some time and effort i=
nto it.<br>
&gt;&gt; &gt; HOSTPKG_CONFIG is, as you mentioned, available since kernel v=
ersion 5.19<br>
&gt;&gt;<br>
&gt;&gt; Yes, I realize that and documented it in the patch ... but I also<=
br>
&gt;&gt; tested on pre-5.19 kernels and what I have in the patch works. Did=
 it<br>
&gt;&gt; not work in your testing ?<br>
&gt;<br>
&gt;<br>
&gt; I will test the patch on a couple of kernel versions with some of them=
 pre-5.19<br>
&gt; but all in 5 major versions.<br>
&gt; I will say something about my results later this week.<br>
<br>
5.15-stable also has the pkg-config changes<br>
<br>
Bruce<br>
<br>
&gt;<br>
&gt; Thanks for working on this one.<br>
&gt;<br>
&gt; Jose<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt; (see kernel patch [1]), so we need a way to call &#39;pkg-con=
fig --static&#39;<br>
&gt;&gt; &gt; with pre-5.19 kernels. A way without modifying the Makefile w=
ould be to<br>
&gt;&gt; &gt; modify openssls pkg-config in recipe-sysroot-native of make-m=
od-script,<br>
&gt;&gt; &gt; so &#39;pkg-config --libs&#39; actually shows the dependencie=
s of &#39;pkg-config<br>
&gt;&gt; &gt; --static --libs&#39;, but it&#39;s a bit hacky.<br>
&gt;&gt;<br>
&gt;&gt; Already considered, and discarded. That&#39;s not going to fly.<br=
>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Also fully-static executables still need the same glibc durin=
g runtime<br>
&gt;&gt; &gt; that they were built with, which makes them error-prone and i=
s generally<br>
&gt;&gt; &gt; discouraged. As an alternative, we could build dynamic execut=
ables that<br>
&gt;&gt; &gt; use the static libcrypto library. The linker links by default=
 against<br>
&gt;&gt; &gt; the shared library, so we could remove them from recipe-sysro=
ot-native<br>
&gt;&gt; &gt; to force linking against the static library (again, somewhat =
hacky).<br>
&gt;&gt;<br>
&gt;&gt; Also considered and discarded.<br>
&gt;&gt;<br>
&gt;&gt; As do the dynamically linked ones for the c runtime. We aren&#39;t=
 talking<br>
&gt;&gt; about using these outside of a single build and they are generated=
 on<br>
&gt;&gt; the fly, so again, there&#39;s very little concern about runtimes =
changing<br>
&gt;&gt; after linking.. There&#39;s less risk in static than in the altern=
atives.<br>
&gt;&gt;<br>
&gt;&gt; Bruce<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; [1]<br>
&gt;&gt; &gt; <a href=3D"https://github.com/torvalds/linux/commit/d5ea4fece=
4508bf8e72b659cd22fa4840d8d61e5" rel=3D"noreferrer" target=3D"_blank">https=
://github.com/torvalds/linux/commit/d5ea4fece4508bf8e72b659cd22fa4840d8d61e=
5</a><br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; - Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait<br>
&gt;&gt; thee at its end<br>
&gt;&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Best regards,<br>
&gt;<br>
&gt; Jos=C3=A9 Quaresma<br>
<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div></div></div>

--000000000000bb840605fa58ee20--

