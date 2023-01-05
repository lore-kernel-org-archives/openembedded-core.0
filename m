Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E154EC3DA7D
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 14:23:21 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web11.13737.1672928599101485215
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jan 2023 06:23:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Ghw5hCSp;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 96D98240005;
	Thu,  5 Jan 2023 14:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672928597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MC57V2De9WehMM04xgZjn4cvZr0S6kEfWvlL/JYkgr4=;
	b=Ghw5hCSpwtdT67ebDI7+KW3fEEa1bGeOtxr3hg/OBjFO8XGVUCkwyoLcr822QIg4QfeAPz
	MsG0caPaTgT0NfesG7quilxdAzpKw7ajJVzCV1oJpt3kyOdYmTDpOvz/NsybXhRSsDY6yt
	lCbagbdjtcTdMqUAn5vGZui37kFgB68wuQEo8SxGLKeKuSDnjSEuzRa++IWiyO/YTaDdqW
	URqzQOggKgl1dQw/he4MagP7a249jGtcMqNVeQ1gdxRNg1AA63jwb38SedMOp/7tB2o+wt
	r96PoPZMGcz/XuJi9tTNx5Bcsg0ye95ZQ92Ai0KIVV2bOv2kq/VrD/IBod2d0Q==
Message-ID: <b725dbd2-3825-1eb7-3f71-a19a17c2ef7f@bootlin.com>
Date: Thu, 5 Jan 2023 15:23:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>, "Robert P. J. Day" <rpjday@crashcourse.ca>,
 YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [OE-core] is "poky" distro defined to use "sysvinit" as
 INIT_MANAGER?
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <2893205d-57e1-e63e-5c12-c57c7bbcb924@crashcourse.ca>
 <CAMKF1spKw-X-JTvdicfBBNNGk93EPL=gqD3jixvJkb7YfT1P0g@mail.gmail.com>
 <1736D38C7177CA6A.6604@lists.openembedded.org>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <1736D38C7177CA6A.6604@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 14:23:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175531


Am 03.01.23 um 15:41 schrieb Michael Opdenacker via lists.openembedded.org:
> Hello Richard,
>
> Trying to improve the documentation about the selection of the init 
> system, I'm jumping back to this old conversation, following a change 
> that you made (https://lists.yoctoproject.org/g/poky/message/12760).
>
> Am 06.07.22 um 18:40 schrieb Khem Raj:
>> On Wed, Jul 6, 2022 at 12:38 PM Robert P. J. Day 
>> <rpjday@crashcourse.ca> wrote:
>>>
>>>    not sure why i never noticed this before, but i started a new
>>> project from the poky layer (not OE), and realized that poky.conf
>>> explicitly sets:
>>>
>>>    INIT_MANAGER = "sysvinit"
>>>
>>> which can't be overridden in my local.conf. if i want systemd, i guess
>>> i can initialize my project from the OE layer, and i also notice that
>>> i could use poky-altcfg.conf.
>>>
>>>    but is there a reason that the default poky-based project fixes
>>> INIT_MANAGER to "sysvinit". perhaps just for simplicity?
>>>
>> poky defaults to sysvinit.
>> poky has poky-alt distro fi you want to use say systemd
>
> But why not setting INIT_MANAGER with "?=" instead of "=" in poky.conf?
>
> This way, we could just override INIT_MANAGER from local.conf.
>
> I checked that the generated system works. This would make things 
> easier to document, unless I'm missing other reasons.


Richard told me on IRC that, from memory, this was set because of 
interference poky-altcfg (if I understood correctly).

I understand one recommended way to have systemd instead of sysvinit in 
Poky is to use "poky-altcfg" instead of "poky" as distro.

Similarly, I guess I should use "poky-tiny" if I want to use 
"mdev-busybox" as INIT_MANAGER.

Then, I guess I'll document something like this:

  * With the OpenEmbedded build system, you can choose your init system
    by setting INIT_MANAGER to "sysvinit", "systemd", "busybox-mdev" or
    "none"
  * BUT if you're using Poky, that won't work, so your options will be
    to use either "poky" (sysvinit), "poky-altcfg" (systemd) or
    "poky-tiny" (mdev-busybox).

Does this sound like the right way to document this?

Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


