Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web12.1129.1588832400388768711
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 23:20:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y4OW0le0;
 spf=pass (domain: gmail.com, ip: 209.85.167.65, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f65.google.com with SMTP id b26so3453089lfa.5
        for <openembedded-core@lists.openembedded.org>; Wed, 06 May 2020 23:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=Sc6LL4SCVfyMTKIz1Uz9Mijg0tejl/ggtHiF9jAfK58=;
        b=Y4OW0le0KeeTb9/tV8+FVwD74eVWyI9c4G+N07HDuYS2iwqVaqOjow/F5Xv6G0ujR7
         YydoS+5uhTdimCxjWv0RjVEfnib574b1Yh3P9pvRi1zRGevCRtjCJy08aZdiZSlXG+Ym
         lCOb7bXcer+egBFMluVP7z3vWT9mAVSzI1n330CG299FzostMMBy7y591Geu7JHpfaYm
         uZGBFkcJzDe3kSnlyOdE3yDcu/V0mUDTJMI0DMcT5+OjwFRFUh/l2yGaykpEx1ZT8AFM
         c0wbC6NSOcbgrEQHcQUC/7zjh8P3h3mRpbFtI8gAG2opaz5Ek9E9VOeTo0Md+rntk7QT
         0S1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Sc6LL4SCVfyMTKIz1Uz9Mijg0tejl/ggtHiF9jAfK58=;
        b=TMgkHqAU+CPsOCVdFBvSxJqY0Szi7Y5YiBSDhHmwCw8JJ18Yfets7QIUV7QuCSz/hs
         GU8TWGNH+RBT6RfZLiI8QBrLUhhzPPIubgE1bPAGEmmMOdVCkUwTwhbevHyOmttgCYFC
         j33TMvBWF+fNpUAdhN5SAiWZKjtBP0Yom7gO2MPaBa6ydtHsC0hhE0ZIEuAaE1haB+jl
         /CIi3ZPJ+QJpzbdkDb+1iDkCCWIdrCuLavAF8yFNu7786mGvT2N5ZQbagmqVYuR8ci3u
         G1DHLG0O9Sl2HOk6z7zVrhRv/3IPAKuR1jpkjXhzpGn9azpNB9f2wWdWYMPsfLR73CSL
         5Rzw==
X-Gm-Message-State: AGi0PuZxf+yCvY7hwVuEQXJ+5QzXvN4ScyvWMgYA8xdrkpwS6UAcHT2X
	dq9Sm0fYx/OM7iVWLGtrl9iCix0UBUA=
X-Google-Smtp-Source: APiQypKv+rGtucXq45kydTN+D9MyxgGXaW0FBvofB15OC+dmTkRQoDOSeZFODWbgLFPH2quTBr/j9A==
X-Received: by 2002:a05:6512:3136:: with SMTP id p22mr7622368lfd.159.1588832398137;
        Wed, 06 May 2020 23:19:58 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id s11sm3184624lfo.86.2020.05.06.23.19.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2020 23:19:57 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] iproute2.inc: clean .o before do_configure
To: Changqing Li <changqing.li@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <1588817159-434433-1-git-send-email-changqing.li@windriver.com>
 <015c4b93-6ca1-0668-0c1d-2a3150c65a38@gmail.com>
 <f27cfb11-458a-510f-c696-eee661e4c109@windriver.com>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Message-ID: <21a173ab-7496-d134-21a6-a49fe4fd46c5@gmail.com>
Date: Thu, 7 May 2020 08:19:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f27cfb11-458a-510f-c696-eee661e4c109@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 5/7/20 8:10 AM, Changqing Li wrote:
> On 5/7/20 1:56 PM, Jacob Kroon wrote:
>> On 5/7/20 4:05 AM, Changqing Li wrote:
>>> From: Changqing Li <changqing.li@windriver.com>
>>>
>>> Reproduce steps:
>>> 1. add 'DISTRO_FEATURES_append = ' usrmerge'' in local.conf
>>> 2. bitbake iproute2
>>> 3. remove 'DISTRO_FEATURES_append = ' usrmerge'' from local.conf
>>> 4. bitbake iproute2
>>>
>>> In step4, since CLEANBROKEN is set, files generated in step2 is not
>>> cleaned and rebuilded. Check after step4:
>>>
>>> file /sbin/ip.iproute2
>>> /sbin/ip.iproute2: ELF 64-bit LSB pie executable, x86-64, version 1
>>> (SYSV), dynamically linked, interpreter /usr/lib64/ld-linux-x86-64.so.2,
>>>
>>> interpreter path is wrong, it should be /lib64/ld-linux-x86-64.so.2
>>>
>>> This will make run ip.iproute2 report error:
>>> -sh: /sbin/ip.iproute2: No such file or directory
>>>
>>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>> ---
>>>   meta/recipes-connectivity/iproute2/iproute2.inc | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>
>> Isn't this a general problem, and not specific to just iproute2 ?
> 
> For  those recipe ${B} != ${S} ,  ${B} will be cleaned,  will not have 
> this problem.
> 
> and by default, CLEANBROKEN is not set,  make clean will be executed.
> 
> but for this specific recipe,  both condition not matched.
> 
> 

btrfs-tools inherits autotools-brokensep and sets CLEANBROKEN = "1", 
will it also require a similar fix ?
