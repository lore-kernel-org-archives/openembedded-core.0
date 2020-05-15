Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.21164.1589570781731421509
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 12:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1E5E240AB5;
	Fri, 15 May 2020 19:26:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FzTGdXcyIM29; Fri, 15 May 2020 19:26:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D26E540A9E;
	Fri, 15 May 2020 19:26:16 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9B9A317314B; Fri, 15 May 2020 15:26:16 -0400 (EDT)
Date: Fri, 15 May 2020 15:26:16 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org, jdmason@kudzu.us,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [OE-core][PATCH 0/4] Import recipes from meta-python
Message-ID: <20200515192616.GF11927@denix.org>
References: <20200514210458.33543-1-JPEWhacker@gmail.com>
 <20200515185354.GE11927@denix.org>
 <591d657764bbea63ad2a2fa5cd0587cc305e600a.camel@linuxfoundation.org>
 <faff3240-ecfa-2f3a-4601-a7ad41952b99@gmail.com>
MIME-Version: 1.0
In-Reply-To: <faff3240-ecfa-2f3a-4601-a7ad41952b99@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 15, 2020 at 02:12:55PM -0500, Joshua Watt wrote:
> 
> On 5/15/20 2:05 PM, Richard Purdie wrote:
> >On Fri, 2020-05-15 at 14:53 -0400, Denys Dmytriyenko wrote:
> >>I see Richard has merged these to master-next, thanks!
> >>And thanks Joshua for volunteering to maintain these recipes :)
> >>I submitted removal patches to meta-python.
> >>
> >>So, it is good we are getting this extra dependency resolved in master. The
> >>question is - can we get these backported to dunfell, does it qualify?
> >>
> >>Otherwise Jon wanted to finally branch off meta-arm into dunfell today and
> >>we'll have to live with it until gatesgarth.
> >I put them into -next so we could test them, see if the autobuilder had
> >any surprises. Good news is there weren't any.
> >
> >The question still remains whether this is the best approach or not and
> >some people I talked to were not convinced that a consensus had been
> >reached.
> >
> >The question I guess is how widely used is optee and does it warrant
> >adding this? Its a little ironic the thing people want is trusted-
> >firmware...
> 
> FWIW, after having gone through the exercise of pulling in TF-A into
> qemuarm64, I think I've been convinced that op-tee and TF-A belong
> together since they are sometimes tightly integrated together
> (something I didn't realize before). As such, having both in the
> same layer makes sense. Even if TF-A was in oe-core, you'd probably
> want op-tee also, which means the python modules would have to be
> there anyway. I think we can still have the discussion about moving
> the whole lot over there, but we don't need to do that now, and
> moving the python recipes at least cuts out the meta-python
> dependency.
> 
> My last concern was testing of optee, since there was no platform
> that could build it by default,

Many TI platforms do. All our recent Aarch64 platforms (K3 family) use 
TF-A and OP-TEE by default and require them both to boot.

Even many of our Armv7 platforms use OP-TEE, but you'd need a special "secure" 
version of the platform, and those are not available to the broad-market.


> but I fixed that by implemented
> support for a qemuarm64-based machine that's defined in meta-arm
> which uses TF-A + optee + u-boot and can successful boot using TF-A
> and passes the op-tee unit tests, so I don't have any concern about
> that anymore.

That's great for testing meta-arm components w/o requiring any specialized 
platforms!

-- 
Denys
