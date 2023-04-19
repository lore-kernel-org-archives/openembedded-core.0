Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B884DC77B73
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 22:35:12 +0000 (UTC)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web11.52790.1681943705444232562
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Apr 2023 15:35:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=XZVEin8+;
 spf=pass (domain: gmail.com, ip: 209.85.222.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-772ba5e90bdso23786241.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 15:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681943704; x=1684535704;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k4MCFx7xn3N35jLjG6U0PD0Skc4ImahIFFiIz3hk0zc=;
        b=XZVEin8+x9NmpX+VBnwr9reM2i3r3weqIEwtyqw0BmAVMi/lsAg1hpsypdBa5o1Rbn
         idzURzChz4wL0bSVL8bY4MVxrlRf2Onu8a3+u+eRGEuNEWoJsJT1um5RbISkQgMXJzho
         15d8E5csL6aNwK7u9XzUatb9XZsgPpZof7xiaAcFCCR38Kx1rWEEHBcOS9/BKg1utmHo
         Deyw4C21bXArJQ7NEJHXhus3oBpEy+VATOTkBU87UcwJVJxLEzmgEEOK385DKjhuFPhM
         ZPa/L5QO4mrkHzWmHRDnZ8660PaLa+TnV75lngg1nlURYF2ZV5bHMO0VCG7GazCC1iVd
         RZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681943704; x=1684535704;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k4MCFx7xn3N35jLjG6U0PD0Skc4ImahIFFiIz3hk0zc=;
        b=P8g6WBFjePCwOP34LfthlPysM4ire/ofhb5QehU08iYrN0ZWMUt7+KUk6+Wb0Z5d12
         sQlL7/5IAz6jpYTM9jUD1iNfdQb+0H3jy74ag+ACgjckpRSlAKSC8pogm4eEAgDriA0j
         lEiyx+Zcc3mIvoMwW1aEBsQYocZQq2v1FLEkzCNlIrxqr63LUlHoAWtP/TUoBQOVueTq
         XLKDdGKlqda38+hxTrOA3Ovc8ERYWSJhjCHT1v91zABCHxWc0tdR9zQSGSCgSDGR23U8
         wNxumrG4JgzYD1uAvEsFHFM3o6z8xoJJ+Sk0ULo68p0ce5XJ9Ag5QfweSb6djvfVkqo0
         tqsA==
X-Gm-Message-State: AAQBX9fKkASK93uc4YXM9EvkyHNTi0+S0ZqqHDoSX9hsNNq+bBGzJIzi
	D3eLL4X/uHZo5fmXTbl9JuSG0twsHWHqLzxLQMk=
X-Google-Smtp-Source: AKy350YX/PWsTYvqU+CmDtA1R9M0/7W3dGKDD/VNLDnp1cisOdG3A5kh/SkRMtU2xkFYXxnTVwgtp24cq+W9HVw3TjE=
X-Received: by 2002:a67:c389:0:b0:42e:9b1e:1db4 with SMTP id
 s9-20020a67c389000000b0042e9b1e1db4mr113284vsj.1.1681943704263; Wed, 19 Apr
 2023 15:35:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230416103052.28268-1-christoph.lauer@email.de>
 <27b6976546dae12e92dd3af28f657c02eca4afe8.camel@linuxfoundation.org>
 <CANPvuRnSPULJzxC0qt=sQLWS5jyx4OkJ2cQobDzHs0LmmBG6MQ@mail.gmail.com>
 <CADkTA4N9Sypxccr0OU6KQxPK5rbsL_mNFGaJ2Zn_jYHL1tNSEg@mail.gmail.com>
 <652908a6640ffc911d46613cb99159086131416f.camel@linuxfoundation.org>
 <CADkTA4MBh46pqJoQjW4dhOc3Sw-4+rr-u4d48OPSs9eC1VPx8A@mail.gmail.com>
 <CANPvuR=M0-ndA609d2i43rgVVSPrHzEeo5o7orRjmeR9BA5_QQ@mail.gmail.com> <CADkTA4MMj6qUNHyjNV6QxE0iZAwA8=Ur6Ks4_7ETJtmrv6TrNA@mail.gmail.com>
In-Reply-To: <CADkTA4MMj6qUNHyjNV6QxE0iZAwA8=Ur6Ks4_7ETJtmrv6TrNA@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 19 Apr 2023 23:34:53 +0100
Message-ID: <CANPvuRmb7Kh3hgjZEcr1vU4czrULvLYabk3apBERQbo4RJ8y3w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] make-mod-scripts: preserve libraries when
 rm_work is used
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Christoph Lauer <christoph.lauer@email.de>, openembedded-core@lists.openembedded.org, 
	Christoph Lauer <christoph.lauer@xtronic.de>
