Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60DD7C64EC4
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 12:46:09 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.18089.1678452364468820167
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 04:46:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=njStL5HN;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id s20so6417681lfb.11
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 04:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678452362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJasE+zPqX7JxLCFqAIUoRHkchHKeI/3tS4zEku+XMI=;
        b=njStL5HNhQqBM+a35E9gB+7MSXW2Hc8WhyBmsc/qkKKlxOHikL+06mV+J9wsza6NKO
         qO/jvlmXrBiM+ipXKRyC5snoq9lbkwKoqyevoiVJ5gcsH1t6yzgfLBTCd/pnajPIUUR0
         AlonpSRZBx+SRuzuPo/eGLKaDQxhv+/7Jvyb9ZdVKrVu+xaJY99beHdj9dK+9ojPp3XF
         lQiK3X4Jr2RJH9U6x1cek4MeDCj0Esbt99Q4c+vXMretZ+JF2+0CV9uvaahCym15Ubwi
         sZINACNoKxA8L1za9+V/uGXxiFKrR3+JPH0hfzY8iVs7tDaR0muUBz12kWVkNAr2jgi6
         eeFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678452362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bJasE+zPqX7JxLCFqAIUoRHkchHKeI/3tS4zEku+XMI=;
        b=CzJtC394836Vzs5entolVbngPaNhl+oqqUj3NZ011RqW+IcXWbfhrho6uHpi/N9CDN
         sMUvTvm1Rb5GvcW08u52p2nXwEjsJjYMA6L7EfWXuCDQLgS4CH08QMRGEICw4zRecY1S
         7ppBMoDDjk990h5Go6bkomVpfMyEc3OL3H1nVZldspQJwPsQnQpPGT19wZPFeR8wlENM
         iIP+hE8pvJRANHbvUQpt8iUD+93tHEtfNGogHBdQXK3lz2wYBm/1E1j+mKMdJWTMq6rj
         shI7FXlyxERD+QZvDPNiHqf98HeiRRs0qeAy2jY4acfy4UKOM6s6FeRXAkgt/bP57Xde
         Dbrw==
X-Gm-Message-State: AO0yUKXbnYDB6Pdl/GMnXI7ZrnyjxlPKz3cS2bSWOiwBJhhXjEiUZ3Q7
	ZFU3lpWDPJtrwGdKRAM4IjhcQVQ7oSwfPC0xgZk=
X-Google-Smtp-Source: AK7set9JTc1GOeSIiOxs6rJB4PyeAnMUATAD+Ydfq6FCAABm4jtqJKueq2OdRbdUMBlaIi+K1ejxPu6TmT4xMFFbyhY=
X-Received: by 2002:ac2:4827:0:b0:4e1:dbbb:493d with SMTP id
 7-20020ac24827000000b004e1dbbb493dmr8005347lft.13.1678452362175; Fri, 10 Mar
 2023 04:46:02 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj9qRTsH5mJK-h+aXJofM+eEoL3Q=nRxFB9LUzrLWNxvGw@mail.gmail.com>
 <20230310123254.2744497-1-zboszor@gmail.com>
In-Reply-To: <20230310123254.2744497-1-zboszor@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 10 Mar 2023 13:45:50 +0100
Message-ID: <CANNYZj9BubWuZTUgzLuWSM924cMkdk-gZ7bbm08U5ppeb3WATA@mail.gmail.com>
Subject: Re: [PATCH] pypi.bbclass: Set SRC_URI downloadfilename with an
 optional prefix
To: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 12:46:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178330

Thanks, I like this better than changing the cmake recipe.

Alex

On Fri, 10 Mar 2023 at 13:32, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zbosz=
or@gmail.com> wrote:
>
> This allows avoiding clashes between source archives of a main
> project and a pypi project using the same name and version.
>
> The new optional setting is PYPI_ARCHIVE_NAME_PREFIX which is empty
> by default so previous downloads can be used. Example usage:
>
> PYPI_ARCHIVE_NAME_PREFIX =3D "pypi-"
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  meta/classes-recipe/pypi.bbclass | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes-recipe/pypi.bbclass b/meta/classes-recipe/pypi.=
bbclass
> index aab04c638f..f510bfed06 100644
> --- a/meta/classes-recipe/pypi.bbclass
> +++ b/meta/classes-recipe/pypi.bbclass
> @@ -15,11 +15,13 @@ def pypi_package(d):
>  PYPI_PACKAGE ?=3D "${@pypi_package(d)}"
>  PYPI_PACKAGE_EXT ?=3D "tar.gz"
>  PYPI_ARCHIVE_NAME ?=3D "${PYPI_PACKAGE}-${PV}.${PYPI_PACKAGE_EXT}"
> +PYPI_ARCHIVE_NAME_PREFIX ?=3D ""
>
>  def pypi_src_uri(d):
>      package =3D d.getVar('PYPI_PACKAGE')
>      archive_name =3D d.getVar('PYPI_ARCHIVE_NAME')
> -    return 'https://files.pythonhosted.org/packages/source/%s/%s/%s' % (=
package[0], package, archive_name)
> +    archive_downloadname =3D d.getVar('PYPI_ARCHIVE_NAME_PREFIX') + arch=
ive_name
> +    return 'https://files.pythonhosted.org/packages/source/%s/%s/%s;down=
loadfilename=3D%s' % (package[0], package, archive_name, archive_downloadna=
me)
>
>  PYPI_SRC_URI ?=3D "${@pypi_src_uri(d)}"
>
> --
> 2.39.2
>

