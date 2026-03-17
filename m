Return-Path: <kory.maincent@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5A15FD877A
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 14:04:40 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76791.1773756270403048162
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 07:04:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=tP+Mn+m7;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: kory.maincent@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3B6EC4E42655
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 14:04:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 115035FC9A;
	Tue, 17 Mar 2026 14:04:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7F8B1104505FA;
	Tue, 17 Mar 2026 15:04:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773756263; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=THIacfI8CzAmK+UZ8tqLsIBhynJti9mu6Fg6uOd7fgc=;
	b=tP+Mn+m7ZFifdvOIjV5MqdqFyDXzzJiSGWwg3nSP/JCAmINy32r3sYib9jWbblDNqY08fs
	/3hsf7n8aiVvQ8hJTqQtiYUaKHkyS2YtBIKoevIu/iVr3X2KyBoyaagWdMr99fpBtjs9Pi
	3yxRb9nquK+CbN/xUEKDsDSwtlc5n6ISEufyLa0qxD+u1DMrGLOmRX4bjKAST5r+EK75N7
	i45PnEk7u8tV/sxyJ8Rxt/VOjhjZTAmH8LAMsZwEaPazpIViJApf4wMZey8PYualYyH03Q
	2yzflWMJTH5lpZJ9FXofinZosxyGpodZdH/Kkaqti+ZiEe1qKt8kFkHbkL8ZxA==
Date: Tue, 17 Mar 2026 15:04:20 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, Louis Chauvet
 <louis.chauvet@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [OE-core][PATCH] default-providers: switch pkgconfig provider
 to pkgconf
Message-ID: <20260317150420.07fcd2ac@kmaincent-XPS-13-7390>
In-Reply-To: <8ABAF2EF-06EE-43ED-8D90-589322F0CD84@arm.com>
References: <20260317112407.312819-1-kory.maincent@bootlin.com>
	<8ABAF2EF-06EE-43ED-8D90-589322F0CD84@arm.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 14:04:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233324

Hello Ross,

On Tue, 17 Mar 2026 13:37:48 +0000
Ross Burton <Ross.Burton@arm.com> wrote:

> On 17 Mar 2026, at 11:24, Kory Maincent via lists.openembedded.org
> <kory.maincent=3Dbootlin.com@lists.openembedded.org> wrote:
> >=20
> > pkg-config has been unmaintained since 2017. Major Linux distributions
> > such as Fedora, Debian, Alpine, and Arch Linux have all switched to
> > pkgconf as their default pkg-config implementation. Upstream projects
> > no longer use or recommend pkg-config. There is no reason for Yocto
> > to keep lagging behind and continue using a dead tool.
> >=20
> > Switch the preferred providers for pkgconfig, nativesdk-pkgconfig and
> > pkgconfig-native to pkgconf, aligning with the broader ecosystem. =20
>=20
> I=E2=80=99ve been working on this migration during this cycle and literal=
ly last
> night did one last built of the universe with pkgconfig vs pkgconf. It=E2=
=80=99s not
> quite as simple as just switching the providers, but it=E2=80=99s close.

Oh, great!

> > Should we keep making pkgconf emulate the legacy pkg-config behavior?
> > At this point, projects have had sufficient time to adopt native pkgconf
> > compatibility, so it may be worth dropping the wrappers and letting
> > pkgconf behave as its own tool. =20
>=20
> This is a bigger question.  The pkgconf maintainers have Opinions on how
> =E2=80=94variable and sysroots interact and simply dropping the fdo behav=
iour does
> result in build breakage.

I know it will raise some discussion, but maybe we could align with Buildro=
ot
choice on this topic:
https://github.com/buildroot/buildroot/blob/master/package/pkgconf/0001-Onl=
y-prefix-with-the-sysroot-a-subset-of-variables.patch

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

