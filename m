Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 767E7CA5FC4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 09:07:40 +0000 (UTC)
Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7099.1790932050021030851
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 02:07:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=AufZe7Rn;
 spf=pass (domain: smile.fr, ip: 74.125.225.99, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b09f6bbe8so977613f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 02:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790932048; x=1791536848; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xy7iIq8fLp5Cg2Pzrxqp86orDT5qlcPAzLQqp4CZv2U=;
        b=AufZe7RnxX5sOIRKjzE3zHVVZX0+p9wRdFIjj3YrY0PbBmYlIQm5q/xGf+IH0rqFYG
         JkmSVlTd5WlV0fHZBVDAuh4nmBH1r80UfGeS8qlxGT4LksMS5NlLmvShZGcXkjG2ey3t
         cSbWa+zdfzyK4PGFyqav/L4Tm8AaSuynh5exU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932048; x=1791536848;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xy7iIq8fLp5Cg2Pzrxqp86orDT5qlcPAzLQqp4CZv2U=;
        b=vRaeIrM7EGiOsRe7m8/gu2G8aTGSYV/uaJK1LntgVWgbRk3tPVQoF2D4cozH3a4VLe
         Q10soC3fRPzoJHs8VTukypZdXMpb/N9p1JgrYf++gzz3FvLHx66S1LdfzwEpQBpCEk/9
         pqSY6wrkOlwPM6DQ2pbiFl5XcvcCXjqNto8Ob+Kv27MFgkaNk2/fMnyyjvFg35gojiUi
         jRzPZTRSwC+yQQo7X1nOPx31h00sHpASe+GxPi8C2EvmluE1d/NUUv2D2XjRSJDyzirE
         47exNCxvfljXA1gjPDYiC+qwH6+j8Y1bvCCjvwx9681PR3hA+zkWh0mx0BguHxdOZvCL
         AK/A==
X-Forwarded-Encrypted: i=1; AKwUvBzTgV+Vl5zdwHcUC8eIq+3hHvYXv6R2VveVX1/LsJRB5SzzDhwu39CKISOp5N6rhLhJcU1+DghwfNy+p1PQ8VRC2w==@lists.openembedded.org
X-Gm-Message-State: AFq9FYKSJtJniZiCgZZua4ZSUeNUY9VPpTGc31IkIP+aXIqMr52nfMsb
	lTZrlepUZ520ylZ2wOv20tW5feel0e1v3H/o+0dsersZjA6c1f0fm87QndSEzP+TmmRf6PGR04m
	k2OqwjvQ=
X-Gm-Gg: AYBFou0V0dyNCkiRyw/FnpzbCNMcFkT/afQLF+se5hp9UZj7V8zpa7lrl8OOzwwElQW
	wT/T1aPRKmwPNiUdk1JtRZ1fFcArhQuFd1x/VQKm4T3lq5vA8+yJUWEZknDNk/OKVD7TSD8JKVD
	0Sv72z/gmnV+xVOj2d3vPw+dexyQgmn2BCx9Y2YFM0lUa5sq9RBbdzyAP0ZnzBytevWNQz3iMGX
	nu7QEDxus5oRUdhQPmSSmZdNZ5GLglPzqyjd5lLLh0kVydLcOHh/myTGLRTjSf/jHgWwWgEu4LO
	E/Mqfd3BwM7MWjRmQ10Dt1jYioW4Puibb3rKbW0GInuRCT79N3PVLIr3ei1vDuMEWYhBSKXxcKX
	rY+/RlN2co46CyF7lsMnPNmV24Tx8ApV/kL0vdN0a9PfwwsCh96HEuQCcX8oZqq1Ubik5Iki9YU
	7i/EZtDzxS62phyyym7h+j/A0t42pZ5Fk46y9KjfRAnkCOypqYJTPGlVC9/MJfvPAX0Up1N6Gb/
	c8R3rLXibFEM1nD4FaRnJYsjsMfqX290kOYVB4qrz5eJPjkSHohWFgSiVTFvA==
X-Received: by 2002:a05:6000:38c:b0:48a:fbd2:c2b6 with SMTP id ffacd0b85a97d-48b12734e06mr3838916f8f.55.1790932048012;
        Fri, 02 Oct 2026 02:07:28 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f9bc0sm4322902f8f.41.2026.10.02.02.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 02:07:27 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 11:07:27 +0200
Message-Id: <DLU8FCHIHDV4.IM2I01UE56W8@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH v2] python3-click: fix CVE-2026-7246
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <dkelaiya@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260923063627.2741697-1-dkelaiya@cisco.com>
In-Reply-To: <20260923063627.2741697-1-dkelaiya@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 09:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247094

On Wed Sep 23, 2026 at 8:36 AM CEST, Darsh Kelaiya -X (dkelaiya - E INFOCHI=
PS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Darsh Kelaiya <dkelaiya@cisco.com>
>
> This backports the click.edit() hardening identified as the fix in
> the public advisory [2], using upstream commit [1].
>
> Upstream follow-up commit [3] adds regression-test coverage for editor
> command parsing and clarifies the related source comments. It does not
> change runtime behavior or provide an additional security fix. Carry it
> as a separate patch to preserve the upstream commit boundaries.
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
>  .../CVE-2026-7246-regression.patch            | 124 +++++++++++
>  .../python/python3-click/CVE-2026-7246.patch  | 201 ++++++++++++++++++
>  .../python/python3-click_8.1.7.bb             |   6 +-
>  3 files changed, 330 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/python/python3-click/CVE-2026-7=
246-regression.patch
>  create mode 100644 meta/recipes-devtools/python/python3-click/CVE-2026-7=
246.patch
>
> [...]
> diff --git a/meta/recipes-devtools/python/python3-click_8.1.7.bb b/meta/r=
ecipes-devtools/python/python3-click_8.1.7.bb
> index b75d9108893..8a077f48c7c 100644
> --- a/meta/recipes-devtools/python/python3-click_8.1.7.bb
> +++ b/meta/recipes-devtools/python/python3-click_8.1.7.bb
> @@ -12,7 +12,10 @@ SRC_URI[sha256sum] =3D "ca9853ad459e787e2192211578cc90=
7e7594e294c7ccc834310722b41b
> =20
>  inherit pypi setuptools3 ptest
> =20
> -SRC_URI +=3D "file://run-ptest"
> +SRC_URI +=3D "file://run-ptest \
> +            file://CVE-2026-7246.patch \
> +            file://CVE-2026-7246-regression.patch \
> +           "
> =20
>  CVE_PRODUCT =3D "palletsprojects:click"
> =20
> @@ -36,6 +39,7 @@ CLEANBROKEN =3D "1"
>  RDEPENDS:${PN} +=3D "\
>      python3-io \
>      python3-threading \

Hello,

> +    python3-shell \

Why was this added? master does not have this RDEPENDS. If that is an
issue to fix, then it should go through master (and other stables)
first.

>      "
> =20
>  BBCLASSEXTEND =3D "native nativesdk"

FYI, the rest of the patch looks good to me. I've not found convincing
reason to ignore the CVE. So the fix is the way forward.

Regards,
--=20
Yoann Congal
Smile ECS


