Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84900C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 17:58:18 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.718.1634320697754376930
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Oct 2021 10:58:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UaW4I8dv;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id
 na16-20020a17090b4c1000b0019f5bb661f9so7887237pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Oct 2021 10:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=CPyjCsDJ01qFdxN2UZ9G6wGdSi/TrPvuwp04YkjksuE=;
        b=UaW4I8dvYTVtqLl4JhPOQSbFgfXwBy9cB5rSfSes5Na/kQEhlzIlWYN/Hjrcwo9vjW
         RJ69d8w+NyLSHOoD2iYcJms/UzqSBHs9CROhJwus6LSik84K+5jZfI0+g0HfxpNcoOT2
         44YXRQexqTVF6QE0L/Sg2jfd43Rca1mraRsGSKBKWFMkyR08lP0tSxJRkaK57mOWrJ97
         c7yowrMI/K3G5b+JbKo2botZrkOV10PR1G5FbZxj3b2DOIAZMjUwCl0lcRMS7Ad0BvQI
         PY4K8dELs1pRK+DSGxStmLweECwCOu/G/SBtLeNKB8uRQM38X++MOK0a3W5dRjHU//CY
         0ZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=CPyjCsDJ01qFdxN2UZ9G6wGdSi/TrPvuwp04YkjksuE=;
        b=7bsOlKjml0wnE0sb2a0nRMdrFWQYsW1LvFkRiAtXpqBfSbF919lfXN7KY8TTGfj71j
         M3I3lyIbeTW7t6eZAOnTtNtS4aO8ZLZmlfCQtNJnltnvc0owqMyAsCpolyaidkhCNofW
         DgiHhc3Svzfv6WxMGy83/a2h8hfMO6QqU5uqlw777PAcA/fulB+BzP/Vt/wq/r9wJqRs
         5nV6HwifWhpXJP91i56KFJlGwjE5Is4R6ujillMFcxyOti5X4yte2Lu6b2XWwmqeF+cT
         NjS6VLgTcoTdrVI7S6BmIe2LJCpptBI3R0hsj+b6DPV+yeTQ82YqM9IIOXG8V0Sz0Ixh
         WfJg==
X-Gm-Message-State: AOAM533jXR50sRPNVqK38EAhTefgrhMDhcnG6tQg660xK4ZZZ22wzIXZ
	tMP9NGmlg078IFq12sWo+Yg=
X-Google-Smtp-Source: 
 ABdhPJw0qgD1magH9pa9SVLYhclUd2yNll3XWSRgXf6QeDaqKdyVGBaPX5U/PoNI9huq8uHm/6PoKw==
X-Received: by 2002:a17:90b:4d09:: with SMTP id
 mw9mr15060465pjb.100.1634320697213;
        Fri, 15 Oct 2021 10:58:17 -0700 (PDT)
Received: from ?IPV6:2601:646:9200:a0f0:d1df:f5c7:ddc0:a3a2?
 ([2601:646:9200:a0f0:d1df:f5c7:ddc0:a3a2])
        by smtp.gmail.com with ESMTPSA id
 m73sm5552800pfd.152.2021.10.15.10.58.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Oct 2021 10:58:16 -0700 (PDT)
Message-ID: <b779910c-7447-5f19-b0cf-ae157f0e5af2@gmail.com>
Date: Fri, 15 Oct 2021 10:58:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [OE-core] [RFC PATCH] populate_sdk_base: add support for zstd
 compression (and default to it)
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20211015170630.1069043-1-alex@linutronix.de>
 <5b92ee280a2f08291fa77a303d7b9edc98a61d30.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: 
 <5b92ee280a2f08291fa77a303d7b9edc98a61d30.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Oct 2021 17:58:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157007



