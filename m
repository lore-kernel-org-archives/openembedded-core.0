Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BBD9CFA760
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 09:17:55 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7823.1763716668096878812
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 01:17:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=MzS21/xu;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5DD37C10199;
	Fri, 21 Nov 2025 09:17:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B7DD760719;
	Fri, 21 Nov 2025 09:17:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6F2E310371D86;
	Fri, 21 Nov 2025 10:17:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763716665; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WkAtnOmmSdH0KnRQjn/SP3BD6iBvXCHdX/KgYDZQngk=;
	b=MzS21/xuIXHyMTMmZQy9ZLSJliw2NW715i5l1QQLAsJPopdJuP8H8JC+LsMYGPwogi/zvB
	0Xpd+NecFL/hHWovEaedDUU5oXgbVNY5OMBsgb76rYX32wQwJkAvdQ7kIVCHL55Co/Qe1r
	TsHLpD1rgkRd4hhowSGbKWjTjxAMYcAIJh4vbxF/1uVECFQ4K7r40RU+Nlwn+djtPdRK3P
	mfAOnfFBDGx5H00tIZAtZxoc7tf2kYj1dj2uZ0uM0d9Mpb8pmG/cVpgyQzez01cSM0sN2c
	7R/7o2aWuif8Ki0wvnacV21dTzkUKfrWO41GQLteT/iFp7EDhUwoUwTJGjScWQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 21 Nov 2025 10:17:43 +0100
Message-Id: <DEE9DLQRPI5N.368W9VM5LPRIA@bootlin.com>
Subject: Re: [OE-core] [PATCH 2/2] rust-common.bbclass: filter out incorrect
 compiler flags in wrapper
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <skandigraun@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251120121947.3473848-1-skandigraun@gmail.com>
 <20251120121947.3473848-3-skandigraun@gmail.com>
In-Reply-To: <20251120121947.3473848-3-skandigraun@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 09:17:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226656

On Thu Nov 20, 2025 at 1:19 PM CET, Gyorgy Sarvari via lists.openembedded.o=
rg wrote:
> This patch is a workaround for https://bugzilla.yoctoproject.org/show_bug=
.cgi?id=3D15976
>
> cc-rs crate is used by a number of projects, including rust's bootstrap a=
lso
> to invoke the systems c/c++ compiler.
>
> A few updates ago it has changed the way CFLAGS/CXXFLAGS are handled: it =
now
> merges them with HOST_C*FLAGS and TARGET_C*FLAGS.
>
> This is a problem when a recipe is cross compiled, but it has a build dep=
endency
> which uses this crate to be built. In this case the C*FLAGS variable cont=
ains
> target flags, while the HOST_C*FLAGS contains host-specific flags, and wh=
en the
> two are mixed, the output is not what one expects.
>
> This change tries to filter out the incorrect flags:
> - If the wrapper is invoked as a c or c++ compiler wrapper,
> - then determines if it compiles for host or for target
> - Depending on the on above, it considers the TARGET_*FLAGS or HOST*FLAGS
>   correct, and the C*FLAGS variable content incorrect.
> - It subtracts the correct set from the incorrect set, and drops the
>   remainder from the compiler flags. (Which might be often an empty list,=
 so
>   the flags are frequently unchanged)
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---

Hi Gyorgy,

Thanks for your patch.

I suspect one of the commit of this series is responsible of this rust
test failure:

2025-11-20 21:59:48,098 - oe-selftest - INFO - FAIL: rust.RustSelfTestSyste=
mEmulated.test_rust (subunit.RemotedTestCase)
...
  File "/srv/pokybuild/yocto-worker/qemux86-64-tc/build/layers/openembedded=
-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qemux86-64-tc/build/layers/openembedded=
-core/meta/lib/oeqa/selftest/cases/rust.py", line 131, in test_rust
    retval =3D runCmd(cmd)
  File "/srv/pokybuild/yocto-worker/qemux86-64-tc/build/layers/openembedded=
-core/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%=
s" % (command, result.status, exc_output))
AssertionError: Command 'export TARGET_VENDOR=3D"-poky"; export PATH=3D/srv=
/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-1700604/tmp/work/x86-6=
4-v3-poky-linux/rust/1.90.0/recipe-sysroot-native/usr/bin/python3-native:/s=
rv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-1700604/tmp/work/x86=
-64-v3-poky-linux/rust/1.90.0/recipe-sysroot-native/usr/bin:/srv/pokybuild/=
yocto-worker/qemux86-64-tc/build/build-st-1700604/tmp/work/x86-64-v3-poky-l=
inux/rust/1.90.0/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/srv/pokyb=
uild/yocto-worker/qemux86-64-tc/build/build-st-1700604/tmp/hosttools:$PATH;=
 export RUST_TARGET_PATH=3D/srv/pokybuild/yocto-worker/qemux86-64-tc/build/=
build-st-1700604/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/rust-targets; ex=
port RUSTFLAGS=3D'-C strip=3Ddebuginfo'; export TEST_DEVICE_ADDR=3D"192.168=
.7.6:12345"; cd /srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-17=
00604/tmp/work/x86-64-v3-poky-linux/rust/1.90.0/sources/rustc-1.90.0-src; p=
ython3 src/bootstrap/bootstrap.py test  --exclude src/bootstrap  --exclude =
src/doc/rustc  --exclude src/doc/rustdoc  --exclude src/doc/unstable-book  =
--exclude src/etc/test-float-parse  --exclude src/librustdoc  --exclude src=
/rustdoc-json-types  --exclude src/tools/coverage-dump  --exclude src/tools=
/jsondoclint  --exclude src/tools/lint-docs  --exclude src/tools/replace-ve=
rsion-placeholder  --exclude src/tools/rust-analyzer  --exclude src/tools/r=
ustdoc-themes  --exclude src/tools/rust-installer  --exclude src/tools/test=
-float-parse  --exclude src/tools/suggest-tests  --exclude src/tools/tidy  =
--exclude tests/assembly-llvm/asm/aarch64-outline-atomics.rs  --exclude tes=
ts/codegen-llvm/issues/issue-122805.rs  --exclude tests/codegen-llvm/thread=
-local.rs  --exclude tests/mir-opt/  --exclude tests/run-make  --exclude te=
sts/run-make-fulldeps  --exclude tests/rustdoc  --exclude tests/rustdoc-jso=
n  --exclude tests/rustdoc-js-std  --exclude tests/ui/abi/stack-probes-lto.=
rs  --exclude tests/ui/abi/stack-probes.rs  --exclude tests/ui/codegen/mism=
atched-data-layouts.rs  --exclude tests/codegen-llvm/rust-abi-arch-specific=
-adjustment.rs  --exclude tests/ui/debuginfo/debuginfo-emit-llvm-ir-and-spl=
it-debuginfo.rs  --exclude tests/ui/feature-gates/version_check.rs  --exclu=
de tests/ui-fulldeps/  --exclude tests/ui/process/nofile-limit.rs  --exclud=
e tidyselftest --no-doc --no-fail-fast --bless --target x86_64-poky-linux-g=
nu' returned non-zero exit status 1:
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/66/builds/2691

Can you have a look at this error?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


