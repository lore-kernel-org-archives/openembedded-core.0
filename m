Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD7EC5B572
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 11:02:24 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27643.1786964541191132843
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 04:02:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=JRmzUVut;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b28c91fba5so3867844e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 04:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786964539; x=1787569339; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4YBWujUsfTSGrFu88rhgd7JPp8h2Vm1CkAZdvw6dXSo=;
        b=JRmzUVutPZADaWjue3xcquOcvnjpRY+rLPRj8r6/XtGqG5nzpRbYJFscprnnPGL/Hn
         m2ohHsqIUlKis4DxeXuK2aPuvNfON9EBDmZRWbqcMGEf2ezLWSPzm/nEPko7aTRh/dyp
         YdWUM65tVFywP41016TzRTWpeWZ1bF+oMUdjciCUTdmvV8McJEAKaabo0IyPeblPSBS1
         7ASdaVWjR47mDlJ939dsKxKsX8l1lk2H5Kf7QZ6ElfxXuyQMTaHV9VVftRYpP3aimHat
         qNpV9l/LdJwDytV4/TRmGHEhH1EpJGPkvjLAfDuadmLkWWLVkML2USk1G/AAiCkjBw70
         pCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786964539; x=1787569339;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4YBWujUsfTSGrFu88rhgd7JPp8h2Vm1CkAZdvw6dXSo=;
        b=eTohiIKwzXlpACTworq7pBaBIAz5P5x6RZt0qvJMm7vn9Ezha7JoooR27mG8+bcisH
         iBkKuLUY+4bQW0xcVfqhfMHYoApoJVkJcYZIJtjq0zd4NJ/5YwQJiW3fUWWgxrTlD+Vo
         aKsFgrklbv9jfB1vTtmWGpJJc+HVRArCh4NAILd4wIFcifjvBqCGu8PrVXjnYJyIbqUz
         imwjolH3yFWJ0OOzmBemrHsM8R3/msGI9XoIVNUL3lB1tWwcBOcQQ73S7O29xoN3DwX9
         zPng4QbOg1na6O6fGMJ84HVK3nD66FeBCkI6iwOsVB9TnX6foLLwReUz5oNCb5LqTC+R
         WfKg==
X-Gm-Message-State: AOJu0YzEtMx/sRF0Vbxsul0yIZMjersm18Z+nxsXe4XYplVFanVE67I9
	F+tIU3+5LNTjv6wpzDdh+17w/0IsyP/DxwaVEhuaqVC65WQGjoynpfVA07NsO9VWHyc=
X-Gm-Gg: AR+sD10vWsN4q4s2bDl9Nlh+PYXiRtTbw0CYKpQ+mimuDqpzFXweMV8chB3ZcwEYUUF
	CuIVY8eDdCR+6t2SjJLmvLVcP2Zx8rf8zvDbXL8g1GpDsrR9Lj74ikXAFjK0pWVpkZmzGWLguCX
	2zP8qLVJQE4S27zhN4hKJMHeUvc1xBblGP7GcX1tB4Snj5zdGRMAodj2/OWYmGF4V1jao1IhgAx
	XfV2d0T5m0kgmEfX9IyN9rsg7lTOCV61I0brYoFu75cfCnuKqy0kyyH8WtJFZS6QstRLKnW3Mv/
	N5NaQ/qTgHwn8eNiSW89QOgzjJwx6EBoT3abYVDwVjCuq5vI+ZKblrFXNvLswerk/eYRzHcOu0d
	h54IsCuWgq00IHdi41qbhpRRcHY4j25wJb91uQc5/m3ZtVc8jCI1ZLmSyiZtG2UAb/w5ID2LoPf
	PFemWc1YddELPUViYf92NmpIxk/OSg/rVaj9k2GheshgjO4gFzmaHcp3BSrRw1KnZPEn34Ikzox
	Tu9aUWJDvjf9JI=
X-Received: by 2002:a05:6512:32c6:b0:5b4:5c2c:7b73 with SMTP id 2adb3069b0e04-5b45c2c7f3amr3682860e87.19.1786964538981;
        Mon, 17 Aug 2026 04:02:18 -0700 (PDT)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cfa12c1sm312427e87.24.2026.08.17.04.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 04:02:18 -0700 (PDT)
Date: Mon, 17 Aug 2026 14:02:16 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 4/4] kernel-devsrc: copy kernel/sched/ext
 directory
Message-ID: <aoLqOHiulqm3hxZo@nuoska>
References: <20260814064812.1071873-1-mikko.rapeli@linaro.org>
 <20260814064812.1071873-5-mikko.rapeli@linaro.org>
 <CADkTA4OfiyTA=V+6s_nu+27HK6PZXcojwm=H7AkOch1huwFDHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADkTA4OfiyTA=V+6s_nu+27HK6PZXcojwm=H7AkOch1huwFDHQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 11:02:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243609

Hi,

On Fri, Aug 14, 2026 at 08:48:45AM -0400, Bruce Ashfield wrote:
> On Fri, Aug 14, 2026 at 2:48 AM Mikko Rapeli via
> lists.openembedded.org
> <mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
> >
> > ext_* files were moved there in upstream commit
> > bba2c3615bd sched_ext: Move sources under kernel/sched/ext/
> >
> > Fixes oeqa kernelmodule.py failure with 7.2 kernel:
> >
> >   CC      kernel/sched/rq-offsets.s
> > In file included from kernel/sched/rq-offsets.c:5:
> > kernel/sched/sched.h:4214:10: fatal error: ext/ext.h: No such file or directory
> >  4214 | #include "ext/ext.h"
> >       |          ^~~~~~~~~~~
> > compilation terminated.
> > make[2]: *** [scripts/Makefile.build:184: kernel/sched/rq-offsets.s] Error 1
> > make[1]: *** [/usr/lib/modules/7.2.0-rc7-yoctodev-standard/build/Makefile:1408: prepare0] Error 2
> >
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >  meta/recipes-kernel/linux/kernel-devsrc.bb | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
> > index 0b52f5d48c..da33e9facb 100644
> > --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> > +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> > @@ -368,6 +368,9 @@ do_install() {
> >          cp -a --parents kernel/sched/ext.h $kerneldir/build 2>/dev/null || :
> >          cp -a --parents kernel/workqueue_internal.h $kerneldir/build 2>/dev/null || :
> >
> > +        # 7.1+
> > +        cp -a --parents kernel/sched/ext $kerneldir/build 2>/dev/null || :
> 
> Is it actually all of the files we need from the directory ?
> 
> We avoid full directory copies wherever possible.

Only kernel/sched/ext/ext.h seems to be needed. I will the copy to that in v2.

Cheers,

-Mikko