Content-Type: multipart/alternative; boundary="00000000000006620305f9b80938"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 22:35:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180230

--00000000000006620305f9b80938
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Not related with the previous discussion but just for your information.
The rm_work.bbclass has an exception for the kernel recipes [1].
So I don't understand why we can't do the same for the make-mod-scripts
who is the twin brother of all these kernel recipes.

[1]
https://git.openembedded.org/openembedded-core/tree/meta/classes/rm_work.bb=
class#n168

Jose


Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia quarta,
19/04/2023 =C3=A0(s) 14:59:

> On Wed, Apr 19, 2023 at 9:52=E2=80=AFAM Jose Quaresma <quaresma.jose@gmai=
l.com>
> wrote:
> >
> >
> >
> > Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia ter=C3=A7a,
> 18/04/2023 =C3=A0(s) 22:12:
> >>
> >> On Tue, Apr 18, 2023 at 5:04=E2=80=AFPM Richard Purdie
> >> <richard.purdie@linuxfoundation.org> wrote:
> >> >
> >> > On Tue, 2023-04-18 at 16:25 -0400, Bruce Ashfield wrote:
> >> > > On Mon, Apr 17, 2023 at 6:31=E2=80=AFPM Jose Quaresma <
> quaresma.jose@gmail.com> wrote:
> >> > > >
> >> > > >
> >> > > >
> >> > > > Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no
> dia segunda, 17/04/2023 =C3=A0(s) 20:51:
> >> > > > >
> >> > > > > On Sun, 2023-04-16 at 12:30 +0200, Christoph Lauer wrote:
> >> > > > > > From: Christoph Lauer <christoph.lauer@xtronic.de>
> >> > > > > >
> >> > > > > > With rm_work active, external module signing throws an error=
:
> >> > > > > > scripts/sign-file: error while loading shared libraries:
> libcrypto.so.3: cannot open shared object file: No such file or directory
> >> > > > > > Preserve libraries that sign-file script needs during runtim=
e.
> >> > > > > >
> >> > > > > > Signed-off-by: Christoph Lauer <christoph.lauer@xtronic.de>
> >> > > > > > ---
> >> > > > > >  meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.b=
b
> | 3 +++
> >> > > > > >  1 file changed, 3 insertions(+)
> >> > > > > >
> >> > > > > > diff --git a/meta/recipes-kernel/make-mod-scripts/
> make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/
> make-mod-scripts_1.0.bb
> >> > > > > > index 28e0807d1d..0e24efc597 100644
> >> > > > > > --- a/meta/recipes-kernel/make-mod-scripts/
> make-mod-scripts_1.0.bb
> >> > > > > > +++ b/meta/recipes-kernel/make-mod-scripts/
> make-mod-scripts_1.0.bb
> >> > > > > > @@ -32,3 +32,6 @@ do_configure() {
> >> > > > > >               -C ${STAGING_KERNEL_DIR}
> O=3D${STAGING_KERNEL_BUILDDIR} $t
> >> > > > > >       done
> >> > > > > >  }
> >> > > > > > +
> >> > > > > > +# keep native libraries required for module signing
> >> > > > > > +RM_WORK_EXCLUDE_ITEMS +=3D "recipe-sysroot-native"
> >> > > > >
> >> > > > > I'm really reluctant to take this change as it isn't the way
> >> > > > > dependencies are meant to work.
> >> > > > >
> >> > > > > It sounds like something in a shared workdir is depending on
> something
> >> > > > > in a recipe workdir and we simply don't support that.
> Everything needed
> >> > > > > should be in the shared workdir. At best this is a bandaid and
> there
> >> > > > > will be other ways to make this fail such as cleaning
> make-mod-scripts.
> >> > > >
> >> > > >
> >> > > > The problem is because for signing the kernel modules the
> sign-file.c [1] is linked dynamically with openssl-native.
> >> > > > This works when building the in tree kernel modules but will fai=
l
> when we try to sing any out of tree kernel module.
> >> > > > To sign the out of tree kernel we will use the binaries from the
> shared workdir but the native libcrypto.so.3 is removed by
> >> > > > the rm_work bbclass. We need to link the sign-file statically
> otherwise it will not work with the rm_work bbclass.
> >> > > >
> >> > > > [1]
> https://github.com/torvalds/linux/blob/master/scripts/sign-file.c
> >> > > >
> >> > > > Another solution for this problem can be changing the
> make-mod-scripts to be a native tool and in this way
> >> > > > they will be installed and the dependencies will be handled
> correctly.
> >> > >
> >> > > There would very likely be different issues if the scripts were
> >> > > generated and then packaged as a native tool / package. Since they
> are
> >> > > so tightly coupled to the kernel. We'd just trade one set of issue=
s
> >> > > for another (out of sync artifacts, etc).
> >
> >
> > Maybe some new issues will come with this change but this will be more
> aligned with
> > majority of the other tools. This is something I will keep in my TODO
> list.
> >
> >>
> >> > >
> >> > > I'm going to hack on this a bit.
> >> > >
> >> > > That being said, I've never done any module signing .. since I don=
't
> >> > > need it in my development workflow.
> >> > >
> >> > > Is there a canonical guide to getting it setup so I can test my
> static
> >> > > link and relocated artifacts fixes ? is it with meta-integrity and
> the
> >> > > kernel-modsign bbclass ?
> >
> >
> > Yes, I am using the kernel-modsign bbclass of meta-security.
> > The step to needed is add modsign in DISTRO_FUTURES and
> > provide the required keys setting the MODSIGN_* variable in the bbclass
> >
> >> >
> >> > I did think about this a bit more. It does likely depend on the
> version
> >> > of libcrypto from the host system as to whether it reproduces or not=
.
> >> > The possible solution ideas I came up with are:
> >> >
> >> > a) statically link sign-file so we don't need libcrypto
> >> > b) copy the libcrypto.so into a known location in the shared workdir
> >> > (probably some new path) and then adding an RPATH/RUNPATH using
> chrpath
> >> > to the binary.
> >>
> >> Agreed. I have sign-file statically building here, and it works, but
> >> objtool is blowing up under static linking.
> >
> >
> > Building the sign-file statically looks like a good solution but I have
> no idea of the side effects.
>
> There's no side effects to the tool itself (outside of the normal "the
> binary is a bit larger", etc, it is some of the other utilities that
> are causing issues.
>
> >
> >>
> >>
> >> If I can't break the tools into separate bits, or fix that static link
> >> .. My other idea is the same as yours, if we copy out the .so and make
> >> sure it is in a recognized location in the artifacts dir, we are good
> >> to go.
> >
> >
> > But I believe that for copying it will require copying the full native
> sysroot dependency chain and
> > not only libcrypto.so.
>
> The only thing missing is libcrypto (from my checking), so it doesn't
> look like we'd need any more than that. But yes, it would be expected
> we'd have to bring in all the requirements (but many of the common
> ones are already provided by the default native environment).
>
> Bruce
>
> >
> > Jose
> >
> >>
> >>
> >> Bruce
> >>
> >> >
> >> > Cheers,
> >> >
> >> > Richard
> >> >
> >> >
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

