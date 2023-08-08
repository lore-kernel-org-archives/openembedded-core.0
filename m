Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED41C001B0
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 10:43:19 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.58566.1691491394878167052
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Aug 2023 03:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Q1JXLhgB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E15F240008;
	Tue,  8 Aug 2023 10:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691491392;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IbH3zR8qro7an9PjVmX0IgW2lb71yhFO7CdJXWyW2cQ=;
	b=Q1JXLhgBvpoQQtZ5L9V2nlFi1/T2MjXrEok3vYY00Of0dkV1txoBRz12TpCFyU0nAl+Yei
	OaZ+lVhvblB1XcHlOxcHukpLbDgcO+mFWw4pGxJpJK+pLW20LgbHvMaLUiOvx7o9YUHlhx
	RaBAVsD6pAHmF4IUwCIyK7N50kTy9RCvQBXh36GET89toJD3L29Se8r4pJaVJZ3bif65Qj
	l3KB5q5uSmttbjROfnf5X480CY0dZFYVBIeyTjl13EXUGKASCLiTwZ1BshuA7EjoeYjzTk
	+RsxXzYsqJED2qmr3qUtHDwm1Ehu6tNlXOF4RsaUVDwpb2W5h4tNSdcPwQzhrg==
Date: Tue, 8 Aug 2023 12:43:11 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 0/7] linux-yocto: consolidated kernel pull
 request
Message-ID: <2023080810431190bf01b5@mail.local>
References: <cover.1691465503.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1691465503.git.bruce.ashfield@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 10:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185658

Hello Bruce,

While I didn't test this series yet, as discussed, I've tried to switch
to 6.4 by default. I got this warning:

https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/7876/steps/13/logs/stdio

WARNING: linux-yocto-tiny-6.4.3+gitAUTOINC+dab56f52aa_dee78ad196-r0 do_kernel_configcheck: [kernel config]: specified values did not make it into the kernel's final configuration:
    [NOTE]: 'CONFIG_USB_HID' last val (y) and .config val (n) do not match
    [INFO]: CONFIG_USB_HID : n 
    [INFO]: raw config text:
        config USB_HID
        	tristate "USB HID transport layer"
        	default y
        	select HID
        	depends on USB && INPUT && USB && HID_SUPPORT
        	help
        	  Say Y here if you want to connect USB keyboards,
        	  mice, joysticks, graphic tablets, or any other HID based devices
        	  to your computer via USB, as well as Uninterruptible Power Supply
        	  (UPS) and monitor control devices.
	  
        	  You can't use this driver and the HIDBP (Boot Protocol) keyboard
        	  and mouse drivers at the same time. More information is available:
        	  <file:Documentation/input/input.rst>.
	  
        	  If unsure, say Y.
	  
        	  To compile this driver as a module, choose M here: the
        	  module will be called usbhid.
        Config 'USB_HID' has the following Direct dependencies (USB_HID=n):
                USB(=y) && INPUT(=y) && HID_SUPPORT(=n)
        Parent dependencies are:
             INPUT [y] USB [y] HID_SUPPORT [n]
    [INFO]: config 'CONFIG_USB_HID' was set, but it wasn't assignable, check (parent) dependencies


master has 86adbe4db668 ("linux-yocto-tiny/6.4: fix configuration
warnings (HID)") so I guess there is something missing.


On 07/08/2023 23:35:46-0400, Bruce Ashfield wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Richard,
> 
> Here's my queued set of -stable updates (as well as a -dev kernel bump).
> 
> I've got another round of updates under test, and will send them when
> ready.
> 
> 6.4 marches along, it'll be up to date when those last issues keeping
> it from being the default are resolved.
> 
> Bruce
> 
> The following changes since commit 058a44165ce375f405063e73a9fcd1b2757ef8da:
> 
>   bitbake: fetch2: Check if path is 'None' before calculating checksums (2023-08-04 11:48:26 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.yoctoproject.org/poky-contrib zedd/kernel
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
> 
> Bruce Ashfield (7):
>   linux-yocto/6.4: fix CONFIG_LEDS_TRIGGER_GPIO kernel audit warning
>   linux-yocto/6.4: update to v6.4.6
>   linux-yocto/6.1: update to v6.1.41
>   linux-yocto/6.4: update to v6.4.7
>   linux-yocto-dev: bump to v6.5+
>   linux-yocto/6.4: update to v6.4.8
>   linux-yocto/6.1: update to v6.1.43
> 
>  meta/recipes-kernel/linux/linux-yocto-dev.bb  |  4 +--
>  .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
>  .../linux/linux-yocto-rt_6.4.bb               |  6 ++--
>  .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
>  .../linux/linux-yocto-tiny_6.4.bb             |  6 ++--
>  meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
>  meta/recipes-kernel/linux/linux-yocto_6.4.bb  | 28 +++++++++----------
>  7 files changed, 42 insertions(+), 42 deletions(-)
> 
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185630): https://lists.openembedded.org/g/openembedded-core/message/185630
> Mute This Topic: https://lists.openembedded.org/mt/100615695/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

