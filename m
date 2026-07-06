Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ED12C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 19:03:54 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.158645.1783364629212445566
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 12:03:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hho2Q1bv;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493b779003fso17090785e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 12:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783364626; x=1783969426; darn=lists.openembedded.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VY9Ipyb8kJ1z4bzu2EZJT3GKl8829z9eueokmqhmSwg=;
        b=hho2Q1bv1gF1C7yKmaN5AWzAF8t02tRSQ6jHMMF8GhcMOCqOgcf8sSm+lWTW6f9+UF
         ksNeIe3NkJiHyxmEvBVZu5sVp6seToMouOb6V3WA7fNAx/gXjHtjM3sVPHoxTcpORzGu
         1ToIcwz2xjcRjJawi8STKKFaKpxxAZxkk2A5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783364626; x=1783969426;
        h=in-reply-to:references:content-transfer-encoding:mime-version:to
         :from:subject:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VY9Ipyb8kJ1z4bzu2EZJT3GKl8829z9eueokmqhmSwg=;
        b=V4Q3pqefmBjkuqWS3TsO+qM8jeqB0oLw3dtPrxG9PdtFkTXUTwx6JDky54+e92weB2
         rR2FOdsG0v1M+1LFP6lSRsZkM490Ad9kpBrX2fWe7HXbCuX37c3ZTaYdw9jmQB+Igli7
         2N15GhbqlB8tmfZxkBroBSf/S2PP6Dug6HEkaoHSoJle7dzC9x/8VuIOknFtg9t7q7bj
         aLY9t8SegZyaqMLmiibEXQqb4lDnwEEhOdPMOU5nsnpX59K9EyHq4EgwL5ScjElDuzXQ
         ryZyk1w8ZD+VXsvFIYMhiX7xMBr/Y2PoN1H51fX7wluodLLmEr81FcaaviohUNHNmpRH
         vd9A==
X-Forwarded-Encrypted: i=1; AHgh+RodWuDrxNDA0uNPH2PxjhI+ykBnk65Qdb1R4x9ubRnb9m4rbTQEr27XYjHIfhsRp47uXVnRZLIdjCB7e9JwugQTRA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzHPSEQjocF6/B2MYT6mPzx86ENTx0tnN4XWrNWjSlXf5tGdDpo
	Wy/Y2xntH7uUaY+bsXBRtTRIisJvFIyS2ols7umAs9hSkA3fgXa8kMEC9rc73OXNhHE=
X-Gm-Gg: AfdE7cnrL+BWFFAOviBjrp/t6m6b7LBQGM0DgfhyriaJw5YReTqN3BYO5do+WYKbWI2
	VJHt+o3NQrEnqdzd7Zm2mqog08IRkf4D0t73V2MQGziWq4OWbubrQ5mWDe96eh4P5aLlcnjmAS8
	VFOF4R4LcaG/hGc1e+YbQOlZjKXkmVfnS1pRDpyZG5YNYgiMk6zbD9fbCCic+UpTgJXCrE5w5IQ
	PcNHwEkg0SyYfwlhfKIFE0VWLDdAkAxTfm/t8CfYncR6dedzVyccPvkUBdBHwKN2Qws23m1O/L8
	bSoJRCvQ9WkpYHwjkf4hucOSvkKJ6x/8lWw4/JKDD5jNyA9ZX0srAukEpekQeyOh6fIQnmnloIe
	6vuInVH3ZCbdTnmRWy6O2yvKBf1XZ+xgI5r2kaRR00fWND57UM8k6j0lu2uueDA371uI1SKbuT2
	sWUJWGEUjy6OM=
X-Received: by 2002:a05:600c:8286:b0:492:4911:8a with SMTP id 5b1f17b1804b1-493df040410mr21202085e9.12.1783364626349;
        Mon, 06 Jul 2026 12:03:46 -0700 (PDT)
Received: from localhost ([212.133.41.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e01c00d2sm4431315e9.6.2026.07.06.12.03.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 12:03:46 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 21:03:42 +0200
Message-Id: <DJRPZXISQBC0.136QWVTP6XF53@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCHv2 5/5] vim: Fix for
 CVE-2026-52858,CVE-2026-52859,CVE-2026-52860
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.0
References: <20260630071903.155470-1-hprajapati@mvista.com>
 <20260630071903.155470-5-hprajapati@mvista.com>
In-Reply-To: <20260630071903.155470-5-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 19:03:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240338

On Tue Jun 30, 2026 at 9:18 AM CEST, Hitendra Prajapati via lists.openembed=
ded.org wrote:
> Pick patch from [1], [2] & [3] also mentioned at NVD report in [4,5 & 6]
>
> [1] https://github.com/vim/vim/commit/4b850457e12e1a678dd209f2868154f7553=
cbf8d
> [2] https://github.com/vim/vim/commit/63680c6d3d52477817b49cd1a66e7aabe8a=
7aa19
> [3] https://github.com/vim/vim/commit/c8c63673bc4253212820626aeeb75999d9a=
539d2
> [4] https://nvd.nist.gov/vuln/detail/CVE-2026-52858
> [5] https://nvd.nist.gov/vuln/detail/CVE-2026-52859
> [6] https://nvd.nist.gov/vuln/detail/CVE-2026-52860
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../vim/files/CVE-2026-52858.patch            | 167 +++++++
>  .../vim/files/CVE-2026-52859.patch            | 274 +++++++++++
>  .../vim/files/CVE-2026-52860.patch            | 446 ++++++++++++++++++
>  meta/recipes-support/vim/vim.inc              |   3 +
>  4 files changed, 890 insertions(+)
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-52858.patch
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-52859.patch
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-52860.patch

Hello,

As noted in [0], CVE-2026-52860 needs a fix on master. It was sent with
"[OE-core][master][PATCH] vim: upgrade 9.2.0569 -> 9.2.0782" but not
merged yet. I'll remove 5/5 from the current series, it will have to be
handled separately.

[0]: https://patchwork.yoctoproject.org/project/oe-core/patch/2026063004434=
3.12138-3-hprajapati@mvista.com/#40047

Regards,
--=20
Yoann Congal

