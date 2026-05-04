Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEBE2CD3423
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 08:02:04 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10056.1777881721488886050
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2026 01:02:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=rpUVqbdp;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B13CEC5D72E
	for <openembedded-core@lists.openembedded.org>; Mon,  4 May 2026 08:02:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6A12F602AC;
	Mon,  4 May 2026 08:01:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7EF7611AD22FD;
	Mon,  4 May 2026 10:01:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777881715; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hI8OWWMWJvJvC353xnqiyhTTMBRLMsgB9Z5cZn3gLzY=;
	b=rpUVqbdpDRejvUv55ZOZBu2LaVUKg/k2kTe+Gx4Sf+KvJhLIRVwBFhE+7PBfauL87puiKG
	2FzwKwOKyimks91QmajmW3TIUnzrOX65cXFmbF1xEzhU4c5IIb1pUCOgCSr3LzLhEdeXW5
	e/SN7IYDVf1XfyDRjBFwBAMTqVwnIkGfX/FPiUHSZLTecj9Detjp568rjNNO50/NjdU1dd
	1WIhn0P895qe7NbcqrS0ts7pnVn9oHbH+umT4f8fJHAABcgscdAKV7hIbQuS4iTgkFAjHK
	rDBmBrrW1rt071/FzLWUKtoen3CbZoOCPdSceWhOT5HkslnrW2a4uqCRngg2xA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 May 2026 10:01:54 +0200
Message-Id: <DI9QGW5FGCKG.1GUIR0JJFC361@bootlin.com>
To: <sam.john.kent@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3 2/2] oeqa/selftest: add oe-selftest for
 kernel module pre-filter
Cc: <richard.purdie@linuxfoundation.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260428081046.1660101-1-sam.john.kent@gmail.com>
 <20260429124524.2890648-1-sam.john.kent@gmail.com>
 <20260429124524.2890648-2-sam.john.kent@gmail.com>
 <DI9QF8RCYOPJ.I433OB527RZU@bootlin.com>
In-Reply-To: <DI9QF8RCYOPJ.I433OB527RZU@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 May 2026 08:02:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236436

On Mon May 4, 2026 at 9:59 AM CEST, Mathieu Dubois-Briand wrote:
> On Wed Apr 29, 2026 at 2:45 PM CEST, Sam Kent via lists.openembedded.org =
wrote:
>> Add selftest-ko-filter recipe and a PackageTests.test_kmodule_prefilter
>> oe-selftest that builds it to verify process_split_and_strip_files()
>> handles .ko.xz/.ko.gz alongside a real .ko without corrupting them.
>> Regression test for YOCTO #2348.
>>
>> AI-Generated: Uses Claude Sonnet 4.6
>>
>> Signed-off-by: Sam Kent <sam.john.kent@gmail.com>
>> ---
>
> Hi Sam,
>
> Thanks for your patch.
>
>> diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/sel=
ftest/cases/package.py
>> index 38ed717..d33424b 100644
>> --- a/meta/lib/oeqa/selftest/cases/package.py
>> +++ b/meta/lib/oeqa/selftest/cases/package.py
>
> I have some trouble to find a version with this patch in. Are you based
> on the master branch?
>
> Thanks,
> Mathieu

Ignore this, Monday morning, I just messed up my patch apply.

Sorry for the noise.


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


