Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F05A8D2ECF7
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 13:36:35 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6445.1768916191582807224
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 05:36:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=sQok17Q6;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=XL0nI0VH43y+zWiWMKV73wDzfE0zE8T6HrtZeOemocg=; b=sQok17Q6rUWhYWElZjj/1KwTnr
	++KRgOyeyWuMiZRHVuDMVucK7cPlV6FU//vdD77dOJ1vtiL9gUamD1qPk4CYyw7vQ2yXqI/khxMKF
	XLt2/9AwoXB4qzJaA9oUlqnqXz5BL+Iq4b5IhNTP40GKd4qHmkm/CF11QtHFbxHhKqorO3Q5bSSbT
	+zL1xRGnOpIUIBgYS80GP4D69raXG07jv2yOjb1FeVI4WHh5X+jj4iXEThKaCNhtnimSWuY+2Y9Qc
	VVyk215bUYxpanjxD7IE+tN0k+wFyg517jFB6+uBx6lfsOEgb7poYBNsvwW3/cBHG5lP+k2dYd5iM
	39zPAWsw==;
Received: from [147.129.179.166] (port=40608 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1viBuH-00000009hvD-33Bt
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Jan 2026 08:36:30 -0500
Date: Tue, 20 Jan 2026 08:37:00 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: should a vendor layer override the base "u-boot" recipe?
Message-ID: <b0c4382a-24aa-d421-c4b3-6b30e4309cfd@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 13:36:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229705


  sort of a policy question but i'm working with a vendor layer from
STMicroelectronics ("ST"), and that layer provides ST's version of
u-boot -- a recipe named "u-boot-stm32mp". fair enough, and they also
have an include file that makes that recipe the preferred provider:

  PREFERRED_PROVIDER_virtual/bootloader ??= "u-boot-stm32mp"

so, ideally, someone would not define their recipes to refer to u-boot
explicitly, but to virtual/bootloader.

  but i decided to build the "base" (OE) u-boot recipe just as a
baseline, and ran:

  $ bitbake u-boot

and was surprised that nothing further was done, and i noticed that it
tried to build ST's recipe, and then i noticed this:

  PREFERRED_PROVIDER_u-boot ??= "u-boot-stm32mp"

is that normal behaviour from a vendor? does that not mean i can't
even try to build OE's version of u-boot because ST's setting above
will hijack the recipe name?

  is this considered normal vendor behaviour?

rday

