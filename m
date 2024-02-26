Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6564FC5478C
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 20:49:16 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.4855.1708980550734992711
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Feb 2024 12:49:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=mnLar7Ni;
 spf=pass (domain: baylibre.com, ip: 209.85.222.179, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-787a8cc7d95so294097385a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 12:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708980550; x=1709585350; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ZkKfdl66+pIoP7qANHgEfEYznq/3mLz17DQ/blF0Ps=;
        b=mnLar7Ni+IcgyS5SaxhOHBqHE4T27qBYHsq2R58+7MolHuI5mwL1BFuvO0d/DFwy+p
         KLIp5J9JkbQp+1iXg1ZIaFgzY6bQK5IdLTX4aAlFvEO/7Fk/dprydUL6oLp+PK+4yxIO
         qRRt1h8WvTdTMp6dshJPY1nkIjtRKQGVQr2rhN2VQ7i60yyyTZJuycewY7xE0WeHMGlz
         AbpAo3aPosew3R7KivDbrSDabLmLv5hmcIgMG/XzsduTtxvQ+zFVtePTKhXcE6egbLZy
         rLFtQS8pNDbCG+m75GmWuiByd5pQIfREFoBTQ9woNKKvWsbDUCceVHUyI0moIe6q15jd
         pi7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708980550; x=1709585350;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ZkKfdl66+pIoP7qANHgEfEYznq/3mLz17DQ/blF0Ps=;
        b=aPIwyVJFSygU+eJnO9tfEh+4XMy9Rg5oMtXZz51Nwflm3jE1NDi5Y1+DPOKr3oPiJn
         GWkUiNJPgBUHiux2oyiVeIvc8qMLCzSUDuG19NuTbaWvTRq4NS/xmu9H4BczOgErcwUj
         9YI7qZ2cbEWs4OOeurqxMV9+ZowsJYkyHGAYmVR36TIIx5PlzhiQurNWhP0kS9kmsLSV
         uSQZOHShj4Q2SRvjMLpiCExcSeAB8vR3n8pquWZxymSEMgaDtDaQWbqAZrZ3TwFFI4a+
         Po9DmNhsc/HUojj7hz3cWIgBrMGl4z2s+TRzuO1m5cY8GXevmtl3IZBfKrUPtcgJG/cE
         rCaA==
X-Forwarded-Encrypted: i=1; AJvYcCXjElsvAbbJ41gfLH1jAhhd9KbL4GkIt6RgFJB0RyQIfRZzPfUNIxEzVqwB1/n8c5VpuaGM78KjPMYl+QX1v6jg2zU7lEIeQjwTk4lp9jQAyft4DvkDi5kf
X-Gm-Message-State: AOJu0YxHlvf2Ce4YlBWMybPY092s+aS7oekHh1lHeGhB+54sMaa6Kg5b
	tCR6qjusNpaF20TKugh7ylrIxiiQXvDirIxapCU5Uqrturfn+DGjuSzX+pqDwH4=
X-Google-Smtp-Source: AGHT+IHOvUyeCDX3vE3UJzbAZFDbl8kluAU8LsCOVT5mqV063SeDuE6NzJ07T2cfC+US7powxv1VrQ==
X-Received: by 2002:a05:620a:2442:b0:787:bae4:2473 with SMTP id h2-20020a05620a244200b00787bae42473mr565009qkn.5.1708980549820;
        Mon, 26 Feb 2024 12:49:09 -0800 (PST)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id t3-20020a05620a034300b00787c7c0a078sm2408009qkm.121.2024.02.26.12.49.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 12:49:09 -0800 (PST)
Message-ID: <932ff3db-5c54-4278-a934-69db22e81a23@baylibre.com>
Date: Mon, 26 Feb 2024 15:49:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [AUH] rpm: upgrading to 4.19.1.1 FAILED
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Auto Upgrade Helper <auh@yoctoproject.org>,
 openembedded-core@lists.openembedded.org
References: <0101018dadd3a49b-174678c4-e621-443b-a9ca-ad0a257a6260-000000@us-west-2.amazonses.com>
 <25f1235a-c76c-44a9-95d9-242a3e32b8b4@baylibre.com>
 <CANNYZj91VaNNaOcne=RbPsD+AEUWUQuRnSy0k0LDdsp9-rw9hw@mail.gmail.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CANNYZj91VaNNaOcne=RbPsD+AEUWUQuRnSy0k0LDdsp9-rw9hw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Feb 2024 20:49:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196220


On 2024-02-26 13:55, Alexander Kanavin wrote:
> On Mon, 26 Feb 2024 at 19:27, Trevor Gamblin <tgamblin@baylibre.com> wrote:
>> I've got an upgrade ready for this, but it seems to be introducing a
>> buildpaths QA issue:
>>
>> WARNING: rpm-1_4.19.1.1-r0 do_package_qa: QA Issue: File
>> /usr/lib/cmake/rpm/rpm-targets.cmake in package rpm-dev contains
>> reference to TMPDIR [buildpaths]
>>
>> I've traced it to this part of
>> tmp/work/core2-64-poky-linux/rpm/4.19.1.1/image/usr/lib/cmake/rpm/rpm-targets.cmake,
>> but I'm not sure how to fix it (my CMake-fu is weak):
>>
>> set_target_properties(rpm::librpm PROPERTIES
>>     INTERFACE_INCLUDE_DIRECTORIES
>> "/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux/rpm/4.19.1.1/recipe-sysroot/usr/include"
>>
>>     INTERFACE_LINK_LIBRARIES "rpm::librpmio"
>> )
>>
>>
>> Anyone know how to fix that?
> This sort of thing is usually fixed with sed after the fact in
> do_install:append. Examples everywhere in oe-core, even rpm recipe
> itself.
Thanks, wasn't sure if there might be something more elegant. I've gone 
ahead and done that and submitted a patch.
>
> Alex

