Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50AC21062876
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 12:12:03 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19934.1773231113826048610
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 05:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=edsurrnB;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso46618075e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 05:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773231112; x=1773835912; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vdPz8gixLwWYjxzv9Mn1w7Y2z1gNU/828hZJLAVKlw0=;
        b=edsurrnBUbJBnRoTZ8d0CfUTqfq5uhffbwxZOPSUTqruR55CAVBUG8zyyU99zG7Z8a
         RWS+4mrGamyNK5Z/aOHSz8856NKm/NYqH4rk/X0kGTZmHWuDct7zEV42HhDjlVAz6ry1
         efAz4DMErtyNn2XCBzGBqE6eWtff4tp5enVrXpy61gAaQIxlaKXHOsAXx276UrAc7Fwy
         JB4Lv6TQozch8Oqc/u6ATgE5eE2Q2xuGy6dY6LiA9YuCvLhs1rS5xONP5YuymhT3wNhv
         yrgyK49UuYoPX0i8Zz1T7jzRaD3nVHCzARcky+rhjT8VD1B3mL08LmmU564EHloRrQ5O
         EArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773231112; x=1773835912;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vdPz8gixLwWYjxzv9Mn1w7Y2z1gNU/828hZJLAVKlw0=;
        b=TTg/oR7gMVd7cXYlec5eU+Fxrn2pI+R99DfT3qGJxNcuer795c0ka2puKEfnafkSOy
         eu9vrcWutWWxzG+MxHk47H4U6bDBZmc0tKeb8dAVhrT+ST7iOzN8Y+qlbe8Q7472sLRc
         6jURpScn4hJd57bHCUMY3cpOSpS5126amwBTa5Bkt09SLa75FZMEF80ZoVmAxQXxe0qj
         yKz+MqRDEhV3uJrsO3TIVozg00RBYepV491dhn3g/G6gLZAbiSaD4MWj/+8aoU9TvPfx
         COu2tdgFtsz/me0zfVFvOZlpr+Lo7w7iAcxfhWq5hbUi18ib29pxZbDk175Lx/LiQAaD
         teKg==
X-Forwarded-Encrypted: i=1; AJvYcCXXKp1kW+WQnibaACQ5qOrBy2BvLPXHrvnBB4zqHXFS3IeLOuyPAGghA6IPGTjPAjh4ePg6U3RpViQEwGBAhWbGFw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwBNrg6jmAciVdTSXf3rZSbF6iFqPtO+g7gzcwp7++K8bvq8RjX
	uEftRUNnrYLpNKRj7Z87pUt0Bh5bCJjo4ImE3IYiGeqFGyd2qzi2QLHvhh/8/g==
X-Gm-Gg: ATEYQzyHIO6u6OJoUBXTuP3DtjXCaVH5M58qv8CnWNK8QUvrphr9sj+aMJ8Lu0eajaE
	aa0lao//2zZVvtdFasGJYUzsNtmygnKUXBPMMfxzTx0uLrlBeWc1XS+yRwYIA2E0OXpY/AB7Pn6
	BRqWEkL1EgzbvFiR9Ww+PxBIMEcce0VEWoMoPKBL67EoE7BKQjHGsk2tsh32STDNP/9bbVOdD87
	1Jl3i7tLVQvaAlZbQXCazbb7K3tmZmn6nNNhbwmY2X89i5vfDwgCxvLzhP/SNF+yRFrPg0/5AJA
	pPIZ1sLJ7aplWMobxlCWM+rqDvoD7Xli24va+6wfA1M99L71dtb6EbwUt1qYOyzJYhGGuDN5L0E
	KORKWjKFAk4P7EostxI0sgeKkcpF0Plj8NvxGsxTzN0qSeIVL2apX602TnUPVZxJAtRyjoth5R6
	u7JFuA3zKkoYJ3K0H2+aPZnLhRC5w9CByX8ZpZjKZOgxboBUk0gpyGNSQ=
X-Received: by 2002:a05:600c:314e:b0:485:3bc7:a21c with SMTP id 5b1f17b1804b1-4854b10ec37mr42037185e9.24.1773231110168;
        Wed, 11 Mar 2026 05:11:50 -0700 (PDT)
Received: from [192.168.2.122] (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854a3068cfsm19625105e9.8.2026.03.11.05.11.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 05:11:49 -0700 (PDT)
Message-ID: <e56d9829-1c7b-490e-a4ab-32826f883efd@gmail.com>
Date: Wed, 11 Mar 2026 13:11:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] python3-chardet: upgrade 5.2.0 -> 7.0.1
To: Jiaying.Song.CN@windriver.com, openembedded-core@lists.openembedded.org
References: <20260305074250.377829-1-jiaying.song.cn@windriver.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <20260305074250.377829-1-jiaying.song.cn@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 12:12:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232869

2026. 03. 05. 8:42 keltezéssel, Song, Jiaying (CN) via lists.openembedded.org írta:
> From: Jiaying Song <jiaying.song.cn@windriver.com>
>
> Major version upgrade with significant improvements:
> - License changed from LGPL-2.1-only to MIT

Please hold off on this until the license controversy is resolved.


