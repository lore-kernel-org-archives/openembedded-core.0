Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EAFDC433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 20:21:07 +0000 (UTC)
Received: from avasout-ptp-001.plus.net (avasout-ptp-001.plus.net
 [84.93.230.227])
 by mx.groups.io with SMTP id smtpd.web08.2337.1638390064380098846
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 12:21:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=bIOOmyfT;
 spf=pass (domain: mcrowe.com, ip: 84.93.230.227, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id sW64mbmrftAwOsW65m56qD; Wed, 01 Dec 2021 20:21:02 +0000
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.4 cv=TNsm93pa c=1 sm=1 tr=0 ts=61a7d92e
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=kj9zAlcOel0A:10 a=IOMw9HtfNCkA:10 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8
 a=QkTwt5E5690pjw7-kmkA:9 a=CjuIK1q_8ugA:10 a=JyGIbtnMUw8A:10
 a=qg_GYOSKbjEA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=RKo/q/wb0GJ8S5vDmTBfSBwlE89mPxdp2Ceb1GynZos=; b=bIOOm
	yfTjWz5qfbXaaINxTqhPptyp7qwwKCpAFzkUT2k8ZUWaZw/GLSRv06OHzmPeF3Yx/Fk6368GititQ
	JyCBsgLKiwbpdzig83wExfz055Tr37hCIoMjp+2sU9UIpEOE5NxV4Ajn4x8EbshAvTT58HTubJUhm
	msg4NbkqZW3G3SKzZX1/tMcQo3kbNeZUuGv1BaYgpOrig6iiv1Hvf5cMWlRZY5eOn+Jel5Sd3BBNR
	LKtk1v/Z+sZjVQuvnhLaKFHBe7QyLuyiHm4z8bttxMlICF13tgw7AE8n+BUPx7vRaXgHhk839coXl
	j/G6rDcjPwitho1XBRbsZ2yDM06wA==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.94.2)
	(envelope-from <mac@mcrowe.com>)
	id 1msW64-007MQj-JN; Wed, 01 Dec 2021 20:20:56 +0000
Date: Wed, 1 Dec 2021 20:20:56 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Justin Bronder <jsbronder@cold-front.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Correct way to set DRIDRIVERS and GALLIUMDRIVERS from mesa
 bbappend
Message-ID: <YafZKH9x0nEsSPZL@mcrowe.com>
References: <YaemRcD22hUhkQrq@mcrowe.com>
 <YafKe4SgTjgGY3IR@ravine.members.linode.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YafKe4SgTjgGY3IR@ravine.members.linode.com>
X-CMAE-Envelope: 
 MS4xfJhcwyJAyOihUilZgj6VkCcUOR0huX/5DcvK1DLI55ulZL/RadX54JK6PVXQeMLYzJoGUDoK+71T25LtnOLkgGbmNBFmMMwXDwX9+IgNwKWvt9g0jQGj
 maEtcyZfNb7KQPfiwHoMHBVYg3qlsaf34NP+5bpyi1Dd2Yv07yRz7gGiarXpGGgnuMILvxziLbDZ1JRfS+avLOWnY2+LwEZ6Wqs=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 20:21:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159058

On Wednesday 01 December 2021 at 14:18:19 -0500, Justin Bronder wrote:
> On 01/12/21 16:43 +0000, Mike Crowe via lists.openembedded.org wrote:
> > I'm building for a specific chip and therefore don't wish to waste time and
> > electricity building and disk space on the target installing unwanted mesa
> > drivers. However, mesa.inc contains:
> > 
> >  GALLIUMDRIVERS = "swrast"
> >  GALLIUMDRIVERS:x86-x32 = ""
> >  GALLIUMDRIVERS:append:x86:class-target = ",i915,iris,crocus"
> >  GALLIUMDRIVERS:append:x86-64:class-target = ",i915,iris,crocus"
> > 
> > and mesa_21.3.0.bb contains:
> > 
> >  DRIDRIVERS ??= ""
> >  DRIDRIVERS:append:x86:class-target = ",r100,r200,nouveau,i965"
> >  DRIDRIVERS:append:x86-64:class-target = ",r100,r200,nouveau,i965"
> > 
> > I'm unable to find a way to override these values. Using (for example):
> 
> You can use an anonymous python function which runs after parsing.
> https://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#anonymous-python-functions
> 
>     python __anonymous () {
>         d.setVar("DRIDRIVERS", "i965")
>     }

Thanks for the suggestion. It solves my problem. However, it seems like
quite a subversive way to do the sort of external customisation that
recipes normally support.

Thanks.

Mike.

