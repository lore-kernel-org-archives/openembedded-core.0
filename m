Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7612AC4167B
	for <webhook@archiver.kernel.org>; Sat, 25 Nov 2023 22:04:06 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.33782.1700949843687272281
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Nov 2023 14:04:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=ew1Pth7v;
 spf=pass (domain: baylibre.com, ip: 209.85.128.54, mailfrom: pidge@baylibre.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40b40599214so3860025e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Nov 2023 14:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700949842; x=1701554642; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RTHWTgESo45x/MaH4bMUxcniDIXkCk9ffERWkI2pS+E=;
        b=ew1Pth7v1WMFBiO1xYr3PjRKjAJ5emagEbvljmVo2jteZP5Yxky9j6NUMLamJOHyhH
         a1VWney4LR8KZA3nKMNJpgfoIW9MIL1QLWdMLEe7juYXRjB7SHLzfXCjwdCvfyi5iUC4
         3S+of5pHGwH2Lb6jlyQtsm2rp4pCYewvQVv/wHghYmCZej89G2OmBj8lcAYnh1Yp3xdc
         gxEWK9TNQtSeWe3DEsUMV5RRTnEZDtlnIYlFUoABl6XFmIWaXWKNodEOcRYd8RjQ+cRk
         Rq/Mwrcg5EeCbgTc8emwbZ9nBQ1cPMT6pKzjEMdXma0rnArJz7IIAUaYX+hLjAKfJ69q
         qgjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700949842; x=1701554642;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RTHWTgESo45x/MaH4bMUxcniDIXkCk9ffERWkI2pS+E=;
        b=tGCtJ+FAQLyF8NXywmsMfCoNad8j7ulvRh8KzJJQUxkusqU7fbZQaDX2SFKObAhJ8Z
         BX4llFbnhvb1OYzgX0r1rCyG77Rh8bdcvimVdfaQOFLcKiyMjDZZ7kvNbi0Gxso1g9CU
         FoLVr3P1n8Tt9bBSqakuOQcOcSYlKfa+Foc8visfOW1ahJqA3Ee5i1cUh9l2aknXl7tm
         linhSZ72Rl91Jnp2FQzFfZNGIyKf1XtpZCLrR3D/9Kv8vmMYj1p+4ZIEe4u6yyTVYb50
         TL6mEEFdJYys/3E91NDQaKxsTf5gteEEW9EMzTkdOcqMbX52nk4opZWT8fec9EJGySNd
         bSSQ==
X-Gm-Message-State: AOJu0YxS7a+Rs6fCFzRH1z8g4nDKDAVpvn1k2ldIfhlhOiEenkUHtCVu
	sseLOZdotDc3K+Is9tyvEkCnrw==
X-Google-Smtp-Source: AGHT+IHK+tOHJuu7vQui7iMgSw82oDzcVXRMDLgid4SDW854ezGEbXGNdP+1/2tkd5ZCjhFaojvu+Q==
X-Received: by 2002:a5d:4607:0:b0:32f:7649:2648 with SMTP id t7-20020a5d4607000000b0032f76492648mr5201015wrq.46.1700949841181;
        Sat, 25 Nov 2023 14:04:01 -0800 (PST)
Received: from [192.168.178.55] ([194.110.145.184])
        by smtp.gmail.com with ESMTPSA id v8-20020a5d4a48000000b00332eb16d1fesm4491465wrs.8.2023.11.25.14.04.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Nov 2023 14:04:00 -0800 (PST)
Message-ID: <ded5ca57-6281-4fb9-98ba-1341477e65ae@baylibre.com>
Date: Sat, 25 Nov 2023 22:03:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC 2/2] useradd.bbclass: ensure sysroot_setscene for
 DEPENDS
Content-Language: en-US
From: =?UTF-8?B?RWlsw61zICdwaWRnZScgTsOtIEZobGFubmFnw6Fpbg==?=
 <pidge@baylibre.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <cover.1700746611.git.pidge@baylibre.com>
 <c6d2ae3913582947c046d577a9dbf6dc8629909a.1700746611.git.pidge@baylibre.com>
 <12a072dc57477bc7a07847718a34bd75dab9abeb.camel@linuxfoundation.org>
 <84c99b9f-518d-492d-bffb-0f9bd4c633d1@baylibre.com>
 <20acca9c-9055-41f0-83b8-adb80f3f56ed@baylibre.com>
In-Reply-To: <20acca9c-9055-41f0-83b8-adb80f3f56ed@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Nov 2023 22:04:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191236

