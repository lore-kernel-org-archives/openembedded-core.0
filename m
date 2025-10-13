Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C34CCD183
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 09:42:38 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.39711.1760348548438798687
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 02:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UamitW7i;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-63b9da76e42so1841389a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 02:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760348547; x=1760953347; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bLsNar5kMNNIrG81yWTFBwz9FaG5OB8cP5s7JUC8BNc=;
        b=UamitW7iJvuRQtLMbo/r8AO3iSPOGhJB0mMCseSiZ0D5JC4v5ZpRpQkEXCtPf9nknw
         aq4bclmUAbRGBCUF2I54dUHBlYikK6WteJZnAg01+Gv9DRiKdOufMkc/ny8m3rS8MKei
         qv0fvhUe921MmYlcgU9S65wKFqOUqf9VWsGAldwIocC3b9JA1XKIMUK0QNGT1mZfzCBn
         ZLj4hWSLF53NnuholQcp1NvkIchAywnz/qxZH9qlUf6FLb5NidJ+jvlDy9iXhPBUumSS
         Egl4Ltzq+J/iMXbf6G4hPjMeRgFOLuKWtAE8kZvNCz50SWw2XCqzM6QXpAWHjcP6ihYl
         p9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760348547; x=1760953347;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bLsNar5kMNNIrG81yWTFBwz9FaG5OB8cP5s7JUC8BNc=;
        b=XYB8W+zExN3UuLTW4phPVFYhIscEFjlNzsh1SSVIQ3T1t30bw+ftp/LG9eXWEKHTmj
         zIde/Y6xu4bKuSpjc/zjIo3mGdSprTRDdHu0RrtUdyYVzv07YTeDk6EwDcwPDxW9Ez5/
         ZLglkU4915zEjnxL8KScCAmabjOdhbF6jLwsNza/zZE0PPwZoAxnLcr0XzM8rN0ENeM0
         p5eEmh4wn0kN02K1PakwUIvf92UqeFdupOS+OhaR+tRv2F5WWbQQmT4dh71dyjFVpR7k
         ejk+W9F40S7ipZBhIwXqeg33URIPhZKKRyRbn2MWhEo9byZ1hd/rc9N2ZuvMLGCWJuOv
         3Itw==
X-Gm-Message-State: AOJu0Yxk2fzMLuWx0Y8tNR2nvXZs3AcVY2t4RX81UXeTJPc3RpyhR81s
	JESaVjDTbEqAruzTEIoeziMDdIHTVNzfYupVLkhgFitlkF48MjuB3gqC
X-Gm-Gg: ASbGnct4psvhNoD06ocgzLcQrMmGTSi0en5akiAXgWM3iDULc0K3E7WBEOvXRbjEzXB
	AFh2hwmQU+g3L6LePFG3GfhkYrcTR/qSRLI3ARNWCsYD3xv6vMTajmeHSYV+5nmDmbDUt2VxQpn
	mL1qds+xKiRwIJ1+NrhpPwUU5WAcr9i3WmGLVt0Acaj0mR58Gf8TogmuBNYHBhDszYmzivqeeKB
	xZXb6dSZDGDtlyE09HLwWsj1bSuWyh99MUveZJJLIdMTNPPSn8EYux+8IQDjovNiAcMqaUsOmWO
	kFvyzw01BUsYI9uo87L5oUBAWaHvXy68Xb7EyN/op2DtjUEkq1UqMxHe7q+gwuYzzJ5s5MID8Zw
	jPLMNBF2B+znMQ4FzkC9q2qfS42Du/0YaZhbUU34ybfocxDusV84dEujiuq1lLn0ggu1Y3qUX5x
	4=
X-Google-Smtp-Source: AGHT+IGyY6Bqrb+qiY8WENVQNRE2aWs8gLIl6xdSmPslMLUTH4OY4kq8cjSaUNk3pAZFEPbYgLbEHw==
X-Received: by 2002:a05:6402:909:b0:62f:6759:3b09 with SMTP id 4fb4d7f45d1cf-639d5c59e04mr17494788a12.30.1760348546500;
        Mon, 13 Oct 2025 02:42:26 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a461703dbsm8605277a12.0.2025.10.13.02.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 02:42:25 -0700 (PDT)
