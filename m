Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.175.1590616238116998556
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 14:50:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fgn4LUvc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id f5so1114069wmh.2
        for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2020 14:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=3yfxXhUCYDa54jyh8hQkvYWjxNF6U5UnayBz1TNh38U=;
        b=fgn4LUvcoFmTVZqyvSnKefDnSqTwCF+sskq0jDvlwN+x4B/21mE7hM5evceZV6dW/Z
         klsSl/Em/xRiz1gmpiUZuEwiTQVTT/mwUVcgxJ80Vx7S8HzIOE/rV+LH8RkbDDLJd0o6
         oajQrI6wFagM494JXguELryE0zG6op1d/xv9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=3yfxXhUCYDa54jyh8hQkvYWjxNF6U5UnayBz1TNh38U=;
        b=Pg5zVX+IOyMB0ztFI9EVdU8D454EUkf7XmVzRmeV5pGxy+xhk7o2v8rAOxrBY+Ij0B
         S21oGeBjocafkFLe//HgDseUtdoucR1lTk7jbOjjIa/RPiVQCcuxFvDdK4+aorgyYB6d
         K45ciTqfrI10HwwzJaGJByCG/rLzmlKvf4l7LhQljBvZt95cgoIZ/whnxSpjlxNn7+SZ
         F6b6GsC+JaRzcMrrPHiMcUq0yMyEEL98ioIV4UvWIFRKl9kz11uAlgT2VbjCTggRrGoK
         JoiUSnDB520enN71JwoA8Hp/Mh8KISydo3v5wnAvWIotMTiY04bTWXODgGFkWuyTNSmj
         8/hA==
X-Gm-Message-State: AOAM530+7eWVHXJdD34b4i+DrNp0Oa8Te7NcLFfPHkgutyGZWKJJLMf8
	WPmVTH3soeiqD75D9kx9exvL3g==
X-Google-Smtp-Source: ABdhPJx+GczEzu5TR0oUXa+ngD6F1DjFzwzw5upDBAC35jzGmze07aYpOzMhpVRr4z3VbFNRzXjjjw==
X-Received: by 2002:a1c:e355:: with SMTP id a82mr157951wmh.1.1590616236595;
        Wed, 27 May 2020 14:50:36 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id x186sm4429588wmg.8.2020.05.27.14.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 14:50:36 -0700 (PDT)
Message-ID: <e7499cfd64b6b5a51112ee4a3a914ed9b0eeb6e8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] linux-libc-headers: Check for asm/bpf_perf_event.h before multilibbing
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Denys Dmytriyenko <denis@denix.org>, Patches and discussions about the
	oe-core layer <openembedded-core@lists.openembedded.org>
Date: Wed, 27 May 2020 22:50:32 +0100
In-Reply-To: <CAMKF1spMw=6ZfkBWy3=+rSiHknxLvVC6uPH3Q8z_UiGdOECVdw@mail.gmail.com>
References: <20200527155011.3165976-1-raj.khem@gmail.com>
	 <20200527155957.GK17660@denix.org>
	 <765f3daeb6ce5f28c2d1e258dd303f5707363678.camel@linuxfoundation.org>
	 <CAMKF1spMw=6ZfkBWy3=+rSiHknxLvVC6uPH3Q8z_UiGdOECVdw@mail.gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-05-27 at 14:46 -0700, Khem Raj wrote:
> On Wed, May 27, 2020 at 2:25 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Wed, 2020-05-27 at 11:59 -0400, Denys Dmytriyenko wrote:
> > > On Wed, May 27, 2020 at 08:50:11AM -0700, Khem Raj wrote:
> > > > asm/bpf_perf_event.h does not exist in older kernels e.g. ( 4.1
> > > > )
> > > > this helps in using common header across multiple versions of
> > > > kernel
> > > > going back
> > > 
> > > This check should have been there from the beginning and for
> > > every
> > > header
> > > file. It's big PITA to sync this list up, especially when dealing
> > > with
> > > different glibc or kernel than OE-Core, e.g. external toolchains,
> > > etc.
> > > 
> > > Any objections to making this check more generic for every entry
> > > in
> > > the list?
> > 
> > Yes, a strong objection. We don't want to support or encourage
> > every
> > kernel version out there.
> > 
> > I also don't understand why people need to change the libc-headers
> > anyway :(
> 
> building products doesn't mean you are on the latest kernels sadly,
> that's just the reality of world
> and building userspace against way newer kernel-headers with older
> kernel underneath has unintended consequences. 

Its not supposed to have any consequences, the kernel UAPI is supposed
to be backwards compatible. Have you examples where things were broken?

> So its always better to use matching UAPIs to the kernel
> version to avoid these mismatches

This should not be necessary and its actually really bad it it means a
totally different userspace for every target :(

Cheers,

Richard

