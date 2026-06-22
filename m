Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05C9ACDB46F
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 21:48:43 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7933.1782164915316130168
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 14:48:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=T0KrmRi0;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49222b6e871so42145875e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 14:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782164913; x=1782769713; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UANWgRBcQvPjqlnNQzBfrkSIEh/9YQrTvCrRTqj3yjY=;
        b=T0KrmRi08kB3BrEmYc8jlj8E3cZyhPQz/ABWnBFlVNQRbDIcBjbn5QW+qSWVpoFUQ8
         jDJMceBn+PgE5XfKpNy2cArgyM6c7UDnd/xZ1lsUWiOHdF9wWgsLMiZ82b4SXghbNfKk
         O8E4KOqnIGvXO5wT7nA7JaYyBcr/TEZhYvaP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782164913; x=1782769713;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UANWgRBcQvPjqlnNQzBfrkSIEh/9YQrTvCrRTqj3yjY=;
        b=DUSYnzNnLedjj7RwfESuC8GiaCgRtslg1LZSY2LhjdTmUyOFBxBZ/I0V3Biv3YuwDs
         8D991Ql4TOylh762Efq+s33+falTGzDZ29Y7q8Mc5TTw3orviRtsqvKgcNgINp6aV2Pn
         Yw+/ekhm5ocp72p0KN+CXHzPXcBhmV36+zDZNzR0vw/QAHUrK2z7v9S5Xqc2GHBTzPz3
         xR95Q8+mS7fHE0OUu1NEuJ7xU+YiKtl+2V2BwLbHKM7Le1JsGmprW42r0aNfTI2r6Cbn
         gSY8rbOImWVVYBm0PXaZk1mfc9Zt5wr4EgkYJBjvf25t0ZM0sniSkchU8HQSHTr/UZss
         Q9iA==
X-Forwarded-Encrypted: i=1; AFNElJ8UxZOOfF1Egi/cgUmePzoJWHA+ojhzDrE4exOUwQonD4Ve3o0uGEYSA67jwPSQRxazQe7fFROYonLDClFCVsUuRA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzOO6k8XB3t5Yt2jk6vph382i0UVjkanBUqo0beu10NAMhtO6ai
	r9g+5BhyCSluYRLY5c4jsjqs7ASpBs+e3StLsxDlVuYMdpldS+c3dLM9Urt/u9qL5uM=
X-Gm-Gg: AfdE7cmLfvbkGO7EUC0uGttRl4VlN4T3wywWMq1gjC4WfHxnERwUFhpz7EI+wf3jV3U
	Wt2egSNE8xWUAE+L0fCslio5d8M9ugMPAR4Rgl5a4sbXm2GLTD4F9+JwkxpS6vIFsS9pRjcVtjy
	VQdi2MENVD1ReHOzfC365YHtkay1haMWu4EuLsxRD6NIipmXVt7Z1w/GA4fTDGm4qsUshwx2FGg
	2cuiBekEU7l4sJ6wT5HMcINugTghR+7pXZ2/grLPj+kZ/FMuldiR7cSdvvU+Xhqdi9yk+SAF17u
	XMfuBrYm7ceh5WQ3a2LYql/QZg5kRircCAigHoRI98xvy7d/blGegOB0b7FQcBzuJafvty7fqjz
	vziz4kgS/QgRjxTWVdQTQWhSawy4rn8aDba3NsMfIsooF4Eo68+a0MmQ6o8PoTJMR0aR1VCuS7N
	yRBvm4l84OjJ9StRvfHQWyOYWz4JPwN/qc+bwdZYF4Ecx2koOvNy5FT7DALhfD9wD3SLiCQRfau
	8Z8
X-Received: by 2002:a05:600c:8206:b0:492:3fb5:4697 with SMTP id 5b1f17b1804b1-4925b34e915mr114485e9.5.1782164913441;
        Mon, 22 Jun 2026 14:48:33 -0700 (PDT)
Received: from localhost (2a01cb001331aa0090bf04b3361b3f57.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:90bf:4b3:361b:3f57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd15470sm379511615e9.2.2026.06.22.14.48.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 14:48:33 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 23:48:32 +0200
Message-Id: <DJFWQIEX2ERL.2PN6ITPUBZGB1@smile.fr>
Subject: Re: [OE-core] [scarthgap] [PATCH 2/2] libsolv: Fix CVE-2026-9149
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>
To: <spushpka@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260616063136.2772168-1-spushpka@cisco.com>
 <20260616063136.2772168-2-spushpka@cisco.com>
In-Reply-To: <20260616063136.2772168-2-spushpka@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2026 21:48:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239319

On Tue Jun 16, 2026 at 8:31 AM CEST, Shubham Pushpkar via lists.openembedde=
d.org wrote:
> From: Shubham Pushpkar <spushpka@cisco.com>
>
> This patch applies the upstream fix as referenced in [1], using the CVE a=
dvisory shown in [2].
> [1] https://github.com/openSUSE/libsolv/commit/210386037c892a720972ad35a3=
d8f7073b4d763b
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-9149
>
> Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
> ---

Hello,

Looks to me that this patch is also needed on wrynose.
Can you send it there, and then, send a v2 of this patch?

Thanks!

>  .../libsolv/0002-Fix-CVE-2026-9149.patch      | 152 ++++++++++++++++++

Those patch are usually named "CVE-2026-9149.patch"

>  .../libsolv/libsolv_0.7.28.bb                 |   1 +
>  2 files changed, 153 insertions(+)
>  create mode 100644 meta/recipes-extended/libsolv/libsolv/0002-Fix-CVE-20=
26-9149.patch
> [...]
> diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.28.bb b/meta/recip=
es-extended/libsolv/libsolv_0.7.28.bb
> index 2b1b079ce1..4a9dd1278a 100644
> --- a/meta/recipes-extended/libsolv/libsolv_0.7.28.bb
> +++ b/meta/recipes-extended/libsolv/libsolv_0.7.28.bb
> @@ -11,6 +11,7 @@ DEPENDS =3D "expat zlib zstd"
>  SRC_URI =3D "git://github.com/openSUSE/libsolv.git;branch=3Dmaster;proto=
col=3Dhttps \
>             file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
>             file://0001-Fix-CVE-2026-9150.patch \

CVE-2026-9150 was already fixed by a very similar patch sent earlier so
you will need to rebase once it merges.

> +           file://0002-Fix-CVE-2026-9149.patch \
>  "
> =20
>  SRCREV =3D "c8dbb3a77c86600ce09d4f80a504cf4e78a3c359"


--=20
Yoann Congal
Smile ECS