--00000000000006620305f9b80938
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br>Not related with the previous discussion but j=
ust for your=C2=A0information.<div>The rm_work.bbclass has an exception for=
 the kernel recipes [1].<br>So I don&#39;t understand why we can&#39;t do t=
he same for the make-mod-scripts<div>who is the twin brother of all these k=
ernel recipes.<br></div><div><br></div><div>[1] <a href=3D"https://git.open=
embedded.org/openembedded-core/tree/meta/classes/rm_work.bbclass#n168">http=
s://git.openembedded.org/openembedded-core/tree/meta/classes/rm_work.bbclas=
s#n168</a><br><br>Jose<br><br></div></div></div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">Bruce Ashfield &lt;<a href=
=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; escre=
veu no dia quarta, 19/04/2023 =C3=A0(s) 14:59:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Wed, Apr 19, 2023 at 9:52=E2=80=AFAM Jo=
se Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank=
">quaresma.jose@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=
=3D"_blank">bruce.ashfield@gmail.com</a>&gt; escreveu no dia ter=C3=A7a, 18=
/04/2023 =C3=A0(s) 22:12:<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Apr 18, 2023 at 5:04=E2=80=AFPM Richard Purdie<br>
&gt;&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=
=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On Tue, 2023-04-18 at 16:25 -0400, Bruce Ashfield wrote:<br>
&gt;&gt; &gt; &gt; On Mon, Apr 17, 2023 at 6:31=E2=80=AFPM Jose Quaresma &l=
t;<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jos=
e@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; Richard Purdie &lt;<a href=3D"mailto:richard.purdie=
@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org<=
/a>&gt; escreveu no dia segunda, 17/04/2023 =C3=A0(s) 20:51:<br>
&gt;&gt; &gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; &gt; On Sun, 2023-04-16 at 12:30 +0200, Christoph L=
auer wrote:<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt; From: Christoph Lauer &lt;<a href=3D"mail=
to:christoph.lauer@xtronic.de" target=3D"_blank">christoph.lauer@xtronic.de=
</a>&gt;<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt; With rm_work active, external module sign=
ing throws an error:<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt; scripts/sign-file: error while loading sh=
ared libraries: libcrypto.so.3: cannot open shared object file: No such fil=
e or directory<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt; Preserve libraries that sign-file script =
needs during runtime.<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt; Signed-off-by: Christoph Lauer &lt;<a hre=
f=3D"mailto:christoph.lauer@xtronic.de" target=3D"_blank">christoph.lauer@x=
tronic.de</a>&gt;<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt; ---<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 meta/recipes-kernel/make-mod-script=
s/<a href=3D"http://make-mod-scripts_1.0.bb" rel=3D"noreferrer" target=3D"_=
blank">make-mod-scripts_1.0.bb</a> | 3 +++<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 1 file changed, 3 insertions(+)<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt; diff --git a/meta/recipes-kernel/make-mod=
-scripts/<a href=3D"http://make-mod-scripts_1.0.bb" rel=3D"noreferrer" targ=
et=3D"_blank">make-mod-scripts_1.0.bb</a> b/meta/recipes-kernel/make-mod-sc=
ripts/<a href=3D"http://make-mod-scripts_1.0.bb" rel=3D"noreferrer" target=
=3D"_blank">make-mod-scripts_1.0.bb</a><br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt; index 28e0807d1d..0e24efc597 100644<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt; --- a/meta/recipes-kernel/make-mod-script=
s/<a href=3D"http://make-mod-scripts_1.0.bb" rel=3D"noreferrer" target=3D"_=
blank">make-mod-scripts_1.0.bb</a><br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt; +++ b/meta/recipes-kernel/make-mod-script=
s/<a href=3D"http://make-mod-scripts_1.0.bb" rel=3D"noreferrer" target=3D"_=
blank">make-mod-scripts_1.0.bb</a><br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt; @@ -32,3 +32,6 @@ do_configure() {<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0-C ${STAGING_KERNEL_DIR} O=3D${STAGING_KERNEL_BUILDDIR} $t<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0done<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt;=C2=A0 }<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt; +<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt; +# keep native libraries required for mod=
ule signing<br>
&gt;&gt; &gt; &gt; &gt; &gt; &gt; +RM_WORK_EXCLUDE_ITEMS +=3D &quot;recipe-=
sysroot-native&quot;<br>
&gt;&gt; &gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; &gt; I&#39;m really reluctant to take this change a=
s it isn&#39;t the way<br>
&gt;&gt; &gt; &gt; &gt; &gt; dependencies are meant to work.<br>
&gt;&gt; &gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; &gt; It sounds like something in a shared workdir i=
s depending on something<br>
&gt;&gt; &gt; &gt; &gt; &gt; in a recipe workdir and we simply don&#39;t su=
pport that. Everything needed<br>
&gt;&gt; &gt; &gt; &gt; &gt; should be in the shared workdir. At best this =
is a bandaid and there<br>
&gt;&gt; &gt; &gt; &gt; &gt; will be other ways to make this fail such as c=
leaning make-mod-scripts.<br>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; The problem is because for signing the kernel modul=
es the sign-file.c [1] is linked dynamically with openssl-native.<br>
&gt;&gt; &gt; &gt; &gt; This works when building the in tree kernel modules=
 but will fail when we try to sing any out of tree kernel module.<br>
