Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3863CFA74C
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 08:31:04 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7523.1763713856652605898
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Nov 2025 00:30:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ve2gwiq0;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso10521075e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 00:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763713855; x=1764318655; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E8sLwJiH+Pad0urHLqTlY/XpgREBcRdrVLUuajWsV+8=;
        b=Ve2gwiq0tb1bvOz+EXOs13eizhpoXVF/O1wOdEObR5Ftx7tdVEMSA687M4tyuPfLTn
         F/nNcdr7CSLXMLT+rGZnvAlEaUnyVbjmZ6yn0GJNLWtnlGQxqF9vnS2sGvZtn6hKiq61
         R1SDXRX0M1+SCYVVzDzdxfroryvjT4Z82WmFVNpCczeQNovaaeu6BEFWWt++RSG0y9XH
         B63hy9mq2BYzCz+3oIu8QVq/wit8GfnuMn7dZDzG8q7357JZKzbeZkAEfpQ8SKNVcQTn
         1WVJ2E0s5hTIKBaFzsiWb85HrpHa9uhLWuUbJaydHy9csMVonq9dZ9h7kBlnN/fCcis4
         Lm9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763713855; x=1764318655;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E8sLwJiH+Pad0urHLqTlY/XpgREBcRdrVLUuajWsV+8=;
        b=ewvHuMePTh9Wg80/YhtDSE5hgup1IO6DpEoT9kiWosxwAa184jzFzI4QIAOSRvzXqM
         BRnFftiSO3EGbJr5yw4kwIo5GfZh3k6Go3rchmzmplD94zO+d+WbL/QETh9sdVnDl3G7
         Hpk3Xezhxi3f4ggitIWFhR5al1xz1iZB3X0TKprEWiW3hdnEb5OStUQt14Em9wcKo/wn
         wf8hJGKIyrus/51P2SPYWxbWW2ssBofV5bezVzoehulP+h8v+diLmGSsEG+hp0134/qd
         YdVI4uey+VN9eucQduUv94Rl4wE1+usoSslzn5rBd5hoUxkbnwGYTbR8zHnGNpBr8lvM
         YQuw==
X-Forwarded-Encrypted: i=1; AJvYcCX5z9d+gfoUaCP4YcnzWmJoAwTXgJ0EGbUEt5uPi4BthJ7y+t4wQR3uoMNF1ppXfh6IgDviysLb+zTX+TKe+5NxYQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzTE0xphZm8Cwm1+ePIJstmNKIO1zkJVk3NAsHycBlhh9YfRpSo
	HjxJF0Ghz1kXDW11n0vy+HI1xD0VDe1Ps/tM14hGir91cO2BEPUQmwrsfOcg9D33
X-Gm-Gg: ASbGncsFSbgvLGqGdDL0S86MDNXRqp+LXyRenW4EbVbq7l7s3jQa4EPtOiEI09Y7TXd
	P0M5+XHEW3kDRIqrRjGjIeHcB0kA+SZirftWmtuBwOTxxtWlZ6b51YbbBFtj4H4IXIhoUTgeTbR
	Xiwtk1uZYD5DlEAAIcNG+V0HaB9uuo76K4pbUKDXUzmPIm14CVMzBP4Aafo/mObXJ5Ia5RO+KGk
	iAGaVUJS5sXzXc5wUwTr+JvVaZe1wQqHN1HGjjL/tynX3VKrO2qdl/X8lYzpZAnZ+ShrRFnOJZL
	91VPAGDXA/whb5tUt8mvjDOP/2RY+0JKO+8qRGcJK+8rHpfVmx6q9Q2N4Lzy/XT+HemvHPj4Yy0
	8f8MI3JatEWLeFkBVmOILAGswc1E+RSn+V6O3kHnGUrZJUxKgozPQ+L4Wep+l2O0m0K2jFKpMyD
	xP1H5EnNVexGKYU0++VFs=
X-Google-Smtp-Source: AGHT+IGhagod9hvI8EreC4Z7syfap4/deRAdqVkYdJijZv31ht8ufdIcizidOYAwt874uUw31a8xBA==
X-Received: by 2002:a05:600c:470a:b0:45d:dc85:c009 with SMTP id 5b1f17b1804b1-477c10d49b5mr10313095e9.10.1763713854476;
        Fri, 21 Nov 2025 00:30:54 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34ffesm10549281f8f.10.2025.11.21.00.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Nov 2025 00:30:53 -0800 (PST)
