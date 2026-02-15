Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D8A6EF587F
	for <webhook@archiver.kernel.org>; Sun, 15 Feb 2026 16:35:46 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1470.1771173338785214747
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Feb 2026 08:35:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=i8axrd/Z;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 360691A0F51;
	Sun, 15 Feb 2026 16:35:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F05E4606CD;
	Sun, 15 Feb 2026 16:35:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 681A3102F1D19;
	Sun, 15 Feb 2026 17:35:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771173335; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=juXPD435vtBKCFmSdCcuJE0ZJDBA7PXL3uIyv+XQJUc=;
	b=i8axrd/ZeXdoPVGWQRzclmJch2DYjHp1oXTFyfvRrQB8QSlhVHqw68/w/M+kSuLhwANlYO
	VEJeqapwIOLbh63cJDfQTC1jb5iADenm8xXlwkQmJvXW+8p84DCxrJuZgnt+hGCQ6tUWpG
	rmnO9QXDSl2F3nw1jsz2U5qgXUU43F7aowtS7g6SFPHnflFupY3T98UvN0qS2vP5eGxOqQ
	NeCjGojHHtPss3OIQ1vrjIDHqk3SO/gJkUDtE1SC713NTKHA5tMzHQ7Gfd27bExOvWSkxV
	LXWkJsnrwi8TnjujXs74uxFjZRW29SfQvZ/L1xzi8BTS2Udrxc2bO579bf4cGA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Feb 2026 17:35:33 +0100
Message-Id: <DGFOJOHDE058.3VTWCLZHYPGPD@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <SunilKumar.Dora@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] rust: Enable dynamic linking with llvm
Cc: <Randy.MacLeod@windriver.com>, <Sundeep.Kokkonda@windriver.com>,
 <alex@linutronix.de>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260212165035.1806068-1-sunilkumar.dora@windriver.com>
In-Reply-To: <20260212165035.1806068-1-sunilkumar.dora@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Feb 2026 16:35:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231160

On Thu Feb 12, 2026 at 5:50 PM CET, Sunil Kumar via lists.openembedded.org =
Dora wrote:
> From: Sunil Dora <sunilkumar.dora@windriver.com>
>
> YOCTO #16058
>
> When llvm-native is built with a newer toolchain (e.g. GCC 15) and
> reused on a system with an older linker, rustc emit segfault at runtime.
>
> This issue occurs because rustc, which is statically linked with LLVM lib=
raries,
> was built on one machine using a newer toolchain and then executed on ano=
ther machine
> that has an older linker. To prevent crash, LLVM now linked with rustc dy=
namically.
>
> Added llvm as dependency to provide libllvm.so at runtime.
>
> Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---

Hi Sunil,

It looks like this is breaking some builds:

ERROR: rust-1.93.0-r0 do_install: Execution of '/srv/pokybuild/yocto-worker=
/qemux86-world-alt/build/build/tmp/work/x86-64-v3-poky-linux/rust/1.93.0/te=
mp/run.do_install.3402703' failed with exit code 1
...
| error: failed to run custom build command for `rustc_llvm v0.0.0 (/srv/po=
kybuild/yocto-worker/qemux86-world-alt/build/build/tmp/work/x86-64-v3-poky-=
linux/rust/1.93.0/sources/rustc-1.93.0-src/compiler/rustc_llvm)`
|
| Caused by:
|   process didn't exit successfully: `/srv/pokybuild/yocto-worker/qemux86-=
world-alt/build/build/tmp/work/x86-64-v3-poky-linux/rust/1.93.0/sources/rus=
tc-1.93.0-src/build/x86_64-unknown-linux-gnu/stage2-rustc/release/build/rus=
tc_llvm-de72af8bf33c0296/build-script-build` (exit status: 101)
...
|   --- stderr
|   llvm-config: error: libLLVM-21.so is missing

https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/3020

Can you have a look at this issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


