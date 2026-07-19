Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A1A2C4450A
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 15:12:35 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6951.1784473947599347113
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 08:12:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OFyiVbYX;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49558ce01afso4194555e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 08:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784473946; x=1785078746; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ki3DiITsDziQJbz3mE0RpcnOySZfUcXWk/FELfnab3M=;
        b=OFyiVbYX9D8ZQ9SeEdS+PglytbkpSvRqO8gMXx6dpvFdv3xiDPg7u+F1Buuph3z2Hy
         LCYQLvBj6GICHW12blfuHsMqs0z0NdjLA2XGytGARzlXrrKaR79+g0XFqN7OfCjc6JZF
         OuEqb1FVi8nULzfYJ+4Qqs+ETPn/wayjTxDKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784473946; x=1785078746;
        h=in-reply-to:references:from:subject:to:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ki3DiITsDziQJbz3mE0RpcnOySZfUcXWk/FELfnab3M=;
        b=cFPEp+fyAsQCn2uMuw9c+2GfYmpuhfOHNiZDmR7TkZKR+GYzBWvGw0puJ9s2C5iqs4
         7vrcuUX0QG80ZAilEP/IsUCizDRnUjlw5DoqC2YqP/iE8Xafs+0KBZxif0MIV1cC2RGL
         S19ueQVMcqE9C63EZU+zxvws/lTiXPkfaxXV4Ke7LL8xqqlfZVQFO3/m+tsPzkHxO7bJ
         jO6jLPvacyucahqBsr7Usn41ywxywJPWWSOe2HRneEr6s4OIwMytvdsjhe9eO7nEDznV
         N41wCj0L3aPxE3/6CKiaqknwtuJg76UtZML1LoDzrGGPFg4hgDkyu2IHQKec3SzMv2HI
         i6KQ==
X-Forwarded-Encrypted: i=1; AHgh+RrKc63XRXIWlcBba3bCcS52LrFCzuS5sb/IvVhh0sOY5+nnQiq2twW25wkUIe23WtiJC+2Jbomma9JcLB686/8/Vg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxHycndZ45KMQdjwWiLLSB6AccqfGVncP61cop9W+S6c3vjOAjj
	dpgmjQ6U8JZqtMlZTuiVuZDURPuNyB6bFAQFlMT5oufEAePQWy0xXuevn63I3A3yi1k=
X-Gm-Gg: AfdE7cmff6vVHhheLVamPInWrWFpVRlOPbZ+UC8V0zWTW6w+jzAqPcRBacWxJh07jXJ
	R36wpdgrbpliWA+wcoAyw0nuTOt+//uhPovpy2S/bHSCiwEgLTpJFAPeEVg+wvmOdOsmxdhCO5S
	iqyYDZN6feVU5UPwaHAJlb9FpxvEl7TAJg9FoCef5E5x+HEoKwseKyqijA/4UP/R2rRp2TLE73B
	rJfivPNayS8VCQbBV8YQG/keltaB4adcMzy5E+G6HJsThDF/pv2RUH186IXZR55w88j0fKPYLoF
	dxRiaQ/druwpFI+eE0UCbqZoilgw6hPBamOgk0vTwUTTF6O+SbhPFTvbDNnS/YqaZwHsfCDhcho
	P9wlO8AGp1en4GC8gDx4UJwryeRkxX8SZX/7vakjAyDQh8rD/aX2j75ChL1E6j3nVOh1rwwP6zg
	QGHk9ysdnUgFd9oo6A5LHbQga908whbyoUoCpfhG/6rxt6veeiI3Ppq7+C2MY2Xeozreo3qQq6k
	iHwQQ==
X-Received: by 2002:a05:600c:4c2a:b0:493:c535:3934 with SMTP id 5b1f17b1804b1-4954a51fc5fmr87145815e9.36.1784473945852;
        Sun, 19 Jul 2026 08:12:25 -0700 (PDT)
Received: from localhost (2a01cb001331aa00e37f7eb174d0a6c8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:e37f:7eb1:74d0:a6c8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63edda29sm22145395f8f.32.2026.07.19.08.12.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 08:12:25 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jul 2026 17:12:25 +0200
Message-Id: <DK2N7XBD8QIZ.33JH3NJ89PGYI@smile.fr>
To: <sudumbha@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [wrynose] [PATCH 5/6] curl: fix CVE-2026-6429
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260629131453.1077612-1-adongare@cisco.com>
 <20260629131453.1077612-5-adongare@cisco.com>
 <DJOU3MGL8GSH.27D0R685LL2P1@smile.fr>
 <577721.1783577282244784131@lists.openembedded.org>
In-Reply-To: <577721.1783577282244784131@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 15:12:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241290

On Thu Jul 9, 2026 at 8:08 AM CEST, Sudhir Dumbhare via lists.openembedded.=
org wrote:
> Hi Yoann,
> Thank you for the review.
>
> I am working on same and will submit an updated patch series.
>
> Thanks & Regards,
> Sudhir

Gentle ping for a v2 of this series. It holds a patch on scarthgap.

Regards,
--=20
Yoann Congal
Smile ECS


