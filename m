Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D68C77B75
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 20:29:35 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.web10.20941.1681849769661681764
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Apr 2023 13:29:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ZPMjffOc;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-54fb615ac3dso260782617b3.2
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 13:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681849769; x=1684441769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5VqcX8r3ezgdKGCOGrawywqwOZMKtp9Oc2zvEQMIrI=;
        b=ZPMjffOckG4FDqJvTqvh4fkWM/8GJCDwKrV0sGeWAS3DOCrUwJOq8bY4qJdcsmU5Fr
         IgGyIA3Wgx6hm+3Sb0j/fGAC/XClCrX2MqAXC5p010Dw+qDvObBcIQeMliGs7YJJmgJS
         AZoc6hBdUd1ncInseoNcvkUpaNmX28yWCrVY5xRsKEboiL+keYqipOZGhjAWzFiKyASt
         Pvf6MrQYN6LkLGa14xx3nsgkv12chmDl9czbf6QErUt4+VxLB4zLP1IoQuRBYlMRLJg5
         jtToHlUw+7yOrQ/cMgoyNzRsztYdV5J7Y12hrlpiy/49fN0fvyOBLakvulzCrpWIbpi/
         HIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681849769; x=1684441769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5VqcX8r3ezgdKGCOGrawywqwOZMKtp9Oc2zvEQMIrI=;
        b=QZz0T2Zv669KNTebTlEBM5xfkItFS44xKlxpggtB/2aI43KJTWWDCPQZ8q5HFDmDQ0
         z5YLVhIjhk6woNQII674JshAQxjf1QcB2AcATOgIhDXax8WbNBeN8XDafnSJsZne3gPG
         3RKd24toIiYb7fDmfKJSzEFDzY37W2R1F6KB50QO7kprADRMyp4No6ECB4Wu9dnT6gpr
         9ts0lmkPR2uK0Ze0sePT+Exm9mZrDWMBjXIEyovtaosLU/2pegtY8t2PoOjsHlrNS23X
         tRa9kpRKCS4ijMoHySzpY9j/zrGEd0+4KwE0+gG3oztmkfuY7z47U1/edMfBHCp6GHK+
         Jbdg==
X-Gm-Message-State: AAQBX9cMqFvrEaFMdAjWHVws0ApYUt2cVhwLqE1RV0FKBdeFri5i5Kzx
	am43YKf9WNps7khIl9UCDg+jGdRHEOez3h2Ax28ajltKTJE=
X-Google-Smtp-Source: AKy350YYB5ZLQ/Fmxc30NJy2Q40Uv46m8DExE6Ol1H2bDs7kPXDukcGmyjcYMA00gpNOPwpyT5NMbHldwwAhfff/Qjk=
X-Received: by 2002:a0d:e287:0:b0:54f:752e:9e60 with SMTP id
 l129-20020a0de287000000b0054f752e9e60mr1012862ywe.37.1681849768706; Tue, 18
 Apr 2023 13:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230416103052.28268-1-christoph.lauer@email.de>
 <27b6976546dae12e92dd3af28f657c02eca4afe8.camel@linuxfoundation.org>
 <CANPvuRnSPULJzxC0qt=sQLWS5jyx4OkJ2cQobDzHs0LmmBG6MQ@mail.gmail.com> <175721425ED7411C.26280@lists.openembedded.org>
In-Reply-To: <175721425ED7411C.26280@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 18 Apr 2023 16:29:17 -0400
Message-ID: <CADkTA4OFCUbEagN5HbVEA2-4ruT0QpgaSPbzHEgvF5rUous_WQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] make-mod-scripts: preserve libraries when
 rm_work is used
To: bruce.ashfield@gmail.com
Cc: Jose Quaresma <quaresma.jose@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Christoph Lauer <christoph.lauer@email.de>, openembedded-core@lists.openembedded.org, 
	Christoph Lauer <christoph.lauer@xtronic.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Apr 2023 20:29:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180201

