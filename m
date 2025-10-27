Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67AD3CCD1A5
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 06:03:51 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.25890.1761545026281833487
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Oct 2025 23:03:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=J2KwpV8z;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9AC30C0CDF6;
	Mon, 27 Oct 2025 06:03:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 97E776062C;
	Mon, 27 Oct 2025 06:03:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4DDA8102F24DC;
	Mon, 27 Oct 2025 07:03:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761545024; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FhRH7a4NJd7UYcDBkdyLXk3gLY7ZczX6uSbyzrZw2lk=;
	b=J2KwpV8zf8/ZFDMdE2tIfIEJF9nftTHhN+5/cOPX6hW7vHP8mglDxFP1AF7gSbqyiY9rMa
	ZsNZ7z6E14CQdBCkj4TliqkteLEGjc9qV9LANFE7DNDh/KPzbR13iGIOOHQGDJ+0Tx18R3
	ViQGfCMfkTQCUBBtBn42pN/uy5J5DcwVZKMtvDFqZS2RVCk8Gfo5JMrzv9zqUx98DQqBTB
	oU8yANVx20r0ZR7ZRRxThw+c+l0s7H3OuVSg8D4Q2qDaazS+7qwg+7YFTwyim30IwSjxlD
	ADayMVorP0RNiqAlaFjVaFk33FbNjudhz2mo03h9lS3/9pAj4nGyLOER4KQXrQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Oct 2025 07:03:36 +0100
Message-Id: <DDSVLCVN8K5F.RVYE5VTH4FQY@bootlin.com>
Subject: Re: [OE-core] [RFC PATCH 0/7] Enable rust support for linux kernel
Cc: <Sundeep.Kokkonda@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Harish.Sadineni@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251023112547.4044904-1-Harish.Sadineni@windriver.com>
In-Reply-To: <20251023112547.4044904-1-Harish.Sadineni@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 06:03:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225320

On Thu Oct 23, 2025 at 1:25 PM CEST, Harish via lists.openembedded.org Sadi=
neni wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> This patch series introduces Rust support into the linux-yocto kernel rec=
ipe
> and related build infrastructure in the Yocto Project. The goal is to ena=
ble
> building the Linux kernel with Rust components and provide support for
> building kernel module which is written in rust inside sdk.=20
>
> Summary of changes:
>
> - Patch 1: Extend 'bindgen-cli' to support 'nativesdk', allowing it to be=
 available in the SDK environment.
> - Patch 2: Add required dependencies ('clang-native', 'bindgen-cli-native=
') to the kernel to support Rust binding generation.
> - Patch 3: Install the Rust standard library source ('library/') into `wo=
rk-shared` and which will be later copied to=20
>            linux-yocto recipe-sysroot-native.
> - Patch 4: Stage the Rust sources into `recipe-sysroot-native` for kernel=
 build compatibility, making them visible during native builds.
> - Patch 5: Update `kernel-yocto.bbclass` to invoke `make rustavailable` d=
uring 'do_kernel_configme', ensuring Rust readiness.
> - Patch 6: Add kernel configuration support for Rust (via 'rust.cfg' and =
'rust.scc'), enabling the Rust build options in kernel config.
> - patch 7: Copy Rust kernel sources into kernel-devsrc build directory wh=
ich will be required while runnig 'make prepare' in sdk.
>
> WIP - need inputs:
> 1. In patch-3, rust sources are copied from ${RUSTSRC} to ${TMPDIR}/work-=
shared, which is redundant and improving it in
>  more optimized way by extracting rust directly into ${TMPDIR}/work-share=
d and then use it for both rust & linux-yocto recipes.
> =20
> 2. In patch-6, We've suppressed a few build path QA issues with INSANE_SK=
IP.
> We have tried fixing those using DEBUG_PREFIX_MAP & --remap-path-prefix b=
ut unable to resolve it.
> Are there any flags for kernel or any other inputs?
> =20
> 3. If rust.cfg & rust.scc changes are ok, we will send kernel configurati=
on fragment to yocto-kernel-cache.
>
> With above considerations, We did a successful build of Enabling rust in =
linux kernel and=20
> Tested a rust-out-of-tree kernel module in sdk for x86-64 & arm64 archite=
ctures.
>
> Harish Sadineni (7):
>   bindgen-cli: extend BBCLASSEXTEND to include nativesdk
>   linux-yocto: add clang-native and bindgen-cli-native to DEPENDS
>   rust: install Rust standard library sources for make rustavailable
>     support
>   rust: stage rustlib sources for linux-yocto make rustavailable support
>   kernel-yocto: add rust support via make rustavailable in
>     do_kernel_configme
>   linux-yocto: enable Rust support in kernel configuration
>   kernel-devsrc: copying rust-kernel soucre  to $kerneldir/build
>
>  meta/classes-recipe/kernel-yocto.bbclass      |  4 ++++
>  .../bindgen-cli/bindgen-cli_0.72.1.bb         |  2 +-
>  meta/recipes-devtools/rust/rust_1.90.0.bb     | 13 +++++++++++-
>  meta/recipes-kernel/linux/files/rust.cfg      | 20 +++++++++++++++++++
>  meta/recipes-kernel/linux/files/rust.scc      |  1 +
>  meta/recipes-kernel/linux/kernel-devsrc.bb    |  1 +
>  meta/recipes-kernel/linux/linux-yocto.inc     |  7 +++++++
>  meta/recipes-kernel/linux/linux-yocto_6.16.bb |  4 ++++
>  8 files changed, 50 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-kernel/linux/files/rust.cfg
>  create mode 100644 meta/recipes-kernel/linux/files/rust.scc

Hi Harish,

I know this is still an RFC, but I ran it on the autobuilder to check
how it goes. We had a some error with kernel build:

ERROR: linux-yocto-6.12.52+git-r0 do_patch: Execution of '/srv/pokybuild/yo=
cto-worker/qemux86-alt/build/build/tmp/work/qemux86-poky-linux/linux-yocto/=
6.12.52+git/temp/run.do_patch.410367' failed with exit code 1
...
| cp: cannot stat '/srv/pokybuild/yocto-worker/qemux86-alt/build/build/tmp/=
work-shared/rust': No such file or directory

This happened in almost all builds as far as I can tell:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/20/builds/2614
https://autobuilder.yoctoproject.org/valkyrie/#/builders/9/builds/2623
https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/2650

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2638

Thanks,
Mathieu


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


