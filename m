Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1802CCF2C4
	for <webhook@archiver.kernel.org>; Sun, 18 Oct 2026 22:48:34 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23367.1792363708933673608
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2026 15:48:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=b1TQZexS;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6e560e00a86so1148108eaf.1
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2026 15:48:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792363708; cv=none;
        d=google.com; s=arc-20260327;
        b=hW/f8Xlcu4/oGjh8wdxDEOAab7EIX7XfjGRaHafq+cjVVCm6I27kiTXapO3JvU+t7i
         LFTQ4OOSNX9EZrHtGyJh0uwyRxOYTk5Sn7AIK13jvtq1ZbdxGFcdq6d6WVGaXX9Kn2sP
         +rUF7UDIkU6r7bMe4ABKASDYt+/a02/eFuO0Zpc9NC/NjhWMIbx6zGCfWsyji/Edjv6I
         9+tiO1AWdzQBLbqbCoxoNWn+0paYLjFsofzoI1CAxx+q64+1meXBGIXBmNbtwzKsmwZ8
         Z1NeLEOtSdOCuaPzwJnPySrQU6It4kIv+NBzDmABv0j/2HSGYhzrtcjwLIYXRPv4mejP
         8cRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X05tiozzynsP8bw08apcica81n0YCRqGAn132aQ7SjU=;
        fh=lFBhY9t4af7D81w1HMWCV1n8KgtLt27F6ny31abXH4s=;
        b=n9o3jT09xNvYe7lZlJq43pzjIaf7/rD0Fu3+XWydtWaxmOF61dMT/L5ovb8jvZaCcf
         NW/t9Xxa8kyfBAhJp8tdixid61ZTsZSxWAEiqOhilfla9aVOY9Y9YFqVLZN7LZMEP6tu
         O6TDYnzo7PQjMZ+htOdoEyvibeLNicbbX7/PwkiosxzurveREwdxcmyF+XA7oDaIoJJn
         m+XTBp5zJLDF6CyPtN8LMfTXhv8cZT79SCvF+P8lRkFtGPYoG2j5+4TdOj01q+4J5wbv
         JVUHb4plYi/eWLX+l/inDuEdyIBu/4Qc/G+67fRdJkzv2Mvbr1ivmAy8OU3uHqRJ8NU7
         ijtA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792363708; x=1792968508; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X05tiozzynsP8bw08apcica81n0YCRqGAn132aQ7SjU=;
        b=b1TQZexS/tnk4UxRxI5CUZod93Q/2poOZ7sOMjNxKQ/E4o6SpKST8WP9e8cY5zpd2P
         khczxcckr9BUmCWCHLRdX/RMJUPLHNmDlSLB6GsM6sK/WpIwKRRP0aGvHLethiOI9Pcq
         Q19DV9e7GE3vGspBbmzlCOPRZd12wlG9RXEiYCZ/3eU7YuqiDpfOkJRAVQNXo1Sk8k2F
         1fesEsZwEE7e3BQTNKvw+XoWbG3DbrwYZJAcmtxErNv57DnEg3Dysh8N4nlojj030ETS
         zTA19cm/21LT7w8dMR5N16nG/9tMlVa6HCmhQoto4Yn1CnQrn11maIx1fCNYYY6gA7Xs
         TIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792363708; x=1792968508;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=X05tiozzynsP8bw08apcica81n0YCRqGAn132aQ7SjU=;
        b=1P6cM9J/xe8tBKrYq//aCgslh+wftuYVpnfISf9jdzq1ZWzdqXl51+7OnrVI//YEy+
         UengTJ/nXKQXwSGNhhfgQhL22v4Osbb+FEc9GFOB1ILDoMebUiH1Hq+wY4sk4WZ4tdGm
         2drZGW0Qz4bO2YoAqmqqsiLkUZxhMWoDJ5TucgMkCG8NvS8eySGjMbnzWe40er78NnUw
         ex69A1q1Re3Ezcq9kAp4JQr1cLTLiaHcl3ObVsEh5uxkQ5s8I0fn0VjdWl+Y0yQRX/UA
         PTCMc40KaXQegQAqnlQprF9W4kUgkefYOso+zx7oBIEa92b6GitDxBgAY3lmuDqxYdg9
         hHSg==
