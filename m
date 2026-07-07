Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB33DC43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 07:37:27 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.168435.1783409840643836030
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 00:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=WXDTf5+1;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5B1EF4E40CC9;
	Tue,  7 Jul 2026 07:37:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2EC71601A3;
	Tue,  7 Jul 2026 07:37:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 303DD11BC0DA2;
	Tue,  7 Jul 2026 09:37:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783409837; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nzlnen9KV1wVIE4AS1H6sNgZqVzy0b2ZNFNnU6vCeV8=;
	b=WXDTf5+1XbJvQeL3OenBNzX5flXYilE5mz5G41eHobY3cMVf8MvG9FXap/dSMrisu2ARxX
	SBcIfQWlmDKdMnj+lJKHdoye06gAfLrKV/ideF3619xfgXrbGE+2/ka+eQMVlJpFPGmwuF
	E/qcASUmU61dCvlKh/WM8EqerOk6nkDscJ7aQQy4/tJiUZx4kDLMn5UDx4xDtDPTjrCVv8
	GkeHiu01wvXFntnh5LYVsG4MwHugIN31wDEYEWErvy1j/ZDLPqRiUoRumubUfIkMtwv2c4
	jS4iE1k6IohP8orFPJiTiVSzeQXwmNam8PognHzERBB/0rSJo7+xpLBg9/QiIQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Jul 2026 09:37:13 +0200
Message-Id: <DJS60V3OTZ8P.1G7BQBL5EUH7G@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Harish.Sadineni@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/4] kernel-yocto-rust: use clang toolchain
 for riscv64 when Rust is enabled
Cc: <Sundeep.Kokkonda@windriver.com>, <raj.khem@gmail.com>,
 <tgamblin@baylibre.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260706112905.41381-1-Harish.Sadineni@windriver.com>
 <20260706112905.41381-2-Harish.Sadineni@windriver.com>
In-Reply-To: <20260706112905.41381-2-Harish.Sadineni@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 07:37:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240365

On Mon Jul 6, 2026 at 1:29 PM CEST, Harish via lists.openembedded.org Sadin=
eni wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> Enable LLVM/Clang toolchain for riscv64 kernel builds when Rust support
> is enabled, as Rust is only supported with LLVM toolchains for this
> architecture.
>
> This aligns with upstream kernel Rust architecture requirements as
> documented in:
> https://docs.kernel.org/rust/arch-support.html
>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---

Hi Harish,

Thanks for your patch.

>  meta/recipes-kernel/linux/linux-yocto.inc | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-ker=
nel/linux/linux-yocto.inc
> index 4e230d405a..ee0d5abaeb 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -91,3 +91,7 @@ do_devshell:prepend() {
>      d.setVar("HOSTPKG_CONFIG", "pkg-config-native")
>      d.appendVar("OE_TERMINAL_EXPORTS", " HOSTPKG_CONFIG")
>  }
> +
> +# For riscv64, Rust support in kernel only works with LLVM/Clang only.
> +# https://docs.kernel.org/rust/arch-support.html
> +TOOLCHAIN:riscv64 =3D "${@bb.utils.contains('KERNEL_FEATURES', 'rust', '=
clang', '', d)}"

So I believe this is wrong, as you are setting TOOLCHAIN to nothing if
rust is not in KERNEL_FEATURES.

This is failing on the autobuilder with:
Parsing recipes...ERROR: ParseError at /srv/pokybuild/yocto-worker/qemurisc=
v64/build/layers/openembedded-core/meta/classes-global/base.bbclass:36: Cou=
ld not inherit file classes/toolchain/.bbclass
ERROR: Parsing halted due to errors, see error messages above

https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/1836

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