On 10/15/21 10:29 AM, Richard Purdie wrote:
> On Fri, 2021-10-15 at 19:06 +0200, Alexander Kanavin wrote:
>> This allows significantly faster do_populate_sdk() (5 min -> 3 min for
>> the sato sdk on my machine) and decompression, at the cost of SDK file
>> taking up more disk space.
> 
> Can you quantify "more"?
> 
> I'd be interested to know if a higher compression helps and what the time/cost
> tradeoff is too. Not sure I'm keep to have it increase in size. This likely
> increases the eSDK size a lot too?

since eSDKs are generate once use many times compression time is not as 
important, decompression time is important, however, they are also 
transmitted via network which means we might lose out the decompression 
gain towards network transfer time. Perhaps it will be good to get a 
wholesome picture.

> 
>> If that's a significant concern, it's possible to increase the zstd
>> compression level or even go back to xz compression.
>>
>> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> ---
>>   meta/classes/populate_sdk_base.bbclass | 10 ++++++++--
>>   meta/files/toolchain-shar-extract.sh   |  9 ++++-----
>>   2 files changed, 12 insertions(+), 7 deletions(-)
>>
>> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
>> index 49e166e697..92a23e2325 100644
>> --- a/meta/classes/populate_sdk_base.bbclass
>> +++ b/meta/classes/populate_sdk_base.bbclass
>> @@ -50,17 +50,23 @@ TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
>>   TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"
>>   
>>   # Default archived SDK's suffix
>> -SDK_ARCHIVE_TYPE ?= "tar.xz"
>> +SDK_ARCHIVE_TYPE ?= "tar.zst"
>>   SDK_XZ_COMPRESSION_LEVEL ?= "-9"
>>   SDK_XZ_OPTIONS ?= "${XZ_DEFAULTS} ${SDK_XZ_COMPRESSION_LEVEL}"
>>   
>> -# To support different sdk type according to SDK_ARCHIVE_TYPE, now support zip and tar.xz
>> +SDK_ZSTD_COMPRESSION_LEVEL ?= ""
>> +SDK_ZSTD_OPTIONS ?= "-T${ZSTD_THREADS} ${SDK_ZSTD_COMPRESSION_LEVEL}"
>> +
>> +# To support different sdk type according to SDK_ARCHIVE_TYPE, now support zip, tar.zst and tar.xz
>>   python () {
>>       if d.getVar('SDK_ARCHIVE_TYPE') == 'zip':
>>          d.setVar('SDK_ARCHIVE_DEPENDS', 'zip-native')
>>          # SDK_ARCHIVE_CMD used to generate archived sdk ${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} from input dir ${SDK_OUTPUT}/${SDKPATH} to output dir ${SDKDEPLOYDIR}
>>          # recommand to cd into input dir first to avoid archive with buildpath
>>          d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; zip -r -y ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE} .')
>> +    elif d.getVar('SDK_ARCHIVE_TYPE') == 'tar.zst':
>> +       d.setVar('SDK_ARCHIVE_DEPENDS', 'zstd-native')
>> +       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; tar ${SDKTAROPTS} -cf - . | zstd ${SDK_ZSTD_OPTIONS} > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}')
>>       else:
>>          d.setVar('SDK_ARCHIVE_DEPENDS', 'xz-native')
>>          d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; tar ${SDKTAROPTS} -cf - . | xz ${SDK_XZ_OPTIONS} > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}')
>> diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
>> index 4386b985bb..4b8892af79 100644
>> --- a/meta/files/toolchain-shar-extract.sh
>> +++ b/meta/files/toolchain-shar-extract.sh
>> @@ -51,11 +51,6 @@ if [ "$INST_ARCH" != "$SDK_ARCH" ]; then
>>   	fi
>>   fi
>>   
>> -if ! xz -V > /dev/null 2>&1; then
>> -	echo "Error: xz is required for installation of this SDK, please install it first"
>> -	exit 1
>> -fi
>> -
>>
>>
> 
> Deleting that is fine for testing but I think the final patch needs to do
> better! ;-)
> 
> Cheers,
> 
> Richard
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157005): https://lists.openembedded.org/g/openembedded-core/message/157005
> Mute This Topic: https://lists.openembedded.org/mt/86353954/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

