Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web12.12312.1619466574851811222
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Apr 2021 12:49:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VHFwmNjV;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id j4so50594230lfp.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Apr 2021 12:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YmPmxrsjedxTkmLLH0Vn1Z4wDbtvTtC9gaeTWMG3ZTM=;
        b=VHFwmNjVvxz2CQEI446mfHWjl1CQAvbbhpGScYmQRSCtOcCVqn4UB0wyOWZaxLjvSM
         QWDnFIAyBPB+XFcsICzApUEEwZbzMfuHE436l9m0Uj0Zw9Q+Wps9jY1pcxzcUK1ioL7H
         d6zSLXE9ZG2NndYeC+VgyAd9/KUhrOBReqAsXQwivM2r3QWrydxdamgozPom+2dV+9zq
         +xEGgxbSYwbXG8PeB1ppVUM71tjzEeFT19SKHGCDakMsOmyqgghx3mazYUkhF9q6vVvc
         udr10uwVCD21vA/Ox0hbWvDrhltn52aB9i5kMRhM+/gQRwR16hQlLP/SoraVJ0xoaRKh
         da7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YmPmxrsjedxTkmLLH0Vn1Z4wDbtvTtC9gaeTWMG3ZTM=;
        b=sb4sRPZ36QuzFqXfOkrpDOqRoUTeyRGmo70P5snJF+jb2h/DDgxql4pMsvuWhi89mv
         KUnY4zTZGe6+T62sDAmdvTqSstfs6GiOe/KQ1Mys6Asn5JwqVLook8/vvB1MO8NgWPkm
         78Y+tYAtHI0V4dHElNl8ySQEdj+al8X5ptaABYPvagi5vFP3qVMKKq8jFya2KHWshju9
         FKnuIgfkd/OFVX8JqCVtczDrrLyMoR5OVNsM6X5CMQYrhezcYEk/PFRXOXs/7HAJ496x
         dibrDtMz2NnUrNQCmibkZ/Ebg0ZGPFov2GATVcyvDaAVjPr2BAa6M6yQuOfTg1cxJThS
         5F5Q==
X-Gm-Message-State: AOAM532l4PGePFQc9zSCjYgVm7rbIuZ9xwah/BqhGacC09HECYtIk0mC
	NzzbZcnaqWfJJIajxYIyykPuBqKsekgT/6Z/SNI=
X-Google-Smtp-Source: ABdhPJyGFatyo1Ky+woMGxBdrQCsBNzFHXy6bRttXou0pFOY/OdzREJ/uaEVsD98L1DceoVC6xtTaIfSdNdaxtmq/A8=
X-Received: by 2002:ac2:54b2:: with SMTP id w18mr13839231lfk.392.1619466572945;
 Mon, 26 Apr 2021 12:49:32 -0700 (PDT)
MIME-Version: 1.0
References: <YIcMLMtsNSTlinqq@pevik>
In-Reply-To: <YIcMLMtsNSTlinqq@pevik>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Mon, 26 Apr 2021 12:49:21 -0700
Message-ID: <CAJ86T=VDx=w4FB34BZhsGcFYO8zAJ27kE6t9d_3xbBvkpOPDfg@mail.gmail.com>
Subject: Re: [OE-core] LTP drop MUSL specific patch
To: Petr Vorel <petr.vorel@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj <raj.khem@gmail.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 26, 2021 at 11:53 AM Petr Vorel <petr.vorel@gmail.com> wrote:
>
> Hi Khem, Richard,
>
> I'd like to replace MUSL specific patch
> meta/recipes-extended/ltp/ltp/0001-build-Add-option-to-select-libc-implementation.patch
> with just removing broken files. We use this in upstream CI for Alpine, I ported
> it to Buildroot [2], where works well. It's better because it does allow to
> handle MUSL without rebasing this patch.
>
> I was looking into the docs, it looks to me that do_configure [3] might be good hook
> to add it into. But it looks like by default it contains oe_runmake clean [4].
> Or should I use different hook? And how to find the default content of chosen
> hook? (if I need to extend it, I'll have to provide the original as well)

Changes to source files, including removing them, should be done as
part of the do_patch task. Since do_patch is implemented in python you
can't simply _append shell script commands to it, but you can add a
shell function via do_patch[postfuncs]. If you grep for
"do_patch[postfuncs]" in oe-core you should find a few examples.

> Thanks for info.
>
> Kind regards,
> Petr
>
> [1] https://github.com/linux-test-project/ltp/blob/master/travis/alpine.sh#L35
> [2] https://git.busybox.net/buildroot/tree/package/ltp-testsuite/ltp-testsuite.mk#n72
> [3] https://www.yoctoproject.org/docs/2.5/dev-manual/dev-manual.html#new-dependencies
> [4] https://www.yoctoproject.org/docs/2.5/ref-manual/ref-manual.html#ref-tasks-configure
>
>
> 
>
