Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CF17CA0EFA
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 13:57:57 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.65571.1756216668673968237
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 06:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hcVldjBi;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-32326e20aadso6561098a91.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 06:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756216668; x=1756821468; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DrRu7OO2v9Ezjm5Pch8gnEp0f7v6IXv1wT8eykVFP1M=;
        b=hcVldjBiCFoR7bKyQYLC6bOJIvWvDxd1PuNt0+nrc37y+2k0ztyDtPF/z7215GI8j5
         ts29ZX6lIDGEtd762wM2i4ysUaq7BtrC7AktU7+SPx0h9mrau4lV+oaJCBRNCFmhEBEi
         hLavwq5lIaDx+q+zqzheLpyBaHhb3X+XK4kVVGz2zkHAyCJsNHp9RoeFZMmm/UgMuAT0
         WEFfZRHPeh2NHvcXAfDNAoJHRD7TYPvJK7Bshu9uDeFX/ruDFhSOJm65SbPgknGIJbRL
         2+xuEFDh9C+3jyh0xMgyd9vqteZh19UaRzJNhMAyZZQi9SCZWmcp4z6n4uSvgLxzylik
         fSeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756216668; x=1756821468;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DrRu7OO2v9Ezjm5Pch8gnEp0f7v6IXv1wT8eykVFP1M=;
        b=Qd3DOsjbuXhxA+yZbiexwGtUi4+4Yd0Bt4upOklvtCDP8GbJ53lyeULJdUlt7H0TH5
         e21RBNyQkqgLBcOMSSKf4wwdlCcbRWRJcT51g62tbZXHWZ1gxFV/jKMSCiKfIsaL33X5
         /hiaEwGYxgDHPNh8wGky9TgiwLhmCTxHvbtHiVmJVR57tUsZZaC18kAdPCIRlAWFGQz5
         evqpwbtVdDCf1H/p+WK84p7zvw+jOyxZ/rLf4HM4VrnLtY+qTZy69cAjbQqkLJqW9Xgw
         qAWla0X8WTh9tg1ZyaU7dRK2ux0kgZRg0qUpggFJhcQ5nrakaCTQg9spYoFrFq0/Lv20
         XfnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIxn13+JbQKeJ5Ls1orajFCpsjRks/LhL1wW5AGQPF9GzQD2Fa097ELsnUciVNgopeEtjA9uQBD38Lg7sFnomVEg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxjoRbXEm3R3gztsEEXc/Yfe2lwi0Aerin/Pf13Ju2U5wqlKRh4
	/ZNaEpVhtHdeVJE2eScBf9Zf/m0BA7Pf0PUrpx+a8qubpfckHwxyHPyTZ0/8SSPkHJ05dAU3EAE
	lu5eakrDx+8wPWubwpLngRHFSRz+NLJY=
X-Gm-Gg: ASbGncvs3kqgdjgHACrtJraN7PYKbTdnVSX26JzC2hktcLfRk0nXo3IkHuIMyo51lTq
	rKQ06cc1KVLxqPtlUqvOubI5+LbG7gW5+UcseIMUJ+zCnwSDdDNq8D9x3izlOS4CIuu2h8uO0fv
	DH5vxQ69ktBeAt8gutRmsN340jhMcSCMyU+B/gTeka+uFSPeElbR8cFmxcjDSOs+U7ncvRjIci4
	v2wRuzDRo/22tOM1P9hzcdtEPjFWD+j9FwcQnFufo8haMBvSJY=
X-Google-Smtp-Source: AGHT+IH5kiLe2bskQ5gE752bPtvECYUA59r4ajVOmJHMpWNz/uz4awmcAnWi3J6u3AuCMNxvMRHmNi0cMBhoJuQpGX0=
X-Received: by 2002:a17:90b:4b:b0:325:245d:79a1 with SMTP id
 98e67ed59e1d1-325245d7a55mr17447530a91.31.1756216667869; Tue, 26 Aug 2025
 06:57:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1755784780.git.bruce.ashfield@gmail.com>
 <DC92RWVBN7V4.30RLT0SCEWDPC@bootlin.com> <CADkTA4MVTtjd0bRyVHhS8AiWmN+zw7bj2QZcgoUEhcV9zhHVVQ@mail.gmail.com>
 <5fabf7da2300b7efccd2f1403e7d4eb53e22d20b.camel@linuxfoundation.org>
