Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A11D110ED65A
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 10:42:38 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69015.1774608149727072965
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 03:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Ko3vN8Es;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AD8CB1A301B;
	Fri, 27 Mar 2026 10:42:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 81E6760230;
	Fri, 27 Mar 2026 10:42:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3E28B10450C97;
	Fri, 27 Mar 2026 11:42:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774608146; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p8gjXl458/5NzfBzuoCJhZhgZK0gD1xkf2KFZajsERs=;
	b=Ko3vN8EsGedZvxDQoJ6MfKOZ3sDToNEecMnJTFNhTmOukSQ99++ermjE82RUQU+OQbz7EW
	Ft6PZCzTSM/O++Uc+gfw8kzJPhIBVSnMEzkeH2uCm3qUFSJMorwYQjSNiAF5QA/hD5baS1
	pPYqYendpxrYPSKyr2fzjJjtx/CutmL0gobptRrimal6dmRk0xEpzmMLPHXEAjCiL8boT1
	2SDzzYgSec5wotQ1JdyjZVp3U3PVHTez1a6sazcXdvAn71jzooIbvizK2LRyFofi6gQp4O
	MSdX1cjtukBxTn5Ga3AwxQtUb52VTiy9Yj5E/LysEL6rnvSp9uNL+kjSA1AChQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Mar 2026 11:42:24 +0100
Message-Id: <DHDI32YKJSSP.MH33L7GOJJ1Q@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3 1/7] clang/llvm: Upgrade to 22.x major
 release
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260326151641.3974221-1-khem.raj@oss.qualcomm.com>
In-Reply-To: <20260326151641.3974221-1-khem.raj@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 10:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234079

On Thu Mar 26, 2026 at 4:16 PM CET, Khem Raj via lists.openembedded.org wro=
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

This looks better, but we still have one issue:

ERROR: clang-22.1.2-r0 do_compile: Execution of '/srv/pokybuild/yocto-worke=
r/qemux86-world/build/build/tmp/work/x86-64-v3-poky-linux/clang/22.1.2/temp=
/run.do_compile.573061' failed with exit code 1
...
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: VERBOSE=3D1 cmake --build /srv/pokybuild/yocto-worker/qemux86-world=
/build/build/tmp/work/x86-64-v3-poky-linux/clang/22.1.2/build --target all =
--
| Change Dir: '/srv/pokybuild/yocto-worker/qemux86-world/build/build/tmp/wo=
rk/x86-64-v3-poky-linux/clang/22.1.2/build'
|
| Run Build Command(s): ninja -v -j 16 all
| ninja: error: '/srv/pokybuild/yocto-worker/qemux86-world/build/build/tmp/=
work-shared/llvm-project-source-22.1.2-r0/sources/llvm-project-22.1.2.src/c=
lang/tools/scan-build-py/lib64/libscanbuild/__init__.py', needed by 'lib64/=
libscanbuild/__init__.py', missing and no known rule to make it
|
| WARNING: exit code 1 from a shell command.
NOTE: recipe clang-22.1.2-r0: task do_compile: Failed

https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/3485

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


