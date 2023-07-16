Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7835DEB64DD
	for <webhook@archiver.kernel.org>; Sun, 16 Jul 2023 21:42:46 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web10.7260.1689543764768561845
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jul 2023 14:42:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=aJfjHPky;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-78372625badso219758039f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Jul 2023 14:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689543764; x=1692135764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hYFzi1J+igz9I4GGTBXsVx0nUnCZowIch/FQgOqSXWM=;
        b=aJfjHPkyZ5NE+gPtg36ZSF9MpCKBI07rbBiWgP+AyNflX4TlDmiAIIg0VfgVgABHtI
         6WM5GEFAnl6VefOPrvcz5ybwA3JSBUKebR9PWFV4t8vX5UQwLmvM0Wqj3oulq/BcftIK
         P46Lci2uA3nsdFlhUOJG1KhZwjsdtSOKNsRGio0xmYqJZNlx6JJsmpUPntRnrwhn9GWh
         cUhuxslCsnWoSF3D0sSlFCrbmWpGPHMOdnZzc7ToSRM88kBz9fC7ixBBjqyjNzQOLcaz
         oaW0SeWSSITUqG7qqM1PHSxlfzWu4lCKnec+nbHqPnmj+VyX4Mioyfs/qjMoW+Rxgmyc
         0W8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689543764; x=1692135764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYFzi1J+igz9I4GGTBXsVx0nUnCZowIch/FQgOqSXWM=;
        b=N6nKr/RYWyzhLvfT/UjV5D/0jjofp4OUJijNFAD/6JFOJZFcQKRHv0WjlMp/LEeogn
         rEioqBanS7t7GCKQf+TD9D8g+Dafw/N1Supi7HhR64JfkewTLsSRa/7YNwx5IPYe/xRh
         ALhjXbDsPJYpp/INthFamtt76O39FAs8pkpG+T2vuO73sCjRbEoIBKFrXn7e3W3DnQ/l
         hqTX+WAryeOO0lbvyFbSbvln6ArgxGsla2fsdZUN1kRAdCfiYi+G+cJOuoDFU0E0cfAI
         tcRgGkTujQYIaj4adGZDUKsIJCq1P0gCgsDQOgdL/viyj0lV5V1sKqZy12TQVICPA1L/
         E8Bg==
X-Gm-Message-State: ABy/qLb/SwJgjsMwJuwEE/r4e+iX5/Z0WX4AxU4kuW2o0bsbHOfcJa+F
	Vs2L2k3WhtEZ7wSn8gj3QeiqaNJHx3ZuVLnNFlk=
X-Google-Smtp-Source: APBJJlHrUVOKKAYtHcVE29gWkS9w+t2ccJsty61NVj69eRT/vDnqOt6OA5YNUUGCjpRz2t1dtCBVf4DPRlYos45Zc0Q=
X-Received: by 2002:a05:6602:14:b0:785:4392:2595 with SMTP id
 b20-20020a056602001400b0078543922595mr10102414ioa.19.1689543763840; Sun, 16
 Jul 2023 14:42:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230615031608.29371-1-bruce.ashfield@gmail.com> <CAOSpxdYsbGaLo8Hy1=HXDw1GjJe_Gzb8GUSBumKxqeuxYg1MQQ@mail.gmail.com>
In-Reply-To: <CAOSpxdYsbGaLo8Hy1=HXDw1GjJe_Gzb8GUSBumKxqeuxYg1MQQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 16 Jul 2023 17:42:41 -0400
Message-ID: <CADkTA4PqVCs_0kXmyMHK9y7yyLwbSX-jNcSspBteHv=RmnYkKw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto/6.1: fix intermittent x86 boot hangs
To: Steve Sakoman <steve@sakoman.com>
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Jul 2023 21:42:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184423

