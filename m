Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B3BC0015E
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 05:26:47 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.6359.1690867606710737989
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 22:26:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=fby4++56;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: zboszor@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-99bf8e5ab39so489293766b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 22:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690867605; x=1691472405;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ie8cjfPLZQNIu7sJ5mSlnTi3LTOf2nnXhQu6KsYyTOY=;
        b=fby4++569pLt53WpJgqg7De2p1w8XmaVUYo4AUWuGajG/qNPP4zDIQPHUSJnx/bIiQ
         57MVfT8GVPRu4xW0DL3bqnIuqE1FKvwI8XvCRRF5PQOxCIIwULkMBmZSBUeJXo7BGQFG
         Etvx2eUMMSEhrxgKjBuNLtIKlmXKVo3pIuITAg/nRLwDgfkVhvF7XHGFxV2cbrd9wqYY
         0dJ/uz3per0Q/FPV3TxcNH6Ukt8YHHCHwobK4WIXP7Z30w3xe7Q8LCe7N0iaiRYyXvoc
         fel1YpXHtOyelC/HLMOprbctmYaOGeQo41o0yI7HMsR4GjF6woZM3lAzqQaEI3yNanxh
         oe7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690867605; x=1691472405;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ie8cjfPLZQNIu7sJ5mSlnTi3LTOf2nnXhQu6KsYyTOY=;
        b=lp7e/B83+pdUAxrWH7oMpTIlKHOZLywTRjscasp75Ksb8xvpLYyLkOzf4WqCl8DoIm
         NBucjqfJII2tIoKfvkYehMVt8QYQXApaKRYE+dKR9QIlo6OFSSqw3pgFMaA3WCGI7cfe
         IXIRJHjnbQ2bqnwp6EB5SGrTHq6igd8nM/eeBm0/WSE3U5sZi13fD9/A8kRJe78XEopy
         SCFXdME08mEdntjksBDfnr/DLWiBrFBV1wabJe+/1H2KrGxTqEc+QlVD1IW1qgbGNN50
         8Mlb4gzyDPPRC+S32zIkw1yPwqC33s/2T0iP79pk694paD9XkKXkR5tvgFkI0x/O38gn
         NRrg==
X-Gm-Message-State: ABy/qLbhk7v6GAgALRyXVyUJKlVYkdVbu31ImHd8HECxgQ4qzaVRLwIy
	L9w+cGCHI7l/3m81c8BbC08=
X-Google-Smtp-Source: APBJJlG4lGQBAkvaM/8YuIP1BOGgNw9V/TkfTsxngu6YKAKIpqxDqnK5Xn/sfN5xdykHSZ8HMk6mTA==
X-Received: by 2002:a17:906:7a1e:b0:991:c67d:87a2 with SMTP id d30-20020a1709067a1e00b00991c67d87a2mr1418450ejo.28.1690867604811;
        Mon, 31 Jul 2023 22:26:44 -0700 (PDT)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id f15-20020a1709067f8f00b00985ed2f1584sm7092470ejr.187.2023.07.31.22.26.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 22:26:44 -0700 (PDT)
Message-ID: <2e251892-014d-4b33-e11c-d6c46897b7ef@gmail.com>
Date: Tue, 1 Aug 2023 07:26:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core] [PATCH v5] rpm: Allow setting platform macro settings
 externally
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
 Ross Burton <Ross.Burton@arm.com>, Alexander Kanavin
 <alex.kanavin@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20230731082138.92309-1-zboszor@gmail.com>
 <2023073117111183e153dc@mail.local>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <2023073117111183e153dc@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 05:26:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185191

2023. 07. 31. 19:11 keltezéssel, Alexandre Belloni írta:
> Hello,
>
> On 31/07/2023 10:21:38+0200, Zoltan Boszormenyi wrote:
>> Feed platform settings to installplatform externally. Based on the patch
>> submitted under https://github.com/rpm-software-management/rpm/pull/2585
>>
>> Patch against INSTALL was backported for rpm 4.18.1
>>
>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
>>   ...atform-macro-settings-externally-258.patch | 118 ++++++++++++++++++
>>   meta/recipes-devtools/rpm/rpm_4.18.1.bb       |  20 +++
>>   2 files changed, 138 insertions(+)
>>   create mode 100644 meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-macro-settings-externally-258.patch
>>
>> diff --git a/meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-macro-settings-externally-258.patch b/meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-macro-settings-externally-258.patch
>> new file mode 100644
>> index 0000000000..f4c3630b8c
>> --- /dev/null
>> +++ b/meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-macro-settings-externally-258.patch
>> @@ -0,0 +1,118 @@
>> +From e58c607dcdb303ff3ba1b22fd23eb20e374b6ed3 Mon Sep 17 00:00:00 2001
>> +From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
>> + <zboszor@gmail.com>
>> +Date: Fri, 28 Jul 2023 12:16:56 +0200
>> +Subject: [PATCH] Allow setting platform macro settings externally (#2585)
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=UTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +* Allow setting platform macro settings externally
>> +
>> +By default, rpm installs a series of default platforms based on
>> +the CPU architecture names in subdirectories called
>> +
>> +    /usr/lib/platform/<arch>-<os>
>> +
>> +This is enough for regular Linux distributions. However, some
>> +distributions may use more specific platform names that refer to
>> +particular computer systems, like SBCs or specific CPU tuning when
>> +compiling.
>> +
>> +If the platform subdirectory does not exist in /usr/lib/platform
>> +then rpmbuild does not work.
>> +
>> +Allow creating such custom platform subdirectory with feeding
>> +the necessary data using external variables: RPM_CUSTOM_ARCH,
>> +RPM_CUSTOM_ISANAME, RPM_CUSTOM_ISABITS, RPM_CUSTOM_CANONARCH
>> +and RPM_CUSTOM_CANONCOLOR
>> +
>> +Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> +
>> +---------
>> +
>> +Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> +Co-authored-by: Florian Festi <ffesti@redhat.com>
> This is missing the Upstream-Status tag.

"Upstream-Status: Backport" ?



