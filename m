Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16CB5C53219
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 08:11:03 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6911.1785226254418927240
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 01:10:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=YCqgJeaJ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 09C0B1A12BB;
	Tue, 28 Jul 2026 08:10:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CAC6E601BF;
	Tue, 28 Jul 2026 08:10:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 50BEF11C13E4A;
	Tue, 28 Jul 2026 10:10:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785226251; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=H9O6bmlywPFdmbP7/OTmtmfvQMVV2NYXM4I2OGD58zQ=;
	b=YCqgJeaJxoswmeNygwYN8Y1a82HYbW0Gtf+aNn5tW/AjQ1hH9zO3OpulwJDNMpEklGcDak
	DbjQdJ9oni9ogChPoJo9p4vzTNO9eZF8l+8JwLwNZ6HHkVaSUYqPdSN1KWW7nZCz2CWXlK
	Klv6vdff6unnMGNf0CMdGk6xsEZyxWZXljzlS4yZYkaqHXOPaEGr1n8BqvfUNgCeBeDW46
	bx9ApJv1mQefTc5Nutb/Vy+6CdjgZY8d4snJMati/f0AFm0mCXH+0w6iKXV4aD0tw8Joh2
	sT4Q+0AzFcW/+2M8biOk12z6FETcrOyupYD8uhU4A9K9eZ+OMsuat1zeyBzRSQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Jul 2026 10:10:49 +0200
Message-Id: <DKA1W17KW1CO.2QZYCZ5V28WA4@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>,
 "openembedded-core" <openembedded-core@lists.openembedded.org>
Subject: Re: AB-INT issues - where we could use help
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <8773d1dc4d109da78fa0ffd91bc5667a5f3544d2.camel@linuxfoundation.org>
In-Reply-To: <8773d1dc4d109da78fa0ffd91bc5667a5f3544d2.camel@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 08:11:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242169

On Mon Jul 27, 2026 at 11:12 PM CEST, Richard Purdie wrote:
> Hi,
>
> There are at least a couple of intermittent issues where we would
> welcome some help and we now probably have enough information to allow
> debugging/progress.
>
> Firstly, we suspect there is a reproducibility issue arm to x86. This
> is summarised with this reproducibility diff:
>
> https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260726-9wb1l3t=
4/packages/diff-html/
>
> (from
> https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260726-9wb1l3t=
4/packages/diff-html/)
>
> I suspect what happened here is that the qemux86-64 files were built
> first on an arm host rather than an x86 host. In general the x86 hosts
> probably beat the arm hosts to it, hence why this is rare.
>
> To test/reproduce this, I'd suggest picking a target machine (say
> qemux86-64) and then building diffutils on both an x86-64 based host
> and on an aarch64 host. Comparing the ptest package will probably
> result in a diff similar to the above, e.g.:
>
> build_triplet=C2=B7=3D=C2=B7aarch64-unknown-linux-gnu
>
> vs.
>
> build_triplet=C2=B7=3D=C2=B7x86_64-pc-linux-gnu
>
> in usr/lib/diffutils/ptest/tests/Makefile amongst other things. I
> suspect picking MACHINE=3Dqemuarm64 would have the same result.
>
> If that reproduces the issue, it would then be a case of iterating
> through the differnces and finding a way to reconcile the output so it
> is the same, independent of build host architecture.
>

Just a follow-up, as I did open a bug entry for this issue:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16376

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


