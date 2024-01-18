Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 267F7C47422
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 12:58:35 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.10754.1705582707398306800
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 04:58:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=runjHQvs;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=B9LMCT3XJ3QfVwuu6svVrpUl9q0pfHiiNupWQFy5QU0=; b=runjHQvsqbDiT6/QqUMp6sU30Z
	MppII9x7KVDEAX6PEpkUPOw0ILsD9q5YWROT4jsBC3UM7WuP+4goPitdljin6hn9ab4L9RN4GMnIC
	La2sgjNvD27V0sCbObUIjnzNUH6N7hfKbrseF2BFHYV4ghy/Xwh1cvdS/heQsUDDy46VPE14eJnd/
	C/zp6aK+P3DvBje8Z9Xrf1K/UjrvTh+CcnzRdRPMTBt92ucx1cYATK3PVJqtgIJIZvFp9f5nVuxUg
	SxxYJ17Y7nWpI/j8zs9nG3Ur76WbahAgRzEAe+hjfuZUfnZwckywwmMmGrHmcsyO2Iz/J6FYhdRa8
	qg7DhMtg==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:49982 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1rQRyR-00GZu0-2i
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Jan 2024 07:58:25 -0500
Date: Thu, 18 Jan 2024 07:58:18 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: want to confirm i'm using "externalsrc" and "bin_package"
 efficiently
Message-ID: <dfcf7a4a-81b1-ff26-d14-923bf379025@crashcourse.ca>
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
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 12:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193977


  i'm pretty sure i know how to do this, just want to know if there's
an even easier/more elegant way.

  in current project, there is a *pile* of local content that is
identified by various recipes. so since that content is local, the
obvious starting point is for such recipes to "inherit externalsrc" to
properly identify the local source directory.

  in addition, many of those recipes represent packaging binary data
(imagine firmware files), so that there is really no meaningful
configure or compile tasks, so that further suggests inheriting
"bin_package" as well.

  finally, in some cases, there is a teeny bit of tweaking that might
be needed for the final installed content, which suggests adding:

  do_install:append()

to the mix to handle whatever little adjustments are needed.

  so given that scenario, can i reasonably summarize the right
approach as:

  inherit externalsrc
  inherit bin_package
  do_install:append()		[as needed]

finally, it doesn't seem like many of those recipes are required as
build-time dependencies, so i can just make them either RDEPENDS as
appropriate, or just IMAGE_INSTALL them for the final image.

  sound reasonable? am i overthinking this? seems fairly
straightforward.

rday

