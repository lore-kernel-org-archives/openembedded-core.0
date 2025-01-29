Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16BDDC02192
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 09:00:35 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.8650.1738141232875298256
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 01:00:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DcInVnKB;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso2828945e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 01:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738141231; x=1738746031; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RQcGDeU//OyTNAB/b/JDbpCaZ4A9998lfixNP5gkHJ4=;
        b=DcInVnKB3vgRi3J0LHN8Le64BTngToecJ9wPUVdmhO+MnLouJn9LBpSXAXISp90epJ
         qZRcTDMXm51oRy5yWAR859btgt1M/21jfw0Ah8tXMvzVMqLg1mBvbPC2X4O3C0l9H4UA
         Nl4JCfEUg3TyB2SYE4cJEND5nB2+W0u1/aBh21Lv9PL1qQ9MOnSkU5Jwsm0qYvFo2usr
         v5aEDh9XZWoW6gtWKT8cpqwBEDcvyhBTyM0GexWFETwUSVaiIGEjWRHmnn/Apn0tvfhz
         VZahwYW7PQN+Go9vVFhy3bgQD1HB1n2myJTePE0egl547tZzPdOEOUcQpVCcMIkYMKKS
         PVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738141231; x=1738746031;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RQcGDeU//OyTNAB/b/JDbpCaZ4A9998lfixNP5gkHJ4=;
        b=G7YU2BOZLQvILyTXbGwMaZIPCSYiq00CzKRCUdBgWXXl1WIZqWl4qJvfYk5Z4AX0rq
         uXXWapgxUfEDQ0KFIyXOtVh2B/Bq8lX+cYSo18zaTQiGGN48EyL4e+AbLSJG5fo6GRZP
         x/ji3GoKUTzqVm71r7+/VOkKnX55VBItVyRKib4K2ZYjmVEtXfcNySQr0gY/9CSekYyP
         YZFPf4dwKytYnTrQs6nVzinAUMEEQfXlcxxB/IMGQrBSgIkwJH+TbZ/WMAkbvuhV0p4I
         qLcsSGZk2XE8cjqezvrUgIGVG0qmS+xdnyRbOPjdZ73wjy+liDIWkgzFiifwk2fvH4Qy
         Vxzw==
X-Gm-Message-State: AOJu0YwoZt6opAZqOtDjzbEr5doYeUUVrvd1+HRLI3DYUTjModZrOKCo
	wWphbZn3897e6F9h8RNn2VX6yZVYh7qxrsI+4mVtWLdo/uUpRdlV
X-Gm-Gg: ASbGncucG2Tbyr/nN56Z52+41Plx1guXxlTjCZxBtixeiabl1M3o79t3ktd13MmLeaq
	nM0m9a7GA1MM6RcIijsHJkBR17mpPtWL+y7aED3pEUwgQJBJSm0Yjr3YC+iiYDX2aXf9DM6D4/9
	eUNX+/IpTK+hlSAYW8B9R8v7oL2l3zplP4ippi5fA4+F3t6xlQ3Ujp6KHCK6zkJaxhHKd+JIAxF
	eALltklBvoVOdOqQpGsd3J1HMK/bgwo+S7GPawpkDe/1Ze5qCweXWzjUno7nNisAKjWQHCVmMXb
	d1oIh0PZ4IMt2ntol5DvvTvxYf2PrS1nNboW6fBZFotAtXbY
X-Google-Smtp-Source: AGHT+IFQ1LnKf89c6VEH9AA8F8Gfr95qyk4RjFbBxp13Nko+pc6ipVV3DAFZQFfVkCk0rtInI4zBUA==
X-Received: by 2002:a05:600c:1f86:b0:436:e3ea:64dd with SMTP id 5b1f17b1804b1-438d599b97amr56271335e9.11.1738141230904;
        Wed, 29 Jan 2025 01:00:30 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc33e3bsm14854855e9.30.2025.01.29.01.00.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 01:00:30 -0800 (PST)
Message-ID: <b5aef63b-bbab-4bb2-829d-913ffda1ab3c@gmail.com>
Date: Wed, 29 Jan 2025 10:00:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 1/3] cargo.bbclass: Allow using --offline instead
 of --frozen
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
References: <20250129080902.1863054-1-zboszor@gmail.com>
 <CANNYZj-kk=EZMRopOVDVpEVhwzWYSAabSCWWbF7fE7atMN6bNw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj-kk=EZMRopOVDVpEVhwzWYSAabSCWWbF7fE7atMN6bNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 09:00:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210353

2025. 01. 29. 9:49 keltezéssel, Alexander Kanavin írta:
> On Wed, 29 Jan 2025 at 09:09, Zoltán Böszörményi <zboszor@gmail.com> wrote:
>> | error: the lock file .../Cargo.lock needs to be updated but --frozen was passed to prevent this
>> | If you want to try to generate the lock file without accessing the network, remove the --frozen flag and use --offline instead.
>>
>> Add a CARGO_USE_OFFLINE_FLAG = 0/1 flag to allow using --offline
>> instead of --frozen for such cases.
> If you add custom patches, you indeed need to re-generate and update
> Cargo.lock. There is code to do that in cargo_common_do_patch_paths()
> in cargo_common.bbclass, so please check why that isn't working for
> you.

But patch 2 in the rpm-sequoia recipe is what "cargo update" created
in devshell after patch 1. "cargo build" still complained.

I will look at cargo_common, though, thanks.

