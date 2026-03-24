Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73070FEC0E8
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 17:22:45 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2844.1774372959252731038
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 10:22:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=zuHSm93U;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 14A16C5809B
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 17:23:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9A11C601A0;
	Tue, 24 Mar 2026 17:22:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 490951045059C;
	Tue, 24 Mar 2026 18:22:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774372956; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HOLnhGG0Uvs1KCWWXp0dx/wH6yBknjibDosguumu0eY=;
	b=zuHSm93UipVY4Wl3HMOKi6G7y1ojVFQrK9265M+mffhS95AgZQJSe1/qz3shZAxjV/avl1
	cehmMx74sQv7LBJPK8Iyv1HbAikUIJPmzamhp5cknnDlb10J6BiHUc/RKNfg44LMevL1E2
	TjHK7CP/RFvDMJg3S1qFgqWSgF/yg8xKlmP7yXm17xb0LYE24fhhp2r0oE6tv4Xw32Hz+j
	ktYSYq6S2ys6ZAg+nC8n0ZCe2VGlOfJGWsD3vxC6x4+sRlKNEJnwuWhy3Luo90UKGu3vcu
	jV65Zi5E0DjJcKANfUF5H3v5YP2lnUzImfbK5Y415et1Df3QEenqwjliMojjRQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Mar 2026 18:22:34 +0100
Message-Id: <DHB6PUB4HG73.2D0X4F8KV6N7K@bootlin.com>
To: <adrian.freihofer@siemens.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 9/9] oe-selftest: devtool ide-sdk: add
 clang/LLDB test
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260322151320.661246-1-adrian.freihofer@siemens.com>
 <20260322151320.661246-10-adrian.freihofer@siemens.com>
In-Reply-To: <20260322151320.661246-10-adrian.freihofer@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 17:22:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233820

On Sun Mar 22, 2026 at 4:13 PM CET, Adrian Freihofer via lists.openembedded=
.org wrote:
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

I believe the added test is failing on the autobuilder:

2026-03-24 13:25:52,674 - oe-selftest - INFO - devtool.DevtoolIdeSdkTests.t=
est_devtool_ide_sdk_code_cmake_clang (subunit.RemotedTestCase)
2026-03-24 13:25:52,674 - oe-selftest - INFO -  ... FAIL
...
2026-03-24 15:55:22,676 - oe-selftest - INFO - FAIL: devtool.DevtoolIdeSdkT=
ests.test_devtool_ide_sdk_code_cmake_clang (subunit.RemotedTestCase)
2026-03-24 15:55:22,676 - oe-selftest - INFO - ----------------------------=
------------------------------------------
2026-03-24 15:55:22,676 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 3864, in test_de=
vtool_ide_sdk_code_cmake_clang
    self._lldb_server_debugging_once(tempdir, qemu, recipe_name,
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                                     DevtoolIdeSdkTests.MAGIC_STRING_ORIG)
                                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 3805, in _lldb_s=
erver_debugging_once
    r =3D runCmd(lldb_batch, output_log=3Dself._cmd_logger)
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/layers/openem=
bedded-core/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%=
s" % (command, result.status, exc_output))
...
(lldb) b main
Breakpoint 1: where =3D cmake-example-clang`main + 48 at cpp-example.cpp:19=
:5, address =3D 0x0000000000001750
(lldb) run
/tmp/lldb_server_1234_usr-bin-cmake-example-clang_multi/cmake-example-clang=
: error while loading shared libraries: libcmake-example-clang-lib.so.1: ca=
nnot open shared object file: No such file or directory
Process 335 launched: '/srv/pokybuild/yocto-worker/oe-selftest-armhost/buil=
d/build-st-2935310/tmp/work/cortexa57-poky-linux/cmake-example-clang/1.0/im=
age/usr/bin/cmake-example-clang' (aarch64)
Process 335 exited with status =3D 127 (0x0000007f)
(lldb) continue
error: Process must be launched.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3606
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3389

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


