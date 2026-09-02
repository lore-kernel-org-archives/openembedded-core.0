Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BDB2C61DFD
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 08:35:05 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7710.1788338095768830255
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 01:34:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SAcpCvfe;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so5434045e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 01:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788338094; x=1788942894; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xBYEPnYb5jQbfPvj/TVfvWki432rKt17gd5FOQzOsw0=;
        b=SAcpCvfeUUYYwqtTKdeUEpz4US5hx5/wmVKXDw4rXRaXaYs3PTrlTunsKGx07ChMZl
         RcgRR4Cr/TNd7FQXGi7x52pRZD0ewY0xtLN4h1ecvIlpyRLjtgjxpjO5ifth35H/g14j
         ymdW2WBol4tvflLyiat1ecVWF87/RkMW/qwgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788338094; x=1788942894;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xBYEPnYb5jQbfPvj/TVfvWki432rKt17gd5FOQzOsw0=;
        b=hhUMauqgYrBYJlAcRLWi9bQagtorRNnNzMJqpu46ulp8C1PNPyJiA8Jwl7qy5mv2HV
         Pg2UoIYH+3WIyKx3j+J5TiW+WiUO/3i8pWtAmlc+bLkPwZX9Z3oEX2h+TCdOMfnqpTp8
         OhJOrjajVrhhASBSAAGMR3dgcOlZhynHUWUkh68y02hknpkGGdgOYopJnEPK969zFNXj
         MbG9DyD/+49vHC6oHiZu3JrAnNqDtOlzwtglokjDiUkVnoEf/OhQMYfJvHkTbeFFaFu7
         l1j5sodxvad8m+pu/LQWXs8a0SV9YqmCi0yUWhRtqR8b79hTfFpfXOLGRV+pL/vGaegA
         xqsQ==
X-Forwarded-Encrypted: i=1; AHgh+RpUrQBP438BIQq7R7Aj39lw+gOZFH+NbnwRdGvmGCf/SMDED1GWkUPFF5R3cldIovXrvStD1SGBQjQZjSzrPQNFsw==@lists.openembedded.org
X-Gm-Message-State: AFuF++n/vO58Kl4vKv/iAlVtilF3FRbOfqWtl7pnj3lhLgIdtmVWZ4qT
	OntnRDKVUMzW1rZEL9qr7FV3JU/P6J0l0MunEiuBmDTxd4Z66Ma96/EH0wiQj/8KTps=
X-Gm-Gg: AR+sD13mzkGAfvTWcaLkHK8nlcZH0bEixmwA1KNwD/0NjEBb6Li5h9nGpgEcQYXTAZ5
	U0SApEdybHnv1+oxh6k4VX6wNAvx416coCPSeabcJ8VGH+loLdwG1cwIwI6tqYo2EMzVI5RLDj7
	/NcF0/5RbqGM1GDofV0Ltef3EDg/WXNP0l5v2z5UzeH3Z7urh5bo0TMNrPVB+ndnvhChnZq39+Q
	2KO2nbrK1iTLq7bXNF16sxei+bU4MVWQQtzjwAdD78D2Xg8EG6nOWS2rj+m+nu6PSsfAR4LGw80
	uD0wW+iLL/MnXqrtg4/Wh/gooLet7fU5VI/ci/tqeBeK9vNgCK93KRipGlWu9N1DhQ2kxMTWGIq
	+6VH78uaeZ1b+5G5DLOxpcKlIdZA5XbDDG4EjzF8VL0qJSiOEdoPpwuK+I8vTcpZWyEyrPfzKVJ
	BfyQtXJVVSDjlodnHx00dQYU8+vIhHQZUoAtK4Hwh2OKPlVDSrPXfWRsYbascGDUOv0ShYTSUv9
	RvA2o77R7fmoxabugAKCxZVu7owMyKMgi9quB+7LKmQiwd3
X-Received: by 2002:a05:600c:4693:b0:499:484a:81d0 with SMTP id 5b1f17b1804b1-49ce5817d63mr43256035e9.9.1788338093877;
        Wed, 02 Sep 2026 01:34:53 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm4973392f8f.16.2026.09.02.01.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 01:34:53 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 02 Sep 2026 10:34:52 +0200
Message-Id: <DL4OY27DNNP2.1QDHTOBTRVJY0@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-@cisco.com>, <external@cisco.com>
To: <hthakar@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH] python3-pip: Fix CVE-2026-8643
X-Mailer: aerc 0.20.0
References: <20260817044231.127184-1-hthakar@cisco.com>
In-Reply-To: <20260817044231.127184-1-hthakar@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 08:35:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244901

On Mon Aug 17, 2026 at 6:42 AM CEST, Hetvi Thakar -X (hthakar - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> This patch backports the upstream fix for CVE-2026-8643. The
> commit is included in pip 26.1.2 and referenced in [1]. The public
> CVE advisory is referenced in [2].
>
> The selected commit is self-contained. Later upstream commits refactor
> the validation to use a shared containment helper and update release
> notes; they are not prerequisites for this fix.
>
> [1] https://github.com/pypa/pip/commit/8eb178480bd1a2b223f509fc430796b265=
158dfb
> [2] https://github.com/advisories/GHSA-wf93-45jw-7689
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> ---
>  .../python/python3-pip/CVE-2026-8643.patch    | 80 +++++++++++++++++++
>  .../python/python3-pip_26.0.1.bb              |  4 +-
>  2 files changed, 83 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2026-864=
3.patch

Hello,

Thanks for the patch.

The scarthgap fix for this CVE[0] has 2 regression patches in addition to
the CVE fix itself. Don't we need those for wrynose as well?

I'll hold CVE-2026-8643 patches (scarthgap/wrynose) in the meantime.

[0]: https://patchwork.yoctoproject.org/project/oe-core/patch/2026081704442=
9.62418-1-hthakar@cisco.com/

Regards,
--=20
Yoann Congal
Smile ECS


