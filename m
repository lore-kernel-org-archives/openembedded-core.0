Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 428E4C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 18:37:55 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web11.4908.1744307321938769648
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 10:48:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=U5F4EagK;
 spf=pass (domain: linaro.org, ip: 209.85.219.178, mailfrom: ilias.apalodimas@linaro.org)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e573136107bso1027663276.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 10:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744307321; x=1744912121; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T3kiy6w+WjR6l0j2IRp//D7X9DPXikftiUu3N2q3XLY=;
        b=U5F4EagKWd4YRYNKnm3elP9fIBnDF8O0bSzzBy4tlyGeVJrhYZTkZfS2Oi1xFuMslL
         rsMIM3RLZVBxLpFEV3erfp1bba/Mef2lPzVWLpQkRBL6xi57UgpL9CyRVHom2OEG/+v3
         DCQFrdzyawYtDi2emu6qx3S6STmJfe1hYjQA5Quy267EqlBOySmshmn0Th2WEjnkKH7S
         tXIbAZ7pV7ufzNkbS5PMJP6ji8MK3EWSWWE0+SLAVLB3A9WRVcZbCyAUeGXrBzlqw5H2
         7zNsg3RHqmorDQpR/802AoKloBcdre/5ypIDeaT6lq7gQsv2UgjPPrqW8TSqfXbwQOlx
         IUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744307321; x=1744912121;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T3kiy6w+WjR6l0j2IRp//D7X9DPXikftiUu3N2q3XLY=;
        b=gCGGW6/6vnkAAz3NPwYfJ/8ecbGcSbfENfWPzfAMpYQma0+g+NeyWB5Ln97EEWKwOr
         xeWvcjJB34yNoGfrJgYXOK4/pFk7FPC9Oz4Iv5JHdE7Dfz1pQxSoVDIGZoAG+FHEHuPu
         L1HTKCridr48k8NJrO6hHZJP5ST3wovtGoBWJ8pcSPKb0Iogw6az8dm4E1/AR9C9w7Ly
         kogyGgFwCaP2pOTmo4QfO5/pXXBHI7uZTy3oFe8w6qHGbwS+xDp4xXyV5zKTHJNuw99S
         BusjDBsaU8BUqslyZox2Bjr9SPg+8BKRJ7yLJz17s5bu9vQfSQylanK5XnlHQ8pzkFiY
         C14w==
X-Forwarded-Encrypted: i=1; AJvYcCUKo9aqa8p+onyDRp71H+bvLT/eznZydtWiXKQUQf5GfHjXcFB7328yeUaNhjWMdnh4ZWJxo7EV1uTMK6CnkC2g7g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzwzH3q8Y0qc0Q+pjELkYjul2TZmuZdbl4dkBbojK7j0aCSyEzB
	OL8whhiiPRrVvzWGxNLP1fXCuVGg0C36M7/nCRSQVYmdqigMn7j8D8nM75MDjkEuP4Z7VV62b+u
	0hJdHY47bEsidWyxFt97lRVBjIjgZZV9zTTijpw==
X-Gm-Gg: ASbGncvaGcZH6joFCdEX6yuW24UYJIdd9mJLkfaskPL4AUD8RO34JFCX6rpY0746p6s
	jslbQNWXOPlwIz2surI60BEUPBJlFbDU9O3Nxx1mYWfoxq9kQDagWAjtuYxezxvGuTI3CRFkT7R
	Hqm28qJNcZQ6vs6syddsZDrJA=
X-Google-Smtp-Source: AGHT+IHEBm46I43oMZ7NYgKmPrnX8Duh2Vzf6B2utjlfyoOVGjEfAv6+FE9zl09c1MyxluwzE5esW9OJpDcFyHtEPIM=
X-Received: by 2002:a05:6902:4906:b0:e6d:deb9:637a with SMTP id
 3f1490d57ef6-e703fb7b17fmr5063733276.17.1744307321049; Thu, 10 Apr 2025
 10:48:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-2-mikko.rapeli@linaro.org> <f84af1a6585338787539ee5be5826adbe434e8a9.camel@gmail.com>
 <CAC_iWjKTmSEOe6HUcPFUZLaBuA2+6ZwOYaYiqK0_R8KGNPU1Ug@mail.gmail.com>
 <CAC_iWjJTuV=TcNYhSeyybaU8hr-b9sauJiYt3Jo8+wxYC_7eUQ@mail.gmail.com> <CANNYZj-ORUDVcfGMBUczC-CQ1LwFZiS=6qToSCZUH2WCVqxGbA@mail.gmail.com>
In-Reply-To: <CANNYZj-ORUDVcfGMBUczC-CQ1LwFZiS=6qToSCZUH2WCVqxGbA@mail.gmail.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Thu, 10 Apr 2025 20:48:05 +0300
X-Gm-Features: ATxdqUGF9X9Ocb88s6YMVceoPuvotSXG0n4w49ndFJAjaMGkfe4p7b6PRyJcm5I
Message-ID: <CAC_iWjKWLoWc3UE0pyvsq9U70xMGaDeWL0NdUsoPm+jvByri4A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 01/11] systemd: enable efi support by default
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: adrian.freihofer@gmail.com, Mikko Rapeli <mikko.rapeli@linaro.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 18:37:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214692

