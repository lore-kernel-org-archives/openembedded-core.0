Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26580D185FB
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 13:48:02 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6695.1767880075057173490
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jan 2026 05:47:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=MYmiL8Me;
 spf=pass (domain: baylibre.com, ip: 209.85.128.50, mailfrom: tgamblin@baylibre.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47d6a1f08bbso13137515e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 05:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767880073; x=1768484873; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=224wu+aisUjgguVzKsbYp12yHOVFfWko0qYLu4j1cOA=;
        b=MYmiL8Meb2buNDJmp8xxX9WFn9h8WEs0Vph+a81XAZ9BRj/VhyhYvmZRrpW4uh6mWK
         ZQuz4dQIiC/KjuSAX9QxVsdYgHJdXjo+Lgeq/m8A1sux/3Z3pWioITXmjDUg0SEeGoyP
         a1HguAphLZMsKkd4D/QlOLYq6QR9Trgwl9XsWL1HBFI4oA5QABK50XHhPMA44tNLuF6D
         KKM4PVkkCrmNcSLggk88qJoy0EZmZ1NzCmVcieZOIzGkKt4caEPe50FDkZndtAlCQXlL
         +lUWBnUan2Q607B4SDttIUGnvBAHOumxWJRDSIx7OdND/mxIZyWFNL8sTmRozCSKA4f0
         4aZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767880073; x=1768484873;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=224wu+aisUjgguVzKsbYp12yHOVFfWko0qYLu4j1cOA=;
        b=RE4+7ifNszzZ5zyAdQOUWVi+4m3lth/Xa+sbeA/3NX/upN+cAB/eG4vgWc0c89yZTV
         XIe2kOlzYDjEQhsW6YRwzF5JefVwwbA1VGPTghOzaBFh1WPYq0JBv1CfJliXX/wAjl14
         31EEPzUxfpie23VD0hQdg7GPHQyp5CZ4vPRfHq9dwmoEXJ+6BlPMQ8/7xapXw66wR1ka
         iI8PfsAb5sOVLQoaFPo7GAdiEK8OthGcLassoTLQZWYpK242TED6y1/kl7x/xQT0lbgG
         vJheKcymusDPI4AiNeDbYSwnM3UnFyiWR7skP0nm+qQHQiOoLxfEzD4vm2Ce13fHj39T
         iLHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdS3Yanqjdi+Jju8mmqEqEAWrP86VHiIV5aNQS8FKMYOwbG9hEVB/GFy+uPjCEGC8QMTVfyvM/Y41mZaDzbYym7w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxKtZlFtAhqJO7eOXXUGm+JjNFclvULKGMOLBe9VvYSMvHGA366
	dw6VITpnWlaPsf/H/Mlzf0lDn3X8vnIwxozzcIMFU/Rz+M3UPMgswk62bk2rMIPhYzM=
X-Gm-Gg: AY/fxX5kQV+PvJMy+TRnaCo4CitnrCwlm36nD3rqVFo27ZWkDvPkUa3YzCgXm10waa8
	EBm+xC6DZ5LpFoPwa9Vuym6vWa5qZ72WacK3ZXd9h8rs7/UnrwUrfgmPEQ9k4gqejrDTR60gKRP
	v3DHld+s9xec0jJdZi1/QEXtXBfOH7YXOZ9YTEsGbZP5jm106/3x8UmOT3JOqX6PXcB1ZIqQaha
	Ucz9YzYx1U5NQODcl5vD/wLM5/Co5FPyurcQ1bQ9E9YdC4tOqU2OEDyFDr2v4/1iRCzm0XOnFHZ
	PVP5EqD5rWl5USeVoiBCX5La40vS+h4TKLLpGADShICpbDQg0iXUSp1HeJj0noaZqZvTiMzOU2U
	rMBihfh3cGrOXvujqMqNMK7HXW9B/wh3n7njPB+Sfhn8IGUmBPhNI2sIZ8Y8mPRuBdxkveEQ0a6
	eWImo/47IpGBgEo1dRd4FK7wdSEtnxgAbr1XwW0Q635/z45QV+1TbCfYTL94prLPrG
X-Google-Smtp-Source: AGHT+IEGZ94ClwkJObELzg4EeIZt2YiGX3bNzjDA8x2weaWGMR1gDhVIBjKwcb/7fnYnJFyRyJYAng==
X-Received: by 2002:a05:600c:3556:b0:477:63b5:6f3a with SMTP id 5b1f17b1804b1-47d84b3bc7amr67810045e9.27.1767880072559;
        Thu, 08 Jan 2026 05:47:52 -0800 (PST)
Received: from ?IPV6:2001:1970:3847:e000:1977:be2f:4a71:2892? ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f668e03sm160484945e9.14.2026.01.08.05.47.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 05:47:51 -0800 (PST)
Message-ID: <e08f4462-d60d-41e4-9345-abab1cddbd57@baylibre.com>
Date: Thu, 8 Jan 2026 08:47:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 0/5 v2] python3: upgrade 3.13.9 -> 3.14.2
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org, Ross Burton <ross.burton@arm.com>,
 Tim Orling <tim.orling@konsulko.com>
