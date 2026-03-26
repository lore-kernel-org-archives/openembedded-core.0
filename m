Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A11110A62D6
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 13:47:41 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47784.1774532859240538015
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 06:47:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GcbCpype;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48704db565eso14041025e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 06:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774532858; x=1775137658; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=18AM/c0zT/yyOsiQ107tWsRDUYXj6Q+5QaxQFrFUyN8=;
        b=GcbCpypeJTWrWeClzbUyI7x1hhJmadqockDGGnKDiAifxQBvBsBAtqjOW/vKvsxeaF
         nXrA5IANmJ5mkQlH+15W6SBJi/BeYHL/X8M8u/ARj4J+eRzMC5x/K66AOqhb3pDLSZ+y
         RZg+5pBC3PDjlagMVUjj2cJu57Bw/40DjB042BOie7Nhz0NngD5/3msrWAGGD5lZZC6Y
         EhPybBf/dRfEaI7a1B1nqJ4RtxgOyQPNp+Ejw5rGA44MzCLTSb4OkIi0NkUN584RSc0M
         sSKMOPmbfLTtmcHmCteIUkvwY1jbDYSsaJVn7TZK17NH8EG3cNARuaI1LY7lu5tZ/H9d
         QBHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774532858; x=1775137658;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=18AM/c0zT/yyOsiQ107tWsRDUYXj6Q+5QaxQFrFUyN8=;
        b=bZWNiibXSENG0kK9OuCNCu6SOugFrx/U3Ls6X/zQPGE89iaNmViOnkRseA6oCXL8m5
         qJC11niiu2zCDMmAWi2q43swXx/f1EUTJ1kw2Kjclho4C0vBchMHhzTjwKuiRev+dHT4
         Wpgf9ydLAdfGX7xlUJFiA4VnWv/P1KfJxlQuzqW6yFLRneF9dAVBu4AcuZfTpxM//6PX
         sIabeOuquhDkgGj4AuLs08PfbycZVbPcYvG6IFmYkN1nuIRTXAUIlcskXV2Sldbz/HNI
         eeU7Qfut3WVqIfp+Ru4BgIIW1+WiieQ5Tfc2v1ntb4BZj0DZPI22ajZVnogvhfS4mSyC
         xT4Q==
X-Gm-Message-State: AOJu0YwmIDJVsUOgEGx03qmoYCIoXK46AkdIrLVgRKNG9m+Umb4whmq7
	bJqTpBYbZmbUuxc82WTl+h1CXLVIxxSobQhRFeoHzvcDYMVos+gtS5Pg
X-Gm-Gg: ATEYQzwG6JLqE5m8KeP8pkadxOt+5aSwav1SplA8eHvYtVDTLQCjLCZzKSPZfSI7/8m
	pJ1jWhsA0agE25AAIlSo2bhUQB5wFcCQ2vPBckRzbp2SheVu+XuKLU8ah9fviOhFS47XVfgQ9cW
	++P3Hvq7GbZcYMFShiS4YTZ8ji6r8LqdbANv9UoTdW8WSdyVdrMDx5xIUvNZtfMyUAgBOUi5mBd
	Xm/uiPuXaRtVmzhq71OAgQQQh5FPo9fNYpr0CTpwIQIssAG2g4udqeYQMbqPkXnvtrq9Ej/Q16K
	H9MECWOljkwAKy54fP2fv0+sii0ewhKaI01I12wZonzvy/0PdxbCc97dq8+ckYwoEuruN2QbCFk
	7hxdXpQvZLjoWDNv9qJjghQCn+TemZezPgHibbmXYce5jEdqaxkxAKmY8ikcD+JdMFwPwX2BJgf
	Yv/ia+BgLiCCHEfl20FQntx4aljXUQha62IdeDsl1n8Yk4t5GwTv87sDEV13Q67hzYpg==
X-Received: by 2002:a05:600c:a402:b0:485:303b:c50a with SMTP id 5b1f17b1804b1-48715fef22dmr85486975e9.13.1774532857483;
        Thu, 26 Mar 2026 06:47:37 -0700 (PDT)
Received: from [192.168.2.122] (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e35esm7532791f8f.6.2026.03.26.06.47.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 06:47:37 -0700 (PDT)
Message-ID: <3e1d449f-a5f9-477e-9acb-437a8f7837ab@gmail.com>
Date: Thu, 26 Mar 2026 14:47:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 13/13] libxcb: inherit python3native
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Bartosz Golaszewski <brgl@kernel.org>, Trevor Gamblin
 <tgamblin@baylibre.com>, Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20260326125113.1853869-1-zboszor@gmail.com>
 <20260326125113.1853869-14-zboszor@gmail.com>
 <CANNYZj9__EU9=6DyLviLss6vXmX52Vf1Rk1i5REobSkbRDq5Uw@mail.gmail.com>
 <18A0671344EE5B33.57592@lists.openembedded.org>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <18A0671344EE5B33.57592@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 13:47:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234002

2026. 03. 26. 14:26 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> 2026. 03. 26. 14:06 keltezéssel, Alexander Kanavin írta:
>> On Thu, 26 Mar 2026 at 13:51, Zoltan Boszormenyi via
>> lists.openembedded.org <zboszor=gmail.com@lists.openembedded.org>
>> wrote:
>>> Instead of open coding, use python3native and xcb-proto-native
>>> as an extra build dependency.
>>> -DEPENDS = "xcb-proto xorgproto libxau libpthread-stubs libxdmcp"
>>> +DEPENDS = "xcb-proto-native xcb-proto xorgproto libxau libpthread-stubs libxdmcp"
>> This change isn't explained.
>
> I will move this commit to the free-threading enablement RFC series and
> add the explanation to the commit message.
>
> The problem is that the build failed with ModuleNotFoundError
> for xcbgen when free-threading was enabled.
> No idea how this is satisfied without the xcb-proto installed on the host.

Now I know. This change won't be necessary, but another tweak for xcb-proto will be.
The xcb-proto.pc must be generated correctly with the ABI flag.

>>> -inherit autotools pkgconfig features_check
>>> +inherit autotools pkgconfig python3native features_check
>>> -export PYTHON = "python3"
>> I'm not sure this is an improvement? We try to avoid using native
>> python whenever possible, and use python from the host if it doesn't
>> cause issues.
>>
>> The rest of the patchset looks okay on first glance, but it does
>> include a breaking change, and you need to at least try to fix meta-oe
>> (or ensure nothing breaks in there which is unlikely).
>>
>> Alex
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#234001): https://lists.openembedded.org/g/openembedded-core/message/234001
> Mute This Topic: https://lists.openembedded.org/mt/118517418/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


