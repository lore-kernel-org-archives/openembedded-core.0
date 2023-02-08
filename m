Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CEBAC636D3
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 22:20:17 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.13043.1675894810702177172
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Feb 2023 14:20:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=TgOSCV9b;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BC25EFF803;
	Wed,  8 Feb 2023 22:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675894808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4pwlC3W5nrYeoBP5u5MLWaFuaAubCSN6FINKLi2GQGI=;
	b=TgOSCV9b/Cm5mGr9W8Ys30js2wa0edorZowQ+RyVBsqw37krHCcN+cjuPzpstLbWhGcghP
	CneELTb8gq2KKs1y8Q5+mVdEsdcomrfqYhJoxAyA+8beyNDqKdq6/x+mLiK5K3WxF3ToLx
	dggpfPWdVGvqi7U+hQqr/4PylbZJmvSvc5FThT8EBXNJzq3pxymU8sWor79E5g6pEtq/Eu
	Emsni5cZF/6V0KYFL++n67VsNhJiVu+nlf+eYX6/aTZNWLTkLYPVifNIz9K6M8lIzdeo2q
	fCv2WJ5twvqYg/IyxV6dc7JWhhXIFGf9b1BOCBKVSFoQTFBy0P6z+Rw/g8zCvQ==
Date: Wed, 8 Feb 2023 23:20:06 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Kareem Zarka" <zarkakareem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Stefan Schmidt
 <stefan.schmidt@huawei.com>, Kareem Zarka <kareem.zarka@huawei.com>
Subject: Re: [OE-core] [PATCH] wic/plugins/source/bootimg-efi: Configure
 installation of
Message-ID: <20230208232006.7e3e08ab@booty>
In-Reply-To: <20230207190305.3071923-1-kareem.zarka@huawei.com>
References: <20230207190305.3071923-1-kareem.zarka@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 22:20:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176912

Hi Kareem,

On Tue,  7 Feb 2023 20:03:04 +0100
"Kareem Zarka" <zarkakareem@gmail.com> wrote:

> The issue with installing the kernel image to both rootfs
> and boot partition is that some systems rely on the kernel image in
> rootfs and not in the boot partition.
> This leads to duplication of the kernel image, which can cause
> unnecessary storage usage.
> 
> This patch provides a solution to the problem by adding a new parameter
> "install-kernel-into-boot-dir" to the wic kickstart file.
> If this parameter is set to 'true', the plugin will install the
> kernel image to the boot partition. If the parameter is set to 'false',
> the plugin will skip installing the kernel image, avoiding duplication.
> 
> Tests for this functionality will be added in the next patch.
> 
> Signed-off-by: Kareem Zarka <kareem.zarka@huawei.com>

I think your subject line is missing something: "Configure installation
of.. what?"

About the content, testing on the autobuilders with these patches
revealed this error:

AssertionError: Command 'wic cp /home/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-3401455/wic-tmp/tmp7rdi3u6g-202302081514-sda.direct:1 /tmp/tmpenbv64e3' returned non-zero exit status 1:
ERROR: Can't find executable 'mcopy'

Can you check that?

Here are some logs:

https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/929/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/4726/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/4778/steps/14/logs/stdio

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

