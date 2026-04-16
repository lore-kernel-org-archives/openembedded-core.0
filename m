Return-Path: <a.fatoum@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B52F8D75B
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 15:45:09 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17741.1776354305935373228
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 08:45:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: a.fatoum@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1wDOtr-0004ty-A0; Thu, 16 Apr 2026 17:45:03 +0200
Message-ID: <1276260c-7dca-4f6d-801e-b486e7261ba7@pengutronix.de>
Date: Thu, 16 Apr 2026 17:45:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][whinlatter][PATCH] barebox/barebox-tools: upgrade
 2025.09.0 -> 2025.09.3
To: Yoann Congal <yoann.congal@smile.fr>, ankur.tyagi85@gmail.com,
 openembedded-core@lists.openembedded.org
References: <20260408000932.10450-1-ankur.tyagi85@gmail.com>
 <DHU1874ATB71.203BIG61AS590@smile.fr>
 <aeef1553-eec2-480e-bbc3-21766628dec5@pengutronix.de>
 <DHUMED89KHZI.2OCH4Y9XKVKO4@smile.fr>
Content-Language: en-US, de-DE, de-BE
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <DHUMED89KHZI.2OCH4Y9XKVKO4@smile.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:45:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235412

Hello Yoann,

Cc += yocto@pengutronix.de who are listed as recipe maintainers.

On 4/16/26 3:40 PM, Yoann Congal wrote:
> On Thu Apr 16, 2026 at 1:34 PM CEST, Ahmad Fatoum wrote:
>> On 4/15/26 11:05 PM, Yoann Congal via lists.openembedded.org wrote:
>>> On Wed Apr 8, 2026 at 2:09 AM CEST, Ankur Tyagi via lists.openembedded.org wrote:
>> I had prepared the v2025.09.y releases, so we (barebox) can hone a
>> workflow to be able to support the release that makes it into Wrynose
>> for a longer time than the usual 1 month it takes between the monthly
>> releases of barebox.
>>
>>> but on the other
>>> hand, there are changes that I find too risky:
>>> For example:
>>> * API Change: https://github.com/barebox/barebox/commit/5e9f709b2b56bd9689e174572ef2af59b9fed5d2
>>
>> barebox is a bare metal bootloader. Its API surface is:
>>
>> - the data formats it parses
>> - the data it passes along, e.g. fixed up device trees
>> - the boot/runtime services it provides to an OS (UEFI/PSCI/TEE-supplicant).

Rereading this, it's probably worth to spell out also:

- The protocols that barebox speaks
- The build integration (e.g. Kconfig options)
- The shell environment

Such changes are also not suitable for a point release.

>> The change to bootm_set_overrides is not a change that affects
>> user-visible API for any of that; it is completely internal to barebox.
>> Revisiting it, I still think it was appropriate to backport it.
> 
> I kind of agreeing with you I just remember my BSP dev days where this
> is the kind of function I would call for my custom boot flow (But in
> this case, fix looks easy enough)

We had rather heated discussions not so long ago about the extent we
should accommodate out-of-tree board code. :-)

I believe a build-time failure is as good as it gets if an API is just
not salvageable like the one you pointed out; It didn't take recursive
calls into account, which occurred in real world scenarios.

For compatibility breakage that is not immediately obvious at
compile-time, we are maintaining migration notes:

https://www.barebox.org/doc/latest/migration-guides/index.html

But nothing that deserves an entry there should be something that would
be ok to include in a point release - save grave security bugs that
can't be fixed any other way.

Most recently, both barebox v2026.03.1 and U-Boot v2026.04.0 will refuse
to boot a FIT with a verified signed configuration when some of the
images were left unsigned:

https://lore.kernel.org/barebox/20260416153455.2630276-1-a.fatoum@pengutronix.de/T/#u

Migration guide entry is the best we can do here.

>>> * New feature: https://github.com/barebox/barebox/compare/v2025.09.0...v2025.09.3#diff-2dd6d3e4c91931c982f091155a47dd8d03e26731f8d59b112e938508fe12255aR1
>>
>> Which features do you see there?
> 
> Sorry the URL is not as direct as I thought.
> This should link to the new "scripts/imx/pread.c" file.

We don't have mingw build in CI, so this fixes a build regression even
if doesn't sound this way.

> Also, looks like imx-image gained a new option :
> "-a authenticate additionaly the DCD block..."

So this was the second commit in a series of two patches. The first is a
fix and the second fixes an incompatibility with the external uuu
utility. I concede that you can decide either way whether this patch is
backport material or not.

The impact on a user not affected by this issue is nonetheless minimal.

> But those look like dependencies of a bugfix.

Fixes are occasionally split for master (next release) and next (release
after next), when the change is too involved.
Recent example is that TF-A v2.14 broke backwards compatibility for its
consumers:

https://lore.barebox.org/barebox/20260325113711.2163037-1-a.fatoum@pengutronix.de/

https://lore.barebox.org/barebox/20260325114753.2249763-1-a.fatoum@pengutronix.de/

No one size fits all.

>> I appreciate that the stable branch was picked up, so many thanks for that!
> 
> Globally, I lean towards taking the upgrade. We will see if there are
> other point of views.
> 
> And by the way, thank you for creating and maintaining a stable branch
> :)

This has been a pain point I heard at conferences in the past and I am
happy to get feedback on how we can improve the process.

The LTS and the migration guides are inspired by Yocto and we see it as
an important part of making sure that barebox is a reliable bootloader
in secure boot contexts.

I think there's generally a lot to improve[1] the status quo of embedded
bootloader security and I see making bootloader updates easier as
important as shiny new features like barebox security policies (coming
hopefully soon to an OE-core near you!), even if the former is
admittedly not as fun..

[1]:
https://osseu2025.sched.com/event/25VqL/bootloaders-under-fire-real-world-threats-and-practical-defenses-ahmad-fatoum-pengutronix

Thanks,
Ahmad

> 
>>
>> Cheers,
>> Ahmad
>>
>>>
>>>> ---
>>>>  meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
>>>> index e41d0858fd..91865b4d44 100644
>>>> --- a/meta/recipes-bsp/barebox/barebox-common.inc
>>>> +++ b/meta/recipes-bsp/barebox/barebox-common.inc
>>>> @@ -3,6 +3,6 @@ SECTION = "bootloaders"
>>>>  
>>>>  LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
>>>>  
>>>> -PV = "2025.09.0"
>>>> +PV = "2025.09.3"
>>>>  SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
>>>> -SRC_URI[sha256sum] = "7df1aa47bb7bf1763a729137ac773e69a4052812af094475d739fc63a9295f0d"
>>>> +SRC_URI[sha256sum] = "e87eb863cbe45e4f5af8930825c8f6e20c02b82451e9e1125ea1c73c1fb49a87"
>>>
>>>
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#235329): https://lists.openembedded.org/g/openembedded-core/message/235329
>>> Mute This Topic: https://lists.openembedded.org/mt/118717996/4830399
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [a.fatoum@pengutronix.de]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>
> 
> 

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


