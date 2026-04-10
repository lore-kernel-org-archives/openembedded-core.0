Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B663CF44869
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 13:39:03 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.156360.1775828341131196666
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 06:39:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qP29xtJx;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0C62CC5C1A1
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 13:39:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C7BC4603F0;
	Fri, 10 Apr 2026 13:38:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C2FD31045001A;
	Fri, 10 Apr 2026 15:38:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775828338; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3cVXCcYxuvY8iaaPfB4vbfgocTD3rfLUOE8skigdvrs=;
	b=qP29xtJxPc11FliUxZzCrzd2JMrJ9w+WPmf8bUeiWbj7k4WUlFzIrWjKxdcvUA0mdgjqoh
	3jEr1cIDFxZlZIB7D+NV5uCCDR93BrvCyaiPR60+jHIZx9DaLMbf3nytxXZQn1aJ30v5dt
	qm1vanJbLOMqGsys2a6DAU53RVDcJ68TqdiISS9q8xKetAT1UCyZBCS2Cdrt902kKJ8FMa
	SPMaZHpYYAy953OGzG0AaCI7sepQnNtZ2Fci9rEigLXxvXsPFGW5sq90Em+RMxlov7CtMY
	ugjqDmbOsh1zUUFzOy61Je/l+ngWQDVITgqdG7Vn1fQ191XaTIb+P3bfBE0RqA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Apr 2026 15:38:54 +0200
Message-Id: <DHPILUGFBYND.3S81A028WPCOE@bootlin.com>
Subject: Re: [OE-core] [PATCH] db: Pin to use C99 std
Cc: "Khem Raj" <khem.raj@oss.qualcomm.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <richard.purdie@linuxfoundation.org>, <raj.khem@gmail.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260408044737.696968-1-khem.raj@oss.qualcomm.com>
 <c8e3d16047191a697c26bfdfd7885fa8f560a7dc.camel@linuxfoundation.org>
In-Reply-To: <c8e3d16047191a697c26bfdfd7885fa8f560a7dc.camel@linuxfoundation.org>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 13:39:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235030

On Fri Apr 10, 2026 at 3:15 PM CEST, Richard Purdie via lists.openembedded.=
org wrote:
> On Tue, 2026-04-07 at 21:47 -0700, Khem Raj via lists.openembedded.org wr=
ote:
>> GCC-15 has switched to using C23 by default, we have been selectively
>> disabling warnings as errors to get by, however with autoconf 2.72 addin=
g
>> -std=3Dgnu23 it now gets enabled for every compiler and clang-22 is more
>> obidient and has dropped support for K&R C completely. db5 code has a lo=
t
>> of K&R C prototypes and it starts to fail vigorously. We can not keep
>> working around with out uplifting sources to be compliant with newer C
>> standard like C23.
>>=20
>> Therefore pin the cflags to use C99 standard as this package expects.
>>=20
>> Drop the code to disable warnings as errors selectively.
>>=20
>> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
>> ---
>> =C2=A0meta/recipes-support/db/db_5.3.28.bb | 9 ++++-----
>> =C2=A01 file changed, 4 insertions(+), 5 deletions(-)
>
> This seemed to trigger failures for me, e.g.:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/3538#b=
b-step-15
>
> Cheers,
>
> Richard

This is because the patch is touching lines ending with spaces, and
these spaces have not been kept in the mail.

I tweaked the patch to make it work correctly, it landed in my -success
branch.

Thanks,
Mathieu


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