On Thu, 10 Apr 2025 at 20:45, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> But none of the last few messages answer my question. Can I restate it?

Why? The answer basically says that every board with u-boot or EDKII can



>
> Is there a physical board that can boot from ESP formatted to something else than FAT?
>
> Alex
>
> On Thu 10. Apr 2025 at 18.51, Ilias Apalodimas via lists.openembedded.org <ilias.apalodimas=linaro.org@lists.openembedded.org> wrote:
>>
>> Apologies for the noise, I forgot to add Adrian in CC
>>
>> On Thu, 10 Apr 2025 at 14:45, Ilias Apalodimas
>> <ilias.apalodimas@linaro.org> wrote:
>> >
>> > Hi Adrian
>> >
>> > On Thu, 10 Apr 2025 at 14:21, Adrian Freihofer <mikko.rapeli@linaro.org> wrote:
>> > >
>> > > Hi Mikko
>> > >
>> > > On Fri, 2025-04-04 at 19:29 +0300, Mikko Rapeli via
>> > > lists.openembedded.org wrote:
>> > > > For example genericarm64 enables "efi" in MACHINE_FEATURES
>> > > > and in u-boot. Boot without "efi" in systemd works with
>> > > > EFI protocols but for example efivars is not mounted at
>> > > > all so various checks fail in userspace. Fix these by
>> > > > enabling "efi" support by default to avoid making
>> > > > it machine specific. Fixes efivars mount to
>> > > > /sys/firmware/efi/efivars etc.
>> > >
>> > > My point is that many OE/Yocto-based embedded products rely on a fully
>> > > redundant and power fail-safe firmware update and boot implementation.
>> > > So far I have not understood how this could be implemented in a
>> > > similarly robust way based on EFI as we have now without EFI-based
>> > > boot-up.
>> >
>> > As far as the firmware updates are concerned there's [0], which is
>> > also implemented in U-Boot.
>> > But even in that case, I am not sure I understand your concerns. What
>> > prevents you from having the existing mechanisms for firmware updates
>> > on a system that boots with EFI?
>> >
>> > >  I would therefore like to see the EFI implementation remain
>> > > opt-in until it covers at least the most important use cases for robust
>> > > embedded systems. What I primarily miss with EFI is a reference
>> > > implementation for an A/B update system without having to rely on a FAT
>> > > partition without journaling. Please correct me if I'm missing
>> > > something!
>> >
>> > Where does the FAT partition requirement come from?
>> >
>> > >
>> > > Would it make sense to declare poky as an EFI ready reference
>> > > distribution by enabling the efi DISTRO_FEATURE there, rather than
>> > > starting with making recipes enabling efi unconditionally?
>> > >
>> > > Could something like this in poky.conf work?
>> > > DISTRO_FEATURES:append:aarch64 = " efi"
>> > > DISTRO_FEATURES:append:riscv64 = " efi"
>> > > DISTRO_FEATURES:append:x86-64 = " efi"
>> >
>> > [0] https://github.com/ARM-software/edge-iot-arch-guide/blob/main/source/FWU/MBFW/chapter1-introduction.md
>> >
>> > Thanks
>> > /Ilias
>> > >
>> > > Thank you and regards,
>> > > Adrian
>> > >
>> > > >
>> > > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
>> > > > ---
>> > > >  meta/recipes-core/systemd/systemd_257.4.bb | 3 ++-
>> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
>> > > >
>> > > > diff --git a/meta/recipes-core/systemd/systemd_257.4.bb
>> > > > b/meta/recipes-core/systemd/systemd_257.4.bb
>> > > > index 64fb8fe69a..06e5621398 100644
>> > > > --- a/meta/recipes-core/systemd/systemd_257.4.bb
>> > > > +++ b/meta/recipes-core/systemd/systemd_257.4.bb
>> > > > @@ -68,13 +68,14 @@ PAM_PLUGINS = " \
>> > > >  "
>> > > >
>> > > >  PACKAGECONFIG ??= " \
>> > > > -    ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit apparmor efi
>> > > > ldconfig pam pni-names selinux smack polkit seccomp', d)} \
>> > > > +    ${@bb.utils.filter('DISTRO_FEATURES', 'acl audit apparmor
>> > > > ldconfig pam pni-names selinux smack polkit seccomp', d)} \
>> > > >      ${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo',
>> > > > 'coredump elfutils', '', d)} \
>> > > >      ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '',
>> > > > d)} \
>> > > >      ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '',
>> > > > d)} \
>> > > >      ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit',
>> > > > 'link-udev-shared', d)} \
>> > > >      backlight \
>> > > >      binfmt \
>> > > > +    efi \
>> > > >      gshadow \
>> > > >      hibernate \
>> > > >      hostnamed \
>> > > >
>> > > >
>> > > >
>> > >
>>
>> 
>>

