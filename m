Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B84BC0015E
	for <webhook@archiver.kernel.org>; Sun,  6 Aug 2023 13:56:36 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.11384.1691330188787144371
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Aug 2023 06:56:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=rhq7xOlc;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: luca.boccassi@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-40e268fe7ddso21238831cf.3
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Aug 2023 06:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691330188; x=1691934988;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MnW2P+MP501fA1Wh7nEKy9TcuSNVXIoiownjz8GbVS0=;
        b=rhq7xOlcEgGCS6dX5UvY4tk2MsQ2RWa3M8jIzL27S5jkpdlZGqX7/TGmyW0N+3SaSd
         /nvbSyEVQOqko3XPKEynZs5/Q5xc98q4crdOIBdXX92UIgv8nCeJrnFynG07CdxPBXJe
         7s3rjJfioYR8KXPCYE7Q5NbThc0o3nDHWO7EKwx16d/sUugPXYoX4rHsGxUhipE9K4xM
         YpuUrpumtYUFfN35sGlFnXo6JVxZMpGS+DMGOWILgPYeFATpnxosZnoZhhXx5xEE+US7
         FIpcshHk94/8vNpwDM0/CUKkK1UYY23mcAcpdx8EfaFymNrTtNMJvg9ervENKmriR9Co
         sBUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691330188; x=1691934988;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MnW2P+MP501fA1Wh7nEKy9TcuSNVXIoiownjz8GbVS0=;
        b=H3U2hB7Tr/VCHignSwDA1gx0b7pcSk3Yw5TUt/UDnl/M/5FkPmhGzQeLPpbQJGf9vs
         pwJLHqmVHn2AbQiYzgR8TuFX7yb7F3c0Btxsv8U2XyZTV0uZovt1HZxTt23IQFPP3FTi
         4TfYcV5y+tAgBadEPG5QA9Zw94Hcmtg3igMDTz13aGgRYegVVEouBPkZPX8N/KOyGsHV
         vV6nmoA8EVjL0pDrGi3JF8NQLfXwhaswqz2LSAMLq4896FTrhbQJTfqjL8rwiZd5AC++
         8J/5BDbYIJyyx9nHMnUv8UWk5dtKZrj6XFTLSKjgGg3xmVy/2bPLq+mquveVC9muJSV/
         gP6A==
X-Gm-Message-State: AOJu0Yxop72LHkOgcv7FYnC72ET8JTokI24jzMvf8XViiqdCc9nBMBdb
	8ay3b6JsEoIKF0clA3O86kT8R+Vj0Tz7Uf8UH5w=
X-Google-Smtp-Source: AGHT+IH40tNEmPkEqymO57S99P25/LA1DVlifwCyGsbus8lDmU1PHQnAIHy/aGYeGo/8GKO1ov/UQiCkP+c+IBoo3zk=
X-Received: by 2002:a05:620a:c50:b0:766:f9b8:55f3 with SMTP id
 u16-20020a05620a0c5000b00766f9b855f3mr6976363qki.70.1691330187761; Sun, 06
 Aug 2023 06:56:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230728204418.4044524-1-luca.boccassi@gmail.com>
 <20230802231615.2106089-1-luca.boccassi@gmail.com> <202308061238184bdb334c@mail.local>
 <CAMw=ZnQZ0ZJGjm5DCMza2dfF+xhpAoaPbgeMvJre6NM_qNd6RQ@mail.gmail.com>
 <20230806132213bed8666e@mail.local> <CAMw=ZnT3EB9v9wC=tkjJGvDu0EbvVkdmppv4qBgUp-K-Ui5e7Q@mail.gmail.com>
 <c956c4fc4c1b4aaa8004c10f8a2d445539e780d1.camel@linuxfoundation.org>
In-Reply-To: <c956c4fc4c1b4aaa8004c10f8a2d445539e780d1.camel@linuxfoundation.org>
From: Luca Boccassi <luca.boccassi@gmail.com>
Date: Sun, 6 Aug 2023 14:56:16 +0100
Message-ID: <CAMw=ZnQ9VDL=TCUzfsSRiGujCyb_-ZO50S3+UFckDh6LkTgnWw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v8] systemd: update to v254
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org, 
	raj.khem@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Aug 2023 13:56:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185570

On Sun, 6 Aug 2023 at 14:50, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sun, 2023-08-06 at 14:34 +0100, Luca Bocassi wrote:
> > On Sun, 6 Aug 2023 at 14:22, Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > >
> > > On 06/08/2023 14:15:27+0100, Luca Bocassi wrote:
> > > > Where does that objcopy command come from? It looks awfully like it is
> > > > hard-coding VMAs? That cannot possibly work reliably, the actual VMAs
> > > > have to be calculated based on the components being added to the PE.
> > > > I'd recommend to use 'ukify' as that makes it much easier, and
> > > > actually we have an intern working to add a bbclass for that just now.
> > > > But it's not needed, you can do the calculations by hand too, dracut
> > > > used to do something similar and was fixed some months ago iirc.
> > >
> > > This is from do_prepare_partition in scripts/lib/wic/plugins/source/bootimg-efi.py
> >
> > https://git.yoctoproject.org/poky/plain/scripts/lib/wic/plugins/source/bootimg-efi.py
> >
> >                 objcopy_cmd = "%s-objcopy" % target_sys
> >                 objcopy_cmd += " --enable-deterministic-archives"
> >                 objcopy_cmd += " --preserve-dates"
> >                 objcopy_cmd += " --add-section
> > .osrel=%s/usr/lib/os-release" % staging_dir_host
> >                 objcopy_cmd += " --change-section-vma .osrel=0x20000"
> >                 objcopy_cmd += " --add-section .cmdline=%s" % cmdline.name
> >                 objcopy_cmd += " --change-section-vma .cmdline=0x30000"
> >                 objcopy_cmd += dtb_params
> >                 objcopy_cmd += " --add-section .linux=%s/%s" %
> > (staging_kernel_dir, kernel)
> >                 objcopy_cmd += " --change-section-vma .linux=0x2000000"
> >                 objcopy_cmd += " --add-section .initrd=%s" % initrd.name
> >                 objcopy_cmd += " --change-section-vma .initrd=0x3000000"
> >                 objcopy_cmd += " %s %s/EFI/Linux/linux.efi" % (efi_stub, hdddir)
> >
> > Yeah that's a bug, and it needs to be fixed, those sizes can't be
> > hard-coded like that, as soon as you build a slightly different stub
> > it's going to break.
>
> Given this is causing multiple breakages on the automated testing, the
> systemd upgrade shouldn't have merged. It has. Technically I should
> really just revert everything (the upgrade and the fixes on top) and
> wait until someone has a fix for this. I'd prefer not to since we
> obviously do want to upgrade eventually.
>
> Is there anything we can do with this short term to make things work?
> Can the offsets we need be read from somewhere?

The Arch wiki has good and concise documentation on how to do it:

https://wiki.archlinux.org/title/Unified_kernel_image#Manually

This is the equivalent fix that was merged in Dracut some months ago:

https://github.com/dracutdevs/dracut/commit/f32e95bcadbc5158843530407adc1e7b700561b1

