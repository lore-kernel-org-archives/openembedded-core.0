Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56188CA5FD4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 10:57:55 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8831.1790938657190039362
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 03:57:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=V89OfQ9C;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ffbd83a92so50818685e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 03:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790938655; x=1791543455; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oy/xTZJsv/tjk2Vted4zUnLCMxXmRq3sEAEBRzG3syQ=;
        b=V89OfQ9C5tl9AiaH3sHqGPXV+ozSwjd5GeQijE86ERoHPYPX2pEp+s0wwTQwNshcJ+
         CVfnV+M9SkM4+LvXze98hWZb32CrMZtIpoIzmnakAhtBnG/14PhU5RxnWXdTKf4vhnpI
         HW3BH0uq/IJd4F+qNZWeC43659ssTzs69S06k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790938655; x=1791543455;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oy/xTZJsv/tjk2Vted4zUnLCMxXmRq3sEAEBRzG3syQ=;
        b=mjdYAD+1TO46ggZUm4/ZIFIZgCIPEAGPgSXsQyYWk8V9zKtdbPacEgdZ5YEurEZWuk
         1cxy9r8PpHcuNCJFKf1Z6hhgYT/tdwvIxcPf58kzg5XxcejHoDr5H/mTpj/D5pl2bf6D
         ZaPPicOpp9Pfsmofd/gYr7jANu+t3hLyFYpjV53kiPSVv6C74cnVF3csovXjxmdBKVT9
         d1r1k4d1KVCNhO1Kg+c5X1FLEvIoWLfWOCmF5iWbLsVwMGlJh40kJOFg0k/uBb3E0N1T
         /JWI6GPE/PTveGcdJCe7uiCH6zFvZH3A56QV+O6FXMyXaLE4tMiFEvbclqfVsuezG5hp
         iS6w==
X-Forwarded-Encrypted: i=1; AKwUvBxn/OWNz6GRhMFMTSZNqsZV7ouxvZdZmWYQNKDHpx+fPinjiiS9nPYieppUs8AQ7ap7/W9foZ9uISGlbaN3dPn2ug==@lists.openembedded.org
X-Gm-Message-State: AFuF++ldw4lhnGo8gzzkN/9LxwBEQLu7iJcShQQVMfgLJHaUDf/kH/Il
	id1WLXNKa5scNvIcwPNKMgXBsugy0d1MLJORdKlEiZPeHPGzizZvQKqrObxr3/1qVBY=
X-Gm-Gg: AYBFou3//7ZqYJWtLDOQzEBLSaXo+TqwWh+m8jBBWpuCU5EE/U/lDkeKWjf9HVEpzro
	tTUuJR41Xm4g9m63AtzZiZ8qFYyVrvehUpAFK5byGKujOvRiuzCGHGns2kAbiuyCbaoKC2/YX6C
	dwMUEykEy5p54CoWQhRUN2J1l05DuomJBNg+8dMTkTD79WbMsBRqPKbDvdA7kmvKoMYVqPmNFE3
	upXI/dxU5Clo30XnMwrVsaFMWpGHvnAKQiLZbXAti6NICUXE/U0MfDVjecfQtCUBfE38YbRJoXX
	taGOLxkmz8A1b6dyriwKyGj1h9nNxh/513Z0tE8k2jBn23OcnyHX03PtLYTsY9RxGFLvqMhHI2C
	uTmk+Hvlq46zOiKHhskvdco704IT7+qhlZ4sfTWAhHkw5oof12FQ0KjOJXqQ11Su9lGh2ADpWVh
	DqvD5Fd11uHh4JsV0D8zdvhvDuMUXU3gX44CSJsngaWoR+yZjVn7eVHMI4r/GlTSGy92tV8SukT
	BI/SLq03+DQw+qvCcggVniF1e7bQTidG8V3i9un2v22+94/MzbciTBz3ckiU2Z8nZaCRB2w
X-Received: by 2002:a05:600d:6409:10b0:49f:dcc8:c735 with SMTP id 5b1f17b1804b1-4a02758ee31mr30830865e9.18.1790938655350;
        Fri, 02 Oct 2026 03:57:35 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff2280csm41745255e9.4.2026.10.02.03.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 03:57:35 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 12:57:34 +0200
Message-Id: <DLUARNUI60ZT.162AW5MJ2UWAE@smile.fr>
To: <hthakar@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH 1/8] libxml2: Fix CVE-2026-86137
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>
X-Mailer: aerc 0.20.0
References: <20260929041836.2217090-1-hthakar@cisco.com>
In-Reply-To: <20260929041836.2217090-1-hthakar@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 10:57:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247104

On Tue Sep 29, 2026 at 6:18 AM CEST, Hetvi Thakar -X (hthakar - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> This patch applies the upstream fix as referenced in [2],
> using the commit shown in [1].
>
> [1] https://github.com/GNOME/libxml2/commit/76fe08d97de88bfaef2f7d5cd27f1=
1954cc5bee2
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-86137
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>

Hello,

Note that a similar series was already sent here:
[OE-core][scarthgap][PATCH 1/6] libxml2: Security Fix for CVE-2026-86137
https://lore.kernel.org/all/20260910200329.842463-1-sdoshi@mvista.com/#t

I would have prefered that you improve upon it instead of creating a
fully new one (with changelogs).

That said, since this one does not break ptests I'll continue reviewing
it...

Regards,
--=20
Yoann Congal
Smile ECS


