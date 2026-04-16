Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2B32F8A17A
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 13:40:44 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14333.1776346835215856488
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 06:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HCrEfxG/;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso122669205e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776346833; x=1776951633; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fJPvYdIu6Dx26trBwuyTedvLsvpwIR32sUgRX15bTRo=;
        b=HCrEfxG/yIHL/xhT/FaykdptBdeTH2jexZ7GwwXJydeTUruwJ5YLROnZ2Cy+zIG9S3
         6EQhiqy8EvWD60geoJGfJUK7hO1MpKxIfo7B/DItyjDi3UEsRXNGdjpnDndv8ifsYsI7
         0bL8/vd4kEcSIfWyrafcDBQOQeoTPlUuV+79Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776346833; x=1776951633;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fJPvYdIu6Dx26trBwuyTedvLsvpwIR32sUgRX15bTRo=;
        b=YlO1/1wneQQmFr9cC849Hq6LR8iF5eic5hqeC3vAqvTqHdC0pV6WBA/kd6EN/tdsPE
         wXJNEj09kM9Zwaw5e0rdDxx+bv2ih5Ejo1gUU+AFtAM6bYhJWOlgA83APEknZd9iTM5g
         o5leZIIl3TfJaOc6dNfP2tA5OuxeXtXs5IjHADhy4qmoRJKdADbBstSHrTkbjLIYkpet
         pZRkXerPYNj5dFYwua71vPBQ8xS8DBUT5KpB5sS2qt3lG/DUEWfyFpjvIIyU9BY3HABO
         VX6Hadj22xRoh0Yl997GCKF5FIicrPcYsgOM0jn5O9kuLuqDZXBbjyR01ifUD0ZvCbEG
         6llw==
X-Forwarded-Encrypted: i=1; AFNElJ+RVk4NPJ9QPzSTpyDgOherpkCa+bc4IkT4M1oUvIDRpp3P0Cxk78zgkhXAP+J79UzVJud2UWeL27Px3QWFZbSdwg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzKWUfj6wv2ldJKKIM6cDJIMihCOpTD/eCDuBSViS2oHeni2V8F
	oN6VO77Fjrv4Z/luV+TcpnRzKsBoUeRR2CaftvLBxc4SvC9/92cehOjgVuHplvYef9I=
X-Gm-Gg: AeBDietJE1YX4uuCQaKsvUhfovU+XEdw4DGMxTkBuozTDwbf1SvAkIqywOaTodbKwMk
	s2TwPvNq2oS4aepglZNpjPvQBX++tFaMO3OlisFfLeCzgvLCCxbTsXcRS7iXgoepxldY0Hibu3y
	Ii5DZADw1JzmWrIb+j1eFY9Pkw9Ltyo0tFLE1iqKCcTwFPHUQ/sY5eXfW6i64Fq3g/ZiwO98G0+
	n7CQLSWzu1QzmHQ0gwN5dXC3bOkXGfs/+WJlrQgFS91F6VmN44vlHKOzMIcZ2YjJ8VnMoDd5cH6
	Cg/k1h2wzjmz3mxhDpmGxCzlhpXFYpCFiD4kSNABgXJXvpLFio6qeSg+ajnkvLNmrnjAAD273RW
	tGGl/IpURMs7uSBrgz5xi5FLZ0oesP2sqpDSKmPQSoZBoNwI6m51ScINNuFqmoEmxFV1W8Z7BCP
	K/D2Iq2Y9KS8Tbofa4xNpTykk5WO5mVcNCXtcxWFUQZyb4H5enoq66Q1+imlxmukuvtmABVZ3gS
	7fxdjzjaB1L3U/9qHbws1iSAg==
X-Received: by 2002:a05:600c:608e:b0:488:78f2:6b0 with SMTP id 5b1f17b1804b1-488d688a11amr356197815e9.29.1776346833240;
        Thu, 16 Apr 2026 06:40:33 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead33d6d3sm14118778f8f.8.2026.04.16.06.40.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 06:40:32 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Apr 2026 15:40:32 +0200
Message-Id: <DHUMED89KHZI.2OCH4Y9XKVKO4@smile.fr>
Subject: Re: [OE-core][whinlatter][PATCH] barebox/barebox-tools: upgrade
 2025.09.0 -> 2025.09.3
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Ahmad Fatoum" <a.fatoum@pengutronix.de>, <ankur.tyagi85@gmail.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260408000932.10450-1-ankur.tyagi85@gmail.com>
 <DHU1874ATB71.203BIG61AS590@smile.fr>
 <aeef1553-eec2-480e-bbc3-21766628dec5@pengutronix.de>
In-Reply-To: <aeef1553-eec2-480e-bbc3-21766628dec5@pengutronix.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 13:40:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235406

