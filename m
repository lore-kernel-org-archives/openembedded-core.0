Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7719112580D
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 13:38:54 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21172.1773236330713472919
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 06:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YCStNZ/w;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4852a8482fcso46017715e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 06:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773236329; x=1773841129; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O+t6iGWG6QyprIg2v5Gop/+ZddTcN2NhZkEhK2+YUF8=;
        b=YCStNZ/w16qp1VkoinMOmytuTwPf6+lDxyxgdKgkWbHqgSYcoH8gEFDDGFfVu2Baqn
         rcQrkwRHY1Ee4fDbEK3sB/fiPelqnIzEBOD+RuOA+Plr6gIMtg2sdgqKmmn+9HNvk2or
         4dzDYSBLv0UUyVEO8KYk3FGg9Zi04V7i0avneN+azo6DQ+KoyKSnSfNcewXdSCNbwg3A
         JkOJ3mgt/1e5eMnpWVfoyINOa9y00tjMRHPGBQtTUqPs1/k7kzyOdAOtrfTx6TpzpvdF
         d3nkKu+OZLxLcUkjs41I2tjpB7qSJjOzpxBnZnsdIdj0Y7sj01u+sg+e+0TxUFJnTCSQ
         eCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773236329; x=1773841129;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O+t6iGWG6QyprIg2v5Gop/+ZddTcN2NhZkEhK2+YUF8=;
        b=lYBpl0ZgV2rT7590P6fHAqiqOVNk4BST/wXpoLvrdU07Z3CLA/RDx7LDCjODByla2/
         3aCLuZM+ugTFlLp+WzVbMg4nIrLTOmRBKHE73bFmCKShc6mMWGTfWjppkWiK0m4rHxQF
         iAp9pT3E1KZlfo50EomEbpxf1dQCOO4NuGubCm92iv9QlIvj6LZ7WXpXWOJ9j09YC2p8
         HjELf5wB2BzTr0OqBMAxRwDSraH8E6rO5YGNe8IcSk5hMTgOVpSKlgs/1LKaFE7Uw4uj
         Ypjp7zuxP5togyWl+SDohgoZDaaQnd9uLbMFrjjN3jmzmHF90Y2EHouqpDuPPGIO10U5
         fspA==
X-Forwarded-Encrypted: i=1; AJvYcCWytC1nw3pewOWi/4ovhJtsYjRtkColNVJrQ3LtcsFIIO4HlYLDkCPkiENfq0/CuWpHulIWJQjct150GPI/oFGrVA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxU85OziI00JceIVhLvDs9cGZZ6+p4zyiCXFXxC/3qSBfbNC3jP
	L6vo/tJJJmOTZkhMn6cylE3SBAOF+9/iRANXarqrJYAOqXaIS/iaa8mY
X-Gm-Gg: ATEYQzzLbzERshR60i61ysjRwDdFosS81k8BUSo1Tb2PicXVEXVFGRn108sfXQ7s1KZ
	4kAuBF1cqvXxMz9wcgxyNORGV5ZZUrfJafr0OSpVFGjFQHa3I9bxsMQh3WauaTvggbpPjJ8OER+
	ZmjCaNH6RGweK6ftfIue+SEaVJdxStaqQa3CsZHIzQWkd/zEKlO2v472DuKaZR5eTeZ9KLlwCCc
	ida3aQGBi6McQ85FdTUOdI35T5pZG8bevQ3WgVOjtcGsIFy2a2uJZw7hu6xbj1c2Semi0aMq7YQ
	WMzacokSwlhK3baG4oL/TSm/RXx03vr6qSViVKnZsQt7py+OjFKtgj8VRs0GddOrZ3/yiCeWZ62
	txMHHl+wf15iD6kG6DOBE5g60qFbFuKyhApPTZyLOoa+PkMcYaKxbTPejBK+Z7QRfqm0PUJL7Qd
	AEqNtxf5/PF5Qmy3RiiPQvRBIA+Xkg5p9lpCINoFccwl/TQZu0PUOYwb8+0M4JeFBdvA==
X-Received: by 2002:a05:600c:8b13:b0:485:3a86:6392 with SMTP id 5b1f17b1804b1-4854b107fcdmr46197065e9.20.1773236328863;
        Wed, 11 Mar 2026 06:38:48 -0700 (PDT)
Received: from [192.168.2.122] (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854e67ea40sm15887285e9.7.2026.03.11.06.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 06:38:48 -0700 (PDT)
Message-ID: <20496462-5835-4c55-aa84-d3a9dd54e1bd@gmail.com>
Date: Wed, 11 Mar 2026 14:38:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/4] bash: Add INSANE_SKIP=build-deps to ptest
 subpackage
To: "Marko, Peter" <Peter.Marko@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20260311122922.4160133-1-zboszor@gmail.com>
 <AS1PR10MB56977E851FCBA7CBCE3B4652FD47A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <189BCB9A4C18D9A2.1328210@lists.openembedded.org>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <189BCB9A4C18D9A2.1328210@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 13:38:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232880

2026. 03. 11. 14:12 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> 2026. 03. 11. 13:44 keltezéssel, Marko, Peter írta:
>> These INSANE_SKIP assignments are wrong.
>> Use GLIBC_GENERATE_LOCALES = "all" (or select just those you need) in your distro.
>
> It doesn't help.

Maybe moving the locale-base-* dependencies from
RDEPENDS:${PN}-ptest to RRECOMMENDS:${PN}-ptest
can work around this problem without INSANE_SKIP.
I'll test this.

>
>>
>> Peter
>>
>>> -----Original Message-----
>>> From: openembedded-core@lists.openembedded.org <openembedded-
>>> core@lists.openembedded.org> On Behalf Of Zoltan Boszormenyi via
>>> lists.openembedded.org
>>> Sent: Wednesday, March 11, 2026 13:29
>>> To: openembedded-core@lists.openembedded.org
>>> Cc: Zoltán Böszörményi <zboszor@gmail.com>
>>> Subject: [OE-core] [PATCH 1/4] bash: Add INSANE_SKIP=build-deps to ptest
>>> subpackage
>>>
>>> This fixes a QA error:
>>>
>>> ERROR: QA Issue: bash-ptest rdepends on locale-base-fr-fr.iso-8559-1,
>>> but it isn't a build dependency? [build-deps]
>>>
>>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>> ---
>>>   meta/recipes-extended/bash/bash.inc | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-
>>> extended/bash/bash.inc
>>> index 634209c911..b43b1cbf89 100644
>>> --- a/meta/recipes-extended/bash/bash.inc
>>> +++ b/meta/recipes-extended/bash/bash.inc
>>> @@ -32,6 +32,7 @@ ALTERNATIVE_PRIORITY = "100"
>>>   RDEPENDS:${PN} += "base-files"
>>>   RDEPENDS:${PN}:class-nativesdk = ""
>>>   RDEPENDS:${PN}-ptest += "make coreutils perl sed shadow util-linux-setpriv"
>>> +INSANE_SKIP:${PN}-ptest = "build-deps"
>>>
>>>   RDEPENDS:${PN}-ptest:append:libc-glibc = " \
>>>       glibc-gconv-big5hkscs \
>>> -- 
>>> 2.53.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#232878): https://lists.openembedded.org/g/openembedded-core/message/232878
> Mute This Topic: https://lists.openembedded.org/mt/118259058/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


