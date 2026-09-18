Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5120EC982D7
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 09:40:07 +0000 (UTC)
Received: from mail-wr2-f28.google.com (mail-wr2-f28.google.com [74.125.225.92])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7320.1789724403671884552
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2026 02:40:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DEbQH9VF;
 spf=pass (domain: smile.fr, ip: 74.125.225.92, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f28.google.com with SMTP id ffacd0b85a97d-485b1d2874aso353904f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 02:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789724402; x=1790329202; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HZYpHJL5fZDD13tz1YLtcss+wPacbUsWdW8lm6wvdro=;
        b=DEbQH9VF76y75iiZXg8K0qGPAf1dh3nR9ctEjeNOSZCDmOWJvu/+V2+vYSELgxemSF
         5XsGpasR5RrKuBLVDXTmgyAXyuil3lmkFuBUg2ggCXrMPCiRfiVjKK5+02FQ+CYQMenx
         rQFDsGXJFXqyk84MCW6RlRV9hEqgTLqufLiHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789724402; x=1790329202;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HZYpHJL5fZDD13tz1YLtcss+wPacbUsWdW8lm6wvdro=;
        b=nfq2ZhqY1QIE/VNqk28STnKkFFhbkLKZB8R4v52b9SCR67IPBkiMvbHCWnd6rp2t9H
         mS+r7tXECPJcTDRyE5ySNtdFs4O/pJF6UvTcfXZsCoG1rnMWtCL/6Brinu/gFJWGgTn6
         4s0+j2OmqJY8xlJCNJCl3aTY6Y0wqBkE0dr2qvtNNNcwuVUsmryVeKs12sh05l+NLKPq
         ThJu7Q5+peAAln0hySkK7iV2a8HMNfReN3sh5vT6ksMgtfNuOUCQTNL9a/x+ae4mqUSD
         hC/3Sin2f0iwDoOwdr5IaL6aX8Yv14ObCnnj8OF2jqbn+mDnXOJlZUjuvfq8fgkrNqZq
         zO4w==
X-Forwarded-Encrypted: i=1; AKwUvBzwG3WNuHzYdDyrMDxqGc6pOfUfxnBHrG/6WPI05ZMi7HpnD3ny11Ca0RkM4NjLObPvS/gbKuSSFvKzNHjx0RTJ7Q==@lists.openembedded.org
X-Gm-Message-State: AFuF++mxGxvsNlI8ZUY/KVxvDJl727K5XRn2niFgeBMAAbUdcDmh+brC
	QjFELkb4wbzG3hNiPyi/rv2aQ62srLJsrtZqRg+iq0itCHMfSAuWuRfWUG+5znZZOnU=
X-Gm-Gg: AYBFou12aBAHhfl4LVxqPZtf0xDzwWtYL6mYIODcDMyGVpNgzTvlScSNUxhTagnOzxM
	btl+wOPtRgYRu3H8eW3jK1f8p2/CV1cfCx7eOaZEDURj570bPL3byRuDA4MesopQ872l5vABltU
	mJJyTh0bPoSlXqAT/QhghUSR/wQMXAFORcjszFAOZyNfiVIK8zqhyIp9bCM2J+3mMDQTQXqcuYu
	QPz8BqgM+1QUZTS3Rd7OLbUYv2t/qQqKRxhWsB603Jv3ACXULShqiT7WLBKvaFjMgWRxmooPSX6
	mUVPJDr5nBIwD/w4zAe9lCazdodo3S//Bh7DIryApDk+RzPFdSxaCLWZVsR/hthBn8oPgt2yPQj
	7ESJz48koCdaV8zaVWrOwXBjcXb8XEceYN+oNhvnpatcp1oz2sbUcQiZqDqCqaB4v1+ypX2jPxP
	6afCMIrixPVTUTJ+6BU8TD5ohb5O0R/lzE5gaoukjzqyHLhSWev0GaWC5sq9sgLONPtge/52qJC
	Cno9jmLyYr/T3dO7uH4PND3oqyUM9P5qIgHSdRD/ZdjwsWi4lzn/3sqwq5042AOJD68GwjPcw==
X-Received: by 2002:a05:6000:4693:b0:487:f31:8037 with SMTP id ffacd0b85a97d-48721bec0a3mr1070831f8f.14.1789724401795;
        Fri, 18 Sep 2026 02:40:01 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-487200737d6sm2942234f8f.24.2026.09.18.02.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:40:01 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Sep 2026 11:40:01 +0200
Message-Id: <DLICCNG5E097.3K1S7KX9M5QVE@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 1/6] curl: Fix CVE-2026-8286
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>
To: <devanshp@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260904090007.27374-1-devanshp@cisco.com>
In-Reply-To: <20260904090007.27374-1-devanshp@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2026 09:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246207

