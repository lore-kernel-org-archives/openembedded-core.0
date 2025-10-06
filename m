Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E08CAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 13:15:49 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.33616.1759756544090178697
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Oct 2025 06:15:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vv4h2OxQ;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DAEFDC085C9
	for <openembedded-core@lists.openembedded.org>; Mon,  6 Oct 2025 13:15:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 15E55606B7;
	Mon,  6 Oct 2025 13:15:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D9559102F1CFB;
	Mon,  6 Oct 2025 15:15:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759756541; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jSq1sBX0kkh2adGPJ3u+81JdNWDM0OWqb4DGfRevAYU=;
	b=vv4h2OxQIGp0tLv4tpx/SWsuxgnUdJhSd0GFWBB/uUlCkF2fY23ObhmCUkt7DpqJBp6MGT
	lsB3XLIW3QjOkSqL03MJdeShcALRj8CBc/L4st43GzU7vzh6FrWFEupGKwP0gfnkaSTf8g
	9UeVeZzSPFUUxE/Xuq7q/rFXd2Q6Y94PMcMEo4djYtCSCrTmr7xHOg2OmtXYG7KV0wFMcb
	/IjkiYaap9YoG3/KGp/33RQ0rICPHMzNKkEEStwdWIh6ZPdvrXXJ3jn5iOruc+mDc4VzIo
	jmRdXys4DtPbPjusl+FooGQ+BIrJ/W3ZKYgaDnb0Di6HfP/ZH4H+r6C+tKpIug==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Oct 2025 15:15:35 +0200
Message-Id: <DDB9MO32YX86.1CN25MX8X22TM@bootlin.com>
Subject: Re: [OE-core] [PATCH 0/4] devtool ide-sdk improvements for
 bitbake-setup
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <adrian.freihofer@siemens.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251005220047.4101591-1-adrian.freihofer@siemens.com>
In-Reply-To: <20251005220047.4101591-1-adrian.freihofer@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Oct 2025 13:15:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224483

On Mon Oct 6, 2025 at 12:00 AM CEST, Adrian Freihofer via lists.openembedde=
d.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>
> This patch series contains some improvements for the devtool ide-sdk
> command, hopefully fixing the issues when oe-selftest runs in an
> environment setup by bitbake-setup.
>
>
> Adrian Freihofer (4):
>   devtool: ide_sdk: trivial alphabetical reorder
>   devtool: ide-sdk: use /bin/sh instead of /bin/bash
>   devtool: ide_sdk: pass BITBAKEDIR to oe-init-build-env
>   oe-selftest: devtool: DevtoolIdeSdkTests debug logging
>
>  meta/lib/oeqa/selftest/cases/devtool.py | 101 +++++++++++++++---------
>  scripts/lib/devtool/ide_sdk.py          |  15 ++--
>  2 files changed, 72 insertions(+), 44 deletions(-)

Hi Adrian,

Thanks for your patch.

It looks like this is breaking some selftest:

2025-10-06 10:48:45,495 - oe-selftest - INFO - 11: 6/35 355/639 (145.89s) (=
0 failed) (devtool.DevtoolIdeSdkTests.test_devtool_ide_sdk_shared_sysroots)
2025-10-06 10:48:45,496 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/=
selftest/cases/devtool.py", line 2953, in test_devtool_ide_sdk_shared_sysro=
ots
    result_cmake =3D runCmdEnv("which cmake", cwd=3Dtempdir_cmake,
                             output_log=3Dself._cmd_logger)
TypeError: DevtoolIdeSdkTests.test_devtool_ide_sdk_shared_sysroots.<locals>=
.runCmdEnv() got an unexpected keyword argument 'output_log'

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/2482
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/2395

Can you have a look at this?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


