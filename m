Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18355C4450A
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 21:22:46 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3719.1784496161465130058
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 14:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=15VsGEC8;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4728c12ba97so4638195f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 14:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784496160; x=1785100960; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cuZx5/ggo9Ebb85dZFDtsgBMBPcsk0THZUmlzJOF9Ao=;
        b=15VsGEC8WxaOigrZx3i5HflX2A3ZOBbWQAfO6wuIOlIW2aJc3B2KfrFJ21+7h3Yaqu
         TCVAkc62EQE357K4ZT1wYq8USBCMczvEsxlhGUVFTP5SDbXMNG2gMg2+eD8sPNB+40GS
         2vHqc0p2HnKNxzgv74DVt8Tan7uZyftFQMoxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784496160; x=1785100960;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cuZx5/ggo9Ebb85dZFDtsgBMBPcsk0THZUmlzJOF9Ao=;
        b=ppupMuNMxRGeCrpyo+Hc5c9fyUHrxgAJDh2+lZdyZ7HtUJyR6CNp/rhqrX3aNmue5q
         fc4q54yMoYtH1ih5HCtEfLO208uF8Gsg6Rv8FamSAFeONnLW1jhXbSBwy88jc+y/PXMV
         Zw3jZRmKXE5ruLiZv0lXb/20yNgrsRaeUFoC/s4bN07WPSLNUpHhZla3gMyD6dSa1uSZ
         NPRMQq6vCQjacwvl/vPEAVm9/eM96E1qIQLXOWOPsPOjd0zoSs1Stn/9KQAZNnUCN9/P
         7n3TTXyLEnmlijMqw2NTJi5CaIogo2MvFd9hAAkZZsmd2lh1s+P+n9EpdnhDbJzBN39u
         RTkw==
X-Forwarded-Encrypted: i=1; AHgh+Rqgc3FbjO7oioNVYrl6pz0Z9o4hDMLIfSh0yLk01nYm4hx8wXsLDigJuepjiniO94E8maTvNRW3t9VttUM3WGFlJg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzzFS840J8tZf7mZFF9/DP9z/Y/YCZ/f7Z/R3VTGf5d79XPMLQv
	Bc6EfwrLp727PcI7H3RUbopQGXV9TJh9bxkvjMCRT1yPHEsA6c0vEG3gMrZbJ+uwgNE=
X-Gm-Gg: AfdE7cngjBKXjVZKrAx/xNOWCKrz8ioB9v+PCGlIeLrjetNsJKnlwF/HVUo1zPnnAXY
	hq6DulPpc+2AlmH4B6vJRS5IpMGDDp49f8rIbVtKFulNDTKPGXKwoi2z4dUeDUW1K2YN2vGv6Bd
	/SlzKPbDf9u5KWpgn/Kf5RVP6OePmMdxN4iTmm53u4NBpmzfJQ9ctYuXLMLBh/zsysT/0hMn+Cv
	ZfMsw2JCKiiobA0AHK1zRUwAi457MX5l/RkQpWR+g4/OA8z4H3urrbGFkxJIaSBDIHtiCclNsEQ
	nWfHKjRDw/h8zbWI3DEt0Rl2TuGzk3fe9Y7UgjA5CQcJl4wGMwG9lxfJDuxEAdsuCc4TG7VZDXF
	Qjm95QlVSJVx0Qcy7hsNAHBWtj6pP4N4pTpnEqZewNxcq0kMsnYGdMjRPzP4RR6psgySE+hPSPr
	fu0Bp2N92vL4NAduprdCs7CQjdG7iLTwXB32dD16DaVDIF4X0wcu1+AL98VruMJ2lBQbL0gdjNJ
	dEbKw==
X-Received: by 2002:a05:6000:2c02:b0:47f:7635:e663 with SMTP id ffacd0b85a97d-47f7635e737mr2684998f8f.38.1784496159641;
        Sun, 19 Jul 2026 14:22:39 -0700 (PDT)
Received: from localhost (2a01cb001331aa00e37f7eb174d0a6c8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:e37f:7eb1:74d0:a6c8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63ec7f55sm21510680f8f.18.2026.07.19.14.22.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 14:22:39 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jul 2026 23:22:38 +0200
Message-Id: <DK2V3E1HHKGP.1D9EVC03JCBGK@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH 3/3] python3: fix CVE-2026-9669
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <olivier.benjamin@bootlin.com>, <mathieu.dubois-briand@bootlin.com>,
 <pascal.eberhard@se.com>, <wahid.essid@se.com>
To: <benjamin.robin@bootlin.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260706-fix-cves-python-scarthgap-v1-0-8d51db14f7ac@bootlin.com> <20260706-fix-cves-python-scarthgap-v1-3-8d51db14f7ac@bootlin.com>
In-Reply-To: <20260706-fix-cves-python-scarthgap-v1-3-8d51db14f7ac@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 21:22:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241302

Hello,

On Mon Jul 6, 2026 at 1:01 PM CEST, Benjamin Robin via lists.openembedded.o=
rg wrote:
> bz2.BZ2Decompressor objects could be reused after a decompression error.
> If an application caught the resulting OSError and retried with the same
> decompressor, crafted input could cause the decompressor to resume from a=
n
> invalid internal state and perform out-of-bounds writes to a stack buffer=
.
> This could crash the process when processing untrusted data.
>
> Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootli=
n.com>

More than a description of the vulnerability, what we need in the commit
message is a justification for the patch: i.e. why this is the patch we
should take to fix this CVE? In this case, this is trivial, this is a
patch referenced from the NVD page. But better state it.

> ---
>  .../python/python3/CVE-2026-9669.patch             | 97 ++++++++++++++++=
++++++
>  meta/recipes-devtools/python/python3_3.12.13.bb    |  1 +
>  2 files changed, 98 insertions(+)
>
> diff --git a/meta/recipes-devtools/python/python3/CVE-2026-9669.patch b/m=
eta/recipes-devtools/python/python3/CVE-2026-9669.patch
> new file mode 100644
> index 000000000000..933d6f410ee1
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/CVE-2026-9669.patch
> @@ -0,0 +1,97 @@
> +From 5b412e1f7bdb3e0667b2bc8b216ad216d59d8373 Mon Sep 17 00:00:00 2001
> +From: "Miss Islington (bot)"
> + <31488909+miss-islington@users.noreply.github.com>
> +Date: Mon, 8 Jun 2026 11:55:32 +0200
> +Subject: [PATCH] gh-150599: Prevent bz2 decompressor reuse after errors
> + (GH-150600)
> +
> +CVE: CVE-2026-9669
> +Upstream-Status: Backport [https://github.com/python/cpython/commit/5755=
d0f083949ff3c5bf3a37e673e24e306b036e]
> +
> +Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>

The upstream patch has author=3D"Stan Ulbrych <stan@python.org>".

Please send a v2 with those 2 points fixed.

Thanks!
--=20
Yoann Congal
Smile ECS


