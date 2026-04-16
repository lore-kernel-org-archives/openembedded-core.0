Return-Path: <a.fatoum@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D02F8A162
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 11:34:23 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11686.1776339259237256185
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 04:34:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: a.fatoum@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1wDKzA-0003JO-QM; Thu, 16 Apr 2026 13:34:16 +0200
Message-ID: <aeef1553-eec2-480e-bbc3-21766628dec5@pengutronix.de>
Date: Thu, 16 Apr 2026 13:34:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][whinlatter][PATCH] barebox/barebox-tools: upgrade
 2025.09.0 -> 2025.09.3
To: yoann.congal@smile.fr, ankur.tyagi85@gmail.com,
 openembedded-core@lists.openembedded.org
References: <20260408000932.10450-1-ankur.tyagi85@gmail.com>
 <DHU1874ATB71.203BIG61AS590@smile.fr>
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
In-Reply-To: <DHU1874ATB71.203BIG61AS590@smile.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 11:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235398

Hello Yoann!

On 4/15/26 11:05 PM, Yoann Congal via lists.openembedded.org wrote:
> On Wed Apr 8, 2026 at 2:09 AM CEST, Ankur Tyagi via lists.openembedded.org wrote:
>> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>>
>> 2025.09.3
>> ---------
>> Fixed FIT image vulnerability
>> https://lore.barebox.org/barebox/abljJRMecNdejSD0@pengutronix.de/
>>
>> Changelog:
>> https://github.com/barebox/barebox/compare/v2025.09.2...v2025.09.3
>>
>> 2025.09.2
>> ---------
>> Changelog:
>> https://github.com/barebox/barebox/compare/v2025.09.1...v2025.09.2
>>
>> 2025.09.1
>> ---------
>> This stable release is specifically targeted at whinlatter which is
>> currently at v2025.09.0
>> https://lore.barebox.org/barebox/aUkaSKDePHF8__LB@pengutronix.de/
>>
>> Changelog:
>> https://github.com/barebox/barebox/compare/v2025.09.0...v2025.09.1
>>
>> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> 
> I'm a bit torn on this one. Because on one hand, this looks like a
> proper stable branch (and I appreciate the effort),

I had prepared the v2025.09.y releases, so we (barebox) can hone a
workflow to be able to support the release that makes it into Wrynose
for a longer time than the usual 1 month it takes between the monthly
releases of barebox.

> but on the other
> hand, there are changes that I find too risky:
> For example:
> * API Change: https://github.com/barebox/barebox/commit/5e9f709b2b56bd9689e174572ef2af59b9fed5d2

barebox is a bare metal bootloader. Its API surface is:

- the data formats it parses
- the data it passes along, e.g. fixed up device trees
- the boot/runtime services it provides to an OS (UEFI/PSCI/TEE-supplicant).

The change to bootm_set_overrides is not a change that affects
user-visible API for any of that; it is completely internal to barebox.
Revisiting it, I still think it was appropriate to backport it.

> * New feature: https://github.com/barebox/barebox/compare/v2025.09.0...v2025.09.3#diff-2dd6d3e4c91931c982f091155a47dd8d03e26731f8d59b112e938508fe12255aR1

Which features do you see there?

I read through the 50 commit titles on the first page and nearly all of
them are fixes. The very few that aren't direct fixes are relatively
benign preparatory commits followed by a fix and they were then
backported together.

> Thoughts?

For the record, v2026.09.3 and v2026.03.1 were released together and
that's the number of commits they have compared to v2025.09.0:

$ git log v2025.09.0..v2025.09.3 --oneline | wc -l
111

$ git log v2025.09.0..v2026.03.1 --oneline | wc -l
1023

So roughly 10% of commits to master since v2025.09.0 were hand selected
to be backported as fixes. FWIW, I got curious and compared v6.19.12 to
v7.0 and there it's 21%, so there's still some untapped potential (for
squashing bugs!).

> In the meantime, I will keep it in my branch for awareness.

I appreciate that the stable branch was picked up, so many thanks for that!

Cheers,
Ahmad

> 
>> ---
>>  meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
>> index e41d0858fd..91865b4d44 100644
>> --- a/meta/recipes-bsp/barebox/barebox-common.inc
>> +++ b/meta/recipes-bsp/barebox/barebox-common.inc
>> @@ -3,6 +3,6 @@ SECTION = "bootloaders"
>>  
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
>>  
>> -PV = "2025.09.0"
>> +PV = "2025.09.3"
>>  SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
>> -SRC_URI[sha256sum] = "7df1aa47bb7bf1763a729137ac773e69a4052812af094475d739fc63a9295f0d"
>> +SRC_URI[sha256sum] = "e87eb863cbe45e4f5af8930825c8f6e20c02b82451e9e1125ea1c73c1fb49a87"
> 
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#235329): https://lists.openembedded.org/g/openembedded-core/message/235329
> Mute This Topic: https://lists.openembedded.org/mt/118717996/4830399
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [a.fatoum@pengutronix.de]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


