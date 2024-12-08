Return-Path: <oecore.mailinglist@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30486E77173
	for <webhook@archiver.kernel.org>; Sun,  8 Dec 2024 22:53:38 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.88353.1733698411659363587
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Dec 2024 14:53:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZvgAaIvq;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: oecore.mailinglist@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-434f80457a4so2017265e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 14:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733698410; x=1734303210; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YGZK2EpnHnX8V5TK5ven4X7Malb4RkahaEY/t543g+0=;
        b=ZvgAaIvqRcJgC5cD9zTrRu9Ar8ZJ5vvf43acToNuma+Sf43CcKEek4PuMMAnrrZSqN
         P9xCVEfXPrz3OPe9liXuK/D1Y8H0fW/fsDlPUnnwZTHXBWHmW0QrQqfY/DtZEfr4W5RE
         4eePL2tqBgvqNaJcv6k/KH5SEesmJPQeTZvpWfKMI2WXajjCj3pB8ByhFuB14TkF8QUh
         0EzwX32/iBU4Ngt+cBhGJF/lsQ9D/aZ9hT+HzISJ7DNXb/h0W6s02xvV1qaCKfP3t8Z+
         ys0m8FLr6gepNns1GIwqaoIjvAOuzRjTsDGepqQGtm0DdLKnweKXTGaT94YowvFcI0zg
         XXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733698410; x=1734303210;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YGZK2EpnHnX8V5TK5ven4X7Malb4RkahaEY/t543g+0=;
        b=H3Y3p0sN+OWfM0qay1FkEDJVyeehaBU6ihT09ksoz8sdH5OnM5iRuXeaggleeXZrex
         6FjS45UdB3RO6P67+83Q3YtA4qAFEr+aiBeYIV2uXyMFaZlXhoC1kbSPVSkih4dgGYcx
         oRKPyBpXlYiXTucvpP9Xf/6Oi10YMY2v2OCw9rZA2i3XpDkk66xo03ZTgofaUs3R7Z/Y
         +GfhYowyvjTOSGoH+uHPX3Sh5SlW7dH5H1ay41x1xvI4kiUpj7ho81sdRhNjs3yVe6ot
         9QAchuZuWRy0StxnQZW/ehLwmdt9zc5NGVD7USB1tJRbTogQ6EoMXnK2FbCpej36MnZP
         FdLg==
X-Forwarded-Encrypted: i=1; AJvYcCVFiPbAIYTSUdL5QglGfDfmC+ADL/svWK9h/CiRJwoYJAsN+lo4jTe1uvRuWtA3bIqeffGo9u6nvfkDczglOnb2iA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxeBHHLQ00CDp1Kjm9pyOaSAIRJMiql7ZSVQCO+VrCMRO3pzJ7A
	FilKuPj8+I6/A115Cq4fBHj6+/hLwPOFPGMw9cWT5Uqq8qwovuF6
X-Gm-Gg: ASbGnctCbxVkDEZXlQRrbEG0VPSfjOli+vzTyFh3HXZg3EYRumcUVmmgojnP0IiCq83
	sbvgNSkO+k0tNGdHfPH3Efc0CPdK9DdAZ5vgrfILh/dCIFPdBgkjpmOHrXJ9HAo9UyeNY4nw9u8
	+QNmlzQW8L9pfi33RrqLF7Wpl8rYc/XwndbXcFZ7HNSgal8/6fAbgZsQEtWvAtgFk6jgEomtLVu
	6SqNt9ngMMpZFdkPRJ2jpY5wC/uV64kHLyyRBH36Lw0OT9x0hwUgTMPYtyGgM8kfvD/r5h2oL35
	mhHH0XTfcQLdLNU/ZeC4tyiNYLLG0w==
