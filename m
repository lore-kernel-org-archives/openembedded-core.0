Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A0601093193
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 09:11:22 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8744.1773997872096377262
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 02:11:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Re/s09TZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso11621365e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 02:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773997870; x=1774602670; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A21GskrbOBUA4Mt11MeffT4xwZ8NNXXCpEuoRvDTAs8=;
        b=Re/s09TZGGrmDFvbvHLPTBuyDwGiLXuotBt9SYIT7VMvRvzAYRiiw1XOsLCPZ7jqMb
         YXcFEoLn4SApJmTpcCCKPUf6AT2xBR2zXYk2jElZStqV64qQBORxB0jr9R+Vm33adCgp
         nQVtIDjwQaGtOojsQ2QNgukUH5aG0a31dgAAHN6wPNkgviR23LljSk1ND/koCa2CfqCL
         /G/z4l0fm3z5nP8alKjyjnIleZ/gRd4zXlI42fUfNUj7dT0S+BDBZuXRiEF0GbuGNz1E
         XrGuFU19/49bKpd/ALGJsrTT2wL2nvXG9yOY1NC6MCjdGlXLkbOI85QpR2/hZfF3hnZ1
         loCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773997870; x=1774602670;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A21GskrbOBUA4Mt11MeffT4xwZ8NNXXCpEuoRvDTAs8=;
        b=e+MpAvOTVFHEQF/l2E1gSrhpSJQOJms2veuyh7XrEMCHscYvWHXaM43iUffWuKeqQ1
         xMQMJ/AnGjtuJYGVQdPeRims2PmnqmcNcAQZkVyDGQHyxSvo0TmEctSk5FrjsWjPElHM
         aW9gvkJE31EvdhuGkApSApjyiqnjc3dS6iylGbfF1AqowsYuEtwKLYmNcXNOXypYBfy0
         2C1LcT5q1LR6vpN3hQwsMaXC2F86gdk3ZnkAL/34x63XfYYoWsF4ObLhIIUNius8SoBd
         RNZvOKOE+vI6zWM9K1FePjAcAsRtCzyOO6eKQD9hsnklhknodiEvxFPD5f/Zo41KWylV
         Rz5g==
X-Forwarded-Encrypted: i=1; AJvYcCVJY8yNw8DP+I5of+1ptL4QozBSiHNFqfiuBylBDG0ZI/z+yyS0cun23TYsPKjJWtnhtVbLeow/pMbzAJ0C3dB2fA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxsiRVnwiACcakfn/Z8AnfyJKX9fl3neJSSwKG7kzheLCS+ihL2
	vxv2AvYCettniltLR6ms3sy06Biqc21pFNAGCFJuFJ2idzmiIDkhhVLX
X-Gm-Gg: ATEYQzwhqXAkklTQ+i8sXaPKB+7PIMIWCZ2ersI8eoD6BvTA4uZVeYLLTQ8w6K+/BpQ
	eCrHZ/oOm2hC1xUL5R6hvo8LVg6YkYWpVcF8PECQssY5HyEUw1rF5FUtDL2fDpX2Zh7fdd1XRTC
	hv4P/3WM7G064QL5Zz9ddWrd3xT7bAcM1vcLc29KrHJD0UHXstpdCnboEhYD0KqEpJABJ8H7Q3M
	L1iQoTuQWcrNHHM9pHOiLltiHh9Kh4pPgJOuyzVM5yNwjusSbZU1bVur6bwiWdMNuzuhDedjIJ+
	JzERiXcVwJuXPPc+zmSjBnFzhPXqNa23TgrzXPsBxA+Z+zzxuEHwQGhNMh3fzpR5imzpDW2+eag
	rd4Kw9i9u7IkjVdgFTwH9ti2FG/hzKXmREyvEHu/aSUciBzvX8XGIGl3Fom67sM3Iaykf1dJ2ki
	x57xTn87xE3VRERj7lt7/1sMKnqAfyj4n/jABZBr5Ez9GmzhdbhuXv8WTNxLKJ4zP85KL2qRxJ
