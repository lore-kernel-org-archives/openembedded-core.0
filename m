Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53FBDCCA470
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 09:57:31 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.13284.1759312643340862386
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 02:57:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=anz8s00X;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-421851bca51so1965361f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 02:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1759312642; x=1759917442; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oB9qDr/izV6FfzKIX87jjINY4FjR/Y8NbUdyR23dKbY=;
        b=anz8s00Xd3kt5b8HumJjUJV0d14K1qucJdyZFUn4KpTKTLjQHuKa8jpgtVFdobdDj2
         z2sZh57avCNw+UmH45nOZctofN2Bf7AXLJrohS3abVcMHenq1BBQlHNLUdpePKaKdg6i
         YgEmZqLPkzTbRlnRxoWwsBUyvD4Z7J6VzToKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759312642; x=1759917442;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oB9qDr/izV6FfzKIX87jjINY4FjR/Y8NbUdyR23dKbY=;
        b=sczbC3x1TlKKwfhrWS9YVA3lhIuzjA1Ta74qwCnOVRi2Vi0CCv5CQyPFcFOiuJVz6g
         x+3TSfKHhrKqFGo++t6jTJ0h87Nl4PjMZssfwRJ5QLVRy676mYGVhJ8+oNVM6LUWxE91
         sNJ2MbKKxYgIa+6ON9INO+dY2ZVE7XwBPngGJjZBedMKodVvduHfIM2AvWQOIBIrRVUs
         V01LyzxklxvSE/oj24KN00X89LUP4dcHCQF7unQ/H/IAOUU/WxAbpwAv9pUb9YikAoHe
         2a2B53Rou2lDL3e3j33L7BBRzUnaAHz29YiTIFENtfW0gBuzCqz12MSZXoztrJSbnYYA
         winQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtxK5MaXkwCUq7w1GtkQS5oG1yVv2UOx2fXgLduBH4PlDgoUiLDzlb4990UUwqNRnji7wY7AjfpBD9epOnlgNGhw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzlq5OuCLXSsJs8CfH287llsUOuYDSgTMtaonfMqITkg348JF/d
	ii6/h52ouP3pxUvYv2gba4Xc/8Jdknj2P5cOYpsVafjc8OTDR5YMoQ91tbaObUYVonVJs9xD7X1
	S5XIQ
X-Gm-Gg: ASbGncssZwCNFIEbQ5BhNm4E9BBXG1VqzCofysOruEOzUnDl7g4FKvJGMuuYhTopF3P
	EQ9+K05RwRPQ4dqlsQmaoKbhVDAhEn/daRzrsY3kezOR+gkOLSPMyhmCN9lV/ZwsNVPCQ9tPqD6
	KL1Lv478E/gtKOfn1Fli3Zz+uQvR6kP024oCIED/5ZNit61mDaVcxcN0guTOKiQ8GYiky2Qi/El
	hdVAnqHm/j1Tk47AXr3YHdD4sSTKBBs0Uw4392Lk4McAIP6TCv/NzIrQA+0ftrAYVeBtMFg9R+d
	2Slu2V1BqnraS8n09X3s+6pZB0UJk7O5gKiA1hFcM516MDabgh7ImLguVvZ+n1f6wiXSWfvpMDY
	6e7kBHS2w++PlCJsX7b1s8ghcqebyLJdPalJIXDJLXLOduInOPikFLhG4b/e9p97FFT4SLsnAu2
	06vnHGo+vLbetW7q64YX0btOjzqY4udtP/9lw=
