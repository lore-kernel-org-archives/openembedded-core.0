Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B00DF9B5F2
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 09:12:01 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76753.1776849116906361773
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 02:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lEImmP7o;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43fe3e22e33so3457366f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 02:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776849115; x=1777453915; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vafbnyT8bl8TUp5VrM01u49pWlePcmp+kuB1yvomvNg=;
        b=lEImmP7oRSZWzMg16ol+QvcIGKqv71I3XU2gvIxlWUVYmsuyCkvnlSkhhGSbguVXm2
         vTRK5Ju1EgVnchszZZlxA7AHpmmgXmMh8hYqg9lRYGj64e7RZrYWHPk6TYD+Abbu2nCo
         b2V7ISfgJLGnyJaYwUfusZz/NtByWqqDLBAcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776849115; x=1777453915;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vafbnyT8bl8TUp5VrM01u49pWlePcmp+kuB1yvomvNg=;
        b=Qgo286pzOThUmXwOsoz0CESvA4aduRbrALwA4rfpOieLfIhKBV1YXfzHMW4Eu8Mjv/
         H06/7stRtSPoAaxNCeQMR2sXA9+glrc+URLGLnN9i5EFu3mvjEjug0Wlu4T8atJc2cyQ
         1frsAzTBFjQrBKd2yxAW+3h4eJ9ec21Oh/qbWWxaMS5hR/5tvSGWy3+Pq4MMxuPpurzO
         WQHAehkjSgja+a3n8cTtSVHdif0P16VA0h+Vv+rs4VL/q+wWVPHu7ZCxeT77uqMpdUUj
         7XbqNsNWmCHaP+5pYok/cpPJERMEizhKtauV5YtLFTBawKtk95Z1P+mc7vy7kqmR2yV3
         OvDg==
X-Forwarded-Encrypted: i=1; AFNElJ8xZllX66/N/MKFjFBYQtfxs7zV9NIbP8n+0Gy5g2rHqOcLlkLNFz/rVo/VxVow/0W5OzqWUw41RQd4Vv9zZ9HvQw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxIRNQabPj52zgDu1dJSKNRCt0TzMJ3Wnw5lx/584Bw04r1WuOW
	FVFXu3bJOdxLVN+kDgZB3qZd3LHqhfM7l/DbAW87vcaKr/+aqBdw9jw7PinZxufgZ+/NzsCjPi6
	JpZZZ5uY=
X-Gm-Gg: AeBDietZkKTQk+Ps5BVOauOE+LXVCLhpJ2jFaQSV/Og5CtQu7+YRu9Ybx+Ve0ziHaL4
	XjbY/hr/g7GhwWxO0WmrqWYU1ZjQJdHBIvpUBL7hlL51y5mdSUbFqjVu10UHgJtRSCM1bUpf4Ut
	zDwHZztJey95gXJmLtnzOYrlab9dR1miZrV9yLSrgAmyPEH0iXKrqJhYmdtDQsckvWohkyF0gcM
	f9zDlynnViuR6UgmuVGs4Jv0g2w+xOwyXzXtUJur3ZiTa3IjIUj1bVyxG8QpQLPCEN7BmbS0WL/
	HJHHQ07OJtuVYvhkmAhirsS3oStZSgejz6i+nRnwQCCOBGCinGsQjvaWkIoCBlri7sIoqtWYm6J
	+nUigHPUA2kxh1tqD6aUKtm7CbIYifGcJX5smZc2F3YTow1PPVfmQQbp3qGpxV3feh744zu6XHc
	QGdn5YNrh3T82CinzA59iAva46/9VkNU49ucGqQWNrOWj7M/h26BnfauGvG+UgaQXKWShAen6KE
	faPlgFVXkvZw4ABlm36/g==
X-Received: by 2002:a05:6000:2c01:b0:43d:7af0:3a8a with SMTP id ffacd0b85a97d-43fe3e20a0fmr33420347f8f.46.1776849115072;
        Wed, 22 Apr 2026 02:11:55 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a18csm50228784f8f.20.2026.04.22.02.11.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 02:11:54 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Apr 2026 11:11:54 +0200
Message-Id: <DHZKFY8ILV2M.QM2AAGL87S7U@smile.fr>
Subject: Re: [OE-core][whinlatter][PATCH] expat: mark CVE-2025-66382 as
 vulnerable-investigating
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <adarsh.jagadish.kamini@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260422085436.320259-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20260422085436.320259-1-adarsh.jagadish.kamini@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 09:12:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235702

On Wed Apr 22, 2026 at 10:54 AM CEST, Adarsh Jagadish Kamini via lists.open=
embedded.org wrote:
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> No fix is available yet for CVE-2025-66382 [1].
>
> CVE_STATUS[CVE-2025-66382] =3D "vulnerable-investigating: no fix availabl=
e yet"
>
> [1] https://www.cve.org/CVERecord?id=3DCVE-2025-66382
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---

Sorry, but that will be too late for whinlatter. I finished reviewing
the branch and will start the release build soon.

Regards,

>  meta/recipes-core/expat/expat_2.7.4.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/expat/expat_2.7.4.bb b/meta/recipes-core/e=
xpat/expat_2.7.4.bb
> index f1eff49688..65aee9d17f 100644
> --- a/meta/recipes-core/expat/expat_2.7.4.bb
> +++ b/meta/recipes-core/expat/expat_2.7.4.bb
> @@ -36,3 +36,4 @@ do_install_ptest:class-target() {
>  BBCLASSEXTEND +=3D "native nativesdk"
> =20
>  CVE_PRODUCT =3D "expat libexpat"
> +CVE_STATUS[CVE-2025-66382] =3D "vulnerable-investigating: no fix availab=
le yet"


--=20
Yoann Congal
Smile ECS