X-Received: by 2002:a05:600c:5248:b0:485:3a27:a961 with SMTP id 5b1f17b1804b1-486feb5d845mr36441315e9.0.1773997869838;
        Fri, 20 Mar 2026 02:11:09 -0700 (PDT)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff1d8138sm11151545e9.34.2026.03.20.02.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 02:11:09 -0700 (PDT)
Message-ID: <7ce9c599973474ff4ce0b87c3aa43b4a0b6bec71.camel@gmail.com>
Subject: Re: [OE-core] [PATCH 9/9] oe-selftest: devtool ide-sdk: add
 clang/LLDB test
From: adrian.freihofer@gmail.com
To: mathieu.dubois-briand@bootlin.com, adrian.freihofer@siemens.com, 
	openembedded-core@lists.openembedded.org
Date: Fri, 20 Mar 2026 10:11:07 +0100
In-Reply-To: <DH7F8OQYC7QP.23LPE0REKT1BC@bootlin.com>
References: <20260318223736.3414885-1-adrian.freihofer@siemens.com>
	 <20260318223736.3414885-10-adrian.freihofer@siemens.com>
	 <DH7F8OQYC7QP.23LPE0REKT1BC@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 09:11:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233590

On Fri, 2026-03-20 at 08:12 +0100, Mathieu Dubois-Briand via
lists.openembedded.org wrote:
> On Wed Mar 18, 2026 at 11:36 PM CET, Adrian Freihofer via
> lists.openembedded.org wrote:
> > From: Adrian Freihofer <adrian.freihofer@siemens.com>
> >=20
> > Add test_devtool_ide_sdk_code_cmake_clang to verify the full
> > devtool
> > ide-sdk workflow for a cmake recipe built with clang.=C2=A0 Unlike the
> > gcc
> > variant the clang recipe uses lldb-server for remote debugging and
> > CodeLLDB (vadimcn.vscode-lldb) as the VS Code debug adapter.
> >=20
> > The test covers:
> > - devtool modify + devtool ide-sdk with ide=3Dcode
> > - cmake preset compilation and CTest execution (same as the gcc
> > test)
> > - extensions.json recommends vadimcn.vscode-lldb
> > - launch.json uses "type": "lldb" (CodeLLDB) instead of "type":
> > "cppdbg"
> > - End-to-end lldb --batch remote debugging session via lldb-server
> > =C2=A0 platform mode running on qemu
> >=20
> > Supporting changes:
> > - _write_bb_config: accept optional extra_packages parameter so the
> > =C2=A0 clang test can add lldb-server to IMAGE_INSTALL
> > - _verify_launch_json_lldb: new helper that validates the CodeLLDB
> > =C2=A0 launch.json structure (type, initCommands, program, cwd,
> > preLaunchTask)
> > - _lldb_server_debugging_once: new helper that reads the
> > preLaunchTask
> > =C2=A0 SSH command from tasks.json, starts lldb-server on the target,
> > and
> > =C2=A0 runs lldb --batch to verify a breakpoint at main is hit
> > - _verify_service_running: use pgrep with exact regex (^name$) for
> > exact
> > =C2=A0 process name matching; without that, pgrep would also match
> > =C2=A0 cmake-example-clang (truncated to 'cmake-example-c' in
> > =C2=A0 /proc/pid/comm) when checking for cmake-example, returning two
> > PIDs
> > =C2=A0 and failing the isdigit() assertion
> >=20
> > Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> > ---
>=20
> Hi Adrian,
>=20
> Thanks for your patch.
>=20
> It looks like the added test_devtool_ide_sdk_code_cmake_clang test is
> failing on the autobuilder:
>=20
> 2026-03-19 19:34:48,650 - oe-selftest - INFO -
> devtool.DevtoolIdeSdkTests.test_devtool_ide_sdk_code_cmake_clang
> (subunit.RemotedTestCase)
> 2026-03-19 19:34:48,651 - oe-selftest - INFO -=C2=A0 ... FAIL
> ...
> 2026-03-19 19:34:48,651 - oe-selftest - INFO - 11: 3/39 214/681
> (495.87s) (0 failed)
> (devtool.DevtoolIdeSdkTests.test_devtool_ide_sdk_code_cmake_clang)
> 2026-03-19 19:34:48,651 - oe-selftest - INFO -
> testtools.testresult.real._StringException: Traceback (most recent
> call last):
> =C2=A0 File "/srv/pokybuild/yocto-worker/oe-selftest-
> armhost/build/layers/openembedded-
> core/meta/lib/oeqa/selftest/cases/devtool.py", line 3862, in
> test_devtool_ide_sdk_code_cmake_clang
> =C2=A0=C2=A0=C2=A0 runCmd(install_deploy_cmd, output_log=3Dself._cmd_logg=
er)
> =C2=A0 File "/srv/pokybuild/yocto-worker/oe-selftest-
> armhost/build/layers/openembedded-
> core/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
> =C2=A0=C2=A0=C2=A0 raise AssertionError("Command '%s' returned non-zero e=
xit status
> %d:\n%s" % (command, result.status, exc_output))
> AssertionError: Command '/srv/pokybuild/yocto-worker/oe-selftest-
> armhost/build/build-st-273901/workspace/ide-sdk/cmake-example-
> clang/scripts/install_and_deploy_cmake-example-clang-cortexa57'
> returned non-zero exit status 1:
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3579
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3474
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3360
>=20
> Can you have a look at the issue?
>=20

Thank you for the feedback.

Looks like the summary is: Pseudo crashes on ARM hosts (but not on x86-
64 hosts).

Is it possible to get this file
/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-
273901/tmp/work/cortexa57-poky-linux/cmake-example-
clang/1.0/pseudo//pseudo.log ?


Relevant section from the logs is:

Summary: There was 1 WARNING message.
abort()ing pseudo client by server request. See
https://wiki.yoctoproject.org/wiki/Pseudo_Abort for more details on
this.
Check logfile: /srv/pokybuild/yocto-worker/oe-selftest-
armhost/build/build-st-273901/tmp/work/cortexa57-poky-linux/cmake-
example-clang/1.0/pseudo//pseudo.log
Aborted (core dumped)
tar: Unexpected EOF in archive
tar: Unexpected EOF in archive
tar: Error is not recoverable: exiting now
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-
273901/workspace/ide-sdk/cmake-example-
clang/scripts/deploy_target_cmake-example-clang-cortexa57", line 19, in
<module>
    deploy_no_d("/srv/pokybuild/yocto-worker/oe-selftest-
armhost/build/build-st-273901/tmp/work/cortexa57-poky-linux/cmake-
example-clang/1.0/image", "/srv/pokybuild/yocto-worker/oe-selftest-
armhost/build/build-st-273901/tmp/work/cortexa57-poky-linux/cmake-
example-clang/1.0", "/srv/pokybuild/yocto-worker/oe-selftest-
armhost/build/build-st-273901/tmp/sysroots-uninative/aarch64-
linux/usr/bin:/tmp/devtoolqalpx2fc25/core-
copy/scripts:/srv/pokybuild/yocto-worker/oe-selftest-
armhost/build/build-st-273901/tmp/work/cortexa57-poky-linux/cmake-
example-clang/1.0/recipe-sysroot-native/usr/bin/aarch64-poky-
linux:/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-
273901/tmp/work/cortexa57-poky-linux/cmake-example-clang/1.0/recipe-
sysroot/usr/bin/crossscripts:/srv/pokybuild/yocto-worker/oe-selftest-
armhost/build/build-st-273901/tmp/work/cortexa57-poky-linux/cmake-
example-clang/1.0/recipe-sysroot-native/usr/sbin:/srv/pokybuild/yocto-
worker/oe-selftest-armhost/build/build-st-273901/tmp/work/cortexa57-
poky-linux/cmake-example-clang/1.0/recipe-sysroot-
native/usr/bin:/srv/pokybuild/yocto-worker/oe-selftest-
armhost/build/build-st-273901/tmp/work/cortexa57-poky-linux/cmake-
example-clang/1.0/recipe-sysroot-native/sbin:/srv/pokybuild/yocto-
worker/oe-selftest-armhost/build/build-st-273901/tmp/work/cortexa57-
poky-linux/cmake-example-clang/1.0/recipe-sysroot-
native/bin:/srv/pokybuild/yocto-worker/oe-selftest-
armhost/build/layers/bitbake/bin:/srv/pokybuild/yocto-worker/oe-
selftest-armhost/build/build-st-273901/tmp/hosttools", "aarch64-poky-
linux-llvm-strip", "/usr/lib", "/lib", 16, "/srv/pokybuild/yocto-
worker/oe-selftest-armhost/build/build-st-273901/tmp/sysroots-
components/aarch64/pseudo-native/usr/bin/pseudo",
"PSEUDO_PREFIX=3D/srv/pokybuild/yocto-worker/oe-selftest-
armhost/build/build-st-273901/tmp/sysroots-components/aarch64/pseudo-
native/usr PSEUDO_LOCALSTATEDIR=3D/srv/pokybuild/yocto-worker/oe-
selftest-armhost/build/build-st-273901/tmp/work/cortexa57-poky-
linux/cmake-example-clang/1.0/pseudo/
PSEUDO_PASSWD=3D/srv/pokybuild/yocto-worker/oe-selftest-
armhost/build/build-st-273901/tmp/work/cortexa57-poky-linux/cmake-
example-clang/1.0/recipe-sysroot:/srv/pokybuild/yocto-worker/oe-
selftest-armhost/build/build-st-273901/tmp/sysroots-
components/aarch64/pseudo-native PSEUDO_NOSYMLINKEXP=3D1
PSEUDO_INCLUDE_PATHS=3D/proc,/srv/pokybuild/yocto-worker/oe-selftest-
armhost/build/build-st-273901/tmp/work/cortexa57-poky-linux/cmake-
example-clang/1.0/image,/srv/pokybuild/yocto-worker/oe-selftest-
armhost/build/build-st-273901/tmp/work/cortexa57-poky-linux/cmake-
example-clang/1.0/package,/srv/pokybuild/yocto-worker/oe-selftest-
armhost/build/build-st-273901/tmp/work/cortexa57-poky-linux/cmake-
example-clang/1.0/rootfs,/srv/pokybuild/yocto-worker/oe-selftest-
armhost/build/build-st-273901/tmp/work/cortexa57-poky-linux/cmake-
example-clang/1.0/sstate-build-package/,/srv/pokybuild/yocto-worker/oe-
selftest-armhost/build/build-st-273901/tmp/work/cortexa57-poky-
linux/cmake-example-clang/1.0/sstate-install-
package/,/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-
st-273901/tmp/work/cortexa57-poky-linux/cmake-example-
clang/1.0/pkgdata,/srv/pokybuild/yocto-worker/oe-selftest-
armhost/build/build-st-273901/tmp/work/cortexa57-poky-linux/cmake-
example-clang/1.0/minidebuginfo,/srv/pokybuild/yocto-worker/oe-
selftest-armhost/build/build-st-273901/tmp/work/cortexa57-poky-
linux/cmake-example-clang/1.0/devtool-deploy-target-stripped
PSEUDO_DISABLED=3D0", filtered_args)
  File "/srv/pokybuild/yocto-worker/oe-selftest-
armhost/build/layers/openembedded-core/scripts/lib/devtool/deploy.py",
line 274, in deploy_no_d
    raise DevtoolError('Deploy failed - rerun with -s to get a complete
'
devtool.DevtoolError: Deploy failed - rerun with -s to get a complete
error message


Thanks,
Adrian



> Thanks,
> Mathieu
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#233580):
> https://lists.openembedded.org/g/openembedded-core/message/233580
> Mute This Topic: https://lists.openembedded.org/mt/118391915/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

