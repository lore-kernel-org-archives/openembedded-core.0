Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E1ACD37BE
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 13:56:51 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50432.1778507801068818247
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2026 06:56:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=PPg0EuVZ;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 95F11C5E155;
	Mon, 11 May 2026 13:57:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E7BA660646;
	Mon, 11 May 2026 13:56:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 687AF11AF9C62;
	Mon, 11 May 2026 15:56:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778507798; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=er/RBOwYdGLQMhDs1gul2gi2JcSqv2iru/Oyu7THpsc=;
	b=PPg0EuVZFb1CR+cwKsUmJHOmDnTy1D+rlWB5ZiGd0WG5NS6RQo4MPLhSn3k8gc2Ob++kJD
	zV1nBbvwVslAN+jL5V7dBh34WhWUZheVzBixwrgQHuoEFqQow9ew0oQjjLAfPnSZ/mcMx6
	UfscJx4aTx1L3OM/xS5sV7/r82p6DEWCwV8ovH5nrq94m58upY3DkBxkO+0hfo1NqJ9BkO
	EHQSX7ykq24cdu8wl/2SUdCrDE9WqrlfC5j306mNUPm1X7r4/AQTG69c86cL13xAN/wUCW
	NBJqnffKG9dajjZWOrO28GImTY9K8VWHTOx8iEIweszOnSDytNhWHMVZFkpV/g==
Message-ID: <f759a4d4-208c-4c71-8e3f-06253382f8c5@bootlin.com>
Date: Mon, 11 May 2026 15:56:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/4] vim-xxd: introduce new recipe for xxd
To: Paul Barker <paul@pbarker.dev>, openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com, quentin.schulz@cherry.de,
 mathieu.dubois-briand@bootlin.com
References: <20260508214020.2488025-1-joaomarcos.costa@bootlin.com>
 <20260508214020.2488025-3-joaomarcos.costa@bootlin.com>
 <8c8b009ce6c0d95d5243f3e4f0c1c6c1eb07c989.camel@pbarker.dev>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <8c8b009ce6c0d95d5243f3e4f0c1c6c1eb07c989.camel@pbarker.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 May 2026 13:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236818

Hello

On 5/11/26 12:42, Paul Barker wrote:
(...)
>=20
> I don't think separating out vim-xxd while keeping vim in OE-core is a
> significant improvement. There's also the potential to miss CVEs unless
> we set CVE_PRODUCT to "vim" in vim-xxd, and that will just result in
> duplication of reports.
>=20
> This also doesn't reduce the amount of time people will spend
> backporting CVE patches to the LTS branch, and time our LTS maintainer
> will need to spend reviewing them. So I'd still rather eject vim from
> OE-core if we can.
>=20
> Best regards,

I don't know how feasible it is to have xxd's source code (i.e.=20
src/xxd/Makefile and src/xxd/xxd.c) in a separate repository, but a=20
brutal/dirty workaround would keeping this couple of files in do_unpack=20
and discard the rest of Vim's sources.

However, this would be somewhat a fork of xxd, so Vim CVEs would still=20
need to be reviewed manually to determine whether they affect xxd.

In any case, having a separate recipe for xxd can make this whole thing=20
easier, regardless if we keep vim in oe-core or not.
--=20
Best regards,
Jo=C3=A3o Marcos Costa

