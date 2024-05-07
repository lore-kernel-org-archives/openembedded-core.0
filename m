Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0558EC10F1A
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 10:02:25 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.7802.1715076143178956383
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 May 2024 03:02:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aPtgK1nk;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2e271acb015so38766941fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 03:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715076141; x=1715680941; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dOU2GhSJIP9QgbiI+OlBMDYBLeEgMmAIghASRmp/Mbo=;
        b=aPtgK1nkELCXYSuziCYyO2dyR6BmLKpAm9q039FcJYTGFiAtbcYQ4dzBgZajAH9jI6
         pMW9g9HxdSft8dLbMoz9YVlIXIvHscfHbU5JS2F3MNAWsZhDitkk57SGP5mjCOX+G35A
         ztR2kbYQkyd3HQnzltrIw+pGGStAOcNepsdMyl5HAy4Ax3gEuZFJiE0cQOUjx2GEZWDh
         XAKwqa48tMyzEt/N+rMMK0uNYzzIEONMzvgGwMxQlr3KQ3K4oiB5SvJsvUo4m3QABxwD
         5kcrR3iVaU8a9f5p6EVephx/2Mg0f10ovtDtXWfqvRR8MdCDr6lmNIjlZ4yU0BqAQtMl
         /Pag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715076141; x=1715680941;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dOU2GhSJIP9QgbiI+OlBMDYBLeEgMmAIghASRmp/Mbo=;
        b=WhyqtNHzAnCMAwoaOitjGI5TN3O68GhuEf6otfWv3YH2GVivwnzzuvna5WVvmWBxX+
         ZFBMPsBM7Nbx8r/56XZOMhFtzRfdGgCURHrfuDrLqVRfQNWNN3bNSF4sBGP0H15xfEzV
         BXoa/mbAbgvurXKQEQiMLdNBC/JEeExRkgviAWGJ1c9NocfKg4uk7jXrYmNLOLTAXkat
         DEmLUnQJz4+/Z/aN94CQf1bHxaV2Rm+ja67PM+cLVzMB+kKdbuhb1OvllWxf1A7UFnMM
         GZ4mkViv0hrr5Yxal5fpzrH60Ct9Fmnm9oRdqRebiaccyz/DpXB9egjXs1lZNRYnoew8
         nKMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGNUAYvZtRMDLBnYbohDB0orJ3OdrJfEh2IKZXlX/3ZVSNBzMoqLBo7rWKQ7EENH2jYRv4J0SDXTu5x63d+o5w0vJa4ZXd5u1sdCi+afV4HX1hObYGvUKN
X-Gm-Message-State: AOJu0YwA5AENURhM/r1q5LqOrhovrZcojqreaUe9uUQKi5Mc8b5D1+cY
	vnjKCQ7lT5MyFOdxXB88INml/zEwfdZnp8sp7xoBluQYNM7RE/Jkhhivp1tmOLlwK46l/z9nHn1
	Q4KtdQwSaPTwjivWwcKNbnyKOw3k=
X-Google-Smtp-Source: AGHT+IELsVUZbaBkL5YN2/v7uzc7+tXFvK6+gMnYPliis/237bfEMtTCiRnzaNUQwi1KSjqGim7F4pJLNqtTatgS6HI=
X-Received: by 2002:a2e:9f0b:0:b0:2e1:cc3e:65c4 with SMTP id
 u11-20020a2e9f0b000000b002e1cc3e65c4mr8361622ljk.19.1715076141121; Tue, 07
 May 2024 03:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240506110846.125652-1-nikhil.r@kpit.com> <CAApg2=TB81yXyxpt8kEaoHB-SCoJ8753w77FWby2m8Qj-nDEig@mail.gmail.com>
