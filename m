Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAF8FC54799
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 19:55:27 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web10.3515.1692302126059249322
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 12:55:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=Ma3PhfmA;
 spf=pass (domain: baylibre.com, ip: 209.85.167.178, mailfrom: tgamblin@baylibre.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3a7d7df4e67so64779b6e.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 12:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1692302125; x=1692906925;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ei8oNkBGHqnUq6rNIJZmSXy8fl+x28PDmmnrVOlcnzE=;
        b=Ma3PhfmAoFbAeAlZA4fc8DQax/wAwWmnL1oqAGjNhKHgXCETbs3HxJmXaKoK3vPGcS
         a2uLczxXBokYeUrcDHSCmBm0wqdlW42c74PlQe+JZ/vxgnxfiWD8OV/v+BPoI4zuajLs
         HyOrSY69aDrBxKiU5Y/Znbqs5lOR21ynJcXxwtVAvQTbQEI9gUxTrD/1dr+tRIbY1+RD
         llR1wA/GTN74+3c/s8ZPhA4NFQvM8T/S1+khqDAbPv33oUSYdrRPTblmvRy56f9A6etL
         oFPvHebDkbJ/ipBSuTOu1SkIb+SMnuB4CMWPMoJLesSbGDE5mVcecIDRr7jOi6y/fn9B
         sA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692302125; x=1692906925;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ei8oNkBGHqnUq6rNIJZmSXy8fl+x28PDmmnrVOlcnzE=;
        b=hji7akyn+i4/Tky6GFeLUJuimmtc9S1/sVw7EAVwVvqapcjjd8rKx8hz2ClY2lAc40
         brnNDLa1IyMKp/Jhxlgi+6SiitFN7Q0iWmFfI6U7GtgJFtAwBm1a7vdi5s/ESNW5R0dF
         leZmC5NN7Iu3vGtMrL9cfEXSM0GvyhAylMNirKiC4s9foGg8cNHQM6mCIAMMPFJxcrKM
         uOAaDlHLDKACtEuhoshGoGAQJCZJhw71xy8R8hXtrlONRwmg6+U15UPs8oAXGSXmnrnF
         HNN7iALLPcN1RNqJcibRjGEWataY4PuU/klGBLWjWhowXbSwGx862PK82WfMUVtiL9ng
         8DNA==
X-Gm-Message-State: AOJu0YxU2llCrYqWURwvjZIs2HprMm0kMQIY/l9pLEkgiluJvoKnvZhv
	nURCZx2xFITL+76Jdy3T8GSxlJSbYmoQ1rWY/Gg=
X-Google-Smtp-Source: AGHT+IHKlWM62NIbGxehCMrau8w92xjX9CuLB/ZMMAVt75ihOlAkSLF/50GvXcJVg8Wo/NEqNG4Fhg==
X-Received: by 2002:a05:6808:179d:b0:3a1:dd99:8158 with SMTP id bg29-20020a056808179d00b003a1dd998158mr706364oib.6.1692302124861;
        Thu, 17 Aug 2023 12:55:24 -0700 (PDT)
Received: from ?IPV6:2001:1970:5b1f:ab00:d875:6297:4e81:e577? ([2001:1970:5b1f:ab00:d875:6297:4e81:e577])
        by smtp.gmail.com with ESMTPSA id m16-20020a0cf190000000b0063fbfbde4adsm104064qvl.129.2023.08.17.12.55.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Aug 2023 12:55:24 -0700 (PDT)
Message-ID: <79144717-9769-e049-09ac-026d4726f5c2@baylibre.com>
Date: Thu, 17 Aug 2023 15:55:23 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core][PATCH] oe-buildenv-internal: update required Python
 version
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <177C43BD404469E8.16168@lists.openembedded.org>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <177C43BD404469E8.16168@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 19:55:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186341


On 2023-08-17 15:53, Trevor Gamblin via lists.openembedded.org wrote:
> The system requirements in the current version of the reference manual
> state that Python 3.8.0 is the minimum version, but oe-buildenv-internal
> still only checks for 3.5.0 or newer. Update the script to match.
FYI I didn't have an actual system running Python older than 3.10.x, so 
I pulled an Ubuntu 16.04 Docker image to test this with.
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>   scripts/oe-buildenv-internal | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
> index f856e618aa..2fdb19565a 100755
> --- a/scripts/oe-buildenv-internal
> +++ b/scripts/oe-buildenv-internal
> @@ -32,12 +32,12 @@ fi
>   # We potentially have code that doesn't parse correctly with older versions
>   # of Python, and rather than fixing that and being eternally vigilant for
>   # any other new feature use, just check the version here.
> -py_v35_check=$(python3 -c 'import sys; print(sys.version_info >= (3,5,0))')
> -if [ "$py_v35_check" != "True" ]; then
> -    echo >&2 "BitBake requires Python 3.5.0 or later as 'python3 (scripts/install-buildtools can be used if needed)'"
> +py_v38_check=$(python3 -c 'import sys; print(sys.version_info >= (3,8,0))')
> +if [ "$py_v38_check" != "True" ]; then
> +    echo >&2 "BitBake requires Python 3.8.0 or later as 'python3' (scripts/install-buildtools can be used if needed)"
>       return 1
>   fi
> -unset py_v35_check
> +unset py_v38_check
>   
>   if [ -z "$BDIR" ]; then
>       if [ -z "$1" ]; then
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186340): https://lists.openembedded.org/g/openembedded-core/message/186340
> Mute This Topic: https://lists.openembedded.org/mt/100807624/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