In-Reply-To: <5fabf7da2300b7efccd2f1403e7d4eb53e22d20b.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 26 Aug 2025 10:57:35 -0300
X-Gm-Features: Ac12FXy92lJPvlpTxEHoHqbuwhIzLv5KyNT6TaLEJ2qm866JxjzeUFy5Z7xVrgg
Message-ID: <CADkTA4N-NkDozeTqjCEAWdxrBcZzwcUfhcOychL4nsZcsL31ag@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/4] kernel-yocto: -stable and new reference kernel
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a3160f063d450e08"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 13:57:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222471

--000000000000a3160f063d450e08
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 26, 2025 at 4:15=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2025-08-25 at 23:03 -0300, Bruce Ashfield wrote:
> >
> >
> > On Fri, Aug 22, 2025 at 12:52=E2=80=AFPM Mathieu Dubois-Briand <
> mathieu.dubois-briand@bootlin.com> wrote:
> > > On Thu Aug 21, 2025 at 4:03 PM CEST, Bruce Ashfield via
> lists.openembedded.org wrote:
> > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > >
> > > > Richard,
> > > >
> > > > Here's the next set of updates to the linux-yocto kernel.
> > > >
> > > > The plan is to introduce 6.16 as the latest reference kernel, and
> keep
> > > > 6.12 around (since it is a LTS).
> > > >
> > > > This isn't ready to be the default for builds, but it has passed my
> > > > core-iamge-kernel-dev testing, so I wanted to make the recipes
> available
> > > > as visibility to where we are headed for the release (plus, I'm out
> of
> > > > the office on holidays until the first week of September, so making
> it
> > > > the default would be a bad idea from me being able to support
> issues).
> > > >
> > >
> > > Hi Bruce,
> > >
> > > Thanks for the series.
> > >
> > > I understand this isn't fully ready, but I did launch a full build
> > > anyway: most builders succeed, we just have one warning on config
> > > fragments:
> > >
> > > WARNING: linux-yocto-6.16.2+git-r0 do_kernel_configcheck: [kernel
> config]: specified values did not make it into the kernel's final
> configuration:
> > > ...
> > > [INFO]: config 'CONFIG_CRYPTO_LIB_CHACHA' was set, but it wasn't
> assignable, check (parent) dependencies
> > > ...
> > > [INFO]: config 'CONFIG_CRYPTO_CHACHA20_NEON' was set, but it wasn't
> assignable, check (parent) dependencies
> > > ...
> > > [INFO]: the following symbols were not found in the active
> configuration:
> > >      - CONFIG_CRYPTO_SHA2_ARM_CE
> > >      - CONFIG_CRYPTO_CRC32_ARM_CE
> > >
> > >
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/40/builds/2248
> > >
> >
> > I always find it odd that I can't click on any of the AB tabs (in the
> link you sent) and see what the MACHINE value is for that build.
> >
> > I looked at the writeconfig step of the build and it looks to be
> qemuarm. Which is odd, since I'm not seeing the same warning for that her=
e.
> >
> > When I'm back from holidays next week, I'll have a closer look.
>
> FWIW if you look for the "Write config" step (step 10 in the above
> link) and expand that, it says MACHINE =3D "qemuarm".
>
> It is only hitting that build as it is a nodistro build and hence has a
> floating kernel version.
>

Hmm. I'm of course forcing 6.16 and the latest revs in all my builds, I'd
think
that in theory I should be able see the same thing even with the poky
distro.

I can inspect the configs and see the options in question, so I'm going to
go about recreating it that way versus trying to do a different clone and
distro configuration.

As you guessed, I have very limited time at a keyboard this week, so it
will take a bit for me to follow up.

Bruce



