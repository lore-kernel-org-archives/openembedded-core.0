Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1F8C30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 13:09:17 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.9839.1720098551199457311
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 06:09:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CILZAO7x;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-726d9b3bcf8so495354a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 06:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720098550; x=1720703350; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTg9pXwPmp0gfdveBpNJfdJbzpmh8BQ8k+GMuIdcuU8=;
        b=CILZAO7x3RcRmHPU2piYrot0Ry/BxRMkJO+XThdeejE4AdfTOna2Wo9MY/IjKqKrli
         MDr7NGglvuNvd+5jGfDm52GpL0w3Ed9tDr3FolKRihdoySzocd1/kx0VgOGAGxsOpOVq
         sx+BJhMFox82NK8SJSp6GoT1lOZMMl60CTSb7AJ9SrT8cvI+1uJPRRzfmjzxOPs8h9lJ
         +S/TvjkcDhtGWMcPHsASUHJW+cEOnHZneIybds1A6TqpmUjK42GCjP4NXQqVQSCQEdjf
         IQWM4vBgA9o+CasMVUG0GptvE+ZLWZxJONERH2BXRgVagJhXWBqxqS8zayX95uIzBLVA
         vR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720098550; x=1720703350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTg9pXwPmp0gfdveBpNJfdJbzpmh8BQ8k+GMuIdcuU8=;
        b=T0+HuMzyEcmB1eaxbwxzcWLjQ2nw7Lj8Pav7XnIHjtYISeWXfEPHZ7zFSY91rIn6w2
         8lzOxVJbsk5oOQHYTqMm3ZbY9oDO8TXk/EAKVuN/SPRs17V906VLqQHfjY5WTvGMPR9m
         +euexCVrXyyPU5EE13967c486bHljPIsEmba/JDgxg5CKr3hsYfos7rF4Va+/bdYjhgK
         y0P5pSsZ/KA+Y/I1NjOV9ZmClNeDduxkVgtBnNDGBFC9BLlqqJV8GbTvCqUM6Kc1mVef
         1lWoNQO/ytkGO4XOozOdEv793y0PjjV4VhuX3BrhjXh7K4u1SHpduCevqCHUk15DajF9
         ESmA==
X-Forwarded-Encrypted: i=1; AJvYcCWk8r1zuBQF817dIPVXeNJ5FsSGaQxWsU6IXmodNvNlo9VPPX37FB+dQEL0Oha3mU+y55fCGgQs3/z53e6N2Kp+PSafAh4Ri3jM7VV9UmjkmZZEAvRSsF19
X-Gm-Message-State: AOJu0YyiaqVuekZry6ZvgOIqpnDiAzfDkvXFkvJ1oB4tCuPjts6uPuB/
	UedBf/U5TAc24idl//BGFP5a2rVfsErCNwPIN6F6YhGqkBMSV4qI2Ri0iKYlkEnhFSwzojszZnU
	vvNlT5YDlAtj9jw9/PQrYeSyG0mw=
X-Google-Smtp-Source: AGHT+IHpQmQ8upHs9lDItQsxJlkI5ZO2PxUd9kc5Wgw0hxxpZwwurvxTBvq648qv37PnMgubHSfwKxiqfU/ZfmScRYo=
X-Received: by 2002:a17:90a:3d43:b0:2c7:cf90:bd13 with SMTP id
 98e67ed59e1d1-2c99c6bbb74mr1212049a91.26.1720098550176; Thu, 04 Jul 2024
 06:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240703125244.1250173-1-Harish.Sadineni@windriver.com>
 <iwh3wbdnsoxke2t6j7qud5qv4rfz2fljcob5y5nba5afrsxpth@ewx65frf4g7i>
 <CADkTA4PaXx4CoqsFLGTw5Tc9ejRBtArdCpEhZC4DmeyzWS4wqg@mail.gmail.com> <dome2fa6t7tgbuszz3po6koeaoyuzugqhjzdbx6svuu4aqdkoc@bmrlvnarcgj4>
In-Reply-To: <dome2fa6t7tgbuszz3po6koeaoyuzugqhjzdbx6svuu4aqdkoc@bmrlvnarcgj4>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 4 Jul 2024 09:08:58 -0400
Message-ID: <CADkTA4NL5=N7n8cem+OoWjkkKtJRKr-hNmL3+mDsBxyM-yvHkw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux: Modify kernel configuration to fix
 runqlat issue
To: =?UTF-8?B?SsO2cmcgU29tbWVy?= <joerg.sommer@navimatix.de>
Cc: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org, 
	Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com, 
	Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 13:09:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201575

On Wed, Jul 3, 2024 at 11:35=E2=80=AFPM J=C3=B6rg Sommer <joerg.sommer@navi=
matix.de> wrote:
>
> Bruce Ashfield via lists.openembedded.org schrieb am Mi 03. Jul, 14:44 (G=
MT):
> > On Wed, Jul 3, 2024 at 2:34=E2=80=AFPM J=C3=B6rg Sommer via lists.opene=
mbedded.org
> > <joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:
> > >
> > > Sadineni, Harish via lists.openembedded.org schrieb am Mi 03. Jul, 05=
:52 (GMT):
> > > > The following commit addressed the issue which checks whether the s=
truct "task_struct" has __state or state
> > > > https://github.com/chenhengqi/bcc/commit/d3cf5dcecfaeb6d8d346e22286=
26a7dbe506ad38
> > > > The above patch requires enabling CONFIG_DEBUG_INFO_BTF in the kern=
el
> > > > and requires pahole.
> > >
> > > > diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recip=
es-kernel/linux/linux-yocto.inc
> > > > index 0132fcffb3..d6b4794d32 100644
> > > > --- a/meta/recipes-kernel/linux/linux-yocto.inc
> > > > +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> > > > @@ -65,11 +65,12 @@ KERNEL_DEBUG ?=3D ""
> > > >  DEPENDS +=3D '${@bb.utils.contains_any("ARCH", [ "x86", "arm64", "=
powerpc" ], "elfutils-native", "", d)}'
> > > >  DEPENDS +=3D "openssl-native util-linux-native"
> > > >  DEPENDS +=3D "gmp-native libmpc-native"
> > > > +DEPENDS +=3D "pahole-native"
> > > >
> > > >  # Some options depend on CONFIG_PAHOLE_VERSION, so need to make pa=
hole-native available before do_kernel_configme
> > > >  do_kernel_configme[depends] +=3D '${@bb.utils.contains("KERNEL_DEB=
UG", "True", "pahole-native:do_populate_sysroot", "", d)}'
> > > >
> > > > -EXTRA_OEMAKE +=3D '${@bb.utils.contains("KERNEL_DEBUG", "True", ""=
, "PAHOLE=3Dfalse", d)}'
> > > > +EXTRA_OEMAKE +=3D '${@bb.utils.contains("KERNEL_DEBUG", "True", ""=
, "", d)}'
> > >
> > > Can't this whole line be removed?
> >
> > Can you elaborate as to why it would be removed ?
>
> Maybe I interpret it wrong, but the true and the false case add nothing "=
"
> to EXTRA_OEMAKE. Isn't the `+EXTRA_OEMAKE +=3D =E2=80=A6 "", "", d` a NOP=
?

Oh, I see what you are saying!

The patch as proposed isn't correct, so I was reading it from the
point of view of the original line. I completely agree that "" in both
cases would be removed completely :)

Bruce


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

