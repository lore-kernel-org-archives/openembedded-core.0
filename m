Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 288F0C61DB2
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 11:25:51 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.8139.1749813943599715806
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 04:25:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nck1M5nh;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6fb0eb0f0fbso19306076d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 04:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749813942; x=1750418742; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GU9NAgyWs3DavdtWImqmX5d6P2Vess/q5p/pbnZfwH4=;
        b=nck1M5nhtl4fSs43rsQzTeujX9uAhA+G2NR8ugU/M/iUcTAQJqogdUKkqNTxfScolL
         wITsbxjVhHKnZ/YeWRpTUGsqUyQoaHNa5mIDbv48+E6GOCDhSEGgdLUtv6MUKjb0V6re
         ciljSOtexSuejRLVDomEzEE3O8x8OfgaSfQTbudzi7AWi/9yjMad1Kg3zmDMyn98NzFM
         7C/SpFdzVu5WsYjjFoNPW2xkntGaygrPlHDBi68U402P1d9UYOGkFu8XVFu167D/X8ax
         UJj+o9wNZNiGPhmhhLsxSWgiDahNsWn1vaKIyjQ2jU15uHQO6tqRHmacn5QYs4YsVUt4
         GwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749813942; x=1750418742;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GU9NAgyWs3DavdtWImqmX5d6P2Vess/q5p/pbnZfwH4=;
        b=W3BtaDaK7xyQJZ62aFKP4Ebj2CmmOeE1RNqaia7NP/dJyO/3jsfyDqsACStFhHeRap
         W1oRojGw15AEP3kifVKV0IZBoU2uwNwZZCI/K5gvr+HtKk7tw0b7N1bgHgAa1FrJktPp
         0CMAErwKeDS8IfRF11GkNaiIzilBhARuGd/Qh9aQm9VHiCoGIV7mO9w4MIoeuGG2ELgC
         8Aow04qFUN9bLxXAQ1yqH8ZE3MBT1qzlHVfKXNqL0HKIiLf+UXuBLdU2D5N1llI48paA
         FNwtaupuHcu8W3y9Puxr7Tit35zpoRSJII1JQ6tplUDQAnkBwzCxZFBDnAqkAp2awVZz
         I/Rg==
X-Gm-Message-State: AOJu0YxjrxE4e4Pl1ZjU55pJbcjgpxzdbPlfHUA6IsBBIblZ+/BUAZM0
	62sJmVFTCO7H71EcuQLsv3/WKqelo3n//k9STofSmBwiH6uldkFmj9IPCHjCCVk4NpqZF5Vl8Ht
	cXJo9O9V/DQXPx1tx6V1SY5NJaKeQCyM=
X-Gm-Gg: ASbGncspYJN1pVRN9rJoBVLnZCtgHRdmVAYsjM6QJxG0yhnhdva4CBKZfr/ZXY9ZCA9
	d/eqUPOlnanNtwlTStkBLqp2qUpeU3HKlEOX8BzseVJy7r2GBxJSdQFYF59Tf+CbkTWfTaPPy2D
	XlVrLx5lBz+9AkBMWArBJ3AoOP4PEZ/q8EWEPCqI25h+zjTKmxPkb/aP5B9iQs3l3hGLuDNFVd3
	Od2vg==
X-Google-Smtp-Source: AGHT+IEy6pgbPMPQoFy/2En4eHnDfs51nWp21nt8vxKgVPMtUIgrYLXQvwrXVDicE+lqCiF98AgQ7Q4ygCFoNZn44Aw=
X-Received: by 2002:ad4:4eaa:0:b0:6fb:2493:93b2 with SMTP id
 6a1803df08f44-6fb45da8755mr3591086d6.11.1749813939936; Fri, 13 Jun 2025
 04:25:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250610094400.1653931-1-alex.kanavin@gmail.com> <9708ea34-8a8c-4704-951c-d4e8b0973fc7@gmail.com>
In-Reply-To: <9708ea34-8a8c-4704-951c-d4e8b0973fc7@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 13 Jun 2025 13:25:28 +0200
X-Gm-Features: AX0GCFvkoaIE-nP0a2CbOyjF2PVuwlu_vvay3mFsuEDbJIH0Rwao3VFdf2N-Ekc
Message-ID: <CANNYZj-hVH+RgfGYVekiCNnGU5-rNJmWp-XZZKx+g_a4Tb=7JA@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 1/9] bitbake.conf: set BB_GIT_DEFAULT_DESTSUFFIX
 to match default S value
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 11:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218590

On Wed, 11 Jun 2025 at 20:35, Gyorgy Sarvari <skandigraun@gmail.com> wrote:
> Possibly the recipes would need more modifications than this, especially
> the ones using default ${S} (maybe?).
>
> I tried to apply it on the current master and build some base recipes in
> a clean build dir. I tried to build git recipe (was curious how it
> behaves). First gnu-config-native failed to install, as it couldn't find
> some files due to the move. I fixed that, but right after pkgconfig and
> binutils failed to patch - the src is in .../sources/git folder, but it
> is trying to patch in .../sources/${PN}-${PV}.
>
> Or am I missing something?

I just realized: did you take the necessary bitbake patch?

https://patchwork.yoctoproject.org/project/bitbake/patch/20250610094334.1653567-1-alex.kanavin@gmail.com/

Alex

