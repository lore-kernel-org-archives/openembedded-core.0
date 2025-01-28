Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E122C0218A
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 11:53:27 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.15787.1738065205277214560
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jan 2025 03:53:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IhD6df1F;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38789e5b6a7so3018629f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 03:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738065204; x=1738670004; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M4MQ+WmRAzWDyqcWWvpQ1/n2PBWEeAXGVclccQPuyK8=;
        b=IhD6df1FbdBJVdyBJ7uZ+Tju+xvGsPX1dBjuppxXJPwDteLIeg+2w0Z22WAmwT3+on
         MYv5/6g6IZdq5tOM+1X2Pv6MMebwbxVGrFMWOM87B+14HcHUtq2D7NsjGTqQe2QxSzz9
         ksqmIA6QRcp97byx9Mihj7ikosPIu223FJHrQgYsrCFWiZk9jSHS+BTmScJ2wbpDf1i7
         2AbxfkWFz2JwBAIw/6vTnjTTfo7aNqfLBO87pKyfs1BJ4SBkFNPa5laplyfvDKnt7pqs
         /D1zin/J7JNqDrJfbv+pkbutq02xA+ZLkmJRivI9Vx/MolkzFxWL7V2YApEx2cVWCY5M
         GJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738065204; x=1738670004;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M4MQ+WmRAzWDyqcWWvpQ1/n2PBWEeAXGVclccQPuyK8=;
        b=RVm+NWcqKNbv/KQ7s1+0gP7USRU8rY+12UlUd9ClUttBUFPx7LXVok2oLSG+IHgQcs
         wF4cs2fw49KDiJWyi2opnBLYSrez5A3Ce8QmGH8yVqn+7vWqPibo8VQs0h7RDXRcq3J/
         pHyvgfYFNMS9KOFCcwEnJ5P17AdnLJz8WZJc/7kmkhZEYZd8R4vRzkEtV/aO9HkPYNl5
         KOIMRmFS/ZulDWAVO/gYZW57BSxBiERDCS4YGSeMSXGT8W6piv0yNAIsACWTT85yWI7y
         y4kRx3WaIAjvHbvHn/wwjjW/aGB4rO9ipjoQTm48pHkvDuJ1l7d9aTaKKj2X4YuyzM6m
         Lf0w==
X-Gm-Message-State: AOJu0YxO54Tg3AsAMA7yG4qA4fyXBBhvnYkLTXMD3MqIa8xDHwix44sO
	OojU6Gtf2XqrnVbaDrFAXKx7CW6zhpNsBNDY9cUTFqDod0UxCU8c
X-Gm-Gg: ASbGncuYFMZZ4bDCpW2LtU+6d/0t01cer7iUlck4V3pdJE7zpHIkELvWe0IFZ5rPNT3
	UI+S7WGuU4Ie9WuPvJ8tHj57ICY76eZsrz4gWUPhjnHzNWalhFulAu0MHyyi3xchA8Y0+YRtU1m
	anKWkpPcQsEFHfhYKQr9WCatYzVYazHYijrHzAa9/7tS+2cQrLehkDAk1Zr0hUHA6ZrYfAljCW6
	YmEouCFCs8aChWAAxv9R6y8yv9K74BHJyXPuV0hX/PxX4nunTBod1XaQHBDuRt73zQWdpe12yDj
	Vl2UVAyepMZT+nseU6kEX08g2+4aG+yCIcurtfCoTPYKmZlY
X-Google-Smtp-Source: AGHT+IETtHCdPhUpTFqaWVqMsylMfzS8dmNH5jXze10UkrYKk4rxhFIuB8gNswsdO+0GEzPgmyUu+g==
X-Received: by 2002:a5d:6d88:0:b0:38a:41b6:d685 with SMTP id ffacd0b85a97d-38bf564d621mr41053322f8f.3.1738065203447;
        Tue, 28 Jan 2025 03:53:23 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1c4212sm13491601f8f.87.2025.01.28.03.53.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 03:53:23 -0800 (PST)
Message-ID: <f8de4060-bba3-4a5c-93f5-eb4685223a73@gmail.com>
Date: Tue, 28 Jan 2025 12:53:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] RPM signing errors in Yocto master
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <266ca4d1-62da-401a-b766-ab6b13c6753b@gmail.com>
 <CANNYZj-CNT8_yXKLB6PApG=Mknx=TKz2TAosgh17LiH1LQ0_fg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj-CNT8_yXKLB6PApG=Mknx=TKz2TAosgh17LiH1LQ0_fg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 11:53:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210320

2025. 01. 28. 10:30 keltezéssel, Alexander Kanavin írta:
> On Tue, 28 Jan 2025 at 10:03, Zoltan Boszormenyi via
> lists.openembedded.org <zboszor=gmail.com@lists.openembedded.org>
> wrote:
>
>> It would be nice if Yocto 5.2 final can use RPM signing.
> It can't. Latest rpm release needs sequoia for rpm signing.

Thanks.

However,

>   Which is
>
> - written in rust

rust is in core.

> - needs libclang.

There was a motion to merge meta-clang into core,
what happened to it?

> https://sequoia-pgp.org/
>
> So we ended up disabling the feature:
> https://git.yoctoproject.org/poky/commit/?id=ea9c2cfb6901251b95e07e052616a512b91ea0c7
>
> And that's the reason you are seeing "Unsupported OpenPGP signature" from rpm.
>
> Alex