On Thu Apr 16, 2026 at 1:34 PM CEST, Ahmad Fatoum wrote:
> Hello Yoann!
>
> On 4/15/26 11:05 PM, Yoann Congal via lists.openembedded.org wrote:
>> On Wed Apr 8, 2026 at 2:09 AM CEST, Ankur Tyagi via lists.openembedded.o=
rg wrote:
>>> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>>>
>>> 2025.09.3
>>> ---------
>>> Fixed FIT image vulnerability
>>> https://lore.barebox.org/barebox/abljJRMecNdejSD0@pengutronix.de/
>>>
>>> Changelog:
>>> https://github.com/barebox/barebox/compare/v2025.09.2...v2025.09.3
>>>
>>> 2025.09.2
>>> ---------
>>> Changelog:
>>> https://github.com/barebox/barebox/compare/v2025.09.1...v2025.09.2
>>>
>>> 2025.09.1
>>> ---------
>>> This stable release is specifically targeted at whinlatter which is
>>> currently at v2025.09.0
>>> https://lore.barebox.org/barebox/aUkaSKDePHF8__LB@pengutronix.de/
>>>
>>> Changelog:
>>> https://github.com/barebox/barebox/compare/v2025.09.0...v2025.09.1
>>>
>>> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
>>=20
>> I'm a bit torn on this one. Because on one hand, this looks like a
>> proper stable branch (and I appreciate the effort),
>
> I had prepared the v2025.09.y releases, so we (barebox) can hone a
> workflow to be able to support the release that makes it into Wrynose
> for a longer time than the usual 1 month it takes between the monthly
> releases of barebox.
>
>> but on the other
>> hand, there are changes that I find too risky:
>> For example:
>> * API Change: https://github.com/barebox/barebox/commit/5e9f709b2b56bd96=
89e174572ef2af59b9fed5d2
>
> barebox is a bare metal bootloader. Its API surface is:
>
> - the data formats it parses
> - the data it passes along, e.g. fixed up device trees
> - the boot/runtime services it provides to an OS (UEFI/PSCI/TEE-supplican=
t).
>
> The change to bootm_set_overrides is not a change that affects
> user-visible API for any of that; it is completely internal to barebox.
> Revisiting it, I still think it was appropriate to backport it.

I kind of agreeing with you I just remember my BSP dev days where this
is the kind of function I would call for my custom boot flow (But in
this case, fix looks easy enough)

>
>> * New feature: https://github.com/barebox/barebox/compare/v2025.09.0...v=
2025.09.3#diff-2dd6d3e4c91931c982f091155a47dd8d03e26731f8d59b112e938508fe12=
255aR1
>
> Which features do you see there?

Sorry the URL is not as direct as I thought.
This should link to the new "scripts/imx/pread.c" file.
Also, looks like imx-image gained a new option :
"-a authenticate additionaly the DCD block..."
But those look like dependencies of a bugfix.

> I read through the 50 commit titles on the first page and nearly all of
> them are fixes. The very few that aren't direct fixes are relatively
> benign preparatory commits followed by a fix and they were then
> backported together.
>
>> Thoughts?
>
> For the record, v2026.09.3 and v2026.03.1 were released together and
> that's the number of commits they have compared to v2025.09.0:
>
> $ git log v2025.09.0..v2025.09.3 --oneline | wc -l
> 111
>
> $ git log v2025.09.0..v2026.03.1 --oneline | wc -l
> 1023
>
> So roughly 10% of commits to master since v2025.09.0 were hand selected
> to be backported as fixes. FWIW, I got curious and compared v6.19.12 to
> v7.0 and there it's 21%, so there's still some untapped potential (for
> squashing bugs!).
>
>> In the meantime, I will keep it in my branch for awareness.
>
> I appreciate that the stable branch was picked up, so many thanks for tha=
t!

Globally, I lean towards taking the upgrade. We will see if there are
other point of views.

And by the way, thank you for creating and maintaining a stable branch
:)

>
> Cheers,
> Ahmad
>
>>=20
>>> ---
>>>  meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes=
-bsp/barebox/barebox-common.inc
>>> index e41d0858fd..91865b4d44 100644
>>> --- a/meta/recipes-bsp/barebox/barebox-common.inc
>>> +++ b/meta/recipes-bsp/barebox/barebox-common.inc
>>> @@ -3,6 +3,6 @@ SECTION =3D "bootloaders"
>>> =20
>>>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df5125d13e000b9ca1f0d3364286=
c4192"
>>> =20
>>> -PV =3D "2025.09.0"
>>> +PV =3D "2025.09.3"
>>>  SRC_URI =3D "https://barebox.org/download/barebox-${PV}.tar.bz2"
>>> -SRC_URI[sha256sum] =3D "7df1aa47bb7bf1763a729137ac773e69a4052812af0944=
75d739fc63a9295f0d"
>>> +SRC_URI[sha256sum] =3D "e87eb863cbe45e4f5af8930825c8f6e20c02b82451e9e1=
125ea1c73c1fb49a87"
>>=20
>>=20
>>=20
>>=20
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#235329): https://lists.openembedded.org/g/openembedd=
ed-core/message/235329
>> Mute This Topic: https://lists.openembedded.org/mt/118717996/4830399
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [a=
.fatoum@pengutronix.de]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>=20


--=20
Yoann Congal
Smile ECS


