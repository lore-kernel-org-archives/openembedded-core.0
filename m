Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.13181.1593004115443916422
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2020 06:08:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LbFZepTr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id l17so2276772wmj.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2020 06:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=YMQSosYam8CW3prOVBnulW3vQ7Ml8zIpA94XYAKtjN0=;
        b=LbFZepTr70D2wySXWg5+/LsRM20E+/yMh7Z3b39f8J8Oyzp909YZiYMdwF0zPdM+ok
         FbNCP1gp9mI0rxcRT/vcHZXMW1ZRP5UzEdlLtpnBsdfgv5R+XQqmAwfKg7evpfbzr10v
         ZeECWGRbkxktqP5yeOOt5hQKq8EnNiHXxlUEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=YMQSosYam8CW3prOVBnulW3vQ7Ml8zIpA94XYAKtjN0=;
        b=ipuEr8Vm7MjsthrOFl+vKyqLYzomIn8Z/hcN8/FD420h2VupeBp23adzd2jtXVQ3Vs
         UQK7cZmDvp4ImEeaAm05tTWxefsclM3OREqNhXIC1zQiqxoWjnbw9c4T+xbhWE4ljeXc
         WywfAwC9Fs74yuUskjXad3HMYdN8GrZaaG+0SY9TbB81rQ67Tcor75G6ZhL5I2Q1/WMF
         UU31AIVkL0xQShlJaAvuBVuUCGplWfhmjx59H4ZQ4g9zQmHaTnEGw/mGC2Kne4QrJ2yS
         onpaKVMW8uQIkuvU616OXLrMpj05vcZH/TFak5t93Osk+lh+QmbdpUZWVPOhMXePiBIa
         RZ+w==
X-Gm-Message-State: AOAM532ciyq8cUOXarsZWlwiuZ+rgWGIPGtzXMXOXYA6RKC5TKuYgezg
	u5fRkMhvoYe5d1cItOq4hwLQew==
X-Google-Smtp-Source: ABdhPJzIFqotJQ2gSc7XMs29glp2bHnpNLWosXcLntw0fz1tmnaQ1VMEUaNJq32350iLu1usTFXAww==
X-Received: by 2002:a1c:b143:: with SMTP id a64mr31402056wmf.133.1593004113691;
        Wed, 24 Jun 2020 06:08:33 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id v11sm9289616wmb.3.2020.06.24.06.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 06:08:32 -0700 (PDT)
Message-ID: <b456775facefdc593552db94bf2de51f5725aa97.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 1/1 v3] classes/kernel: Use a copy of image for kernel*.rpm if fs doesn't support symlinks
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Xu, Yanfei" <yanfei.xu@windriver.com>, Bruce Ashfield
	 <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Jun 2020 14:08:29 +0100
In-Reply-To: <7d7b57ca-5419-971d-6701-4cd2e8958960@windriver.com>
References: <20200619114727.40142-1-yanfei.xu@windriver.com>
	 <20200619114727.40142-2-yanfei.xu@windriver.com>
	 <CADkTA4NApB19MmwAWP3Mgtf+zNEtsPuSxL7h19S8c3FNoC2o4Q@mail.gmail.com>
	 <144b99d5a5b327d660925ff5ee18139d7dc088c3.camel@linuxfoundation.org>
	 <7d7b57ca-5419-971d-6701-4cd2e8958960@windriver.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-06-24 at 09:47 +0800, Xu, Yanfei wrote:
> 
> On 6/24/20 5:51 AM, Richard Purdie wrote:
> > On Tue, 2020-06-23 at 10:31 -0400, Bruce Ashfield wrote:
> > > On Fri, Jun 19, 2020 at 7:47 AM <yanfei.xu@windriver.com> wrote:
> > > > From: Yanfei Xu <yanfei.xu@windriver.com>
> > > > 
> > > > Some filesystems don't support symlink, then you will get
> > > > failure
> > > > when
> > > > you install or update the kernel rpm package. Now we use a copy
> > > > of
> > > > image for these filesystems instead of symlink.
> > > > 
> > > > Suggested-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > Suggested-by: Richard Purdie <
> > > > richard.purdie@linuxfoundation.org>
> > > > Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> > > > ---
> > > >   meta/classes/kernel.bbclass | 19 ++++++++++++++++---
> > > >   1 file changed, 16 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/meta/classes/kernel.bbclass
> > > > b/meta/classes/kernel.bbclass
> > > > index 20a0135fc9..1269b54343 100644
> > > > --- a/meta/classes/kernel.bbclass
> > > > +++ b/meta/classes/kernel.bbclass
> > > > @@ -94,6 +94,22 @@ python __anonymous () {
> > > >           d.appendVar('RDEPENDS_%s-image' % kname, ' %s-image-
> > > > %s' %
> > > > (kname, typelower))
> > > >           d.setVar('PKG_%s-image-%s' % (kname,typelower), '%s-
> > > > image-
> > > > %s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
> > > >           d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname,
> > > > typelower),
> > > > '1')
> > > > +        d.setVar('pkg_postinst_ontarget_%s-image-%s' %
> > > > (kname,typelower), """
> > > 
> > > You were previously concerned about boot issues if the
> > > unversioned
> > > image link/copy was deferred until boot. I don't see a summary of
> > > why
> > > that's no longer a concern in the v3 of the patch. Can you
> > > confirm
> > > that it isn't an issue ? Is it simply because the booted image
> > > isn't
> > > installed via this package, and hence we are fine ?
> > 
> > I'm suspecting this patch is why we're seeing selftest failures:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/1055
> > 
> Do you mean this patch has been applied? and introduce new issues?

Yes, I reverted it and retested and confirmed this patch causes the
selftest failure in the link to the build above.

Cheers,

Richard