&gt;&gt; &gt; &gt; &gt; To sign the out of tree kernel we will use the bina=
ries from the shared workdir but the native libcrypto.so.3 is removed by<br=
>
&gt;&gt; &gt; &gt; &gt; the rm_work bbclass. We need to link the sign-file =
statically otherwise it will not work with the rm_work bbclass.<br>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; [1] <a href=3D"https://github.com/torvalds/linux/bl=
ob/master/scripts/sign-file.c" rel=3D"noreferrer" target=3D"_blank">https:/=
/github.com/torvalds/linux/blob/master/scripts/sign-file.c</a><br>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; Another solution for this problem can be changing t=
he make-mod-scripts to be a native tool and in this way<br>
&gt;&gt; &gt; &gt; &gt; they will be installed and the dependencies will be=
 handled correctly.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; There would very likely be different issues if the scrip=
ts were<br>
&gt;&gt; &gt; &gt; generated and then packaged as a native tool / package. =
Since they are<br>
&gt;&gt; &gt; &gt; so tightly coupled to the kernel. We&#39;d just trade on=
e set of issues<br>
&gt;&gt; &gt; &gt; for another (out of sync artifacts, etc).<br>
&gt;<br>
&gt;<br>
&gt; Maybe some new issues will come with this change but this will be more=
 aligned with<br>
