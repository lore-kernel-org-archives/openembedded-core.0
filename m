Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC756CE7D0A
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 10:17:58 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.78110.1727777876226444033
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 03:17:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kBJsg1/s;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42e5e1e6d37so48567135e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 03:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1727777874; x=1728382674; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UY4thAuTh+bImGrwuBeAr318VV7iFRKGqZgU9zgQDbc=;
        b=kBJsg1/sWdzYmFFSmXl/wiAdk0kaNv8EvT8HtokgHlurdvf364fyuj9A6QzK7r9yL+
         pV+2iyErjeYy1lcPi1zOC3I5fMjgcxRaTY1Z+Aaaga6hhsPVMCM84Pb+yPUa3us3Ws6m
         WUY2XdmvUETuzQUq15M3HEmTtEfJ+kHXjcnwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727777874; x=1728382674;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UY4thAuTh+bImGrwuBeAr318VV7iFRKGqZgU9zgQDbc=;
        b=nNMccQopKDKKMLAcayK8b9DKt2Dz1nitZORrEjC868eM8H55gUCSjQOpXcahNenHy1
         cgaa+IQpDN7zxYUm9rKh3ileIsjrFneA2rXZgh+VgDuVgIxVLh+Glziu3/nk7dm+psgN
         pA9dGdLHkFaQoDgSZwNnCyuea2h58Sbafdl+v+EqSDA2bCrcrZniRjVGI2RqoTBxin6U
         wiKhUEQUHyrLer8AUcbsu8JtfDpPRT/42u7jAn6eJ4H7BZvzaLI/m8Hh3LreiaHY4U5P
         KBu/IYvb11UBnbIi8h9hMpVUgsbCxiBj1OSW3Mqys7QmvZuq2EpGr+P7eBYT1QSrp7C+
         zNjw==
X-Gm-Message-State: AOJu0YysSay2OYMGaKjAx7/POSniEgpA93LvTfrG0RGlEPpFBXLHVUsA
	QULXdFjJV5THLMVZmX6wTYmUpco5Zvhbuz2nC5r04Rwb79cXZ5yt1GpOe1DJGSc=
X-Google-Smtp-Source: AGHT+IG9rqFSWIgmJNy438jwJmfE0cfAlirHAbdu/4SeGUxWcaidf3ERaiOmjM/a7+UAtH7b6W/Q7g==
X-Received: by 2002:a05:600c:4e08:b0:42c:bad0:6c1c with SMTP id 5b1f17b1804b1-42f5844b3b4mr120339215e9.18.1727777874491;
        Tue, 01 Oct 2024 03:17:54 -0700 (PDT)
Received: from [192.168.0.22] (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd56e6547sm11532578f8f.58.2024.10.01.03.17.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 03:17:54 -0700 (PDT)
Message-ID: <501cb7d9-1112-4ee6-863a-9d90ae7945fc@smile.fr>
Date: Tue, 1 Oct 2024 12:17:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] reproducibility: continue testing in case of
 build failure
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
References: <20240930091015.21148-1-yoann.congal@smile.fr>
 <CANNYZj8uwvjD3kLRP_YmsriveP_1kjWQpFzwTRfnoQoU8w5rrA@mail.gmail.com>
 <f6f743c9-89ea-4831-a03c-7b88fa403489@smile.fr>
 <CANNYZj8gk8W-dB2SEq+pJN0vxXkOR2KsH0AiLROK5FKxAi43YA@mail.gmail.com>
 <0e31030d839492e72dbbd06506e8d279fa8f0284.camel@linuxfoundation.org>
 <CANNYZj-JaL92BA-6wmZibVMFBTC691OXvw-AsavYddyMERqg+g@mail.gmail.com>
Content-Language: en-US
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <CANNYZj-JaL92BA-6wmZibVMFBTC691OXvw-AsavYddyMERqg+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 10:17:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205156

Le 01/10/2024 à 11:46, Alexander Kanavin a écrit :
> On Tue, 1 Oct 2024 at 11:38, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>>> The problem I'm trying to solve here is the reproducibility of
>>>> meta-openembedded. While oe-core world is always buildable, this
>>>> is, sadly, not the case for meta-openembedded layers. In order to
>>>> move forward with its reproducibility, we need to know the
>>>> reproducibility state of as much packages as possible.
>>>>
>>>> Do you think that goal is worth making the code more complex? Do
>>>> you have a suggestion on how to approach this? Making (and keeping)
>>>> meta-oe build every time is the goal, but history shows that it is
>>>> hard [0].
>>>> [0]: https://autobuilder.yoctoproject.org/typhoon/#/builders/155
>>>
>>> The real problem is that meta-oe isn't built in lockstep with oe-core
>>> changes, and regressions slip in all the time, and are fixed after
>>> the
>>> fact through heroic efforts of Khem and others.
>>>
>>> Maybe the new AB setup will allow including meta-oe builds into a-
>>> full?
>>
>> That pushes the problem to me and the core maintainers as we then have
>> to block until meta-oe is fixed as well with all the tracking and push
>> back on patches that involves. Is that really what we want to do?
> 
> I'm ok with handling a failing build, if v2 is possible and looks more
> maintainable than v1.

I'm working on a v2 with Richard's suggestion about the log file handling.
I have no problem in taking any other suggestion on how to improve maintainability and keep improving this patch.

Thanks!
-- 
Yoann Congal
Smile ECS - Tech Expert

