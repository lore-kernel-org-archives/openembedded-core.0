Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6583DCA0EDC
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 22:00:55 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.34276.1755208853444007571
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Aug 2025 15:00:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=caEFd1Z1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b9e41101d4so829187f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 15:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1755208852; x=1755813652; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IKkyepwzdGPwTt1xG30XkWLxq7HH8aMgvTYYBt3F65w=;
        b=caEFd1Z1JAtvr6eiIS4lf3ydi6/HWBxCR2+7f02lKnTPfbNO5mnMb31JqWB4G4TxNy
         3S8zvyCr+B9G5O4YmGcNWIXQXQQv/PGmQVqHd6sQhDUC3u1dNPe+HFtoMgLaDAqcdTBq
         ITri7DjYyog48/B3OgcxE7Fq3SopZiLmLTdqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755208852; x=1755813652;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IKkyepwzdGPwTt1xG30XkWLxq7HH8aMgvTYYBt3F65w=;
        b=GlJp95SiT8LG1o1YDCO4k3ame4FZ27UUnNiKYX/vzAEK/8NP3U+KOlxr5yBBJREpvi
         hnFRA1u4/IsGo+AvQyVEGVbktFTHZshNYeLr3yCUz2O2+TDLAQwKgkR1rFBvpVhsjgLr
         kvTQYWZ4wBu2y4A67h+xxzQO/8Jm1xnNew0A0lSag+FJb5u0G8htTKtKlOooMVvuv/eG
         /0k4M+ST97BH7Fn8t6CcBKyYHw5KxM+jQfu/PPOHwFLEaq+sNSFtvAlCn8rsMzQEP/sm
         X3CKjnyJpjGKpSglEGlN/q2wYP99KOYMd+BUI2uBOoEkETDVa28h2l7ZGuVJAFVa3Gh7
         E+oQ==
X-Forwarded-Encrypted: i=1; AJvYcCWz9njCWy4uQDaaGieMsRdLNVGs6CtuVvZUE+F+9xxq1SK2GOaj7Kfnh/WdRr3Mb+YomFhnSqLwxp8bX8LcD/VFRg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwF51MP++TY8SVLyWrOX830t+0ekIn+z6V6lzTFP/fILwoHlkKQ
	KqIqudbKAs2sDSziu2xO4XstIhVn3PZ83E1HGn6vemArAkfeZV+f2URvwQ4TMDc7l0I=
X-Gm-Gg: ASbGncs8RbhEhNlHYVxhbeAFGXKGwPk/QpX27Sje7jU+5nkD5BFLbQMldklUe4FKRFh
	8xdIZ483E5YxjU1BGbVtylky4AiqhahNFO9NhPeLnG2EYA+oe20XCk3nAYf7kgNI0lMBpXNsanP
	g158X9hjuQzEZnJ68T3lsiwjstcLucE8r8VC9qwkSQEk/wk46yvydX/tdnLPchYgeq7ybGcOrx0
	w1BJ+7kk0a6K/bN+L/RYXBp3iAVXJHeXJ0yZp3Tvm9miMQqqLuK2caDNd5QxqQONr3zH7OMgdEQ
	gyMFR8yocgKQvtU9I0okbDXRmJObYvJMqipDvUD9TvLbN9LIucss1M2wiwjN2ZPH/uvbzVef6Gp
	0TIM/abI1dIfirnjkUVY9/sNFFnYwjj5J5CzwiufLpVFIFHjF529VDVwKOPit45C7qRk6NMFc05
	2gLxdOLGnjM30=
X-Google-Smtp-Source: AGHT+IGe9ox3eLDAESmuBFrX1nSw+P/C3WQYBkuychzMw3nnRHwmBhLmsj95CbRGPn3FUmlqDRnVjQ==
X-Received: by 2002:a05:6000:1a8a:b0:3b7:8b20:6fdc with SMTP id ffacd0b85a97d-3b9fc1f95aamr3049340f8f.24.1755208851660;
        Thu, 14 Aug 2025 15:00:51 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7180:e93f:ceac:c239? ([2001:8b0:aba:5f3c:7180:e93f:ceac:c239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b9163ae600sm8286129f8f.5.2025.08.14.15.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 15:00:50 -0700 (PDT)
Message-ID: <6120f108392cda6ca7f446c5e9e65035ebb1620f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] fragments/autobuilder: add go to
 SDK_TOOLCHAIN_LANGS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Thu, 14 Aug 2025 23:00:48 +0100
In-Reply-To: <20250814105604.3586651-1-alex.kanavin@gmail.com>
References: <20250814105604.3586651-1-alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Aug 2025 22:00:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221874

On Thu, 2025-08-14 at 12:56 +0200, Alexander Kanavin via lists.openembedded=
.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>
>=20
> For reasons unknown, only rust was listed, which means
> nativesdk-go was not built or tested, which lead to
> breakage like one fixed in
> https://git.yoctoproject.org/poky/commit/?id=3Da669cd2e0c760da9d7e872daea=
9590fc9e86d766
>=20
> Note that with this change only building and installing go
> into SDKsis tested, but no tests are performed with the
> toolchain itself in testsdk/testimage.
>=20
> For that, a bug has been filed:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15953
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
> =C2=A0meta/conf/fragments/yocto-autobuilder/autobuilder.conf | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/fragments/yocto-autobuilder/autobuilder.conf b/met=
a/conf/fragments/yocto-autobuilder/autobuilder.conf
> index e3bac343390..85987b08995 100644
> --- a/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
> +++ b/meta/conf/fragments/yocto-autobuilder/autobuilder.conf
> @@ -9,5 +9,5 @@ IMAGE_CLASSES +=3D 'testimage'
> =C2=A0SDK_EXT_TYPE =3D 'minimal'
> =C2=A0SDK_INCLUDE_TOOLCHAIN =3D '1'
> =C2=A0ESDK_LOCALCONF_REMOVE:append =3D 'BB_HASHSERVE'
> -SDK_TOOLCHAIN_LANGS +=3D 'rust'
> +SDK_TOOLCHAIN_LANGS +=3D 'go rust'

Sadly there is at least this failure:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/11/builds/2195

Cheers,

Richard



