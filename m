Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE28CCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 12:29:11 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19265.1762172945092132723
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 04:29:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W77vFfsH;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-640860f97b5so3027936a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 04:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762172943; x=1762777743; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BdcC0mte5d8AtD/Ndiq4CNNSK4C1LPwmu5Y+qzplcpE=;
        b=W77vFfsHi771j8lffXs8wVkpuNPNkBR8+EU4nIDYNmUh/c+p2J5QZ3hxYXsaGeent2
         rJaqtYpLKOSn/ZH9vEEglWiRg/jPcz5SyffQVX4x4KR9OWD6JfHIybm4+26cEzl+KxVs
         Cieghw7u+6JywuSifqq83LRzrADwCSUU+e7slkIUz1GpS5+lXLXNLsHec9g/QKVxKCr2
         cPJjtkRO90ZOwpolya/a2Jjh+AUX9dqDutM1doWdd8SqrLN0qaJx+lcV4qsq5kZ0Mfgl
         3nGxwep6rSyrrysLc/PFM1djhvHt4Wcdg8IFX1/LEYfoCtC3RiZWjpyEu43rOX9FrjFe
         ZzKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762172943; x=1762777743;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BdcC0mte5d8AtD/Ndiq4CNNSK4C1LPwmu5Y+qzplcpE=;
        b=CZP46AW4uPFiC8+7g6DTS/5IB5J/WFQq0GsWcrk9h9fxD6IgHGjeG3ezNAB194ybqG
         LM9Im3T2rJpjqXGPgt2flGfh5VQV9fCEr+x4ZMyDre32YcUi6TLNuE+30t+KN7mGtYPC
         cSkSiVV3VOIp8chqWb0QMEytBsmSKdfBqWZAQsNiiKzDGUcVd5iqpqdThx6DlP7JTFC4
         3UP1nAZptcwLWtuyuaEnSSf99VZ33nDWnJ1TLdgYoSEZunPa3wLKRqEKBVeJ88unpUic
         G7vCl9A3wsjZOBw9Io31ZTHgMCiFQBcQfwJtu2NyTJiMvNpQAlUitNrHjQaB4GUKIHJP
         HYbw==
X-Gm-Message-State: AOJu0YyzqnXjAYd7439n7kveM/9lfrgxcTItWFicObaKd75kDXEP+I/4
	E9U/v3DXjQ8ZqHWQkSNw2ur944rH5ENQYFyafpYA12wG52ZTQhlyDr7B
X-Gm-Gg: ASbGnctvi2UooNO2Kp0XbmdJaK50bnwUOz4cZ/P1RKWw97oBKnDIZcxNXAh8MEN/cet
	npZgMYOP8T5sid4BJPaLBHu/01dwU1o4jN4UPyh+9T4Cn7EMujLyeOE00G4BIU+98Jy1nIgaIOu
	TVu/BtF3iCyhhGYp8RIsW6A0IM6X0w3N5H5kEfDifJz/ny+all+iPiQMaFcstBCD9xHp888LArz
	J5CAlBqoDdyREeF4mRR8i8X5r3fxaT+QWP7Gm5OhjhrqAi2pcGUYJUW4W1ni3sLnrbB4379lcRW
	scc2hxLmG6UnWVHBjhFyioQEcN8qkUJRlbWHaWAIHiAxefLM4lZsa0AtudDcMii0o3n9Fl0Kter
	btGMm0wGEtyOEbk2omHlyrttw1wNw7q1ddE/rOS2M5Ar7HdWIEJcdPj5O57J6SzW47DYbJQUltU
	4KGsDyFCxhy909BGIJodVkWsF8wlf/7BzK/jLBji95Qej5
X-Google-Smtp-Source: AGHT+IFIdqcJ43Y75/EdZ9NgTZlPCYln2M8gpgHMO0tgLqEtnF6RZj8dmFUbeNCEfwefAncJVGKzYQ==
X-Received: by 2002:a17:906:f34f:b0:b70:7cd8:9098 with SMTP id a640c23a62f3a-b707cd8a9cemr792238666b.61.1762172943090;
        Mon, 03 Nov 2025 04:29:03 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7077c3b1a4sm1016786366b.46.2025.11.03.04.29.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 04:29:02 -0800 (PST)
Message-ID: <ec0c349b-4f6e-42e8-be37-e8e8d368c931@gmail.com>
Date: Mon, 3 Nov 2025 13:29:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] meta/conf/layer.conf: Avoid adding build deps
 of rpm-sequoia-native
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20251103080410.2025712-1-zboszor@gmail.com>
 <CANNYZj9WdjNNdaNTUuhL=J_TJf51zfOONb0xR8X05QCs8ioiRQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj9WdjNNdaNTUuhL=J_TJf51zfOONb0xR8X05QCs8ioiRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 12:29:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225652

2025. 11. 03. 12:16 keltezéssel, Alexander Kanavin írta:
> On Mon, 3 Nov 2025 at 09:04, Zoltan Boszormenyi via
> lists.openembedded.org <zboszor=gmail.com@lists.openembedded.org>
> wrote:
>
>> Avoid adding dependencies of rpm-sequoia-native into sysroots
>> as it needs none of its build dependencies to run.
> This needs to be a bit more specific. What is specifically installed
> into sysroots that you would like to avoid having there?

rpm-sequoia is Rust based.

rust[-native] in Yocto master depends on llvm[-native].

The target build just uses the shlib dependencies (only libssl.so.3,
libcrypto.so.3, libgcc_s.so.1, and the C runtime), but the native build
pulls in the whole destdir for each build dependency.

So, it's not actually true that none of the build dependencies
are needed, but the openssl libs and the libgcc_s native builds
are pulled in via some other recipes that are needed in native sysroots.

Anyway, noth rust-native and llvm-native are quite heavy, so
not copying them speeds up packaging a little and saves disk space.

llvm-native also conflicts with clangXX-native builds in meta-clang-revival.

Recipes using TOOLCHAIN = "clang14" or similar build successfully,
but extend_recipe_sysroot in staging.bbclass fails when re-run
before packaging.

See my previous mail at
https://lists.openembedded.org/g/openembedded-core/message/225411

Currently this change is in the layer.conf of meta-clang-revival,
but the speedup and the disk space saving worth it to have
it in oe-core.

I will send v2 with the extended explanation and only omitting
rust-native and llvm-native.


