Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0C47C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 08:18:02 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16124.1782807478806591603
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 01:17:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ukGZAKKF;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C9EDBC51473;
	Tue, 30 Jun 2026 08:18:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3081E60233;
	Tue, 30 Jun 2026 08:17:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 471C2106F1CBE;
	Tue, 30 Jun 2026 10:17:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782807475; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4DW0/sGvH1ktfgnCKo8qlxRhTLNBaPRbUi1PM/ymdrQ=;
	b=ukGZAKKFeIVh9FfFU1bZAZqVs08t1POFyfTbzwxv+6Byh2uvwOwlmIWB5bamPd3jIYsxWt
	8mCSOKXfskcMQLrMI92vePNL7aNEkM0SL3nnIqFxbWPRdHEX4srhO4ImSdFU2eBau14Soe
	e2LjiX9+vOvmrEbLItFpZmL6nXW2kBgS2iTykwguklwH1PgNA7M1KxSWoyHF+zxS/kLP3h
	+mDYlmVovvLnb548eq3zmJbUwBhv1NM12avOB4cOkHFb5jUaAwMmhJWyl1OeR9gelgqwxz
	gJy1M9Pyg6pjqFZ/f8aM133nUfR9SzFHpMysjLGDhZXOonykzaQcK+FoanQfyw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Jun 2026 10:17:54 +0200
Message-Id: <DJM8I70PCCB1.3GWRSQAJKNDNE@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Moritz.Haase@bmw.de>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] json-c: upgrade 0.18 -> 0.19
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260629061229.702229-1-Moritz.Haase@bmw.de>
In-Reply-To: <20260629061229.702229-1-Moritz.Haase@bmw.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 08:18:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239866

On Mon Jun 29, 2026 at 8:12 AM CEST, Moritz Haase via lists.openembedded.or=
g wrote:
> Release notes are available at [0].
>
> [0]: https://github.com/json-c/json-c/blob/json-c-0.19/ChangeLog
>
> Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
> ---

Hi Moritz,

Thanks for your patch.

It looks like the upgrade is breaking the ptests:

Failed ptests:
{'json-c': ['test_json_parse_cli.test']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3927
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3941
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/624

Ptest logs can be found here:

https://valkyrie.yocto.io/pub/non-release/20260630-46/testresults/qemuarm64=
-ptest/core-image-ptest-json-c/
https://valkyrie.yocto.io/pub/non-release/20260630-46/testresults/qemux86-6=
4-ptest/core-image-ptest-json-c/
https://valkyrie.yocto.io/pub/non-release/20260630-46/testresults/qemux86-6=
4-musl-ptest/core-image-ptest-json-c/

I can see at least this line in the logs;

FAIL: test_json_parse_cli.test

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


