Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E04D3C624A4
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 11:18:45 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5345.1788434317005281558
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 04:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EMmIqte7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so18576905e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 04:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788434315; x=1789039115; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RdOIbQING1RcPXOmW+kzFZtPJT20XJM+MN7XxkojUR8=;
        b=EMmIqte7oRmP5M4r1uxAagCHTiQPDLNnLzXk8raAX3M4aVZ0ZTD6WjgEkWEqnO0A44
         D00K5YIHCAdVtGzrSjAEGWewLmkTJu8JuEc7uNeO+ngZ7oXqQatslQwRiYdIihwFRsRV
         4o3DLev2f/Wm3nGd0Jsx9ge7Opd4kjeUM3wuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788434315; x=1789039115;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RdOIbQING1RcPXOmW+kzFZtPJT20XJM+MN7XxkojUR8=;
        b=oyJKlUo8iobEsHOpRmhyDD7ii+CNu+ImJGEm6xAa+qg4ox9fQQOOYBaeEWtiAFx8Dk
         BRwsyzgTQEnq29AHhxP43vAiJbqU+ZP+e/1xqQlP7Bl+cLj9mt8Rhi8ZDsQtb5Hp0UVp
         egMeUI7qIFutWuujX3E3pFsY5jI9ZKDqbaxnJYprLes3vbGMAcrgnp7GzvoRrfsMlUxH
         T6Nxbj7X8Id0Fw2AJitbcUDFnTopom2KbXsoGk7qgIoU6WEZPy0ScCH9jnDqC+M8zJdz
         f8Njk0WzIg2kPDPmUz3xaUwOehwN5D5tz93FJYWm7bz7NO1V6YjPL3bsQ3n9gaqfRfor
         EL2A==
X-Forwarded-Encrypted: i=1; AKwUvBx1oMgx7FN1sx6dFrF7295Q5aiYN7HnHvKhheK/CTTxpLWmLh8Nytim/QliQ4x/LLqXpo0uBmapMIMYzqXhQCCP8A==@lists.openembedded.org
X-Gm-Message-State: AFuF++nx0Lds1INjDVwEEWGtLEnDA4N9xq4ITp+50V+lZgGXW+P2rv3l
	emf9lZtcg6a7Wk8B5FlNRqZiiUceeB+T7sKQ9HG/wpplkyP9GBPAt63VX85kStJn+0M=
X-Gm-Gg: AYBFou1CBMdWoSP1XV0beRPOJ2E791MahqSCgdYDcDxExMBwnWfFArkkzBaXlUbSmdR
	kRRouWFYPH9xn5MWuelisgNjVsxN0mk4rtNfVX8vydRvzZTJYEQx/0VIL63GZzKGBxrYRdlIZkK
	DRqow/zCX6hWjZdKu0u+J8GGdy74o6uN8KCYNdw2k7nPPJoovSJcMZcTRx+EBG9QvwndaI4dJ78
	IZtf5JaOnjyAg7jvtBFnif5KihkWDJal6sgludrGp3SJo7IGzcftyIwZ+9yJyKu23ey+BmgHFXJ
	ZJKcKAksGCROl/s19xoEdRs3WogpUWhJPspHqmJp7US9vn2Ez6dCUqvnOA0nK3xSuvRKM2DtFsa
	WkW3/ufSBkDmlKdKAUa65T4DzwyRjgfJyoYhxkO2CJN2chxr+aeXBVSSWtOeNpN5ejlH1YRO7P6
	BS/oPxKhs32DIQvSwu96oDbqq5qYkQGVdTQYWK04lGCAeQev6juriGn9ZIMrgpnjM+uf6/A/IJm
	YZrpkxwUUjnZVbraNbk3ZIPYb6Mou8+ItNeMwaU5v9QjxcYXO81rw==
X-Received: by 2002:a05:600c:a0b:b0:49b:910c:7703 with SMTP id 5b1f17b1804b1-49ce5818612mr199333775e9.9.1788434315145;
        Thu, 03 Sep 2026 04:18:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a76d:4840:1f4f:ed41? ([2001:8b0:aba:5f3c:a76d:4840:1f4f:ed41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72f02sm12891526f8f.3.2026.09.03.04.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 04:18:33 -0700 (PDT)
Message-ID: <92d96154859f9da579f751003a941a97921a32fb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 02/25] devtool: ide-sdk: dedupe
 solib_search_path entries
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: adrian.freihofer@siemens.com, openembedded-core@lists.openembedded.org
Date: Thu, 03 Sep 2026 12:18:33 +0100
In-Reply-To: <20260830214912.1346063-3-adrian.freihofer@siemens.com>
References: <20260830214912.1346063-1-adrian.freihofer@siemens.com>
	 <20260830214912.1346063-3-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 11:18:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245028

On Sun, 2026-08-30 at 23:48 +0200, Adrian Freihofer via lists.openembedded.=
org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>=20
> With usrmerge in DISTRO_FEATURES (the default), root_prefix becomes
> exec_prefix, so base_libdir and libdir resolve to the same path. This
> made most entries of solib_search_path() literal duplicates. Dedupe
> while preserving order.
>=20
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
> =C2=A0scripts/lib/devtool/ide_sdk.py | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk=
.py
> index 4fdeeec24d..6f08940c9c 100755
> --- a/scripts/lib/devtool/ide_sdk.py
> +++ b/scripts/lib/devtool/ide_sdk.py
> @@ -643,7 +643,8 @@ class RecipeModified:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
os.path.join(image.rootfs, base_libdir),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
os.path.join(image.rootfs, libdir)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ]
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return so_paths
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # base_libdir =3D=3D libdir w=
hen usrmerge is in DISTRO_FEATURES (the default), dedupe
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return list(dict.fromkeys(so_=
paths))

This is a little hard to read, would set(so_paths) work here?

Cheers,

Richard

