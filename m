Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B574C25B06
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 02:32:38 +0000 (UTC)
Received: from mail-61-r20.ipv4.per01.ds.network
 (mail-61-r20.ipv4.per01.ds.network [27.123.24.217])
 by mx.groups.io with SMTP id smtpd.web09.12228.1660530755475192058
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 19:32:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@softec.co.nz header.s=default
 header.b=lD8OmAR3;
 spf=none, err=permanent DNS error (domain: bluelightning.org,
 ip: 27.123.24.217, mailfrom: bluelightning@bluelightning.org)
Received: from server-72-r70.ipv4.per01.ds.network (cp-fp06.syd02.ds.network
 [122.201.124.108])
	by halon-out02.au.ds.network (Halon) with ESMTPS
	id 99969f7e-1c43-11ed-8380-f8bc1204ff90;
	Mon, 15 Aug 2022 10:40:18 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=softec.co.nz; s=default; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=B/4TKtMreuuntDYWtIMq8d8nOIX3lsK/BNyHzXD6UTI=; b=lD8OmAR3V+KLgAn01TzrIdlM+0
	xhBIVSpyREiMuNjjDphBvLeZGTZ09+inRukfSR7vga8TJhDiXGulncDn5cpRUXD7wCHG52LKbp2B5
	ayWfEX86vw2y7VLLhefe51coewnICS+cJKEr30B2B7sF40honhwr51votWvP0lCUL6FEmY1sEBdUg
	rBKOtmUce2EWAj9x+u4j6nM/CiBlqT9kfE5RkOQJGQI7eAVxbrj/U9DaJoS9iMmSOjAph3QGDbybw
	v18fI9H4/b8cwXeQa8WwYFm5iJIojDCmA/BkuPbF2A2jFwXyXhBR8n6+RhK0P16SNKadI5DTEo8WG
	H0vPFTmw==;
Received: from [151.210.146.222] (port=16012 helo=linc.localnet)
	by cp-fp06.syd02.ds.network with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <bluelightning@bluelightning.org>)
	id 1oNPu2-000693-8u;
	Mon, 15 Aug 2022 14:32:30 +1200
From: Paul Eggleton <bluelightning@bluelightning.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 03/10] zlib: Resolve CVE-2022-37434
Date: Mon, 15 Aug 2022 14:32:29 +1200
Message-ID: <2841280.e9J7NaK4W3@linc>
In-Reply-To: <20220814222037.283943-3-raj.khem@gmail.com>
References: <20220814222037.283943-1-raj.khem@gmail.com>
 <20220814222037.283943-3-raj.khem@gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 02:32:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169346

On Monday, 15 August 2022 10:20:30 NZST Khem Raj wrote:
> This is only seen in development branch as per [1]
> 
> [1]
> https://github.com/madler/zlib/commit/eff308af425b67093bab25f80f1ae950166be
> ce1#commitcomment-80753451 CVE: CVE-2022-37434

It's a little confusing, but I think that CVE-2022-37434 does affect existing 
zlib releases - at least the patch does apply. My reading was that the 
upstream comment was referring to the *fix* (and thus the additional segfault 
issue that it introduced) was not yet in any zlib release. A look around 
suggests Ubuntu is treating CVE-2022-37434 as needing to be fixed at least.

Cheers
Paul





