Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EC59C48BC1
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 14:14:15 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.12529.1707833650293363281
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 06:14:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CD5Q//lA;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: uvv.mail@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51186925925so3057527e87.0;
        Tue, 13 Feb 2024 06:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707833648; x=1708438448; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RzXhHih3QOIiq2YzFwVuy9GGmBK1Y+3nzCML3q5KxMw=;
        b=CD5Q//lAhEX09F9ZxVfYHohJrBVQ3yFp6LSTCfkZAaAu/vWuSN/9nzc5V+rNlfe2Rc
         5wnkNDTOTNWsgpX9upI1IowPL4wnCOdFhSx7OjopbU8ArD3hnTi0/rD5LQG6JjcqEWmC
         gvwwO38g9s8HBQQBq/C32ao+Jrs5HWrBB4NguwQAMv6SijaqA5BW2wXTnAKX+1lQe3iT
         3fuRVbfOZ+KqIuYSyyFm4CBl6+X53sG/ufWS43JkttuTP02LW5eTnP2YUDTYkCKhRnVq
         UvHvu58ORH+5MjjDv9ADHE67X2NMmD2KazDhNt4xwrZHBpgqFwt4WdoLks3bZfNsgZKB
         ZP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707833648; x=1708438448;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RzXhHih3QOIiq2YzFwVuy9GGmBK1Y+3nzCML3q5KxMw=;
        b=R436pSLHSIlJtoM1AzrZBiPuK1wnx6If1+Y1KXXxo04HF+FKtshl8F7ZeZPyoDp7DU
         H81fdzdI9X+o2TBQzX/+I/7tLc72CbtuNFG78uUXi2Lqfmwwn3UX9JDdKABw8QOEbOLs
         hQYcEPIlMmyd0d90oEzjF4olR8SrxmQb+S+TvFs97ZZYZHHW8Gt3QSZWqK9EQXT8B/kt
         Hmguhw1Vi7Ghw1cCYrO19wSkwpzvkmDJck+/Ycd434sLhmXeSnpbg804qHeQupPcRRiP
         gzWRuNN8PfaVNKVapSSo3twQxE6YCzeUhm53cN60k3IrTNriZRMrYDKnahQg2em/2YHC
         +BtA==
X-Forwarded-Encrypted: i=1; AJvYcCW+gROWbOf3Yu8fm4mdfCnpRhKlH5zSQg7s24PdIkmLS8kAVzR1mG6zEMWm8yav21/df9UEOW/0oSROsRBGPCbkXUgzhD/44V5BzQh2GI2X2iDRjxZkaZpU
X-Gm-Message-State: AOJu0YzMSTCWIgnT5QcWVPba0SfAR5/LZY/2YpxQVnD6uAnZXX/YW4vd
	/f156FirPTbOOh10cFwt0qWpHapQzAf8L4bfFtrVsNypmW4JKf/u
X-Google-Smtp-Source: AGHT+IFGnsNMsMwrgQVb3iG9lET1Kp/AXyE19wom3tN2J9USJ2HwA/lGjFAHgMo7defpaXMk4f9Nbw==
X-Received: by 2002:a05:6512:ea7:b0:511:8617:276e with SMTP id bi39-20020a0565120ea700b005118617276emr6852335lfb.40.1707833648176;
        Tue, 13 Feb 2024 06:14:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU0oNH71L4uz+uOLIkhK8gUJZI4IzOxapZyL1L2Gm57BpsgP+uWtI8ei0sb/ricnxsiWE4du7GGMaXhbQtRhgKt6V8mcpvPbEAi8TgMEV9AOufH5xSlFqrzJGUYLlKYuTTavm6OgAHQBne6iA==
Received: from [10.139.2.183] ([154.47.27.145])
        by smtp.gmail.com with ESMTPSA id br18-20020a170906d15200b00a38a868bcf7sm1323522ejb.41.2024.02.13.06.14.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 06:14:07 -0800 (PST)
Message-ID: <12d6aaa8-1f7d-4da9-985a-8ebb2a51ebc0@gmail.com>
Date: Tue, 13 Feb 2024 15:14:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] nanbield: grpc_1.56.2 fails nativesdk build
Content-Language: en-US
To: Joakim.Tjernlund@infinera.com,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 "steve@sakoman.com" <steve@sakoman.com>
References: <17B23A54B6BB5F11.15017@lists.openembedded.org>
 <5009ff89147eb81e88005c6b6f76d195bf010edb.camel@infinera.com>
