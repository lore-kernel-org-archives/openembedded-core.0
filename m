Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F35AFC28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 10:47:57 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.4323.1742467666432526583
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 03:47:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sz9EK+Xs;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so2664985e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 03:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742467665; x=1743072465; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vp0ogNz+jPoI7PI9M8au9oIYYrKM11hBglxmeK/MMaI=;
        b=Sz9EK+Xs77soRB/Iak0zoaWcaN97vjF1LOlplou0W6yoCO4WUQHr/3I8xus83GX0Qn
         iMrLPH+B4f58Bkhebz+CnPSn6CKYOgS5+InxAvNsUwBckFe0xeTOBNcJxyjM9dwUCPjy
         g9lP6sZDG1C3xwrjKwvmzQPdwStti2nKEllcrWUj8061vTIOZHF7svoAWRe8HdTzmq0R
         s3nKayiZpfAD0cuho3o+LFPsmMltc//RiSicVP7uw/1LKYcUGN3kyNOqUED0oqH1hQXW
         beR1bTAtk2FV0OoDFgrGzi2G93HRnuxwk3X/fUoAn3ni4Rt39c1esjdQ7VocHsybROe8
         Wqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742467665; x=1743072465;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vp0ogNz+jPoI7PI9M8au9oIYYrKM11hBglxmeK/MMaI=;
        b=k9NU9LnyZHyOfY2bQVUwqcovfOHqU6ZSffFOwuBtINkzbr0OVUG9yO/b2ZtgJ3oIz9
         gv3p0ylIErHDvvUrxQuDmt4i9X8dfjn3Dmu8ZHGkUQqXsAXikcNyXxxT41DmI+0ozX3f
         8J35X/ZG4BIqASU+oNwgWnRIk6ha9abEmaMKkF3yIqaDZXjJgXOnJZuVq0eo3RfK2XuT
         wrWQ+u4BbeMgFirQsYxyZ58b7cO6lnX1JUJnP9zuH3OgANY6RbyucLoseE2VLm3/Wlin
         /bkwuTNXJzhO2PQHdwDQoPXaCgzNfzG/RlXxbmoIQfIhWqNcnlO0vPjKmSRoar2w8qAU
         YBGg==
X-Forwarded-Encrypted: i=1; AJvYcCUL2RDVlusthXPeT2E5hisQdkO05QCA3ok2FWi++1TpCRsZqfrVWyPaZ4oXgjB+FaaokG2/MCzTxqBg1D99Fmmjxg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxRlQz3wW9K+1a/L9hR1TbA6SMgFB2Eeu4aL+7veWTdagBPSK1S
	EMFl+/INDRnC1MCvFy+qAe6n/8rumSgkrvK0fw+OfT6m6WEYQ1yi
X-Gm-Gg: ASbGnctY/ovFDKKRi6L4oCSRDSprTedn+nXFTx3PCh/FKcl9H71mY8SmOH5GvMvRJrz
	9dhgMYMHJek8HnP6f+DFhCZZpfRKgc4tNO2E/aAxjvYOz9zi5RSDxMU0d9gZ0cS74MR+WEMSVN/
	FsL185/HUivbOMP9ROutcJhRRKQOjFtTHrXViAUI5vaqS7m3PXZNm4fr75aIZJuvp9xqKEq4Nia
	kUf3urEZoPeuB+INHcVb+p/4DJULkIDLKEPDERmWHcBnMelH40ldNldTtcZczy798V2j3eduXEc
	yuI7L3fmP086P38ORGdc3ral5ax4Zs1jhPszpND7Bs2ZdfQdHkwlEAeE
X-Google-Smtp-Source: AGHT+IGKSaRhwy+hKS0Uuj54H0+/FobTZyz3FN/zhhHsJnXpP7WdGGdSHR3aoAqvrIqTNNaCew3C0Q==
X-Received: by 2002:a05:600c:154a:b0:43d:649:4e50 with SMTP id 5b1f17b1804b1-43d437a19c6mr55001865e9.13.1742467664323;
        Thu, 20 Mar 2025 03:47:44 -0700 (PDT)
Received: from [10.54.23.202] ([154.47.27.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f556a4sm44785115e9.22.2025.03.20.03.47.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 03:47:43 -0700 (PDT)
Message-ID: <39fc99b4-15cd-464d-a7cb-caf3cd907697@gmail.com>
Date: Thu, 20 Mar 2025 11:47:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/4] systemd-systemctl-native: correctly set PV
To: zboszor@gmail.com, alex.kanavin@gmail.com,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20250311100500.355914-1-alex.kanavin@gmail.com>
 <82e68825-b7ad-4236-a898-3fc97fa57bd4@gmail.com>
Content-Language: en-US
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
In-Reply-To: <82e68825-b7ad-4236-a898-3fc97fa57bd4@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 10:47:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213380

Any reason you want to build native systemd?

Slava

On 13.03.2025 15:29, Zoltan Boszormenyi via lists.openembedded.org wrote:
> I don't know who else has run into this, but having
>
>     DISTRO_FEATURES_NATIVE="systemd"
>
> produces circular dependency between
> systemd-systemctl-native and util-linux-native. FWIW, I do not know 
> why I had it, but I did since 2020. With that setting removed, the 
> build can start.
>
> The build warns about other obsolete settings,
> can this be added to the set of warnings somehow?
>
> 2025. 03. 11. 11:04 keltezéssel, Alexander Kanavin via 
> lists.openembedded.org írta:
>> From: Alexander Kanavin <alex@linutronix.de>
>>
>> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>> ---
>>   ...temd-systemctl-native.bb => systemd-systemctl-native_257.3.bb} | 0
>>   1 file changed, 0 insertions(+), 0 deletions(-)
>>   rename meta/recipes-core/systemd/{systemd-systemctl-native.bb => 
>> systemd-systemctl-native_257.3.bb} (100%)
>>
>> diff --git a/meta/recipes-core/systemd/systemd-systemctl-native.bb 
>> b/meta/recipes-core/systemd/systemd-systemctl-native_257.3.bb
>> similarity index 100%
>> rename from meta/recipes-core/systemd/systemd-systemctl-native.bb
>> rename to meta/recipes-core/systemd/systemd-systemctl-native_257.3.bb


