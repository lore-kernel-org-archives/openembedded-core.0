Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D343CD6E4A
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:52:16 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22024.1780397524766984368
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:52:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=jrnBo7Pm;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 77CA11A37C8
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jun 2026 10:52:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3D33C603BC;
	Tue,  2 Jun 2026 10:52:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F0C8B1088838A;
	Tue,  2 Jun 2026 12:52:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780397521; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=88OG7Km1ZHWIuHkBFSkc7hqDgfuW9JcOT9JLXXxVWTg=;
	b=jrnBo7PmfYgRtxOUP9BKxfd2oXf5m6OYW5qCdSpNhjBLHhX9xvSGyvR+hGr8aSsxvvMDqy
	9HEF9+JMbZkJoBcB04oP6xE4qtAyPTfiBSg2tUB3uLvYP8eQKToOIwFebby7+RER4dtn9u
	UhgmkNNe4ftng+UO2SOYRf7l8heM7lCuqLSqfvuWZeNZrPhNNVZBNA1oVcPZwXheBnnr4k
	K/f0tmaVj3WA/NP+t0g+X2Ih1xMr4+SxsbqOr/8jQQGt+r0i/vqI/7sTNImrD6x9XiZRf+
	tseZq7KoIv/cJP0W6u9O1ROJVF2kL9bk/AB0BhLM+F0+J2EEuuFmxX/f/pE7zg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 12:52:00 +0200
Message-Id: <DIYI8XKVRZOJ.1G01NTJUT1HQT@bootlin.com>
Subject: Re: [OE-core][master][PATCH] rsync: add ptest support
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <nikhilar2410@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260601165658.4086416-1-nikhilar2410@gmail.com>
In-Reply-To: <20260601165658.4086416-1-nikhilar2410@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 10:52:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238029

On Mon Jun 1, 2026 at 6:56 PM CEST, nikhil via lists.openembedded.org wrote=
:
> Package the upstream rsync testsuite and helper binaries
> into rsync-ptest package and add a run-ptest wrapper for
> executing the tests.
>
> backup.test is skipped due to intermittent failures
> observed on qemux86-64.
> The issue has been reported upstream:
>
> https://github.com/RsyncProject/rsync/issues/941
>
> Tested on qemux86-64 using ptest-runner with all
> executed tests passing.
>
> Signed-off-by: Nikhil R <nikhilar2410@gmail.com>
> ---

Hi Nikhil,

Thanks for your patch.

It looks like the execution is failing on the autouilder, because of a
missing python module:

Failed ptests:
{'rsync': 'START: ptest-runner\n'
          '2026-06-02T09:44\n'
          'Traceback (most recent call last):\n'
          '  File "/usr/lib/rsync/ptest/runtests.py", line 26, in <module>\=
n'
          '    import concurrent.futures\n'
          "ModuleNotFoundError: No module named 'concurrent'\n"
          '\n'
          'ERROR: Exit status is 1\n'
          'DURATION: 2\n'}

ptests which had no test results:
['rsync']

https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1671
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3735
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3754
https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/485
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/469

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


