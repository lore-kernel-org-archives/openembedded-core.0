Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1998C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 16:51:24 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web11.33002.1744287178830589141
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 05:12:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=fPdWPq40;
 spf=pass (domain: linaro.org, ip: 209.85.219.176, mailfrom: ilias.apalodimas@linaro.org)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e60aef2711fso498422276.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 05:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744287178; x=1744891978; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NQZsGrzDbPFbFLuqWQo6L1/wcV8M18bX7LGp/f4UsFY=;
        b=fPdWPq40ypEAsPYAgt5PhYpMPl4j576amCmXRQJx5cek0OUTsDxrbFdvJWZ26kmNwd
         eXNeefzBZpgjNzoVtsjZESAos4mUkUlYAr2zj0ySaSxQq92ubZMoHcJxnhgk/Lz3eCMH
         cmov+OPzyKTb8hLYBewobBBbypPcr3sQpwTqM+dVWyPjP2yJnwOYzB+4QSNgEtWpE6Zq
         /Y/gEcD9NhbuEjBHtIRq7eL4Z6nhfcNC3Ci+FFasoHgutObtB/G/sJpq+ZLVEMw2FUWe
         jGmKRVpBiOwkqyCeCWwyUAPGOKNSyMZjow8oGZ/TiVz6C3vabU6Pd/wL6+aP89EF69ah
         OXVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744287178; x=1744891978;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NQZsGrzDbPFbFLuqWQo6L1/wcV8M18bX7LGp/f4UsFY=;
        b=HF8FnojIFcOvtc0QIj5BqcUA31DR2vOv3O7exsuUucj/9AKcABnvZZyji/JKdoC71V
         yU/ug7gtss75wBVFV41WIMe+EUWY6uCYLCPYDqGlfpWNoOUiUMEmwJOEWSThcwcd2DqX
         bQQiDxymTawJNB8vmbNtu6HwrxZn3KeG8ZzzUi5UF6Cu/9bwlU4IPDvSHR3PTLyUH06H
         r6ZVw1dAyFhbxTNWY9UbTqU/WsCDGYtaH3yuaGnLMqVaspVodlB/mFQ7ygD3oAUSCWLJ
         PwsWUUNwEtr+b2rFInj80KAQSaXLS0YBxKVbspqcFHjpMypgMw59LuVpIoiWJdD6Yin6
         JdjQ==
X-Gm-Message-State: AOJu0YyaKP+jAy7/0XDcAd5C3xLpHrjtzzOnGgwnm2+iOliI79wrPLff
	mvQWokQUExOD4nbpYGO7QX47Iu/gNC5OSqdC+lXLH5uVGr1cN4/8xR839ZyGIA+22kCv5pQvgvi
	m93BA4Xt6tKsqR3GbScU/b82zJEg5+CFZpj69KQ==
X-Gm-Gg: ASbGncvaGYyG3GxX+6V9CDkjTSlrxtZ0FH0DzlP4IvaFnT0BWRIPDLQFO5wgUU2h7PZ
	zJeIwCglW/2qmqUkMhf7Ol7/KlBvNdMSqiGyAhg9IDAm6PQydh+orG99iW2bMIuxtkaVI5To5b+
	dUU0dsbJTRPWuXnP5jW/AG7wtj8LTbw68J0A==
X-Google-Smtp-Source: AGHT+IGEn3IyLQrB5lR/dpdddero9xNwJqrj2lejS0dnKpkSTd9ouCz+P51LYGxNrWw5DiHhvLLZ7CeBfbj9zNaSWQs=
X-Received: by 2002:a05:6902:1682:b0:e6d:e183:4e08 with SMTP id
 3f1490d57ef6-e703fb79685mr3209045276.15.1744287177726; Thu, 10 Apr 2025
 05:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-2-mikko.rapeli@linaro.org> <f84af1a6585338787539ee5be5826adbe434e8a9.camel@gmail.com>
 <CAC_iWjKTmSEOe6HUcPFUZLaBuA2+6ZwOYaYiqK0_R8KGNPU1Ug@mail.gmail.com>
