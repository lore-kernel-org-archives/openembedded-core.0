Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB36C4453A
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 17:41:32 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5845.1784742085151285585
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 10:41:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JO0RWQi7;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49555a0e68bso22029205e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784742083; x=1785346883; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UiPpBUpBnZ521yMyfBccahmCBnop4tWG/GqJyoHhW/I=;
        b=JO0RWQi7IheWDatNp9z7UKQcFa2GTD1rRPj/+sEiKpNoLIYhSKymUHSOFze70+Rb+Y
         hHS1fIzl4Y6vgoOKKiHAzatH5MVdM8w6MYGfu+LruZDjJWDix/oUMM0btCDiRNxK4dZe
         MEvbI6qAKCs5l6hZJJqLkSWalZ8YLynIM891Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784742083; x=1785346883;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UiPpBUpBnZ521yMyfBccahmCBnop4tWG/GqJyoHhW/I=;
        b=PMssSf92QZlIp8BjoiwDJchv4gSJTxadEK3b8mt4amVmbR0ai5HRvulhImzn82312H
         sPnT0/M8WG20EU8svKAafK2cpU/X8G4m0thpFsmpC+fcht2OpLl2wkWjQiJhtlQVKbjv
         IJVsra5w+LqYPyfnQ51E1ud0s7rkYZlVFosRjNR+HzlxdTxYEO+c26dEqV/e+NC9qdNB
         vZjdcgVT8pzBeNZsVynlDztfwapAI04YUNWBj7X8cEKnQM3/IvqmlFGXarhoXCjed8tZ
         tkpH1vcB2HXGtoAuN+8FzndBIOezbHqygk9F0e9OTXeUHq++ikX0bihMsIXctiknk56O
         Gamw==
X-Forwarded-Encrypted: i=1; AHgh+RqKMKpU+AaathXzRpscPls3ynL5Q5bMtYCBSWwyRnZ9WCbdmlARxtiy1hGfYieS4+TaZp1dI5ndeAi3HBGDIYgvHQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw+P1q20xLQhBbp26C01gXP+Z9bEYGrKLnSnK/kCPIk/hWFlTga
	WYJrMtaQE+kGg8qodudUDNP+oezt2mYcalPmmbXSTr2qGhBp/lf9NXwYaXVaE97Eq8k=
X-Gm-Gg: AR+sD11It+QMkAnakz17ufCls3pTAbp2PX0gkOQmIyyNp0/zQKcnO2s/Fyu+x6u2Mws
	zBreI76Er9tg0oNiXckpE9KdBWURU5ZG4tToxpH/zu2csDUhi2FZBCuTIPUxedz82ck2zj59XFW
	tzDcIMu59G7VvGpoFj+Nef6NNxP7ItOUlskjUFAy2SO7oRF39Yk7iGcWnSmkJfFoMszk2HwvrRx
	4jkOtdYfK6Aylev7RVbm62Kt0rItlJ5GBodDz75YsaMbKm66mIBXkfmUXJnr+Adx1XUA1MaSgSB
	8b0RPC+9fEz5K6SgbO3HZU7SLlY+aeB29GB7DxEg3jAvmdm3r9tmTVEZDkgH13jvxqYcKpqJdAs
	bcZ23LIBofUnJ5q113x8s7PpmOB6dZU0aWF++cYmMpxlgCSMo3jUdu1yqPVp0e/hwiag7ctKzgY
	I9pOEthzMe3+kN3yb1MFV57xOaihr5eQ927Mc8rx7fFQr5dNPGAWEMpo+cnBhUpw==
X-Received: by 2002:a05:600c:4ed1:b0:495:4732:1eb9 with SMTP id 5b1f17b1804b1-4954a402df8mr224767005e9.21.1784742083332;
        Wed, 22 Jul 2026 10:41:23 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a4f25b6sm82703565e9.2.2026.07.22.10.41.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 10:41:22 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Jul 2026 19:41:22 +0200
Message-Id: <DK5A9LUHCWGD.3GUNQMOARHVNU@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 1/4] wget: Fix CVE-2026-58469
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>
To: <hthakar@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260722100754.1568842-1-hthakar@cisco.com>
In-Reply-To: <20260722100754.1568842-1-hthakar@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 17:41:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241738

On Wed Jul 22, 2026 at 12:07 PM CEST, Hetvi Thakar -X (hthakar - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> This patch applies the upstream fix as referenced in [2],
> using the commit shown in [1].
>
> It also includes the upstream follow-up fixes referenced in [3]
> and [4]. These correct the trailing whitespace check introduced
> by the original fix and add the required <ctype.h> include for
> isspace().
>
> [1] https://gitlab.com/gnuwget/wget/-/commit/37a40fcb450153f69537c7cbc2a7=
a4fb0b6f7826
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-58469
> [3] https://gitlab.com/gnuwget/wget/-/commit/7b1cdecc49bc77bde220fc575c8a=
00386c3f3bcf
> [4] https://gitlab.com/gnuwget/wget/-/commit/82d945ff5dc9942b78b2bf736aac=
298c24fe00a1
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>

Hello,

I received another similar series 2 hours before yours:
https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D48992
Can you help review it?

Regards,
--=20
Yoann Congal
Smile ECS


