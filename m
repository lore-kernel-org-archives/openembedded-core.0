Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56588C3F6B0
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 14:23:08 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web09.12513.1660054978639535558
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 07:22:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QKQCBZLK;
 spf=pass (domain: gmail.com, ip: 209.85.160.41,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-10edfa2d57dso14171768fac.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 07:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=3Ui55+G8oDxXzE+WlpA3gDhJIzGe3cozz1QQx9xTpE4=;
        b=QKQCBZLKsJIEhfeTqqqUfHMMCeq8e1c0wKAPbC6UEblQomzI+ObmHEhkhRrA1coO4J
         kY4b8SEKUMbt9AglZRCpgpYQWG5RlDSBh4t+ZpD+eOQE2NSkpvZL6XalaoZrUXejoyLT
         KnFd06v9B8FUeSZO9lu8gtn42KwvZwgoo/NJiRktsilksLXUudBE9mk5SQ80mDFdiBV1
         Gm2P+r4gJJvEkS75sItEkWH9ZvTPgD/y326JlYztr2J3y55gwTdRf3Nd7HIj5Yui91M5
         a075Gt3Bu9pt3p39UfQXL+GS146U58RZn+GhGyCij51gljI6k9PcizYt3TIJOJq2dVxX
         DW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=3Ui55+G8oDxXzE+WlpA3gDhJIzGe3cozz1QQx9xTpE4=;
        b=IURuDyD+SzVsNImekCMoJqUeofZ8V9GP30vO8T5tmDK+E0U5kIFz15O0fscFz2ZB9M
         I/86tN+y97LgmPlbCDjeQxjrecwAWsSclNh4yRk1EhBm5Fr0IpM4P1WkJh/s5ABLWvcX
         YQsXVYwV2qcZI3i69nmpHW1e6TZ1+Ej1xNxL7xfaNn0CADZ4UP9Hfz+m/C4JeUt4XV+z
         RfISyCoGLWBzRM0a6yhG2t/MlIMZsiE434HODni4ypIMG0kwYBBuQzuJdijXGJG2f16d
         0G5VLJJf6pg2OxEkz+VSPNad8VeyoxZYzNxLZcKalR/j+g5cYDvjZzGUJnkz9DMz/+Ow
         DoVQ==
X-Gm-Message-State: ACgBeo1OfpbBZxU4x2tSUwhDJhAIA+PsbRF8iZ0fANMAH5MgqH+bJlwL
	Bk2epjpEPYLBRXiQrcpoa9Z2pl7X33Dv7zBiQRo=
X-Google-Smtp-Source: 
 AA6agR7LGdVMPLNwLsTtG/7D2QIJ5HAUXq/YuQF/jebeGcTVmOxCgbBLq3kx2evkwpFSLmEyZfKwVjvE7G2nKvYNiHM=
X-Received: by 2002:a05:6870:4388:b0:10e:803f:9dae with SMTP id
 r8-20020a056870438800b0010e803f9daemr13520250oah.175.1660054977979; Tue, 09
 Aug 2022 07:22:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220809111449.192321-1-richard.purdie@linuxfoundation.org>
 <CADkTA4MBRL7JuLA8D32K1_CcyDMcRO=hfJyghPHyUZtwKw-nqA@mail.gmail.com>
 <bfc1c1a5b9ac8093b409129b825c41696650f66a.camel@linuxfoundation.org>
 <CADkTA4OnaX_jAn7GLbOVRSONWqTcMdc9Zk4Fg4ULdeUDEDjnXw@mail.gmail.com>
 <38993922ecd0f4c3d774ff9fd5d4053ad80ea6af.camel@linuxfoundation.org>
In-Reply-To: 
 <38993922ecd0f4c3d774ff9fd5d4053ad80ea6af.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 9 Aug 2022 10:22:46 -0400
Message-ID: 
 <CADkTA4MNbF9my_zeO+Bq3P5fcWDDijyYe_vcuyUuze2bXeGwgw@mail.gmail.com>
Subject: Re: [PATCH] kern-devsrc: Drop auto.conf creation
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 14:23:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169153

On Tue, Aug 9, 2022 at 10:08 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2022-08-09 at 09:29 -0400, Bruce Ashfield wrote:
> > On Tue, Aug 9, 2022 at 9:26 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Tue, 2022-08-09 at 09:16 -0400, Bruce Ashfield wrote:
> > > > On Tue, Aug 9, 2022 at 7:14 AM Richard Purdie
> > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > >
> > > > > After this commit in the mainline kernel, the quoting is different in auto.conf
> > > > > compared to .config:
> > > > >
> > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=129ab0d2d9f38b9d43df35235fc66c6740d6928b
> > > > >
> > > > > We therefore can't just copy one over the other or it leads to syntax/quoting
> > > > > errors. We end up running make prepare anyway in all our tests so drop
> > > > > this copy for fix 5.19 kernels.
> > > >
> > > > It is safe to stop doing this manipulation now.
> > > >
> > > > But I am curious, I was running on-target tests for 5.19+ and didn't
> > > > have any issues, what is breaking that I managed to miss ?
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/5629/steps/13/logs/stdio
> > >
> > > Basically any kernelmodule.KernelModuleTest.test_kernel_module which
> > > was run was failing (which would run on any image with kernel-devsrc in
> > > and a toolchain). It failed everywhere, all sdk qemu machines equally.
> >
> > odd. I never did see that same error, and I built and installed kernel
> > module for all the architectures.
>
> Did you use the oeqa code or something else? It seems odd you didn't
> see it as it was quite consistent on my local system and the
> autobuilders :/

I run everything by hand, oeqa has always taken too long in my
infrastructure, so I run the kernel tests myself.

Bruce

>
> Cheers,
>
> Richard
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

