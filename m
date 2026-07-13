Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F175C43458
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 11:31:54 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8884.1783942303780115183
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2026 04:31:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=bYgCGLAF;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 74F8C4E40D87
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 11:31:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 38A7460341;
	Mon, 13 Jul 2026 11:31:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 86C7E11BD2EA8;
	Mon, 13 Jul 2026 13:31:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783942300; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WhbiB+ZLpEVhfEjJY69D41SVIbxtJ0PsoEhC/PktfRs=;
	b=bYgCGLAFrl67apLr0kkKZd/izb2kHEUPPknV9As4Ga7odpQgKTjHX7+LKxq5C/6fqb42iJ
	Y6GltodSXujM0fbol1mt24wxA5EkuwyNEi7c9svdqgwFKMpHuSJaSS8NbzQ4oNJd8NX8F6
	cfMx1yyQgXIlfKq1ickYNWvPIhMrqxxniVHnQ5SvNnpdsMcLCNlmhxQ4YzE5pRCKTD+zo0
	Ga19sxPtW6X/MDIdb9md4rqqH+/4S5K6MEMOisbo+kfmy9E1puJsZs3c/VsvdsMsgOcj7W
	dHoSz1K0PNhr3O4aULX/fXIT0+8h4Y6Gk8bPLRcoP2lSCTpaaS4uykXC8/tWVg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Jul 2026 13:31:38 +0200
Message-Id: <DJXERMBMNGQC.25C9M4KQUASY2@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/2] readyfd2sd: add recipe
Cc: <yocto@pengutronix.de>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Lucas Stach" <l.stach@pengutronix.de>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260702182012.2240881-1-l.stach@pengutronix.de>
 <DJQHPR7DZ5DC.7UI26Y5DSKJV@bootlin.com>
 <e11b45c00588e9d1f126a516350fe647823d022c.camel@pengutronix.de>
In-Reply-To: <e11b45c00588e9d1f126a516350fe647823d022c.camel@pengutronix.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2026 11:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240836

On Mon Jul 13, 2026 at 11:56 AM CEST, Lucas Stach wrote:
> Hi Mathieu,
>
> Am Sonntag, dem 05.07.2026 um 10:21 +0200 schrieb Mathieu Dubois-
> Briand:
>> On Thu Jul 2, 2026 at 8:20 PM CEST, Lucas Stach wrote:
>> > Some services, such as seatd, only implement the s6 init ready notific=
ations.
>> > readyfd2sd translates those notifications to the systemd-notify format=
, to
>> > make them usable with the systemd init system.
>> >=20
>> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
>> > ---
>>=20
>> Hi Lucas,
>>=20
>> Thanks for your patch.
>>=20
>> It looks like this is failing with non-systemd distro.
>>=20
>> WARNING: Nothing PROVIDES 'systemd' (but /srv/pokybuild/yocto-worker/qem=
uarm64-armhost/build/layers/openembedded-core/meta/recipes-core/readyfd2sd/=
readyfd2sd_git.bb DEPENDS on or otherwise requires it)
>> systemd was skipped: using DISTRO 'poky', which is missing required DIST=
RO_FEATURES: 'systemd usrmerge'
>>=20
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/8/builds/4108
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/4095
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/4133
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/4314
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/4097
>>=20
>> Can eadyfd2sd be built without systemd?
>>=20
> No, that doesn't make sense, as readyfd2sd is an adapter to a systemd
> API, so there is a hard dependency there. It's also only added as a
> dependency to seatd when systemd support is enabled.
>
> What's the correct way to avoid the build in the autobuild? Will a
> check for REQUIRED_DISTRO_FEATURES do the right thing?
>

I suspect following lines will indeed fix the issue:

inherit features_check
REQUIRED_DISTRO_FEATURES +=3D "systemd"

You should be able to verity this locally by using "poky" distro.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


