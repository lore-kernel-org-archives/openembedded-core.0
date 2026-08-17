Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C942C5B572
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 08:56:00 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25984.1786956957385552691
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 01:55:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=sLooBdkM;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1705C1A16CC;
	Mon, 17 Aug 2026 08:55:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DD7E360352;
	Mon, 17 Aug 2026 08:55:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6D07F11C4FF3D;
	Mon, 17 Aug 2026 10:55:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786956950; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BKnSRj/SwlzwFXwRGBOwuVeBadQ1TbhS6Tc8Se6NjJg=;
	b=sLooBdkMiFZVNGnECvmhdEFEJT3b+sOt+g7KWxop6Xs+zhE3lpGpcgcoU0Zct18JxEbRK8
	oSK1XLswsH8Qsg1nctKBHew8p61Ld+nPsy35+MK1A8FbiwRd4yL9oE1x6UR01J9tmEujjh
	JMT+AqKIj88YcGsEfmDTxmI1mWYuC3TuwS9xWWdOQOPOBdYWXzefS4F7pvEOPM1A2FNNlw
	ZVYVyO8ZGAQ2yOo63n0p6hn5iy/us9v0QZ/G8TKj+ZaBdIPwmXgJINl011CazRvZAjQ0QM
	3WeOhLoOoNQiMElfkeqOWEQI/UzrJywDxHyXpFQqhe8NqiCyqAOlMC5j0ITsQQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Aug 2026 10:55:45 +0200
Message-Id: <DKR3DBY7HJGC.1DTHOPVL8ZOS8@bootlin.com>
Subject: Re: [PATCH v15 01/12] package_rpm.bbclass: Drop external dependency
 generator to support rpm 6
Cc: <alex.kanavin@gmail.com>, <mattware@cisco.com>, <esparlin@cisco.com>,
 <peter.marko@siemens.com>, <randy.macleod@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Sumanth Gavini" <sumanth.gavini@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260816231104.3871015-1-sumanth.gavini@windriver.com>
 <20260816231104.3871015-2-sumanth.gavini@windriver.com>
In-Reply-To: <20260816231104.3871015-2-sumanth.gavini@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 08:56:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243600

On Mon Aug 17, 2026 at 1:10 AM CEST, Sumanth Gavini wrote:
> The rpm 6 doesn't support external dependency generator. Oe-core used it =
for
> per file dependency which was saved into pn.requires and pn.provides,but =
that
> hasn't been used any more since 2012 (rev:
> be40f6d0bb80274366af00461112af65687a4de8), and there were no complains or
> updates in the past 13 years, so just drop it to support rpm 6.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
> ---

Hi Sumanth,

Sorry, but we can still see the same pkgconfig issues on the
autobuilder.

The "nothing provides pkgconfig()" ones:

Error:
 Problem 1: conflicting requests
  - nothing provides pkgconfig(gstreamer-1.0) >=3D 1.28.0 needed by gstream=
er1.0-plugins-base-dev-1.28.5-r0.x86_64_v3 from oe-repo
  - nothing provides pkgconfig(gstreamer-base-1.0) >=3D 1.28.0 needed by gs=
treamer1.0-plugins-base-dev-1.28.5-r0.x86_64_v3 from oe-repo
 Problem 2: conflicting requests
  - nothing provides pkgconfig(libxml-2.0) >=3D 2.9.0 needed by librsvg-2-d=
ev-2.62.3-r0.x86_64_v3 from oe-repo
 Problem 3: conflicting requests
  - nothing provides pkgconfig(xkbfile) needed by xkbcomp-dev-1.5.0-r0.x86_=
64_v3 from oe-repo
 Problem 4: package gstreamer1.0-plugins-bad-dev-1.28.5-r0.x86_64_v3 from o=
e-repo requires gstreamer1.0-plugins-base-dev, but none of the providers ca=
n be installed
  - conflicting requests
  - nothing provides pkgconfig(gstreamer-1.0) >=3D 1.28.0 needed by gstream=
er1.0-plugins-base-dev-1.28.5-r0.x86_64_v3 from oe-repo
  - nothing provides pkgconfig(gstreamer-base-1.0) >=3D 1.28.0 needed by gs=
treamer1.0-plugins-base-dev-1.28.5-r0.x86_64_v3 from oe-repo
(try to add '--skip-broken' to skip uninstallable packages)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/68/builds/4510
https://autobuilder.yoctoproject.org/valkyrie/#/builders/67/builds/4420

And the "nothing provides /usr/bin/pkg-config" ones:

Error:
 Problem 1: conflicting requests
  - nothing provides /usr/bin/pkg-config needed by openssl-dev-3.5.7-r0.cor=
texa57 from oe-repo
 Problem 2: package kmod-dev-34.2-r0.cortexa57 from oe-repo requires openss=
l-dev, but none of the providers can be installed
  - conflicting requests
  - nothing provides /usr/bin/pkg-config needed by openssl-dev-3.5.7-r0.cor=
texa57 from oe-repo
(try to add '--skip-broken' to skip uninstallable packages)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/36/builds/4394
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4292

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


