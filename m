Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48175C7EE2E
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 11:06:48 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.10593.1686308805552271860
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 04:06:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=JinA+HRY;
 spf=pass (domain: baylibre.com, ip: 209.85.128.46, mailfrom: lrannou@baylibre.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-3f7f543fe2fso15792375e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 04:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686308804; x=1688900804;
        h=content-transfer-encoding:in-reply-to:cc:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w/BHKpGFgOO8El6echGJLu4/lO/2t54y6zDe/eQN0FI=;
        b=JinA+HRYWKTg97Zk/8jm+YYESUAJ/o0HtvXTCIWySdr4I+CHaZRJi8jUZiybO/Xb0T
         jMfjK2bFmoyr8nG8RNsJo3Ca0fEEfmWP1MhQyxTgOrsB/oEnUxALksrfq3u/uRjki0U1
         +nIyziLVxKFldTozpTnJlO3dMXLRcDxC28EUnxkzNrTA2+t97R0PI0lde02UDJjdwXQA
         CQVLsAMS5g2moUBpbOtmpPUuE9c95ID5V71C2jkkIsOv1RK5Cp5XU8u8joom268Nniv4
         g4/n5sH8E6nKaXXu4Su467Oh+vSDV8dR8GkYql4SKhrV+jQ4gctth7a9KSFOr1/2CYq+
         Ad8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686308804; x=1688900804;
        h=content-transfer-encoding:in-reply-to:cc:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w/BHKpGFgOO8El6echGJLu4/lO/2t54y6zDe/eQN0FI=;
        b=hBaiTb2TxaJnpl7LskMi+TBwWjCLE+HXRtXeB4bVPQDakN1YLfX8M++mT7Wf85k6l6
         vKb/Nx1ANGeyS3oAmDsAyQKot0g58w0yqGytlGNy7Jb4D45UneEFvRKJq50hErffpYSu
         InEJ1BuhS01IHG2LBZH1SUIduFdv7J9vrnNuDiAmy6abm5fdBo3Uq7amqqJMAaKl4vhq
         Oz7JPMZNLu4Xr84nuAzMBca0tUZ+n+uGA6ab5iIVMIBACbNrbrS8S8cv9tSvv7bMtZpu
         iNA63AjRxx3ei/wRIERITeC4JcM3wYWq0nNuxEOlaUBoCNFUbdsDWmNBbiBKh96L7tRC
         1HOg==
X-Gm-Message-State: AC+VfDwv5hfv8mzGAsd728wjj1fVYiUgjxHxpAVprg/VG8xo1WOdXgbo
	mo530ocBJu0i4jRaOGKa77IxFw==
X-Google-Smtp-Source: ACHHUZ444hODDJJ64LE0EI7LAwP7mXl0KsEM1aC0TndTpaAzrc3x/gKdXFSrc62hFr4T+PGiCfBgEw==
X-Received: by 2002:a05:600c:2181:b0:3f7:f446:927 with SMTP id e1-20020a05600c218100b003f7f4460927mr883402wme.37.1686308803478;
        Fri, 09 Jun 2023 04:06:43 -0700 (PDT)
Received: from [172.30.105.10] (lmontsouris-658-1-109-35.w92-154.abo.wanadoo.fr. [92.154.6.35])
        by smtp.gmail.com with ESMTPSA id v5-20020adff685000000b0030fa6a0e9fcsm695887wrp.25.2023.06.09.04.06.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 04:06:43 -0700 (PDT)
Message-ID: <6ba9afba-79f0-ff68-0cf5-579f0d9ee1c4@baylibre.com>
Date: Fri, 9 Jun 2023 13:06:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Subject: Re: [OE-core] [RFC] incorrect parsing of sysusers.d in rootfs
 generation
Content-Language: en-US
From: Louis Rannou <lrannou@baylibre.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 tgamblin@baylibre.com,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <b02fd7f2-b6f7-01f6-256a-d1bf9f7aa91a@baylibre.com>
 <08e9842b-0288-92c9-6327-a82e37f4af99@baylibre.com>
 <a5e311b0545dc84f64d985ffcbd595bff2f2a2ff.camel@linuxfoundation.org>
 <63764037-0417-ef4a-30d0-1fe74d7c9825@baylibre.com>
 <c914f55e1cf6a1ef38a2c683d42ba315a204a182.camel@linuxfoundation.org>
 <74576333-4bd3-dcd8-b581-85e1bc289e41@baylibre.com>
Cc: Chen Qi <Qi.Chen@windriver.com>
In-Reply-To: <74576333-4bd3-dcd8-b581-85e1bc289e41@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 11:06:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182549

Hello, below is a counter proposition including some work in the systemd 
recipe,



On 08/06/2023 13:56, Louis Rannou wrote:
> 
> 
> On 08/06/2023 12:36, Richard Purdie wrote:
>> On Thu, 2023-06-08 at 12:28 +0200, Louis Rannou wrote:
>>> Hello,
>>>
>>> On 08/06/2023 11:19, Richard Purdie wrote:
>>>> On Wed, 2023-06-07 at 17:16 +0200, Louis Rannou wrote:
>>>>> Hello again,
>>>>>
>>>>> a python solution could be one below.
>>>>>
>>>>> Also, I found that most of users/groups defined there are redundant as
>>>>> they already exist (such as root). I guess they are defined from
>>>>> base-passwd. I am not sure which recipe (base-passwd or systemd) 
>>>>> should
>>>>> have the precedence on this. If it's base-passwd, perhaps this
>>>>> postcommand should check first if the user does already exist.
>>>>
>>>> I'd say base-passwd should likely be the winner but we should probably
>>>> error if there is a conflict between what sysusers.d and base-passwd
>>>> are defining.
>>> There will be some conflict. As an example the root home directory in
>>> sysusers.d is /root.
>>>
>>> Some others users/groups defined in sysusers.d files are already created
>>> in recipes with the useradd class (such as systemd-resolved,
>>> systemd-network who are defined in the systemd recipe).
>>>
>>> In the end, almost all users/groups in sysusers.d/* already exist.
>>> Perhaps it's a wrong way to parse this file to add users. In my opinion,
>>> we should only parse this file to check users/groups are already created
>>> and raise an error if one is missing.
>>
>> Perhaps lets start there. The fact different bits of systemd are
>> configured with different home directories is a problem we should
>> really fix though and ultimately that probably should be an error too.
> 
> Concerning the root home directory, I asked a question to systemd 
> https://github.com/systemd/systemd/issues/27959 and LP answered he 
> doesn't want to support a customizable root home directory.
> 
> Should we patch systemd to match our configuration, or should we change 
> our configuration to match systemd's will...
> 
> Louis

The more I look at this and at #9497 (which gives the reason of this 
command), the more I think the problem was not correctly handled.

sysusers.d is made to create missing users at runtime with the 
systemd-sysusers service.

First of all, that means there is a wrong runtime configuration as long 
as /etc/{passwd, gpasswd, shadow, gshadow} do not match sysusers.d/*.conf

I think it is fine to check during the build that sysusers.d/*.conf do 
match configuration for users/groups created during build, but we should 
not create users and groups at this stage because missing users will be 
created at runtime.

I think sysusers/*.conf should be provided with the systemd recipe so 
they match our configuration (such as ROOT_HOME for the root directory).

If you are ok with this, I may suggest a patch.

Regards,
Louis

