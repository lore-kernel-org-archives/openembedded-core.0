Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0DEBC5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 18:17:13 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.14731.1749147430609704296
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 11:17:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=U3u6P/Uq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D54481FCEF;
	Thu,  5 Jun 2025 18:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749147428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2YMiaStFLn0rLQSDFRegs+gznj2vX+bEF5IAukjuYxM=;
	b=U3u6P/UqRyaJ8mazlm5PYxKo6H7NqQmpOMxkX7EpLh3oLqTo/iFcfpmeto954u3rFmaVi6
	o0BTxYoYkQnEz1lkWfDyPIzlXjoIdMVaGBmxSzD47nHV1NlKyEXhoc3Lsoy2La0BEVzkzz
	0jF1FstPUTWAq1a/7IRctgsVgn4FDhMXDot8Z8FcRWY++D/gYBGMVz+dJviSwpWVoHfM3E
	j2x03zPFEsLuEwuK9xXGORaSuK12vJ8bwWXFk3StafV4uogXbaGc1kpk60sznvpIi/8718
	oZASyVKIj0+DYNn32R5nN/McJ65qjojr32HWTv8Su+HdBG1kxgQisCUETpeyvg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Jun 2025 20:17:06 +0200
Message-Id: <DAET0ITMMXA6.6EQ7Q81PC9XH@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 4/4] oeqa/selftest: add test case for
 oeqa.utils.subprocesstweak
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250604140326.2214919-1-ross.burton@arm.com>
 <20250604140326.2214919-4-ross.burton@arm.com>
In-Reply-To: <20250604140326.2214919-4-ross.burton@arm.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdefleekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtgfeuvdfghfegtdehvdegvefhkeegheeikeelfeefffetheeitdduudeludduleenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdduvddruddthedrudehtddrvdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvuddvrddutdehrdduhedtrddvhedvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhoshhsrdgsuhhrthhonhesrghrmhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 18:17:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218078

On Wed Jun 4, 2025 at 4:03 PM CEST, Ross Burton via lists.openembedded.org =
wrote:
> This class has a monkey-patched CalledProcessError instance that extends
> the __str__ method. Add a test case to ensure that it behaves as
> expected.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Hi Ross,

I believe we have an issue with this series on selftests:

2025-06-05 11:58:18,605 - oe-selftest - INFO - setUpClass (liboe.CopyTreeTe=
sts) [ (subunit.RemotedTestCase)
2025-06-05 11:58:18,606 - oe-selftest - INFO -  ... ERROR
...
2025-06-05 11:58:18,606 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/=
core/case.py", line 39, in _oeSetUpClass
    clss.setUpClassMethod()
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/=
selftest/cases/liboe.py", line 16, in setUpClass
    super(LibOE, cls).setUpClass()
          ^^^^^
NameError: name 'LibOE' is not defined

https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/1644
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/1703
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1853

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