&gt; majority of the other tools. This is something I will keep in my TODO =
list.<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; I&#39;m going to hack on this a bit.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; That being said, I&#39;ve never done any module signing =
.. since I don&#39;t<br>
&gt;&gt; &gt; &gt; need it in my development workflow.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Is there a canonical guide to getting it setup so I can =
test my static<br>
&gt;&gt; &gt; &gt; link and relocated artifacts fixes ? is it with meta-int=
egrity and the<br>
&gt;&gt; &gt; &gt; kernel-modsign bbclass ?<br>
&gt;<br>
&gt;<br>
&gt; Yes, I am using the kernel-modsign bbclass of meta-security.<br>
&gt; The step to needed is add modsign in DISTRO_FUTURES and<br>
&gt; provide the required keys setting the MODSIGN_* variable in the bbclas=
s<br>
&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I did think about this a bit more. It does likely depend on t=
he version<br>
&gt;&gt; &gt; of libcrypto from the host system as to whether it reproduces=
 or not.<br>
&gt;&gt; &gt; The possible solution ideas I came up with are:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; a) statically link sign-file so we don&#39;t need libcrypto<b=
r>
&gt;&gt; &gt; b) copy the libcrypto.so into a known location in the shared =
workdir<br>
&gt;&gt; &gt; (probably some new path) and then adding an RPATH/RUNPATH usi=
ng chrpath<br>
&gt;&gt; &gt; to the binary.<br>
&gt;&gt;<br>
&gt;&gt; Agreed. I have sign-file statically building here, and it works, b=
ut<br>
&gt;&gt; objtool is blowing up under static linking.<br>
&gt;<br>
&gt;<br>
&gt; Building the sign-file statically looks like a good solution but I hav=
e no idea of the side effects.<br>
<br>
There&#39;s no side effects to the tool itself (outside of the normal &quot=
;the<br>
binary is a bit larger&quot;, etc, it is some of the other utilities that<b=
r>
are causing issues.<br>
<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; If I can&#39;t break the tools into separate bits, or fix that sta=
tic link<br>
&gt;&gt; .. My other idea is the same as yours, if we copy out the .so and =
make<br>
&gt;&gt; sure it is in a recognized location in the artifacts dir, we are g=
ood<br>
&gt;&gt; to go.<br>
&gt;<br>
&gt;<br>
&gt; But I believe that for copying it will require copying the full native=
 sysroot dependency chain and<br>
&gt; not only libcrypto.so.<br>
<br>
The only thing missing is libcrypto (from my checking), so it doesn&#39;t<b=
r>
look like we&#39;d need any more than that. But yes, it would be expected<b=
r>
we&#39;d have to bring in all the requirements (but many of the common<br>
ones are already provided by the default native environment).<br>
<br>
Bruce<br>
<br>
&gt;<br>
&gt; Jose<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Bruce<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Cheers,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Richard<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
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
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div>

--00000000000006620305f9b80938--

