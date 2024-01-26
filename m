Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A59C47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 14:22:52 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.17200.1706278962601283660
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 06:22:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Xq6CRcaf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 18587FF80E;
	Fri, 26 Jan 2024 14:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706278960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7xDktYb+iGGQu7B0LihuzgS0TcGO/uvNN5w+8++AQrY=;
	b=Xq6CRcafqYnnjqYyd1f5h8Wefp443+oQU3T1wzcmP7KLtIL4jjEfkgmCB7oH8PPUDFJdQi
	FPNOfCA/rJZgPAiwwT3AoTwCrsbPNxOvh8kmpjQH9r1F6/smWsgHMSquKJnkv8P5C9vaAY
	gRDY/Q3MvDQDK4JKBfYpAdv9H70u87pT3NL4FquMyxbkwV6QDOcBYkyjXcVEQSexmeeRFW
	RyYliDqgbCjC3ynVuZtjuoPY23G6Uznn6Ku+NraCBjHm5l7pXNX48psOFQBVAq9jHRqpxT
	JpZDxtPDEzYPG2MgnuE5vC7RfU9uCckdkT0lpAQ3cql4QLwMXh/OmRRaE+8hig==
Date: Fri, 26 Jan 2024 15:22:38 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Adithya Balakumar <adithya.balakumar@toshiba-tsip.com>
Cc: openembedded-core@lists.openembedded.org,
	shivanand.kunijadar@toshiba-tsip.com,
	sai.sathujoda@toshiba-tsip.com, dinesh.kumar@toshiba-tsip.com,
	kazuhiro3.hayashi@toshiba.co.jp, jan.kiszka@siemens.com
Subject: Re: [OE-Core][PATCH v1] wic: implement reproducible Disk GUID
Message-ID: <20240126142238d9357689@mail.local>
References: <20240122122521.2605264-1-Adithya.Balakumar@toshiba-tsip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240122122521.2605264-1-Adithya.Balakumar@toshiba-tsip.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 14:22:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194384

Hello,

This causes oe-selftest failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/6342/steps/15/logs/stdio

2024-01-25 02:21:53,130 - oe-selftest - INFO - RESULTS - runqemu.RunqemuTests.test_boot_machine_slirp_qcow2: ERROR (1028.13s)
2024-01-25 02:21:53,131 - oe-selftest - INFO - RESULTS - runqemu.RunqemuTests.test_boot_recipe_image_vdi: ERROR (1031.11s)
2024-01-25 02:21:53,131 - oe-selftest - INFO - RESULTS - runqemu.RunqemuTests.test_boot_recipe_image_vmdk: ERROR (1075.13s)
2024-01-25 02:21:53,131 - oe-selftest - INFO - RESULTS - wic.Wic2.test_biosplusefi_plugin_qemu: ERROR (1037.31s)
2024-01-25 02:21:53,131 - oe-selftest - INFO - RESULTS - wic.Wic2.test_efi_plugin_unified_kernel_image_qemu: ERROR (1953.51s)
2024-01-25 02:21:53,131 - oe-selftest - INFO - RESULTS - wic.Wic2.test_rawcopy_plugin_qemu: ERROR (1187.55s)

On 22/01/2024 17:55:21+0530, Adithya Balakumar wrote:
> From: Adithya Balakumar <adithya.balakumar@toshiba-tsip.com>
> 
> GPT based disks have a disk guid apart from the 32-bit disk identifier.
> This commit implements reproducible disk guid by using SOURCE_DATE_EPOCH (if available) value as a random seed
> 
> Signed-off-by: Adithya Balakumar <adithya.balakumar@toshiba-tsip.com>
> ---
>  scripts/lib/wic/plugins/imager/direct.py | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
> index 9b619e41c1..d0f8481c2e 100644
> --- a/scripts/lib/wic/plugins/imager/direct.py
> +++ b/scripts/lib/wic/plugins/imager/direct.py
> @@ -530,6 +530,21 @@ class PartitionedImage():
>          exec_native_cmd("parted -s %s mklabel %s" % (device, ptable_format),
>                          self.native_sysroot)
>  
> +    def _write_disk_guid(self):
> +        if os.getenv('SOURCE_DATE_EPOCH'):
> +            if self.ptable_format in ('gpt', 'gpt-hybrid'):
> +                self.disk_guid = uuid.UUID(int=int(os.getenv('SOURCE_DATE_EPOCH')))
> +            elif self.ptable_format == "msdos":
> +                self.disk_guid = '0x' + str(uuid.UUID(int=int(os.getenv('SOURCE_DATE_EPOCH'))).int & 0xFFFFFFFF)[:8]
> +        else:
> +            if self.ptable_format in ('gpt', 'gpt-hybrid'):
> +                self.disk_guid = uuid.uuid4()
> +            elif self.ptable_format == "msdos":
> +                self.disk_guid = '0x' + str(uuid.uuid4())[:8]
> +
> +        logger.debug("Set disk guid %s", self.disk_guid)
> +        sfdisk_cmd = "sfdisk --disk-id %s %s" % (self.path, self.disk_guid)
> +        exec_native_cmd(sfdisk_cmd, self.native_sysroot)
>  
>      def create(self):
>          self._make_disk(self.path,
> @@ -537,6 +552,7 @@ class PartitionedImage():
>                          self.min_size)
>  
>          self._write_identifier(self.path, self.identifier)
> +        self._write_disk_guid()
>  
>          if self.ptable_format == "gpt-hybrid":
>              mbr_path = self.path + ".mbr"
> -- 
> 2.39.2
> 
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194145): https://lists.openembedded.org/g/openembedded-core/message/194145
> Mute This Topic: https://lists.openembedded.org/mt/103884949/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

