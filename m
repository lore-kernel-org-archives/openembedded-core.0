Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6515C7EE23
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 10:28:28 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.5642.1686220103353412260
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jun 2023 03:28:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=Egj37xuX;
 spf=pass (domain: baylibre.com, ip: 209.85.128.53, mailfrom: lrannou@baylibre.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3f732d37d7bso2583375e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 03:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686220101; x=1688812101;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vZb2N2Xih+lg4o8CUvoh5LHejFrAV2hZlggikRvBqDg=;
        b=Egj37xuXyYx/uiUQDZqrwWGxGNFd7tCAwgnTfctMIsWudALYOjrkZXFGlFT3yk6WNq
         7wiMOaWjK+4TPKGgxuwUKY0DBtSXD0qQRjjRlbN5S940dRqYS0K+hzAResKOfoEg8qWB
         4WzUUTnHUqYVeJhY8RYtuzBl6E42C4kt4CxS0AaZDb8Z05MT+2HoTHW4ttb5e88MLU9p
         KTp8RZ5WmR6Xfp3JEJbOYxM1FE61+7bVyvIB3/Fal3clUck2riXxnJY3isyvDoaO8CnO
         YqEe0GKJB+o1kbTONOC8jz+9bCU74du2YNSQ9fiYA35GifsEkysp7HTAFG9SSfzA2FvM
         prBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686220101; x=1688812101;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vZb2N2Xih+lg4o8CUvoh5LHejFrAV2hZlggikRvBqDg=;
        b=AlpEiFEb9zPZ5jlbJiVwan/WLK1YmAwwfFRJuOU+dWJw5MQ/SiMMuAi5JnaIdHVp45
         GKRwNs9xLKiCBiJJLfhvRgqFSSKehL3KnxYSRKC9YqZV6o+DH+gu+RJfo7hlie4louCw
         5gBVwDq+8auBwJ5SHTAhlhYpm49SjOSwMG44fS0Fr500Q75+ZIUhNfgVLlNbF/8btoN6
         Aq73DOOtv6r6GzX60T0vqG03BzR+z5R/Hr65K1qa7YMU1h9iTdbHBy+2Jrf/ceQxdT1d
         5K/OjL65Qae51zUTMQIarWG+k0PpgWgnb7QtmUy0NT6GaEbfLNDDMb7dxVDwdZjDhrKm
         oFbA==
X-Gm-Message-State: AC+VfDzNOO05gG8k5qaWSbePgPPTsdcNHXwTD22Myzd6PF2aIUeLa4xu
	OzqKvBIiB858/uT40ldf4yQibQ==
X-Google-Smtp-Source: ACHHUZ4HM3a8tTBSi1kExhmKmOXTiKjdQI5/YyqeeSBUvOpkxbL2Fz3TQLV1wfFKtJx5biZVDp4QXw==
X-Received: by 2002:a05:600c:ada:b0:3f7:e818:1eb with SMTP id c26-20020a05600c0ada00b003f7e81801ebmr983191wmr.40.1686220101610;
        Thu, 08 Jun 2023 03:28:21 -0700 (PDT)
Received: from [172.30.105.10] (lmontsouris-658-1-109-35.w92-154.abo.wanadoo.fr. [92.154.6.35])
        by smtp.gmail.com with ESMTPSA id a2-20020adfed02000000b002e5f6f8fc4fsm1161350wro.100.2023.06.08.03.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 03:28:21 -0700 (PDT)
Message-ID: <63764037-0417-ef4a-30d0-1fe74d7c9825@baylibre.com>
Date: Thu, 8 Jun 2023 12:28:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Subject: Re: [OE-core] [RFC] incorrect parsing of sysusers.d in rootfs
 generation
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 tgamblin@baylibre.com,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <b02fd7f2-b6f7-01f6-256a-d1bf9f7aa91a@baylibre.com>
 <08e9842b-0288-92c9-6327-a82e37f4af99@baylibre.com>
 <a5e311b0545dc84f64d985ffcbd595bff2f2a2ff.camel@linuxfoundation.org>
From: Louis Rannou <lrannou@baylibre.com>
In-Reply-To: <a5e311b0545dc84f64d985ffcbd595bff2f2a2ff.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 10:28:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182502

Hello,

On 08/06/2023 11:19, Richard Purdie wrote:
> On Wed, 2023-06-07 at 17:16 +0200, Louis Rannou wrote:
>> Hello again,
>>
>> a python solution could be one below.
>>
>> Also, I found that most of users/groups defined there are redundant as
>> they already exist (such as root). I guess they are defined from
>> base-passwd. I am not sure which recipe (base-passwd or systemd) should
>> have the precedence on this. If it's base-passwd, perhaps this
>> postcommand should check first if the user does already exist.
> 
> I'd say base-passwd should likely be the winner but we should probably
> error if there is a conflict between what sysusers.d and base-passwd
> are defining.
There will be some conflict. As an example the root home directory in 
sysusers.d is /root.

Some others users/groups defined in sysusers.d files are already created 
in recipes with the useradd class (such as systemd-resolved, 
systemd-network who are defined in the systemd recipe).

In the end, almost all users/groups in sysusers.d/* already exist. 
Perhaps it's a wrong way to parse this file to add users. In my opinion, 
we should only parse this file to check users/groups are already created 
and raise an error if one is missing.

Louis

