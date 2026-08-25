Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D27C2C5DF94
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 08:52:18 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17487.1787647929717659102
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 01:52:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=S28VAb4+;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-482e067e908so33737f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 01:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787647928; x=1788252728; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QyIj9aT7AgUf2TVu0kW2WG9zE/76jedDgc/Ta+rsxTY=;
        b=S28VAb4+64v+OaXaDqYvhOF097Fh6bX/VgKMtNbU9F5jVDF33ARB8KZVu2pGY32NJr
         yOiENixjAVfA1PBmAL6WWP71VocEMqdYe+sz2mnmDxI8jq2onWBEXlxmD1HcRYv5XQ44
         AYHhzOgjYTTyBsHiIZ9t5+w8GfnneVhFAKc8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787647928; x=1788252728;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QyIj9aT7AgUf2TVu0kW2WG9zE/76jedDgc/Ta+rsxTY=;
        b=I/frR0o1LzMt1Jgdt1ifoDhVuNT4EomPuf+3OIX/gqhw+zgUpvYF4Rl8bUn3M7mVdT
         MIH8iGXSwS6ALGzfl4Ym6E/4lu7CFFrvnSOB8AeZKLuISkGJwEYMG0KqEQXMqNH+3fmy
         aTR24QzsGyBf8Z0pTbWLWGm1HU/RBJ/Tqw8uxdZGQdpypjOTYp6rPsMPHPfdLDMFybhZ
         LcMnDQavdxi1YcXFsEmU02HyHZW/AA5Yk534O0wcQ3IJc6NL9K1KnpBMo6bRu5TK8vFh
         F1HRytdp2Nmvi+qIlLx1qOJQxGAPCZ3eBg7GdvyAcjZX/7zlexCKp6IeEQrYyYaaFogM
         YA0g==
X-Forwarded-Encrypted: i=1; AHgh+RoqktRnLb4jT64rxjIAU8yM/k65C52SjYSGo28Rbu+8ojEWUmzztmGIOzYXmC6xNDILwCkv+vRWdM1AXe8QiiFZGw==@lists.openembedded.org
X-Gm-Message-State: AFuF++koVYFVJxXo6znk8AgZyc6EwULzXlUfY1zp7rwM1gpWfGcEmzc5
	vwVjXa5CK9q1vhkp6rgaE+1ZQeQ2E3MP+O9ONXGyAze7GYuajlBYJY+Hhk4RPcE1t9bLpILjZuf
	zDBaB/Yo=
X-Gm-Gg: AR+sD10UNNPobvO8yH4h71v8TD7D+uv8msOEmeju4KGOeOH3uPgqmgusLNkeoh3YApp
	OzC7Qu/xuMrJIixav1FyslJDrqjEeheSZLfN/IbKqvTveYZDndjNcWn/OvoXhC/1s8aj/2fsbQh
	1ids0y3TYdTS5sSMnESisZIL41K0H6CpLUWd8WEVyBT9jgOEhWEYYGkj54ui/L1RKKKypPK3Rlv
	x5f5PclzODB5ScoE7ht0jNpDwHZVNWkLVeJTpd3SQjbyIDgxatSiNfSIbkhiYflwd7MsGy22LK8
	bm20qTKj/jCz3Q0vLLRtt/yKafMddR1TYLO8JO09UwFPv6qr12P8kl655meJp0gZa7loPB3i8q7
	9NFNih+zPWD9hDg/PfpByhjq7Z1TGfUzfM3VQeSv7rM/6+GgJt+sjmkNuaw2x4u22LReUI5AfNn
	DtwGM5rxoLvjq5kbwXKHdbH5jTr7uP+2fuc0X+hlph978lRse/HBMiYkqsD5xo9BHnB7m8tq3Ys
	Y0P388h7thuhwWaVO+f5Dip+dK6ijvxiG0WZJA8XHjVj2AI
X-Received: by 2002:a05:6000:40c7:b0:47f:ec8a:214f with SMTP id ffacd0b85a97d-482c81c0383mr26843857f8f.15.1787647927890;
        Tue, 25 Aug 2026 01:52:07 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9b69d7dsm10777917f8f.4.2026.08.25.01.52.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 01:52:07 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Aug 2026 10:52:07 +0200
Message-Id: <DKXWAWIH0YAV.28SIM2DAOM5WR@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH] python3-pyasn1: Fix for
 CVE-2026-30922
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>, <hprajapati@mvista.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260715055355.20351-1-hprajapati@mvista.com>
 <DK187LU4ZQWP.1A0SLMXGHL48Y@smile.fr>
In-Reply-To: <DK187LU4ZQWP.1A0SLMXGHL48Y@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 08:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244213

On Sat Jul 18, 2026 at 1:14 AM CEST, Yoann Congal wrote:
> On Wed Jul 15, 2026 at 7:53 AM CEST, Hitendra Prajapati via lists.openemb=
edded.org wrote:
>> Pick patch from [1] also mentioned at Debian report in [2]
>>
>> [1] https://github.com/pyasn1/pyasn1/commit/25ad481c19fdb006e20485ef3fc2=
e5b3eff30ef0
>> [2] https://security-tracker.debian.org/tracker/CVE-2026-30922
>>
>> References:
>> https://nvd.nist.gov/vuln/detail/CVE-2026-30922
>>
>> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
>
> Hello,
>
> This patch is included in pyasn1 0.6.3 that look applicable on stable.
> Can you double check and tell me if I can cherry-pick
> https://git.openembedded.org/openembedded-core/commit/?id=3Da82592f0a7d
> instead?
>
> Thanks!

Hello,

Gentle ping for the above

Regards,
--=20
Yoann Congal
Smile ECS


