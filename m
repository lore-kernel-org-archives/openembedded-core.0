Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 467BFC0219D
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 21:22:38 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.5244.1739308947690088025
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 13:22:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bkblEM0f;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38dd935a267so2544734f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 13:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739308946; x=1739913746; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kD0ME1xtzQ8w3KiGinT1H70bfR8/IyFDXuAkkswTFjg=;
        b=bkblEM0f5e9a0wEKwvgMjVKmVQJYM2jEA1sIJVckExLaDKptbnKnQvAplIHdCUmyDT
         0vvHUrUOISnlesW0U6K57OPR0s9zMfmgkatxgotF1XBR8n6AETrmdZ58NNM4deI1DF/m
         agwDi7L+7tvHq3/8+0Wfvcp45W2hnSVAgI36k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739308946; x=1739913746;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kD0ME1xtzQ8w3KiGinT1H70bfR8/IyFDXuAkkswTFjg=;
        b=SqL2uczti73m2PuijfNpQvDHwJSUl998CyDiKpeVuWtYDilYpjeozDx5z5FRrRuT9w
         WytIxaOghpWII15heZdG3Rv5wDtAjXvvK1FxbHHB95CZwaPkqENVIBlQyRjjR2xXZI5A
         x0DjDaLoyrOKoXEKdBfUgybz4VCHkbMRN94xdg9NLB3HRSfUNJBTSfQJ7Q1k6MJykCAm
         llXVW6y90a8M+PgAhjTCtYkd3VZntYZIs0VrocuH1m1N1viv1rhyqJo0JSN+E1oW7BHo
         GoY/jzGqOTDV419eytcl2UfN2/ZotvpKEkDR58x5cV7aUkdqW9wgQoFs/4x/Xzeo1h3j
         1/rg==
X-Forwarded-Encrypted: i=1; AJvYcCVzUrSqyn9Ly4d6SvsqhBntxywFZ6Gk8B4eOMiGfbmOJyNdZkpgyw5RNOnu0q+h+U5ApdUqz4a0RJEgafOdg6SH4A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwPkKu8pX1iW39w9YvbwI82SK38ievbJG/D4MriqXM5EiOEgJFl
	qvtzOfsB2IL+zuyrvOc2yLnYqnGBFo/tHw5zhfgw1hgyrVsPRwLEZgRTg7617m8=
X-Gm-Gg: ASbGncsewJmZi/XU4bTHkIKt07Csb4QOStQgqsRBSlBcPjEmueNWTpsdM5ByaWsyInj
	aW2xyQyDx4W4ymnkupzy9BT5YPOE6Kp2S5vsluFRWkvcu+K+gfZZNprci5itWN0Lh62AgHeIMSY
	SsfVXrTMuDoeUgS6UmWtCSBMhZyb0uVfyAy/fLf6+v5mgYfhN22bNlalsk9uoWA3OSxyj9DNi07
	XG3kEZgvz6djqXbgDuBo5wxDkt66YPu6TUSyKpGu3ppt6eLqLeF4eqfTECdwet3rZ1h4mpRAykm
	ZKtWuYbuSmToApNQbU4opwB9+fu3wETcGKQAAaQtquHShMTuYf7Owe2ejc6YCyRCsAIP8CEnrXQ
	YWBvE
X-Google-Smtp-Source: AGHT+IHR2aHUO/BqqmEJybKYTBrVct5Hs/RZDoKd3sTZrZXXz03bZ884EvJYgveAu22xoJzEJnRZ+g==
X-Received: by 2002:a5d:59ab:0:b0:38d:d8b2:ceef with SMTP id ffacd0b85a97d-38dea2709b9mr442900f8f.13.1739308945887;
        Tue, 11 Feb 2025 13:22:25 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:679f:b1ce:de17:3648? ([2001:8b0:aba:5f3c:679f:b1ce:de17:3648])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcc388ef5sm12540381f8f.46.2025.02.11.13.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 13:22:25 -0800 (PST)
Message-ID: <c7c34b4c511f018a497f76995e95caea7088c8d1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH 04/30] lib: bb: fetch2: add support to
 unpack .crate files
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: stefan.herbrechtsmeier-oss@weidmueller.com, 
	openembedded-core@lists.openembedded.org
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Date: Tue, 11 Feb 2025 21:22:22 +0000
In-Reply-To: <20250211150034.18696-5-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
	<20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
	 <20250211150034.18696-5-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 21:22:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211185

On Tue, 2025-02-11 at 16:00 +0100, Stefan Herbrechtsmeier via lists.openemb=
edded.org wrote:
> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
>=20
> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller=
.com>
> ---
>=20
> =C2=A0bitbake/lib/bb/fetch2/__init__.py | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/bitbake/lib/bb/fetch2/__init__.py b/bitbake/lib/bb/fetch2/__=
init__.py
> index de36f06bfc..e4c489d059 100644
> --- a/bitbake/lib/bb/fetch2/__init__.py
> +++ b/bitbake/lib/bb/fetch2/__init__.py
> @@ -1533,7 +1533,7 @@ class FetchMethod(object):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 tar_cmd +=3D ' --strip-components=3D%s' %=C2=A0 ur=
ldata.parm['striplevel']
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
if file.endswith('.tar'):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 cmd =3D '%s -f %s' % (tar_cmd, file)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 elif =
file.endswith('.tgz') or file.endswith('.tar.gz') or file.endswith('.tar.Z'=
):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 elif =
any(file.endswith(ext) for ext in {'.tgz', '.tar.gz', '.tar.Z', '.crate'}):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 cmd =3D '%s -z -f %s' % (tar_cmd, file)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
elif file.endswith('.tbz') or file.endswith('.tbz2') or file.endswith('.tar=
.bz2'):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 cmd =3D 'bzip2 -dc %s | %s -f -' % (file, tar_cmd)

I think you can just do:

file.endswith(('.tgz', '.tar.gz', '.tar.Z', '.crate'))

Cheers,

Richard


