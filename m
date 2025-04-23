Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80090C369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 08:32:15 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.3613.1745397125287036443
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 01:32:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=P8BYXUcA;
 spf=pass (domain: linaro.org, ip: 209.85.167.54, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54d3ee30af1so6408262e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 01:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745397123; x=1746001923; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JGx2qILjBdry0U/Aq0ivTRtaucnQKAZVFS0yVca87qs=;
        b=P8BYXUcATgXpmOvv9sbW042vtNkr7NhiDDHxSDZyJzkEqBNB6h/u9adURaJUmMq9tb
         RFWCEMiEPpZW8cE4xPA11mhhfQfV0L/w4raWmsv+7kVi8ES7Z02JCp7CCL0G6W7nxsei
         5Cv+9iggrXTQfLjHcTP3VorK0YZfEhHLVWSL9j0mJoQHO7S4ceK/pbfvfp5mCHaBlrrU
         FW8Sf0Aj2+LaC7UCUxaGM679b8qY40haFbI2yruFEfKLVJVziwwsqYTA7RX08usBK3OG
         VwZy2gt4sjWF9FkymhPlT2FSkeFt9Xk5R1/h2r88fPXbxFTP0TmjsTPT9DNY+hXZRrYd
         NJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745397123; x=1746001923;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGx2qILjBdry0U/Aq0ivTRtaucnQKAZVFS0yVca87qs=;
        b=mEHDOk0GS7GmwV/tdi5o0zKijPW+AfC5eYXQgEkyKOTpeZ9QhrtLx0LvXXlw4fQCKZ
         ZE93V8SwXoW21ocDGav/Sd+Gd5JZgC6ZFX9PLXyQC1bwQ3b4MTGU7qil1Yb19Taq0bYA
         kZLP+kF43vNb2KiWu8yV2bfJceCwbPgVb9eAUzkkkTbNnz/Mg0XtlRNa+Vrxcqs+lPFw
         NMV8GXBAnnFi9SELJ7RPFC+JoDALvazqkO4649wA0Rodx9uA+dBSzVX2YdpUoLahWxLj
         QzLp6M/c3leBx52A3e6YpqYGdp4GENPdMIh4/t1Zk+BlJfhmzuNTNeE3ld1fB+vs4pmv
         OsGw==
X-Gm-Message-State: AOJu0YwYf0e1xLzN942P75j5RHjrCPH1WPg092FTT7O0u7jHL6T1R/a0
	9vqy5JzEN8qryyCgIhmjMNsJghf80+DCIrGsnG5Q/Kk08p4noruNcTlXkR2fEfw=
X-Gm-Gg: ASbGncu5luVn1hjUogdoCawUK1NYlbtlr2IHXXXv+tGtKBhNcE95q7ybXqx/znfv0jz
	DQOdkDkoAEE757W3ojFQ/u+vSyJvBdmjnItQDzZdiR5YpEyykezryJGCvdBovCJlqW7H7j42rE5
	KhQ8nQJVTvqV85F8S3lr2Q2SKKfcAzbDRXU8CGfHgn0FOy6gItnIxiIU4ovWk+SIC47ZmAJKZvt
	gmgbh5CadPDhXh7J+5oum5UOALdTOkQW8CIDeyJ7ZJziZkpC4zAbULYthZEB7wFQ3r2/en7XVF4
	VjcYmZDxxztSCTEVRHNmv46YPDd0nCHWNGsKrxIIrUJjIewGc2Dwa5ftCMgPe0TgAcOY8Q/+0Q=
	=
X-Google-Smtp-Source: AGHT+IHDU9PJJConVpgP6ubLt92Og8Pnb/9FDZXsFpK/D55c6mu9ZjDNOW1C/K91fFi6uW2yRxvdvA==
X-Received: by 2002:a05:6512:3d07:b0:549:39d8:51ef with SMTP id 2adb3069b0e04-54d6e61c074mr5540825e87.6.1745397123069;
        Wed, 23 Apr 2025 01:32:03 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e524438sm1448808e87.46.2025.04.23.01.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:32:02 -0700 (PDT)
Date: Wed, 23 Apr 2025 11:32:01 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] oeqa selftest: read qemu options from
 TEST_RUNQEMUPARAMS
Message-ID: <aAilgRzbDCG6MFv_@nuoska>
References: <20250422144106.100804-1-mikko.rapeli@linaro.org>
 <D9DVEOE91D8S.3QLY2DBLUJHAA@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D9DVEOE91D8S.3QLY2DBLUJHAA@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 08:32:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215269

Hi,

On Wed, Apr 23, 2025 at 10:20:59AM +0200, Mathieu Dubois-Briand wrote:
> On Tue Apr 22, 2025 at 4:41 PM CEST, Mikko Rapeli via lists.openembedded.org wrote:
> > To support "slirp" userspace networking which works more easily
> > on various build machines, also without root and sudo rights
> > to setup loop interfaces.
> >
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> 
> Hi Mikko,
> 
> Thanks for your patch.
> 
> > diff --git a/meta/lib/oeqa/selftest/cases/uboot.py b/meta/lib/oeqa/selftest/cases/uboot.py
> > index 96da4efb06..de082fe266 100644
> > --- a/meta/lib/oeqa/selftest/cases/uboot.py
> > +++ b/meta/lib/oeqa/selftest/cases/uboot.py
> > @@ -33,7 +33,8 @@ QEMU_USE_KVM = "False"
> >  """)
> >          bitbake("virtual/bootloader core-image-minimal")
> >  
> > -        with runqemu('core-image-minimal', ssh=False, runqemuparams='nographic',
> > +        runqemu_params = get_bb_var('TEST_RUNQEMUPARAMS', "core-image-minimal") or ""
> 
> I believe you forgot to add import for get_bb_var:

Yes, that has gone missing somewhere (git stash save?). I'll add in v2.

Cheers,

-Mikko