On 25/11/2023 15:21, Eilís 'pidge' Ní Fhlannagáin wrote:
> On 24/11/2023 14:10, Eilís 'pidge' Ní Fhlannagáin wrote:
>> On 23/11/2023 14:11, Richard Purdie wrote:
>>> On Thu, 2023-11-23 at 13:49 +0000, Eilís 'pidge' Ní Fhlannagáin wrote:
>>>> [YOCTO #13419]
>>>>
>>>> If recipeB creates a user and assigns it to a group created in recipeA,
>>>> we need to ensure two things:
>>>>
>>>> That recipeA is in recipeB's DEPENDS (documentation issue) and that the
>>>> sysroot setscene, in the case of a TMPDIR wipeout, is in
>>>> USERADDSETSCENEDEPS.
>>>>
>>>> RP and I discussed adding a USERADD_DEPENDS variable to deal with this,
>>>> but there is some magic around DEPENDS that a new variable wouldn't 
>>>> have
>>>> so I'm sending this as is for people to poke at.
>>>
>>> Can you be more specific about this "magic"?
>>>
>>> I'm still worrying that DEPENDS is too broad, there are many more
>>> things in there which we don't want listed as setscene dependencies and
>>> I think this needs to be more precise.
>>>
>>> Cheers,
>>>
>>> Richard
>>
>> The interesting thing here is if we do something like:
>>
>> python __anonymous() {
>>      setscenedeps = ""
>>      if "-native" not in d.getVar("PN") and 
>> d.getVar("USERADD_DEPENDS") is not None:
>>          for pkg in d.getVar("USERADD_DEPENDS").split():
>>              setscenedeps += " %s:do_populate_sysroot_setscene " % pkg
>>          d.setVar("USERADDSETSCENEDEPS", "%s %s" % 
>> (d.getVar("USERADDSETSCENEDEPS"), setscenedeps))
>> }
>>
>> we end up throwing:
>>
>> ERROR: creategroup2-1.0-r0 do_prepare_recipe_sysroot: The sstate 
>> manifest for task 'creategroup1:populate_sysroot' (multilib variant 
>> '') could not be found.
>> The pkgarchs considered were: qemux86_64, core2-64, x86_64, allarch, 
>> none_none-nativesdk.
>> But none of these manifests exists:
>>
>> /home/pidge/poky/build/tmp/sstate-control/manifest-qemux86_64-creategroup1.populate_sysroot
>>
>> /home/pidge/poky/build/tmp/sstate-control/manifest-core2-64-creategroup1.populate_sysroot
>>
>> /home/pidge/poky/build/tmp/sstate-control/manifest-x86_64-creategroup1.populate_sysroot
>>
>> /home/pidge/poky/build/tmp/sstate-control/manifest-allarch-creategroup1.populate_sysroot
>>
>> /home/pidge/poky/build/tmp/sstate-control/manifest-none_none-nativesdk-creategroup1.populate_sysroot
>>
>> The weird thing (hence this being an RFC), is that the patch I sent 
>> doesn't throw this. At first, I thought it was something happening 
>> with a polluted sstate but I don't think so now. I am absolutely 
>> unsure as to why that would be, BUT my suspicion is that this error is 
>> related to 14961 (which I'm still poking at).
>>
> 
> I had a crack at this tonight. Interestingly enough, limiting the code 
> "fixes" the issue, eg and allows us to use USERADD_DEPENDS:
> 
> if "-native" not in d.getVar("PN") and d.getVar("USERADD_DEPENDS") is 
> not None and d.getVar("BB_CURRENTTASK") == "package":
> 
> I guess my question is why would it work with DEPENDS but fail with 
> USERADD_DEPENDS unless we limited to do_package? (hence the magic I'm 
> seeing). I'm still guessing this is something in staging.bbclass that is 
> doing something funny.
> 

A bit more on this. The above is incorrect in that DEPENDS certainly is 
special in this context (I had inadvertently switched to 'bitbake -f -c 
package').

Not using the useradd patch works with -f -c (which makes sense)
So initial patch works with either -f -c or -c
Subsequent USERADD_DEPENDS code works with -f -c only.

Which tells me that there is something special about basing the patch on 
DEPENDS which isn't doing what USERADD_DEPENDS is doing, which again 
points to something deep in staging.

-e

-- 
Eilís 'pidge' Ní Fhlannagáin
BayLibre - At the Heart of Embedded Linux
www.baylibre.com


