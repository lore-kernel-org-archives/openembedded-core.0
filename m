Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B828FC47DD9
	for <webhook@archiver.kernel.org>; Sun, 25 Feb 2024 18:32:42 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.2925.1708885958111247949
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 10:32:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=CJrTcxl2;
 spf=pass (domain: mvista.com, ip: 209.85.215.181, mailfrom: jpuhlman@mvista.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5d42e7ab8a9so1501176a12.3
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 10:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1708885957; x=1709490757; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3y3u+DCq/VlYUegvMSeHYAYmV0cDUVAovOQUr4CICc8=;
        b=CJrTcxl20Pd7AnGmrHtSuDXu9m8hujGK7VD8zBl+9EkNTzvhFmpm69/A0U6sRpX9vb
         sJ5WTo7eE2xEMfsBaK3WpAcORUej3zg5sOj1kIlzRCMwf+m3K38RYFh4Tq4qcHC0HFxU
         uWCVq4cJqCvWkaDce1C2tswO2FnI/MyDxSK+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708885957; x=1709490757;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3y3u+DCq/VlYUegvMSeHYAYmV0cDUVAovOQUr4CICc8=;
        b=RaHvpiVcekSsZyck7acVw96gUcH33ja4LU7YwLVI+sc28VjP5blssA7/dhsOOXNgTk
         p9tpQH0qQA9n9xg1ynGEFJvSu1+gbhJ7zuu0kf/GmMnVagw82lj+twuPbMvn0Etk/fbM
         ZDneYU9dkssRF0WtFTrXONhLC5x+3gCXtdRhccmxcAtlpp3e3csaoBo7bdI38AiKbFRk
         PiPrm9CwqlVV1LvlJh/676PD0/nS94OE/VX4KSp3y0ulUuXFAp9RXzISZvX7iX/JrV84
         8SELOGjy763ltmADaELggYUjejNgz5JXGCIaaCJAeA8jQzmAjl4+vUGbRZTc1YPrmXWG
         OptQ==
X-Forwarded-Encrypted: i=1; AJvYcCV10Z8SRl/DSbGG7wSkYbGSPwJYKsStse8wLNURzQtXcLqc8FiHFWJqsn0GhGLuBzaoxCsAxKUVRHjKNfLaTJr1YC8hExdonMlmgVcBEOqkwpTC9XnNoKlA
X-Gm-Message-State: AOJu0YxRDP798ShktGbCgtpqWwebwKtrRoZCsDO18p4yUW458zKL/1dv
	q3ykhurbXtykz0Pik7TKLLCVA00T9OJDyMdJndExOVBMVtZZFidnp3NC++DqAzw=
X-Google-Smtp-Source: AGHT+IE/DfZnWdu7Cww3ERlBSe4ibzB9eVlLvNDTt669fxXkGVVn4+UHBnrdg2IKliaTGUfRbOjwdA==
X-Received: by 2002:a05:6a21:8ccc:b0:1a0:7877:900f with SMTP id ta12-20020a056a218ccc00b001a07877900fmr4345731pzb.51.1708885957191;
        Sun, 25 Feb 2024 10:32:37 -0800 (PST)
Received: from [192.168.1.9] (99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id c9-20020a056a00008900b006e08da9c29csm2586752pfj.54.2024.02.25.10.32.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Feb 2024 10:32:36 -0800 (PST)
Message-ID: <6613bed9-5643-45cd-b0f3-89eb9f22700b@mvista.com>
Date: Sun, 25 Feb 2024 10:32:36 -0800
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
In-Reply-To: <8e02178a-106e-498c-92a0-c0fc760cff0f@mvista.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 18:32:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196144



On 2/25/2024 9:22 AM, Jeremy Puhlman wrote:
>
>
> On 2/24/2024 2:13 PM, Richard Purdie wrote:
>> On Fri, 2024-02-23 at 12:33 -0800, Jeremy Puhlman via
>> lists.openembedded.org wrote:
>>> It says usr//usr in the comment, but when I ran on a clean build it
>>> started complaining about opt//opt as well. Its not really clear why
>>> it is looking for those directories, and I am sure this is not likely
>>> the correct solution, but I wanted to get it out here so someone who
>>> has kicked this area of code might know what may be happening.
>> Unfortunately there are layers of different pieces which could be the
>> issue, such as pseudo in combination with the host distro libraries and
>> uninative.
>>
>> Can you create a test case which reproduces the issue?
> Yeah, I was going to try to get to it, but time got away from me. 
> Hopefully I should
> be able to get some time later today.

Trying to reduce the recipe to bare bones, I narrowed it down the the 
DIRFILES setting.
Deep in the top level class configuration for the layer, it sets 
DIRFILES="1", which looks
wrong given the code. OTOH, nothing else in any of the layers we are 
using sets the value
to anything, so what ever recent changes that were made there are 
untested by anything.

Turning that off should resolve my issue, but it looks like that code 
path may be vestigial at
this point.

>
>>   Does it always
>> happen with this recipe?
> Yes. Originally it was happening in our distro setup, minimizing it to 
> just poky and the
> meta-oe/meta-python, it happens with the recipe with the default 
> distro as well.
>
>>   Does it happen on different host distros?
> I have not tried that, so far it was just rocky 8.
>
>>   Are
>> you using uninative?
> Yes. It happens with the default poky distro, too.
>
>> What about buildtools-tarball?
> We always use buildtools-extended-tarball, to isolate as much as 
> possible from the host.
>
>>
>> Cheers,
>>
>> Richard
>

-- 
Jeremy Puhlman
jpuhlman@mvista.com


