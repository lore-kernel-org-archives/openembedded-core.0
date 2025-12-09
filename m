Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDEADD3B7EA
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 14:22:52 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8752.1765290162179377187
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 06:22:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GbXQrbxF;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47755de027eso39698675e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 06:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765290160; x=1765894960; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6ZUdeCwTsXa6j7lXMKfp6kCBvQkGtUNIn2qbzLbKOog=;
        b=GbXQrbxFh+AaXrbUOcVbAtTUXJnG2s+A405Vn01bViKg1K7/NpsF0ZzdoRMC8GG+ym
         vIE7iXoduingCSuNVwNKNpfUJaV/UnNhxx12yBbxj/AFPvga5jxwOvO0BotGlDYGRpav
         md7y2zZBhDoBkvlVpY6dNMZUo8vz1U3C43WzJUwAlMLaOQlOQmLyRr4oeeQez4NCA+B7
         i8UP8Y0dUhxkT8r83DWhnSYJDZ/wSODByTW2rTAyFm5laea2UNgmAY/pMqVvwH5Yqyg+
         H7sIoB6D4gdyGkL9VWaQyQ//h6djgUzTlyk2Rvah92JP/4CCG9uCX/BhSpN7PSIZLWpG
         rkyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765290160; x=1765894960;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ZUdeCwTsXa6j7lXMKfp6kCBvQkGtUNIn2qbzLbKOog=;
        b=ph/S4/LrO70rEq/qG5Yrm0kdNwD+hustUStTRKiUsHFM4TJyju7TbcBnbys0U8maKO
         1Q4QGRL/Yp+UpZkbC7aj7CfM3DkRg8rU8+8KTvIyK/WQLS7afqDwxT6BlAhCZvoNfjWv
         OcKrS8EbznpGnSJa2sYH6fAciLuqpbOLbGsr50zM6eW+AwK9267exfeTX44KwxKRXg+4
         0DPdFyIDS/sWAau67axvRkCMXcjvuyjGGnhlaqoOvE8BFVQIRQdrL3Yzvnyh7IqMIbM6
         NB0jZOoU+2iUxDaiEaOqgddo0A9Xpg33KWstmOCIWdmjk5ipa4mpAnRUNJyTmlmwJZrh
         oUkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSBqfxEA7wQgO6jKA63u/6VBAOYs1mhHOm6CCEqZCE05HYf64AsfBPFdR+0dQX3qrCmmT0Gymwhx8EYDZfoSesKQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwoPVakxmk/5Ru4ZGFAkfUnJu/OouXxQHZPGd/XJs9Z1IX/ddkY
	ywzSvziqWMirvlmoPCIhxDkXv/YLaZ/+8iM2fJmmGa8rVlCGsPCrQZXXErJwXg==
X-Gm-Gg: ASbGncutlA5iHAQJp2vJTO1FOMc9sv1l7CS5niL2KYUS0/J/OTqBjcCRUUHOHsf+O4C
	xSTOeo6EhccpzzdBX0No+Hl3iqsRNBhBvBy31/zhJPAys/vcCV3gfxS3Pr/F97TP2zGpRQFtWGj
	TqnITZotlWHwbDPdOunHkCzLlyr+iCu/fbSoJ+6emMsQUje0d890sxVOFSoSodlYLTY1o9wHDZt
	XvgUqYPg5C8mY6lwdL4Lk+aHmFSzQmDV3jUI52xYAml1qxLELSsvQm3X9fNvUQgakHS4BlN3e4S
	FKOqcIOdT27ixLdr1Pogo31MMdKIMYXGijU2ag82fkqexckU21pppyliuVfR7mujD6ntbKARHzS
	d9BgOYnMtjgX3p6TXkWXxKPZZyEddZmWtkmZY3AGvqJ2RMmMCjoqtiBHBUS6Kp3XYKGed42TeDg
	yTycQMoSt8IoPB1G1jQwI=
