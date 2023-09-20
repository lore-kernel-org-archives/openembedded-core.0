Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A67DECE79AB
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 07:54:52 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.31902.1695196483357186153
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 00:54:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FfAExgNC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-402d499580dso70154845e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 00:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695196481; x=1695801281; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYvKzqZgLa0EX9VdDo1B8dUlrpkffuNCY5nRMoeaw+c=;
        b=FfAExgNCIuSlurVuroB9qQvyCLHL7CM5E3yb92r7TncRUckFFi5jCwki7obyaO+wV/
         uLrHZE6mNA2MaO9sEeeVgQeGwufWwkd9eRw/7cIogiBDUW5amoFJmk4az6Vmlc2vUd5s
         4q/tdsqR4iXi6dVKkl8G1rPrBgMUPHTmedAW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695196481; x=1695801281;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gYvKzqZgLa0EX9VdDo1B8dUlrpkffuNCY5nRMoeaw+c=;
        b=Gy+jB28P7B7kjZDas/gvlJUozrkWjPnY+1nbxlQYZcSll7wKEKLuLP8HzvEXaHChcr
         jc6nddP5MYYtoBfsEfi4DAPgiVsyaAyO4Y6xIHVM2OSqpaeBTuwpz2Ik+q+/s5LC/IPr
         c5KvGTioC+gdQlvX0JyuqrBNd8MZN9efv1AN/dZRBBDm4AYUxZZ9tGAz2/HGgUbCBZRD
         1zdGtmCJ6JFxXRNiiXv92CIMLsbCz4mDY2rDNynE21q+Zso9O5i/5/bnbdz3hBb2ffM5
         Q/2qs7qRHtA1iTJ2+ai3m0J8BAAoAm0nYdPdBIYiGffoOyLDULJ1ypvg5gg27vmHOAUv
         p+mQ==
X-Gm-Message-State: AOJu0YxbAWHmtGzSz5Ki2h2Jv4fLashhCMjOWAwVrrsyhxx2ARK3kJGA
	+O5ns1UMKf3AoqSSConvZYSbCg==
X-Google-Smtp-Source: AGHT+IHGpPCNbkRxwN2C6YiikRzaQ/ZDQkG1wU/ZfeED2E+vBltHTsKwthROIg08Glc7C9/Rr/oiSg==
X-Received: by 2002:a05:600c:2144:b0:3fd:1daf:abd8 with SMTP id v4-20020a05600c214400b003fd1dafabd8mr1555185wml.40.1695196481580;
        Wed, 20 Sep 2023 00:54:41 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:34a6:a1c2:97a:851d? ([2001:8b0:aba:5f3c:34a6:a1c2:97a:851d])
        by smtp.gmail.com with ESMTPSA id c6-20020a7bc846000000b003fe29dc0ff2sm1191319wml.21.2023.09.20.00.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 00:54:41 -0700 (PDT)
Message-ID: <4b37b846473fdd68aba377018638086590307722.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] gettext: Disable error_at_line detection for
 musl
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Wed, 20 Sep 2023 08:54:40 +0100
In-Reply-To: <20230920054733.2852549-1-raj.khem@gmail.com>
References: <20230920054733.2852549-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 07:54:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187898

On Tue, 2023-09-19 at 22:47 -0700, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/gettext/gettext_0.22.bb | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-core/gettext/gettext_0.22.bb b/meta/recipes-cor=
e/gettext/gettext_0.22.bb
> index f5290ac0e44..91db6627748 100644
> --- a/meta/recipes-core/gettext/gettext_0.22.bb
> +++ b/meta/recipes-core/gettext/gettext_0.22.bb
> @@ -53,6 +53,7 @@ EXTRA_OECONF:append:class-target =3D " \
>                   gt_cv_locale_de_utf8=3Dde_DE \
>                   gt_cv_locale_de=3Dde_DE.ISO-8859-1 \
>  "
> +EXTRA_OECONF:append:libc-musl =3D " ac_cv_lib_error_at_line=3Dno"
> =20
>  PACKAGECONFIG ??=3D "croco glib libxml"
>  PACKAGECONFIG:class-native =3D ""

Is this something which should be in the musl site file?

Cheers,

Richard

