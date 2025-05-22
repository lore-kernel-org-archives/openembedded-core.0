Return-Path: <a.fatoum@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E15C54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 12:38:29 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.22733.1747917500482468476
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 05:38:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: a.fatoum@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uI5Bh-0004Cu-N3; Thu, 22 May 2025 14:38:17 +0200
Message-ID: <01e21e2c-3b4a-426d-8dcc-a956e83c4632@pengutronix.de>
Date: Thu, 22 May 2025 14:38:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [yocto] [PATCH v4 07/16] kernel-fit-image.bbclass: add a new FIT
 image implementation
To: "Freihofer, Adrian" <adrian.freihofer@siemens.com>,
 Marco Felsch <m.felsch@pengutronix.de>
Cc: "marex@denx.de" <marex@denx.de>,
 "yocto@pengutronix.de" <yocto@pengutronix.de>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250519110838.82978-1-adrian.freihofer@siemens.com>
 <20250519110838.82978-8-adrian.freihofer@siemens.com>
 <20250519201556.m5cve4ufizexazuy@pengutronix.de>
 <90f23d0316b620b0654efb1fb51755d6c8dfc0e4.camel@siemens.com>
Content-Language: en-US
In-Reply-To: <90f23d0316b620b0654efb1fb51755d6c8dfc0e4.camel@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 12:38:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217100

Hello Adrian,

On 20.05.25 15:27, Freihofer, Adrian wrote:
> On Mon, 2025-05-19 at 22:15 +0200, Marco Felsch wrote:
>>> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>>> +    # Collect all the its nodes before the its file is generated
>>> and mkimage gets executed
>>> +    root_node = oe.fitimage.ItsNodeRootKernel(
>>> +        d.getVar("FIT_DESC"), d.getVar("FIT_ADDRESS_CELLS"),
>>> +        d.getVar('HOST_PREFIX'), d.getVar('UBOOT_ARCH'), 
>>> d.getVar("FIT_CONF_PREFIX"),
>>> +        oe.types.boolean(d.getVar('UBOOT_SIGN_ENABLE')),
>>> d.getVar("UBOOT_SIGN_KEYDIR"),
>>
>> Since FIT is bootloader agnostic I would like to see to rename the
>> UBOOT_* related variables, since there are bootloaders which supports
>> FIT as well e.g. barebox:
>>  -
> 
> The new fitimage.py script enables the creation of FIT images without a
> strict dependency on U-Boot or any specific bootloader. This change is
> a step toward greater code sharing and compatibility with various
> bootloaders.

Nice. The existing class has shortcomings and I am happy
to see decoupling being pursued, whether in meta-oe's fitimage.bbclass
or here.

> The kernel-fit-image.bbclass integrates FIT image generation into the
> kernel build process and leverages the existing U-Boot signing
> infrastructure. This is where the UBOOT_* variables are utilized.

The name was even a misnomer when it was added. It's interfacing with
mkimage foremost. IIUC, the U-Boot signing shenanigans are isolated
to a separate uboot-sign.bbclass anyway, so mixing the variable
namespaces is unfortunately misleading.

> U-Boot has been maintained and integrated with OE/Yocto since many
> years. FIT image support was added around 8 years ago.

barebox has been able to boot the same signed FIT images that are generated
by kernel-fitimage.bbclass for quite some time, even if the UBOOT_
variables looked out of place, fwiw.

> A large
> community relies on the stable integration between U-Boot and OE/Yocto,
> with many years of backward compatibility.

Your patch set shows that this is not the ultimate consideration.
Decoupling will break users and doing cleanup in the same go is arguably
a good idea.

> Renaming these variables
> would disrupt a well-established interface.

inherit kernel-fitimage is a well-established interface as well, which
will start throwing an error as is having the same recipe.

Is that a reason not to change them? No, we are pragmatic, add an error
message and move on. For the signing variables, one could add a new set
of variables with better names, which defaults to the value of the old names.

We will surely still use FIT image somewhere 8 years from now and
the second best time to name things appropriately is now.

> Therefore, this patch set
> focuses on improving the existing code while maintaining backward
> compatibility. Introducing support for a fork of u-boot is not on my
> todo list.

FIT image has a stand-alone specification now and support is available
also in coreboot, Linuxboot, Tianocore, ...etc., even if they don't
go as far as U-Boot and barebox in supporting its wide feature set.

A few years ago, the kernel-fitimage.bbclass was extended to add
a compatible property into the configurations to avoid having to
look into each individual device tree. This change was motivated
by supporting older barebox versions that didn't yet bother to
recursively parse embedded device trees.

Now everyone benefits from this and saves a slight bit of boot time.

> But as mentioned, this patch-set is probably beneficial for that as
> well.

I have yet to look at the series in detail, but I have been long
bothered by FIT images being coupled to the kernel when I wanted
more than one FIT image. Tying to the bootloader was avoidable if one knew
where to look, but simplification is most welcome.

> But if you decide to fork a bootloader, please do not expect that
> others who are very well served with the original bootloader will spend
> effort on integrating or maintaining a second bootloader or even break
> the long proven implementation.

It's your prerogative as patch author to pick the parts you want to
break or not and it's normal for people to comment on that.

There is no need to be combative about it. We have all a vested interest
in making OE-core even better and are engaging in good faith discussion
to achieve this.

Thanks for putting in the work and I am curious to see where this goes.
I will make sure to give this a test in the coming weeks to verify
that no unexpected regressions are introduced for barebox at least.

With best regards,
Ahmad Fatoum

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

