Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89B0BC44501
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 08:25:04 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8324.1783671896826880118
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 01:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=LDvGps+H;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493ece78b0cso4772395e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 01:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783671895; x=1784276695; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KwfUAX10cnR3TpwnY1uDkmiWA+BhucTt63g7h2qApGc=;
        b=LDvGps+Ht07mOUe6HgIHt6/uY+NuJ8icstInPDphKjk6xnMi80U5SbnWp4rtD6XQ4p
         6UY9cJ3C8dO+xQSxnAyUiEpqQlNLcNiNoXgPk1GIDi02+NWmOa4OsO32NqwK7ivXKqbU
         qhyucweksyPAvtgBgyDAScP7+oNSbxk/1KDI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783671895; x=1784276695;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KwfUAX10cnR3TpwnY1uDkmiWA+BhucTt63g7h2qApGc=;
        b=sqZQzDGPa+rjeALqiz87gx8/Xi0jvtff5/OTj4Gkmny2KS767aNH7TNhZrgwwfNHwR
         jX4vPV/XVZgD1YlrZFIchbcKsIRvYPajIbPJ4QHptD8pA8BxP3VKv6zb0C3b7ll/KInN
         w7edKF3tt8W0peZ19eXW9w2Wsl6sylveP69W6d/SOs2Nmpz41UjBPo4+Lec7VaQ4zODe
         BRxaN5w3YsPdJ5YCXhFfAKPJjU+wYGIod2Hm/Y76D0IXWflMv5SjVdAOgyKs0Ar5/UlV
         reIL4eoTSTQvD97J3tSzbbfnbUJIjogKGKJFwh7bELm/Dw9dGxf2xwAkzJqnZiGcw3bG
         oRSg==
X-Forwarded-Encrypted: i=1; AHgh+RpphtZ9fdBZY/4dXuDmPr9dg59443bdwsRmL2TLuNolXvFxGxLC0+YHhJPPxM6yJ5nf7Az3UEBzno+DDgy21rzlxw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwYKUi44Iqg02N1kwmys5TDaARJLbLXSOXaGXmyEcFcrh5El0Et
	r3J6A1f9C7shiOsc29/tCiK8H3KobjJEsKwjjjaa1MFg9hPlJnkIJELIYh3admmLCc9z/oOzybk
	t+PVEHBg=
X-Gm-Gg: AfdE7cljx7Hbe6PmVhQ3G845kP5UKgP4OGKs94SXm2T+X0cjx/LMxJRThJ5XlynSr5K
	cF7uUCJ6WFKT6QnSOfgsZfj08E8s0XoQouHRpZ4afZUGtTTaZklzU+dobX5Ng8tWhtaBA80AKfP
	YysRLrTTrn7jJLden7+S0fnisdnstQSJf2xFZYo7xalyrtrmTR3mkOtYqrthlecwpsOqEy8mfT3
	yKaam9yW3I3vDjUPs5unx+aGrJpS6zcfxoShPOyy1kQ0g/8qsw4IlR6p7vqhr98Ix2kNxwWYQQ6
	tJqsWidjIitR3fWUMIQcuXxUA2FwDI16bjTrHxtjZhdEAWMBYVSchiYygibdma+Ouqx2tMkQ542
	Yxpog4+gH8Qq7VYmN1lD2q72CE8j2UVhdHOtrhyuYlQ2VN9fRhLFN4aQ/CpdttIkl03KORTIM9v
	OA1nXtISexRQcno3GS93R/aXLv0ca08liyaEku8gTdZwGP7AQrCmzxMIDYRrR4kQen/JERBdWoP
	+tBWg==
X-Received: by 2002:a05:600c:8486:b0:493:e365:7630 with SMTP id 5b1f17b1804b1-493e6844d66mr133831695e9.14.1783671895084;
        Fri, 10 Jul 2026 01:24:55 -0700 (PDT)
Received: from localhost (2a01cb001331aa005f82d0ccbe50ecf8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:5f82:d0cc:be50:ecf8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f16cfsm123943585e9.12.2026.07.10.01.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 01:24:54 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Jul 2026 10:24:54 +0200
Message-Id: <DJUQX06FYPCV.2LAKUKFLL6FO7@smile.fr>
To: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3: add back Co-authored-by in CVE-2026-11972
 patch
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <olivier.benjamin@bootlin.com>, <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.20.0
References: <20260710-fix-cves-python-master-fix-v1-1-653636ec864b@bootlin.com>
In-Reply-To: <20260710-fix-cves-python-master-fix-v1-1-653636ec864b@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 08:25:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240617

On Fri Jul 10, 2026 at 9:48 AM CEST, Benjamin Robin (Schneider Electric) wr=
ote:
> It had been deleted by mistake due to a lack of knowledge regarding how
> to handle it.
>
> Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootli=
n.com>

Thanks Benjamin, I really appreciate the follow-up :)
--=20
Yoann Congal
Smile ECS


