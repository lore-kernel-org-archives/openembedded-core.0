Return-Path: <arnout@mind.be>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D561C05027
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 12:52:36 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.13652.1675342352193554578
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Feb 2023 04:52:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mind.be header.s=google header.b=JPB7WOoU;
 spf=pass (domain: essensium.com, ip: 209.85.218.51, mailfrom: arnout.vandecappelle@essensium.com)
Received: by mail-ej1-f51.google.com with SMTP id ml19so5804850ejb.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 04:52:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VJhQwLFeWmprQjl3iPx7AJEKPuxNaGwRmLNWV2lj2ug=;
        b=JPB7WOoUls55QuA8KrQFEQdHUMPhJILCmD7mmYFW1t+bPlryowbMNk0FH2gV7zqUP3
         Z0E15fc3DNgRdc4QrJFqsFIvwYT4B6UN41HN16RNZi3n5aypJNUL0ivhQok24NvDtsv0
         gM0PzYDoOQ2mQ4AJa/vDAkFqALasP0HUa6TcMQw5OKeKs3S+iC3rk2tNUxjQLE/0yxxC
         q+zN6BGTnHh5+stSLJRzJtV3I7Jm3b8UBs2GT7StZzWNplSwaHXLackCXSh0Hqpn/orr
         G7OVnUfefqsyWCPt8DrdJqEyNhS/FhmdMiWhxG1PwZtpaMy6jSm69YWGBxbu7Qd4tdN2
         ePYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VJhQwLFeWmprQjl3iPx7AJEKPuxNaGwRmLNWV2lj2ug=;
        b=Xak0QmfGNJETco3JQw8isDEXnJanRuD5nxrNaZj1Z0O9HfL0DCn7Lelf9E9rcORVfR
         A8shDpMciSSUZ1vcxmoolKBLfOldYP/A/jtBDIYbjFOh5Bzd9Xc5dq8watvMMZqlf2XC
         GjyHmvTGyL6bWjaVxhn+2C3gW4O/AaTc969LdbpWB7rH5N6cV4vWFHAyat7LNPrMByvD
         kFjlKvJdhmN8ocbzBvWxsMQOGciciy+glQU6SDimB6Z4FXfaiIgJvuIY+ZPe7BusrlmY
         biP+84KGMZThCITQ1sY/THRuw2RmKUdYwrjEN/z9MKwTzh7l6iqzM1vWMItm0QQkM74D
         sImw==
X-Gm-Message-State: AO0yUKVRgQPX5Zdr0EMpm97Spklno/3Cdsn20cND/PxcYoOth29qS1bU
	2565OPM13ywHIOkPMlDNJAowznKD0T+ib2tG
X-Google-Smtp-Source: AK7set+IX2aSjsbBXU6jpm0aXAtCQfg10Y3AUDw6gWC+ivI4EdAyi29enlNUfYuDuexG01BCQ4X3QQ==
X-Received: by 2002:a17:906:7e4a:b0:878:66bc:2280 with SMTP id z10-20020a1709067e4a00b0087866bc2280mr5991893ejr.12.1675342350688;
        Thu, 02 Feb 2023 04:52:30 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:e7c3:8953:3ab9:2c18? (ptr-9fplejqcmbwz6qb22hk.18120a2.ip6.access.telenet.be. [2a02:1811:3a7e:7b00:e7c3:8953:3ab9:2c18])
        by smtp.gmail.com with ESMTPSA id e27-20020a170906315b00b0088e682e3a4csm1797195eje.185.2023.02.02.04.52.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 04:52:30 -0800 (PST)
Message-ID: <23e3e195-ab2f-563b-e918-7156a9d28978@mind.be>
Date: Thu, 2 Feb 2023 13:52:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [OE-core] [PATCH] python3-pytest: Remove dependency on
 python3-toml
Content-Language: en-GB
To: openembedded-core@lists.openembedded.org
References: <174002D603CDFD91.3213@lists.openembedded.org>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <174002D603CDFD91.3213@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 12:52:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176697



On 02/02/2023 13:49, Arnout Vandecappelle via lists.openembedded.org wrote:
> Since version 7.2.0 [1], pytest uses the "batteries included" tomllib
> module for parsing pyproject.toml configuration files [2]. It is
> therefore no longer necessary to have python3-toml in RDEPENDS.
> 
> [1] https://docs.pytest.org/en/latest/changelog.html#pytest-7-2-0-2022-10-23
> [2] https://github.com/pytest-dev/pytest/pull/9741
> 
> Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
> ---
> This patch only applies to kirkstone and langdale branches. On master,
> Python 3.11 is used which no longer needs tomli at all. On dunfell,
> pytest is still on 5.3.5.

  Meh, I copy-pasted the commit message from the kirkstone/langdale patch and 
forgot to remove this bit. I assume I don't need to resend for that?

  Regards,
  Arnout

> ---
>   meta/recipes-devtools/python/python3-pytest_7.2.0.bb | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/python/python3-pytest_7.2.0.bb b/meta/recipes-devtools/python/python3-pytest_7.2.0.bb
> index 02fc55fdb0..c4d1c184cf 100644
> --- a/meta/recipes-devtools/python/python3-pytest_7.2.0.bb
> +++ b/meta/recipes-devtools/python/python3-pytest_7.2.0.bb
> @@ -26,7 +26,6 @@ RDEPENDS:${PN}:class-target += " \
>       ${PYTHON_PN}-py \
>       ${PYTHON_PN}-setuptools \
>       ${PYTHON_PN}-six \
> -    ${PYTHON_PN}-toml \
>       ${PYTHON_PN}-wcwidth \
>   "
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176695): https://lists.openembedded.org/g/openembedded-core/message/176695
> Mute This Topic: https://lists.openembedded.org/mt/96698820/3616703
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [arnout@mind.be]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

