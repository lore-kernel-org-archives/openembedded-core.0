Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D59BBC369A2
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 20:53:25 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.9372.1744318402882325478
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 13:53:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q2QV5jfl;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3995ff6b066so655587f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 13:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744318401; x=1744923201; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dILGRfqb6aA5jF3MZYa7depTkxTjm+mfoQRGwAvCIPQ=;
        b=Q2QV5jflV2WpoL7gQUPdl85A3iqv147OytCmXN8n71vvYlUBACwNzD7/7B4uBtWCtk
         B1yuUUDVZDat+a6RNJ6OAfterWBgwCJmut8VhFE5McGIGOZ5dusFYT5E8RcsV1w2ljSO
         3PlQs17coS54kMwb2pq+53v3b9S+mXF45mvXf92+EBlPqEbA2YH9YpJfwcoOqEKCk+1/
         WjenaYTU40JnsoLqhsd0+mjwxu/sxHdmUrR4xMcNF3fl7j4ecJKHLBGAO2tlelEgWjGS
         jZ6hrunHn7ntqT3Mp4PT1PsIkrDjuk7kg8pZoUyuhXF71Dlzu8up8UHmPrSweR4uLOtZ
         3h1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744318401; x=1744923201;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dILGRfqb6aA5jF3MZYa7depTkxTjm+mfoQRGwAvCIPQ=;
        b=UE9G86XAMJk12VNMg9RedkxcpFXEN/ryDUM/SS6tqLtN7Q6dpw7MXxp5i61ArEfv59
         3K7gV4UojgblKF/mWRPDh+k8jokbGRM9OZpHpD6yyIFTqxcdYml4GHt+iw1bPVfGz7Vy
         qeQKQi427A4CTkgcm3ftzptpNexVWFeUZxYXg93tKAg3FkKH11m51puHioiPJ0YGfmWW
         ylkfyH4snavNJXw4Ww80c413rmLE9ei6zotrVAnMLEvSkY3nI2WnCUxWi1CaokgDU7Dr
         6jXgf+ExMJa6iL/SnbfQk3AqJIET/mvrcXlyghvCuOrAnkPvo4n2J/+sfs0KJxpTMQEb
         tsWw==
X-Gm-Message-State: AOJu0Yx0hHbTuRUC/dqfjx+5jrQ7K3Njn6vKUuUeznHfDvvovO39tgx0
	satyLfBbm584xP8/Go5HAeQ3EtxDz0fSMNJuVM3aFH6ph1ghCgBG
X-Gm-Gg: ASbGncsJMrL9YlW0W+kQ4RFT6Y5kMmMkTKMGbm1eDkLfUu+RWA1IhRP0JihwGoRhuYD
	qmmQq7PHpj376Bsxe4aq04l3zSacEGJ55rHjqTyneMjve5BYUyll5W9STXIrrYKdLeOl+EX5GxM
	G0eZ40v0nlffZvDYtyYyP0mpFzpAyK2VFqiWtn3AsqweTnnX4iB0F0oKxsvXStt6U5NDtvljJDU
	SJRJZlr4n2A4gq8316FUNn406rXyDoRuB+4VSKqp/liZgi/7w9BBUfJeTNDfs4/iTXHre9RnSAA
	vEytCAv+Mo/pyKUy5WgWXjOG5bciNYiG625NQqg+ZAu/NR5Ak9j2etu/+jkobdP5/6r+Lwkrqfy
	2rRqJ2f3snJhbog==
X-Google-Smtp-Source: AGHT+IHcGmwPlJAxRTn9PZx+daDrBPeEAIcsRQ27qDdat2XNcy3Znoz/RHWE80DSIHkt+83SIbjkMg==
X-Received: by 2002:a05:6000:2401:b0:39c:30c9:822 with SMTP id ffacd0b85a97d-39ea52149a4mr85969f8f.30.1744318400990;
        Thu, 10 Apr 2025 13:53:20 -0700 (PDT)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cb43sm10149f8f.65.2025.04.10.13.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 13:53:20 -0700 (PDT)
Message-ID: <c7b639077c36c0bc3bdd3eb43f314b348cd2e3f8.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v3 01/11] systemd: enable efi support by
 default
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>, Ilias Apalodimas
	 <ilias.apalodimas@linaro.org>
Cc: openembedded-core@lists.openembedded.org, alex.kanavin@gmail.com
Date: Thu, 10 Apr 2025 22:53:19 +0200
In-Reply-To: <CAC_iWjJTuV=TcNYhSeyybaU8hr-b9sauJiYt3Jo8+wxYC_7eUQ@mail.gmail.com>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
	 <20250404162932.447699-2-mikko.rapeli@linaro.org>
	 <f84af1a6585338787539ee5be5826adbe434e8a9.camel@gmail.com>
	 <CAC_iWjKTmSEOe6HUcPFUZLaBuA2+6ZwOYaYiqK0_R8KGNPU1Ug@mail.gmail.com>
	 <CAC_iWjJTuV=TcNYhSeyybaU8hr-b9sauJiYt3Jo8+wxYC_7eUQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41app1) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 20:53:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214709

