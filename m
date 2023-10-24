Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B71C00A8F
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 07:12:57 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.12501.1698131569331804539
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Oct 2023 00:12:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MBTHV6uO;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: uvv.mail@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9ba1eb73c27so649053066b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 00:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698131568; x=1698736368; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=okLqVAdYQoWr+BymbZvip7t3Zt4cDN9ufYyadN2n7lY=;
        b=MBTHV6uOH7nSEGfdlcqOpDbnYQzSgljur6Hv6gmnq6MqJyzm6WkCbCOx+BFAOI5SFc
         Chsr4EVDuTZrtzFhZoYTyuLn3q9CI6v0c+/97VYQdAawkqLCqFL37v59RVhl1RsMneNY
         iYobYsZJjcNvNbeWsZNlBbHGhMAmysF5OwBkSS1SYrv/MPl1uzXw12KlBuFtz+oq5D5y
         vZEIkmEVj9cq+FDhzV9lBxWZBpJ/GmqKrsg7GhDxZimB8ZHuR9esphs/edMxaQT0yeix
         YdLA+DXkt2XC905l8xHoi+PACXT97oQR1N+hgq+Y+u1e8FFgYdoR3a3HyzKWa2qwD8xd
         qDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698131568; x=1698736368;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=okLqVAdYQoWr+BymbZvip7t3Zt4cDN9ufYyadN2n7lY=;
        b=BNk3P6+d1VuxlDIO+Bs9Jact72y9KBo+0s4BD0K2tMW8XCKF8BWK4sbu3DJWMv67vt
         pqiuadq7d9TzceKFpj9eraMpG1DDmsK/g1eE0X9/5wmCIbeguk39HRE4O1p+zZEPV1RL
         LS6EeiagseIkqVWmKhd4LcLbQer5vZ2fYkDTHI9Q4ZoNfxhPeZ7DrfZ85T1/XRC2ptBN
         Di7b1lz0GVa7zH0G9mFslQmedWdtxXUqnP2rjux90Ryl5WWQYeoX5WALjPFfWu1qd2NV
         5ickCD20lZALfcaiim6hix1uITXsT5aBpnuQp77D0WVtEiVKNkqIfQsW1YxOMKAFDcAc
         0X9A==
X-Gm-Message-State: AOJu0YzAO7sOQ86JhvKWJIIQsYlXvXPER29w2G1E/ZeuXVnT/EJwvgLR
	Ww8l7BXj+gQF85t/EazzTlU=
X-Google-Smtp-Source: AGHT+IFsVqAkdsE+Nc0BdxPac3GN5JnQb9wCbeSs+mGRCDesndDeV5/bsqw+e7qTq2ypxbg00m0/pg==
X-Received: by 2002:a17:907:9403:b0:9bd:a5a3:3328 with SMTP id dk3-20020a170907940300b009bda5a33328mr9731096ejc.13.1698131567315;
        Tue, 24 Oct 2023 00:12:47 -0700 (PDT)
Received: from [10.134.49.234] ([89.249.73.141])
        by smtp.gmail.com with ESMTPSA id q1-20020a1709060e4100b009b64987e1absm7738828eji.139.2023.10.24.00.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 00:12:46 -0700 (PDT)
Message-ID: <cc468049-a90b-44a7-9fb5-3592f6846109@gmail.com>
Date: Tue, 24 Oct 2023 09:12:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-Core][PATCH v2 0/4] recipetool: Add handler to create go
 recipes
Content-Language: en-US
To: Lukas Funke <lukas.funke-oss@weidmueller.com>,
 openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Martin Jansa <martin.jansa@gmail.com>,
 Lukas Funke <lukas.funke@weidmueller.com>
References: <20231017132647.352938-1-lukas.funke-oss@weidmueller.com>
 <a9389814-affd-4bce-85b9-e3a4555a684e@gmail.com>
 <3ab8f8ee-ce9d-48c1-b802-177f4bec9e3c@weidmueller.com>
 <1762baab-06d2-4fc4-9cd0-307b76f0d79e@gmail.com>
 <f71c3205-330f-452a-94ce-d6994f7d8bed@weidmueller.com>
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <f71c3205-330f-452a-94ce-d6994f7d8bed@weidmueller.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 07:12:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189638

Hey Lukas

On 24.10.2023 08:33, Lukas Funke wrote:
>>
>> - I placed the correct URL into SRC_URI, but do_go_vendor still 
>> failed with following stacktrace:
>>
>> File: 
>> '/home/uvv/projects/yocto-lorch-mapro/openembedded-core/meta/classes/go-vendor.bbclass', 
>> lineno: 86, function: do_go_vendor
>>       0082:        # path = github.com/foo/bar
>>       0083:        # version = v1.2.3
>>       0084:
>>       0085:        p = destsuffix[len(default_destsuffix)+1:]
>>   *** 0086:        path, version = p.split('@')
>>       0087:
>>       0088:        subdir = fetcher.ud[url].parm.get('go_subdir')
>>       0089:        subdir = "" if not subdir else subdir
>>       0090:
>> Exception: ValueError: not enough values to unpack (expected 2, got 1)
>>
>> The reason is that my go.mod name does not have a version component. 
>> If I understood the convention https://go.dev/ref/mod#introduction, 
>> it's not a required component, so this should be taken into account.
>
> This error could happen if your dependencies don't have a version. 
> I've never seen this in my experiments. Maybe check your go.mod file 
> for the missing version info. 

I debugged it a bit and see that the error is actually caused by my URL 
modification. The URL that works for me looks like
SRC_URI = git://git@${GO_IMPORT}.git;...

The parsing expects the version after "@", which is not right anymore.

Slava

