Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBD26C53209
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 22:05:48 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18936.1785103548195285036
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 15:05:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=NySoJJkw;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47f7872abb6so1147741f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 15:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785103546; x=1785708346; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rK7MhJEn7q4nHploSvtGOYhNr6JM9G+jtopdbkF46zs=;
        b=NySoJJkwVqvMRAtyWo5kh36j2kyhqPr47lefrqcN1USfUk4byXjySJKudiMJqnQs6J
         LXrv2yEJdBJGXehLW51+tdViLklV1ucRHisNUOGrQryoIxGC966i4zQWkaNFQdr6EJx+
         doCKKfGIMb7C7KgCyVTFHXEbSKTHsapE6a8s8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785103546; x=1785708346;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rK7MhJEn7q4nHploSvtGOYhNr6JM9G+jtopdbkF46zs=;
        b=NgjcD+v//WW9vV5ddKME7u37OIazZmPfgdPuEGNPc7CtDBQv07Rh/+nJguzA5zQJWl
         QaFfdxEXI9bkrh2rzZJ4ehekixv3KMUXUO80VHpuhu725Mr2qC4ObFk6EL4p6GMKiYXJ
         Xczi8n2lvv2e3ihDSaxmpDC1OytyNjtZlvvsO1YVmfVFvVO7PFTFDleED4pRxEBwCI5I
         39vAKejv3wpChDRel7yWvooyO2bx+g/cKGdOxqIX5yGWuyPs2elEVzBIiU+FNXN5Ylf6
         cjICmtY635bmlG8ii7Y/rmaRaBBL5TCzziH+8qOgNBSfdU8QuvR9KtgNFYNBcYOlmUk1
         02NA==
X-Forwarded-Encrypted: i=1; AHgh+RpL2taGIzfGbT+jBI6Ja4g6IaXpCzuKew1nKPbf0eZbbO6+m6Wxm+Lq7P7T1AYt5lXI149wyANl+IXdmt3zRaFDRg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw74Y/ChYN7ThiqtDlcU27VKB5b2mVdujCUg6pcwC7FYO3RnkqI
	VXLaO0LQq80YF9CO4msKbobmTl2nYOwVVPBuuHYE9ma7sz/uztzNhCiVXfwz/xA2yRm3wZvTMMR
	YLnxjrMU=
X-Gm-Gg: AR+sD11uPjtq/+o53Lt+gUdSiQ0gAuEWmvU+jDCzNPa5TZB8qNm5E0QRvSxaQo4YYSO
	XbsfvyDt6UDqEHNlNe55zO7o+ENLVF5os48grfQ5j1YoS8tiCzeb1qTzmR27iW+OynV5rvp5vrw
	SJAt/LMZVgyy5gMKtsy58TuD+Eq9rdYM3Sj9CVu8aEpeA/mvkbu7BV/baed9U+36e14R3d5EAGQ
	xrEKHt3LdUPiwBAvgPx8KISHjpAtVbzeqiRCO/ES9r+xFxI0l1sDhGlIKE58r4b7j5YXq2Gbv5x
	sKCDVIU+x6waC1LeEMkSL7tvYyhQXIggNlPlzUhekMb02vr9nivb3L+X6ykBz3B2t3F8xhx/W9M
	NsaFrVJI4QUnejMSa3ZgzLkF568g4Z46FFvX6OU9SreFyZQwoxbmgJSSw28gezZbATQq4v29vO4
	N6kc9cpXM2ApO5lTmpPwnaAslquIQZWxc2RZDzP1i+Rm7k35cojWrHwfRzEnegjDxVTg==
X-Received: by 2002:a05:6000:4906:b0:47f:93fc:2d27 with SMTP id ffacd0b85a97d-47f9fe9301amr7331184f8f.30.1785103546298;
        Sun, 26 Jul 2026 15:05:46 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6287csm43808833f8f.25.2026.07.26.15.05.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 15:05:46 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 00:05:45 +0200
Message-Id: <DK8UE7TFOQNN.2W9IFP8L1S2MF@smile.fr>
Subject: Re: [OE-core][wrynose][patch 05/10] vim: Fix CVE-2026-57454
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <vanusuri@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260722123336.587556-1-vanusuri@mvista.com>
 <20260722123336.587556-5-vanusuri@mvista.com>
In-Reply-To: <20260722123336.587556-5-vanusuri@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 22:05:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242025

On Wed Jul 22, 2026 at 2:33 PM CEST, Vijay Anusuri via lists.openembedded.o=
rg wrote:
> Pick patch per [1].
>
> [1] https://nvd.nist.gov/vuln/detail/CVE-2026-57454
> [2] https://security-tracker.debian.org/tracker/CVE-2026-57454
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../vim/files/CVE-2026-57454.patch            | 188 ++++++++++++++++++
>  meta/recipes-support/vim/vim.inc              |   1 +
>  2 files changed, 189 insertions(+)
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-57454.patch
>
> diff --git a/meta/recipes-support/vim/files/CVE-2026-57454.patch b/meta/r=
ecipes-support/vim/files/CVE-2026-57454.patch
> new file mode 100644
> index 0000000000..579ffbf11b
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2026-57454.patch
> @@ -0,0 +1,188 @@
> +From b3faeecc976d3031d7c0675623516ec60c30f949 Mon Sep 17 00:00:00 2001
> +From: Hirohito Higashi <h.east.727@gmail.com>
> +Date: Sat, 20 Jun 2026 16:06:58 +0000
> +Subject: [PATCH] patch 9.2.0679: [security]: Out-of-bounds read with tex=
t
> + property virtual text
> +
> +Problem:  [security]: Out-of-bounds read with text property virtual text=
.
> +          A crafted undo file can declare a virtual-text property whose
> +          offset points outside the line's property data, so reading the
> +          virtual text reads out of bounds.  This completes the count-on=
ly
> +          check added in 9.2.0670.
> +Solution: Validate the virtual-text offset and length of each property
> +          against the available property data before turning the offset
> +          into a pointer.
> +
> +Github Security Advisory:
> +https://github.com/vim/vim/security/advisories/GHSA-ww8h-47xp-hp4w
> +
> +Co-Authored-By: Claude Opus 4.8 (1M context) <noreply@anthropic.com>
> +Signed-off-by: Hirohito Higashi <h.east.727@gmail.com>
> +Signed-off-by: Christian Brabandt <cb@256bit.org>
> +
> +Upstream-Status: Backport [https://github.com/vim/vim/commit/b3faeecc976=
d3031d7c0675623516ec60c30f949]
> +CVE: CVE-2026-57454
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + src/proto/textprop.pro         |  1 +
> + src/testdir/test_textprop2.vim | 60 ++++++++++++++++++++++++++++++----
> + src/textprop.c                 | 36 ++++++++++++++++++++
> + 3 files changed, 90 insertions(+), 7 deletions(-)

This patch also has indentation changes between upstream patch and this
patch.

I'll hold the whole series and let you check and correct the patches.

Please send a v2 of the whole series.

Thanks!
--=20
Yoann Congal
Smile ECS


