Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F35ECAAD8
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 00:11:02 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web10.1730.1663805455060064200
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 17:10:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Gi6dYCXb;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-1280590722dso11602744fac.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 17:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=sa5fXCZwA12YmKuOWg5tLZ8Nq/sLWPNBaZMkXeQ/tzk=;
        b=Gi6dYCXbDFjm6hC6HSNwpoz7/kM2ziSLxLwSJJpkmyXiSoidWkZIiaJLxsP2kCUW+x
         HYPFgmdx0+X57Pn0TwlDb3KR5eg2NuPGG/wekWxURrU2ypKBSBVzL3ynzo8AfjrvcNW9
         A2gMS3ZXIa+yeMYiSkl8dJB0MuGamFFAgOjA2IbrXfnMtDXJB2LnQOVrTBFA+je7bnNc
         vF4kbH4aXEBNIs//ySaQmWrnie2lIzNODDYD6R7dllwdykuBZ4DbdTTlTXZ+hXzthmvY
         QcKrIVg3UvderyM6A2Oh/iGUUGBUXkxhc4rEMOVOqeTlYRoZ/wWoiJ/B7J8FIMM5OLgW
         SBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=sa5fXCZwA12YmKuOWg5tLZ8Nq/sLWPNBaZMkXeQ/tzk=;
        b=f29zeJKYlLY0EsMrNAFESd65TweHBLKhfTDq93FrfG5rIjMKX8Tw4RfxIjBdshHr0v
         jjAhekUpyRP9lVvBEUmm7bTeDxBnyOuFMKQdpH/iY5HaMJV4hDp7szpbP97c6/XMPrvO
         w9yTZi+sEBd9dqwJQsY5V6EQhCVl6eATxYYVLFUHI09UZT843+CMZaeQLVp4j4vlDSbm
         XeiWhtBjVbfAnQjC+XLFm/hhe06jW8aR9sJEG/FM9s263JpCh2JgTADREWkUm0bnB1yv
         2Lc4hP63Q249APrk46MO0F9zgdavqvXtyWmuW2W4AaahSjSxuKrjTvZKt4/Vny2u6xKl
         9wBw==
X-Gm-Message-State: ACrzQf1PXZ3rKuEm9Y6sF0WwF2GnNmbRcpdKSKeEs58BtEm74DFjqX9m
	/QcBZyeXlse8IApnYSc3vjblQZpyCSgyc7RN26bvbRj6Cvs=
X-Google-Smtp-Source: 
 AMsMyM7ynV+y/MmSWlpOpOKCBZlW8crVgbGJkj6scFcHS1jnG74Joor9AWYdy+V6Mmqdc4OMANtI+93fE8qNfjP92LU=
X-Received: by 2002:a05:6870:b00b:b0:127:2d3d:3c16 with SMTP id
 y11-20020a056870b00b00b001272d3d3c16mr6524102oae.262.1663805454392; Wed, 21
 Sep 2022 17:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220921022332.3890912-1-raj.khem@gmail.com>
 <23829f12dfaa55631dd7783d7a4c8846dbfdfe23.camel@linuxfoundation.org>
In-Reply-To: 
 <23829f12dfaa55631dd7783d7a4c8846dbfdfe23.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 Sep 2022 20:10:28 -0400
Message-ID: 
 <CAMKF1srGoevLdYDkC+_GR19MW3GC+07eOYqkeax8wp0pNF_K9g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] gcompat: Add __getauxval wrapper needed on
 aarch64
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Sep 2022 00:11:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170963

On Wed, Sep 21, 2022 at 9:38 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2022-09-20 at 19:23 -0700, Khem Raj wrote:
> > Update SRCREV to bring in few bug fixes
> > Install a .so symlink which could be used during linking
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v2: Symlink should point to base_libdir not libdir
>
> It still breaks:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/5884/steps/11/logs/stdio
>

yeah patches in conference benched do not help :) I realised that we
have to create libdir
since it may not always be created. Have this time built with poky
distro locally on qemux86
please try v3.

> Cheers,
>
> Richard