On Thu, 2025-04-10 at 15:12 +0300, Ilias Apalodimas wrote:
> Apologies for the noise, I forgot to add Adrian in CC
>=20
> On Thu, 10 Apr 2025 at 14:45, Ilias Apalodimas
> <ilias.apalodimas@linaro.org> wrote:
> >=20
> > Hi Adrian
> >=20
> > On Thu, 10 Apr 2025 at 14:21, Adrian Freihofer
> > <mikko.rapeli@linaro.org> wrote:
> > >=20
> > > Hi Mikko
> > >=20
> > > On Fri, 2025-04-04 at 19:29 +0300, Mikko Rapeli via
> > > lists.openembedded.org wrote:
> > > > For example genericarm64 enables "efi" in MACHINE_FEATURES
> > > > and in u-boot. Boot without "efi" in systemd works with
> > > > EFI protocols but for example efivars is not mounted at
> > > > all so various checks fail in userspace. Fix these by
> > > > enabling "efi" support by default to avoid making
> > > > it machine specific. Fixes efivars mount to
> > > > /sys/firmware/efi/efivars etc.
> > >=20
> > > My point is that many OE/Yocto-based embedded products rely on a
> > > fully
> > > redundant and power fail-safe firmware update and boot
> > > implementation.
> > > So far I have not understood how this could be implemented in a
> > > similarly robust way based on EFI as we have now without EFI-
> > > based
> > > boot-up.
> >=20
> > As far as the firmware updates are concerned there's [0], which is
> > also implemented in U-Boot.
> > But even in that case, I am not sure I understand your concerns.
> > What
> > prevents you from having the existing mechanisms for firmware
> > updates
> > on a system that boots with EFI?

Many thanks for the link. Yes, that basically describes how it should
be. But is there such a thing in reality? The discussion here doesn't
really convince me that EFI is already the proven easy way to build
robust and maintainable embedded systems. I understand why many people
are working towards EFI. But I still see great advantages in simpler
and available (in the sense of power-fail, robust) technologies for
many use cases today.

Anyway, my intention is not to start a controversial discussion about
EFI or SystemReady. My intention is to ensure that building systems
without disadvantages caused by the "EFI by default strategy" remains
possible and ideally also tested. As long as that is the case, I fully
agree with the patch.

> >=20
> > > =C2=A0I would therefore like to see the EFI implementation remain
> > > opt-in until it covers at least the most important use cases for
> > > robust
> > > embedded systems. What I primarily miss with EFI is a reference
> > > implementation for an A/B update system without having to rely on
> > > a FAT
> > > partition without journaling. Please correct me if I'm missing
> > > something!
> >=20
> > Where does the FAT partition requirement come from?
> >=20
> > >=20
> > > Would it make sense to declare poky as an EFI ready reference
> > > distribution by enabling the efi DISTRO_FEATURE there, rather
> > > than
> > > starting with making recipes enabling efi unconditionally?
> > >=20
> > > Could something like this in poky.conf work?
> > > DISTRO_FEATURES:append:aarch64 =3D " efi"
> > > DISTRO_FEATURES:append:riscv64 =3D " efi"
> > > DISTRO_FEATURES:append:x86-64 =3D " efi"

I was thinking about making this ARCH specific because:
- Defaulting to the most typical and use cases
- Keep a test matrix on the AB which builds systemd without efi
- ARCH specific is not an issue like MACHINE specific would be
- Having this policy in the distro seams more logical to me than in a
generic package.

But as I said, if the disadvantages of building with efi are negligible
for users without EFI use cases, then even better.

Thank you and regards,
Adrian

> >=20
> > [0]
> > https://github.com/ARM-software/edge-iot-arch-guide/blob/main/source/FW=
U/MBFW/chapter1-introduction.md
> >=20
> > Thanks
> > /Ilias
> > >=20
> > > Thank you and regards,
> > > Adrian
> > >=20
> > > >=20
> > > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > > ---
> > > > =C2=A0meta/recipes-core/systemd/systemd_257.4.bb | 3 ++-
> > > > =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/meta/recipes-core/systemd/systemd_257.4.bb
> > > > b/meta/recipes-core/systemd/systemd_257.4.bb
> > > > index 64fb8fe69a..06e5621398 100644
> > > > --- a/meta/recipes-core/systemd/systemd_257.4.bb
> > > > +++ b/meta/recipes-core/systemd/systemd_257.4.bb
> > > > @@ -68,13 +68,14 @@ PAM_PLUGINS =3D " \
> > > > =C2=A0"
> > > >=20
> > > > =C2=A0PACKAGECONFIG ??=3D " \
> > > > -=C2=A0=C2=A0=C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', 'acl audi=
t apparmor
> > > > efi
> > > > ldconfig pam pni-names selinux smack polkit seccomp', d)} \
> > > > +=C2=A0=C2=A0=C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', 'acl audi=
t apparmor
> > > > ldconfig pam pni-names selinux smack polkit seccomp', d)} \
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'm=
inidebuginfo',
> > > > 'coredump elfutils', '', d)} \
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'w=
ifi', 'rfkill',
> > > > '',
> > > > d)} \
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'x=
11',
> > > > 'xkbcommon', '',
> > > > d)} \
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 's=
ysvinit',
> > > > 'sysvinit',
> > > > 'link-udev-shared', d)} \
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 backlight \
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 binfmt \
> > > > +=C2=A0=C2=A0=C2=A0 efi \
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 gshadow \
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 hibernate \
> > > > =C2=A0=C2=A0=C2=A0=C2=A0 hostnamed \
> > > >=20
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#214352):
> > > > https://lists.openembedded.org/g/openembedded-core/message/214352
> > > > Mute This Topic:
> > > > https://lists.openembedded.org/mt/112087523/4454582
> > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > Unsubscribe:
> > > > https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> > > > adrian.freihofer@gmail.com]
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >=20
> > >=20


