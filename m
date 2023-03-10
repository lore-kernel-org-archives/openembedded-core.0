Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F151C6FD1F
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 12:52:09 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web10.18236.1678452728372114942
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 04:52:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VQ/yV15X;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id s11so19974752edy.8
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 04:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678452726;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B6QjnwvIAiNeJqM6oP5yAKsZ5UJg09cNfnNJFCBvdOk=;
        b=VQ/yV15X17k8ZxGeHn4ZUyl9bCiSiGmFno+M8RPGVrq+EBLw8CBe0P0uTfolmvSBa1
         hOWzf6ycoPp4y6qCxvYZAYQ/ap3ShKNqCjZA9yYVkcmZ0BVwFdhq42Gn7okTbhUmM3sG
         K131QY8JHhq6kGRlr79WR0SpYH+wiTdkg6G+yxMF90kc9xFT4TL3lAkS9b70ZANKkOat
         +QE+ts16H01Xrd66G6HJhj7Bu7Ibe/ywpW5dt1tCELV6IykpMYMqeigcY3cFdRV0azBm
         i9p6iKciez+3iE2myPZhKSBKbxFFYqQJ4gm0t2PI6ubEl1+QEjBrRMUPdlzipTAl8YzV
         nRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678452726;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B6QjnwvIAiNeJqM6oP5yAKsZ5UJg09cNfnNJFCBvdOk=;
        b=IVb/+ND4MYLUjie4ENreGzxLasDZEY6M9oT2yF3dknVmHR2AlQi0qAssjjF/dz58gG
         zl0MeRkTE6m4fz8IUOr5ppGm91CSFl5KofjSSKaa2bXqEv+O2Ud4H53Cvhr1qldinT0M
         cFp1KIkxUCKj3+aLxUInQL76v+sdYzMhXWFrdBIi36pcLMOPGzfIs1uPva54OsFzX5ca
         QT2NbRTZje7QIoCmO/srYYwZHOQNpRRZEPcbxpN4y3IPJ/oLBRV6VTejTmG2h2FBk+Zb
         f2a2Jwm+p6M4RF/RnziEe9Iv1z0oLuIe/T6lgJYE0dd1Fu7+du34JMUMxgE2aKeLI8Tq
         5pXg==
X-Gm-Message-State: AO0yUKVzfQ8XPjX0bsPcm78uuK7aZa2Ej0gQRrvy/seaLVGA5Qbune86
	SMyuYWoLsDG2cUKXQgKc77Y=
X-Google-Smtp-Source: AK7set/aWPF9EiYq31PEW7NW2wQM/CmZdgoR7tJJcZnaFoqE/7goK9F81yByV9uFE1JMpI/oTtNwcg==
X-Received: by 2002:a17:906:4fd5:b0:8fd:2f01:86c0 with SMTP id i21-20020a1709064fd500b008fd2f0186c0mr30401894ejw.2.1678452726412;
        Fri, 10 Mar 2023 04:52:06 -0800 (PST)
Received: from [192.168.1.143] (BC244571.dsl.pool.telekom.hu. [188.36.69.113])
        by smtp.gmail.com with ESMTPSA id me25-20020a170906aed900b008d92897cc29sm932852ejb.37.2023.03.10.04.52.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 04:52:06 -0800 (PST)
Message-ID: <ea5fff65-9f06-95bc-94cb-803816e8c79a@gmail.com>
Date: Fri, 10 Mar 2023 13:52:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] pypi.bbclass: Set SRC_URI downloadfilename with an
 optional prefix
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <CANNYZj9qRTsH5mJK-h+aXJofM+eEoL3Q=nRxFB9LUzrLWNxvGw@mail.gmail.com>
 <20230310123254.2744497-1-zboszor@gmail.com>
 <CANNYZj9BubWuZTUgzLuWSM924cMkdk-gZ7bbm08U5ppeb3WATA@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj9BubWuZTUgzLuWSM924cMkdk-gZ7bbm08U5ppeb3WATA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 12:52:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178332

2023. 03. 10. 13:45 keltezéssel, Alexander Kanavin írta:
> Thanks, I like this better than changing the cmake recipe.

Thank you. I will resend the new module recipes against meta-oe soon.

>
> Alex
>
> On Fri, 10 Mar 2023 at 13:32, Zoltán Böszörményi <zboszor@gmail.com> wrote:
>> This allows avoiding clashes between source archives of a main
>> project and a pypi project using the same name and version.
>>
>> The new optional setting is PYPI_ARCHIVE_NAME_PREFIX which is empty
>> by default so previous downloads can be used. Example usage:
>>
>> PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
>>
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
>>   meta/classes-recipe/pypi.bbclass | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes-recipe/pypi.bbclass b/meta/classes-recipe/pypi.bbclass
>> index aab04c638f..f510bfed06 100644
>> --- a/meta/classes-recipe/pypi.bbclass
>> +++ b/meta/classes-recipe/pypi.bbclass
>> @@ -15,11 +15,13 @@ def pypi_package(d):
>>   PYPI_PACKAGE ?= "${@pypi_package(d)}"
>>   PYPI_PACKAGE_EXT ?= "tar.gz"
>>   PYPI_ARCHIVE_NAME ?= "${PYPI_PACKAGE}-${PV}.${PYPI_PACKAGE_EXT}"
>> +PYPI_ARCHIVE_NAME_PREFIX ?= ""
>>
>>   def pypi_src_uri(d):
>>       package = d.getVar('PYPI_PACKAGE')
>>       archive_name = d.getVar('PYPI_ARCHIVE_NAME')
>> -    return 'https://files.pythonhosted.org/packages/source/%s/%s/%s' % (package[0], package, archive_name)
>> +    archive_downloadname = d.getVar('PYPI_ARCHIVE_NAME_PREFIX') + archive_name
>> +    return 'https://files.pythonhosted.org/packages/source/%s/%s/%s;downloadfilename=%s' % (package[0], package, archive_name, archive_downloadname)
>>
>>   PYPI_SRC_URI ?= "${@pypi_src_uri(d)}"
>>
>> --
>> 2.39.2
>>


