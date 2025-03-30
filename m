Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C64B3C28B20
	for <webhook@archiver.kernel.org>; Sun, 30 Mar 2025 22:40:26 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.39908.1743374425103551006
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Mar 2025 15:40:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GKUC9sod;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso1369760f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Mar 2025 15:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743374423; x=1743979223; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JaEpDJnga3rqgJljbu11bpIuUtnl1aEFBjE19lWKyE0=;
        b=GKUC9sodVO7nXTWoVBYvWyAw69rI7gFpmzXWBW6YjW9Qt0fmPn2b1vBOjF0IuwwaLv
         MidlyxoAhSNhLF4vS6NL9CuDEUOHsDnrjKiKfHY5ScHJemX89d7wGZCicKUNUS/vL0Dq
         ulndwIncznkDmqDrzkCid1/g0MjeREX3xBqZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743374423; x=1743979223;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JaEpDJnga3rqgJljbu11bpIuUtnl1aEFBjE19lWKyE0=;
        b=Tnhj/CNLScvthPHdjMrMntQ1DnQbobcm6wda68oZ09272IFzsBbuEU1qd/0GAFZNTI
         7uc659SLt7bIvdA4yYp85Kq2dUmZYWSHL/KbWLQ6q9qGN5VIrFqif3KMXOMM3EUxJ8xH
         6jk/jHh/FvmehukpGXAQwlOw9LXOWWj+M2jyqc3q31mLEEPu6uxjkoG8JkXSOyawt6Lp
         EdATExc11dpXZHlVnc9snFfWNVf7IaLyv+a3zybGWJnJyjiSDZDRGKwxX/CQyhYIl+uX
         wkvFLh5opDgZL5ZyzU2RHiYs0vQ10a8fQasU6gp9GUExGoiWG2BVaSzFmyD0jz78eFxb
         xA3A==
X-Forwarded-Encrypted: i=1; AJvYcCUsvF2HPdIiHo1ahLuSJFLm0pa1MF6bp+RbvGo72ozqSxlGZrbwZdS313EHkBjq0KgyjkAxg7iqJmoD4eaqqP24KQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxuaPOOtPwMirqLq2qW1NXKoxDaRU8ujg447iLLJT8RCmSCc9H9
	T4REPdiOhsLO9ZtK0c0VI1QQLuSONge4JsF+rY7fQEw9t7fumZc+dr2psRpalgI=
X-Gm-Gg: ASbGnctfpjq5qMp3wfKbt0er39lNnTY5CoazgX4txYrwGBkR9bbCBo3luk6cTEayS9i
	m3YyKF0iNnM6rnd5dRU7KxxXu+uB4Z7S7xzx8ITrnDCrwwtTd/NE4MKnghm/O/3XlhOr4zwNO5B
	rXsbgiR9RPf6sRezB7nl+KSXBrp8RBQOGFCYbxdkcfyaxRqS7I8LajiTKgsPq3wVSuzlBPlL/qJ
	Jahws0B6FAowMX0o9UG9cfI2yjfCTD+FzY1Jh+cC/TbmnPlVMj3hqaII4ZA1YzLoVhMRidExHBv
	hvRpGW25cY4nDTbRwGaa7P4gSo03jI7TuqtTwZykX++qquGf69AwieRxJJXA7nMCrw5h9zR8az+
	9ZI+syiI2he9f2mFQC0LRK+Pjc4Na3EynsVRjsi8=
X-Google-Smtp-Source: AGHT+IElnTM4cnJt5hcfd2Qgen2BvBx+cNaR6HlwQotunGPpX0BrvrJxO/YolsLHvMZbgQiT7IyYLQ==
X-Received: by 2002:a5d:47af:0:b0:39a:c9ae:9efe with SMTP id ffacd0b85a97d-39c120dd792mr4851615f8f.18.1743374423466;
        Sun, 30 Mar 2025 15:40:23 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:99e5:eb31:fe52:84? ([2001:8b0:aba:5f3c:99e5:eb31:fe52:84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e1b0sm9501192f8f.75.2025.03.30.15.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 15:40:21 -0700 (PDT)
Message-ID: <f260bc5fa637f949b5877c5281cc71b70dfd1fd9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 0/9] mesa: upgrade to 25.0.2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: dmitry.baryshkov@oss.qualcomm.com, 
	openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, 
 =?ISO-8859-1?Q?Zolt=E1n_B=F6sz=F6rm=E9nyi?=
	 <zboszor@gmail.com>
Date: Sun, 30 Mar 2025 23:40:19 +0100
In-Reply-To: <20250329-mesa-25-v3-0-f4d0328eb867@oss.qualcomm.com>
References: <20250329-mesa-25-v3-0-f4d0328eb867@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Mar 2025 22:40:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213926

On Sat, 2025-03-29 at 22:07 +0200, Dmitry Baryshkov via
lists.openembedded.org wrote:
> libclc is required in order to build Intel drivers in Mesa 24.1 and
> later. Thus OE-Core is currently locked to the 24.0.x branch, which
> is
> no longer maintained, having last release in June 2024.
>=20
> A clean solution is to package Clang, then use it to build libclc and
> SPIRV-LLVM-Translator (required for Mesa OpenCL support). However
> creating proper recipes for Clang is a long process (ongoing by Khem
> Raj).
>=20
> This patchset attempts to solve the issue in a simpler way: by
> building
> libclc and SPIRV-LLVM-Translator together with the LLVM. This way we
> don't have to create target Clang recipes, there is no extra
> toolchain
> to support, etc. Clang binaries are creted as a part of the build
> process (in order to support building target packages), however it
> only
> hits the LLVM sysroot-native and is only used by the LLVM target
> build.
>=20
> Future work by Khem (once Clang is properly supported in OE-Core)
> should
> allow us to create proper recipes for libclc and spirv-llvm-
> translator
> and drop them from the llvm / clang recipe.
>=20
> I think this approach provides a good balance between OE-Core being
> stuck with the outdated Mesa release and being able to upgrade it,
> bringing support for new hardware.
>=20
> Last two patches of the series bring in RustiCL support, a new OpenCL
> implementation within Mesa. They are optional for the sake of the
> upgrade and can be dropped if there is any issue with those. RustiCL
> support is mostly compile-tested at this point.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Thanks for the patches. I haven't looked in detail yet but I did try
running them through testing which revealed:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/92/builds/1283

as well as some issues working with meta-clang:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/18/builds/652

There are other patches causing issues in that build, I'll leave it
running in case it can spot any other issues with this patch series.

Cheers,

Richard

