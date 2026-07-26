Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC58C53209
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 20:48:44 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17523.1785098919345142971
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 13:48:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=gFYbX5sG;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f97d310caso1377494f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 13:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785098917; x=1785703717; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EgVsVkGHfMZqX2BBMUOjXzVJGqAI0uljRWfD4mNyg38=;
        b=gFYbX5sGMzOgjahws657/BHqeZyFHFzCuz+z9sZ4z6ZTWbgd3zE4Jj8jxcaEkerIFE
         LIrIBDyj2kb6a2fU68Dc343UQwuIa052HR6ssBTLdKuq8Hp6BUtgZkHqF5xgvm/DMi/2
         ei6jlfNLAgL8dJoG8bU13SY/Ct9/fYXWr/RFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785098917; x=1785703717;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EgVsVkGHfMZqX2BBMUOjXzVJGqAI0uljRWfD4mNyg38=;
        b=jMuCzBzB1JsyqG/2Hzqc7EM5nUUkXA+WwvHxjnEAR0D/SeSjBwR1bzBmIJPQPPBMZ5
         WlBxgdLw8TFgfZOPy0PZdhYdc+4MWZy25rIEJE1wOq/yNnjuA4oj5a5x+LRqzyWCBu7S
         FDCkTVim89lAHuO4fy0KYLWnsgqFTfLxiyCWu8jJOc3WhQ2AWySIFq2lrH5MZ6OmIXK1
         7ywNg/S5dvOZ7BXiGKjKsZ9byDUBAStBQVX+K1V1mY/xKbz7g4tcgkAodDPIjDp/cbez
         SCKznA+/hvS5DcjpioBIaEW9+8gnMvJGzABh5+irjVCt0h+vVaAnieDejAehG8T2rpqr
         tsUg==
X-Forwarded-Encrypted: i=1; AHgh+Ro9feK8Km0qgcFqSDeVcC6gz7+G4e31AbAulYOG0Bg3BsPl9AJ/1WvNL0+vC5m68sc+sDrbcWLpDWiIO3iFs/naqQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyERKNvG5m7RUNDEqGBiLJucQ5gjDi/MrrT0yZ1fQ5RCQ9nPde/
	HtO1zreseyCbroA8ev9py/WvzD14rA1DMD5Jhx+VXi5K6SDPMI7bjuMx3/k/J6JzNlM=
X-Gm-Gg: AR+sD10aD1gMnMP50XV/zdGH0rggWINnKuc6FapqgLJR61WZRGog+7VG/aTzpy24zAb
	e2Zn9QZQC8/ZoaBKGKsu1C8fPUS9br/cKwcslRWZRNzjuRPJkV4LOrmvejnkEkUJkyXxUaP+RI9
	h8D7emYDJxd4D+IMu7rD2AJJIUTmyydOIeAGaMy+m908E014K0GqrST8ztxD+kFFVyDQAflZI/r
	gW9p8NcxOx4AQoMY3rbxTFR9td1WD0gJLZ0p3F537zmbz9KUxnVdi8CxGvdoGU+wyGKtyj/gCKL
	yFFEhQOaD7qyo/YzzypUc/2da53VVvVDopvNpUCjIsNExFBMKgt3JsJqJGGlMQkl/OpCAaGLfSy
	sDabAfXpafSrCsozFV2vbOijSMV462uCdO4ttHMBJbAhu87eypKPDJTuISEP98xyj1X6zuJkjyh
	Fr0A2+pCilgc4wM/FRgPpjjE4v5pm3RHAM/g7ZmZkeVza6OwhP9IlNDVRN29EuWzi7PQ==
X-Received: by 2002:a05:6000:1861:b0:47f:7fd1:9602 with SMTP id ffacd0b85a97d-47f9fc89ce6mr7580479f8f.11.1785098917602;
        Sun, 26 Jul 2026 13:48:37 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a6d7sm42769543f8f.2.2026.07.26.13.48.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 13:48:37 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 26 Jul 2026 22:48:36 +0200
Message-Id: <DK8SR59VW59C.13WTSX6Y2PQ8F@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Hetvi Thakar" <hthakar@cisco.com>
To: <amaury.couderc@est.tech>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/5] wget: fix CVE-2026-58469
X-Mailer: aerc 0.20.0
References: <20260722081709.14764-1-amaury.couderc@est.tech>
In-Reply-To: <20260722081709.14764-1-amaury.couderc@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 20:48:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242019

On Wed Jul 22, 2026 at 10:16 AM CEST, Amaury Couderc via lists.openembedded=
.org wrote:
> From: Amaury Couderc <amaury.couderc@est.tech>
>
> Backport patch to fix CVE-2026-58469.
>
> References:
>   https://nvd.nist.gov/vuln/detail/CVE-2026-58469
>   https://www.cve.org/CVERecord?id=3DCVE-2026-58469
>   https://security-tracker.debian.org/tracker/CVE-2026-58469
>   https://ubuntu.com/security/CVE-2026-58469
>   https://osv.dev/list?q=3DCVE-2026-58469
>
> Upstream fix:
>   https://gitlab.com/gnuwget/wget/-/commit/37a40fcb450153f69537c7cbc2a7a4=
fb0b6f7826 [nvd]
>
> Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> ---
>  .../wget/wget/CVE-2026-58469.patch            | 52 +++++++++++++++++++
>  meta/recipes-extended/wget/wget_1.25.0.bb     |  1 +
>  2 files changed, 53 insertions(+)
>  create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-58469.patch

Hello,

Hetvi Thakar wrote[0] about a related series to wrynose:
> I reviewed the earlier series.
> It looks like the follow-up upstream regression fixes for
> CVE-2026-58469 and CVE-2026-58472 were not included in the backport.
> These follow-up commits are required to complete the backport, and I
> have included them in my series .

Hetvi, do you confirm this is missing here as well?

In the meantime, I think we should hold this series since we suspect it's
missing regression patches.

[0]: https://lore.kernel.org/all/PH7PR11MB8598AB8F89B7886FD3EC9148ADC02@PH7=
PR11MB8598.namprd11.prod.outlook.com/

Regards,
--=20
Yoann Congal
Smile ECS