X-Google-Smtp-Source: AGHT+IHJaE59K/6XRS+ot4RITnPs4oNd6ET7bgB4FMZdD4dy1KsmVcvJaHubMUkgG15nY5ZKh7+JhQ==
X-Received: by 2002:a05:6000:2401:b0:3ec:db18:1695 with SMTP id ffacd0b85a97d-42557819214mr2586920f8f.45.1759312641532;
        Wed, 01 Oct 2025 02:57:21 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d53b:59af:db6b:d4f7? ([2001:8b0:aba:5f3c:d53b:59af:db6b:d4f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e61991e9fsm32556165e9.5.2025.10.01.02.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 02:57:20 -0700 (PDT)
Message-ID: <d63a917901287e45aeee4b6b256615537124c2a6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] binutils-cross-canadian: Add missing perl
 mpodules to RDEPENDS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Harish Sadineni <Harish.Sadineni@windriver.com>, 
	openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Date: Wed, 01 Oct 2025 10:57:20 +0100
In-Reply-To: <93d2d7a5-a6c7-4b0c-ad89-01be28b407ed@windriver.com>
References: <20250930123901.949798-1-Harish.Sadineni@windriver.com>
	 <d04d310ec882ddea6f9578eeb65d99cfae1abe69.camel@linuxfoundation.org>
	 <93d2d7a5-a6c7-4b0c-ad89-01be28b407ed@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 09:57:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224204

On Wed, 2025-10-01 at 14:17 +0530, Harish Sadineni wrote:
> =C2=A0On 9/30/2025 7:17 PM, Richard Purdie wrote:
> =C2=A0On Tue, 2025-09-30 at 05:39 -0700, Sadineni, Harish via lists.opene=
mbedded.org wrote:
> > > From: Harish Sadineni <Harish.Sadineni@windriver.com>
> > >=20
> > > In sdk while running "x86_64-poky-linux-gp-display-html --help" gives
> > > following error:
> > > $sdk/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky-linux->
> > > ./x86_64-poky-linux-gp-display-html --help
> > > Can't locate bigint.pm in @INC (you may need to install the bigint mo=
dule
> > >=20
> > > By adding the following perl modules to RDEPENDS fixes the above erro=
rs:
> > > =C2=A0=C2=A0nativesdk-perl-module-bignum
> > > =C2=A0=C2=A0nativesdk-perl-module-bigint
> > > =C2=A0=C2=A0nativesdk-perl-module-math-bigint
> > >=20
> > > Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> > > ---
> > > =C2=A0meta/recipes-devtools/binutils/binutils-cross-canadian.inc | 1 =
+
> > > =C2=A01 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian.i=
nc b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> > > index 7d7ffe92ce..9dc73fbdf1 100644
> > > --- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> > > +++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
> > > @@ -5,6 +5,7 @@ PN =3D "binutils-cross-canadian-${TRANSLATED_TARGET_A=
RCH}"
> > > =C2=A0BPN =3D "binutils"
> > >=20
> > > =C2=A0DEPENDS =3D "flex-native bison-native virtual/nativesdk-cross-c=
c virtual/nativesdk-libc nativesdk-zlib nativesdk-gettext nativesdk-flex"
> > > +RDEPENDS:${PN} +=3D "nativesdk-perl-module-bignum  nativesdk-perl-mo=
dule-bigint nativesdk-perl-module-math-bigint"
> > > =C2=A0EXTRA_OECONF +=3D "--with-sysroot=3D${SDKPATH}/sysroots/${TUNE_=
PKGARCH}${TARGET_VENDOR}-${TARGET_OS} \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0--enable-poison-system-directories \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0"
> > > =C2=A0
> > This is probably the right direction but shouldn't this be for the
> > gprofng package rather than ${PN}?
> > =C2=A0=C2=A0=C2=A0
> Hi Richard,
> =C2=A0=C2=A0
> =C2=A0In the SDK at $sdk/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-
> poky-linux, the script "x86_64-poky-linux-gp-display-html" is not
> pulled or packaged by the gprofng package.=C2=A0
> =C2=A0Instead, it is installed as part of the binutils-cross-canadian
> package.
> =C2=A0
> Adding the perl module dependencies to gprofng package will not
> resolve this issue , it would be effective only if "nativesdk-
> gprofng" is explicitly installed by the user.
> =C2=A0

Fair enough. Should x86_64-poky-linux-gp-display-html not be part of
the gprofng package though? Perhaps we should change it to be packaged
there, then add the dependency to that?

Cheers,

Richard



