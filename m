Return-Path: <francesco@valla.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2334A10BA455
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 09:02:42 +0000 (UTC)
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.3])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68763.1774602159766628307
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 02:02:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@antispam.mailspamprotection.com header.s=default header.b=Aw3QGRKZ;
 dkim=pass header.i=@valla.it header.s=default header.b=n2Nw0cdt;
 spf=pass (domain: valla.it, ip: 185.56.87.3, mailfrom: francesco@valla.it)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-qqkz.prod.antispam.mailspamprotection.com; s=arckey; t=1774602160;
	 b=sMeQ71kSykzsxXqC5I5zWhac+7fIm40w0tm8RwBm2mTh+u6xAwB7WPc7RXOpXXhck0iC4qh7DO
	  f80qMtMvFi2x/+yBdT/NeNUkKZyWc07NLttIURixeESjXTEbKXCrln9v7HHeBBw6MxiVv8ckyE
	  Gw428ObsXPxJ584pRkKQ/SWAGNdMDuhdW+59AZnr0gIQFbhEZ+4nWHF/epnlaQlou6N5aKQJM9
	  0XOwVoRvvd9qZO3qPc/L2CRCVd1C976kjsCHy+9PtQwYYf4eKIG6e4UCzP1jVgdAKIiPnZhrFl
	  034z6fUXWpSACN0ttsq1e0g/9GorplcrCbgY9YiKWvPNYQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-qqkz.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-qqkz.prod.antispam.mailspamprotection.com; s=arckey; t=1774602160;
	bh=UK50j3gIJL/5Y4cFf6wnrg1rF432CtBlqLu4j0pEvg8=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=T8gJ38PeBQwDxMZ8SC52jMzNivqDEN7nNYbs7MAoZlK3dfzkC+pBkr8lsFjYH7jXvqQovJsqsS
	  rnCVPsZfxyUuh7O89/LFp83dnF+g/f+a33LfCMalyLa/6ksIoWW9kt96jmAWsukbdUXOpGjvA/
	  E1GVXZf2NcXEfGO/Zn8fMbi7/Jq25/0mpXJkQNNDxZBSECJGHzejPXqss0A/PPianBXP83v1Bu
	  Y/YT03ZDSVOQlU7J7yat7GE2B+Imog4J+WMnWZl97xmHwIoKbNZ0GQlW+mI64GdUgngheghVUJ
	  10cXhNvDO39MnPqimPaJfTT7TqmG9OF/sQVhe4m9G7wNXw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=Vn8d6PkCXecz6s8GW5WVxRDOtHH/nvvxoL6I0sNuetg=; b=Aw3QGRKZKwBOjL4YYB1uF0U4/Q
	x+OCzdAzKX1EOKKWDypO0ITuMsNUFfwwHGBufpzNt0MsPWiQh6LbVrZh4gAsouL1UZk6RtcpYTFfO
	49chh1PnvuBZy2adm0XOyZrB2HHTxrPUdkQfEKAD5n64tcqDTV81HU7ZoE/QP4q3s0jY=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-qqkz.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1w635M-00000001F6M-1dOv
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Mar 2026 09:02:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=Vn8d6PkCXecz6s8GW5WVxRDOtHH/nvvxoL6I0sNuetg=; b=n2Nw0cdtLicJL819x3FegDP+9G
	DaD1dWwM4FbcIN26t+P2X5O0TPblsfZ+DlFPYrjEL4O+NaZ6N3K5vO/fSePoBzo1fUWcVjSQXANPu
	6lObIhy2TjuyHNCJYBqU1ive8Ye2nmVt2OvLht2d0HDd1E8Ncw/O1elg0vfq8wQC04jo=;
Received: from [95.248.129.24] (port=59821 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <francesco@valla.it>)
	id 1w635H-00000000KAB-03Qb;
	Fri, 27 Mar 2026 09:02:27 +0000
Date: Fri, 27 Mar 2026 10:02:25 +0100
From: Francesco Valla <francesco@valla.it>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: Trevor Gamblin <tgamblin@baylibre.com>, 
	openembedded-core@lists.openembedded.org, Adrian Freihofer <adrian.freihofer@siemens.com>, 
	Marek Vasut <marek.vasut@mailbox.org>, Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: Re: [OE-core] [PATCH v2] kernel-fit-image: support arbitrary
 loadables
Message-ID: <acZGz-B14OB7ugyL@bywater>
References: <20260301-fit_loadables-v2-1-2cf4cdf36a91@valla.it>
 <896a5439-cafb-41c7-b770-0d328cb5bf8b@baylibre.com>
 <e3b71012-6f22-4d8b-82d3-6dfefc947a7d@valla.it>
 <DHDFDB6KCDMU.LLC8N7SBMK6H@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DHDFDB6KCDMU.LLC8N7SBMK6H@bootlin.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: fa0658b688c1d984611c92cbd139fde9
X-AntiAbuse: ID - fa0658b688c1d984611c92cbd139fde9
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1w635M-00000001F6M-1dOv-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-qqkz.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 09:02:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234072

Hi Antonin,

On Fri, Mar 27, 2026 at 09:34:42AM +0100, Antonin Godard wrote:
> Hi,
> 
> On Tue Mar 3, 2026 at 9:30 PM CET, Francesco Valla via lists.openembedded.org wrote:
> [...]
> >> Thanks for submitting this. LGTM, but it'd be nice to have it 
> >> documented as well.
> >>
> >> Could you add some details to the Yocto Project docs (e.g. in the 
> >> "Variables Glossary" section) and submit it to 
> >> docs@lists.yoctoproject.org?
> >
> > Yes, documentation here is pretty much necessary to understand how this 
> > shall be used.
> > I'll work on it as soon as possible.
> 
> Did you manage to come up with some documentation for this? I am catching up
> with the latest changes from OE-Core and this appears to be missing.
> 

Uhm, I sent it twice to the list actually, without any reply. But... it
just occurred to me that I'm not subscribed to that list, so maybe my
message was droppe without notice?

I'll subscribe and resend in a couple of hours. Apologies.

> As a starting point, we'd need documentation for the following variable in
> https://git.yoctoproject.org/yocto-docs/tree/documentation/ref-manual/variables.rst:
> 
> FIT_LOADABLES
> FIT_LOADABLE_FILENAME
> FIT_LOADABLE_TYPE
> FIT_LOADABLE_ARCH
> FIT_LOADABLE_OS
> FIT_LOADABLE_LOADADDRESS
> 
> And an update to the class' documentation here:
> https://git.yoctoproject.org/yocto-docs/tree/documentation/ref-manual/classes.rst?id=5bfe4f9aecf542766dec727bedbb30b1f93ab64a#n1419
> 
> I think the key point is to show how these variables are translated into the fit
> node. I think an example in the class documentation would be great for that.
> 
> These should be sent to docs@lists.yoctoproject.org.
> 
> Let me know if I can be of any help.
> 
> Thanks!
> Antonin

Regards,
Francesco


