Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B71C02183
	for <webhook@archiver.kernel.org>; Sun, 19 Jan 2025 14:19:45 +0000 (UTC)
Received: from mx.denx.de (mx.denx.de [89.58.32.78])
 by mx.groups.io with SMTP id smtpd.web10.15880.1737296379878094076
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jan 2025 06:19:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=mx-20241105 header.b=RD4bW1Uz;
 spf=pass (domain: denx.de, ip: 89.58.32.78, mailfrom: marex@denx.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B47191040DBC5;
	Sun, 19 Jan 2025 15:19:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1737296377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M7gtwcxNK+W9xKiXlBv2e1IdGj5bQV7yMEkM/BPr/G8=;
	b=RD4bW1UzDUya8U9XW0gNZyba8pUXBnWm1yMzmaKeQi3ig9J5fKo+gnw7Tbmm2f7naxaj71
	q6EMRkgjbgvUCd6xC2ymapavYeVgnxvPlnsQukwLVZaOzcXxGoULUIUgctcJ92EM4In+Fh
	C0w0qtRKZ8tEJ8dFl/9DQaCbfxnWsODLT3d8+0FRV55dnY/dX7fD6D0erPbxQ/g9DhEre+
	60vk8HGYPBNIuxVgPZ5WIKXHYPxSMLPpMEKTMmj973eIzQZFOh1igNPHcyBSaFjMYRd87G
	iYlTMyc5VRospfEBtvj20SUXEE0hoeTBc+m4Egl4GJaB+R1Svffr56T7qgFwiw==
Message-ID: <334ccaf1-c068-4455-927c-0941fe9173d1@denx.de>
Date: Sun, 19 Jan 2025 15:16:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] u-boot: kernel-fitimage: Fix dependency loop
 if UBOOT_SIGN_ENABLE and UBOOT_ENV enabled
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Sean Anderson <sean.anderson@seco.com>
References: <20250114010202.95843-1-marex@denx.de>
 <D71O2LIHDS5O.VUCRVWWZYSFN@bootlin.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <D71O2LIHDS5O.VUCRVWWZYSFN@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jan 2025 14:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210009

On 1/14/25 9:52 AM, Mathieu Dubois-Briand wrote:
> On Tue Jan 14, 2025 at 2:01 AM CET, Marek Vasut via lists.openembedded.org wrote:
>> In case both UBOOT_SIGN_ENABLE and UBOOT_ENV are enabled and
>> kernel-fitimage.bbclass is in use to generate signed kernel
>> fitImage, there is a circular dependency between uboot-sign
>> and kernel-fitimage bbclasses . The loop looks like this:
>>
>> kernel-fitimage.bbclass:
>> - do_populate_sysroot depends on do_assemble_fitimage
>>    - do_assemble_fitimage depends on virtual/bootloader:do_populate_sysroot
>>      - virtual/bootloader:do_populate_sysroot depends on virtual/bootloader:do_install
>>        => The virtual/bootloader:do_install installs and the
>>           virtual/bootloader:do_populate_sysroot places into
>>           sysroot an U-Boot environment script embedded into
>>           kernel fitImage during do_assemble_fitimage run .
>>
>> uboot-sign.bbclass:
>> - DEPENDS on KERNEL_PN, which is really virtual/kernel. More accurately
>>    - do_deploy depends on do_uboot_assemble_fitimage
>>    - do_install depends on do_uboot_assemble_fitimage
>>    - do_uboot_assemble_fitimage depends on virtual/kernel:do_populate_sysroot
>>      => do_install depends on virtual/kernel:do_populate_sysroot
>>
>> => virtual/bootloader:do_install depends on virtual/kernel:do_populate_sysroot
>>     virtual/kernel:do_populate_sysroot depends on virtual/bootloader:do_install
>>
>> Attempt to resolve the loop. Pull fitimage_assemble() into separate new bbclass
>> kernel-fitimage-its.bbclass and split fitimage_assemble() into two functions,
>> fitimage_assemble_its() to generate the fit-image.its and fitimage_assemble_itb()
>> to run mkimage on fit-image.its and produce the final fitImage-none fitImage.
>>
>> Inherit kernel-fitimage-its.bbclass in uboot-sign.bbclass and use these two
>> new functions to generate a dummy signed fitImage which, instead of containing
>> any meaningful blobs as payloads contains a dummy u-boot.dtb as payload for
>> every single blob included in the fitImage. The placement of signature {}
>> nodes in this dummy signed fitImage exactly matches the final signed kernel
>> fitImage, which is very important.
>>
>> The follow up mkimage invocation which inserts public key material into
>> u-boot.dtb /signature {} node does not care about the content of the dummy
>> signed fitImage blobs, that mkimage invocation only cares about the placement
>> of signature {} nodes in that dummy signed fitImage. That mkimage invocation
>> uses the placement of these signature {} nodes to construct u-boot.dtb
>> /signature/<key> 'required' property content, which is used by U-Boot
>> when authenticating blobs in the fitImage using the public <key> that
>> was currently inserted into the u-boot.dtb by mkimage .
>>
>> Fixes: 5e12dc911d0c ("u-boot: Rework signing to remove interdependencies")
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> ---
> 
> Hi Marek,
> 
> I believe this patch is breaking the oe-selftests on the autobuilder,
> with the following error:
> 
> ERROR: linux-yocto-6.12.9+git-r0 do_assemble_fitimage: Execution of '/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-844261/tmp/work/qemux86_64-poky-linux/linux-yocto/6.12.9+git/temp/run.do_assemble_fitimage.1950022' failed with exit code 127
> ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-844261/tmp/work/qemux86_64-poky-linux/linux-yocto/6.12.9+git/temp/log.do_assemble_fitimage.1950022
> Log data follows:
> | DEBUG: Executing shell function do_assemble_fitimage
> | /srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-844261/tmp/work/qemux86_64-poky-linux/linux-yocto/6.12.9+git/temp/run.do_assemble_fitimage.1950022: line 150: fitimage_assemble: command not found
> | WARNING: /srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-844261/tmp/work/qemux86_64-poky-linux/linux-yocto/6.12.9+git/temp/run.do_assemble_fitimage.1950022:150 exit 127 from 'fitimage_assemble fit-image.its fitImage-none ""'
> | WARNING: Backtrace (BB generated script):
> | 	#1: do_assemble_fitimage, /srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-844261/tmp/work/qemux86_64-poky-linux/linux-yocto/6.12.9+git/temp/run.do_assemble_fitimage.1950022, line 150
> | 	#2: main, /srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-844261/tmp/work/qemux86_64-poky-linux/linux-yocto/6.12.9+git/temp/run.do_assemble_fitimage.1950022, line 157
> NOTE: recipe linux-yocto-6.12.9+git-r0: task do_assemble_fitimage: Failed
> 
> https://valkyrie.yoctoproject.org/#/builders/48/builds/726/steps/14/logs/stdio
> 
> Can you have a look at this issue please ?
Hopefully fixed in V4 , in an even better way.

