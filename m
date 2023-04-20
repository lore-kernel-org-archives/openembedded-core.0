Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53DDBC77B73
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 04:59:46 +0000 (UTC)
Received: from mail-49-r22.ipv4.per01.ds.network (mail-49-r22.ipv4.per01.ds.network [27.123.26.153])
 by mx.groups.io with SMTP id smtpd.web10.1237.1681966783627372469
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Apr 2023 21:59:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@softec.co.nz header.s=default header.b=LcCm3NS9;
 spf=none, err=permanent DNS error (domain: bluelightning.org, ip: 27.123.26.153, mailfrom: bluelightning@bluelightning.org)
Received: from server-72-r70.ipv4.per01.ds.network (cp-fp06.syd02.ds.network [122.201.124.108])
	by halon-out01.au.ds.network (Halon) with ESMTPS
	id 3c5fcd70-df38-11ed-a07e-f8bc12f6d67f;
	Thu, 20 Apr 2023 13:00:14 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=softec.co.nz; s=default; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=g/cWAFYChmv3Wd3AdSqFr+c4fTrTLNaVg+S+B3eiBcs=; b=LcCm3NS9kGk3SW/21O3ZGCNDc4
	TU9ctNuTvPPPdt2r7HxxYf7YDsy1gtpskvTBCw8F9/AYbic6urcwQjq7ENMnFg2jpQlV1A9yryQHJ
	tpryU+c9sd/7UNF6gKKd9QJm6lh/jDGNs7iaGyhuwYvkjpGnbthHzgN+iyh9TP0Y+w5oqvPUXcFuz
	P3FQedkwn9bXBdHS45QoBYufhMefsJIFlikLKQoObfphwunZXC2gSJkCLZcyYyF7ndcQ8yxPDHO6V
	SPvp/2tg5Q5Df0wero1VDuXNqdFezCrq9nWXjMiUpmg3yUVOnmmkAv1HIjk9osqyN7fuXWlriPovz
	Dj3G2dnA==;
Received: from [161.29.131.251] (port=7394 helo=linc.localnet)
	by cp-fp06.syd02.ds.network with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <bluelightning@bluelightning.org>)
	id 1ppMOR-00AMmA-5B;
	Thu, 20 Apr 2023 16:59:39 +1200
From: Paul Eggleton <bluelightning@bluelightning.org>
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCHv3] python3-manifest.json: Fix re in core
Date: Thu, 20 Apr 2023 16:59:37 +1200
Message-ID: <2427094.jE0xQCEvom@linc>
In-Reply-To: <20221103122755.3818894-1-leon.anavi@konsulko.com>
References: <20221103122755.3818894-1-leon.anavi@konsulko.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 04:59:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180234

Hi Leon

On Friday, 4 November 2022 01:27:55 NZST Leon Anavi wrote:
> Following the update from 3.10.6 to 3.11.0, the source code of
> module re for regular expression operations has been moved to
> Lib/re/. File python3-manifest.json has been modified according
> to the new path.
> 
> According to the instructions the new python3-manifest.json
> version was created by running bitbake python3 -c create_manifest.
> Because of this it also updated other files and rdepends in it.

Maybe you're already aware, but just in case not, this patch appears to have
effectively undone the change you made earlier ("Move urllib to netclient"):

  https://git.openembedded.org/openembedded-core/commit/?id=e74ab2c144042b0a9f788b1b15f11b2800e2c7a1

Cheers
Paul



