Return-Path: <francesco@valla.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C92FD0075
	for <webhook@archiver.kernel.org>; Sun,  1 Mar 2026 19:32:08 +0000 (UTC)
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.10])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.144746.1772393520914709357
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 11:32:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@antispam.mailspamprotection.com header.s=default header.b=xg/MxjMc;
 dkim=pass header.i=@valla.it header.s=default header.b=vGpalEGM;
 spf=pass (domain: valla.it, ip: 185.56.87.10, mailfrom: francesco@valla.it)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-m8mp.prod.antispam.mailspamprotection.com; s=arckey; t=1772393521;
	 b=iLsIoB58Qieyp1nJKLzPzc9THgEvWQu8VnKMF8i0Q2q7a1db4aoU7Tyc2uxo2Kkj2jsQgOX96H
	  YCknqJRGrnKoxkJU9IN/fidygq0nO3ClUt9PJ4lsEIS/8sFPcCiKsE5njrKevrNyz9mNnXApv/
	  x4snvIbC2XsEHbJaOCxf8NWKx5GWX66uy2ljMW8vsVN0/7SpL7/r+ipze9mEtHGn3HAqGqC1oG
	  4eM/SDLhg9NFx4sytLm72vNsXMbh4EoL7XcD/akTvZOLzgfGILo1M14g9HLiMzG7CNci/wlJ7N
	  KTl3K6lKX8fVV99Vl3KptU0j9fIUhZkv82aXgoBgoeUQKw==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-m8mp.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-m8mp.prod.antispam.mailspamprotection.com; s=arckey; t=1772393521;
	bh=cjnTvA0GuB5B9me4Z6ASIIWGcsHxJfWMVu5Zbn+Yyc8=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=SIX1m3oINyftnXmYm7OuX1f8HJPnj1D/Q7F9c7j2tPYeKNK63e+II1+S2QmZpmEnL1VxKvfGjy
	  nsdnCVTvx+Nfje3z3S94mIzPyvOsa9g1piqnl9o4tk1iQn5uXRVf96SmBcboj2npIlU8fkFDA3
	  VU1Q3HgjxZorLS8x94fHD2Yd+GAgnIKcx654u+Cr/7pAiWdON7cw2TBTtRyp87pTm3ZBOtbLxt
	  5z4wHMWkdUTV9SQ2y5L6K2rk/p1zjnQuBF59RzDA2CIy/+nwdnsZqvT8kR8cHK0WmoUnaPxlQW
	  McI69ILTdSz4+5wLbIHflPHRMNASeipmNIjFl4/JnpZj/g==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=7kr4nT8Y8jQM9wOwcohDXXtd1jP5owkRrt4UwVpDcBo=; b=xg/MxjMcOa8WPk3RsHOwgsO81m
	Zua3ryzmrhEsE6dVcxQ6MMJNteuJTbpBULYWK0/oy18ovhcsJN5U0g/WczKRIg8AS7y2lP03729Au
	X1q1tr5qEkJcak69//NduzNMBWAuKBDO/Y7v9W1mxmOVuCJ1s/+bNYYe3EAhbCNYYBo4=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-m8mp.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vwmWC-000000050kB-28KT
	for openembedded-core@lists.openembedded.org;
	Sun, 01 Mar 2026 19:31:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=7kr4nT8Y8jQM9wOwcohDXXtd1jP5owkRrt4UwVpDcBo=; b=vGpalEGM9+1fvp0eZGwhIbxPAN
	B8VQgQRV2tscAHOtKU3CG3x+KhAsmKvkxtzj1665OdnkdKyclTE4vNPz25iL3+5P2tp4LUfWBU3HH
	WPJsV9K7Ah4eiFMLbNL0MqeaPDZBwjlKKDXWqBp7IVJ9DsZCbYj6k3Xffgr/UrVjXcWk=;
Received: from [82.57.88.19] (port=64086 helo=bywater)
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <francesco@valla.it>)
	id 1vwmW6-000000002yu-3CVq;
	Sun, 01 Mar 2026 19:31:50 +0000
Date: Sun, 1 Mar 2026 20:31:49 +0100
From: Francesco Valla <francesco@valla.it>
To: adrian.freihofer@gmail.com
Cc: openembedded-core@lists.openembedded.org, 
	Adrian Freihofer <adrian.freihofer@siemens.com>, Marek Vasut <marek.vasut@mailbox.org>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>
Subject: Re: [OE-core] [PATCH 1/2] oe-selftest: fitimage: allow relaxed node
 checks
Message-ID: <aaSTTCPX4GCOFi3f@bywater>
References: <20260228-fit_loadables-v1-0-3027ec37930d@valla.it>
 <20260228-fit_loadables-v1-1-3027ec37930d@valla.it>
 <b2014f3b751aebe76d976352a9aab371564c5a9a.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2014f3b751aebe76d976352a9aab371564c5a9a.camel@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 68a8cf2adbaff64d6c46d19acd96bf2c
X-AntiAbuse: ID - 68a8cf2adbaff64d6c46d19acd96bf2c
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vwmWC-000000050kB-28KT-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-m8mp.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Mar 2026 19:32:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232144

Hi Adrian,

On Sun, Mar 01, 2026 at 03:20:55PM +0100, adrian.freihofer@gmail.com wrote:
> Hi Francesco
> 
> Thank you for the nice patches. Also thank you for separating this
> change into a separate patch to make it more obvious that this is
> potentially a bit controversial.
> 
> This looks like a risky change to me. Having a variable set to None by
> accident is a common error which the test should catch. Just allowing
> that is probably not the right approach.
> 

I agree with you TBH.

> Is it really not possible to make the tests providing the correct
> reference values in the dict which compared against the output?
> 

After some more thinking, I think I got the way in which
uboot-config.bbclass (which was recently reworked to support flags on
UBOOT_CONFIG_* variables) is approaching the matter. I'll rework the
test approach and send a v2.

> Regards,
> Adrian
> 

Thank you!

Regards,
Francesco