X-Google-Smtp-Source: AGHT+IEv7eacj8yZ8ytO5HxSRlO+240cFKOT492QLDVIIs/0sM5h4oCVLYXhLy1ozZcQ8NsGuMys5w==
X-Received: by 2002:a05:600c:c4ac:b0:475:e09c:960e with SMTP id 5b1f17b1804b1-47939e48f56mr104041055e9.32.1765290160196;
        Tue, 09 Dec 2025 06:22:40 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d353f8bsm32303897f8f.43.2025.12.09.06.22.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 06:22:39 -0800 (PST)
Message-ID: <e0819c20-eb5a-4af6-af5b-321f1021ce59@gmail.com>
Date: Tue, 9 Dec 2025 15:22:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gyorgy Sarvari <skandigraun@gmail.com>
Subject: Re: [OE-core] [PATCH] gcc.bbclass: set -fcanon-prefix-map for
 class-target only
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Mingli Yu <mingli.yu@windriver.com>
References: <20251202075844.3270075-1-skandigraun@gmail.com>
 <96bf25fde10bb6d163ab8c268d5994fd862def21.camel@linuxfoundation.org>
Content-Language: en-US
In-Reply-To: <96bf25fde10bb6d163ab8c268d5994fd862def21.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 14:22:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227440

On 12/9/25 13:11, Richard Purdie wrote:
> On Tue, 2025-12-02 at 08:58 +0100, Gyorgy Sarvari via lists.openembedded.org wrote:
>> -fcanon-prefix-map is not supported by all host gcc version that is supported
>> by the Yocto project, which causes build failures when building recipes
>> for the host machine.
>>
>> This flag was supposed to be set for class-target anyway when gcc is the toolchain,
>> but even when a native target is compiled with gcc, both gcc and gcc-native classes
>> are loaded, and gcc.bbclass overwrites the DEBUG_PREFIX_MAP_EXTRA value.
>>
>> To avoid this, set this variable for only for class-target, explicitly.
>>
>> Reported-by: Mingli Yu <mingli.yu@windriver.com>
>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> ---
>>  meta/classes/toolchain/gcc.bbclass | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/toolchain/gcc.bbclass b/meta/classes/toolchain/gcc.bbclass
>> index 0ed49ba892..5ec98bf7c5 100644
>> --- a/meta/classes/toolchain/gcc.bbclass
>> +++ b/meta/classes/toolchain/gcc.bbclass
>> @@ -30,6 +30,6 @@ PREFERRED_PROVIDER_virtual/nativesdk-cross-cc:class-cross-canadian = "gcc-crosss
>>  PREFERRED_PROVIDER_virtual/nativesdk-cross-c++:class-cross-canadian = "gcc-crosssdk-${SDK_SYS}"
>>  PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs:class-cross-canadian = "nativesdk-gcc-runtime"
>>  
>> -DEBUG_PREFIX_MAP_EXTRA = "-fcanon-prefix-map"
>> +DEBUG_PREFIX_MAP_EXTRA:class-target = "-fcanon-prefix-map"
>>  
>>  TCOVERRIDE = "toolchain-gcc"
> Why are DEBUG_PREFIX_MAP being passed to the host gcc?
>
> We only use it in target flags or nativesdk flags, both of which would
> use our cross compiler, not the host gcc. If it is being passed to the
> host gcc, that is a bug and should be fixed.
>
> I appreciate there are some rust bugs in this area but those need to
> get fixed, we don't want a global workaround we could then never get
> rid of.

Hmmm... looking a bit more into the original issue, I think you are
right, and this patch should be indeed dropped.
This change was triggered by a (not rust related) build issue reported
for a meta-oe recipe, but taking a second look into that recipe, it
passes the DEBUG_PREFIX_MAP directly to the compiler when building for
class-native, which is most likely triggering the issue in the first place.

Sorry for the noise.

> Cheers,
>
> Richard


