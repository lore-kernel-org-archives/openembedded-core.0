Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C6210A3D8E
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 12:38:35 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46367.1774528711938031141
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 05:38:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=S0nQJ73s;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6F6031A2FEA
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 12:38:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 45F595FDEB;
	Thu, 26 Mar 2026 12:38:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 312F51045000B;
	Thu, 26 Mar 2026 13:38:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774528709; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Z8mYeRCuvgztVLkKHAs1uy4SGYWOYgZ7++3C38twRaE=;
	b=S0nQJ73suIXGCV/A8Jdcl5OJHJtfhAZRQtMqKrbnr4Ko4ozp1BFtw/ZBLLFFork305T1zH
	wcQW1niwcBMg2Hfo1yGsF1QfkWm92Armu13fvycYvOvGrpMfUhPnMAdNmdcd4eAA5K9gNU
	HXorxsIJO58V4llX7BcPH01JiMfZfExbJEWjiTxMEJHQ2PqDerNIScA7+WexAYTPnNe1Am
	mZyeOobbJjusiloOYsCtlsP2Vgo/QxJ6FXknI5jUpGMGkGAnqJGsHOB0hHn7zBLtv3f093
	s4uR2azspxiEjTJv/VzfAOhh87x41+p6v3CDytKqfFyo6whoiPU7UqesQs5h1A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Mar 2026 13:38:28 +0100
Message-Id: <DHCPXEPGK489.13NFXVPD5IBMZ@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 1/4] clang/llvm: Upgrade to 22.x major
 release
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260326020923.297511-1-khem.raj@oss.qualcomm.com>
In-Reply-To: <20260326020923.297511-1-khem.raj@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 12:38:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233982

On Thu Mar 26, 2026 at 3:09 AM CET, Khem Raj via lists.openembedded.org wro=
te:
> From: Khem Raj <raj.khem@gmail.com>
>
> Includes support for new Intel (Wildcat Lake, Nova Lake with APX and AVX1=
0.2)
> Arm (C1 Nano, Pro, Premium, Ultra) processors. It also features performan=
ce
> optimizations for AMD Zen 4 and Zen 5 architectures.
>
> Integrated Distributed ThinLTO is more mature, with enhancements
> like cache support for incremental builds and robust handling of temporar=
y artifacts.
>
> LLDB added first-class WebAssembly debugging support, including breakpoin=
ts and variable inspection.
>
> Support for Google Native Client (NaCl) is dropped in this release.
>
> Detailed ChangeLog [1]
>
> [1] https://releases.llvm.org/22.1.0/docs/ReleaseNotes.html
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---

Hi Khem,

Thanks for the new version. I believe we have two issues linked with
this patch.


Firs, an x86 build issue:

ERROR: clang-22.1.1-r0 do_compile: Execution of '/srv/pokybuild/yocto-worke=
r/qemux86-world-alt/build/build/tmp/work/x86-64-v3-poky-linux/clang/22.1.1/=
temp/run.do_compile.91398' failed with exit code 1
...
| Run Build Command(s): ninja -v -j 16 all
| ninja: error: '/srv/pokybuild/yocto-worker/qemux86-world-alt/build/build/=
tmp/work-shared/llvm-project-source-22.1.1-r0/sources/llvm-project-22.1.1.s=
rc/clang/tools/scan-build-py/lib64/libscanbuild/__init__.py', needed by 'li=
b64/libscanbuild/__init__.py', missing and no known rule to make it
|

https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/3302
https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/3478

Then, a rust selftest issue:

2026-03-26 11:11:17,872 - oe-selftest - INFO - rust.RustSelfTestSystemEmula=
ted.test_rust (subunit.RemotedTestCase)
2026-03-26 11:11:17,889 - oe-selftest - INFO -  ... FAIL
...
test [assembly] tests/assembly-llvm/asm/loongarch-type.rs#loongarch32 ... F=
AILED
...

failures:

---- [assembly] tests/assembly-llvm/asm/loongarch-type.rs#loongarch32 stdou=
t ----
------FileCheck stdout------------------------------

------FileCheck stderr------------------------------
/srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-2170811/tmp/work/co=
rtexa57-poky-linux/rust/1.94.0/sources/rustc-1.94.0-src/tests/assembly-llvm=
/asm/loongarch-type.rs:31:11: error: CHECK: expected string not found in in=
put
// CHECK: pcalau12i $t0, %got_pc_hi20(extern_func)
          ^
/srv/pokybuild/yocto-worker/qemuarm64-tc/build/build-st-2170811/tmp/work/co=
rtexa57-poky-linux/rust/1.94.0/sources/rustc-1.94.0-src/build/x86_64-unknow=
n-linux-gnu/test/assembly-llvm/asm/loongarch-type.loongarch32/loongarch-typ=
e.s:9:6: note: scanning from here
 #APP
     ^
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/5/builds/3413
https://autobuilder.yoctoproject.org/valkyrie/#/builders/58/builds/1289
https://autobuilder.yoctoproject.org/valkyrie/#/builders/42/builds/3411

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


