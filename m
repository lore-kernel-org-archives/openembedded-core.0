Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CF0EC5DF70
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 05:41:42 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2861.1787031698955603741
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 22:41:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=pwwbny8c;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4728D4E4129F;
	Tue, 18 Aug 2026 05:41:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 153ED60355;
	Tue, 18 Aug 2026 05:41:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 363EA11C747AE;
	Tue, 18 Aug 2026 07:41:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787031692; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cCxGHIGmQchZrzI8EFkgYAkpjh023YBVFtzraULCCA0=;
	b=pwwbny8cfQ1dtKQ9RPc3Oo9M67KxiCExKdpJ2olKECHJcxN2C9ab3gh/OhFpQ64Tx37e1l
	Ic6AQHbfRtn4xWA2t4wml6u89p1wCBHRxFGu/RRED8vlvZg1dzToOLsGHhxUEu4EGx+JCm
	CmQscoxd0G6ZW59H9bRXrHSbZahKas50BWJLU04YimlctyUEANTY2wv+YjWCPF7nxWMWhY
	EET3w5R88xu4OKgRUV8t/62znsOPEy+1F8Q2HQ/ron5vSVO9rwwCTkOGPDqJPv12BEzES/
	DTj1Lv7unILtD8IYvzUSeNIoSbBJGaBSmFg2ZTWPDz16v3vt8bYnsbSgl7oivg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Aug 2026 07:41:31 +0200
Message-Id: <DKRTV5U1BHN9.HQCPRH7UP91N@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <adrian.freihofer@siemens.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 00/14] devtool: ide-sdk: robust attach-mode
 debugging and test cleanup
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260816194127.86607-1-adrian.freihofer@siemens.com>
In-Reply-To: <20260816194127.86607-1-adrian.freihofer@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 05:41:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243650

On Sun Aug 16, 2026 at 9:40 PM CEST, Adrian Freihofer via lists.openembedde=
d.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>
> This series improves devtool ide-sdk's remote-debugging workflow, focusin=
g
> on GDB's attach mode, and cleans up the corresponding selftests.
>
> - Attach-mode debugging
>   The old ATTACH mode started gdbserver with "--attach :<port> $(pidof
>   <binary>)" under a plain cppdbg "launch" request - the classic attach
>   setup, which is fragile and hits several long-standing, unfixed
>   cpptools bugs (e.g. microsoft/vscode-cpptools#4166).
>   Switch to attaching over the extended-remote protocol instead, merging
>   ATTACH into the same persistent "gdbserver --multi" server already used
>   for MULTI mode.
>
>   Until microsoft/vscode-cpptools#14684 is merged, this has one downside
>   (one reason extended-remote attach wasn't used before): the user is
>   prompted to pick the process to attach to instead of it being selected
>   automatically. This is temporary, and the new setup is otherwise more
>   robust.
>
> - Selftest cleanup
>   - Progressively move the ide-sdk and deploy selftests from raw
>     SSH/process-list probing over to the QEMU target command API
>   - Replace fixed-delay/process-probe waits with proper readiness-marker
>     waits
>   - Add attach-mode debug workflow verification with an explicit,
>     documented execution order to avoid Build-ID mismatches from
>     once/deploy side effects.
>   - Adds parallel test classes per toolchain/build-system (gcc/clang,
>     cmake/meson).
>
> - Other fixes
>   - devtool deploy-target: avoid spurious tar "timestamp in the future"
>     warnings when the target clock lags the host.
>   - devtool ide-sdk: fix meson IntelliSense for the gcc toolchain
>   - cpp-example/ccp-example test fixture robustness fixes for compiler
>     optimization and PID file handling.
>   - devtool ide-sdk: default to all modified recipes when none is given
>     explicitly.
>

Hi Adrian,

Thanks for your patches.

It looks like this is breaking the test_devtool_ide_sdk_code_cmake and
test_devtool_ide_sdk_code_meson tests:

2026-08-17 18:52:37,603 - oe-selftest - INFO - devtool.DevtoolIdeSdkGccTest=
s.test_devtool_ide_sdk_code_cmake (subunit.RemotedTestCase)
2026-08-17 18:52:37,604 - oe-selftest - INFO -  ... FAIL
...
2026-08-17 18:52:37,604 - oe-selftest - INFO - 12: 2/73 132/766 (599.78s) (=
0 failed) (devtool.DevtoolIdeSdkGccTests.test_devtool_ide_sdk_code_cmake)
2026-08-17 18:52:37,604 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 3752, in test_de=
vtool_ide_sdk_code_cmake
    self._verify_launch_json_debugging(tempdir, qemu, example_exe)
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 3537, in _verify=
_launch_json_debugging
    self._verify_launch_config(tempdir, config, tasks, qemu, example_exe,
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 3695, in _verify=
_launch_config
    self.assertTrue(
  File "/usr/lib/python3.12/unittest/case.py", line 727, in assertTrue
    raise self.failureException(msg)
AssertionError: False is not true : gdbserver did not report readiness on p=
ort 1234
...
2026-08-17 19:01:08,838 - oe-selftest - INFO - devtool.DevtoolIdeSdkGccTest=
s.test_devtool_ide_sdk_code_meson (subunit.RemotedTestCase)
2026-08-17 19:01:08,838 - oe-selftest - INFO -  ... FAIL
...
2026-08-17 19:01:08,840 - oe-selftest - INFO - 12: 3/73 263/766 (511.24s) (=
2 failed) (devtool.DevtoolIdeSdkGccTests.test_devtool_ide_sdk_code_meson)
2026-08-17 19:01:08,840 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 3809, in test_de=
vtool_ide_sdk_code_meson
    self._verify_launch_json_debugging(tempdir, qemu, example_exe)
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 3537, in _verify=
_launch_json_debugging
    self._verify_launch_config(tempdir, config, tasks, qemu, example_exe,
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 3695, in _verify=
_launch_config
    self.assertTrue(
  File "/usr/lib/python3.12/unittest/case.py", line 727, in assertTrue
    raise self.failureException(msg)
AssertionError: False is not true : gdbserver did not report readiness on p=
ort 1234

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4632
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4581
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4401

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


