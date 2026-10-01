Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE19CA5FD2
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 14:08:20 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12204.1790863693930033338
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 07:08:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=htmLSXDn;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A87071A1A7C;
	Thu,  1 Oct 2026 14:08:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7BDC260341;
	Thu,  1 Oct 2026 14:08:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4F9721032814F;
	Thu,  1 Oct 2026 16:08:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790863691; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+b18YJZLtmrBF4oDcLNfrtXvPgaScLmBp3+Hq5+z3GY=;
	b=htmLSXDnyy1BXo0cNx41mqi2+Uc3AJSos1F4PIuYJ8yh3Q88VE7zSmXEde/TaSzldcj2ky
	4VDqitd3ot8cfj0EAGxzmDtK+tyvkMoMxBw0o9gUFVs7TRY4gn/6huP0gk+ZqSR1UNaZTN
	G6gZMx1+TmfOUBIrLw0AhexfkMbEG4GzyJweiRtjN8k5OiaR7ySICEUQEMIlZdm2vQ1X6w
	vjZdpIvTevq8lsqq94/+DS5P3rB7WctCWjRRJXi3rTXInRT7a+vXab4Gs/dnx39rerseCs
	JC2cVoVcgl/CwZkeSsWQwxay64sVXhBd96WIg19FW8h07Msl6dPg1sY4eCXS3w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Oct 2026 16:08:08 +0200
Message-Id: <DLTK70W1LZPD.1WPEJTEXRP8Q1@bootlin.com>
Subject: Re: [OE-core] [PATCH 0/2] rust: add rust-analyzer support
Cc: "Randy MacLeod" <Randy.MacLeod@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Benhur T" <benhur.tessele@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261001125630.760962-1-benhur.tessele@est.tech>
In-Reply-To: <20261001125630.760962-1-benhur.tessele@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 14:08:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247037

On Thu Oct 1, 2026 at 2:56 PM CEST, Benhur T wrote:
> rust-analyzer is built as part of the Rust tools but was neither
> installed nor packaged. This series packages it and wires it into the
> Rust SDK next to clippy and rustfmt.
>
> Patch 1 adds a rust-tools-analyzer package for the target and nativesdk
> variants. Beyond the frontend binary it also ships the proc-macro server
> and depends on the standard library sources, both of which are required
> for rust-analyzer to actually function.
>
> Patch 2 adds it to the cross-canadian toolchain so that an SDK built with
> SDK_FEATURES =3D "rust" provides rust-analyzer out of the box.
>
> Testing:
>  - Patches validated with patchset.
>  - Built an SDK with SDK_FEATURES =3D "rust", installed it in a container=
,
>    and confirmed rust-analyzer resolves the standard library and expands
>    proc-macros end to end: diagnostics/analysis-stats on a crate using a
>    derive macro succeed, with the proc-macro server started from
>    <sysroot>/libexec.
>  - Built core-image-minimal with rust-tools-analyzer installed, booted it
>    under qemu, and confirmed the rust-analyzer frontend and the
>    rust-analyzer-proc-macro-srv binary are present with their libraries
>    resolving.
>
> Benhur Tessele (2):
>   rust: package rust-analyzer as rust-tools-analyzer
>   packagegroup-rust-cross-canadian: add rust-analyzer to the SDK
>
>  .../packagegroup-rust-cross-canadian.bb       |  1 +
>  meta/recipes-devtools/rust/rust_1.98.1.bb     | 19 ++++++++++++++++---
>  2 files changed, 17 insertions(+), 3 deletions(-)

Hi Benhur,

Thanks for your patch.

I believe this is breaking build on some platforms. Maybe all ARM 32
bits?

ERROR: rust-1.98.1-r0 do_install: Execution of '/srv/pokybuild/yocto-worker=
/beaglebone-alt/build/build/tmp/work/cortexa8t2hf-neon-poky-linux-gnueabi/r=
ust/1.98.1/temp/run.do_install.3194208' failed with exit code 1
...
| error[E0658]: use of unstable library feature `stdarch_arm_neon_intrinsic=
s`
|   --> /rust/deps/simd-adler32-0.3.9/src/imp/neon.rs:23:7
|    |
| 23 |   use core::arch::arm::*;
|    |       ^^^^^^^^^^^^^^^
|    |
|    =3D note: see issue #111800 <https://github.com/rust-lang/rust/issues/=
111800> for more information
|    =3D help: add `#![feature(stdarch_arm_neon_intrinsics)]` to the crate =
attributes to enable
|    =3D note: this compiler was built on 2026-09-01; consider upgrading it=
 if it is out of date
...
| -------------
| error: could not compile `simd-adler32` (lib) due to 67 previous errors
| warning: build failed, waiting for other jobs to finish...
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/10/builds/4734
https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/4706

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