On Fri Sep 4, 2026 at 11:00 AM CEST, Devansh Patel via lists.openembedded.o=
rg wrote:
> From: Devansh Patel <devanshp@cisco.com>
>
> This patch applies the upstream fix as referenced in [2], using the
> commit shown in [1].
>
> [1] https://github.com/curl/curl/commit/a86efdd7ca5433de9231e650f18247de8=
319ad16
> [2] https://curl.se/docs/CVE-2026-8286.html
>
> Signed-off-by: Devansh Patel <devanshp@cisco.com>
> ---
>  .../curl/curl/CVE-2026-8286.patch             | 60 +++++++++++++++++++
>  meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
>  2 files changed, 61 insertions(+)
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8286.patch
>
> diff --git a/meta/recipes-support/curl/curl/CVE-2026-8286.patch b/meta/re=
cipes-support/curl/curl/CVE-2026-8286.patch
> new file mode 100644
> index 0000000000..ec2f6165c3
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl/CVE-2026-8286.patch
> @@ -0,0 +1,60 @@
> +From 471592386ff977dfd3e2de107b8f81dfc1d3d030 Mon Sep 17 00:00:00 2001
> +From: Stefan Eissing <stefan@eissing.org>
> +Date: Thu, 7 May 2026 10:30:07 +0200
> +Subject: [PATCH] url: fix connection reuse for starttls protocols
> +
> +When a connection is tested for reuse in a transfer that *may* upgrade
> +to TLS (commonly via STARTTLS), the SSL configuration must match the
> +existing connection.
> +
> +Reported-by: Andrew Nesbit
> +Closes #21522
> +
> +CVE: CVE-2026-8286
> +Upstream-Status: Backport [https://github.com/curl/curl/commit/a86efdd7c=
a5433de9231e650f18247de8319ad16]
> +
> +Backport Changes:
> +- curl 8.7.1 predates the url_conn_match refactor. Carry the upstream ma=
y-TLS
> +  and require-TLS distinction in ConnectionExists() and preserve the ups=
tream
> +  TLS configuration matching behavior.
> +
> +(cherry picked from commit a86efdd7ca5433de9231e650f18247de8319ad16)
> +Signed-off-by: Devansh Patel <devanshp@cisco.com>
> +---
> + lib/url.c | 9 +++++----
> + 1 file changed, 5 insertions(+), 4 deletions(-)
> +

Hello,

This patch and the other ones in the series have formating issues:

> +diff --git a/lib/url.c b/lib/url.c
> +index dfcd6f4841..9e1ca0336c 100644
> +--- a/lib/url.c
> ++++ b/lib/url.c
> +@@ -935,7 +935,8 @@ ConnectionExists(struct Curl_easy *data,
> +   /* plain HTTP with upgrade */
> +   bool h2upgrade =3D (data->state.httpwant =3D=3D CURL_HTTP_VERSION_2_0=
) &&
> +     (needle->handler->protocol & CURLPROTO_HTTP);
> +-  bool req_tls =3D data->set.use_ssl >=3D CURLUSESSL_CONTROL;
> ++  bool require_tls =3D data->set.use_ssl >=3D CURLUSESSL_CONTROL;
> ++  bool may_tls =3D data->set.use_ssl > CURLUSESSL_NONE;
> +
   ^ For exemple, here it lacks a space to mark context.

If you use interdiff to compare the upstream patch and yours, it is
quite noticeable.

Can you send a v2 with those fixed?

Thanks!
--=20
Yoann Congal
Smile ECS


