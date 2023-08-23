Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49093EE4993
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 16:21:29 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.1024.1692807681755802125
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 09:21:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=hOE61syc;
 spf=pass (domain: baylibre.com, ip: 209.85.160.179, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-403e7472b28so36210571cf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 09:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1692807681; x=1693412481;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A3Hw7f2N/GrcXjUKHu/V5tvl8dIsUWXgFpnK3BM7Ysg=;
        b=hOE61sycnnE/eYUXhxo4/dOp4Lt8IF9/3Rxmi5uL9TF+iqpmokkAReQfMa8mWf6nJJ
         b2aNJqAyw3tOIjSoqQe/jEVlSak3kdalp8bOai31TsQCF17s1I6SPBJDglV5nCqQSqly
         5X+mZxesEzBDCt8wCAr+HfbyuzumY7yqlP3j1xIiGlxhA1VPxztyqDk11vEaTgeQNpjk
         1knqyQbgdDUBVnDq9bTb3zih9slVvrUDZi1G5BEWqsayieQ/ALg2F/YhETOFjXNSClkl
         GbwuvzB/kej/Ozc5DrqyIOemO4OjPH5+EM7awxNzkU7qMF+usmTygz5bvTQDoEEtGGMP
         263w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692807681; x=1693412481;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A3Hw7f2N/GrcXjUKHu/V5tvl8dIsUWXgFpnK3BM7Ysg=;
        b=MdA0FhT9EHTPydEp1kLGTARRt/v/U0MMx5oMuP76syjhAXuUTib/nwXmDdmkuFYhdy
         LR8pyqfo965Aaue2hUW2vgCiZSqn8XLAwhU7xw4i03hvMNGBZt0kdVCQDsL3dNa71Q5l
         PjGKE3/FwV0rglQ2Hka2RTdMJ3ikR0OYwH3/CtTUUqhrbMZPgZLwyiKn39VBjspPfP9b
         grFSmNeZV7Tc2zR+Nf+HZ+LhcXij8Dz4BXZzMvjzI9gdPOzeisbYFMsXt9SQ2fEMsNYd
         QOPg3yf/yVZTdnU3IdIVKfElwgXHi71oL6jp7KuKQjdTHolwgg5HrP21YAagl0KCosuW
         xigw==
X-Gm-Message-State: AOJu0Yw8dSroxh7v5+Lk5/NI29vh6tXeUbBZcxzafAtkucsCdrNpUVUJ
	ZFPciOv3wJgzm32646n2Upm9iA==
X-Google-Smtp-Source: AGHT+IHS0fS81bz59Y9QGLqiOF+EnHAIdSKF132FZznTUjfp9UowNnSjm2QNSuAPb+sTdwTFYcX1Ng==
X-Received: by 2002:a05:622a:8f:b0:410:ca1:62b2 with SMTP id o15-20020a05622a008f00b004100ca162b2mr18166321qtw.60.1692807680814;
        Wed, 23 Aug 2023 09:21:20 -0700 (PDT)
Received: from ?IPV6:2001:1970:5b1f:ab00:71eb:b8e9:8589:9ca5? ([2001:1970:5b1f:ab00:71eb:b8e9:8589:9ca5])
        by smtp.gmail.com with ESMTPSA id g8-20020ac87748000000b0040324785e4csm3753697qtu.13.2023.08.23.09.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Aug 2023 09:21:20 -0700 (PDT)
Message-ID: <5abb87b1-9e7a-dbe5-8581-57b95c310919@baylibre.com>
Date: Wed, 23 Aug 2023 12:21:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core][PATCH 0/2] Upgrading Cython to 3.0.0
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: "Luca Ceresoli via lists.openembedded.org"
 <luca.ceresoli=bootlin.com@lists.openembedded.org>,
 openembedded-core@lists.openembedded.org, tim.orling@konsulko.com
References: <20230821173840.1337747-1-tgamblin@baylibre.com>
 <177DF2562B5153F0.28529@lists.openembedded.org>
 <20230823092739.56667920@booty>
 <CAMKF1soe84F0n4_YDKojGRZkfCbGw=8WS=bXJ9wxO14Z4TFa0w@mail.gmail.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CAMKF1soe84F0n4_YDKojGRZkfCbGw=8WS=bXJ9wxO14Z4TFa0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 16:21:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186619


On 2023-08-23 12:08, Khem Raj wrote:
> On Wed, Aug 23, 2023 at 12:27 AM Luca Ceresoli
> <luca.ceresoli@bootlin.com> wrote:
>> On Wed, 23 Aug 2023 09:24:42 +0200
>> "Luca Ceresoli via lists.openembedded.org"
>> <luca.ceresoli=bootlin.com@lists.openembedded.org> wrote:
>>
>>> Hello Trevor,
>>>
>>> On Mon, 21 Aug 2023 13:38:38 -0400
>>> "Trevor Gamblin" <tgamblin@baylibre.com> wrote:
>>>
>>>> The Cython 3.0.0 release contains many changes. Since there are a large
>>>> number of recipes that depend on it, there will potentially be build
>>>> issues with recipes in meta-python and elsewhere. I performed a world
>>>> build on poky alone with the python3-cython upgrade and the only recipe
>>>> to fail was python3-pyyaml, so that has been tweaked to work (via two
>>>> new patches for the recipe; thanks to Tim Orling for the heads-up).
>>> This series makes python3-cython non-reproducible:
>>>
>>> AssertionError: The following deb packages are different and not in exclusion list:
>>> /home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/deploy/deb/./core2-64/python3-cython-src_3.0.0-r0_amd64.deb
>>> The following ipk packages are different and not in exclusion list:
>>> /home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/python3-cython-src_3.0.0-r0_core2-64.ipk
>>> The following rpm packages are different and not in exclusion list:
>>> /home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/deploy/rpm/./core2_64/python3-cython-src-3.0.0-r0.core2_64.rpm
>>>
>>>
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/3400/steps/12/logs/stdio
>> And just noticed this is also introducing some warnings:
>>
>> WARNING: python3-cython-3.0.0-r0 do_package_qa: QA Issue: File /usr/src/debug/python3-cython/3.0.0-r0/Cython/Utils.c in package python3-cython-src contains reference to TMPDIR
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/7657/steps/14/logs/stdio
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/7657/steps/11/logs/stdio
> there are few meta-python recipes which need attention as well.
>
> https://errors.yoctoproject.org/Errors/Build/170232/

Hi,

Sorry about that - I had mentioned it to Richard in IRC but not 
communicated the decision here. I've looked at the meta-python problems 
but it looks like a few of those issues are going to stay around for a 
while, so I'll wait on getting the python3-cython upgrade and changes to 
python3-pyyaml merged into oe-core. Once the recipes that require cython 
are all patched up for 3.0.0, I'll resend these.

Thanks for doing the testing - I didn't notice the QA issue, so when I 
revisit it I'll try and fix that too.

Trevor

>
>> Luca
>>
>> --
>> Luca Ceresoli, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com

