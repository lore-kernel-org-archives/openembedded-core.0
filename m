Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D91C5B572
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 14:48:50 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32007.1786978121932694080
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 07:48:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=rvrJQGoZ;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BBFB04E41291;
	Mon, 17 Aug 2026 14:48:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 875CE60352;
	Mon, 17 Aug 2026 14:48:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6817311C72EDC;
	Mon, 17 Aug 2026 16:48:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786978119; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GsFMn6ecoDPHdr9vGo9dDhsQuHNQoUlOT5JX86jMi2M=;
	b=rvrJQGoZFpOigPrL/NyDBT52TRa6sPbdx0MZnwd0/4+ZExx5rUOeZzTN8aUTdxtJynaxRY
	OjvJh2BEkd9jCXgOU/nsOuHignousGP218QcdtO/clacoWapVBbbdnZeWfxyQdL2XYx97y
	u96dn12HRHcCoFcuPu6pVK7E/i9n4WGONmKUYtvtrDA9yMJaEIL+VY/oci9IX18h/caCQl
	yC4wfr65Rtyqtaqk//XM62w81Q8wtE5JiMoMaL/r+j1YLnlRdfpCOlw77LTrrhmRh8CARR
	CN7iISiBMInw2JJwMsCqRGXG9io0jFmM6CncJbB8mOWYXFPWqWPYHfApKEnk/Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Aug 2026 16:48:34 +0200
Message-Id: <DKRAVGZFGDPM.LZPQQB1MV24E@bootlin.com>
Subject: Re: [PATCH v15 01/12] package_rpm.bbclass: Drop external dependency
 generator to support rpm 6
Cc: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, "mattware@cisco.com"
 <mattware@cisco.com>, "esparlin@cisco.com" <esparlin@cisco.com>,
 "peter.marko@siemens.com" <peter.marko@siemens.com>, "MacLeod, Randy"
 <Randy.MacLeod@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Gavini, Sumanth" <sumanth.gavini@windriver.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260816231104.3871015-1-sumanth.gavini@windriver.com>
 <20260816231104.3871015-2-sumanth.gavini@windriver.com>
 <DKR3DBY7HJGC.1DTHOPVL8ZOS8@bootlin.com>
 <0687c7a0-8f97-4750-bbf0-e8c18772f293@windriver.com>
In-Reply-To: <0687c7a0-8f97-4750-bbf0-e8c18772f293@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 14:48:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243624

On Mon Aug 17, 2026 at 3:34 PM CEST, Sumanth Gavini wrote:
> Hi Mathieu,
>
> Thanks for testing v15.
>
> The pkgconfig() errors are likely from old sstate packages built before
> v15. Our change to package_rpm.bbclass invalidates do_package_write_rpm
> sstate for all packages (the class code is part of the task hash), so a
> clean build should regenerate all RPMs with consistent metadata and=20
> clear the errors.
>
> Could you trigger a clean build on the autobuilder without reusing
> existing sstate? Also, if you can reproduce locally with a clean build,
> that would help confirm whether the issue is the sstate transition or
> something else in our fix.

I can't really do a clean build without the sstate cache, sorry. Or at
least not just by myself. Cleaning the cache on the autobuilder, will
fix the build on the autobuilder, but not for any other user that will
have the previous objects in the cache. So it means we could be breaking
the build for some users.

What I could do is, as for last week, forcefully increase PR on a bunch
of recipes, to force a rebuild. This can be used to tests that
everything works fine on the autobuilder when everything is rebuilt from
scratch, but probably could bot be merged as-is.

Weekly maintenance will happen soon, so I can't do that right now, but I
will try to launch such a build tomorrow.

Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


