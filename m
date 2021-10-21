Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC06C433EF
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 01:14:49 +0000 (UTC)
Received: from mail-61-r20.ipv4.per01.ds.network
 (mail-61-r20.ipv4.per01.ds.network [27.123.24.217])
 by mx.groups.io with SMTP id smtpd.web11.3293.1634778886739504325
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Oct 2021 18:14:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@softec.co.nz header.s=default
 header.b=Tcg7GdyX;
 spf=none, err=permanent DNS error (domain: bluelightning.org,
 ip: 27.123.24.217, mailfrom: bluelightning@bluelightning.org)
Received: from server-72-r70.ipv4.per01.ds.network (cp-fp06.syd02.ds.network
 [122.201.124.108])
	by halon-out02.au.ds.network (Halon) with ESMTPS
	id 32113ab3-320c-11ec-bc81-f8bc1204ff90;
	Thu, 21 Oct 2021 09:14:10 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=softec.co.nz; s=default; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=juAKTOoJqsZ8xj0yyu9gumfdlG0TXWpglesD+qOrYms=; b=Tcg7GdyXgDrhXlnOHleidKct/W
	X3zZIu25tVVsViJpbVm7PFCTHm+HcWyQMqvz2Y/Co9rWUAoEFOCPbdTzrZAcHb/OOmFW7dbr1gFMb
	8yie/j7z2GdUEM8bEYQghTah1bVFfjJ7I/pBrFA9kmbbBFxofBtPZx/OD9iCc/fwa2m2pfTsz7n/P
	vcdhLB92RJPEcygOIXSMz5LgOXPDwgMCH/My2wExlXLp+TttebDa9HSXcyK6hvdu7hluD2vdh0XeL
	Eg6dp7KMB/SabOUoT6UvF+NAGeoqz1BsfYXIsg3yflO3IIv1mIACQRz2iwdCsjnGti41pd7PVElK1
	SMVCyxtw==;
Received: from [151.210.149.31] (port=34272 helo=linc.localnet)
	by cp-fp06.syd02.ds.network with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <bluelightning@bluelightning.org>)
	id 1mdMfG-007w2f-VA; Thu, 21 Oct 2021 12:14:39 +1100
From: Paul Eggleton <bluelightning@bluelightning.org>
To: Jon Mason <jon.mason@arm.com>
Cc: openembedded-core@lists.openembedded.org,
 Alexander Kanavin <alex.kanavin@gmail.com>
Subject: Re: [OE-core] [PATCH 18/65] u-boot: upgrade 2021.07 -> 2021.10
Date: Thu, 21 Oct 2021 14:14:37 +1300
Message-ID: <4686739.31r3eYUQgx@linc>
In-Reply-To: <20211019153419.3319802-18-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
 <20211019153419.3319802-18-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp-fp06.syd02.ds.network
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - bluelightning.org
X-Get-Message-Sender-Via: cp-fp06.syd02.ds.network: authenticated_id:
 paul@softec.co.nz
X-Authenticated-Sender: cp-fp06.syd02.ds.network: paul@softec.co.nz
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Oct 2021 01:14:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157270

On Wednesday, 20 October 2021 04:33:32 NZDT Alexander Kanavin wrote:
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...ls-image-host-fix-wrong-return-value.patch | 41 -------------------
>  meta/recipes-bsp/u-boot/u-boot-common.inc     |  2 +-
>  .../u-boot/u-boot-tools_2021.07.bb            |  4 --
>  .../u-boot/u-boot-tools_2021.10.bb            |  2 +
>  .../{u-boot_2021.07.bb => u-boot_2021.10.bb}  |  1 +

Not sure what the official protocol for this kind of thing is, but meta-arm will 
naturally need an update for this (as seen via autobuilder warnings).

Cheers
Paul



