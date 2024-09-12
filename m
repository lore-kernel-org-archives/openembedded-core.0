Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB17EE6452
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 06:43:00 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.41335.1726123378835270671
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 23:43:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dZDixeV9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42ca6ba750eso3168605e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 23:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726123377; x=1726728177; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Pmjs0GS7uWn1oGYpySb7rMw7ZSzmJiYJcTogX1qD1yw=;
        b=dZDixeV9HjU01lNU/5+MdR/RGN6UH3mhTRovWRgoy5lHXTEFcDVwD5SZKjN5GcJDWI
         KAX5UWc1gLAWWs0xzN31xtu9ERU8wltnT7IuerlXUQRFI6q50rqqZWgmg4QS2RqyMLul
         C1L1MTLspX75GAC/i4b/09XZl8wDvvkzoqDXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726123377; x=1726728177;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pmjs0GS7uWn1oGYpySb7rMw7ZSzmJiYJcTogX1qD1yw=;
        b=vh7xkF1NocVsGcSjl2I9NnuAlPoG1Fnac2CkE8nXj2OwMsyV19yprHbX74OF9oitOY
         YkaLPrUyHhjy41Hj78FRAiMu4Ux0OTcN/V1fPkQuWdU5FOMBMET1pPx9cWTf5xgffqFq
         Pt1pNNNx1FX6dbRYWULuHKGMnkEV4gRixjJyzi/QYQkZIOrxbFYOBiOzLHsHHZpkbyqY
         iHI55FMfnapkJd61G2jNldJoQHkYTSF2wiQUL1uPtS8K67Ss2CUgRzzEOFzgxUq9gJHN
         WF0KhQE1H3TVnOgzXxJelenAh6TIyc4GFAsGQNXXZfC5iM4LoGdZX9qTyQjt3pP42oaM
         le5g==
X-Forwarded-Encrypted: i=1; AJvYcCVttd4pHWtbIxsFxthQ8YKQENbNdk3Kfvvj7+dEpCoqWVCqR99uhNKMxN6xOXH4BAH37I5Nk6WTXXuBbcb7rZtvvQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywp5ghRZCg5pB62hzhy78RthGBDuLHWv1M3MMe2XB1qzR8BOkaa
	kAgvYnBykykk9V/si2/oQNWoj2LhL1gmy5Xlwc7zJMOmJLCWuoMG9KLECCsURRqg1H4CcNnk4rF
	L
X-Google-Smtp-Source: AGHT+IFqp2Y97Rw7ButtmsMEVa+d+fxSF+oEVDP46qAof8egZNdapG/iA11WnNH/xasz/rYDsy4adg==
X-Received: by 2002:a05:600c:358a:b0:428:b4a:7001 with SMTP id 5b1f17b1804b1-42cbde23941mr53147315e9.15.1726123376930;
        Wed, 11 Sep 2024 23:42:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cef5:72f6:fcf1:91e6? ([2001:8b0:aba:5f3c:cef5:72f6:fcf1:91e6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42caeb323f4sm162467965e9.12.2024.09.11.23.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 23:42:56 -0700 (PDT)
Message-ID: <3d941699d5cafa46c0274cd048b59b2776f4c2d0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 2/3] binutils-cross-canadian: add gprofng
 package as runtime dependency
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com, 
	Sundeep.Kokkonda@windriver.com
Date: Thu, 12 Sep 2024 07:42:55 +0100
In-Reply-To: <20240912054628.1539323-2-Harish.Sadineni@windriver.com>
References: <20240912054628.1539323-1-Harish.Sadineni@windriver.com>
	 <20240912054628.1539323-2-Harish.Sadineni@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 06:43:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204424

On Wed, 2024-09-11 at 22:46 -0700, Sadineni, Harish via lists.openembedded.=
org wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>=20
> In SDK, while running "x86_64-poky-linux-gp-collect-app ./exe" fails
> to create 'test.1.er' due to missing gprofng configure file in sysconfdir
> and aborting with below error while generating the profiling data.
> =C2=A0- configuration error: can not find libgp-collector.so. run aborted
>=20
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
> =C2=A0meta/recipes-devtools/binutils/binutils-cross-canadian.inc | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc b=
/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> index 62ebb3f5bc..7f2699089e 100644
> --- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> +++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> @@ -30,3 +30,4 @@ do_install () {
> =C2=A0}
> =C2=A0
> =C2=A0BBCLASSEXTEND =3D ""
> +RDEPENDS:${PN} =3D "nativesdk-gprofng"

Shouldn't gp-collect-app be put into the gprofng package instead?

Adding that dependency effectively join the gprof package into the main
PN and makes the separation pointless.

Cheers,

Richard


