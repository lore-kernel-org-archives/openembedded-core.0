Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E99FECDDE71
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 11:51:20 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.6994.1729684276597249204
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 04:51:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BMpFyHAI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4315baec681so69918075e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 04:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729684275; x=1730289075; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SorZNFC8wXXb0JhW6IHH3RaOUeeAkhvazdzrQIWQLfw=;
        b=BMpFyHAIDHbMTEFLFWz5psQZXDzqoUF5eIry+3T5Cme1wPMqzxC3lYGBPyGPPKClya
         caWyb3vKFR7WCWULj7En8+wiRw5Wt5e8KTWYLGJI1EMjV4ljBfvPZpIwVOGOvyg6yABF
         hBDSnwMWn+YsglRg131YF9C+PaDr2AALbrk3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729684275; x=1730289075;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SorZNFC8wXXb0JhW6IHH3RaOUeeAkhvazdzrQIWQLfw=;
        b=tG8aYx1Cte/qXMcFKeUdQFbJJOgAUH3KJkFifZALRJCCmfTunhWwWMsc8tc/LYdVHH
         n3sTGVQRayodmRI1bF4u/LlLEHIEOsoyxDBKZ4Czz6r8CGgL8oK6y73kGlmDAnLD5ADq
         CWl1rnUjbiaUhOtLOuohaBvsQsIQBG7qiG7krcjctS7hBfxxX7O5ngHSDo6/tbG8N+pl
         K74I/vjQLInUvOAvgw6PXtp2jYf/HbDS7p67z7vgNvzDbbR4LwPZeWeX9ysgJQ38PSwI
         JTUv4UaGitwKX4A82Xrdoq5i9kqyXQoMoqh9Zn8HCYu7UJ2S98VjULjyqnWMGqGalWSC
         3TXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRhlnBJ952FVSJpLhF1FbkaiQwJa5HsfEdsVjvjvsZAg8y+8FSXAFQaeD1YQJl/ecrR+uVsRdhD4lWXlwLYBhzfw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzPtyBCe4xzhG2aeRlJK20zgfSC8hpyX6hqbTE84BdcB9zcOc7u
	tWthoSFmTu+KLMUCqp69nDppNJ5iGpViZJkhlzhMa+ywxE7RiefcW/bqxpUxUCQ=
X-Google-Smtp-Source: AGHT+IGrLpZ4oN/uRCQu2QZJR5m5C3FI4PNfs51OEdxaIr7g+G3kCX6cag6kPsciHY/OJBGR+PFSAA==
X-Received: by 2002:a05:600c:4f0c:b0:42c:b7f9:4bbd with SMTP id 5b1f17b1804b1-431841890b1mr20508725e9.26.1729684274669;
        Wed, 23 Oct 2024 04:51:14 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ad34:30ba:19ab:e41f? ([2001:8b0:aba:5f3c:ad34:30ba:19ab:e41f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186bdbaf5sm14247905e9.17.2024.10.23.04.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 04:51:14 -0700 (PDT)
Message-ID: <f7ec2bdbbc57fb16302e62143872f8903b20cd10.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 2/2] oeqa/selftest/cases/buildoptions.py:
 ensure libgfortran's package_qa is run
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Qi.Chen@windriver.com, openembedded-core@lists.openembedded.org
Date: Wed, 23 Oct 2024 12:51:13 +0100
In-Reply-To: <20241018083135.3643966-2-Qi.Chen@windriver.com>
References: <20241018083135.3643966-1-Qi.Chen@windriver.com>
	 <20241018083135.3643966-2-Qi.Chen@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 11:51:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206200

On Fri, 2024-10-18 at 01:31 -0700, Chen Qi via lists.openembedded.org wrote=
:
> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> fortran-helloworld DEPENDS on libgfortran, so merely 'bitbake fortran-hel=
loworld'
> does not ensure that libgfortran's package_qa is run. This actually cover=
s
> the buildpath issue in libgfortran. This patch ensures that libgfortran's=
 package_qa
> is run to avoid any future regression.
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
> =C2=A0meta/lib/oeqa/selftest/cases/buildoptions.py | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa=
/selftest/cases/buildoptions.py
> index 423c31e189..4e82c34de9 100644
> --- a/meta/lib/oeqa/selftest/cases/buildoptions.py
> +++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
> @@ -203,7 +203,7 @@ class ToolchainOptions(OESelftestTestCase):
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 features =3D 'FORTRAN:fo=
rcevariable =3D ",fortran"\n'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.write_config(featur=
es)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bitbake('fortran-helloworld')
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bitbake('libgfortran fortran-=
helloworld')
> =C2=A0
> =C2=A0@OETestTag("yocto-mirrors")
> =C2=A0class SourceMirroring(OESelftestTestCase):

I took the first patch but this second one made me worry about our task
dependencies. I've looked into it and I think there is a bigger issue.
I've sent an alternative one to insane.bbclass which should mean this
is unneeded. If you could double check that would be great.

Thanks,

Richard

