Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1634.1590621109384257904
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 16:11:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9890740C06;
	Wed, 27 May 2020 23:11:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kgAPMKL_8EaH; Wed, 27 May 2020 23:11:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7138C40A18;
	Wed, 27 May 2020 23:11:46 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C26C81731FF; Wed, 27 May 2020 19:11:45 -0400 (EDT)
Date: Wed, 27 May 2020 19:11:45 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] linux-libc-headers: Check for asm/bpf_perf_event.h before multilibbing
Message-ID: <20200527231145.GO17660@denix.org>
References: <20200527155011.3165976-1-raj.khem@gmail.com>
 <20200527155957.GK17660@denix.org>
 <765f3daeb6ce5f28c2d1e258dd303f5707363678.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <765f3daeb6ce5f28c2d1e258dd303f5707363678.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 27, 2020 at 10:25:31PM +0100, Richard Purdie wrote:
> On Wed, 2020-05-27 at 11:59 -0400, Denys Dmytriyenko wrote:
> > On Wed, May 27, 2020 at 08:50:11AM -0700, Khem Raj wrote:
> > > asm/bpf_perf_event.h does not exist in older kernels e.g. ( 4.1 )
> > > this helps in using common header across multiple versions of
> > > kernel
> > > going back
> > 
> > This check should have been there from the beginning and for every
> > header 
> > file. It's big PITA to sync this list up, especially when dealing
> > with 
> > different glibc or kernel than OE-Core, e.g. external toolchains,
> > etc.
> > 
> > Any objections to making this check more generic for every entry in
> > the list?
> 
> Yes, a strong objection. We don't want to support or encourage every
> kernel version out there. 
> 
> I also don't understand why people need to change the libc-headers
> anyway :(

Richard,

I already explained my use-case with external toolchains - those usually come 
with specific set of libc-headers. And when those don't match the list from 
OE-Core, it causes problems, trying to support some resemblance of multilib. 
I believe that got disabled completely now for external-toolchains anyway...

-- 
Denys
