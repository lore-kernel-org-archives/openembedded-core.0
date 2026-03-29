Return-Path: <charles-antoine.couret@mind.be>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3991CF3D616
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 17:12:58 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33288.1774804367212269398
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 10:12:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mind.be header.s=google header.b=QbZhTt0l;
 spf=pass (domain: essensium.com, ip: 209.85.128.42, mailfrom: charles-antoine.couret@essensium.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so28223845e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 10:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google; t=1774804365; x=1775409165; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f7B8l5H24FBlDZace+lFq98ynlGKPGBTdl+92GlKYOU=;
        b=QbZhTt0lFs/iew6aJfcHeYHUtErQsj0UW/ImAePG6gTOGo8wjnDPuxuX0YTVofGJu8
         885G1um0OsNaawq27BMFjwbfmGZChkEnF2RLt9W2OGrcrVWwNbmqbikRw7FGawp2KdDF
         WuXUNt3LVLeqNQo85GktYH8rUa8t9dqCk3D7KNsZ1tANf2T1F/t4enBmU0vtYjz/bHAE
         SHJD1/cRUHgzvIUCka5/dOo8yw+YVHNvddHXMzRBmzA8XaLyzB7gOayGM+t0lZKHk9Pu
         TWrKoUWJvue50MXhG6Zbh4WBH81PYCRpX7/3bgo8XTpqy5oPvIFsMwAkNqpONcLESAI2
         4QIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774804365; x=1775409165;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f7B8l5H24FBlDZace+lFq98ynlGKPGBTdl+92GlKYOU=;
        b=jH18JmuEWGyD8Xtz/4iHB6gzcXxLaeo7fxCRa5zQCALk54IZ5ieiCWDfmk6W5S/hwE
         ZD8qwQspQKyvW6sKw+BgBDu/21jB0QzN/sSJjvUBtC5hSbV9ERkf6uSk3T9GaFaORTty
         buAvGtv/I8DFC40Nhn8EpanICwmIFGh0tZ30G8CMu9nnX9WN2PAdLdU4dyFOKg3rZafV
         McAR55F6CLsF0rQdsMkXnwVXmLnaOdo/lzh7CQNgTUsf7/vGLxQ8FsYXtqaPmxbZKXzo
         vmlthbMtCD0MhHrnBip8HhPAVPFHlFX4O6U6ZOgXBz3AVvHrKvVInqWIVTJRhRV9e/xD
         Omsw==
X-Forwarded-Encrypted: i=1; AJvYcCX3oRGcgidAJWMEW4k5V8UrtDF5VcT/wPyFqV50TuHf03VAg/8JReKnxQt4vikHG4up3AYqlaKz1DV+6E1y8GoAZw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxOVEC5PvC3+JgqBxoZaWqioSp80UVlJfw5zekbCn43rEOp4D6l
	eNTFEpd4XGQpJf9PYNi0+a/KAyX/7Q7tlqnAs+YI6GAcMkVjqZ7Mx8Cixe/dTGuC3R4=
X-Gm-Gg: ATEYQzxpldQRngpt2BKgEh8Wuv0p2Hfp6mVbUcZj7te4fL8sjDCj+ur7rbkMLl7stiP
	8IhTSeQd2VJiqT0QeD1I0GJD4IanAn2kPK0FW0QKinU9dSr2qoz7nigl6Tf3NYi3/L4ZL9tguig
	Wv0mZp9RFeSVQuKYHJjk54vd9fSHpVRv+3xkSuExNRuiRCuUG8EWJHhZcQJ6++ec9ns6y+iTazi
	yuK8EjqK7U9vsZAfkD4a519bipU1sPZ45m4FCZMaGUcNG2/RBgCkNgN3IvKn/imtpGlzFcTcUls
	UlWdd9Y0XGtI4D0wSdqMP+HJ1MzKoypbDwXz/YrhkQFNxCPOfbH6wuA/bHkMoZrxHCPk3WI8hZL
	Z84421lflYJjfV4UCRPQ/YfaAG8mqddmvsFnRWRdBhr+Mm7s/GXBykDRy816fPxa9rSwAQGGWmc
	nbt5ckmr6f8IibkYaSyJubzpa1l0W1kJ4kq5uQb3fCyrjFVLyfdBwipQcF/0QklZFiQfN5k+fDp
	6dM79okzg==
X-Received: by 2002:a05:600c:4fc2:b0:485:3e19:9e01 with SMTP id 5b1f17b1804b1-48727ee543amr150111425e9.28.1774804364317;
        Sun, 29 Mar 2026 10:12:44 -0700 (PDT)
Received: from ?IPV6:2a02:578:85c6:1101:1ab9:445:1169:11e3? ([2a02:578:85c6:1101:1ab9:445:1169:11e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48725d9bca0sm61942065e9.2.2026.03.29.10.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 10:12:43 -0700 (PDT)
Message-ID: <8619f67e-d274-4d99-9290-ad36ba61c054@mind.be>
Date: Sun, 29 Mar 2026 19:12:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 0/5 v4] image_types: use IMAGE_FILE_MAXSIZE
 variable to create fixed partition size
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20260329134716.3185469-1-charles-antoine.couret@mind.be>
 <2cae9e645c767894e77f718113f4f4d689f9121e.camel@linuxfoundation.org>
Content-Language: fr-FR, en-US
From: Couret Charles-Antoine <charles-antoine.couret@mind.be>
In-Reply-To: <2cae9e645c767894e77f718113f4f4d689f9121e.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 17:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234153

Le 29/03/26 à 18:15, Richard Purdie a écrit :
> For context, these previous versions were in 2023. I think the general
> concern is we already have a lot of rootfs size related variables and
> adding more of them complicates the user interface. It isn't clear
> which ones "win" when multiple conflicting settings are made.
>
> In this case the max size "wins" above any of the others.

IMHO this makes sense because it's more specific and related to the real 
filesystem size.

But indeed if you want to change the design behind, I'm open to it.

> It does
> appear that it isn't just a max size but a fixed size in that it will
> pad the filesystems to this size? That makes the name a bit
> confusing/misleading and was one of the concerns last time.

In fact I realize that I've not read your previous answer last time, too 
focus on the CI error. Sorry, my mistake. That's why I've not taken this 
into account for my recent changes.

Yes, this variable is doing both (fixed + max size of the filesystem), 
due to how filesystem tools are working. Maybe by having a more 
"intrusive" change, we can improve it.


What I can suggest is:

* IMAGE_ROOTFS_MAXSIZE would be used against filesystem sizes, and not 
against precomputed rootfs sizes as done today, it's likely not really 
relevant to keep current behavior as it. I don't know if we would be 
able to customize the value per filesystem type as done in my proposal 
or if a global setting is good enough.

* if IMAGE_ROOTFS_EXTRA_SPACE is set to 0 and IMAGE_OVERHEAD_FACTOR set 
to 1.0, don't provide size parameter to mkfs to create a dynamic and 
minimal filesystem, to avoid the need to always provide manually extra 
margin just for filesystem overhead

* Then introduce a new variable like IMAGE_ROOTFS_FIXED_SIZE which can 
be provided (if set) to mkfs tool to have a fixed partition size 
whatever are the other settings related to rootfs size. If unset (by 
default), previous logic can be used instead.


I'm not an expert of all filesystems so maybe this suggestion can 
introduce problems. I don't see potential regressions for current users 
as well.

What do you think? Another ideas?


Thank you for your feedback.

Regards,

-- 

Charles-Antoine Couret

Embedded Software Developer

+32 488 27 56 40
Website <https://mind.be> • LinkedIn 
<https://www.linkedin.com/company/mind_essensium/> • Newsletter 
<http://eepurl.com/h-gy7v>

<https://mind.be> logo

