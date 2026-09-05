Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF2FC79F85
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 23:16:38 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4537.1788650185734885901
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 16:16:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uvVp7u0U;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49d05d51553so4625215e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 16:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788650184; x=1789254984; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=heWX1L7spyAGUqsVl0khGnVQqcKh0JI50Zi+7kfz3hQ=;
        b=uvVp7u0UnYmVWnIBjJO+21QEBiZGNnJ4jhGs/TOCpjG6yIVGEheNtVKkhGHOfwrN0K
         cJURcfxkexIUl2zCMxjMKeITZJxFF0qiGeZAgPFxsX6rC56q0Prwlg7jpUlvt1uB6ofX
         +yMOTd+LllCOdA0cm2A9AePliw+Pr0ER5mnSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788650184; x=1789254984;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=heWX1L7spyAGUqsVl0khGnVQqcKh0JI50Zi+7kfz3hQ=;
        b=YRxy0yHcHewmiWcSuXYXhP30X93AM4k0K30kRvOkpfExTS6AAd4bAQArebaX528Pyh
         KaHWLj+gJHmJUvncctaUW+UgXujEiB391vA9Va22dszpptAv7tF3AN/UNP5mOizOjsfW
         ly2PYhQKYlDrtwGib5SWP16fqI8aDhKMfCzmlVViJMFJSGpyIPzj1kMfVpVkmhYKQxoF
         s1CyZHaNZwzAEvYpduwwHSBWzPHq4+20tlxixA1dpC6pRQayhwiLB0wWbdjX/TD2neIo
         SFr/6C2aiMMywqmad9HEoz/j9EuwoKC+q3UaTj0MbFVDMVfUwu8OKvF7Evf1jams7pdw
         KHlg==
X-Forwarded-Encrypted: i=1; AKwUvBzK8bNHfrIaRSyMoAbgjfYqU+oF1HGeDGztFFInQnrURhEHZOfB4YJEdM0N0d6nnrLNH+fto67F56XVALULDOmWPA==@lists.openembedded.org
X-Gm-Message-State: AFuF++kB7GM03bsWL2ZO05Eikqq3+btZBvehMy1hTXMknnQfgKclzRvx
	TKhGBLugcSYUn/WjRKrDKOgFWLF9QPODK/wZuwD8/t9tKB0PDrHGJ79jP1vSdi6qECw=
X-Gm-Gg: AYBFou2BeLx/+VcgY1G0MpPpNpX6lsTmqZ0qa2X28I2f70UIgGMGexQj66RcO6cN/0+
	AcZcVImc3InIwDJebYpy+lSLX27ljyFce8zTpUxptjh8vJvJSmP1p+1ab44BGF6duzUzhmd44qV
	fQmuJqGtCpJhN8ALSmz5AD5mm9XET1f/12zNGrZ8tGtwCtfwgRIQr+o7K42/FwsDRiQlT2avntF
	1U+9JYY13cDSegGWhKBAyRga8l0ZXWVYhMqubVWg5J7mOoriCI0S1JLorHDM33naW1taq6a3hWZ
	p3GaO2dwJeEsxUcowseHzeLa+8u9WSvndLOPvf2FFVA28VtPUfesm/vofjgWdvvBZxNIkAc/uPg
	RG/eVylx/eOsq0+5/w5WzwyFP4wzJPQ20HHvsODIJhSoHpMA/EVdOFpV29xwSxq93BlLQ32ubgH
	NErDbP/sX1S0Kj8HjoforH+qK9BTiEUehBykK+uJOlsuqCJiqOCMtoJZRoDOaT74ijk6akBMBTh
	WkSoY32bPdvgIES+OmaGnBV+I8slFAG9oYY8YY0ReuHHhbzFy0sDA==
X-Received: by 2002:a05:600d:640e:20b0:49c:fc6e:a3e1 with SMTP id 5b1f17b1804b1-49cfc6ea77dmr86731105e9.32.1788650183891;
        Sat, 05 Sep 2026 16:16:23 -0700 (PDT)
Received: from localhost (2a01cb001331aa0048511f7ccf23d3ce.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:4851:1f7c:cf23:d3ce])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf770fcf5sm181141995e9.6.2026.09.05.16.16.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2026 16:16:23 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 06 Sep 2026 01:16:23 +0200
Message-Id: <DL7RKML5YEK6.3MVF0E1O685WB@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH] python3-click: fix CVE-2026-7246
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260821163206.882233-1-dkelaiya@cisco.com>
In-Reply-To: <20260821163206.882233-1-dkelaiya@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 23:16:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245195

On Fri Aug 21, 2026 at 6:32 PM CEST, Darsh Kelaiya -X (dkelaiya - E INFOCHI=
PS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Darsh Kelaiya <dkelaiya@cisco.com>
>
> This patch applies the upstream fix for CVE-2026-7246 as referenced
> in [2], using the upstream commit identified in [1].
>
> The backport also adapts editor regression tests from the upstream
> test and documentation follow-up identified in [3]. This follow-up
> does not contain an additional production security fix.
>
> [1] https://github.com/pallets/click/commit/b96c2601af4e01341b4d2c0db494e=
bee4aef8f42
> [2] https://github.com/tsigouris007/security-advisories/security/advisori=
es/GHSA-47fr-3ffg-hgmw
> [3] https://github.com/pallets/click/commit/b55294797ef32e22eb41e7d9657ed=
b8faefa4976
>
> Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
> ---
>  .../python/python3-click/CVE-2026-7246.patch  | 245 ++++++++++++++++++
>  .../python/python3-click_8.1.7.bb             |   5 +-
>  2 files changed, 249 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/python/python3-click/CVE-2026-7=
246.patch
>
> diff --git a/meta/recipes-devtools/python/python3-click/CVE-2026-7246.pat=
ch b/meta/recipes-devtools/python/python3-click/CVE-2026-7246.patch
> new file mode 100644
> index 0000000000..47ee1a551f
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-click/CVE-2026-7246.patch
> @@ -0,0 +1,245 @@
> +From cb30f575b1a251e8698909bca2a443d41dad1824 Mon Sep 17 00:00:00 2001
> +From: Kevin Deldycke <kevin@deldycke.com>
> +Date: Wed, 4 Mar 2026 14:51:58 +0400
> +Subject: [PATCH] Document and fix command string sanitizing with `shlex.=
split`
> +
> +Removes last use of `shell=3DTrue` use for command invokation for defens=
e-in-depth.
> +Refs: #1026, #1477 and #2775
> +
> +CVE: CVE-2026-7246
> +Upstream-Status: Backport [https://github.com/pallets/click/commit/b96c2=
601af4e01341b4d2c0db494ebee4aef8f42]
> +
> +Backport Changes:
> +- Click 8.1.7 uses Editor.edit_file(filename), not the newer
> +  Editor.edit_files(filenames) API. Apply the argv-list change
> +  to one filename without adding the multi-file API.
> +- Adapt editor tests from b96c2601 and follow-up b5529479 to

Hello,

This commit has both b96c2601 and b5529479 squashed. Please keep
upstream backport patches split.

Can you send a v2 with as the CVE fix (b96c2601) and its followup
(b5529479)?

Thanks!

--=20
Yoann Congal
Smile ECS


