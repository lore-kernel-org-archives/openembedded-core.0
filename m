Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16CD3C4708E
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 20:32:57 +0000 (UTC)
Received: from mail-49-r22.ipv4.per01.ds.network (mail-49-r22.ipv4.per01.ds.network [27.123.26.153])
 by mx.groups.io with SMTP id smtpd.web10.509.1672950769782419624
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jan 2023 12:32:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@softec.co.nz header.s=default header.b=fJtkAlyD;
 spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 27.123.26.153, mailfrom: bluelightning@bluelightning.org)
Received: from server-72-r70.ipv4.per01.ds.network (cp-fp06.syd02.ds.network [122.201.124.108])
	by halon-out01.au.ds.network (Halon) with ESMTPS
	id 796c1c49-8d38-11ed-a146-f8db88ea9a09;
	Fri, 06 Jan 2023 04:35:21 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=softec.co.nz; s=default; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ju3rSJfTp2qz3D5A5feM7QNLTe2SUnSRFbcYMgUv0aA=; b=fJtkAlyD7JXquqJuwrgWnMkTd1
	EGlpudE67blSv/bFXT5okkiYFalDxSU06nlgwngXYLUoQaZbMLswatSVAn/zwrcCW5AhTzWJD7WI+
	8IhvZ2HpaDsaxHsLGnlySYlUVNH3019tbMs8mN7FkdbtYX24++KfYpQQ4s7P0zVbl4vCwAFZbkDSY
	EabNE9wspxqJxTyaGalnTCF8I3eePdcfZpFeSlufvZMbATfR//iFgUI/rU0WeRMW5/Qmt7Y/zodBd
	8q9q0LjqSS3m5HPP1DcXpxWzDByutfi1tRStoDS31SU1mH0uWn5TxjdQ0AmOdFdfUXPLfN6E7dk5M
	me4coi4Q==;
Received: from [151.210.148.218] (port=18550 helo=linc.localnet)
	by cp-fp06.syd02.ds.network with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <bluelightning@bluelightning.org>)
	id 1pDWuq-0000iY-Bu;
	Fri, 06 Jan 2023 09:32:44 +1300
From: Paul Eggleton <bluelightning@bluelightning.org>
To: openembedded-core@lists.openembedded.org, Joshua Watt <jpewhacker@gmail.com>
Subject: create-spdx and sstate
Date: Fri, 06 Jan 2023 09:32:42 +1300
Message-ID: <4769387.GXAFRqVoOG@linc>
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
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 20:32:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175549

Hi Joshua / all

We've been having an issue with the create-spdx class if we share sstate 
between two configurations - one where gcc-cross-<arch> has a dependency and 
one where it doesn't (specifically, one where the abicheck class in meta-
binaryaudit is inherited and the other where it isn't; that influences 
DEPENDS). The result is that if you build the configuration with the dependency 
then the one where it doesn't (in separate build dirs with the same sstate 
cache), image_combine_spdx fails because it can't find the SPDX data file for 
the dependency as it was not built in the second configuration.

It seems that create-spdx looks at BB_TASKDEPDATA to get dependencies and then 
adds BB_TASKDEPDATA to vardepsexclude, thus the dependencies changing does not 
cause the task to be re-executed. However, I assume a variable dependency on 
BB_TASKDEPDATA might be impractical, thus why it was excluded in the first 
place. Do we instead add an explicit dependency on DEPENDS? I'm happy to come 
up with a patch if we can determine what the correct fix is.

(FWIW we're still using dunfell, but I don't see any changes in master that 
alter this particular behaviour.)

Thanks
Paul



