Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F00C3DA63
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 21:21:02 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.21763.1721856052830976397
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 14:20:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BwKAEfcq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B07D1C0002;
	Wed, 24 Jul 2024 21:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721856050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=W8OCvTn4XxPwfiQQ6UXpL5RWhdLbfNc9Ljo8N6IItSo=;
	b=BwKAEfcqt9rux2BZ/5BY7Jl62MC4ziy5RbAtuGkIvjDC1kz78ZlyFuL7avvv5AE/2G6e4s
	xtl1ss8Ne9y/lvgHA0xsGw9C3oGFVbmzHQeKv3cNhstxcPdNivSVLVw2eN09KygG7U/+Gj
	UhLnvzO8WIfM5ikWx58xoZo5n2NFgizh301PrQ3fs0gnQs8xig4GGDq4MrzDhnnb//MBsI
	bKng22Uu0j2NZF9Nrdj2NpbfYKXG8WZCEkmOswlRAxYr5a3r/QUj7iQvSZBGpIdKf/D1pS
	cCWRu/wDIM+139TByNcmCiDaTCj4StACb/AvCyH5n6zdYF3E8pl1Dxvqw7hK7g==
Date: Wed, 24 Jul 2024 23:20:50 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Tom Hochstein <tom.hochstein@oss.nxp.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] time64.inc: Simplify GLIBC_64BIT_TIME_FLAGS
 usage
Message-ID: <202407242120506c8cc0f9@mail.local>
References: <20240724170829.3456577-1-tom.hochstein@oss.nxp.com>
 <CANNYZj_GkEBefDmtp_ANbdZEv2r+i_RfTAYd0TpEbYD1kUZ+3g@mail.gmail.com>
 <fae511ee-87e4-45be-ae8a-88b11d20badf@oss.nxp.com>
 <CANNYZj8s+PmYjrAEr=4gM1ZqO1enJ6t5eOdosCONKL175buSuA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj8s+PmYjrAEr=4gM1ZqO1enJ6t5eOdosCONKL175buSuA@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 21:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202487

On 24/07/2024 22:29:45+0200, Alexander Kanavin wrote:
> On Wed, 24 Jul 2024 at 21:33, Tom Hochstein <tom.hochstein@oss.nxp.com> wrote:
> 
> > Thanks, Alex.
> >
> > We are working to configure the builds of certain recipes so the non-Y2038-compliant code is avoided, e.g, by disabling oss-output in pulseaudio. That leads to needing to restore GLIBC_64BIT_TIME_FLAGS, which for pulseaudio is cleared in this file (on scarthgap, not on master):
> >
> > GLIBC_64BIT_TIME_FLAGS:pn-pulseaudio = ""
> >
> > When you do that override as one would normally expect, i.e., without the leading space, you get the error:
> >
> > cc1: error: '-Werror=format-security-D_TIME_BITS=64': no option '-Wformat-security-D_TIME_BITS=64'
> >
> > The problem is the design in time64.inc does impose an extra requirement for an external assignment to include a leading space. The redesign is meant to remove that requirement on the leading space, i.e., to simplify the usage of the variable by external users.
> 
> Thanks for the background. I guess the only real objection I have is
> about repeating the flags multiple times. They should be defined once,
> so we probably need an extra intermediate variable that would be set
> with target overrides.

Then why not simply have this intermediate variable contain the initial
GLIBC_64BIT_TIME_FLAGS value with the leading space so recipe can simply
use it to restore the value?

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

