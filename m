Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B51FCD98F6
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 14:34:30 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21044.1781793263554138059
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 07:34:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=fl9c7kZo;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MJ3irq3K/5/EyRAeQRmxhrDVblRgdyDmug8jCoYB148=; b=fl9c7kZodo5T9SdtCSN1wpgF/L
	oS0xqOXljcr/f2NsA7sjtwVZ9k2U+Lbykd6tiDzIdZSynfEpK4scJu17zXg2aVeKqtoFECd2YCfqF
	rTrlIg7zmd7yawwGD/Jy21VQHW2lgbBBjcQx8JD0f0YWM+7mB3QlrP6IIPL4I+xn8rSwLKE4QCHBX
	6YX0Gx1GKddXyQRGNPuDCPLPWQ6pyb+th3pG4/Nw7WP5FyXdJ5p/ZnuoZ7e7kUzmFhFO+/3W/Gn+B
	I+WavsfqFzZKhw3eO5MfBvjqjn0DoukItgy8xxTx8QfK3K71IvDbpSKosiKQrQFD5KwYJ7dU5DS34
	8tJx7kPg==;
Received: from pool-174-114-114-5.cpe.net.cable.rogers.com ([174.114.114.5]:53992 helo=trixie)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1waDoy-00000000PUb-36yD
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Jun 2026 10:34:22 -0400
Date: Thu, 18 Jun 2026 10:34:12 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: fetching linux-yocto source never completes
Message-ID: <cee954a2-1b01-2962-c209-a5fe7e6a7fc0@crashcourse.ca>
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
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 14:34:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239085


  recently, i've been having a strange error when setting up for a new
build and running "bitbake --runall=fetch core-image-minimal" just to
preload all of the source. all of the source is eventually fetched,
except for linux-yocto, which even after that remaining source is
fetched insists it's 100% done:

  0: linux-yocto-6.18.35+git-r0 do_fetch - 13m24s (pid 846142)
     100% |##############################|

i can leave it running for several minutes and it just sits there at
100% without returning. checking downloads, it seems like the kernel
source is fully there.

  the same thing happens if i clean and fetch just the kernel source:

  $ bitbake -c cleanall linux-yocto
  $ bitbake -c fetch linux-yocto

the fetching seems to have completed but, again, the fetch task never
returns.

  however, if i break out and try to "build* the kernel:

  $ bitbake linux-yocto

i can see linux-yocto being unpacked just fine. so the source seems to
have been fetched correctly, but just for the kernel, the fetch
command never returns. this has happened several times in the last few
days only, and it seems completely reproducible.

rday

p.s. i've configured a local source mirror so that all fetched source
is packed into tarballs for later, but that's worked fine for me for
years. i'm puzzled.

