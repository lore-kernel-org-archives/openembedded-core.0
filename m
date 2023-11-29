Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DFC0C4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 08:51:12 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.27821.1701247866375541859
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 00:51:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RcoQS549;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: zboszor@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a00f67f120aso876697766b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 00:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701247865; x=1701852665; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aPOaNQDjLVGzlwj7NMLkHW3pwnOd6EGwokNz4AQ/M2g=;
        b=RcoQS549dIC5FN1zPIAw6wu7eq52p9ohFti0O18iE9OMdD3uu4YNd1/DgUgxn9bP44
         Gm8tl6iz9zXsCSCE3XRnxoI8BDX1ABxen+qn2EZGAKTloAUkJ4yN4N1n0JS51bRaked0
         /sHJMPakd77FFR0rbNhxOVuXqKmKHSenO5VYqX8CFqJVz8ME04rmDQz0wAUsm3/lbnpG
         BQAPR23IwGcOLgjMJ3pONmKpUdRwXeSYR/717XqPm1dNnRmnwNqSQuDRV6PQFhBfQ9Cl
         J9sVHUln2C+hU86sqH0mn94X/nDiCLeZfxJYjlqFVKoTW34qJJqneiFts3/YfTZpb7DD
         Qcjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701247865; x=1701852665;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aPOaNQDjLVGzlwj7NMLkHW3pwnOd6EGwokNz4AQ/M2g=;
        b=j5zv+pET/mcsqN1GJM+cAECEVgWvI89VyqF3rxfVcgGwMDtsLcUfGloebTZOUD55Yr
         oHTWV55ZJvt+MqLzVIqxF8JmBHRdL9pqcwVnC199uiAPqNw4btaEC/ZxzhcRXldEU2Dx
         nVNYJ5ZX7FeahKg9XNwYEAgETHj2njL3qJtndoc7SfvMiSyOcuWnkZ5pXawjnAUjnSxh
         bNWHDwagP/qKrsgbsz7GhNYLAtUGz7ztSuBLTvWM4nRMgzo5S26vOTvZK+pjCfmuIWnb
         bX460lPxKta0p5anz3OsBBoO24CLEwgrglWSqD2ZeqTtqyoDeh2kVAO0nxU9Pkk35ovG
         Uhag==
X-Gm-Message-State: AOJu0YyivmJDVf0uZY/ipbeU3LHskOa++e+dPP+lNznlRSnajOTIA0CU
	NyX1e6q1SGIKlTGNykniQu0=
X-Google-Smtp-Source: AGHT+IEvXygIhO8u9j64jfdkeIgoFSO8E4/uzuMzJJxPxrM5c0yGArUWFMf5JuKmeUVrCjbhUVcaPA==
X-Received: by 2002:a17:906:2dc:b0:a12:78b5:3d81 with SMTP id 28-20020a17090602dc00b00a1278b53d81mr3123481ejk.1.1701247864577;
        Wed, 29 Nov 2023 00:51:04 -0800 (PST)
Received: from [192.168.2.2] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id n18-20020a17090625d200b009fe1d575365sm7670613ejb.55.2023.11.29.00.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 00:51:04 -0800 (PST)
Message-ID: <ce32a68f-d5f6-476e-a233-d1d603225752@gmail.com>
Date: Wed, 29 Nov 2023 09:51:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] bitbake-server does not exit after build ends
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Martin Jansa <martin.jansa@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <3cd66d19-6e0c-4b1b-a990-723cd445698f@gmail.com>
 <1be4aa623d61e40f52466e1cc3b65c4543b39b20.camel@linuxfoundation.org>
 <25c15f7d-d1e8-427f-a1ab-6edb854daaa0@gmail.com>
 <CA+chaQdMrEWZkXfyX=cGDt9uD0JodDFK68cedzGVN2fMDRh+Qg@mail.gmail.com>
 <29c6bdd6-72bf-48f6-9a8a-eb15c1225ba1@gmail.com>
 <ab819301dbf2bf4a669dfdbd937b21f0c7ec719c.camel@linuxfoundation.org>
 <d1479bd9-163c-4958-b1e2-6eb066fbe41a@gmail.com>
 <CANNYZj_--bt3Nw96O8QDSb8hyr5-BoSmkmOC0_BMAb-vsL8UJA@mail.gmail.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj_--bt3Nw96O8QDSb8hyr5-BoSmkmOC0_BMAb-vsL8UJA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 08:51:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191433

2023. 11. 28. 15:50 keltezéssel, Alexander Kanavin írta:
> On Tue, 28 Nov 2023 at 11:31, Zoltan Boszormenyi <zboszor@gmail.com> wrote:
>> The warning only occurs if os.fork() is called when
>> there are already Python threads.
>>
>> I guess the general performance uplift in Python 3.12
>> can trigger a pre-existing issue in bitbake more easily.
>>
>> It is entirely possible that the threads bitbake creates do not
>> exist yet with Python 3.11 and earlier at the time of executing
>> os.fork(). ¯\_(ツ)_/¯
> I think you might be too quick to jump to conclusions here.

Indeed.
I should have added "assuming Python is not the buggy party here".
Sorry.

>   I've fixed
> the async issue I've been observing (backporting
> https://github.com/python/cpython/commit/2e5d4e24ebcd671915427b6fd35a5b0eea412c4a
> ), and when running bitbake with 3.12 from buildtools-tarball,
> everything works fine, and I'm not seeing any leftover processes. Poky
> revision is current master:
> https://git.yoctoproject.org/poky/commit/?h=master&id=3e50e45917831d9da2d86e69fb908a1a78483b62

This means that 3.12.1 should fix this problem, and that release
is supposedly "imminent": 3.12.0 was released on 2023-10-02 and
subsequent bugfix releases are scheduled every two months.