Message-ID: <4fbb33b0-1238-40db-8a16-c9ffc767e417@gmail.com>
Date: Fri, 21 Nov 2025 09:30:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] bitbake.conf, gcc toolchain: add
 -fcanon-prefix-map to map-prefixes
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20251120121947.3473848-1-skandigraun@gmail.com>
 <20251120121947.3473848-2-skandigraun@gmail.com>
 <62b3ba44522521b8f0f54a88e90e9805755f379b.camel@linuxfoundation.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <62b3ba44522521b8f0f54a88e90e9805755f379b.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 08:31:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226652

Please try the v2 of the cc-rs patch - I see that v1 got into
master-next, but it will fail selftests.


On 11/20/25 23:48, Richard Purdie wrote:
> On Thu, 2025-11-20 at 13:19 +0100, Gyorgy Sarvari via lists.openembedded.org wrote:
>> This patch adds -fcanon-prefix-map to the list of compile file-prefixes
>> list in case at least gcc 13 is used (it's a gcc-only flag).
>>
>> This flag used to be part of this list in the past, but was removed with [1].
>>
>> Since then the source file paths are not canonicalized, which makes
>> the system to miss some (and sometimes all) source files to include
>> in the corresponding -src packages. As an example sqlite3 and audiofile
>> (from meta-oe) produces empty src packages, mostly due to the pathes:
>> they frequently use relative paths that don't match up with the
>> absolute path specified in the file-preifx map:
>> `pwd`/../../foo.cpp and ${S}/foo.cpp might refer to the same file, but
>> the first one won't match the prefix-map, so it is omitted.
>>
>> This patch adds this option again with gcc: for class-target it is uses
>> always, and for class-native it is used when the host gcc is at least
>> version 13.
>>
>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> ---
>>  meta/classes/toolchain/gcc-native.bbclass | 3 +++
>>  meta/classes/toolchain/gcc.bbclass        | 2 ++
>>  meta/conf/bitbake.conf                    | 2 +-
>>  3 files changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/toolchain/gcc-native.bbclass b/meta/classes/toolchain/gcc-native.bbclass
>> index a708bd0389..8708ad0211 100644
>> --- a/meta/classes/toolchain/gcc-native.bbclass
>> +++ b/meta/classes/toolchain/gcc-native.bbclass
>> @@ -13,3 +13,6 @@ BUILD_OBJDUMP = "${BUILD_PREFIX}objdump"
>>  BUILD_NM = "${BUILD_PREFIX}nm"
>>  BUILD_READELF = "${BUILD_PREFIX}readelf"
>>  
>> +# gcc started to support -fcanon-prefix-map from version 13
>> +DEBUG_PREFIX_MAP_EXTRA:class-native = \
>> +    "${@'-fcanon-prefix-map' if bb.utils.vercmp_string_op(oe.utils.get_host_gcc_version(d), '13.0.0', '>=') else ''}"
>> diff --git a/meta/classes/toolchain/gcc.bbclass b/meta/classes/toolchain/gcc.bbclass
>> index a5adb5ca37..0ed49ba892 100644
>> --- a/meta/classes/toolchain/gcc.bbclass
>> +++ b/meta/classes/toolchain/gcc.bbclass
>> @@ -30,4 +30,6 @@ PREFERRED_PROVIDER_virtual/nativesdk-cross-cc:class-cross-canadian = "gcc-crosss
>>  PREFERRED_PROVIDER_virtual/nativesdk-cross-c++:class-cross-canadian = "gcc-crosssdk-${SDK_SYS}"
>>  PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs:class-cross-canadian = "nativesdk-gcc-runtime"
>>  
>> +DEBUG_PREFIX_MAP_EXTRA = "-fcanon-prefix-map"
>> +
>>  TCOVERRIDE = "toolchain-gcc"
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 5406e542db..600d4baffb 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -650,7 +650,7 @@ EXTRA_OEMAKE:prepend:task-install = "${PARALLEL_MAKEINST} "
>>  ##################################################################
>>  TARGET_DBGSRC_DIR ?= "/usr/src/debug/${PN}/${PV}"
>>  # Beware: applied last to first
>> -DEBUG_PREFIX_MAP ?= "\
>> +DEBUG_PREFIX_MAP ?= "${DEBUG_PREFIX_MAP_EXTRA} \
>>   -ffile-prefix-map=${S}=${TARGET_DBGSRC_DIR} \
>>   -ffile-prefix-map=${B}=${TARGET_DBGSRC_DIR} \
>>   -ffile-prefix-map=${STAGING_DIR_HOST}= \
>>
> I think we should do something like this patch but just with only the
> target pieces, not the native ones.
>
> The gcc version check is a slow function call since it execs a command
> and we really don't want a call like that dropped inside a variable.
>
> native components don't have -src packages so I'm not sure we need that
> element of this. The simplest thing would be to drop that piece.
>
> This issue was identified as a release blocker so I'll probably hack
> the patch and put something into master-next for testing overnight.
>
> Cheers,
>
> Richard


