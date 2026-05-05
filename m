Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D66CD3427
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 12:35:56 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38058.1777984553307798899
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 05:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=YT+Q1XQu;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 34D114E42BB4;
	Tue,  5 May 2026 12:35:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E8F1E6053C;
	Tue,  5 May 2026 12:35:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C76FD11AD0127;
	Tue,  5 May 2026 14:35:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777984549; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BYe6wOHpvWYdW6rpCZGX938BCXth8hSMcWJ+N9nRlZQ=;
	b=YT+Q1XQud3sHh+Keb9KMFUtNNP76tYNBNcJnuZ4rIL1AmSVKZH9hcGK/SPsLHd5TVDD+Cr
	wNrDtR+cPHMyZJEU1K2MUlCpW0rhAT4H4sMLJHWXmLwXu6KmzqdJDrZbUwUAPP5EaN+jxV
	5NI07OV5uObC/wJGKcCsQ7OTkpF+dhGaw3lgpuQVisL5z5wGjj0exMTagTHv84gayYS41Y
	agF5QW7MbBy52r4F8JJM4xTGFOzgKhGrYGrdN3nPmuozC20qy7xUnqO21kurs9XWMfI3sS
	rux1Wv1guoHYaX5q2yGX6EfLkDWo0vJ3JL8E+gbO3GO3KM1Fc/g8A6yNi9xqtw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 May 2026 14:35:48 +0200
Message-Id: <DIAQX5FG0NQM.N1ZBG0K7VW7W@bootlin.com>
Subject: Re: [OE-core] [PATCH v3 1/2] oelib: add unit tests for kernel
 module detection helpers
Cc: <richard.purdie@linuxfoundation.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <sam.john.kent@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260428081046.1660101-1-sam.john.kent@gmail.com>
 <20260429124524.2890648-1-sam.john.kent@gmail.com>
In-Reply-To: <20260429124524.2890648-1-sam.john.kent@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 12:35:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236488

On Wed Apr 29, 2026 at 2:45 PM CEST, Sam Kent via lists.openembedded.org wr=
ote:
> Add tests for the filename pre-filter logic, is_kernel_module(), and
> is_kernel_module_signed() to meta/lib/oeqa/selftest/cases/oelib/
>
> Signed-off-by: Sam Kent <sam.john.kent@gmail.com>
> ---

Hi Sam,

Now I remember why I had your patch flagged.

This is triggering a fail in another test, as can be seen on the
autobuilder:

2026-05-05 09:36:25,307 - oe-selftest - INFO - pkgdata.OePkgdataUtilTests.t=
est_lookup_recipe (subunit.RemotedTestCase)
2026-05-05 09:36:25,307 - oe-selftest - INFO -  ... FAIL
...
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/pkgdata.py", line 62, in test_looku=
p_recipe
    self.assertEqual(result.output, 'zlib\nbusybox')
  File "/usr/lib/python3.12/unittest/case.py", line 885, in assertEqual
    assertion_func(first, second, msg=3Dmsg)
  File "/usr/lib/python3.12/unittest/case.py", line 1251, in assertMultiLin=
eEqual
    self.fail(self._formatMessage(msg, standardMsg))
  File "/usr/lib/python3.12/unittest/case.py", line 715, in fail
    raise self.failureException(msg)
AssertionError: 'zlib' !=3D 'zlib\nbusybox'
  zlib
+ busybox

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3792
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3665

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


