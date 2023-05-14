Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED8BC7EE22
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 21:49:48 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.75586.1684100978902772855
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 May 2023 14:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=V9vhDIDB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3f415a90215so96330135e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 14:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1684100977; x=1686692977;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sm1K9v0SV1/YJUnHGHduefQx2Lq9ckzOP0Z1hgXoN8k=;
        b=V9vhDIDBx5qBvvu+YAywFv6nhx9v4Nek209IENrz8tH9g4HuyMgM8sKYYYFzo4r4TK
         805cG34imWJVE9NZvOcx3KAq93aEJxlmpgOrWrmPEuzUviVaV8cdt6iK3QjshWYLrfSW
         xn/298V3r6tS1wflUi2zMOqVcxdMSmCK2F3j0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684100977; x=1686692977;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sm1K9v0SV1/YJUnHGHduefQx2Lq9ckzOP0Z1hgXoN8k=;
        b=KsOjp9XRPYL7E9aUfrjSTkpCSwqSEK0eXR0qjl6HsGxUXPP33gjnm0Ti7DR6L0AlDc
         BSL+h17t+SpgegvYVHXmqjHStOzHJ/8vb++8tXDrEdvLq2r0L5JAQvxVEaSqCsisnpYf
         gYo5pjPTM5iLjFnCElMzCdVlxyHmfYMMWZWniSXuFLEW5Kxt2bbbMaSDrGKmI7crjWaw
         8BrVoTK+cLsphJc+sZ4AdzM3PcjrRH+46f4Uh4+ptqNS7MFX4qVdRLAt52W+D2umn+zj
         gmZ6UbC9wKHY8S2BcbvO+wAFAfYV6Rj3maOradRTuVfknv4ZvX51P1EndIDeT2820W+w
         vhgw==
X-Gm-Message-State: AC+VfDyC0uSAhWRrJOWb7TluRVKYfQP7nBkSiaU494CNyLn90ooxEncq
	XbUmM1FaFBgSAa0ENqV1mFmjNg==
X-Google-Smtp-Source: ACHHUZ4ZDpXq1zri3xgTMDJPQq92DfLfzUPSvPp901a4PxaGgWNsO+PnJvspu63cinTWKC0XRiOVdA==
X-Received: by 2002:a7b:cd85:0:b0:3f4:f8c0:8a48 with SMTP id y5-20020a7bcd85000000b003f4f8c08a48mr5336264wmj.24.1684100977096;
        Sun, 14 May 2023 14:49:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c958:e49b:43bb:233e? ([2001:8b0:aba:5f3c:c958:e49b:43bb:233e])
        by smtp.gmail.com with ESMTPSA id v23-20020a5d5917000000b0030632833e74sm30460710wrd.11.2023.05.14.14.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 14:49:36 -0700 (PDT)
Message-ID: <4138a44fc28eaecc2feb86dcec97b04c8aeb4e0a.camel@linuxfoundation.org>
Subject: Re: [OE-core][mickledore 05/15] glib-networking: Correct glib error
 handling in test patch
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 14 May 2023 22:49:33 +0100
In-Reply-To: <66dc4b94e9fad8d209f12fa64bd0673a42c28ac9.1684081748.git.steve@sakoman.com>
References: <cover.1684081748.git.steve@sakoman.com>
	 <66dc4b94e9fad8d209f12fa64bd0673a42c28ac9.1684081748.git.steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 21:49:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181218

On Sun, 2023-05-14 at 06:31 -1000, Steve Sakoman wrote:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 4ba74f61f38827d82586cf9c993a4b27065f5c6f)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/recipes-core/glib-networking/glib-networking/eagain.patch | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/glib-networking/glib-networking/eagain.pat=
ch b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
> index 6dfbb2736c..ac6592ffef 100644
> --- a/meta/recipes-core/glib-networking/glib-networking/eagain.patch
> +++ b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
> @@ -21,7 +21,7 @@ Index: glib-networking-2.74.0/tls/tests/connection.c
>                                      MIN (TEST_DATA_LENGTH / 2, TEST_DATA=
_LENGTH - test->nread),
>                                      NULL, &error);
>  +
> -+      if (error =3D=3D G_IO_STATUS_AGAIN)
> ++      if (g_error_matches (error, G_IO_ERROR, G_IO_ERROR_BUSY))
>  +          continue;
>  +
>         g_assert_no_error (error);

I'm not sure this is working yet, I suspect we've seen the error in
builds with the patch applied :(

Cheers,

Richard