On Tue, Apr 18, 2023 at 4:25=E2=80=AFPM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>
> On Mon, Apr 17, 2023 at 6:31=E2=80=AFPM Jose Quaresma <quaresma.jose@gmai=
l.com> wrote:
> >
> >
> >
> > Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia seg=
unda, 17/04/2023 =C3=A0(s) 20:51:
> >>
> >> On Sun, 2023-04-16 at 12:30 +0200, Christoph Lauer wrote:
> >> > From: Christoph Lauer <christoph.lauer@xtronic.de>
> >> >
> >> > With rm_work active, external module signing throws an error:
> >> > scripts/sign-file: error while loading shared libraries: libcrypto.s=
o.3: cannot open shared object file: No such file or directory
> >> > Preserve libraries that sign-file script needs during runtime.
> >> >
> >> > Signed-off-by: Christoph Lauer <christoph.lauer@xtronic.de>
> >> > ---
> >> >  meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 3 ++=
+
> >> >  1 file changed, 3 insertions(+)
> >> >
> >> > diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1=
.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> >> > index 28e0807d1d..0e24efc597 100644
> >> > --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> >> > +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> >> > @@ -32,3 +32,6 @@ do_configure() {
> >> >               -C ${STAGING_KERNEL_DIR} O=3D${STAGING_KERNEL_BUILDDIR=
} $t
> >> >       done
> >> >  }
> >> > +
> >> > +# keep native libraries required for module signing
> >> > +RM_WORK_EXCLUDE_ITEMS +=3D "recipe-sysroot-native"
> >>
> >> I'm really reluctant to take this change as it isn't the way
> >> dependencies are meant to work.
> >>
> >> It sounds like something in a shared workdir is depending on something
> >> in a recipe workdir and we simply don't support that. Everything neede=
d
> >> should be in the shared workdir. At best this is a bandaid and there
> >> will be other ways to make this fail such as cleaning make-mod-scripts=
.
> >
> >
> > The problem is because for signing the kernel modules the sign-file.c [=
1] is linked dynamically with openssl-native.
> > This works when building the in tree kernel modules but will fail when =
we try to sing any out of tree kernel module.
> > To sign the out of tree kernel we will use the binaries from the shared=
 workdir but the native libcrypto.so.3 is removed by
> > the rm_work bbclass. We need to link the sign-file statically otherwise=
 it will not work with the rm_work bbclass.
> >
> > [1] https://github.com/torvalds/linux/blob/master/scripts/sign-file.c
> >
> > Another solution for this problem can be changing the make-mod-scripts =
to be a native tool and in this way
> > they will be installed and the dependencies will be handled correctly.
>
> There would very likely be different issues if the scripts were
> generated and then packaged as a native tool / package. Since they are
> so tightly coupled to the kernel. We'd just trade one set of issues
> for another (out of sync artifacts, etc).
>
> I'm going to hack on this a bit.
>
> That being said, I've never done any module signing .. since I don't
> need it in my development workflow.
>
> Is there a canonical guide to getting it setup so I can test my static
> link and relocated artifacts fixes ? is it with meta-integrity and the
> kernel-modsign bbclass ?

or are you maining just using the force-signing fragments (or
equivalent) kernel configuration ?

Bruce

>
> Bruce
>
>
> Bruce
>
> >
> >>
> >> I'm even less keen to take it when I think it's going to be backported
> >> "everywhere" as if is the correct solution too.
> >>
> >> I don't know what the right fix is unfortunately. I'm sure people woul=
d
> >> like me to think about it and come up with one but there are simply to=
o
> >> many different things people would like me to do that with and even fo=
r
> >> me, it does take a while to work these things out. I'm just out of
> >> bandwidth, sorry :(
> >
> >
> > It is true that it is not the correct solution but it is the most suita=
ble in my opinion.
> > I totally understand what you say and I'm a little sorry that I could s=
till help in this same fix.
> >
> > This problem is something I would also like to fix because I am using t=
he RM_WORK_EXCLUDE
> > for quite some time to fix this issue on my distro.
> > I would like to convert the make-mod-scripts to be a native tool but I =
haven't had time for that either.
> >
> > Sorry and thank you for all your dedication and help.
> >
> > Jose
> >
> >>
> >> Cheers,
> >>
> >> Richard
> >>
> >>
> >>
> >>
> >>
> >
> >
> > --
> > Best regards,
> >
> > Jos=C3=A9 Quaresma
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180200): https://lists.openembedded.org/g/openembedde=
d-core/message/180200
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