Message-ID: <d3769482-b325-4b95-82f6-f35806f49788@gmail.com>
Date: Mon, 13 Oct 2025 11:42:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] clang build regression
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
 Ross Burton <ross.burton@arm.com>
References: <7ce15619-5c6f-4f22-a0b8-aa7e84dc6bea@gmail.com>
 <CA+chaQdHpQTYWRPpxjHjqR754WbwSpSr7WEuY4u13kK7WdkDvg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CA+chaQdHpQTYWRPpxjHjqR754WbwSpSr7WEuY4u13kK7WdkDvg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 09:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224768

Hi,

2025. 10. 13. 11:24 keltezéssel, Martin Jansa írta:
> Don't you have something like:
>
> PREFERRED_PROVIDER_llvm = "clang"
> PREFERRED_PROVIDER_llvm-native = "clang-native"
> PREFERRED_PROVIDER_nativesdk-llvm = "nativesdk-clang"
> PROVIDES:pn-clang = "llvm"
> PROVIDES:pn-clang-native = "llvm-native"
> PROVIDES:pn-nativesdk-clang = "nativesdk-llvm"
>
> somewhere in your build configuration? It was needed with older
> meta-clang (to avoid building llvm twice), but it's not needed now and
> causes the circular dependency like this.

Yes, that was the problem exactly.

Thanks!

>
> Cheers,
>
> On Mon, Oct 13, 2025 at 11:09 AM Zoltan Boszormenyi via
> lists.openembedded.org <zboszor=gmail.com@lists.openembedded.org>
> wrote:
>> Hi,
>>
>> somewhere in commits 9dfd4f44d4..3fc1fa77da caused
>> a build regression for clang-native:
>>
>> ERROR: Task
>> virtual:native:/mnt2/zozo/yocto-5.3/conf/../layers/openembedded-core/meta/recipes-devtools/clang/clang_git.bb:do_collect_spdx_deps
>> has circular dependency on
>> virtual:native:/mnt2/zozo/yocto-5.3/conf/../layers/openembedded-core/meta/recipes-devtools/clang/clang_git.bb:do_create_spdx
>> ERROR: Command execution failed: 1
>>
>> and for clang:
>>
>> ERROR: Task
>> /mnt2/zozo/yocto-5.3/conf/../layers/openembedded-core/meta/recipes-devtools/clang/clang_git.bb:do_package
>> has circular dependency on
>> /mnt2/zozo/yocto-5.3/conf/../layers/openembedded-core/meta/recipes-devtools/clang/clang_git.bb:do_packagedata
>> ERROR: Command execution failed: 1
>>
>> Using the preceding commit allows building these, i.e.:
>>
>> cd layers/openembedded-core
>> git checkout -b work2 9dfd4f44d4f40e7926dc88cb564baa2345c2a24f
>>
>> git bisect lead to:
>>
>> commit 448f4a84cb22c380d97e069d0b98ddbe1cb8de18
>> llvm: add recipe for just the LLVM libraries
>> still allows starting to build clang-native, which eventually
>> fails to link executables, due to libLLVM.so.21.1 being missing.
>>
>> commit d76dc362c8e18779cc4ddc6a778fb423c0e66a65
>> clang: use llvm recipe
>> already fails to start clang-native with the above
>> circular dependency
>>
>> That leaves
>> commit acc8c5c89c0f1bff3413d2301a65afd89bd0d9ff
>> clang: globally disable build-time RPATHs for reproducibility
>> as the last usable commit.
>>
>> I use meta-intel and MACHINE=intel-corei7-64.
>>
>> Best regards,
>> Zoltán Böszörményi
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#224766): https://lists.openembedded.org/g/openembedded-core/message/224766
>> Mute This Topic: https://lists.openembedded.org/mt/115731404/3617156
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [martin.jansa@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