X-Google-Smtp-Source: AGHT+IFXSlTzlQVNFS/iK4Dly9baqXGKHigw2rlZ2JJVwaPp/Xi3aeEY0rs8oYVFSAza78e4emJ5Hw==
X-Received: by 2002:a05:600c:5117:b0:42c:baf1:4c7 with SMTP id 5b1f17b1804b1-434d92682e4mr99140005e9.4.1733698409884;
        Sun, 08 Dec 2024 14:53:29 -0800 (PST)
Received: from [192.168.188.21] (77.118.58.106.wireless.dyn.drei.com. [77.118.58.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da0da551sm133608105e9.21.2024.12.08.14.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 14:53:28 -0800 (PST)
Message-ID: <c3748b5b-cd0b-6a05-1a4f-7afabe8dc5f4@gmail.com>
Date: Sun, 8 Dec 2024 23:53:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [OE-core] [PATCH] go-vendor.bbclass: avoid QA errors with
 absolute paths
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>
References: <20241206173119.12422-1-Robert.Berger@ReliableEmbeddedSystems.com>
 <045483954dfffbe9dc30f4032b0bf78cbbc4d9b8.camel@linuxfoundation.org>
From: Robert Berger <oecore.mailinglist@gmail.com>
In-Reply-To: <045483954dfffbe9dc30f4032b0bf78cbbc4d9b8.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 22:53:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208473

Hi,

On 12/8/24 23:27, Richard Purdie wrote:
> On Fri, 2024-12-06 at 18:31 +0100, Robert Berger via
> lists.openembedded.org wrote:
>> avoid QA errors with absolute paths from go-vendor.bbclass
>>
>> Signed-off-by: Robert Berger
>> <Robert.Berger@ReliableEmbeddedSystems.com>
>> ---
>>   meta/classes/go-vendor.bbclass | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/go-vendor.bbclass b/meta/classes/go-
>> vendor.bbclass
>> index 38ea69ab50..12667b2d60 100644
>> --- a/meta/classes/go-vendor.bbclass
>> +++ b/meta/classes/go-vendor.bbclass
>> @@ -14,7 +14,7 @@
>>   # folder. Additionally a manifest file is generated for the 'vendor'
>> folder
>>   #
>>   
>> -inherit go-mod
>> +inherit go-mod relative_symlinks
>>   
>>   def go_src_uri(repo, version, path=None, subdir=None, \
>>                   vcs='git', replaces=None, pathmajor=None):
>>
> 
> Can you provide a little more information in the commit message such as
> the kind of symlink and whether go-vendor always creates these or what
> the trigger is for the issue? Which tool is creating the symlinks? Was
> this a change in behaviour of the tool? Could the class create relative
> symlinks by default rather than fixing them up?
> 
> That symlinks class is a heavy hammer and I'm surprised this hasn't
> come up before now if it is always needed.

Here is the example:

https://gitlab.com/meta-layers/meta-yocto-training/-/tree/master/recipes-training/golang-helloworld?ref_type=heads

This is the error without my patch:

ERROR: github.com-robertberger-golangexample-1.0+git-r0 
do_populate_sysroot: sstate found an absolute path symlink 
/workdir/build/multi-v7-ml-debug-training-master/tmp/work/armv7at2hf-neon-resy-linux-gnueabi/github.com-robertberger-golangexample/1.0+git/sysroot-destdir/usr/lib/go/src/github.com/robertberger/golangexample/vendor 
pointing at 
/workdir/build/multi-v7-ml-debug-training-master/tmp/work/armv7at2hf-neon-resy-linux-gnueabi/github.com-robertberger-golangexample/1.0+git/git/src/import/vendor. 
Please replace this with a relative link.

I added it also to:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=15683

> 
> Thanks,
> 
> Richard

-- 
Robert Berger
Embedded Software Evangelist

Reliable Embedded Systems
Consulting Training Engineering
URL: https://www.reliableembeddedsystems.com

Schedule a web meeting:
https://calendly.com/reliableembeddedsystems/
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--