>
> I somehow got the patches the wrong way around and merged the ones with
> the warning but we'll manage with that for now until you're back.
>
> Cheers,
>
> Richard
>
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000a3160f063d450e08
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 26, 2025 at 4:15=
=E2=80=AFAM Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfounda=
tion.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Mon, 2025-08-25 at 23:03 -03=
00, Bruce Ashfield wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Fri, Aug 22, 2025 at 12:52=E2=80=AFPM Mathieu Dubois-Briand &lt;<a =
href=3D"mailto:mathieu.dubois-briand@bootlin.com" target=3D"_blank">mathieu=
.dubois-briand@bootlin.com</a>&gt; wrote:<br>
&gt; &gt; On Thu Aug 21, 2025 at 4:03 PM CEST, Bruce Ashfield via <a href=
=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lis=
ts.openembedded.org</a> wrote:<br>
&gt; &gt; &gt; From: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gm=
ail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Richard,<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Here&#39;s the next set of updates to the linux-yocto kernel=
.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; The plan is to introduce 6.16 as the latest reference kernel=
, and keep<br>
&gt; &gt; &gt; 6.12 around (since it is a LTS).<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; This isn&#39;t ready to be the default for builds, but it ha=
s passed my<br>
&gt; &gt; &gt; core-iamge-kernel-dev testing, so I wanted to make the recip=
es available<br>
&gt; &gt; &gt; as visibility to where we are headed for the release (plus, =
I&#39;m out of<br>
&gt; &gt; &gt; the office on holidays until the first week of September, so=
 making it<br>
&gt; &gt; &gt; the default would be a bad idea from me being able to suppor=
t issues).<br>
&gt; &gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; Hi Bruce,<br>
&gt; &gt; <br>
&gt; &gt; Thanks for the series.<br>
&gt; &gt; <br>
&gt; &gt; I understand this isn&#39;t fully ready, but I did launch a full =
build<br>
&gt; &gt; anyway: most builders succeed, we just have one warning on config=
<br>
&gt; &gt; fragments:<br>
&gt; &gt; <br>
&gt; &gt; WARNING: linux-yocto-6.16.2+git-r0 do_kernel_configcheck: [kernel=
 config]: specified values did not make it into the kernel&#39;s final conf=
iguration:<br>
&gt; &gt; ...<br>
&gt; &gt; [INFO]: config &#39;CONFIG_CRYPTO_LIB_CHACHA&#39; was set, but it=
 wasn&#39;t assignable, check (parent) dependencies<br>
&gt; &gt; ...<br>
&gt; &gt; [INFO]: config &#39;CONFIG_CRYPTO_CHACHA20_NEON&#39; was set, but=
 it wasn&#39;t assignable, check (parent) dependencies<br>
&gt; &gt; ...<br>
&gt; &gt; [INFO]: the following symbols were not found in the active config=
uration:<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0- CONFIG_CRYPTO_SHA2_ARM_CE<br>
&gt; &gt; =C2=A0 =C2=A0 =C2=A0- CONFIG_CRYPTO_CRC32_ARM_CE<br>
&gt; &gt; <br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builde=
rs/40/builds/2248" rel=3D"noreferrer" target=3D"_blank">https://autobuilder=
.yoctoproject.org/valkyrie/#/builders/40/builds/2248</a><br>
&gt; &gt; <br>
&gt; <br>
&gt; I always find it odd that I can&#39;t click on any of the AB tabs (in =
the link you sent) and see what the MACHINE value is for that build.<br>
&gt; <br>
&gt; I looked at the writeconfig step of the build and it looks to be qemua=
rm. Which is odd, since I&#39;m not seeing the same warning for that here.<=
br>
&gt; <br>
&gt; When I&#39;m back from holidays next week, I&#39;ll have a closer look=
.<br>
<br>
FWIW if you look for the &quot;Write config&quot; step (step 10 in the abov=
e<br>
link) and expand that, it says MACHINE =3D &quot;qemuarm&quot;.<br>
<br>
It is only hitting that build as it is a nodistro build and hence has a<br>
floating kernel version.<br></blockquote><div><br></div><div><div class=3D"=
gmail_default" style=3D"font-size:small">Hmm. I&#39;m of course forcing 6.1=
6 and the latest revs in all my builds, I&#39;d think</div><div class=3D"gm=
ail_default" style=3D"font-size:small">that in theory I should be able see =
the same thing even with the poky distro.</div><div class=3D"gmail_default"=
 style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"=
font-size:small">I can inspect the configs and see the options in question,=
 so I&#39;m going to</div><div class=3D"gmail_default" style=3D"font-size:s=
mall">go about recreating it that way versus trying to do a different clone=
 and</div><div class=3D"gmail_default" style=3D"font-size:small">distro con=
figuration.</div><div class=3D"gmail_default" style=3D"font-size:small"><br=
></div><div class=3D"gmail_default" style=3D"font-size:small">As you guesse=
d, I have very limited time at a keyboard this week, so it</div><div class=
=3D"gmail_default" style=3D"font-size:small">will take a bit for me to foll=
ow up.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
I somehow got the patches the wrong way around and merged the ones with<br>
the warning but we&#39;ll manage with that for now until you&#39;re back.<b=
r>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000a3160f063d450e08--

