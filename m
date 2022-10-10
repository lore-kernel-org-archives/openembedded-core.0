Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C59EC433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 08:23:03 +0000 (UTC)
Received: from mail-61-r20.ipv4.per01.ds.network
 (mail-61-r20.ipv4.per01.ds.network [27.123.24.217])
 by mx.groups.io with SMTP id smtpd.web12.3915.1665390181303840646
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 01:23:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@softec.co.nz header.s=default
 header.b=A2DqfGii;
 spf=none, err=permanent DNS error (domain: bluelightning.org,
 ip: 27.123.24.217, mailfrom: bluelightning@bluelightning.org)
Received: from server-72-r70.ipv4.per01.ds.network (cp-fp06.syd02.ds.network
 [122.201.124.108])
	by halon-out02.au.ds.network (Halon) with ESMTPS
	id ad57bc47-4876-11ed-9ffa-f8bc1204ff90;
	Mon, 10 Oct 2022 16:36:47 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=softec.co.nz; s=default; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YjIf2KBhWQK/MaEydBYCYmlcO1bLg+iCP40jQYlC2EM=; b=A2DqfGiiF1or6KfqKK+Lw60ex+
	WYJhXlsi25EIDAl1p6/++9C3mZ7koDIXDUg9gH87pMPZHG6elkmoFE7ENUE9n3DCJrMHcphuH7qML
	6IgRFysXCai4LaN84Y9z2LjrLXAQHzEgzXRDSJc1cOYLQTr/eGXcbLgwviXyRkrZPcGGpjTOfr95y
	kCpKTvuvrM/uNRNA3+X9XJYUEqk8Uc1tfVNeQRyvvSU/Et5bKB9+qDZykzC2z05H9wYmJYPRL6WIT
	QQDHnlwSy6iX/tcWLKkQs1D48KxYg4xs1u8tsHoPQIH+eIatZpdm2p0/QIWqCCHmHZw2jCrsO/OO0
	lUf2uumQ==;
Received: from [151.210.143.155] (port=49180 helo=linc.localnet)
	by cp-fp06.syd02.ds.network with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <bluelightning@bluelightning.org>)
	id 1oho3s-0005ng-QK;
	Mon, 10 Oct 2022 21:22:56 +1300
From: Paul Eggleton <bluelightning@bluelightning.org>
To: Alexander Kanavin <alex@linutronix.de>,
 Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [RFC PATCH 0/6] (e)SDK workflow directly in a Yocto
 build
Date: Mon, 10 Oct 2022 21:22:52 +1300
Message-ID: <45013311.fMDQidcC6G@linc>
In-Reply-To: <20220622103312.1098389-1-alex@linutronix.de>
References: <20220622103312.1098389-1-alex@linutronix.de>
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
 <openembedded-core@lists.openembedded.org>; Mon, 10 Oct 2022 08:23:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171557

Hi Alex

On Wednesday, 22 June 2022 22:33:06 NZDT Alexander Kanavin wrote:
> There's been a recent discussion about how we can make the Yocto SDK
> experience better [1]. One of the ideas was to eliminate the SDK
> as a separate artefact altogether and simply provide everything
> that the SDK and eSDKs do directly in a yocto build. This does not
> mean that people have to 'learn Yocto', but rather that the integrators
> should provide a well-functioning sstate cache infrastructure (same as
> with minimal eSDK, really), and a few wrapper scripts for setting up the
> build and the SDK environment that run layer setup and bitbake behind the
> scenes.

FWIW I think this is quite clever - well done :)

One question though:

> 2. Run:
> $ bitbake meta-ide-support
> $ bitbake -c populate_sysroot gtk+3
> (or any other target or native item that the application developer would
> need) 
> $ bitbake populate-sysroots

Should this have been "build-sysroots"? "populate-sysroots" doesn't seem to be 
a valid target. It looks like this is in the SDK manual as well.

Cheers
Paul




