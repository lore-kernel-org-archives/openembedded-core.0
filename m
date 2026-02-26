Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4089CFC5916
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 09:24:19 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.66523.1772097857922195683
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 01:24:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=B44xfVn+;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so7737855e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 01:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772097856; x=1772702656; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FnkHiZ7l/BTAHS6QiIdOckeUZSQPg5deM+cIEp5JDcU=;
        b=B44xfVn+Ih6YtElB0uSiQIMgO7RE0rRfdeglkK5Ypvsumkaju82Ce7V7pNReLb6QQM
         SMBQY0/J62+rFCReBfpCk4z218BJ7hrXwMsOsACxzzfXC6RXf65RgTphp5GDhQ8XJTzN
         i+vTD7KvAuM6DMOyXbOSrgHmZtktRhZrWmhKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772097856; x=1772702656;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FnkHiZ7l/BTAHS6QiIdOckeUZSQPg5deM+cIEp5JDcU=;
        b=XGVsAzmiuAbOpfA98hkWgcJ1n1xkmKY8MIGYTZ4NSmI8UCCPsyZ+izO4aydHsC9c9h
         Uf2Zf1ChvyxIJr9mWMf6g/VDahqM6t89B9QHttHCEOA6jK8CxYsANZXYzbavmHBkczlK
         XIcWfsAP7GHp/gyXw4tYjLyyK6WEaJoerymbW5XtYhtJ8YzL3wzy8jyW6bR8m2eM0XBz
         GZU4vy/e546CV8cjdMSaUVODlO7ja6Ata4nBgX2CIX5CxrE4CYLeBPsFFkIrue4cvMzG
         NSuIuCfax6mxLGIdF1SfXPYqmSLg9jwQtCW4eIDuYlyi35KDsLYGnHNg8zG2MnsRRl2K
         ipRA==
X-Forwarded-Encrypted: i=1; AJvYcCUZRc9441IJqjDoZO8E21efgtcf6elUWV7CNOXMZhxivbcqimW/r/+C3ETRK0FF2ykPQ00Q1/cTeeNStz2+lNbUNQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxuRDHGGDVxuzmCpHB87MQGboBXrKULKnDw8KsjKiTExnEV27iE
	ITbQ5woklTQ/cN8mI8hh+t8IhHu0o/WlOxRNl0cBGdd6sh345pIgLCzTK1cLO24lUnM=
X-Gm-Gg: ATEYQzyAH0oxlebIo79iX1TBMOz9NtUuMIbK93msZvTBhUi2+9cboTvVbBrq8bKFlQG
	50MK6jigeR0LrnlR1RsAmnn6PrggIaRLKYXZfaiGguyEDKPPj/2XLG0sAi+IF1cg4CHuKniVf3l
	ZoQHKWtmxkBLJXuwgv1P1HeonvjdD7EkFPLBw/rMJMReLdgmc6gSk8sooS/3nO3mOh76yzFSla4
	c9IRueXlRHvNcU05eD3qEEv2iDsv2UBzFubMr2UITwRu1t6Tob+XtHTCzjHpJAK7cOgufNuBPGv
	GYJjIGWr/mbwrVPEc7gC+u0YJ/4/CJ28zyuW9+Rd2As3ALiMEeY/pplyLwiYeHKKX4mee6V/0jb
	3KkSxv5dt0Ys9C6ceS0xWlkNk3dD0+43L2R1exLM8D3WqfMoQgIice/GF29g56c47f2aNoMjK9Z
	6Z780HXr3c1yEQzFu3ykaDvm6m8jkbiM9qWB9nbIAxmNdE69S1cgzZamOC9uEhwkgDScOw1GIyM
	WS2oivtyhkPMLUl
X-Received: by 2002:a05:600c:a42:b0:480:20f1:7abd with SMTP id 5b1f17b1804b1-483a95f89e5mr369164385e9.31.1772097856257;
        Thu, 26 Feb 2026 01:24:16 -0800 (PST)
Received: from localhost (2a01cb001331aa002c0b752a8b25831e.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:2c0b:752a:8b25:831e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b84023sm32252935e9.12.2026.02.26.01.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 01:24:15 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Feb 2026 10:24:15 +0100
Message-Id: <DGOS9G19GT7A.RNNHZA4OJNQN@smile.fr>
To: <mark.hatle@kernel.crashing.org>, "Paul Barker" <paul@pbarker.dev>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "openembedded-architecture@lists.openembedded.org"
 <openembedded-architecture@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Recipes which should always be
 upgraded on stable branches
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <1e6175f982bbd141fcc156113aa6e798a3120bdc.camel@pbarker.dev>
 <145e7167-d654-4505-bcf2-a481f35258e9@kernel.crashing.org>
In-Reply-To: <145e7167-d654-4505-bcf2-a481f35258e9@kernel.crashing.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 09:24:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231995

On Thu Feb 26, 2026 at 12:50 AM CET, Mark Hatle via lists.openembedded.org =
wrote:
> On 2/25/26 11:44 AM, Paul Barker wrote:
>> Hi all,
>>=20
>> I've been briefly discussing stable branch update policy with Yoann.
>> There's a few recipes in openembedded-core which I would like to propose
>> that we always update to the latest version on LTS and stable branches.
>> These are recipes typically providing data that is expected to change
>> over time, with little or no code.
>>=20
>> You could say ca-certificates is already covered by the fact that
>> security fixes are acceptable for example, but a clearer policy would be
>> better.
>>=20
>> Any policy change will go to the TSC for approval, the goal here is to
>> get some review and input so that a concrete proposal can be put
>> forward.
>>=20
>> The recipes that come to my mind are:
>>=20
>> - ca-certificates: To allow access to HTTPS resources we need to keep
>>    these up-to-date.
>>=20
>>      - Keeping this up-to-date is common practice in other distros.

Agreed but since CAs can be removed from the list, there is a
probability for breakage. We should acknowledge that. By spelling out
the CA addition/removal in the release notes maybe?

>> - tzdata: To stay up to date with timezone or daylight savings changes.
>>=20
>>      - Debian takes upgrades to this on stable branches
>>        (see https://tracker.debian.org/pkg/tzdata).
>
> I agree completely for the above two items.  Keeping these current is rea=
lly=20
> important and history has shown that updating them doesn't cause issues.
>
>
> The one below I don't have any experience with, so no opinion.
>
>> - mobile-broadband-provider-info: To stay up to date with provider
>>    changes.
>>=20
>>      - The README file for this project says "The Package contains only
>>        informational files so it's safe for distributions to grab update=
s
>>        even during feature freeze and maintenance stages."
>>=20
>> What opinions do other folks have?

I also agree with updating those. I've looked at
mobile-broadband-provider-info for a recent stable upgrade and merged
it.

>> Are there any other recipes we should include in this list?

In addition of the wireless-regdb suggestion from Ankur, maybe we should
consider hwdata:
> hwdata contains various hardware identification and configuration data,
> such as the pci.ids and usb.ids databases.
I have no direct experience with it but it does seem to match this list.

>> Best regards,

Regards,
--=20
Yoann Congal
Smile ECS


