Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F530C44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 23:48:32 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13143.1784764110116876587
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 16:48:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=euJGjOOb;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f633e6058so13820f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 16:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784764108; x=1785368908; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UPo7+2Lua6p5bcGCxCcr7vA2iwucTRPUDfTACEUV8T0=;
        b=euJGjOObYkUhEvajxoynwbi5Z0jyLb0X8uR3z4JJo1s7f6o7NI7HBFJKlY7lzE2Clp
         naFZql044Y7RwET+XeHn3yxhzF4VSuw4vJESLJ5iVDfBzF8+jO9k5i5k9IcVrS7U1vQ6
         E95A++Wg9Ra+DYWo0oF1t6Qu9AA+4Rd8jvtKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784764108; x=1785368908;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UPo7+2Lua6p5bcGCxCcr7vA2iwucTRPUDfTACEUV8T0=;
        b=l3uSZlq3zpYRrBU1cTlj2gDQOfk4ZGrZ8IROKihU7JgXjnt1uMA+fyAnXXQKKbBcK/
         B/JOC3Wv6kVL+DGhySxws8yBGnMNlbAIIZi1rVNEaV95BKyiDgdxNjMKKdH5ZOCnT+/m
         QOAogrvHTf79id8gmE/qZp1/Ty70J9nSUuEywh4j8ErJFj1lD3Gblu/bGTjnTkXrmV2c
         6/AdyvbKDPXN3eErdvou5DlHqNWfvVffA46mASA+v7wPbHrabHJ9gvMRZ/2tdemQVADU
         DhG8NOIAfIpbwBvd0UWFvrW8QN02ZIPRv1JHwn+GLW8E+yTqivLB+qBj3ezocBQQKJOz
         FLmA==
X-Forwarded-Encrypted: i=1; AHgh+Ro8AlMODk06IOuSYUk5nI/oPhieVlKKeqkYDyK6MS22ZBlkDm6BGzHBBFU10ZngqKXbXsvk5SoN5uGb/GVFN5cH2Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzIBfnUJrBEbhLh3RMm91aOoI/0BOkJu6teUzPqpixNH9GGEBqi
	/jSms5zWCxE4fy4DkA0ybjRXkHwkVfUHipMhtrZv3jddO5UBu1QrhVpfxipfiqPHSw0=
X-Gm-Gg: AR+sD11+DMB5JpLKum784cVaxiAIStLPBVPBWPZA0Ab8I9SwMySaghoJrOVES7gTRHF
	DmE2OjiNhIgMJeTDZ9dWhVamjAa7aZVjn4UANBcS4E0qV/5jzII9C/gnIUEA1eM0yCc9EkdMhVK
	t+D0ssBSHl0CW+zZAffD7Mqw/yPVYtAA12b/nim2TWRqsRwiB6FCPFjICFYi2UOFHBHIjCDAqqr
	KnU2D8pwM5FQNH4b7z5RJksSHFfOLnqKK1lG6N31NBsEj7ZsEBMlcD/t8SJ29Rqs9EwXUveHxIk
	5PZ/QVuFRsI67jQ59UNW1aHa45/Khct5dR/y20AQymOpGojJxcH7GxxcBkjDeIMjSOKhWXU3ggQ
	2B3JiTjsDckBlvDi9xJRluzhtezhWcZdRNCCTxVg6hxYAnod6NrpNaEePXp1KS5L0lPflKJ9dPh
	epTHodtZBtF5Il/rpz0oK3vIfyhpTAFCmZ+OD/FRDdvvd6qsly1v5eCDwu9fKTHmLmmQ==
X-Received: by 2002:a05:6000:4287:b0:47f:815c:2614 with SMTP id ffacd0b85a97d-47f8d756636mr974191f8f.33.1784764108221;
        Wed, 22 Jul 2026 16:48:28 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c631fdsm9838195f8f.28.2026.07.22.16.48.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 16:48:27 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Jul 2026 01:48:27 +0200
Message-Id: <DK5I2O2GSFJZ.1NXCKZ69U3D5M@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 01/13] vim: Security Fix for
 CVE-2026-28422
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <sdoshi@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260722201905.491897-1-sdoshi@mvista.com>
In-Reply-To: <20260722201905.491897-1-sdoshi@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 23:48:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241764

On Wed Jul 22, 2026 at 10:18 PM CEST, Siddharth Doshi via lists.openembedde=
d.org wrote:
> From: Siddharth Doshi <sdoshi@mvista.com>
>
> Picking patch as per [1], and same patch is mentioned in [2]
>
> References:
> [1] https://nvd.nist.gov/vuln/detail/CVE-2026-28422
> [2] https://security-tracker.debian.org/tracker/CVE-2026-28422
>
> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> ---
>  .../vim/files/CVE-2026-28422.patch            | 44 +++++++++++++++++++
>  meta/recipes-support/vim/vim.inc              |  1 +
>  2 files changed, 45 insertions(+)
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-28422.patch

Hello,

That series fails to apply on the latest scarthgap and there is at least
a do_patch failure when I resolve the conflict.

Can you rebase and send a v2?

Thanks!
--=20
Yoann Congal
Smile ECS


