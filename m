Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF696C3ABCC
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 14:13:42 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.77588.1747145621877011089
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 May 2025 07:13:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PVmaiuQQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac34257295dso953127066b.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 07:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747145620; x=1747750420; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nlFVLyRLly5F4PoGQxbYdCZZ+aLaFPg9Os+OegTaT1Y=;
        b=PVmaiuQQgwCNjePQ46AyPKP/YhJfR5gcuZvRipdaDGvwRFdAy9sCTKkunYB4QUOnu6
         JlQaudqDXAwGF3byEC3n9X22WMrOHl2HWAX2gQs7h88hwzs8JM8VutfsJGxCPCKcnWnV
         /MUjNojMn3TsWXnffABu4eCLALCJnQZ0qD7dZE7yJnUmceOSB5kNXp0V5NzB0VShQ0nQ
         8X1ecZPNdpxlDPmRg4ATITNd8Nqv835pKnN8/YbVzv9vMD/W0kM0xQqP5IINe55+AkuO
         myFWCp8YksNZ7Nwi9HFHoOV5c+ANTVNSAlJMUhLhBfQYM84kKXPl26mm6//nkCcMMiKo
         CsKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747145620; x=1747750420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nlFVLyRLly5F4PoGQxbYdCZZ+aLaFPg9Os+OegTaT1Y=;
        b=RXodpboY9Uf3ZmaZFJOAa3dIzU906N2LAiAuzlwQ5BTuRlayVTR63vt83ZFazy7k8W
         pmISd3596e2zWLJqofLQBVRrljM23vzqRnv3EunGcVFHYXlvp6/X0deAkWO/vQM9mvY2
         2IFle5N/EokveZYmm3ZXaVuA0n/3e7BJZHFoS3GAfMxK+0h46xTPF9S2+a240CvvIn2J
         nk7aP+Zy1pi8t3JqRBdUj8dBfMOOw37fNYNMDNBVawobUFslwCauhYvdsRF6Zfy/Bw7w
         XivvHycdIE8gwSbfJVsmkfrxyQUNvS1DD/634XVrjDPBTvwFn3SERTasxEs6Kk2RWXRR
         UZBA==
X-Forwarded-Encrypted: i=1; AJvYcCW7UWdhd7H8jJK8kBM4w/CZ8zzFhiOQdjSTyCjGMBvZQeHL7RlAKlG4BIxzR3/f24hFl1xOslRKrvXdrG0jGLKNzg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxdcoYZvGCHo87oyeh+dPS0bnexXwAGArNMCY+z1QNsYLBRIjhE
	WYSkKM3vxqvqgW2/orn2wo+ux7TRm90GRUDQL9/+1fbJYlFbtJNn
X-Gm-Gg: ASbGncvN/uZc/kIvNR5uY8jlCstCyZAcPn8TtmAqvyt2l7IvcSmqlB0bl7s1gfSBJZx
	ZKmi2TdB/3p1lUXZSvt6LcLJVBAqK+LtRn6ELiUGKDtH4CAyOUDBSBR9EORm8mY62a/6ayN6wKJ
	HizjuaXB08A+NQ5vC1ZVab69nwsu6wFn9Sf+FMCoZiMcKH4/9sXyUS5XHzOcXSTT0+8AaoV+ZjU
	iLjGSTK7m/8101eXjcsn1f4ToSp0lnixQ5i9UrLdbQjD7VEl5GpWeH36aDMWsP0ibIK0tAr8Vv2
	A0xqzzXXKkGG81r6Xs1B4jt3zc3ZYd5Ct/noxSj6/hC7OXSbyMUSpSnoRB8=
X-Google-Smtp-Source: AGHT+IGgxPGD5QX/mrRcBBBed5YntXcz1VooFuWrMC9Zx01veq4CByPNBz/dJnNA1V472RZMCx98Zw==
X-Received: by 2002:a17:906:794f:b0:ad2:481b:e6b6 with SMTP id a640c23a62f3a-ad2481be844mr1070401166b.17.1747145619836;
        Tue, 13 May 2025 07:13:39 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad219746d18sm792785566b.91.2025.05.13.07.13.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 07:13:39 -0700 (PDT)
Message-ID: <d3c9b40c-0286-4838-b5a0-6580e1945e2c@gmail.com>
Date: Tue, 13 May 2025 16:13:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH] ffmpeg: Add "libswresample
 libavcodec" to CVE_PRODUCT
To: mail2szahir@gmail.com, openembedded-core@lists.openembedded.org
References: <CAOSpxdaDk4kp_jwX40qmSDkSxmdaScwbwNNEBweAmXZAQG_nAQ@mail.gmail.com>
 <1013.1747132320039657265@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <1013.1747132320039657265@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 May 2025 14:13:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216428

On 5/13/25 12:32, aszh07 via lists.openembedded.org wrote:
> Hi Steve,
>
> Could you please check why still these changes are not integrated in
> kirkstone branch?
Try to send the patch once again. In patchwork it seems to be stuck in
"waiting for upstream" status, and I suspect it got buried under other
things considering that you kept following it up diligently without
feedback- a fresh patch will be more visible.
>
> These changes are already upstreamed to master. It also got integrated
> to master.
> https://git.yoctoproject.org/poky/commit/?id=22c08cab4db89dc3d41ab22cfe0482c1483391dd
>
> Thanks!
> Zahir
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216410): https://lists.openembedded.org/g/openembedded-core/message/216410
> Mute This Topic: https://lists.openembedded.org/mt/109041180/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


