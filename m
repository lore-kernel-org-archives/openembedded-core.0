Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 729BBC2A09B
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 15:12:05 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44608.1786115523408799065
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2026 08:12:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=PqxPrWd6;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DD9A64E4113F;
	Fri,  7 Aug 2026 15:12:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B17DD603F0;
	Fri,  7 Aug 2026 15:12:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 391E011C37AA9;
	Fri,  7 Aug 2026 17:11:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786115520; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kBaPiP1O05x+efZc2976Suwvu/3mNpzobzo51lksBEk=;
	b=PqxPrWd6CfuVo2XjCDFFWEoBx3w9mcU7iig7u4jyhcLe0sAK6ON87jeLsdm2UpjZ+LClpC
	jKLcgC2UrwkfQjT57P9X5gnIOK3dqLvCx9jqDWP8I3cXxXHl0q3g8nvQPmceeiRdzwxo2x
	6DBiwQqoKalC62GDmuD7qSs8Yc0uqBHy5cknK3KAhyLk19b28udeALcyZ9GNjbnOM8CNJc
	VojEoA4wNnRJNTTtdQChBjYZUdMDVmfbw9/XCmMSVvmdoFPdBlpNnv9DlgC1a196o6RcWr
	aMR5ha3hA3fQxUjzwBuISgb7wOwjVF7cZGWNiU693PJcO15ov1JP/AomLJWfGg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Aug 2026 17:11:58 +0200
Message-Id: <DKIT3XLETTWD.4QS3K7M6HPXE@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <adrian.freihofer@siemens.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 13/14] oe-selftest: devtool ide-sdk: add
 clang/LLDB test
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260804120034.378787-1-adrian.freihofer@siemens.com>
 <20260804120034.378787-14-adrian.freihofer@siemens.com>
In-Reply-To: <20260804120034.378787-14-adrian.freihofer@siemens.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 15:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243014

On Tue Aug 4, 2026 at 1:59 PM CEST, Adrian Freihofer via lists.openembedded=
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

This patch was merged, but it now looks like some of the added tests are
sometimes failing.

So far, we only saw the issue on test branches and never on master, so
there is a small chance some other patch is breaking the test, but I
suspect the issue is also present on master.

Here is the error:

2026-08-05 14:12:52,800 - oe-selftest - INFO - devtool.DevtoolIdeSdkTests.t=
est_devtool_ide_sdk_code_cmake_clang (subunit.RemotedTestCase)
2026-08-05 14:12:52,801 - oe-selftest - INFO -  ... FAIL
...
2026-08-05 14:12:52,801 - oe-selftest - INFO - 11: 3/27 320/763 (915.39s) (=
0 failed) (devtool.DevtoolIdeSdkTests.test_devtool_ide_sdk_code_cmake_clang=
)
2026-08-05 14:12:52,801 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 4377, in test_dev=
tool_ide_sdk_code_cmake_clang
    self._lldb_cross_debugging_multi(
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 4223, in _lldb_cr=
oss_debugging_multi
    lldb_session_func(DevtoolIdeSdkTests.MAGIC_STRING_ORIG)
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 4379, in <lambda>
    lambda magic_string: self._lldb_server_debugging_once(
                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/selftest/cases/devtool.py", line 4323, in _lldb_se=
rver_debugging_once
    r =3D runCmd(lldb_batch, output_log=3Dself._cmd_logger)
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/layers/openemb=
edded-core/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%=
s" % (command, result.status, exc_output))
AssertionError: Command '['/srv/pokybuild/yocto-worker/oe-selftest-debian/b=
uild/build-st-893803/tmp/work/x86_64-linux/lldb-native/22.1.8/recipe-sysroo=
t-native/usr/bin/lldb', '--batch', '-o', 'platform select remote-linux', '-=
o', 'platform connect connect://192.168.7.14:1234', '-o', 'settings set tar=
get.process.thread.step-avoid-regexp ""', '-o', 'settings set target.debug-=
file-search-paths /srv/pokybuild/yocto-worker/oe-selftest-debian/build/buil=
d-st-893803/tmp/work/qemux86_64-poky-linux/oe-selftest-image/1.0/rootfs-dbg=
/lib/.debug /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-8=
93803/tmp/work/qemux86_64-poky-linux/oe-selftest-image/1.0/rootfs-dbg/usr/l=
ib/.debug /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-893=
803/tmp/work/qemux86_64-poky-linux/oe-selftest-image/1.0/rootfs-dbg/usr/lib=
/debug /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-893803=
/tmp/work/qemux86_64-poky-linux/oe-selftest-image/1.0/rootfs-dbg/lib /srv/p=
okybuild/yocto-worker/oe-selftest-debian/build/build-st-893803/tmp/work/qem=
ux86_64-poky-linux/oe-selftest-image/1.0/rootfs-dbg/usr/lib /srv/pokybuild/=
yocto-worker/oe-selftest-debian/build/build-st-893803/tmp/work/qemux86_64-p=
oky-linux/oe-selftest-image/1.0/rootfs/lib /srv/pokybuild/yocto-worker/oe-s=
elftest-debian/build/build-st-893803/tmp/work/qemux86_64-poky-linux/oe-self=
test-image/1.0/rootfs/usr/lib', '-o', 'settings set target.exec-search-path=
s /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-893803/tmp/=
work/x86-64-v3-poky-linux/cmake-example-clang/1.0/image/usr/lib /srv/pokybu=
ild/yocto-worker/oe-selftest-debian/build/build-st-893803/tmp/work/x86-64-v=
3-poky-linux/cmake-example-clang/1.0/image/lib /srv/pokybuild/yocto-worker/=
oe-selftest-debian/build/build-st-893803/tmp/work/x86-64-v3-poky-linux/cmak=
e-example-clang/1.0/image/usr/bin', '-o', 'target create --remote-file /usr=
/bin/cmake-example-clang /srv/pokybuild/yocto-worker/oe-selftest-debian/bui=
ld/build-st-893803/tmp/work/x86-64-v3-poky-linux/cmake-example-clang/1.0/im=
age/usr/bin/cmake-example-clang', '-o', 'settings set target.source-map /us=
r/include /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-893=
803/tmp/work/x86-64-v3-poky-linux/cmake-example-clang/1.0/recipe-sysroot/us=
r/include /usr/src/debug/cmake-example-clang/1.0 /tmp/devtoolqarl0rouil /us=
r/src/debug /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-8=
93803/tmp/work/qemux86_64-poky-linux/oe-selftest-image/1.0/rootfs-dbg/usr/s=
rc/debug', '-o', 'breakpoint set --file cpp-example.cpp --line 41', '-o', '=
breakpoint set --file cpp-example-lib.cpp --line 31', '-o', 'breakpoint set=
 --file cpp-example-lib.hpp --line 21', '-o', 'breakpoint list', '-o', 'run=
', '-o', 'p cpp_example.get_string()', '-o', 'continue', '-o', 'p flag', '-=
o', 'continue', '-o', 'p n', '-o', 'continue', '-o', 'exit']' returned non-=
zero exit status 1:
(lldb) platform select remote-linux
  Platform: remote-linux
 Connected: no
(lldb) platform connect connect://192.168.7.14:1234
error: Failed to connect to 192.168.7.14:1234

And we have similar errors on
devtool.DevtoolIdeSdkTests.test_devtool_ide_sdk_code_meson_clang.

All affected builds:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4474
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4478
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4484
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4485
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4302
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4553
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4490
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4311
https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/4314
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4493

Can you have a look at this? Any clue about what is going wrong here?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