X-Gm-Message-State: AFq9FYJ7IU7qcQbmfTtHDbRTNZXhl07XhsnBpyLjt8C3mM/een+6jt/5
	RmhsBk3HTdQVubPQDNVAytiloRFch9PzAD4kTuCqrrXF4gcqilrUq9b9HoOQF+tYbgbdCKKeiAl
	3Qt1dCO+2tEIvaxtnMzoD4OK0GpfZNm2FhrUb
X-Gm-Gg: AYBFou1nbsD7TIX8jb5tpaC384xCU4sTBoec25N8j9xsPRl66QQe0x8GWX5pm5gXabO
	Cd4pduDX/1nqaaUXNlgG7m7dMNTl1VF7JpLYbpupl4XXpbU75t+gSUf3YLFxQbytHftnmRp7KIy
	qyvG0A0A9OOSgp6ppwvR2CAqZkqN5ae/U7a40XSnn/3fcSLC8mZzaaPfUAq3JBYIEA0IKZ6ZQCU
	3xTC9DeSqRI0wLo2nnH2jAr1szDvZuOxUVvkoVNEi8MZhTOXCUYOjNGj+AbHPo0Nyqq3CuE5Wz3
	maX6/nfNMtngI0/1cR5QeJXk71e/W2UeLrLhx3qmuwzhgWYHlWfihPH1fVYG+h9s4+G9Bg==
X-Received: by 2002:a05:6820:4b88:b0:6f4:9618:bada with SMTP id
 006d021491bc7-7034f589fb4mr3781265eaf.0.1792363707978; Sun, 18 Oct 2026
 15:48:27 -0700 (PDT)
MIME-Version: 1.0
References: <20261018223644.291257-1-ankur.tyagi85@gmail.com> <20261018223644.291257-6-ankur.tyagi85@gmail.com>
In-Reply-To: <20261018223644.291257-6-ankur.tyagi85@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Mon, 19 Oct 2026 11:48:16 +1300
X-Gm-Features: AclHuK9mM-k_Zi3fYL6mqr6XeAdAlrB8l4foQNKyd-jBpvmjhV9yBhglYr7eSxE
Message-ID: <CADySD0EjFN_MfZT9M5LLWD2gALs9_QMW+C2+8RHpPmWZQzoYww@mail.gmail.com>
Subject: Re: [PATCH] librepo: upgrade 1.21.1 -> 1.21.2
To: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Oct 2026 22:48:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248116

Apologies, please ignore this patch.

Patch with correct subject already sent
https://lists.openembedded.org/g/openembedded-core/message/248114

On Mon, Oct 19, 2026 at 11:37=E2=80=AFAM <ankur.tyagi85@gmail.com> wrote:
>
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Changelog:
> https://github.com/rpm-software-management/librepo/releases/tag/1.21.2
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  .../librepo/{librepo_1.21.1.bb =3D> librepo_1.21.2.bb}            | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/librepo/{librepo_1.21.1.bb =3D> librepo_1.2=
1.2.bb} (94%)
>
> diff --git a/meta/recipes-devtools/librepo/librepo_1.21.1.bb b/meta/recip=
es-devtools/librepo/librepo_1.21.2.bb
> similarity index 94%
> rename from meta/recipes-devtools/librepo/librepo_1.21.1.bb
> rename to meta/recipes-devtools/librepo/librepo_1.21.2.bb
> index 9cefbfd48e..ab60e76b6e 100644
> --- a/meta/recipes-devtools/librepo/librepo_1.21.1.bb
> +++ b/meta/recipes-devtools/librepo/librepo_1.21.2.bb
> @@ -9,7 +9,7 @@ SRC_URI =3D "git://github.com/rpm-software-management/lib=
repo.git;branch=3Dmaster;pr
>             file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-runnin=
g-p.patch \
>             "
>
> -SRCREV =3D "86ed082e25bbd1901d21d75924297c7697b33307"
> +SRCREV =3D "f892f216a8f7934f32846712f56a27f997b300a3"
>
>  DEPENDS =3D "curl glib-2.0 openssl attr gpgme libxml2"
>