On Sun, Jul 16, 2023 at 3:35=E2=80=AFPM Steve Sakoman <steve@sakoman.com> w=
rote:
>
> On Wed, Jun 14, 2023 at 5:16=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gm=
ail.com> wrote:
> >
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > The commit in question appeared as -stable backport in 6.1.28, which is
> > where we started to see intermittent boot hangs on x86.
> >
> > Richard noted that others are seeing this is well, as can be seen in
> > this thread:
> >
> >     https://lkml.org/lkml/2023/6/13/1460
> >
> > We bump our SRCREVs to pick up the revert:
> >
> >     947f660bde07 Revert "tick/common: Align tick period with the HZ tic=
k."
> >
>
> Unfortunately I am seeing something quite similar on Kirkstone with 5.15.=
118:
>
> [    0.222916] Freeing SMP alternatives memory: 48K
> [274824.332965] smpboot: CPU0: Intel Xeon E3-12xx v2 (Ivy Bridge)
> (family: 0x6, model: 0x3a, stepping: 0x9)
>
> Full log:
>
> https://errors.yoctoproject.org/Errors/Details/716736/
>
> So I suspect we will need the same fix there too :-(

That fix is obselete.

There's a proper upstream fix for it and going through the -stable trees no=
w.

5.15.119+ has the fix, and I'll get to those updates shortly.

Bruce

>
> Steve
>
> >
> > As requested here is the revert of the x86 clock fix that is suspect.
> >
> > You'll need to restore the other dropped linux-yocto version bumps
> > to apply this patch.
> >
> > Bruce
> >
> >  .../linux/linux-yocto-rt_6.1.bb               |  4 ++--
> >  .../linux/linux-yocto-tiny_6.1.bb             |  4 ++--
> >  meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 24 +++++++++----------
> >  3 files changed, 16 insertions(+), 16 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/rec=
ipes-kernel/linux/linux-yocto-rt_6.1.bb
> > index 4a2a3ca4ab..1033d307f4 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
> > @@ -14,8 +14,8 @@ python () {
> >          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kern=
el to linux-yocto-rt to enable it")
> >  }
> >
> > -SRCREV_machine ?=3D "6871194107bd40397162bfca0a9ef06661057c50"
> > -SRCREV_meta ?=3D "1dd270d3231f82d94d2123b95e4eb576019440a3"
> > +SRCREV_machine ?=3D "2993cbe41f0f859331c81d6ec8001b094f53cb9e"
> > +SRCREV_meta ?=3D "db25e51e2006721528f5e7bcd8f4501592bd74fe"
> >
> >  SRC_URI =3D "git://git.yoctoproject.org/linux-yocto.git;branch=3D${KBR=
ANCH};name=3Dmachine;protocol=3Dhttps \
> >             git://git.yoctoproject.org/yocto-kernel-cache;type=3Dkmeta;=
name=3Dmeta;branch=3Dyocto-6.1;destsuffix=3D${KMETA};protocol=3Dhttps"
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/r=
ecipes-kernel/linux/linux-yocto-tiny_6.1.bb
> > index bfc1c7652c..2be9eb9c36 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
> > @@ -17,8 +17,8 @@ DEPENDS +=3D "openssl-native util-linux-native"
> >  KMETA =3D "kernel-meta"
> >  KCONF_BSP_AUDIT_LEVEL =3D "2"
> >
> > -SRCREV_machine ?=3D "6034b10d39687bbd6769e4adb2a792524e6b4f16"
> > -SRCREV_meta ?=3D "1dd270d3231f82d94d2123b95e4eb576019440a3"
> > +SRCREV_machine ?=3D "947f660bde07ee4111bc96d08b142a6ce3753d38"
> > +SRCREV_meta ?=3D "db25e51e2006721528f5e7bcd8f4501592bd74fe"
> >
> >  PV =3D "${LINUX_VERSION}+git${SRCPV}"
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipe=
s-kernel/linux/linux-yocto_6.1.bb
> > index 53a583e0a3..f5554e26db 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
> > @@ -20,18 +20,18 @@ KBRANCH:qemux86-64 ?=3D "v6.1/standard/base"
> >  KBRANCH:qemuloongarch64  ?=3D "v6.1/standard/base"
> >  KBRANCH:qemumips64 ?=3D "v6.1/standard/mti-malta64"
> >
> > -SRCREV_machine:qemuarm ?=3D "cff918ff5ee0001dec6493620535d8804f02cd8b"
> > -SRCREV_machine:qemuarm64 ?=3D "6034b10d39687bbd6769e4adb2a792524e6b4f1=
6"
> > -SRCREV_machine:qemuloongarch64 ?=3D "6034b10d39687bbd6769e4adb2a792524=
e6b4f16"
> > -SRCREV_machine:qemumips ?=3D "7a59adc4cd39bea852101be2873855cfc835ef45=
"
> > -SRCREV_machine:qemuppc ?=3D "6034b10d39687bbd6769e4adb2a792524e6b4f16"
> > -SRCREV_machine:qemuriscv64 ?=3D "6034b10d39687bbd6769e4adb2a792524e6b4=
f16"
> > -SRCREV_machine:qemuriscv32 ?=3D "6034b10d39687bbd6769e4adb2a792524e6b4=
f16"
> > -SRCREV_machine:qemux86 ?=3D "6034b10d39687bbd6769e4adb2a792524e6b4f16"
> > -SRCREV_machine:qemux86-64 ?=3D "6034b10d39687bbd6769e4adb2a792524e6b4f=
16"
> > -SRCREV_machine:qemumips64 ?=3D "273e099163a72247262a495cb73889d2e0ed6d=
2c"
> > -SRCREV_machine ?=3D "6034b10d39687bbd6769e4adb2a792524e6b4f16"
> > -SRCREV_meta ?=3D "1dd270d3231f82d94d2123b95e4eb576019440a3"
> > +SRCREV_machine:qemuarm ?=3D "93797f49c15b6ce9656a607626437e76a3b6c6da"
> > +SRCREV_machine:qemuarm64 ?=3D "947f660bde07ee4111bc96d08b142a6ce3753d3=
8"
> > +SRCREV_machine:qemuloongarch64 ?=3D "947f660bde07ee4111bc96d08b142a6ce=
3753d38"
> > +SRCREV_machine:qemumips ?=3D "1279631d08d52a5b20044404da4b01205ba4b725=
"
> > +SRCREV_machine:qemuppc ?=3D "947f660bde07ee4111bc96d08b142a6ce3753d38"
> > +SRCREV_machine:qemuriscv64 ?=3D "947f660bde07ee4111bc96d08b142a6ce3753=
d38"
> > +SRCREV_machine:qemuriscv32 ?=3D "947f660bde07ee4111bc96d08b142a6ce3753=
d38"
> > +SRCREV_machine:qemux86 ?=3D "947f660bde07ee4111bc96d08b142a6ce3753d38"
> > +SRCREV_machine:qemux86-64 ?=3D "947f660bde07ee4111bc96d08b142a6ce3753d=
38"
> > +SRCREV_machine:qemumips64 ?=3D "3b25f845f704021fbe223ef48ab22ff5fa3886=
b9"
> > +SRCREV_machine ?=3D "947f660bde07ee4111bc96d08b142a6ce3753d38"
> > +SRCREV_meta ?=3D "db25e51e2006721528f5e7bcd8f4501592bd74fe"
> >
> >  # set your preferred provider of linux-yocto to 'linux-yocto-upstream'=
, and you'll
> >  # get the <version>/base branch, which is pure upstream -stable, and t=
he same
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#182828): https://lists.openembedded.org/g/openembed=
ded-core/message/182828
> > Mute This Topic: https://lists.openembedded.org/mt/99542122/3620601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
steve@sakoman.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

