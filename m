Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18A64C5DF7D
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 13:37:02 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9076.1787060215332394164
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 06:36:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=rNFxtbgw;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3916F4E41286;
	Tue, 18 Aug 2026 13:36:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0592760355;
	Tue, 18 Aug 2026 13:36:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AEDE411C705BF;
	Tue, 18 Aug 2026 15:36:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787060212; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qap5qkSX/vs9S3cdLX+o2dvFY3l/HTQJS8J+JUcefFQ=;
	b=rNFxtbgwn6XwpjESNe6UJQ9oSkoHkMveTBB7+g4vmsfgbDc+C5glvWSgBFHkVkgw6B9Qhs
	pUecX/FYyoM3Ma76PLM1xoHjJxCBvBfpsGRIIAzesrTrTlb+JNTGShos8Ma33grvQazsrl
	NcPBsV1/0Etl4YBRG4vblnWOvzVWTQdmFiZwfVlKhd5nL1GWj3hOKJPasCz0XJoPD3QaJ/
	Y3Xq98H26MyA7APGBPPeS5MDfXjOPAJNbYHywicNExAU87IjMi3NOSVKXoobfekqwJln6i
	JN1Deyyl8t+QM/xjgjhRNNmncAB9fFbC5MeddaV2D5BB1TziWzo6a+pQOMlFDA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Aug 2026 15:36:50 +0200
Message-Id: <DKS3Z3B1R1R1.2BDF7AREBCHBJ@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 00/14] devtool: ide-sdk: robust attach-mode
 debugging and test cleanup
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <adrian.freihofer@siemens.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260818063120.73042-1-adrian.freihofer@siemens.com>
In-Reply-To: <20260818063120.73042-1-adrian.freihofer@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 13:37:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243683

On Tue Aug 18, 2026 at 8:30 AM CEST, Adrian Freihofer via lists.openembedde=
d.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>
> Changes from v1 to v2:
>
> On autobuilder the the test_devtool_ide_sdk_code_cmake and
> test_devtool_ide_sdk_code_meson tests failed with:
>
> File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 3695, in _verify=
_launch_config
>     self.assertTrue(
>   File "/usr/lib/python3.12/unittest/case.py", line 727, in assertTrue
>     raise self.failureException(msg)
> AssertionError: False is not true : gdbserver did not report readiness on=
 port 1234
>
> Probably this could happen when the attach tests start a gdbserver and th=
en
> the once mode tests reuses the same port for gdbserver --once before the =
first
> gdbserver --multi released the port and terminated. This is fixed by usin=
g
> different ports for different debugging modes which can theoretically als=
o be
> used concurently.
>

Hi Adrian,

I'm sorry, but we still have failures on the same tests :(

2026-08-18 11:15:37,934 - oe-selftest - INFO - devtool.DevtoolIdeSdkGccTest=
s.test_devtool_ide_sdk_code_cmake (subunit.RemotedTestCase)
2026-08-18 11:15:37,938 - oe-selftest - INFO -  ... FAIL
...
2026-08-18 11:15:37,938 - oe-selftest - INFO - 12: 2/73 134/766 (398.86s) (=
0 failed) (devtool.DevtoolIdeSdkGccTests.test_devtool_ide_sdk_code_cmake)
2026-08-18 11:15:37,938 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 3759, in test_dev=
tool_ide_sdk_code_cmake
    self._verify_launch_json_debugging(tempdir, qemu, example_exe)
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 3543, in _verify_=
launch_json_debugging
    self._verify_launch_config(tempdir, config, tasks, qemu, example_exe,
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 3701, in _verify_=
launch_config
    self.assertTrue(
  File "/usr/lib64/python3.12/unittest/case.py", line 727, in assertTrue
    raise self.failureException(msg)
AssertionError: False is not true : gdbserver did not report readiness on p=
ort 1234:
...
2026-08-18 11:21:24,242 - oe-selftest - INFO - devtool.DevtoolIdeSdkGccTest=
s.test_devtool_ide_sdk_code_meson (subunit.RemotedTestCase)
2026-08-18 11:21:24,242 - oe-selftest - INFO -  ... FAIL
...
2026-08-18 11:21:24,242 - oe-selftest - INFO - 12: 3/73 280/766 (346.31s) (=
2 failed) (devtool.DevtoolIdeSdkGccTests.test_devtool_ide_sdk_code_meson)
2026-08-18 11:21:24,242 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 3816, in test_dev=
tool_ide_sdk_code_meson
    self._verify_launch_json_debugging(tempdir, qemu, example_exe)
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 3543, in _verify_=
launch_json_debugging
    self._verify_launch_config(tempdir, config, tasks, qemu, example_exe,
  File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 3701, in _verify_=
launch_config
    self.assertTrue(
  File "/usr/lib64/python3.12/unittest/case.py", line 727, in assertTrue
    raise self.failureException(msg)
AssertionError: False is not true : gdbserver did not report readiness on p=
ort 1234:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4410
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4590
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4640

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


