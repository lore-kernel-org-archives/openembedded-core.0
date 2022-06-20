Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD304C43334
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 14:16:57 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.30526.1655734615891345432
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 07:16:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=h9N/sBbQ;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B4501240009;
	Mon, 20 Jun 2022 14:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655734614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mGZdgI7j7QEIjFTUpBfTz020RSp1DPFZSpPU8/URtYU=;
	b=h9N/sBbQWCnz7Km6qzQziUew/bJstCcrPGMfJ+xx3suVKoCyvVFVPu8a64hoeD6qbjR4LB
	Omft4jrww1PtCI4R4c1XBdrRecMiZOiYtjMP3BVnPgbHOvJwc9EIjFRnWAepV9FYkj2y4u
	Xgb5dGZqWRU9A2f+q6KKcpTo9sND/w6JXg72mhXd560w2wnnhb0rpzlXKxZOPqSIRSWnmB
	Q0MPUzexQwoUd5GC3brxRV5NmIn6FuxTYWskseQSSDq1TUwgy36/bFT/7zBfUSasgfuz/J
	wdSla9p3LHpC4G3eQyqnldDYPkM4e31IMu8AsVrYttjeMkVQVJwkIQWt33tj+g==
Message-ID: <e8affe9f-846e-b36e-8156-ca768a75ab9c@bootlin.com>
Date: Mon, 20 Jun 2022 16:16:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core][PATCH] kernel-uboot.bbclass: Use vmlinux.initramfs when
 INITRAMFS_IMAGE_BUNDLE set
Content-Language: en-US
To: Raju Kumar Pothuraju <raju.kumar-pothuraju@xilinx.com>,
 openembedded-core@lists.openembedded.org
References: <20220620134019.16951-1-raju.kumar-pothuraju@xilinx.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220620134019.16951-1-raju.kumar-pothuraju@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jun 2022 14:16:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167114

Hi Raju,

On 6/20/22 15:40, Raju Kumar Pothuraju wrote:
> vmlinux file doesnot have the initramfs image when INITRAMFS_IMAGE_BUNDLE was set.
> Use vmlinux.initramfs in uboot_prep_kimage when INITRAMFS_IMAGE_BUNDLE set
> based on the implementation in kernel.bbclass do_bundle_initramfs function,
> https://github.com/openembedded/openembedded-core/blob/master/meta/classes/kernel.bbclass#L316-L317
> to be able to use proper linux.bin file in creation of fitImage.
>
> Signed-off-by: Raju Kumar Pothuraju <raju.kumar-pothuraju@xilinx.com>
> ---
>   meta/classes/kernel-uboot.bbclass | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/meta/classes/kernel-uboot.bbclass b/meta/classes/kernel-uboot.bbclass
> index 2daa068298..180e7cf066 100644
> --- a/meta/classes/kernel-uboot.bbclass
> +++ b/meta/classes/kernel-uboot.bbclass
> @@ -15,6 +15,12 @@ uboot_prep_kimage() {
>   		linux_comp="none"
>   	else
>   		vmlinux_path="vmlinux"
> +		# Use vmlinux.initramfs for linux.bin when INITRAMFS_IMAGE_BUNDLE set
> +		# As per the implementation in kernel.bbclass.
> +		# See do_bundle_initramfs function
> +		if [ x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then


Thanks for the patch!
By the way, why this weird x"${VAR}" = x1 trick?

I see it elsewhere in the class code, so I understand why you took it, 
but why not just the following?

if [ "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then

Thanks again

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


