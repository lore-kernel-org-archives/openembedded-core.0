Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F8CEC433FE
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 20:21:40 +0000 (UTC)
Received: from mail-49-r22.ipv4.per01.ds.network (mail-49-r22.ipv4.per01.ds.network [27.123.26.153])
 by mx.groups.io with SMTP id smtpd.web11.837.1668111691119049636
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 12:21:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@softec.co.nz header.s=default header.b=ZiEt6TPP;
 spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 27.123.26.153, mailfrom: bluelightning@bluelightning.org)
Received: from server-72-r70.ipv4.per01.ds.network (cp-fp06.syd02.ds.network [122.201.124.108])
	by halon-out01.au.ds.network (Halon) with ESMTPS
	id ebb7c1dd-6135-11ed-a146-f8db88ea9a09;
	Fri, 11 Nov 2022 04:26:13 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=softec.co.nz; s=default; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LeVSdPyg8Kp7TLxbdPSvT+kmc1Qa9leRivC0EICgrYE=; b=ZiEt6TPPrJxtZq7tEjrYvwZ5eC
	5OE57KUPjELwk1jmk3CX8WerhpQFjfU6AETSluRWMWZiBOu4671mWCwiHcNPZGEt0DibCjMDxrgKL
	9HGR4mbQf1qVQQemvnvFeAdoqKTfg5IKFtKNVaW5CIz1pJUhd/BkE81ZZxoaay3fOLzokGC7MtDlD
	CcdunBV7nrSTcGnikS/h/o3jkCtyn+UyVis8rwXY/XE962gcXdnQukBKzIHOM5L17jBvguqga1Kiy
	q8AU3HfDxbbf/6oXwJAntwFzfRN8t9x3OwuuhAoqv40YzM0lGcXTUYjGrCLTph9WSuC30t1HTw+z5
	1qgEO6Yg==;
Received: from [151.210.143.155] (port=56158 helo=linc.localnet)
	by cp-fp06.syd02.ds.network with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <bluelightning@bluelightning.org>)
	id 1otE3B-0004KV-NB;
	Fri, 11 Nov 2022 09:21:25 +1300
From: Paul Eggleton <bluelightning@bluelightning.org>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Ming Liu <liu.ming50@gmail.com>, Marek Vasut <marex@denx.de>, Andrej Valek <andrej.valek@siemens.com>, Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>, Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>, Sean Anderson <sean.anderson@seco.com>, George McCollister <george.mccollister@gmail.com>
Subject: Re: [OE-core] [RFC] [PATCH] Allow fitimage + initramfs rebuild to be accelerated
Date: Fri, 11 Nov 2022 09:21:24 +1300
Message-ID: <3463540.iIbC2pHGDl@linc>
In-Reply-To: <CA+chaQdrSSoXccVRyWHNm=pX9jFV_SN-ucmBovu-=g_Y0FMNbw@mail.gmail.com>
References: <1667435031-7224-1-git-send-email-paul.eggleton@linux.microsoft.com> <7449258.EvYhyI6sBW@linc> <CA+chaQdrSSoXccVRyWHNm=pX9jFV_SN-ucmBovu-=g_Y0FMNbw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp-fp06.syd02.ds.network
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - bluelightning.org
X-Get-Message-Sender-Via: cp-fp06.syd02.ds.network: authenticated_id: paul@softec.co.nz
X-Authenticated-Sender: cp-fp06.syd02.ds.network: paul@softec.co.nz
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 20:21:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173103

On Thursday, 10 November 2022 08:53:02 NZDT Martin Jansa wrote:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=12937 might be
> alternative solution which we at LGE were using for different usecase than
> fit image, but in theory should work as well.
> 
> Basically the initramfs do_deploy could be without version and then the
> hardlink with datetime (or any other version) is created in fast
> do_deploy_links task.

Unless I've missed something I don't think this can help - in our case the 
content of the initramfs is changing, not just the filename due to the version.

Cheers
Paul




