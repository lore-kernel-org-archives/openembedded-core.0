Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7EABC636CC
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 10:49:40 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.80841.1675766971907828539
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 02:49:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Umr1IjAm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 58EB61C0003;
	Tue,  7 Feb 2023 10:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675766970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v1MxEEdV4enkpjpelmxiLCWUVNPgXZlNLMxKsgZoBNU=;
	b=Umr1IjAms+ZANXvupIomHlpMWKvvNWpJ00xtH/7BReN3jWKK/GrVMRK3oebtJjkiGhlTru
	q6fX19rvlZnnj8EWVn4ll/v2i/U8gKUZsADsh4hPP8HBcHOYq2hM6vOsOJiB62sGcUanur
	u+Rj+65Os9XpRayhDEHEEcvKmMs923k+9uUBfHulI3wJEaT1wIa9ukfKOKLpYgeG8GbDfH
	4v71OoGV2dzjZvCQE5aOrZlrM2UtiRgWGuQ/K947iKBKLQlZYc6gEG+gV/46bQUI15T0or
	IuI6GpUPexmTSjJZmoyq6oVGyCJkyENolwjcoWK8ALjwMV+XNUMHesVHVtbzsA==
Date: Tue, 7 Feb 2023 11:49:26 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Kareem Zarka" <zarkakareem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Stefan Schmidt
 <stefan.schmidt@huawei.com>, Kareem Zarka <kareem.zarka@huawei.com>
Subject: Re: [OE-core] [PATCH] wic/plugins/source/bootimg-efi: Skip
 installing kernel-image into boot.
Message-ID: <20230207114926.0c04b79d@booty>
In-Reply-To: <20230206191615.2675373-1-kareem.zarka@huawei.com>
References: <20230206191615.2675373-1-kareem.zarka@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 10:49:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176812

Hello Kareem,

thanks for your patch.

I have a few suggestions to improve it, see below.

On Mon,  6 Feb 2023 20:16:14 +0100
"Kareem Zarka" <zarkakareem@gmail.com> wrote:

> The issue with installing the kernel-image to both rootfs
> and boot partition is that some systems rely on the kernel-image in
> rootfs and not in the boot partition.
> This leads to duplication of the kernel-image, which can cause
> unnecessary storage usage and potential compatibility issues.

Except for the use of unnecessary storage, I don't understand exactly
what problems can be created by duplication.

> This patch provides a solution to this problem by adding a new
> parameter "skip-kernel-install" to the wic kickstart file, which can
> be passed to the plugin.
> If the parameter is provided, the plugin will skip installing the
> kernel-image to the boot partition, avoiding duplication and potential
> issues.
> 
> By adding this new parameter, we give the users the option to install
> the kernel-image only in rootfs, or to install it in both rootfs and
> boot partition, depending on their needs and preferences.
> This will help to improve the system's storage usage and compatibility.
> 
> Tests for this functionality will be added in the next patch.
> 
> Signed-off-by: Kareem Zarka <kareem.zarka@huawei.com>
> ---
>  scripts/lib/wic/plugins/source/bootimg-efi.py | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
> index 4b00913a70..363b9f5242 100644
> --- a/scripts/lib/wic/plugins/source/bootimg-efi.py
> +++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
> @@ -363,9 +363,13 @@ class BootimgEFIPlugin(SourcePlugin):
>                  objcopy_cmd += " %s %s/EFI/Linux/linux.efi" % (efi_stub, hdddir)
>                  exec_native_cmd(objcopy_cmd, native_sysroot)
>          else:
> -            install_cmd = "install -m 0644 %s/%s %s/%s" % \
> -                (staging_kernel_dir, kernel, hdddir, kernel)
> -            exec_cmd(install_cmd)
> +            # skip-kernal-install was added to source_params to conifgure installing the kernel-image.
> +            # set skip_kernal_install in the kickstart file to skip installing it into hdddir.
> +            # if not set then the kernel-image will be installed.

s/conifgure/configure/
Also check underscores vs dashes.

A comment in the code is welcome, but it should not include the history
of why this got added. When someone will read this three years from now
they don't care. So just remove the first line.

> +            if not  source_params.get('skip-kernal-install'):

s/kernal/kernel/, also on other lines.
Also remove the unneeded double space.

Out of personal taste, I would prefer a positive logic rather than a
negative one, e.g.:

    if source_params.get('install-kernel-into-boot-dir') != "false":

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

