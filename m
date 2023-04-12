Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACDD8C7619A
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 13:19:38 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.42814.1681305576789842808
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Apr 2023 06:19:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=xxxWPYCM;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id l16so6045506wms.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Apr 2023 06:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1681305575; x=1683897575;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ETHld+ThuBUcZWjn1wjbOrYZ8ago8X3D8pmk5prJbz8=;
        b=xxxWPYCM8a+DXfy/V8bpAhXBGQ3W6oz6gsNcwRXPrC04yZKmz6+WjniK9CnHIo5D6S
         6PlMParBug7NlMuftXQbprwdyxXJ/zeWd+GR86McPmtYy2u/Euc5vQ2zZbMekASUuzcm
         yAjg9yD4FDY0FhSTfeX5Xg2xEPxff8LG9KrrSYFyWr/fYTVjlFQBBFPSZL+vtgSDJfrB
         mXyQZ2s3hWLUlhDQ5uA1swK1RARD77U6dnRuqdfmHeDzekZJl8LgvUjFhuNtIRatUXkZ
         bPr9Guec/Ibtco3XL0/MPFMay7KDAcusFN5XYSLkJhHUDIB1Jfk0ycvVbl5lzgebmH+a
         p6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681305575; x=1683897575;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ETHld+ThuBUcZWjn1wjbOrYZ8ago8X3D8pmk5prJbz8=;
        b=0wTvk8whb4QGTBRWokhXwJZj1wYJsX72dty+DJ5prGD8UBMVbnEubtLKi5KOK30diu
         /EPVBBE4FkV2wFJ6jdxDHd1PQTz0fuMlTGON7lkv/XQf3GRnCGgd+vV5bP0/ysz4M+RA
         BONDRj+Hb6yHN7ACji7nCX+8oyA9Cn1IosvfAx5EdJAYqrX8MJVQhrngI/sbu/QwY01t
         QZ7UQ+aothSt3z9+PvXHnhpOWU/Sgi6Y/uHeLisTfVxqDaCSlQSsiSo4nXOwhyiO3mw/
         lQHRC7jYniAUMXOOkqqEZ67///2FWxmg/7cK+birWFug65gGynoMDibrZXO/cafvJsHJ
         i8Yw==
X-Gm-Message-State: AAQBX9fHbnEQO0rMQTeVgP7nxY/3fu2NR7COtkAD0FTq3oxtG+5Hky15
	PGZC7H/SBCR0YJUrWdnwFGeuyg==
X-Google-Smtp-Source: AKy350b8IJk6L1R3V8KCFq2xMnW6h179Pe2lMxapvoUi8bjF/IB6GQsoT+tXLYWR4T0W04vyOt6Z2A==
X-Received: by 2002:a1c:7c14:0:b0:3ef:62cd:1eb with SMTP id x20-20020a1c7c14000000b003ef62cd01ebmr9774083wmc.7.1681305574754;
        Wed, 12 Apr 2023 06:19:34 -0700 (PDT)
Received: from [10.1.75.108] (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id i3-20020adfdec3000000b002f24db41f50sm7101288wrn.69.2023.04.12.06.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 06:19:34 -0700 (PDT)
Message-ID: <19119ee1-b9c0-c3db-39b2-c344fa5ca0d6@smile.fr>
Date: Wed, 12 Apr 2023 15:19:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [OE-core] [PATCH] cve-update-nvd2-native: added the missing http
 import
Content-Language: en-US
To: jan vermaete <jan.vermaete@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230412101926.1135184-1-jan.vermaete@gmail.com>
 <9b8d0c0c-3893-d5d5-18af-8ffe2561e498@smile.fr>
 <CABF_=yhq-53m331N2zP0hwZ6iw7WPQkRX2=2PgdG5uhGSvRC+g@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <CABF_=yhq-53m331N2zP0hwZ6iw7WPQkRX2=2PgdG5uhGSvRC+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Apr 2023 13:19:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179948

On 4/12/23 13:45, jan vermaete wrote:
> Hi,
> 
> I have no preference on how to fix it.
> I intended to stay as close as possible to the code of Marta

Yes, I see that. I'm okay with your patch as-is since the current code is not coherent.

But, I don't see how we can get this exception from urllib... Maybe someone with more knowledge in urllib can tell us?

Regards,

> Br.
> 
> On Wed, Apr 12, 2023 at 1:36 PM Yoann Congal <yoann.congal@smile.fr> wrote:
>>
>> Hi,
>>
>> On 4/12/23 12:19, Jan Vermaete wrote:
>>> Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
>>> ---
>>>  meta/recipes-core/meta/cve-update-nvd2-native.bb | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
>>> index 1c14481c21..2b585983ac 100644
>>> --- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
>>> +++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
>>> @@ -118,6 +118,7 @@ def nvd_request_next(url, api_key, args):
>>>      import urllib.request
>>>      import urllib.parse
>>>      import gzip
>>> +    import http
>>
>> If this is only for the "except http.client.IncompleteRead:" line 146[1], wouldn't it be better to fix the catched exception to match what urllib can
>>  throw or to remove the except block entirely?
>>
>> I've triggered the same error as you but chose to remove the except block to get my code running.
>>
>> [1]: https://git.yoctoproject.org/poky/tree/meta/recipes-core/meta/cve-update-nvd2-native.bb#n146
>>
>>>
>>>      headers = {}
>>>      if api_key:
>>
>> Regards,
>> --
>> Yoann Congal
>> Smile ECS - Tech Expert
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#179946): https://lists.openembedded.org/g/openembedded-core/message/179946
>> Mute This Topic: https://lists.openembedded.org/mt/98216121/2167232
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [jan.vermaete@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
> 
> 

-- 
Yoann Congal
Smile ECS - Tech Expert

