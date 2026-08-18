Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 312F8C5DF67
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 05:37:32 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2832.1787031446570253362
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 22:37:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=b4eWpRx0;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4D3894E412A5
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 05:37:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1259B60355
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 05:37:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B411211C74771;
	Tue, 18 Aug 2026 07:37:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787031439; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=L9aYzVxZ9aN/iR80n73TvQfJXYYHa3QpyZpTztPgSJ8=;
	b=b4eWpRx0yskmbzF0KOUFK193xpVjW3fSKqeXtn9ZDy4gpKanIMu9Y2MHaka81mQxu6lKh6
	CSc3ENW2mreHedt3MiFFq7g9yWrjZhuWZQbk6wRFwLU8iNs+NOhvIhxiEveqK5bQtWBgc2
	ahQLisY4JGhMXm4juIGwpov2xpkzf9NhkeEzASrI7v2e8ls9X48Nj9k3QyV5NVOq1F7T8w
	Pa1m3ZXWhkPp4q5dNz8fpRt1IauobAVrqO6v5KPfsNZQNAavRXac2J8gk2TZc2QVH5bDC7
	Ttg9wwFLI7OzASZ/aUZB+yWH3j5SDleDk0EZsHW3Y2kg9O71yJa+6v3ZOdEWSA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Aug 2026 07:37:18 +0200
Message-Id: <DKRTRX9N7CAV.1AZXJ5P8QS36Z@bootlin.com>
Subject: Re: [OE-core] [PATCH] python3-pygments: update 2.20.0 -> 2.21.0
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <antonin.godard@bootlin.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260817-update-pygments-v1-1-da836eab9640@bootlin.com>
In-Reply-To: <20260817-update-pygments-v1-1-da836eab9640@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 05:37:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243649

On Mon Aug 17, 2026 at 12:13 PM CEST, Antonin Godard via lists.openembedded=
.org wrote:
> One notable change from this update is the addition of a Bitbake lexer,
> which will allow us to do proper Bitbake syntax coloring in our
> documentation.
>
> Full list of changes:
> https://github.com/pygments/pygments/releases/tag/2.21.0
>
> Tested using this version for the documentation with our
> buildtools-docs-tarball recipe.
>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---

Hi Antonin,

Thanks for your patch.

It looks like this upgrade might be breaking some ptests, for a lot of
python recipes:

Failed ptests:
{'python3-click': 'START: ptest-runner\n'
...
Failed ptests:
{'python3-xmltodict': 'START: ptest-runner\n'
...
Failed ptests:
{'python3-webcolors': 'START: ptest-runner\n'
...
Failed ptests:
{'python3-wcwidth': 'START: ptest-runner\n'
...
Failed ptests:
{'python3-uritools': 'START: ptest-runner\n'
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/2181
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4294
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4311
https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/986
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/967

Can you have a look at the issues?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


