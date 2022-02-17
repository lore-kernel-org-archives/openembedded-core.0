Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8169AC433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 20:35:12 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.2220.1645130111022428115
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 12:35:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GklzK1Pg;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id n6so10605778qvk.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 12:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F8kBJD/Sk7jIPNbPsx1tn0hX2wb0T4mp8K8FHTAna3U=;
        b=GklzK1PgpdOIel8VyOI12gsbCzD1T0CcZ2c0xOZqxwrSV7snS5YRR/rg+QfccBK3/D
         WHuBhjEFmYY+iVcb8CDcynr6DHjDq/xi2XRigyQg6nxzZpmX00a7XSdf7rouPgzvzzG6
         L0TIVpUd8ECnr/5wp2UFJWKhWdOSm1CVHPFFIylekDqK6JYfgC2gYcDt6W5+FB3ZXZAk
         rBaAk/slg+N2jK6Qf22lTRMyhGsfcJ+GdyTcd6DqJ6JtWav18jx3FELc9LJsS+QQLHp6
         qCTUNmTkwFhcw1g/yfMa0ZLrPPKL3wds0VG27KmzZz0iTegYfFLCjQfsBNOpRZfxczNz
         /r1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F8kBJD/Sk7jIPNbPsx1tn0hX2wb0T4mp8K8FHTAna3U=;
        b=7cS2a2inH3nWT+IKb93DG9FF/1TCmKDiXMu8NBcSFTgVBpaoQIW4U0QnxpSP9o5zvg
         hZInkoK8RtAeckDGF9hW18RIZbjp3EIG7MiQa1vILBnWFnm8XFMQoR+JhTQIQRfRkZba
         fgGDL78krmrq3ETwAe0qpIPoiHeW/NeKM8/GRoP5TkKr7DuhGyK+Olsc0jnqHt268YDE
         A91KMf1RerxMaF38NvtzxtT/R1lW5IZozKnud7m7XJfq2cptCgzKJ1VWFBkAcRMdt2f/
         UsMvM5R7t/UF5VS7tRrCiVX4JagbfSBDV0rjwPrNhUWgE0PtFZ9BQvpoAiGPMhF+YV6S
         R28w==
X-Gm-Message-State: AOAM532L5WcZK2b6ndLS8fFOPh/kizWT51T9SN3nVMLjyjYDAV7L1yD1
	LJGO4pIuI0haHBBgEsubSjzTcl+WpnWZOI3XUNc=
X-Google-Smtp-Source: 
 ABdhPJzQUVoVPM4+uw8YuHe0JXFuGKfRIjVccBaRM9OepCiuYAjzBvtnHIeDwJEIA2vs0PF0q0I57zoPzmCtH8Tr/Gw=
X-Received: by 2002:a05:6214:b6b:b0:42c:a44:6b72 with SMTP id
 ey11-20020a0562140b6b00b0042c0a446b72mr3537142qvb.24.1645130109983; Thu, 17
 Feb 2022 12:35:09 -0800 (PST)
MIME-Version: 1.0
References: <20220217160939.1424397-1-alex@linutronix.de>
 <20220217160939.1424397-2-alex@linutronix.de>
 <0d022bb4-9fe0-effa-d6b9-50812f060cdc@gmail.com>
 <16D4AB147C5087DA.27018@lists.openembedded.org>
 <CANNYZj8gG9vxKmU=5AU_7RV51Zji1b=mOT8fcdDqvvo-N9-Z-g@mail.gmail.com>
 <83fae3c2-2583-f6de-6b17-65193de1969e@gmail.com>
 <16D4AB76A8A77679.6551@lists.openembedded.org>
 <CANNYZj_ukmN6dTh78zJh6TEuqze=b=vMTmeDp82AXj95WmM2_Q@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_ukmN6dTh78zJh6TEuqze=b=vMTmeDp82AXj95WmM2_Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Feb 2022 12:34:43 -0800
Message-ID: 
 <CAMKF1srDsJfKtsw6EGEROS0i6y7mEe_ztJbuODpn4K8Lyq4A9w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/28] weston-init: replace deprecated/disabled
 fbdev with drm backend
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 20:35:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161862

On Thu, Feb 17, 2022 at 12:16 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Thu, 17 Feb 2022 at 21:04, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
> wrote:
> >
> > On Thu, 17 Feb 2022 at 21:03, Khem Raj <raj.khem@gmail.com> wrote:
> > > what qemu targets are exercised by AB for full runtime tests ?
> >
> > x86/x86-64/x86-x32/arm/arm64/mips32/mips64/ppc32
>
> As for risc-v, qemuriscv.inc has:
> QB_GRAPHICS = "-device bochs-display"
>
> If I remember right, that driver has kms/drm support, so it should
> work like every other target, subject to bugs.
>


yeah, I will see it soon,

> Alex

