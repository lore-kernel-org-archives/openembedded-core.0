Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85DB8C4167B
	for <webhook@archiver.kernel.org>; Sat, 25 Nov 2023 15:21:54 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.26688.1700925709714543277
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Nov 2023 07:21:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=ikUMIv71;
 spf=pass (domain: baylibre.com, ip: 209.85.221.54, mailfrom: pidge@baylibre.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-32faea0fa1fso1583515f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Nov 2023 07:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700925708; x=1701530508; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2AZ5QS8lsSKr7+2Og7p3sgR6ulygpYjEMzIF2clFXcU=;
        b=ikUMIv71gXJGRItB/K99szSLN69+G6F2pyjDx7UZW2kpIj8Z3kCkh2rGzYZNRlFMSw
         r8YAJZqPENO2nil5LsE5HGJEP6hlkSewdcDhDDmjCLVsh8eOZ4/APQPBr0gJ/xscH/8y
         7P2q9gtFG6pprt4iGMST7754nVPhDlN6Rl72y4ysrSRFVlHPrydzqdu/CvXJJGjeKboA
         briZdktqydRWzDxF0UCIZE74RfGv4VNxCwxHCbXMLLVDp9EWrJnYoLlED5QM4D4bEGh2
         i4m5IjHCvrtbXwz8q3nIcge/VXf2Cuw5BXa30iYNZ7YJX5iACqFnXV92212YWYqYdKZm
         bmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700925708; x=1701530508;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2AZ5QS8lsSKr7+2Og7p3sgR6ulygpYjEMzIF2clFXcU=;
        b=w/+vb5GVFns745knHoxDtWtxQT+Ss0AQpVNZC56j8u+IcrETTgk7LxSSDLHGAP0U12
         Rdv9EZhxLNmAOM9wPo/bDFMPxz1lPb73qkipDNJXIRNHfGqLN7dxfpObcERus6oYyc21
         ZeMseHysdRuOCBkphHAjh808ltuXkNKyFGGjAS1JfXZKXmxT9CPriBTkIeS2F4vmWz+p
         ObAOfqQYxgcQCHci1B4dDgnAhZcEqc07jBk9TjTyobY7zTQM410vG39EG/nJjZQPiQ9V
         njpTsA9BAvuYTpCQ8gQlZEwF8mGijkw+I/NZ/plllNuex3S5SoKLODugKWtitMAJqR0e
         +rWg==
X-Gm-Message-State: AOJu0YxV36yJ5PxJaT7mH/8tOVRqNzb07KyveJQic8vA4NQkimebSPp/
	yqgDLPdbqgYy1Fg4fM4Mn0HtJg==
X-Google-Smtp-Source: AGHT+IFMAdaxQqT9ebIo8AMbUDdGbXjf9gY9ELoNGejpnuTANaapNNbd1H3P3+WOwDmx2jjOFQDPQA==
X-Received: by 2002:a05:6000:b45:b0:332:ed2c:41d9 with SMTP id dk5-20020a0560000b4500b00332ed2c41d9mr3130717wrb.35.1700925707218;
        Sat, 25 Nov 2023 07:21:47 -0800 (PST)
Received: from [192.168.178.55] ([194.110.145.184])
        by smtp.gmail.com with ESMTPSA id l6-20020a05600c4f0600b0040b3632e993sm8207113wmq.46.2023.11.25.07.21.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Nov 2023 07:21:46 -0800 (PST)
Message-ID: <20acca9c-9055-41f0-83b8-adb80f3f56ed@baylibre.com>
Date: Sat, 25 Nov 2023 15:21:45 +0000
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
In-Reply-To: <84c99b9f-518d-492d-bffb-0f9bd4c633d1@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Nov 2023 15:21:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191234

On 24/11/2023 14:10, Eilís 'pidge' Ní Fhlannagáin wrote:
> On 23/11/2023 14:11, Richard Purdie wrote:
>> On Thu, 2023-11-23 at 13:49 +0000, Eilís 'pidge' Ní Fhlannagáin wrote:
>>> [YOCTO #13419]
>>>
>>> If recipeB creates a user and assigns it to a group created in recipeA,
>>> we need to ensure two things:
>>>
>>> That recipeA is in recipeB's DEPENDS (documentation issue) and that the
>>> sysroot setscene, in the case of a TMPDIR wipeout, is in
>>> USERADDSETSCENEDEPS.
>>>
>>> RP and I discussed adding a USERADD_DEPENDS variable to deal with this,
>>> but there is some magic around DEPENDS that a new variable wouldn't have
>>> so I'm sending this as is for people to poke at.
>>
>> Can you be more specific about this "magic"?
>>
>> I'm still worrying that DEPENDS is too broad, there are many more
>> things in there which we don't want listed as setscene dependencies and
>> I think this needs to be more precise.
>>
>> Cheers,
>>
>> Richard
> 
> The interesting thing here is if we do something like:
> 
> python __anonymous() {
>      setscenedeps = ""
>      if "-native" not in d.getVar("PN") and d.getVar("USERADD_DEPENDS") 
> is not None:
>          for pkg in d.getVar("USERADD_DEPENDS").split():
>              setscenedeps += " %s:do_populate_sysroot_setscene " % pkg
>          d.setVar("USERADDSETSCENEDEPS", "%s %s" % 
> (d.getVar("USERADDSETSCENEDEPS"), setscenedeps))
> }
> 
> we end up throwing:
> 
> ERROR: creategroup2-1.0-r0 do_prepare_recipe_sysroot: The sstate 
> manifest for task 'creategroup1:populate_sysroot' (multilib variant '') 
> could not be found.
> The pkgarchs considered were: qemux86_64, core2-64, x86_64, allarch, 
> none_none-nativesdk.
> But none of these manifests exists:
> 
> /home/pidge/poky/build/tmp/sstate-control/manifest-qemux86_64-creategroup1.populate_sysroot
> 
> /home/pidge/poky/build/tmp/sstate-control/manifest-core2-64-creategroup1.populate_sysroot
> 
> /home/pidge/poky/build/tmp/sstate-control/manifest-x86_64-creategroup1.populate_sysroot
> 
> /home/pidge/poky/build/tmp/sstate-control/manifest-allarch-creategroup1.populate_sysroot
> 
> /home/pidge/poky/build/tmp/sstate-control/manifest-none_none-nativesdk-creategroup1.populate_sysroot
> 
> The weird thing (hence this being an RFC), is that the patch I sent 
> doesn't throw this. At first, I thought it was something happening with 
> a polluted sstate but I don't think so now. I am absolutely unsure as to 
> why that would be, BUT my suspicion is that this error is related to 
> 14961 (which I'm still poking at).
> 

I had a crack at this tonight. Interestingly enough, limiting the code 
"fixes" the issue, eg and allows us to use USERADD_DEPENDS:

if "-native" not in d.getVar("PN") and d.getVar("USERADD_DEPENDS") is 
not None and d.getVar("BB_CURRENTTASK") == "package":

I guess my question is why would it work with DEPENDS but fail with 
USERADD_DEPENDS unless we limited to do_package? (hence the magic I'm 
seeing). I'm still guessing this is something in staging.bbclass that is 
doing something funny.

-- 
Eilís 'pidge' Ní Fhlannagáin
BayLibre - At the Heart of Embedded Linux
www.baylibre.com


