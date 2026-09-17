Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F709C982C1
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 07:06:08 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33793.1789628764848921363
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 00:06:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QTfceO0c;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c2790ccso269508f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 00:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789628763; x=1790233563; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NKS1x/j2G9FF7I3fqu/pg3JnrW6XwXN9O/rSP/rsoVY=;
        b=QTfceO0cDUQymwG7IAqca6PYByXGxUgIqeYOCcUjNUTaBMLAisYHhwtBupm6Vxh4r5
         RvSTc0M3Yc3kp9pGJTKuqcRzAuy8+fhaEMXIERC40xZSNiDktgLVpepGiJ3NKHa6UDmD
         bjKglOo8nFYquYi5yxI4rfZaFo7LPHGAQsze8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789628763; x=1790233563;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NKS1x/j2G9FF7I3fqu/pg3JnrW6XwXN9O/rSP/rsoVY=;
        b=EyTZ97HvYODIvOX8GOAx8jwTSFZkWaf0cjw40qs5SXw+uyCJ0iG37QzIozL/TIWuK8
         1pUEaWf6e59GudPDNl+q/11MOGT+XvlCRAX4gpK85QkYkqsvRdyBC//rTXDY0UjnwN4f
         TB8gILYRvpznXPASsPfl/NilCxUSvF4xlpRDyZFhSr6y9cwJrfmoWZ952I8Um0w+n/BC
         PdnAVwUSEJGvmmwjHgt5FUsCfUcffVLatNTiO9M3Imhg9cfZ+oUXg6/SuD035imJGlvS
         XEfwFdNNEw+9ut8N2fr5zjIhza+gjEiGksML2F+fPFdISsuxN+P7p72oT0CoCWLuG/SE
         DiBA==
X-Forwarded-Encrypted: i=1; AKwUvBybqD58s+OUioSj3C70ZT0yMAS4V16NNAJzDfkvTfzazP7x0P9kuovp1sDQL6QHOMgNLwdy/ZuJ+mYrKDtqKGHCPA==@lists.openembedded.org
X-Gm-Message-State: AFuF++nnxhfR5gyXhvZM4GEk56UiZlHJymCpSrQrD+9toWrbaGVjVaTM
	TWtSCo/VSKSMdyKJLs9NgYn65cKvAQR9T2/25GPsuXX5DG8/NYkVUuN7VvE2tdFIiaU=
X-Gm-Gg: AYBFou2VGAC7mwpwAuG6jk3/pHvnyesiytf2c/uVbMKcog3GL/4fKjIWEHADkEyT/nA
	lbo54lRxl0bCe7mij8u7cGtMneD938LRJJwBk/dEs0QkT1D+sfIdJS3PE3kV/Y7Z20/jZUm/ODD
	PCrR8lrgWVW/EbinuaRjeT/6kM1VA5kHb2tLcB1wjhxJB9SXetJtJnp8c4y2AmeEoJjvGE5Y+rj
	WKxgWuufumtnapSbOSrav6rc0AQRrB1IgZ1dh2CMRuUzFzNOkRzt81arOygUarCxaq1/hgJs4Oe
	k9li6DrH7CMbSaEC32ME3bqH7iuHFTBAOhs9BWuy4+zYcvzIPgniqA2S38XKlBodWqJoRofAUzn
	dyX6EnhMuFE44BvMfd6x+q7OuWyPBdRIjzRfQDtAU7kj4clOK/k0PmU6JsZTIEm/mFH9wfVeF2k
	/tBLd/w3nt6iENckyYrr1U4gZdsiX2M5my/tLlLRyetGQIO69LOUBW2mhP0Z3TaJkFs6cM79Od8
	4nvT88kLaZ2Qd2GfHOm3SIhC4oKvu6m5kSNS/Dt0tmHp6DMLr4A7Nhq0Ql8m2M=
X-Received: by 2002:a05:6000:1868:b0:487:980:b42c with SMTP id ffacd0b85a97d-4870cef14b3mr11171768f8f.11.1789628762786;
        Thu, 17 Sep 2026 00:06:02 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf344fcsm13570016f8f.26.2026.09.17.00.06.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 00:06:02 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Sep 2026 09:06:02 +0200
Message-Id: <DLHEG7H935N8.2JKMAZRCTBS17@smile.fr>
To: <tgamblin@baylibre.com>, <Harish.Sadineni@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [wrynose][PATCH] qemuriscv.inc: use fw_dynamic.elf as
 BIOS when KERNEL_DEBUG is enabled
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <Randy.MacLeod@windriver.com>, <Sundeep.Kokkonda@windriver.com>
X-Mailer: aerc 0.20.0
References: <20260916121517.1513695-1-Harish.Sadineni@windriver.com>
 <DLH071QT0TBB.7KZL5MFA90WQ@baylibre.com>
In-Reply-To: <DLH071QT0TBB.7KZL5MFA90WQ@baylibre.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 07:06:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246026

On Wed Sep 16, 2026 at 9:55 PM CEST, Trevor Gamblin via lists.openembedded.=
org wrote:
> On Wed Sep 16, 2026 at 8:15 AM EDT, Harish.Sadineni wrote:
>> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>>
>> QEMU RISC-V hangs (qemu hang-up) when using fw_jump.elf as the
>> default BIOS while kernel debugging is enabled. This has been
>> observed with the 6.18 kernel (exact version where it was
>> introduced is not known).
>>
>> As a workaround, switch to fw_dynamic.elf when KERNEL_DEBUG is
>> enabled, which avoids the hang and works correctly with debug
>> builds. The default behaviour is unchanged and continues to use
>> fw_jump.elf when KERNEL_DEBUG is not set.
>
> It'd be good to understand exactly why this doesn't work and what changed
> upstream. I'm looking into it in a local checkout, but I probably won't h=
ave an
> answer for a day or two.

Thanks Trevor!

Harish, this patch is for master isn't it?
If that's the case, would you mind resending it witout the [wrynose] tag
so it can be picked-up there?

Thanks!

>
> Trevor
>>
>> [YOCTO #16409]
FYI, I have not seen this specific error on wrynose (kernel 6.18).

>>
>> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
>> ---
>>  meta/conf/machine/include/riscv/qemuriscv.inc | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)

Regards,
--=20
Yoann Congal
Smile ECS