In-Reply-To: <CAC_iWjKTmSEOe6HUcPFUZLaBuA2+6ZwOYaYiqK0_R8KGNPU1Ug@mail.gmail.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Thu, 10 Apr 2025 15:12:21 +0300
X-Gm-Features: ATxdqUGcWoDwGQFOR2gGy3fjFniM01Mp_7mKtq0Z50E6v4jOgbbndtwL59W3kCI
Message-ID: <CAC_iWjJTuV=TcNYhSeyybaU8hr-b9sauJiYt3Jo8+wxYC_7eUQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 01/11] systemd: enable efi support by default
To: adrian.freihofer@gmail.com, Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 16:51:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214684

Apologies for the noise, I forgot to add Adrian in CC

On Thu, 10 Apr 2025 at 14:45, Ilias Apalodimas
<ilias.apalodimas@linaro.org> wrote:
>
> Hi Adrian
>
> On Thu, 10 Apr 2025 at 14:21, Adrian Freihofer <mikko.rapeli@linaro.org> wrote:
> >
> > Hi Mikko
> >
> > On Fri, 2025-04-04 at 19:29 +0300, Mikko Rapeli via
> > lists.openembedded.org wrote:
> > > For example genericarm64 enables "efi" in MACHINE_FEATURES
> > > and in u-boot. Boot without "efi" in systemd works with
> > > EFI protocols but for example efivars is not mounted at
> > > all so various checks fail in userspace. Fix these by
> > > enabling "efi" support by default to avoid making
> > > it machine specific. Fixes efivars mount to
> > > /sys/firmware/efi/efivars etc.
> >
> > My point is that many OE/Yocto-based embedded products rely on a fully
> > redundant and power fail-safe firmware update and boot implementation.
> > So far I have not understood how this could be implemented in a
> > similarly robust way based on EFI as we have now without EFI-based
> > boot-up.
>
> As far as the firmware updates are concerned there's [0], which is
> also implemented in U-Boot.
> But even in that case, I am not sure I understand your concerns. What
> prevents you from having the existing mechanisms for firmware updates
> on a system that boots with EFI?
>
> >  I would therefore like to see the EFI implementation remain
> > opt-in until it covers at least the most important use cases for robust
> > embedded systems. What I primarily miss with EFI is a reference
> > implementation for an A/B update system without having to rely on a FAT
> > partition without journaling. Please correct me if I'm missing
> > something!
>
> Where does the FAT partition requirement come from?
>
> >
> > Would it make sense to declare poky as an EFI ready reference
> > distribution by enabling the efi DISTRO_FEATURE there, rather than
> > starting with making recipes enabling efi unconditionally?
> >
> > Could something like this in poky.conf work?
> > DISTRO_FEATURES:append:aarch64 = " efi"
> > DISTRO_FEATURES:append:riscv64 = " efi"
> > DISTRO_FEATURES:append:x86-64 = " efi"
>
> [0] https://github.com/ARM-software/edge-iot-arch-guide/blob/main/source/FWU/MBFW/chapter1-introduction.md
>
> Thanks
> /Ilias
> >
> > Thank you and regards,
> > Adrian
> >
> > >
> > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > ---
> > >  meta/recipes-core/systemd/systemd_257.4.bb | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-core/systemd/systemd_257.4.bb
> > > b/meta/recipes-core/systemd/systemd_257.4.bb
> > > index 64fb8fe69a..06e5621398 100644
> > > --- a/meta/recipes-core/systemd/systemd_257.4.bb
> > > +++ b/meta/recipes-core/systemd/systemd_257.4.bb
> > > @@ -68,13 +68,14 @@ PAM_PLUGINS = " \
> > >  "
> > >
> > >  PACKAGECONFIG ??= " \
> > > -    ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit apparmor efi
> > > ldconfig pam pni-names selinux smack polkit seccomp', d)} \
> > > +    ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit apparmor
> > > ldconfig pam pni-names selinux smack polkit seccomp', d)} \
> > >      ${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo',
> > > 'coredump elfutils', '', d)} \
> > >      ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '',
> > > d)} \
> > >      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '',
> > > d)} \
> > >      ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit',
> > > 'link-udev-shared', d)} \
> > >      backlight \
> > >      binfmt \
> > > +    efi \
> > >      gshadow \
> > >      hibernate \
> > >      hostnamed \
> > >
> > > 
> > >
> >

