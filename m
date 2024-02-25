Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC262C47DD9
	for <webhook@archiver.kernel.org>; Sun, 25 Feb 2024 18:34:12 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.2961.1708886051607929022
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 10:34:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=LTJMSoUd;
 spf=pass (domain: mvista.com, ip: 209.85.210.42, mailfrom: jpuhlman@mvista.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6e4957ff05cso438655a34.2
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 10:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1708886051; x=1709490851; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yE5aMmoQ1OVU1tTzvuqjP6t9jiNLWRYLZEgvSYhHdCc=;
        b=LTJMSoUdRXF2w0xXB/CZM04WIhZqACU89yzfFWduRrVL2nSxpho0vKZ03ljAbcSch/
         nhtozYnaWcM3R1uycsYg4kF+br1p14329UwhZR3G2lR3d2S9Hm/EuNU+BkRUX0qhgBic
         UE585db3ODvFP/F+IRSAqrb8MDHRgJ4RDEvaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708886051; x=1709490851;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yE5aMmoQ1OVU1tTzvuqjP6t9jiNLWRYLZEgvSYhHdCc=;
        b=det3pVB470nSiTnkXRLz/CpxrcI/wSc/tOrCFbG/GjbzrcafyqelqWO+oOPT3m8li9
         4i4/JoTfiJGXjF3dFmmsNgws9CIhKCi/Gg/jzP0ZYQMnBwm4noXAkg9HVLD7C4MXxsFo
         169rOJHHSUqZFpgdbpvlYwvrHnU92Q0QH76R+gOkGMJhHsk2jPmjH3M0T28xF80KKgUI
         MKG8AEfxHJt+rp6fbpI3PNOaMJJ1Adj0ODnfIOQo6CioNkzHFe6EhFFtFYxqW4bdhpHK
         /Vt3OMKoxLdb3WaTcTHeI6pgy+LMXZ7eW6If0twozQCGLcbwQsPDETpQ6QP+1NC14Alc
         6fVA==
X-Forwarded-Encrypted: i=1; AJvYcCX9cMwEp7apuBLG+TnGyMI8ejXzSEUmHjtk5vCeaBg4V4jYEidUMNlLcYWOZ6YEMYBlnpU4Q7NUpQaU4CTXmw9epyVYoOPL63fIYFP8sB3i2fYLG5CVBXg0
X-Gm-Message-State: AOJu0YxUbiUavCVvwEWvC2jyuZeH0edPExrrxnrmNyXaWhvzLNVF09W5
	ULHRGjwW8S7yzIBtrgA3vdULpKQcdp3MfdMkBcwcm0ES+N0TakHQMlG5OeBaz1Q=
X-Google-Smtp-Source: AGHT+IF2rd0tqoBbaCYgzmIG5niqd11iMHkUUCPD/DDGAFmorz1jc7rDqAlUVq9Ft6UCj17a+nhotw==
X-Received: by 2002:a05:6358:5695:b0:17b:426d:74f3 with SMTP id o21-20020a056358569500b0017b426d74f3mr7690860rwf.29.1708886050600;
        Sun, 25 Feb 2024 10:34:10 -0800 (PST)
Received: from [192.168.1.9] (99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id c9-20020a056a00008900b006e08da9c29csm2586752pfj.54.2024.02.25.10.34.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Feb 2024 10:34:09 -0800 (PST)
Message-ID: <0a042b9f-425b-443a-981b-1574e9efaf2b@mvista.com>
Date: Sun, 25 Feb 2024 10:34:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] package_rpm: Fix backtrace on missing
 directory.
Content-Language: en-US
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <17B69806B1DEE2BA.25421@lists.openembedded.org>
 <ba284035-ee83-42d0-be21-a6f31532f9cb@mvista.com>
 <f3b16ac13c9a4cdbc7409296267446c23332d56f.camel@linuxfoundation.org>
 <8e02178a-106e-498c-92a0-c0fc760cff0f@mvista.com>
 <6613bed9-5643-45cd-b0f3-89eb9f22700b@mvista.com>
In-Reply-To: <6613bed9-5643-45cd-b0f3-89eb9f22700b@mvista.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 18:34:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196145



On 2/25/2024 10:32 AM, Jeremy Puhlman wrote:
>
>
> On 2/25/2024 9:22 AM, Jeremy Puhlman wrote:
>>
>>
>> On 2/24/2024 2:13 PM, Richard Purdie wrote:
>>> On Fri, 2024-02-23 at 12:33 -0800, Jeremy Puhlman via
>>> lists.openembedded.org wrote:
>>>> It says usr//usr in the comment, but when I ran on a clean build it
>>>> started complaining about opt//opt as well. Its not really clear why
>>>> it is looking for those directories, and I am sure this is not likely
>>>> the correct solution, but I wanted to get it out here so someone who
>>>> has kicked this area of code might know what may be happening.
>>> Unfortunately there are layers of different pieces which could be the
>>> issue, such as pseudo in combination with the host distro libraries and
>>> uninative.
>>>
>>> Can you create a test case which reproduces the issue?
>> Yeah, I was going to try to get to it, but time got away from me. 
>> Hopefully I should
>> be able to get some time later today.
>
> Trying to reduce the recipe to bare bones, I narrowed it down the the 
> DIRFILES setting.
> Deep in the top level class configuration for the layer, it sets 
> DIRFILES="1", which looks
> wrong given the code. OTOH, nothing else in any of the layers we are 
> using sets the value
> to anything, so what ever recent changes that were made there are 
> untested by anything.
>
> Turning that off should resolve my issue, but it looks like that code 
> path may be vestigial at
> this point.
>
As an aside, adding:
DIRFILES = "${bindir}"
To something like the bash recipe, reproduces the behavior.

>>
>>>   Does it always
>>> happen with this recipe?
>> Yes. Originally it was happening in our distro setup, minimizing it 
>> to just poky and the
>> meta-oe/meta-python, it happens with the recipe with the default 
>> distro as well.
>>
>>>   Does it happen on different host distros?
>> I have not tried that, so far it was just rocky 8.
>>
>>>   Are
>>> you using uninative?
>> Yes. It happens with the default poky distro, too.
>>
>>> What about buildtools-tarball?
>> We always use buildtools-extended-tarball, to isolate as much as 
>> possible from the host.
>>
>>>
>>> Cheers,
>>>
>>> Richard
>>
>

-- 
Jeremy Puhlman
jpuhlman@mvista.com


