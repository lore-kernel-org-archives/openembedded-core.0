Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 926B9C47088
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:15:12 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.46262.1669907702409212597
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:15:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cc7nsaSn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DC579FF813;
	Thu,  1 Dec 2022 15:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669907700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mabsMQe/hBR40TklgjwjUDjzCANUQVX3aBiA9WAuzjw=;
	b=cc7nsaSn4bFmeX+0jgtfbfxlVw7Gwr3rBb79opw1J42y73azwnuDzRPtQCLcLidoNmywce
	svX5+29NhPzqfdt15RmLzXbgDBbRZeYUx8eYnJi0wyspSqO0doLgN/9nVVBg3cwHcI+Hgy
	qadIxBQZsWOhEoMJEbrzZXE6zPtcoKh6ktMB6OSBlTUIPrHkD28No2aye7UsRTXnPU25KL
	+VPIe45HWIR4v19Rs3hvn2bQ5c/X8aoH0Bg5x3CD9ZmJXxILB9b+bNA6wdf0tIP41DdnIb
	hb0ljBbHZ5ClX9K8Q8wfeho2+xEfdYpD/EyxmGXnkIlJdXScYhQ8kBxjdlmBuQ==
Date: Thu, 1 Dec 2022 16:14:59 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ross Burton <ross.burton@arm.com>
Cc: "pyih.soft@gmail.com" <pyih.soft@gmail.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] classes: make TOOLCHAIN more permissive for
 kernel
Message-ID: <Y4jE8wXWKjCvQegF@mail.local>
References: <20221130162113.3731385-1-pyih.soft@gmail.com>
 <C5C61A1A-4E14-4D7F-97BA-B12C3FB15417@arm.com>
 <Y4iaqGB8RkrBQYsX@mail.local>
 <7EBEF3C3-A9F1-475E-A90E-DA21E6E5895C@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7EBEF3C3-A9F1-475E-A90E-DA21E6E5895C@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:15:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174111

On 01/12/2022 13:27:13+0000, Ross Burton wrote:
> 
> 
> > On 1 Dec 2022, at 12:14, Alexandre Belloni <alexandre.belloni@bootlin.com> wrote:
> > 
> > On 01/12/2022 11:25:29+0000, Ross Burton wrote:
> >> On 30 Nov 2022, at 16:21, Alexey Smirnov via lists.openembedded.org <pyih.soft=gmail.com@lists.openembedded.org> wrote:
> >>> -TOOLCHAIN = "gcc"
> >>> +TOOLCHAIN ?= “gcc"
> >> 
> >> If the kernel is buildable with clang then the TOOLCHAIN statement should just be removed.
> >> 
> > 
> > It is buildable but the generated binary is not necessarily bootable,
> > depending on the architecture
> 
> So maybe the kernel class should just set TOOLCHAIN for those architectures where it is known to not work, leaving it unset (and thus overridable with a global assignment) for everything else?
> 

I'm not sure this is doable because oe-core doesn't have support for all
the architectures that are supported by the kernel and so it would be
better to list the ones that are actually supporting clang. Even then we
will probably end up with people wanting to build with clang just to
ensure there are no new warnings even if the kernel they are going to
use is built with gcc (I've already been asked).

> Ross

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174059): https://lists.openembedded.org/g/openembedded-core/message/174059
> Mute This Topic: https://lists.openembedded.org/mt/95361461/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