In-Reply-To: <CAApg2=TB81yXyxpt8kEaoHB-SCoJ8753w77FWby2m8Qj-nDEig@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 7 May 2024 12:02:09 +0200
Message-ID: <CANNYZj8GoCvaoVk6kqVLBh0UqJm+=_Gh4u3Ki6ic2=bNjf_ziw@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] xz: Update LICENSE variable for xz packages
To: rybczynska@gmail.com
Cc: nikhilar2410@gmail.com, OE-core <openembedded-core@lists.openembedded.org>, 
	Bhabu Bindu <bhabu.bindu@kpit.com>, Nikhil R <nikhil.r@kpit.com>, 
	Bhabu Bindu <bindudaniel1996@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 10:02:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199081

PD is not a license for legal compliance purposes, but it's a valid
identifier in a recipe's LICENSE field. We have plenty of those
already.

Also, shouldn't this be addressed in master first?

Alex

On Mon, 6 May 2024 at 17:33, Marta Rybczynska via
lists.openembedded.org <rybczynska=gmail.com@lists.openembedded.org>
wrote:
>
>
>
> On Mon, 6 May 2024, 13:09 nikhil via lists.openembedded.org, <nikhilar2410=gmail.com@lists.openembedded.org> wrote:
>>
>> Update LICENSE defined for xz packages to match the license
>> information provided in the xz COPYING file.
>>
>> The License information from PACKAGERS file of xz mentions
>> packages with lzma files are in public domain.They ask to
>> use GPLv2+, if only it's not possible to mention "PD and GPLv2+".
>>
>> Include PD license with GPLv2 to packages with lzma content:
>> xz-dev package contains lzma header
>> xz-doc package contains lzma man pages
>> xz packages contains lzma binaries
>>
>> Links: https://github.com/tukaani-project/xz/blob/v5.2.6/COPYING
>>        https://github.com/tukaani-project/xz/blob/v5.4.1/PACKAGERS
>>
>> Signed-off-by: Bhabu Bindu <bindudaniel1996@gmail.com>
>> ---
>>  meta/recipes-extended/xz/xz_5.2.6.bb | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-extended/xz/xz_5.2.6.bb b/meta/recipes-extended/xz/xz_5.2.6.bb
>> index 3482622471..33496748bc 100644
>> --- a/meta/recipes-extended/xz/xz_5.2.6.bb
>> +++ b/meta/recipes-extended/xz/xz_5.2.6.bb
>> @@ -9,10 +9,10 @@ SECTION = "base"
>>  # libgnu, which appears to be used for DOS builds. So we're left with
>>  # GPL-2.0-or-later and PD.
>>  LICENSE = "GPL-2.0-or-later & GPL-3.0-with-autoconf-exception & LGPL-2.1-or-later & PD"
>> -LICENSE:${PN} = "GPL-2.0-or-later"
>> -LICENSE:${PN}-dev = "GPL-2.0-or-later"
>> +LICENSE:${PN} = "PD & GPL-2.0-or-later"
>> +LICENSE:${PN}-dev = "PD & GPL-2.0-or-later"
>>  LICENSE:${PN}-staticdev = "GPL-2.0-or-later"
>> -LICENSE:${PN}-doc = "GPL-2.0-or-later"
>> +LICENSE:${PN}-doc = "PD & GPL-2.0-or-later"
>>  LICENSE:${PN}-dbg = "GPL-2.0-or-later"
>>  LICENSE:${PN}-locale = "GPL-2.0-or-later"
>>  LICENSE:liblzma = "PD"
>> --
>> 2.25.1
>
>
> I'm not a copyright lawyer, but from what I understand public domain is not a licence. For a discussion see https://wiki.spdx.org/view/Legal_Team/Decisions/Dealing_with_Public_Domain_within_SPDX_Files
>
> The next version of xz will be 0BSD so the statement will change too.
>
> Regards,
> Marta
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199047): https://lists.openembedded.org/g/openembedded-core/message/199047
> Mute This Topic: https://lists.openembedded.org/mt/105937026/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