References: <20251219134734.842422-1-tgamblin@baylibre.com>
 <DF4LE2CKH2GP.1O49L3MTHRQIG@bootlin.com>
 <adc441a8-e19a-4d61-a3bc-9ec0927b434f@baylibre.com>
 <CANNYZj9+DPHLoWUsNngX12JwA1ZntaVrRmyyOMqiH7mN_5_E6Q@mail.gmail.com>
 <60b08678-6380-4512-a1e6-0518ae4710c4@baylibre.com>
 <CANNYZj9zAxJpGZ=bZHOZh3FBwU_Mgw=89sR8rS53OC99tCvPvQ@mail.gmail.com>
 <4ec2fab7-4d1a-4d4e-9047-c62a45109341@baylibre.com>
 <CANNYZj9=aiv5HU6i6aw0GfkXSM6qdNEHgHWQEMjej+xA07seGw@mail.gmail.com>
 <18883AAF7D8D6C1A.2355985@lists.openembedded.org>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <18883AAF7D8D6C1A.2355985@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 13:48:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229072


On 2026-01-06 14:22, Trevor Gamblin via lists.openembedded.org wrote:
>
> On 2026-01-06 04:39, Alexander Kanavin wrote:
>> On Mon, 5 Jan 2026 at 15:18, Trevor Gamblin <tgamblin@baylibre.com> 
>> wrote:
>>>>> Maybe. I tried all of this locally (on a F43 system, which includes
>>>>> 3.14.2 as of writing), and after I sourced the pokysdk script, the
>>>>> interpreter on my path changed to version 3.13.4. Seems that the
>>>>> install-buildtools script is (at least for me) resulting in a 3.13.4
>>>>> version is getting pulled in. I'd think maybe something got 
>>>>> contaminated
>>>>> somehow from my cache, but there'd be newer 3.13.x versions for it to
>>>>> grab if that were the case.
>>>> install-buildtools brings in python 3.13 into PATH, as that's what is
>>>> inside the buildtools tarball. That is expected and won't change until
>>>> after 3.14 lands in core, and new buildtools is produced with it.
>>>>
>>>> The mystery is why the test first gets 3.14 from running python3 (that
>>>> comes from the sdk installation), then right after that 3.13 from
>>>> running maturin (that comes from buildtools).
>>> Ross and/or Tim, any thoughts?
>> I looked into it a bit. I believe the issue was outdated maturin, with
>> the 1.9.4 -> 1.10.2 update having landed in master it goes away. This
>> patchset can be re-taken into testing without modifications.
> Thanks for looking at this again.
>
> I did see that there was an upgrade submitted to move python from 
> 3.13.9 -> 3.13.11, so if that goes in first then I'll still need to 
> rebase this.

That upgrade is now on master-next, so I will rebase and re-send this 
series.

- Trevor

>>
>> Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228922): https://lists.openembedded.org/g/openembedded-core/message/228922
> Mute This Topic: https://lists.openembedded.org/mt/116859136/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

