Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A47C30653
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 18:45:07 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.58703.1720032301521039745
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 11:45:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A7iomubP;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2c8dccd0fa9so3766991a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 11:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720032301; x=1720637101; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XjiKk1dcGzKRrdyvgYbZdOsdQTm7m5uQjRaqFgmfV4s=;
        b=A7iomubPFnY2TEux+Lny/DGB2+srBqGg5Ar+3mIm3h0eS2sXX55oUMeujlh/b6wmhk
         y4EzYvuuR6XpgoLgsAjUkuaMn/wP2+Cz5FbPhQSuslyGVy14s8Qrk+D1oU4dtpKJCOF7
         glKxGbUmyG89SGAAtMe1PvWB/a0VZRuxriX6mRah9Tk5Rhrxvz4hkIvg0OjaMgz1S1lw
         4oXx7rzHNX+saenXAAByIHPydsD+0w6XYVVNZ36TIi+wQpKSR8KGJ/YvqGXnwoVCSpJC
         rkp4ESQPacw6RqwppriacV6Uw5JPZX9qx/ADXxcdVQWQ4XZmUwCBXlMlkl2AVLM6PZwU
         pFjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720032301; x=1720637101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XjiKk1dcGzKRrdyvgYbZdOsdQTm7m5uQjRaqFgmfV4s=;
        b=dN5jEB1Wan/6GmhditEnv4zO1Pitrkt2kl2cttYhldMWrosp7OMuPyY/S/Nw8GkOOW
         CX5Qp/THThyvFukDVmT1QuLshcvcvUUqtQd28vcqrAaXHUrjLFhr0gpDXvxOQ92iVIL3
         b2M4QsofGQS4mJByu1qTSvG/DEJ+QXayFxeD5dcbfsZOex7ExlSLr5aLllEHTuvUf7so
         eJCWYEpcxaB9j7KpUgQbZMLZnBODdSteQaO7iUBRmNr5MErDYrdKEFnufX6dgz9L2R/Q
         fvTqsXcO4ArkeWavXXamPOSqsUMseHsniMJHnTKdOB3VTlU1D6y3r4bLOCx22twe+4qo
         yGuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVd87RXZGTKbkbmIk2pTOEVuv8vbhDpklQ2VQVKnv0LHeaHoFL0fhvPhUs4yeSTPw5DKzyi4c0QkVUPjS9P93Ujh1iuujLdAWK/O9jzDtqn7FKLxrFkJ3xu
X-Gm-Message-State: AOJu0Yw8oW20YTbWL6tDHAmrXCzmi4umP3F5cJ5P3QynhNmzer2E3aHt
	2kNTXNobKk1RzYQDLCLnvwR8BR92bjHe9z1qlLzNrrx2jz8wzQBLp/Z7OubcerZtEln4pbVoMfw
	2WT+GGb+dCsMCeRPcFHHiCBbqQZU=
X-Google-Smtp-Source: AGHT+IHNzCb2YHCJPCv5GP6v/kBwrPgpvN5IMF3/IvhiqWaVV/9joXY0csMyrgjBDrZtenhApnYZUVtAkQ3eG6XgTxg=
X-Received: by 2002:a17:90b:4ac8:b0:2c8:6269:73a9 with SMTP id
 98e67ed59e1d1-2c93d6d4a14mr8063209a91.7.1720032300640; Wed, 03 Jul 2024
 11:45:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240703125244.1250173-1-Harish.Sadineni@windriver.com> <iwh3wbdnsoxke2t6j7qud5qv4rfz2fljcob5y5nba5afrsxpth@ewx65frf4g7i>
In-Reply-To: <iwh3wbdnsoxke2t6j7qud5qv4rfz2fljcob5y5nba5afrsxpth@ewx65frf4g7i>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 3 Jul 2024 14:44:47 -0400
Message-ID: <CADkTA4PaXx4CoqsFLGTw5Tc9ejRBtArdCpEhZC4DmeyzWS4wqg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux: Modify kernel configuration to fix
 runqlat issue
To: joerg.sommer@navimatix.de
Cc: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org, 
	Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com, 
	Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 18:45:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201497

On Wed, Jul 3, 2024 at 2:34=E2=80=AFPM J=C3=B6rg Sommer via lists.openembed=
ded.org
<joerg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:
>
> Sadineni, Harish via lists.openembedded.org schrieb am Mi 03. Jul, 05:52 =
(GMT):
> > The following commit addressed the issue which checks whether the struc=
t "task_struct" has __state or state
> > https://github.com/chenhengqi/bcc/commit/d3cf5dcecfaeb6d8d346e2228626a7=
dbe506ad38
> > The above patch requires enabling CONFIG_DEBUG_INFO_BTF in the kernel
> > and requires pahole.
>
> > diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-k=
ernel/linux/linux-yocto.inc
> > index 0132fcffb3..d6b4794d32 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto.inc
> > +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> > @@ -65,11 +65,12 @@ KERNEL_DEBUG ?=3D ""
> >  DEPENDS +=3D '${@bb.utils.contains_any("ARCH", [ "x86", "arm64", "powe=
rpc" ], "elfutils-native", "", d)}'
> >  DEPENDS +=3D "openssl-native util-linux-native"
> >  DEPENDS +=3D "gmp-native libmpc-native"
> > +DEPENDS +=3D "pahole-native"
> >
> >  # Some options depend on CONFIG_PAHOLE_VERSION, so need to make pahole=
-native available before do_kernel_configme
> >  do_kernel_configme[depends] +=3D '${@bb.utils.contains("KERNEL_DEBUG",=
 "True", "pahole-native:do_populate_sysroot", "", d)}'
> >
> > -EXTRA_OEMAKE +=3D '${@bb.utils.contains("KERNEL_DEBUG", "True", "", "P=
AHOLE=3Dfalse", d)}'
> > +EXTRA_OEMAKE +=3D '${@bb.utils.contains("KERNEL_DEBUG", "True", "", ""=
, d)}'
>
> Can't this whole line be removed?

Can you elaborate as to why it would be removed ?

I explicitly disabled PAHOLE when KERNEL_DEBUG wasn't set, since it was pul=
ling
in extended dependencies and causing some issues with optimized kernels (an=
d
architectures IIRC). If someone wants to dive in and show that the
reasons this was
done are no longer valid, then definitely, it can be removed.

pahole is not in oe-core, and it should still be conditional, so I
haven't seen anything
convincing as to why it should be removed or modified.

Bruce

>
>
> Regards, J=C3=B6rg
>
> --
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201496): https://lists.openembedded.org/g/openembedde=
d-core/message/201496
> Mute This Topic: https://lists.openembedded.org/mt/107018570/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

