Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DFE6C43327
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 11:28:29 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42567.1782905298854633418
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2026 04:28:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=KanzyzLS;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8C031C79ABF
	for <openembedded-core@lists.openembedded.org>; Wed,  1 Jul 2026 11:28:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7C5F260288;
	Wed,  1 Jul 2026 11:28:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 85504104C9E41;
	Wed,  1 Jul 2026 13:28:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782905295; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p0m8j0IQddi98OkRxvg57aClss++3fqrEB+FXvdezn0=;
	b=KanzyzLSB7RauK/WyqQc7cTJhJz7LMc6eEB70QDg+Z4RL0ujJEjDyHb+82KDT2GUWDVto8
	AB2wAoO7vbH4QYiI07M7ibbM5ws51p1H7x/7qDkSKxlDydho9PKJdN8iPsGeqk6MghCOw5
	jYhLKLFJo3qBFTerysTUMBicZbcsh3ejDmcfj+/LGKTEfLMp7va3SI3gu86dzG8DPh30Gl
	LkMxOriziReg/IzPPIjjdnzbbO+wOKHIW/3dmw0WKvxpkSh9r2gnkbIfSjiawkkudWiVjm
	yuRDsw47nrE9zU+euQzK/XJtGz5N9YPilC5EJ3FrIm+cfO3/757ImblhtcJDKg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Jul 2026 13:28:13 +0200
Message-Id: <DJN76GVF0HS6.3OSE79EMVNASR@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/3] classes/insane: increase shebang size
 limit
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260630140800.4018491-1-ross.burton@arm.com>
In-Reply-To: <20260630140800.4018491-1-ross.burton@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jul 2026 11:28:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239976

On Tue Jun 30, 2026 at 4:07 PM CEST, Ross Burton via lists.openembedded.org=
 wrote:
> Since Linux 5.1 the shebang buffer has been 256 bytes[1], so update the
> check to match.
>
> Also rewrite the test, create a variable for the magic number (that has
> the same name as the kernel #define), don't pointlessly try to decode
> the bytes as UTF-8, and consolidate the test logic to entirely inside
> the try block.
>
> [1] linux 6eb3c3d0a52dc ("exec: increase BINPRM_BUF_SIZE to 256")
> ---

Hi Ross,

Thanks for your patch.

I believe you also need to update the test_sysroot_max_shebang selftest
/ sysroot-shebang-test-native recipe:

2026-07-01 11:25:35,511 - oe-selftest - INFO - FAIL: sysroot.SysrootTests.t=
est_sysroot_max_shebang (subunit.RemotedTestCase)
2026-07-01 11:25:35,511 - oe-selftest - INFO - ----------------------------=
------------------------------------------
2026-07-01 11:25:35,511 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/sysroot.py", line 49, in test_sysro=
ot_max_shebang
    self.assertTrue(expected in res.output, msg=3Dres.output)
  File "/usr/lib/python3.12/unittest/case.py", line 727, in assertTrue
    raise self.failureException(msg)
AssertionError: False is not true : NOTE: Reconnecting to bitbake server...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4183
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4010

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


