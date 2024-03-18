Return-Path: <emil.kronborg@protonmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 657B8C54E5D
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 18:55:06 +0000 (UTC)
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by mx.groups.io with SMTP id smtpd.web10.53557.1710788099211986612
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Mar 2024 11:54:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@protonmail.com header.s=protonmail3 header.b=qDIY7it5;
 spf=pass (domain: protonmail.com, ip: 185.70.43.22, mailfrom: emil.kronborg@protonmail.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1710788097; x=1711047297;
	bh=s+B5KwCvkrqPxWSSdld1l+hxqP4LXeSKy0JTUl6gMq8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=qDIY7it5PR73uA4X9pTZOX81xj6KJV5WmuW8x7zsxNsjj8xO8j6ARHkuv+GXhVUtI
	 X2fycz5vhBiuhYPO9cedM+J3tA1WfncY4spR4S7IwGjqcskjB0C1RaZ2RIUJMFlUkU
	 M+qKSezL8186ters6kMqkPk8H1iU1IKyfdfk/4GvsJpIfQ0/pJD6q829Q/Jz4saEpg
	 BYuFGyvQ+TRPc/690U//KOLNySqPHMTCpRSHv2rQF88+6kMF0zF8sjYHLHGA3nbJAL
	 csDg1vYWbbhGKOHVW4FJMKqfc9rrJ8Fz4YyE4ftjr7CNvIwpQ0B+vZINv/1vgDc0o5
	 isBU8Vga/C9NA==
Date: Mon, 18 Mar 2024 18:54:37 +0000
To: Ross Burton <Ross.Burton@arm.com>
From: Emil Kronborg <emil.kronborg@protonmail.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] openssh: enable sshd.service by default
Message-ID: <s3wfvdgfsf3niuxqr4waflxlwjv3mh7qvlylcqg24k4t2uv35v@65c6olmmmpqq>
In-Reply-To: <856288DD-FACC-45EA-8248-C2FD0EC724C6@arm.com>
References: <20240307200830.221403-1-emil.kronborg@protonmail.com> <856288DD-FACC-45EA-8248-C2FD0EC724C6@arm.com>
Feedback-ID: 20949900:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 18:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197312

On Fri, Mar 15, 2024 at 16:09 +0000, Ross Burton wrote:
> On 7 Mar 2024, at 20:08, Emil Kronborg via lists.openembedded.org <emil.k=
ronborg=3Dprotonmail.com@lists.openembedded.org> wrote:
> >
> > Socket activation is prone to DoS (denial of service) because too many
> > connections will permanently deactivate sshd.socket [1]. Also, since
> > socket units do not allow setting Restart, accepting new connections ca=
n
> > fail due to, for example, OOM (out of memory) [2]. Therefore, it seems
> > more sensible to use sshd.service by default and let sshd.socket be an
> > optional choice.
>=20
> Counter-argument: this is why it=E2=80=99s a PACKAGECONFIG, and socket ac=
tivation has the advantage that it makes boots faster.  If DoS is a concern=
, then the distro can switch trivially to service activated.
>=20
> Ross

Those are fair arguments. What do you think about the situation where
sshd.socket becomes disabled, and you are unable to connect? I can see
this being a problem for remote boards or boards that are not easily
accessible. FWIW, socket activation is disabled by default on Arch Linux
and Fedora. I don't have a box running Debian (or any other distros)
right now to check those as well.

--=20
Emil Kronborg


