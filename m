Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E10FCD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 15:27:55 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.381.1781623674232016370
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 08:27:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=p2rohbWc;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490cdae130cso23460265e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 08:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781623672; x=1782228472; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ja4ZhfyiCFVdHKfFwAa8HP6kvHN2MjKAoNDW4JuJ1FE=;
        b=p2rohbWcQCr3cJBuRv0+A7iByZ8Fhs4GrEwRYWk2D5MuOgPaK1ahBD4ABgrlBuFvaT
         sjKo/NwA1kyTuOmRSrH+DGFcC5vU9NaWVzR8/TFg5Dd/D/0PP20V4NUPtx46ON5hEYq1
         gHmpcPusCxkDOWmo7beoL2sQHSJz+1zTfztfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781623672; x=1782228472;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ja4ZhfyiCFVdHKfFwAa8HP6kvHN2MjKAoNDW4JuJ1FE=;
        b=m79jblq5IlA7EFwMIKlfJw57r3SbbKtGZigP7jjnaD5I402h5sIKN6U87pqbsfLRe8
         d6rLwowHZle2nX67tzZDEsiW+KNFtNXb3oBoDhwj9fw83W1LXuuqwI1PScn1YgSxPBLw
         ZOdb6LbT2t2Ave7x1/wqBP2LmJLVF74PGYJDZAHonW0vWF9qRmBtJ17OJmHb4aOgRKUr
         WvC5sxQ69ZLA1I5Ecnn/BVeEeq+TSLvron96R4EEuXZIBJX6G0ohhQKazAkxnXPPRHGo
         81rItDbaSU+1w6fQ5b2MzasOX/ZHtRK+VqEZ7i9F5qmh3sGzC8vy7A0pr0091C5/LmAr
         dZDA==
X-Forwarded-Encrypted: i=1; AFNElJ9g2bpvtE1Iu5jq+NLhUExQuquWWGjJJ10FadoBZWmc80fxUmDqlYEgYfmT7pSLE4p0II2rzoyJExf3n1EKs3wTpQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxrDfTBwjIB0cshEKzWWwAHx+znEzwJdjb7KjN2CnbPIuL7SHaf
	Y6/0uIcqA/P0jTocObmoOdhFTv3jr5EL4HdplbVNnWLo4dOq5xegOOFPuzAuYB2+zX10PzLqp+F
	35r4A
X-Gm-Gg: Acq92OGIjYH/wElnLScjn/IeIqENjYEB4T2DRFLNaK3C7U9wDe46vmDxKRxTQP2eKl/
	2l4MPbagKZZCQm27DAtMHxHfuCSBMoqn8jRYmS8aqMhJQ0vcc4/J638rt3dlRt1GYSF9u+Ea2PT
	usim5OF69HBJAuEdiJtUtvbOgWGdgRDhWLTcwDET3R6/bKLrFFoVAHgPAcpZQlEQ4bklZuhNlCG
	6BeNwa7iosRIg0q/5DLjwTWjMOsaXgglBOKWecX6qjs9yb8kB0mfjCkA/hVAtlMZQY6QmMNoZBv
	Hr+UvTFlK0jlToIvSIBL/+Leibc8mcC29JrF06rkodndvsv6H1LQw0aj+CQ5Y8cZPxSOTCGGs/D
	Gjr785bYbULt8jLzSg96+S94p7quFnRyjfGz7hQe9XhALZA/fyDo/7zdcD8i2TEwZ4V1xiEDdtq
	73Rq5FPghmPqJESl4glVzxlLtOVr3NVOIDjRliDrvbPe6AFR5kk/xoW8/b0w6Dj3Li2lVSKl17N
	dqEOETrBZpnc98N
X-Received: by 2002:a05:600c:6692:b0:48f:e26a:1744 with SMTP id 5b1f17b1804b1-49220061acfmr226560865e9.9.1781623672358;
        Tue, 16 Jun 2026 08:27:52 -0700 (PDT)
Received: from localhost (2a01cb001331aa00fdf7edbba0bd5f9d.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fdf7:edbb:a0bd:5f9d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b1056sm45035675f8f.18.2026.06.16.08.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 08:27:51 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 17:27:51 +0200
Message-Id: <DJAKVRLKH8TV.C80B6ONCMCNQ@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [scarthgap][PATCH] oeqa/runtime/parselogs: ignore new PCI BAR
 sizing warning format
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260616151849.1604663-2-yoann.congal@smile.fr>
In-Reply-To: <20260616151849.1604663-2-yoann.congal@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 15:27:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238910

On Tue Jun 16, 2026 at 5:18 PM CEST, Yoann Congal wrote:
> From: Yoann Congal <yoann.congal@smile.fr>
>
> Kernel v6.6.130 commit fffdb0fece19 ("PCI: Use resource names in PCI log
> messages"), changed the PCI firmware bug warning format from:
>
>   [Firmware Bug]: reg 0x10: invalid BAR (can't size)
>
> to:
>
>   [Firmware Bug]: BAR 0: invalid; can't size
>
> The new format makes parselogs flag an error.
>
> Add the new format to the qemu ignore list so the harmless warning no
> longer causes do_testimage failures on qemumips.
>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---

That should be a backport of https://git.openembedded.org/openembedded-core=
/commit/?id=3D0a7126604b6536868600d43aff000a426384995c=20
instead.

>  meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuall.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuall.txt b/=
meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuall.txt
> index b0c0fc9ddf4..c149959395b 100644
> --- a/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuall.txt
> +++ b/meta/lib/oeqa/runtime/cases/parselogs-ignores-qemuall.txt
> @@ -13,6 +13,7 @@ FBIOPUT_VSCREENINFO failed, double buffering disabled
>  # pci 0000:00:00.0: [Firmware Bug]: reg 0x20: invalid BAR (can't size)
>  # pci 0000:00:00.0: [Firmware Bug]: reg 0x24: invalid BAR (can't size)
>  invalid BAR (can't size)
> +invalid; can't size
> =20
>  # These should be reviewed to see if they are still needed
>  wrong ELF class


--=20
Yoann Congal
Smile ECS


