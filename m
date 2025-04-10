Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70803C369A9
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 11:50:00 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.32534.1744285542715443979
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 04:45:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=J35Zhmy5;
 spf=pass (domain: linaro.org, ip: 209.85.219.177, mailfrom: ilias.apalodimas@linaro.org)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e455bf1f4d3so514071276.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 04:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744285542; x=1744890342; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ylj/Yrf5eDZfgsdVygftBpvzHNTOZDZGZT8u1ho190c=;
        b=J35Zhmy5JmC5apKrcjutRy+eKNFhKS/QwN4YcR1lrQgdcUyLoahbNqd293XdGdvWNx
         OcyUQtJd2c8ID2kj5ZCvfJ1arRbUbRN0qu05wkY7scgEJxmxxdyGi9LT/4KJ0J76SxCf
         6PewNQ7ao5L25lcDV+MhgwQO1vf9897G8RYt1MAJ/18WMPSYeZPZTidN3G1Xcu3KB3z6
         TuP5ICSzvi0eklbcvqlJpTmRRYEU6BiUI/8PHMfhnx/PD4FZd3D355rSEA5lss7FNfvA
         2IPq4ht+/aCOLjbFj2RqMGohwPpCm4Z8aAfPQcN9FjF6RIwDbp4XL0DSbZ8mBd51UZsG
         D+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744285542; x=1744890342;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ylj/Yrf5eDZfgsdVygftBpvzHNTOZDZGZT8u1ho190c=;
        b=wtcfeYzyxypBLTEaR4V2Y0WkcVtRZ5JwGDYPGrD8HgCDGxzoDmoDS6xt60YqaYCPIO
         1fnAg9lbGazG7zTUp4UKKM2FCf1k45tivnzrIkp3wSC2jDTBK5sQOnVuVbEEZPIuwo50
         Hef24eGNFrxeE/Cwe989Pfq51CR1F3BE/ZURLpFBbFygEWYRn1iwnIDSAAKP7ADFP9wb
         4eRMAACiJDzM5CTrsvs2bFI9KMLHBjtX64ux5sxz3lrUopURmLeExopDyHE7sfHM1Blq
         JP5uPpC7Ow1ldjns00ndIiQ7qvPLKT0lWp1LkcwUo0qgrGxWUmX6zUdYAxNiAERpa8mp
         1rNw==
X-Gm-Message-State: AOJu0YwNr4XaAbKJsXFzMG7iv43FMnBD8uGmtHYMPzVJgfiO9sMK84G5
	BvYck6WjOzNQeFHPCuXC9fgtfBW6YLRt6Mk7n3Z2Q3ulUaXLtsowqewV0atw2YWWsleXYLuqJiF
	j+kAFqMAM4nR/xZxK4Da+W7H+7tvrazwjb36D0Q==
X-Gm-Gg: ASbGncs1TZ/GqI+9dSP1MIcw0nCJhbP0iH+txxJJY4l5HjKyKpsIzaURjjtzKLlsMOg
	Wz3Atgp4w5M/23zZTv3XQTa+S8/oGPONWVDX6bet8abKfgvJuHiijK06HG/ihp57QOnt9L+HJPA
	l3Vwz2tJQiTsAyAixCXcdOgoE=
X-Google-Smtp-Source: AGHT+IE9FuveNujsHdftfQT2076Host3LeygKw+87e76ManJCjW+0JRc3oDo+R9WgKtTrwfguJ4aU3bVgTglDAoRulk=
X-Received: by 2002:a05:6902:490c:b0:e61:18f0:8505 with SMTP id
 3f1490d57ef6-e703fb4980cmr3298175276.7.1744285541883; Thu, 10 Apr 2025
 04:45:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-2-mikko.rapeli@linaro.org> <f84af1a6585338787539ee5be5826adbe434e8a9.camel@gmail.com>
In-Reply-To: <f84af1a6585338787539ee5be5826adbe434e8a9.camel@gmail.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Thu, 10 Apr 2025 14:45:06 +0300
X-Gm-Features: ATxdqUF-8EzDhMqc-ZV29z5pqYJCyw0cw9qQzgJ-bj7r-LsJlyNoFKcpzHUL8T4
Message-ID: <CAC_iWjKTmSEOe6HUcPFUZLaBuA2+6ZwOYaYiqK0_R8KGNPU1Ug@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 01/11] systemd: enable efi support by default
To: Adrian Freihofer <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 11:50:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214654

Hi Adrian

On Thu, 10 Apr 2025 at 14:21, Adrian Freihofer <mikko.rapeli@linaro.org> wrote:
>
> Hi Mikko
>
> On Fri, 2025-04-04 at 19:29 +0300, Mikko Rapeli via
> lists.openembedded.org wrote:
> > For example genericarm64 enables "efi" in MACHINE_FEATURES
> > and in u-boot. Boot without "efi" in systemd works with
> > EFI protocols but for example efivars is not mounted at
> > all so various checks fail in userspace. Fix these by
> > enabling "efi" support by default to avoid making
> > it machine specific. Fixes efivars mount to
> > /sys/firmware/efi/efivars etc.
>
> My point is that many OE/Yocto-based embedded products rely on a fully
> redundant and power fail-safe firmware update and boot implementation.
> So far I have not understood how this could be implemented in a
> similarly robust way based on EFI as we have now without EFI-based
> boot-up.

As far as the firmware updates are concerned there's [0], which is
also implemented in U-Boot.
But even in that case, I am not sure I understand your concerns. What
prevents you from having the existing mechanisms for firmware updates
on a system that boots with EFI?

>  I would therefore like to see the EFI implementation remain
> opt-in until it covers at least the most important use cases for robust
> embedded systems. What I primarily miss with EFI is a reference
> implementation for an A/B update system without having to rely on a FAT
> partition without journaling. Please correct me if I'm missing
> something!

Where does the FAT partition requirement come from?

>
> Would it make sense to declare poky as an EFI ready reference
> distribution by enabling the efi DISTRO_FEATURE there, rather than
> starting with making recipes enabling efi unconditionally?
>
> Could something like this in poky.conf work?
> DISTRO_FEATURES:append:aarch64 = " efi"
> DISTRO_FEATURES:append:riscv64 = " efi"
> DISTRO_FEATURES:append:x86-64 = " efi"

[0] https://github.com/ARM-software/edge-iot-arch-guide/blob/main/source/FWU/MBFW/chapter1-introduction.md

Thanks
/Ilias
>
> Thank you and regards,
> Adrian
>
> >
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >  meta/recipes-core/systemd/systemd_257.4.bb | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/systemd/systemd_257.4.bb
> > b/meta/recipes-core/systemd/systemd_257.4.bb
> > index 64fb8fe69a..06e5621398 100644
> > --- a/meta/recipes-core/systemd/systemd_257.4.bb
> > +++ b/meta/recipes-core/systemd/systemd_257.4.bb
> > @@ -68,13 +68,14 @@ PAM_PLUGINS = " \
> >  "
> >
> >  PACKAGECONFIG ??= " \
> > -    ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit apparmor efi
> > ldconfig pam pni-names selinux smack polkit seccomp', d)} \
> > +    ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit apparmor
> > ldconfig pam pni-names selinux smack polkit seccomp', d)} \
> >      ${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo',
> > 'coredump elfutils', '', d)} \
> >      ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '',
> > d)} \
> >      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '',
> > d)} \
> >      ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit',
> > 'link-udev-shared', d)} \
> >      backlight \
> >      binfmt \
> > +    efi \
> >      gshadow \
> >      hibernate \
> >      hostnamed \
> >
> > 
> >
>

