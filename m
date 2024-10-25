Return-Path: <andrej.v@skyrain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88467D0C61F
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 15:01:08 +0000 (UTC)
Received: from h1.cmg2.smtp.forpsi.com (h1.cmg2.smtp.forpsi.com [81.2.195.188])
 by mx.groups.io with SMTP id smtpd.web11.14106.1729868465155016977
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 08:01:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=EZWgfOqI;
 spf=none, err=permanent DNS error (domain: skyrain.eu, ip: 81.2.195.188, mailfrom: andrej.v@skyrain.eu)
Received: from [192.168.10.89] ([62.197.243.174])
	by cmgsmtp with ESMTPSA
	id 4LoEtOp22TNCy4LoEtZjdK; Fri, 25 Oct 2024 17:01:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1729868463; bh=URRzEmqsKKhJoSfYwxelOjJOWT9u6hY71ktiSjQca9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=EZWgfOqIk2dBkpR513IJaA6kONH307atdsKHS13tah3bWxEhf22cBUcQMRxELXDrd
	 jxHyGIDmdZLiHcSL20TDw0RXOhihdGKfXWMJU5KR0nW/dMJErWjac/HcDRuhPoe06q
	 EG1BZVAdwmVVxL4tfWDsNvynm7GE6wYaa31kWFg916OAgDLn8UEtzD3zvgQ1e7Qrdr
	 bR/VF+PUIRapkdJBacAj/KVG7D9o7xx9luck7mQJz1mi6vHEsEtf1WAdnCczW4MM66
	 ZG04NGU40NsCyTo3hc7cGfSk8scECkKOHaaM05krXD4JkXwhznNWQp//eIMVClP3Ct
	 YzC+ZOP+zVPrg==
Message-ID: <a30ee7e5-bc6c-4490-9c10-2972138051b5@skyrain.eu>
Date: Fri, 25 Oct 2024 17:01:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [yocto] [PATCH 0/9] busybox: cleanup and fix config fragments
To: =?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>
Cc: yocto@pengutronix.de, openembedded-core@lists.openembedded.org
References: <20241007120950.975803-1-ejo@pengutronix.de>
 <86710f995a94387b6246fca883d5669acef032dd.camel@pengutronix.de>
Content-Language: en-US
From: Andrej Valek <andrej.v@skyrain.eu>
In-Reply-To: <86710f995a94387b6246fca883d5669acef032dd.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfCN1aO1ik2c0+rG9kYlXo1F3LJ8kk53ZXDhC0s0w7gDots418xwURsKo9M9NDxDzomikj5KG+2XBM3RuOvZchjaJzMFdLYcTHWwSncMxcYoCz6Lb4Be+
 GovdDehy9EYZEe5bOycwGBeicaD+jhVVaQtfCSKcT5YQ7fkUE6Lahc1nE5GrUoNq+K1fbTLl4zmuP/QIt8mQdV1OHEDgzAqueNHlpYXHGK8KT1qTsJ5LYMPs
 DUEiL0PRXTkFZoYiH+/iIj3mee2B+LMBsOPZ9TThSySRE6kjrTeUwnH98LpmZguD
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 15:01:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206352

Hi Enrico,

Could you please guide me to the right patch? I wasn't able to find it ;).

BR,
Andrej

On 24.10.2024 15:04, Enrico Jörns wrote:
> Am Montag, dem 07.10.2024 um 14:09 +0200 schrieb Enrico Jörns:
>
> [TO += Andrej Valek <andrej.v@skyrain.eu>]
>
>> Most of the busybox config fragments are useless since the respective options
>> were accidentally enabled in the 'defconfig' file during the defconfig update
>> to busybox 1.33.0 [1].
>>
>> This is redundant and confusing and takes the ability to disable options by
>> removing the respective fragment file from the SRC_URI.
>>
>> While cleaning this up, some other inconsistencies were found and fixed.
>>
>> The series starts with a defconfig sync to the current defaults to have a clear
>> base to work on.
>>
>> [1] 4335cd24 ("busybox: refresh the defconfig from 1.33.0")
>>
>>
>> Enrico Jörns (9):
>>    busybox: sync config for busybox 1.36.1
>>    busybox: disable defconfig options from simpler fragments
>>    busybox: disable defconfig options from syslogd.cfg
>>    busybox: mdev.cfg: remove CONFIG_SETSID
>>    busybox: disable defconfig options from login-utilities.cfg
>>    busybox: disable defconfig options from unicode.cfg
>>    busybox: getopts.cfg: disable long options
>>    busybox: disable long options in defconfig and fix longopts.cfg
>>    busybox: disable defconfig options from mount-via-label.cfg
>>
>>   meta/recipes-core/busybox/busybox/defconfig   | 124 +++++++++---------
>>   meta/recipes-core/busybox/busybox/getopts.cfg |   2 -
>>   .../recipes-core/busybox/busybox/longopts.cfg |  11 +-
>>   meta/recipes-core/busybox/busybox/mdev.cfg    |   1 -
>>   4 files changed, 68 insertions(+), 70 deletions(-)
>>


