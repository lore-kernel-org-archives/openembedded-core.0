Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D52CCD19A
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 11:29:30 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.12989.1760700561607275177
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 04:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JQalETQA;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-63bfbbbdd0bso3565183a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 04:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760700560; x=1761305360; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u1KrIqGEttHNEsA1RJtnnBdMqykOpOwR+DPyRJZ7OIM=;
        b=JQalETQAAFd9C6ABP6XLDg+lq6IwlFfIvF7PE+4zMR8JF00X8jST02yYVO0NnJfofh
         WRPdgMzpWbT2zpeimeTZJDxOSJ9tjk16eHYqObPXUGBSHaC0tuqs1Uj5bKP/CEeNLXfp
         zxMmsg0lUtvjueTu5akdr70OJTzU4uciYOteSssXxu4+5tdQuLweRoFkDqxtQx4C56pZ
         r+pxIxBLWUZ2pJbboqJP5dEmuWGuA17RFKfy01/j08djPq8VwcIEwMuboiI6yKmK3nzM
         T+WVKXj+UZI0N4JICgmrl7LwTH3oyaeqqC9U1ghl++kHZqTZvzauOexuhuWRLUHBbp3U
         oHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760700560; x=1761305360;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u1KrIqGEttHNEsA1RJtnnBdMqykOpOwR+DPyRJZ7OIM=;
        b=SmW0wz4Z8Ho7W11MRvQC0lsALn5Vhm6os+o5pHai8wn9RNO4I7TQcyaJa+v5xnmTw3
         eB5cwEhldyuY4tFHNlby8+BPG4lf6g0aVxfb60qHICVUKTgR6oUT0N5fNMGLR313LJ3M
         6kll0Irfvy4oK8JS1nulm1kd5++AbYanSljbHhTkrg4uP+ju9PkF/BiGUvN6Xqx3kFaa
         v/L516smo1W8xg93bLwvzEzHwt38gZqLlZk8LQ3++Pgw50Wqvk7DDyQ1vYFbFi7didLg
         Ns87d1Z6Qh3lSUfurGI5LIUXAg/KuchGWVQNSG6LhNrkjnyoHPXe8liiSxRZCne42pcJ
         2q7w==
X-Forwarded-Encrypted: i=1; AJvYcCUd9drdNSKOPfaZ25c0h2Q2jmQEVjTH2Qn2sS5GIG1uLoy6hvxd/CocCihjvomd5ochm2FoUEdclZ7tn2/12W23vA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzV8aereZYDTyik11SyuTViMkNhn7AD5yja3wizf466at9XBLjv
	iFOsfdFUfK4nwrSN3VRuaAcW7gecNUuBbNmIk3olnCAQkj4pmftrHyer
X-Gm-Gg: ASbGnctPEts4PiRDhxbHRosiGxsQyj9mCcIvqH+4GsnnZRCoQBCmthRKAInzermaSgT
	hy9VVEDSddNkClhDVjHEoXZKhu5OgmvzVvWApqUx7F/aBZYorz33riCqz2A3M4BixFky7h8aBV8
	uPWT4iRby9SA5fh0hFIPBO22KLKUZo3gk/L2j29dEsg3UIQBU+SkQ38KzhtBkH8fVJYyANAYSDq
	YUQ5dTZB2bFP9gbZXc1o2GFMzoDhlOuayeo1CAX/V+u4vl54iNumOaCDlKKWr39Gvtln8uFjb9O
	Mxiyd9Fc2EGiNMwFUlQcYSqP3cgVCP9MZyOaCpbYk9rCKxKAFlfP09zebq+g8UOHeW+PY28go5K
	wtpU/ZQQbgCrICecIeuJZ1gVwy1XQErDNrbFy/FVNXpm1HoilDQRvKUWAcX0/6YZQ76jzUSkh7+
	ZD3glozkvyHDAIO0GdW+/N5CMgeglBuqQcCzeJEVRpCMTRgo0kROzfikI=
X-Google-Smtp-Source: AGHT+IG3RmJz0Z+nO53FYNQ/3WWDHb48dfImwEPzQQVK708vqhqmfEofhkuOROAMgovlSbhnpPXrIw==
X-Received: by 2002:a17:907:9718:b0:b2b:5b40:1cb1 with SMTP id a640c23a62f3a-b646fc94a79mr365479566b.0.1760700559603;
        Fri, 17 Oct 2025 04:29:19 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c2813641fsm1454867a12.23.2025.10.17.04.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 04:29:19 -0700 (PDT)
Message-ID: <06c5101b-634e-427a-8f41-593e3fe72f43@gmail.com>
Date: Fri, 17 Oct 2025 13:29:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] mesa: update 25.2.4 -> 25.2.5
To: Quentin Schulz <quentin.schulz@cherry.de>,
 openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20251017104135.2635981-1-zboszor@gmail.com>
 <92173122-0c41-4739-b5e9-eb10e20b92b4@cherry.de>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <92173122-0c41-4739-b5e9-eb10e20b92b4@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 11:29:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225009

2025. 10. 17. 13:23 keltezéssel, Quentin Schulz írta:
> Hi Zoltan,
>
> On 10/17/25 12:41 PM, Zoltan Boszormenyi via lists.openembedded.org wrote:
>> Announcement:
>> https://lists.freedesktop.org/archives/mesa-dev/2025-October/226555.html
>>
>> Remove 0001-glx-provide-glx.pc.patch because it's merged into
>> this release.
>>
>
> Thanks for the patch, see 
> https://lore.kernel.org/openembedded-core/20251016-mesa-25-2-5-v1-1-08035df5e74e@cherry.de/ 
> which I sent yesterday :)
>
> Considering it's the same patch, maybe you can give your Reviewed-by/Tested-by there?

Done.

> I've been told this will probably not make the cut to Yocto 5.3 but it'll probably end 
> up being backported (though it remains to be seen whether I/someone needs to explicitly 
> ask for it).

Pity. Some people use meta-intel and there are
crucial fixes for Intel GPUs in the new version.
Anyway, I can use my local bbappend.


