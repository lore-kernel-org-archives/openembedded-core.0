Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web10.11843.1590672007700628869
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 06:20:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eqwk0jQV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id k26so3131459wmi.4
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2020 06:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=g0ATJSROX2ARyHJe2VZeMEOcsAuhk6Ik5ETWl4RoNUk=;
        b=eqwk0jQVuh3ln/7dRQ634Elt8pWoejhF21janFzNmqbETz+QO5I+VnczrUJQra8kev
         ZJ9u9365RolCUwDc7DKj1J0cCoA/lKPPJw7MXBEs9VID6I/rma3m/3Zkmi6WEvZfiDIm
         hL+aM9EqOsZ1Rj2sLfzJOLAW7sW1NrTTSq6e8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=g0ATJSROX2ARyHJe2VZeMEOcsAuhk6Ik5ETWl4RoNUk=;
        b=DFGOqYWXYu1czqJl/xFeMRo0D1zeK3/TNIdJs4ZcSTpqO3fpnCtHZpKwrjYic/bVLS
         v0tUYrt3AsOOzbYdICXrkBu49jPlO+0StfsaSPF2gwAjXlITfLjhqK4sv3PS94NzJeuR
         48y/lg5uSpU+Qw5iZQiCm0gO/wKhgTwLuwgiUZ+mBHFOou2zQkxuqF/PtmBuYnk1Lw/y
         MQ7sNeLFGIQN9AgQoZjiYPlalipQN65TGszmUSn/3oLpX/wFirypKjmloYEUP9nKvnK+
         WYZzGz4HuxnCxjHXsYDmBcrWPjvstUsFpLwCBmBM2AM+qAQlgR51yldsMGZehqDcwKwx
         Zklg==
X-Gm-Message-State: AOAM531srFTItBYVTQIb4rSwzhrObgUe6KTxRU1i+As6r8OMtBBMUug0
	vq1kaNzXEiM3oWK6HM0E2OBMBw==
X-Google-Smtp-Source: ABdhPJzAyiimsABvEwWB8h5l4iQPO6BQD3ldyx6/Uxi0DHkUxUI0/OLQzUw8O4mJHYar0lBCBZimrA==
X-Received: by 2002:a1c:dc44:: with SMTP id t65mr3623666wmg.128.1590672006167;
        Thu, 28 May 2020 06:20:06 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id d13sm6310826wmb.39.2020.05.28.06.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 06:20:04 -0700 (PDT)
Message-ID: <f8ee3144eaa92a32d6661f397d7042da9a7db46d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] linux-libc-headers: Check for asm/bpf_perf_event.h before multilibbing
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Thu, 28 May 2020 14:20:02 +0100
In-Reply-To: <20200527231145.GO17660@denix.org>
References: <20200527155011.3165976-1-raj.khem@gmail.com>
	 <20200527155957.GK17660@denix.org>
	 <765f3daeb6ce5f28c2d1e258dd303f5707363678.camel@linuxfoundation.org>
	 <20200527231145.GO17660@denix.org>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-05-27 at 19:11 -0400, Denys Dmytriyenko wrote:
> On Wed, May 27, 2020 at 10:25:31PM +0100, Richard Purdie wrote:
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
> I already explained my use-case with external toolchains - those
> usually come 
> with specific set of libc-headers. And when those don't match the
> list from 
> OE-Core, it causes problems, trying to support some resemblance of
> multilib. 
> I believe that got disabled completely now for external-toolchains
> anyway...

Right, external toolchains I can understand having specific version
requirements. What I don't really understand is external toolchains
would come with their own headers in most cases I can think of?

Cheers,

Richard


