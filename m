Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 899F0C49EA1
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 13:11:40 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web10.6855.1722949896170791457
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 06:11:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=0RbrUru1;
 spf=pass (domain: baylibre.com, ip: 209.85.210.52, mailfrom: tgamblin@baylibre.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7095bfd6346so335285a34.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 06:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722949895; x=1723554695; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4MjgomMhUYRume8DKc1zI+U9wKBN1/K2j36aW190sFw=;
        b=0RbrUru1wQOBdqc2JMBBZUy3BfTkBFwr3/SFpX40/877f+S3YnMCFkg1/RdSjEzgW6
         jWj4zYbcTd1MLlsh0cv8VrU5Vok+b/XXfUdLGJpO2Sw2EYhz15Ye6mEECpQw2jRXV2CS
         86ceJu+zRKevvzTfx96cqLoxyVSjh4G77oeCFoSxxtwWGdMa2StkNWdo6Mom5+cWmTd5
         PVlsUrxZoS88kDM1t3KpalzBBhXDrVhb2KSXAbICFc0qyvztrPu4+Rlp/3LXKbUcKW+d
         ZyDZ0aVNSJykhtqVTP6WSRuVCKcWnbj1TTo6jysLwpceBpNrx4ofJBhODAeYpj8pJMve
         mttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722949895; x=1723554695;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4MjgomMhUYRume8DKc1zI+U9wKBN1/K2j36aW190sFw=;
        b=R7X22+c226eVjBujIfmeDKqEyvCxx+94FcY2R2UrBiAl+P7U+0C0jEOoimBpnnULrc
         qXXj14YBAshDZyDJUoKnmevHqx1cm6fPxH7PVLKTzXQOWhKjmcMHd//u5hR0z4eOlsS+
         73ZGL2O1eahvLw+oZyW+06p85yXGwSQzsCcJlFFnh4lbanZFwwNLPNz78wWfJr1AzAdG
         zDkrTBUzfo2xsYJnMwvgukeel9Uz79/A01IDsX5JXkHVdD3LDhNP1MLukBnokt/IDiEf
         7poIcKV0oChyVrsZD2niRVsMWz+lAEelu9Mh/grusvu9GCLJIYA7gC+48DBd7XfSih92
         R9iQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsmzmOX2/OhoNapJ1DTHpnlRx1RTtTB1J5h63QbfOQBkpskyMsWUz4ciRWs1ENrtJeyM5R7XjAjrikEhaDBkxs9RMqGQcXDOv7spxCw/HG8iUAw13d6wOe
X-Gm-Message-State: AOJu0YwuWOI/wZNayijp0Xa9IxweJ6FtecrzmexPTEVF9Jla7QLTybU8
	ngZ4a+rvEsXSqhJUqc5VBh56ljofX718jvAaCSVStBfohaXn9m6NbFZQk8HJZoI=
X-Google-Smtp-Source: AGHT+IHv2lnPFKQcAsKOzfeCDxu8qEqLEqADVR4hx3QvWEQ8RNHDSixCG9zfJMhjduAfENH8jCXtEg==
X-Received: by 2002:a05:6830:4704:b0:703:7827:6a68 with SMTP id 46e09a7af769-709aa005ab5mr17735527a34.6.1722949895291;
        Tue, 06 Aug 2024 06:11:35 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb9c7b8826sm46352326d6.64.2024.08.06.06.11.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 06:11:35 -0700 (PDT)
Message-ID: <7331a9e4-ae44-45cc-aa9a-5bd0430ce20d@baylibre.com>
Date: Tue, 6 Aug 2024 09:11:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] kea: upgrade 2.4.1 -> 2.6.1
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20240801171848.3102197-1-tgamblin@baylibre.com>
 <2088c6988f3248242a391db34289295c21490a20.camel@linuxfoundation.org>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <2088c6988f3248242a391db34289295c21490a20.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 13:11:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203022


On 2024-08-03 2:41 a.m., Richard Purdie wrote:
> On Thu, 2024-08-01 at 13:18 -0400, Trevor Gamblin via lists.openembedded.org wrote:
>> Refresh patch 'fix_pid_keactrl.patch' to apply on new version.
>>
>> Add an extra sed call to do_install:append() to remove a reference to
>> TMPDIR from ${D}/usr/sbin/kea-admin.
>>
>> License-Update: Update copyright year
>>
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> ---
>> v2 fixes the sed call so that it adds the right
>> '@abs_top_builddir_placeholder@' prefix into the resulting string,
>> matching the other variables found in that part of kea-admin.
> There looks to be a multilib issue in testing:
Thanks for the heads-up, looking into it.
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/6252/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/9165/steps/11/logs/stdio
>
> Cheers,
>
> Richard
>

