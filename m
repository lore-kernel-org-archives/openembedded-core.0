Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5508A109317F
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 07:12:51 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7113.1773990763745812166
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 00:12:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=J6DPUWws;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0C9B64E4272E;
	Fri, 20 Mar 2026 07:12:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CEC47600E0;
	Fri, 20 Mar 2026 07:12:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E57A510450B19;
	Fri, 20 Mar 2026 08:12:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773990761; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ssAww9TT7bPnZj6DfGXubS5lUX8tlpQhoPI5HDpmwiI=;
	b=J6DPUWwsDygI9JPHgY5qbXZp5lyaPO10tGQ2ET3oVlQiEQkh0TJG6wR6DoBueMwh2q5sNZ
	CjnkZAE+sbg4nkmI9QFnPgV+eKwctOM6CaUEdXzktGQMSp3/RgPe5iNywSN7iSBK501oOb
	0RVvjwyPXoRpA2u4FsSZvKM5Cn0K17IDKvlZsbmglUXaWL6aqsp19kRbJIFCNVTX2RcKAS
	UvMjF2+TYK1+ecRYWUjffLX72Vm8CTFRlAnPpLyH5H99CSMrHCgzbtd2A4C2dB3JPTkutq
	XUNvw0rC1ELYmvLbQPlopziCa0WmCSFY9HUnGJEWuFvRUHfmq7Rquum9KDBMnA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Mar 2026 08:12:40 +0100
Message-Id: <DH7F8OQYC7QP.23LPE0REKT1BC@bootlin.com>
To: <adrian.freihofer@siemens.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 9/9] oe-selftest: devtool ide-sdk: add
 clang/LLDB test
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260318223736.3414885-1-adrian.freihofer@siemens.com>
 <20260318223736.3414885-10-adrian.freihofer@siemens.com>
In-Reply-To: <20260318223736.3414885-10-adrian.freihofer@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 07:12:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233580

On Wed Mar 18, 2026 at 11:36 PM CET, Adrian Freihofer via lists.openembedde=
d.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>
> Add test_devtool_ide_sdk_code_cmake_clang to verify the full devtool
> ide-sdk workflow for a cmake recipe built with clang.  Unlike the gcc
> variant the clang recipe uses lldb-server for remote debugging and
> CodeLLDB (vadimcn.vscode-lldb) as the VS Code debug adapter.
>
> The test covers:
> - devtool modify + devtool ide-sdk with ide=3Dcode
> - cmake preset compilation and CTest execution (same as the gcc test)
> - extensions.json recommends vadimcn.vscode-lldb
> - launch.json uses "type": "lldb" (CodeLLDB) instead of "type": "cppdbg"
> - End-to-end lldb --batch remote debugging session via lldb-server
>   platform mode running on qemu
>
> Supporting changes:
> - _write_bb_config: accept optional extra_packages parameter so the
>   clang test can add lldb-server to IMAGE_INSTALL
> - _verify_launch_json_lldb: new helper that validates the CodeLLDB
>   launch.json structure (type, initCommands, program, cwd, preLaunchTask)
> - _lldb_server_debugging_once: new helper that reads the preLaunchTask
>   SSH command from tasks.json, starts lldb-server on the target, and
>   runs lldb --batch to verify a breakpoint at main is hit
> - _verify_service_running: use pgrep with exact regex (^name$) for exact
>   process name matching; without that, pgrep would also match
>   cmake-example-clang (truncated to 'cmake-example-c' in
>   /proc/pid/comm) when checking for cmake-example, returning two PIDs
>   and failing the isdigit() assertion
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---

Hi Adrian,

Thanks for your patch.

It looks like the added test_devtool_ide_sdk_code_cmake_clang test is
failing on the autobuilder:

2026-03-19 19:34:48,650 - oe-selftest - INFO - devtool.DevtoolIdeSdkTests.t=
est_devtool_ide_sdk_code_cmake_clang (subunit.RemotedTestCase)
2026-03-19 19:34:48,651 - oe-selftest - INFO -  ... FAIL
...
2026-03-19 19:34:48,651 - oe-selftest - INFO - 11: 3/39 214/681 (495.87s) (=
0 failed) (devtool.DevtoolIdeSdkTests.test_devtool_ide_sdk_code_cmake_clang=
)
2026-03-19 19:34:48,651 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 3862, in test_de=
vtool_ide_sdk_code_cmake_clang
    runCmd(install_deploy_cmd, output_log=3Dself._cmd_logger)
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%=
s" % (command, result.status, exc_output))
AssertionError: Command '/srv/pokybuild/yocto-worker/oe-selftest-armhost/bu=
ild/build-st-273901/workspace/ide-sdk/cmake-example-clang/scripts/install_a=
nd_deploy_cmake-example-clang-cortexa57' returned non-zero exit status 1:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3579
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3474
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3360

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


