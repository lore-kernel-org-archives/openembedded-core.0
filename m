Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C5C1C48297
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 19:02:55 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.1451.1707246169507768904
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 11:02:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=VUyJmwJB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7977CC0009;
	Tue,  6 Feb 2024 19:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707246167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZG8tHNDZZrrqJQDOSHdXrbaVcY6TKItNQJubbVX1ebQ=;
	b=VUyJmwJBfVKE+YBbEy/u9ofGKzEOJxw2bkFWOH0C077iYQdGMaAFHSZyHwaqYlji+rT7tN
	7oAlQX1E1eM3pZQcfK7y+tEdrFoXmcPT1QQ1BIur//EEEB2EcCtASRr5iAhOc/QF9E/W9x
	T//k5/tR4Ycrd5yvm9mG9ZzUR/OBXVIv7RhGLQUgUw5ceEP3J9SEU5xkV4hQMgAbV7qpoa
	XNUgGjZ4kV74UlKcjlxx5ErkslRk5jJj40rVTVFd1O/SJlKNP2eYZeX7xJkBlLLRvksH0T
	Py+dL391wCClEHSrnvKmgqIS6qY0DNXVmxz5PNcexbcYXgzvCgeU9DENM/nQUQ==
Date: Tue, 6 Feb 2024 20:02:46 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Jermain Horsman <jermain.horsman@nedap.com>,
	Andrey Zhizhikin <andrey.z@gmail.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] scripts/oe-setup-layers: add option to skip
 revs in json
Message-ID: <20240206190246a3a66e24@mail.local>
References: <20231206092536.2874022-1-andrey.z@gmail.com>
 <CANNYZj8x2t2H9rj0jjjYW-GZqnqn_x6mNOJtydqUakO1sLU=ag@mail.gmail.com>
 <CAHtQpK69mRhcq6xMYLSgFQT7aKiXnh323AJP08noyMNX5fJMgQ@mail.gmail.com>
 <CANNYZj8-9PHqeiRuExw+kdPhCNspCERzH1zKA9O7L06F=bx27w@mail.gmail.com>
 <VI1PR10MB31822295979B4CE4CDB89E8EF784A@VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM>
 <17AF75010791E9CF.16460@lists.openembedded.org>
 <CANNYZj-zu9+a_zX21YWjN_SF0kL+rm=Fu5000s=an17r3SUaiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj-zu9+a_zX21YWjN_SF0kL+rm=Fu5000s=an17r3SUaiQ@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 19:02:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195019

On 06/02/2024 15:54:27+0100, Alexander Kanavin wrote:
> On Wed, 31 Jan 2024 at 15:30, Alexander Kanavin via
> lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
> wrote:
> > > > Look for the patchset '[RFC 0/7] bitbake-layers: Add
> > > > update-layers-setup' posted on 7 November, particularly the comments
> > > > to the individual patches, where we get to the design that should work
> > > > and cover the use cases.
> > >
> > > I had to work on some other issues that needed my attention,
> > > so not too much progress since, however, I have reserved some
> > > time this month and was planning to work on this.
> >
> > The patches are now in testing so Andrey can take a look and check if
> > they handle he use case he wants to solve:
> >
> > https://git.yoctoproject.org/poky-contrib/log/?h=abelloni%2Fmaster-next&qt=author&q=horsman
> 
> And now looks like they're not. Alexandre, was there some reason to drop them?
> 
> [PATCH 1/2] bitbake-layers: Add ability to update the reference of repositories
> [PATCH 2/2] bitbake-layers: Add test case layers setup for custom references
> 

RP didn't take them for a while and they conflict with your other series
that I wanted to test. I moved those to my staging branch so I remember
to come back to them.



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

