Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A772DC61DC4
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 13:55:05 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36641.1787838900355100432
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 06:55:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mfEybDz7;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47de0093c42so1782481f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 06:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787838898; x=1788443698; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oKQR4oUdpPy+h5UdhS8pk4XJbjsmOgXab0w2PoM/nts=;
        b=mfEybDz7+zFU3RKyXckMA8V1etZpgxlWHjZiNXx2jnfEw7t4sP/aTe41AK791Y6pyb
         gaLiaf2FMjRfIYBArfsoPO5FNj6mdZawH6N5uAfM0g7myHj9vYItJAEM9yIBIulFleaE
         jVLLcPJm09dV0T7Uqmz6IGs+PHB6O7WHblbL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787838898; x=1788443698;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oKQR4oUdpPy+h5UdhS8pk4XJbjsmOgXab0w2PoM/nts=;
        b=D325mPotnkBL8tckauGygq2nAiOYMNP0tuMckLTNpildCTlOe6/We0hdXhWsXpXnk0
         684E6+Z8gav4w2P3rAIIX4baXL/ItPEAv06chTjmNVvzjzsR2Ll6XYpuCKkh7l/xxhbV
         SQ4zR4eBAKZszvwyEzNt93u66yQOUEppmjyO2R7CaFC7qXTtfXxKD3NdEnZ1isq9tYlx
         vkWaMVG1FWP4h8E0kAPSwfiAemx920g2lgFKIeAkBvNbU2Hh4qSqvUOjT9eHDX/ty5K6
         zFinkI8iZGlm7ohl6CcLBd7x6bgSZB1+2rlRstWlzd7I80IUTxukQT7lsie20T3QpDI2
         saJA==
X-Forwarded-Encrypted: i=1; AHgh+RqXhFzZfER9qd5UrAAJXR3EFytfVroSffSzej5IEq07Ek8uaFPbqHLEXpxb79svLXyuBkBTl59EWDL2YPkrPIwxrg==@lists.openembedded.org
X-Gm-Message-State: AFuF++mO6MWsU4Cu3JwnN7lCXYdpgjEMATAJ9ZbsKVEQUYKJ1jtlK0zf
	9XAOpXhHJ2EDGdryKQ0bgTqONElrGOaRm7VRKA8vyTqUawI12yCL+8Kp5toiuSJLJBI=
X-Gm-Gg: AR+sD13nZ1B+w5wCiDjM1Cy7gtNlQkaqEe1x95Y0keuJn3alPLeYaHFho+JHfzxyjUk
	USVZOL6kVa/dBzsCqGozUKjZKmuzYbpgiNuUvIThvtqwSSq2cHGzPaxSdBm1FCsRbKXer8iIZk7
	He8Y4EMSTUGknvL3n7/MJUFVL75JEM6Lv6vjA78ssl94c2jzkdAPCb93k2GAa799XStynEgljfg
	ltYx8r4VU44k9SaYc75bDRHBlLslAhUfi1z8yvQtiuY4hg5HL0KVZ31+/UnajGsoUWXDNpIRAIl
	RB2DpQn66Tj0y+btR1VyJtHop4KxsmwIsMf129Ft6In00nRBo7Dp8Ld3DOdNATjBTCWVopDTEcv
	DNPDjgfL3n5Ng7aZuoHi7Qf42e85at1+GvOa/m2ctc8npotLTT+DEj26wW0vZVVt031ov2d3Rxo
	ps1pGYvvVjXBb3zCqftuD6bl8D3hSLqMCaNFvd2qh0AAY+So5wSmSD+qFogp88pNf/C8yTEO0Mx
	GQpa7EPNZZB7JH9youbuKEgNnI1XR/X6ROEo3gTdEjkaMi5O2Lj
X-Received: by 2002:a05:6000:4808:b0:482:f435:76b7 with SMTP id ffacd0b85a97d-482f435781cmr6009408f8f.2.1787838898277;
        Thu, 27 Aug 2026 06:54:58 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28e899dsm9596703f8f.28.2026.08.27.06.54.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 06:54:57 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 27 Aug 2026 15:54:57 +0200
Message-Id: <DKZRZV1Q6L2C.3AZRHXJZ8RXKV@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH] python3: fix CVE-2026-4360
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <leonid.iziumtsev@est.tech>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260729093555.426053-1-leonid.iziumtsev@est.tech>
In-Reply-To: <20260729093555.426053-1-leonid.iziumtsev@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 13:55:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244492

On Wed Jul 29, 2026 at 11:35 AM CEST, Leonid Iziumtsev via lists.openembedd=
ed.org wrote:
> Backport patch to fix CVE-2026-4360.
>
> Reference:
>   https://nvd.nist.gov/vuln/detail/CVE-2026-4360
>
> Upstream fix:
>   https://github.com/python/cpython/commit/5e0ef3f1afe892e4f64eb83368db57=
ac4c40cba0
>
> Signed-off-by: Leonid Iziumtsev <leonid.iziumtsev@est.tech>
> ---
>  .../python/python3/CVE-2026-4360.patch        | 148 ++++++++++++++++++
>  .../recipes-devtools/python/python3_3.14.6.bb |   1 +
>  2 files changed, 149 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-4360.pa=
tch

Hello,

In this case, I think we can consider upgrading to 3.14.7 (like master).
Can you look into this?

I'll hold this patch for now.

Regards,
--=20
Yoann Congal
Smile ECS


