Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB8A2CD98C5
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 09:57:53 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.126266.1781517465229790058
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 02:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=IcumW04V;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 062554E42F02
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 09:57:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C7BD560015;
	Mon, 15 Jun 2026 09:57:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 09574106C9575;
	Mon, 15 Jun 2026 11:57:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781517462; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NgWVfEokqCjWl7gkxdcfiW6dhE0t6hI1dFHzwr5836U=;
	b=IcumW04VpNGxUK/WymjBNN0tTwkg8uTh2zGATQ3Vtj/GsEUikrLgb76GDvXRJLoh89H8ot
	W6/rJYPn7p8G4n1kN+T+nnWeTJdWgBUsAMsVZ5qUv7zO/AlhtcRrdZE39Uw0YAwQmnGUXl
	puGT/YqNuAcSnwuS4RQxizKt20IzJvX520Q1Uz3EuISNohxhp0utFGr9HktnGhY+IkD1bv
	hj9mhX4yLWkO1ofCUspQGAQZdGIsQ6Q8xlMLu8cTaeM2rFhgZopkOl6Dh9J8nUFpLgBKK3
	8xYu3Z3G5eeEJLKPtUHlJQWGAUC8+Xpivs6zOhNbfUCIS8wHweWFdgsxST/glQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 Jun 2026 11:57:39 +0200
Message-Id: <DJ9J8EE7M0GH.29B2TT7NGNA01@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <hjadon@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [master] [PATCH] tar: Fix CVE-2026-5704
Cc: <vchavda@cisco.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260612121300.3427104-1-hjadon@cisco.com>
In-Reply-To: <20260612121300.3427104-1-hjadon@cisco.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 09:57:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238829

On Fri Jun 12, 2026 at 2:12 PM CEST, Himanshu Jadon -X (hjadon - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Himanshu Jadon <hjadon@cisco.com>
>
> Backport the upstream 3-commit fix chain for CVE-2026-5704.
>
> The final fix is [1], which depends on the earlier cleanup in [2]
> and the behavioral change in [3]. Keep this patch order so the final
> fix applies cleanly and preserves the upstream logic.
>
> [1] https://cgit.git.savannah.gnu.org/cgit/tar.git/commit/?id=3Db8d8a61b2=
5588caca4efaf9bdd2e3f1a49da77e3
> [2] https://cgit.git.savannah.gnu.org/cgit/tar.git/commit/?id=3D112ead793=
12ea308e58414b74623f101b8c06f0b
> [3] https://cgit.git.savannah.gnu.org/cgit/tar.git/commit/?id=3Db009124ff=
de415515081db844d7a104e1d1c6c58
> [4] https://security-tracker.debian.org/tracker/CVE-2026-5704
>
> Signed-off-by: Himanshu Jadon <hjadon@cisco.com>
> ---

Hi Himanshu,

Thanks for your patch.

It looks like this is breaking some ptest:

AssertionError:
Failed ptests:
{'tar': ['--no-overwrite-dir']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3820
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3838

Can you have a look at the issue?

As this is a CVE fix, we probably still have to get the patch. So either
there is a fix upstream, or we have to disable this specific test.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


