Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F43C5AD49
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 16:21:17 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.25270.1748535669877967778
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 09:21:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FGzCT1YJ;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-400fa6eafa9so735813b6e.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 09:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748535669; x=1749140469; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vjkHK36xvcjOt0ZdlZSnY7P3hIPJD9lcgexE7FicS1U=;
        b=FGzCT1YJjZk7iak1orNxP05spEetdTI5dD92kLp5u1GAsFutConK3f2VEQ4xLV9zh5
         V76Sv6BuPlt5L5lSfaU7jhSID/vgmOi9FUhwzH+0QHXh4B4sUHX+n9u56B7NaxuI8NBo
         Kr4ahitnp2OrnDk3KjQX88vtrDafojpiSXKlaCe9ZGq6zOqg91uR6CNL8ka+erTw6GwI
         OynP9MCzIEvG/k3lWWH8ygkOYCI1NEu6nQe1DOTgeF7sANI7KpiKtWw2RRiIq0PPNUvq
         pVS56wdHAHWqxpIE3ki/rhiDZ00EEH0rpzAFrHvZLS6qWc0cugpO6uINvlU80OiS6lHn
         OiDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748535669; x=1749140469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vjkHK36xvcjOt0ZdlZSnY7P3hIPJD9lcgexE7FicS1U=;
        b=ReRw4QPFvaL69XdUvS4WiKHJMD0p5I/uqgc4jzuqga3nCGeIUtMwE49sIVvpDkNQEZ
         hsSHFxkGhmXy7OBhyvHYJEX6hnJPnmT44DH3xdJbOtWCDRMlH8PThwk+y0wrtk2gyMjb
         r71/nz+W0ADrL36ZIi9gA0L6BMfpsyv1llnpnbN2P/K/4Ega2Np2L4BKynM4+B98rbwy
         4JxllKGKeIA8JKhNR32wP5+fFb/xSgNXwlWxn/buHd/qj+6jU/FDehGknD1689m6eFTr
         CZ75G2SnWUMq2ACSWgjAjVxGVTRWbG3J6i2Pkevyvj2eKN0/PGjlkju6XQHAadFr9Whm
         2eVg==
X-Gm-Message-State: AOJu0Yy8tpcF1Hz1GQGEvR4LbBmSFh4HvyYSUvmoI2H9x1OF9Bf9OE44
	slqTLyehF0ehtNf1TLLty/Zb/9tM6zhM16fGVsFT5ziru+l0+X0B0B66
X-Gm-Gg: ASbGncuuQS3yN7onZm975b7e55CgRwOO2RxEJAmWPgUIZs9UuADQ7x6e/Uq4ndKk008
	6skuns5o93jLrRQnFFF1Pb8jkEhuOfrCKvyMy26Z6eJ20cwxEZ3khLmYhckt8BD+M8osbuz2ZyU
	fBdXLjF0RtJIKKJhzroh+iWczsR3SZLDyFy3YTx1atrEIF9fF0ygQeWE+sOo7Y8oT7n048xmsiD
	f/xXLr5q7lrZrUxI5+vCuL0RK8OzcE+ddXVKqLLYIrAZPc+bvZmVKHJCqZ1qmj92dMTSohWnNjx
	arx2b0SdrTtP9GQ5boehVKzR95FqAxoW8Aw11wCkJNxpoEC9DYgVlAq0vFO15CkDo4o3nvCGoYf
	3nGJ1GniFLkaCOAHGgOHKbzdRt+5PxA/H2U7xr8mFDB62
X-Google-Smtp-Source: AGHT+IG7HNWiWPWdNylpggxB9UGg8hN3ry2azOL6dPWVW2ErBzddz0y/6jj8z/qPqpUsx0aM0fYIDg==
X-Received: by 2002:a05:6808:6c88:b0:403:5277:9424 with SMTP id 5614622812f47-406797ab13amr87947b6e.32.1748535669014;
        Thu, 29 May 2025 09:21:09 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:2986:9b50:188d:1984? ([2601:646:8201:fd20:2986:9b50:188d:1984])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-60c1ebb0104sm44384eaf.39.2025.05.29.09.21.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 09:21:08 -0700 (PDT)
Message-ID: <e1f901c2-aa27-4a28-a22d-64c5884e4a3b@gmail.com>
Date: Thu, 29 May 2025 09:21:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 14/28] bluez: Disable invalid-pp-token
 warning with clang
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
 <20250520-clang-toolchain-v2-14-db97c2eb3756@gmail.com>
 <C6B84781-E495-4A0B-866F-28FB90D7BD3A@arm.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <C6B84781-E495-4A0B-866F-28FB90D7BD3A@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 16:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217417



On 5/29/25 2:28 AM, Ross Burton wrote:
> 
> 
>> On 21 May 2025, at 07:19, Khem Raj via lists.openembedded.org <raj.khem=gmail.com@lists.openembedded.org> wrote:
>>
>> We add FIRMWARE_DIR via CFLAGS using escapes for string and clang
>> option parser flags it
>>
>> <command line>:4:23: warning: missing terminating '"' character [-Winvalid-pp-token]
>>     4 | #define FIRMWARE_DIR \"/usr/lib/firmware\"
>>       |                       ^
>>
>> emitting this warning during configure means some tests fail wrongly. e.g.
>> test for enable -fPIC -DPIC, which results in textrels in libbbluetooth.so
>>
>> This warning can be disabled, the string is correctly passed to sources in
>> the end, so its spurious
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> meta/recipes-connectivity/bluez5/bluez5.inc | 1 +
>> 1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
>> index 7bae968094f2a272c4deff7416dbd1208549e6ce..5835662f7a63a23915ec4af94597ec4a614a4640 100644
>> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
>> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
>> @@ -84,6 +84,7 @@ EXTRA_OECONF = "\
>> "
>>
>> CFLAGS += "-DFIRMWARE_DIR=\\"${nonarch_base_libdir}/firmware\\""
>> +CFLAGS:append:toolchain-clang = " -Wno-invalid-pp-token”
> 
> Wouldn’t it be neater to change the line above to:
> 
> CFLAGS += "-DFIRMWARE_DIR="${nonarch_base_libdir}/firmware”"
> 
> Bitbake’s parser is crazy and stuff like that works.

I have tried several ways to pass it, what you suggest was in fact first 
thing I tried and it passes -DFIRMWARE_DIR="/usr/lib/firmware” as seen 
in bitbake preprocessing output but emits following into an implicit 
header file that compiler sees

#define FIRMWARE_DIR /usr/lib/firmware

which is not right string syntax in C. what we need is

#define FIRMWARE_DIR "/usr/lib/firmware"

on compiler commandline it should look like

-DFIRMWARE_DIR=\"/usr/lib/firmware\"

So how can we teach bitbake to do this ?

> 
> Ross