Cc: openembedded-devel@lists.openembedded.org
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <5009ff89147eb81e88005c6b6f76d195bf010edb.camel@infinera.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 14:14:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195403

Joakim,
I answered you last week on the this topic. Quoting it again:

Could this 
https://git.openembedded.org/meta-openembedded/commit/meta-oe/recipes-devtools/protobuf?id=b1deec0de476d8f0a0c6427919f57ee5f681ea0e 
fix your failure?

Note, oe-core is a wrong list for this discussion, I changed the CC 
accordingly.

Slava

On 13.02.2024 15:08, Joakim Tjernlund via lists.openembedded.org wrote:
> On Fri, 2024-02-09 at 15:09 +0000, Joakim Tjernlund via lists.openembedded.org wrote:
>> Whatever I try I always get:
>>>    The imported target "protobuf::protoc" references the file
>>>
>>>       "/home/jocke/yocto-xr/build/infn-xr/gmcu/tmp/work/x86_64-nativesdk-xrsdk-linux/nativesdk-grpc/1.56.2/recipe-sysroot/opt/infn-xr/1.0/sysroots/x86_64-xrsdk-linux/usr/bin/protoc-23.4.0"
>>>
>>>    but this file does not exist.  Possible reasons include:
>>>
>>>    * The file was deleted, renamed, or moved to another location.
>>>
>>>    * An install or uninstall procedure did not complete successfully.
>>>
>>>    * The installation package was faulty and contained
>>>
>>>       "/home/jocke/yocto-xr/build/infn-xr/gmcu/tmp/work/x86_64-nativesdk-xrsdk-linux/nativesdk-grpc/1.56.2/recipe-sysroot/opt/infn-xr/1.0/sysroots/x86_64-xrsdk-linux/usr/lib/cmake/protobuf/protobuf-targets.cmake"
>>>
>>>    but not all the files it references.
>> Looking at failing path:
>> s /home/jocke/yocto-xr/build/infn-xr/gmcu/tmp/work/x86_64-nativesdk-xrsdk-linux/nativesdk-grpc/1.56.2/recipe-sysroot/opt/infn-xr/1.0/sysroots/x86_64-xrsdk-linux/usr/
>> ./  ../  include/  lib/  share/
>>
>> There in no bin dir at all. In lib there are lots of libs, including libprotobuf-c.so
>> To me it feels like bitbake somehow failed to install  required bin/protoc-23.4.0 files
>> but misses the bin files as these are normally not needed when building.
>>
>> or perhaps it is rewriting  the passed path? What is passed to cmake is:
>> "/home/jocke/yocto-xr/build/infn-xr/gmcu/tmp/work/x86_64-nativesdk-xrsdk-linux/nativesdk-grpc/1.56.2/recipe-sysroot-native/usr/bin/protoc"
>>
>> but bitbake somehow rewrite this to:
>>
>> "/home/jocke/yocto-xr/build/infn-xr/gmcu/tmp/work/x86_64-nativesdk-xrsdk-linux/nativesdk-grpc/1.56.2/recipe-sysroot/opt/infn-xr/1.0/sysroots/x86_64-xrsdk-linux/usr/bin/protoc-23.4.0"
>>
>> Notice the change to "recipe-sysroot/opt/infn-xr/1.0/sysroots/x86_64-xrsdk-linux/" in the middle.
>>
>>   Joakim
> FYI, this works around the problem:
> cat ./meta-xr/recipes-devtools/grpc/grpc_%.bbappend
> #Hack the nativesdk-grpc, copy protobuf's protoc* from sysroot to ${SDKPATHNATIVE}
> #For some reason nativesdk-grpc will not find it and build fails otherwise.
> #Unclear what the bug is but suspect upstream bug
>
> do_configure:prepend:class-nativesdk () {
>      MY_PREFIX="${TOPDIR}/tmp/work/x86_64-nativesdk-xrsdk-linux/nativesdk-grpc/${PV}"
>      MY_FROM="/recipe-sysroot-native/usr/bin/"
>      MY_TO="/recipe-sysroot/${SDKPATHNATIVE}/usr/bin/"
>      mkdir -p "${MY_PREFIX}${MY_TO}" # Create missing DEST dir
>      cp -ap "${MY_PREFIX}${MY_FROM}"protoc* "${MY_PREFIX}${MY_TO}"
> }
>
> CCing you Steve should you have missed this report.
>
>   Joakim


