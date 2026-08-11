Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F05C5CFCF
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 08:41:22 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50425.1786437678881627874
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 01:41:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=nIgRrbUr;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C217D4E4119A;
	Tue, 11 Aug 2026 08:41:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 965CA6033C;
	Tue, 11 Aug 2026 08:41:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7DDC011C4BC1C;
	Tue, 11 Aug 2026 10:41:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786437672; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0I/ldhAmrVCneOpDs6/k+F6a5qONhbj7rte20L2s1XA=;
	b=nIgRrbUrZBbNA3bDoc1TS0lu4KSd7fJaqPGskG1RdgflqMnm9mLXpbvv7I4ai3gpDhed8F
	OZ1+XHjM7bcht/v45GsVfmKuujgSlLFTKIEPXB4mhZp2/II1XQpW7rBr8IRY4Sf489/J0U
	6Oumi/s7pSdzd2jHM7+6Kah2kIRijOUe3dpbkue77DX0Dos5+J1dvB18LsUdOsmZcLEBHB
	nwMrlwAf2QEFrMXJhUA+j5+CXxDLqic9bH19U3ky1Ha1eFhJZ0txhULqKyOflATqabyzB4
	RJfUmWUKBZ6Bt+Lo889vOfBjLydraazTfcSoiYNwERfM1he59NbTJPFWum4Vuw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 10:41:10 +0200
Message-Id: <DKLZAWF7WFS1.J8B4FGVB5AT3@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <adrian.freihofer@siemens.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 4/8] oe-selftest: devtool ide-sdk: wait for
 gdbserver readiness
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260809093629.3457107-1-adrian.freihofer@siemens.com>
 <20260809093629.3457107-5-adrian.freihofer@siemens.com>
In-Reply-To: <20260809093629.3457107-5-adrian.freihofer@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 08:41:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243173

On Sun Aug 9, 2026 at 11:35 AM CEST, Adrian Freihofer via lists.openembedde=
d.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>
> Replace the fixed delay and process-list probe for GDB background tasks
> with a wait for the readiness marker generated in tasks.json. This
> verifies the same background-task contract VS Code uses before starting
> the debugger session.
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---

Hi Adrian,

I know you already discussed the issue with Richard, just adding a
comment here to keep a trace of the issue.

Before this patch we had intermittent failures of the
devtool.DevtoolIdeSdkTests.test_devtool_ide_sdk_code_cmake and
devtool.DevtoolIdeSdkTests.test_devtool_ide_sdk_code_meson tests.
Starting with this patch, the same tests are always failing:

2026-08-11 08:17:37,903 - oe-selftest - INFO - devtool.DevtoolIdeSdkTests.t=
est_devtool_ide_sdk_code_cmake (subunit.RemotedTestCase)
2026-08-11 08:17:37,904 - oe-selftest - INFO -  ... FAIL
...
2026-08-11 08:17:37,904 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 3655, in test_dev=
tool_ide_sdk_code_cmake
    self._verify_launch_json_debugging(tempdir, qemu, example_exe)
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 3527, in _verify_=
launch_json_debugging
    self._verify_launch_config(tempdir, config, tasks, qemu, example_exe,
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 3598, in _verify_=
launch_config
    self.assertTrue(
  File "/usr/lib/python3.11/unittest/case.py", line 715, in assertTrue
    raise self.failureException(msg)
AssertionError: False is not true : gdbserver did not report readiness on p=
ort 1234

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4529

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


