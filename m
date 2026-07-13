Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AAA9C43458
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 17:19:06 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1166.1783963138275627093
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2026 10:18:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=p4jkEVWg;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E8EE64E40D90
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 17:18:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9D17E60345;
	Mon, 13 Jul 2026 17:18:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3DC4E11BD22AE;
	Mon, 13 Jul 2026 19:18:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783963135; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oWegA+q76lfl6RXEued8O/LLJ5jhSccAwwrITqQYf3M=;
	b=p4jkEVWgOYYKUpZEizw6z+W2OvD/e8RzGTOSNVVny9Z0eijZrpZhKT8Y5vFWPWavHq5Xvk
	YENF08cHNFLdUIW40Jf7bDHa3nOlT/n4yzntF4fGOnNaHbwugdh5b73TeqOHRwm7HOnBjy
	o4iNlaalon8K9jU9t6ARzOrQ+z8fTf6n886OQTnJ4+yACmhRnrWmU9oXhW54Inby1AkiE0
	Zbfo0ExcEQ6Fwmy3X8eKk4+Sdu8D/gmKJiHpA1g3OVZdsNkLLcK4HqA9W18lUF/qz3GFIL
	DAAMVlJRT9GfH0NWthLCAo1TCLkUte5MFvV8oCFfadvXDmf2WSXELPFdCY/qVw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Jul 2026 19:18:53 +0200
Message-Id: <DJXM5HO042KD.3TA2WKNMM5UKS@bootlin.com>
Subject: Re: [PATCH] memory-control: fix build failure on non-systemd
 distros
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Ishaan Desai" <Ishaan.Desai@ibm.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260713150121.3809558-1-Ishaan.Desai@ibm.com>
In-Reply-To: <20260713150121.3809558-1-Ishaan.Desai@ibm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 17:19:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240851

On Mon Jul 13, 2026 at 5:01 PM CEST, Ishaan Desai wrote:
> The recipe unconditionally declared RDEPENDS on 'systemd', which is an
> init manager, not an installable package. On distros like poky that do
> not enable the systemd DISTRO_FEATURE, the dependency resolver cannot
> satisfy this, causing the recipe and anything that inherits
> memory-control.bbclass to become unbuildable in a world build:
>
>   ERROR: Nothing RPROVIDES 'systemd'
>   NOTE: Runtime target 'memory-control' is unbuildable
>
> Fix by adding 'inherit features_check' and REQUIRED_DISTRO_FEATURES =3D
> "systemd" to the recipe so it is cleanly skipped on non-systemd distros,
> removing 'systemd' from RDEPENDS:${PN} in the recipe (the tool shells out
> to systemctl at runtime, but systemd is an init manager present on the
> running system, not a package dependency to install), and guarding the
> RDEPENDS injection in memory-control.bbclass with bb.utils.contains so
> recipes that inherit the class do not pull in the memory-control package
> on non-systemd distros. Also add the missing RECIPE_MAINTAINER entry to
> maintainers.inc.
>
> Reported-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> AI-Generated: Uses IBM Bob
>
> Signed-off-by: Ishaan Desai <Ishaan.Desai@ibm.com>
> ---

Hi Ishaan,

The first version was not merged, so please squash your changes in it.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


