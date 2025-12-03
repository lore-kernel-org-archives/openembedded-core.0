Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E133D116F3
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 07:23:35 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9532.1764746607201116158
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 23:23:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=NwwDp5en;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 100704E419F3
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Dec 2025 07:23:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DA6E960706;
	Wed,  3 Dec 2025 07:23:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7B24E103C8EBC;
	Wed,  3 Dec 2025 08:23:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764746604; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=V408Xx5xtHRGe+fTTS28dwjkHLpASPG67iShOxrvWsc=;
	b=NwwDp5enKgRtBYzOJ6CUfn72GxaYLAqVF2tbmbM+hsiVJkx1FVStHSCT7Q2Z2uQaRkl95R
	+bj61+dWv5Ih9swSYTKKU4wv88LYxHM3xPsaOHvk/ukrRFfyYeoWo8Od8cWa1+2HL8BnsD
	xAFNX1hMF1VbSaM1Keo9aPIHsrzLEgxf77uPX5qM3qZiOtjOaohp/oQSMKUyfUuU3NibT0
	8LvW9WfQkUXJo5NZjZSpBw5mDZmEOlu9AjCTiqbwDBRxlBqrRnqGBUHiPO2FgZune0txRW
	gVkwh5gd759FHy+SRErVBGSYGPK4Fi9zI/vifdnsdE9kj2dl+VTTg3usDVDJKQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Dec 2025 08:23:22 +0100
Message-Id: <DEOEGKYGPYRE.2VTCS4TEKVW7C@bootlin.com>
Subject: Re: [OE-core] [PATCH] autoconf: Raise line length limit for sed/awk
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251127164443.2285753-1-raj.khem@gmail.com>
In-Reply-To: <20251127164443.2285753-1-raj.khem@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 07:23:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227203

On Thu Nov 27, 2025 at 5:44 PM CET, Khem Raj via lists.openembedded.org wro=
te:
> Latest autoconf is splitting long cmd lines in config.status
> it generates using sed/awk to have compatibility with
> platform like HPUX,Solaris,AIX which is understandable given
> autotools try to achieve wider portability, however, this does
> mean that in OE builds we might get these newlines added in
> places dividing commands including buildpaths in them and the
> methods deployed to scrub them from output artifacts will fail
> since the string is now on two lines resulting in build QA to
> pass but the strings do sneak in affecting reproducibility
> one such example is e2tools recipe in meta-filesystems and there
> perhaps are more
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---

Hi Khem,

Thanks for your patch.

I've had some issues on the autobuilder for a few days, and it looks
like it was triggered by this patch. While there was no specific error,
the -tc build jobs had been running for several days and never ending.

One example:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/66/builds/2740

I've had a look on the worker: it looks like the host nfs server, used
to share files with the tests running in qemu, had been failing:

pokybui+ 4115014  1.1  0.0      0     0 ?        Z    14:23   4:32 [unfsd] =
<defunct>

I clearly can't see how this can be linked to this patch, yet, git
bisect points to it, and after its removal I don't have the issue
anymore.

So I'm not sure there is anything you can do, but I will accept any clue
about what might going on here.

Thanks,
Mathieu


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


