Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A44C5B572
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 13:50:47 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8551.1786542637488020444
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 06:50:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=S8FyjOdR;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1F4094E411D7;
	Wed, 12 Aug 2026 13:50:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC8C16045E;
	Wed, 12 Aug 2026 13:50:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 31CB311C4CF2B;
	Wed, 12 Aug 2026 15:50:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786542630; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bugNF+LEvrv+Tve3mFfh6v5Yi7OJvRGje6JTC6fPbr4=;
	b=S8FyjOdRUTtrHMrWVBpft0o45tK8CFFZAEAUTWbQJ6NWANsSTUKsxLkcHTc/eC++GqTmW0
	wfYYdLlHamXV35pZ4/Zw7D63Fai8LpWhOVsjg4Gk6KCfvZAdTF5QEhtcvN5ifetrTfbTGf
	IdauZH2hqw5zxBlImgUmcQIUyVVJ+xsrbPr01mSQOZBZGNTBsz5ewpqEnvVu7ByBu+YBZI
	u6AMNiGMGynq+nPrMYT4yd58r3S6oiP3TeKx1jXtxPHG8oqSYT3xL6FI3WOhbt1ft2Al1r
	KTV9pYOz3FJ/pGFk4jak3C8MXDKIbvxVfOsJF3K+7oLn0BQLEaLMTUt6wZs+kQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Aug 2026 15:50:28 +0200
Message-Id: <DKN0I9BUB6PD.3V0CQ1YVMPXDN@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <anis.bougrine10@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: add strip process for signed
 kernel modules
Cc: <ross.burton@arm.com>
References: <20260812130655.15109-1-anis.bougrine10@gmail.com>
In-Reply-To: <20260812130655.15109-1-anis.bougrine10@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 13:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243292

Hi,

On Wed Aug 12, 2026 at 3:06 PM CEST, Anis Bougrine via lists.openembedded.o=
rg wrote:
> Currently, signed kernel modules skip the stripping process in order
> to preserve the file contents after signing. See commit:
> 4c47e5f171fa2603355e2f9183065ce8137a18c7
>
> However, the kernel install Makefile supports stripping modules before
> signing them. This allows signed modules to be stripped while preserving
> a valid signature.
>
> Make non-signed kernel modules follow the standard Yocto stripping flow,
> while signed kernel modules use the kernel Makefile stripping flow.
>
> Fixes [YOCTO #12927]
>
> Reported-by: ross.burton@arm.com
> Signed-off-by: Anis Bougrine <anis.bougrine10@gmail.com>
> ---
>  meta/classes-recipe/kernel.bbclass | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ker=
nel.bbclass
> index a82bdf7ecb..0d8d370e9d 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -453,7 +453,21 @@ kernel_do_install() {
>  	#
>  	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>  	if (grep -q -i -e '^CONFIG_MODULES=3Dy$' .config); then
> -		oe_runmake DEPMOD=3Decho MODLIB=3D${D}${nonarch_base_libdir}/modules/$=
{KERNEL_VERSION} INSTALL_FW_PATH=3D${D}${firmwaredir} modules_install
> +		# If the module will be auto-signed, perform stripping before signing.
> +		if grep -q '^CONFIG_MODULE_SIG=3Dy$' .config && grep -q '^CONFIG_MODUL=
E_SIG_ALL=3Dy$' .config; then

Suggestion: you can use the kernel's scripts/config utility to get the opti=
on
values:

$ ./scripts/config --file ./.config --state MODULE_SIG
y

So that you really see the option value as the kernel sees it.

Antonin

