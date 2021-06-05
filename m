Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web09.11818.1622897973239917149
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Jun 2021 05:59:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NPTJDXSS;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: fntoth@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id t3so14324500edc.7
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Jun 2021 05:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=DpTN609Jhnh7s2/EmAweqwZqv3pTaMt1sYyNaktnJ9I=;
        b=NPTJDXSS7dU/Dd9GxwOthB/tMjzO5hejbTEYhW00yy+mc0Y8H6BMXzW+uyV1vCl3hJ
         lFdqm6kq7fOr/mhdwdv0V/ML9WUmVoVyEcMxsb+UmOtwV3K4PHiS3jYVq8IZWnaUtOvs
         ASuT04L+orimehX2esVcxEJlTgv7OYQKzOJyUmZktTaIJwc8TlGI8CGmF2FTaEAQpqMb
         cL0TaYxJtKoI6Oh6xkWgbVtTGWpiI1bztfqz3oNg4LvdKydEZREv3hQsxoLgSN5ivt6U
         6AchWm3zTlXZaDPLkUd1LyaA3Zks9pSxc7uLKw18HJMIHUZCQiiM/iyVVvDjuoGvr7/Z
         3szA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=DpTN609Jhnh7s2/EmAweqwZqv3pTaMt1sYyNaktnJ9I=;
        b=HtqfrnEubLZSKi7kAGXNiyU1ADXqPRL41FtS3Z9UnG01DIvrxqWS8e+dwKh4mLsqvT
         OedfQqgxF+FPLoIX0W3PsqRgWRZVZV60JqGeX78lb3B1pn82dIJv21+qpgANMu+Al8uU
         TdHSVPvnunhjaQJH+SQYHd3FTj1l72yeGq1DxkHj838BDfOeVNHutv3daq2bxenC1U9L
         NgyBDfphinR5KIkbwZKwvR4lSeTi5Hv364oGaaDaKGw1jr+i20m764lRARjfI7MOSGfa
         /0oWSPlRfJHH7edDYCjuFaqGZDp0E91qP1lDtsjptz1S24eHkJ4s4ZfLQzyHN9fNmIZ5
         UM1w==
X-Gm-Message-State: AOAM532Y3l5RUyYXlnZZrF2qbdReJlOsMPpsfX0YusNtcaPnbuykW+F1
	e3e+ss90kTok3AjE1/HrduB73aJGlwU=
X-Google-Smtp-Source: ABdhPJwkuQQ7abqH+XzSQ2EmKe7MC0hULQuNBhGrmYGRzKS8F2bOTkkyCMGjR3ZTMjGbm49FuInFbQ==
X-Received: by 2002:aa7:dc4f:: with SMTP id g15mr9973184edu.277.1622897971340;
        Sat, 05 Jun 2021 05:59:31 -0700 (PDT)
Return-Path: <fntoth@gmail.com>
Received: from ?IPv6:2001:981:6fec:1:da53:d2ce:d38b:5c09? ([2001:981:6fec:1:da53:d2ce:d38b:5c09])
        by smtp.gmail.com with ESMTPSA id k4sm4850667edr.64.2021.06.05.05.59.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jun 2021 05:59:31 -0700 (PDT)
Subject: Re: [OE-core] [RFC PATCH 1/1] image-live.bbclass: order do_bootimg after do_rootfs
To: Guillaume Champagne <champagne.guillaume.c@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20210526183250.27433-1-champagne.guillaume.c@gmail.com>
 <20210526183250.27433-2-champagne.guillaume.c@gmail.com>
 <16848E63E6244007.7311@lists.openembedded.org>
From: "Ferry Toth" <fntoth@gmail.com>
Message-ID: <cf28ab15-7ef4-6acc-51c6-a5be02cf2d7b@gmail.com>
Date: Sat, 5 Jun 2021 14:59:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <16848E63E6244007.7311@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi,

Op 01-06-2021 om 22:12 schreef Ferry Toth via lists.openembedded.org:
> Hi
>
> Op 26-05-2021 om 20:32 schreef Guillaume Champagne:
>> do_bootimg expects IMGDEPLOYDIR to exist, since it stores its artifacts
>> there. Therefore, do_bootimg should run after do_rootfs because
>> IMGDEPLOYDIR is created before do_rootfs runs since IMGDEPLOYDIR is
>> contained in do_rootfs' [cleandirs] varflag.
>>
>> When do_bootimg depends on ${PN}:do_image_${LIVE_ROOTFS_TYPE},
>> do_bootimg is correctly ordered after do_rootfs because
>> do_image_${FSTYPE} tasks are added after do_image and do_image itself is
>> added after do_rootfs.
>>
>> However, when do_bootimg doesn't depend on
>> ${PN}:do_image_${LIVE_ROOTFS_TYPE}
>> (introduced by: 96f47c39f1d17f073243913d524bde84add41d8f), do_bootimg
>> can run before do_rootfs, thus before IMGDEPLOYDIR is created. To
>> avoid this situation, do_bootimg is now explicitly ordered after
>> do_rootfs.
>>
>> Signed-off-by: Guillaume Champagne <champagne.guillaume.c@gmail.com>
>> ---
>> meta/classes/image-live.bbclass | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/image-live.bbclass 
>> b/meta/classes/image-live.bbclass
>> index 8b08305cdb..fd876ed8e1 100644
>> --- a/meta/classes/image-live.bbclass
>> +++ b/meta/classes/image-live.bbclass
>> @@ -261,4 +261,4 @@ python do_bootimg() {
>> do_bootimg[subimages] = "hddimg iso"
>> do_bootimg[imgsuffix] = "."
>> -addtask bootimg before do_image_complete
>> +addtask bootimg before do_image_complete after do_rootfs
>
> I can not answer your question if this is the right way to go. But 
> I'll try this patch next weekend and return here with the results.
>
Tested-by: Ferry Toth <fntoth@gmail.com>

I tested this with meta-intel-edison layer from 
https://github.com/edison-fw/meta-intel-edison on Gatesgarth and confirm 
this patch resolves the problem.

I'm looking forward to this being applied to all Yocto versions that 
broke due to "image-live.bbclass: optional depends when ROOTFS empty".

Thanks, Guillaume!

>
>
>
> 
>
