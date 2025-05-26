Return-Path: <a.fatoum@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE6EFC54FB3
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 19:09:03 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.35524.1748286536869836356
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 May 2025 12:08:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: a.fatoum@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1uJdBt-00040D-PH; Mon, 26 May 2025 21:08:53 +0200
Message-ID: <adbb5ba6-cb06-4b58-8981-61ce8feb4c91@pengutronix.de>
Date: Mon, 26 May 2025 21:08:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
 <01e21e2c-3b4a-426d-8dcc-a956e83c4632@pengutronix.de>
 <b9506b3b3ec1d9a4fb170cf41744827ffa506ad6.camel@siemens.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <b9506b3b3ec1d9a4fb170cf41744827ffa506ad6.camel@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 19:09:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217274

Hi Adrian,

On 22.05.25 17:26, Freihofer, Adrian wrote:
> On Thu, 2025-05-22 at 14:38 +0200, Ahmad Fatoum wrote:
>> On 20.05.25 15:27, Freihofer, Adrian wrote:
>> The name was even a misnomer when it was added. It's interfacing with
>> mkimage foremost. IIUC, the U-Boot signing shenanigans are isolated
>> to a separate uboot-sign.bbclass anyway, so mixing the variable
>> namespaces is unfortunately misleading.
> 
> The kernel-fit-image.bbclass (or kernel-fitimage.bbclass) generates an
> ITS file tailored specifically to the kernel and its associated
> artifacts, such as paths and file names. As a result, most of the code
> relies on kernel-specific variables.

Exactly.

> Having a bbclass dedicated to this use case makes it easier to test,
> document, and use the class effectively. In contrast, a generic FIT
> image class would not provide this level of clarity or usability. For
> these reasons, it makes sense for the bbclass name to start with
> "kernel-" but have a more generic Python library named fitimage.py
> which should be useful or alt least extendable for other use cases as
> well.

That's certainly one way to do it, yes. I think either is an improvement
over the current situation.

>>> U-Boot has been maintained and integrated with OE/Yocto since many
>>> years. FIT image support was added around 8 years ago.
>>
>> barebox has been able to boot the same signed FIT images that are
>> generated
>> by kernel-fitimage.bbclass for quite some time, even if the UBOOT_
>> variables looked out of place, fwiw.
> 
> If you look at the code history, you’ll see that the decoupling between
> the U-Boot and kernel builds has improved significantly over time.

All the more reason to clear up the naming.

> In
> the past, there were reasons for naming some variables with the UBOOT_
> prefix, as they were used by both U-Boot and the kernel build classes.
> Even now, some variables—such as those used to add the public signing
> key to U-Boot’s device tree—are still shared. That said, renaming these
> variables to something like FIT_* would probably make more sense at
> this point.

Agreed.

>> We will surely still use FIT image somewhere 8 years from now and
>> the second best time to name things appropriately is now.
>>
> 
> What I meant is that this patch set aims to minimize breaking changes,
> making only those necessary to address the issues discussed in [YOCTO
> #12912]. Therefore, renaming variables is not required.

I see that you briefly discussed fitimage.bbclass there. We (as in
my colleagues involved with fitimage.bbclass and myself) were not
aware of the discussion, so thanks for linking it here.

> If there are valid reasons to rename variables, this should be proposed
> as a separate patch set and discussed independently in the appropriate
> context.

Yes, I guess you can argue either way. My objection was to dismissing
the rename altogether citing compatibility issues.

>> Now everyone benefits from this and saves a slight bit of boot time.
>>
> Yes, that sounds good. Let's first remove the limitations in QE/Yocto
> with this series. Once that's done, we can add more features as needed.

Hmm, I am looking at 14/17 and it seems the generation of the compatible
property is being dropped? Is this intentional?

>> Thanks for putting in the work and I am curious to see where this
>> goes.
>> I will make sure to give this a test in the coming weeks to verify
>> that no unexpected regressions are introduced for barebox at least.
> 
> My point is to highlight the maintenance risks that arise when we keep
> adding similar implementations instead of cleaning up and generalizing
> the existing code. Harmonizing and creating a generic code base first
> allows us to add new features more sustainably. Ongoing refactoring,
> improving the test coverage and avoiding code duplication are essential
> for long-term maintainability.
>
> I hope my changes are a step towards bringing the architectural
> advantages of fitimage.bbclass to OE-core and we can align on one
> common FIT implementation which of course should also support all
> bootloaders which are supported by OE-core!

Surely sounds nice. Looking forward to try it out.
Thanks for the elaboration.

Cheers,
Ahmad

> 
> Thank you
> Adrian
> 
> 
> 
>>
>> With best regards,
>> Ahmad Fatoum
>>
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

