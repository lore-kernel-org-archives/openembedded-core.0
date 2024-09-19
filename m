Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB774CF3970
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 20:49:34 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.3783.1726778967182300090
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 13:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dHDFXwXI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-374c6187b6eso780970f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 13:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726778965; x=1727383765; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WqXT6ik4QGlbBxzRzCvrgQ/51+Q9kTMof9JFSWcMENE=;
        b=dHDFXwXI2IJXgsyvpLFN/HtctOy8FGpG/aHGEJBmYABywKycbCeLgd40SUY838OgNN
         OGb6ptJo6mgNu2hu6f+b4SZVt51WpHmLp14Ej4IPL0/PXdzYEFs4RzQcd4C3Yg9d76pO
         /ZewIvv/CqyIf1d/JbJVEoSv0QjZwmuqN8sQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726778965; x=1727383765;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WqXT6ik4QGlbBxzRzCvrgQ/51+Q9kTMof9JFSWcMENE=;
        b=MTGwCGAfC1WCfPzWQM/d5/bBjeG0JjYJW6MUP42ovywBsRn35F/F0tOYT9zGPPpo2q
         sWZt4CELBS1sa4kQqNfZaxG7RoZY4ms7Stix/J4Un9q7FiNeJDx6XwMRFR5CEiOpTopq
         Z3Y3l7FsKFaCS7jpccvaDVaI6tfzr/7XLmVsv2ZB4VvHwpBE9k3a+1jdJizyzt7r7ViZ
         SJnxrTNVGOG7NZI9efEHXIADwaUf9svtu1DBddTO2nuuXMHcIUdthBWfMaorBWAawaFi
         j/UfJz0Kv+5TW818qJgM2im7D+Vi4qlxU2z4RtIkhcnJax/vFK6rAiyoWyPvK47oMc7f
         PFsA==
X-Forwarded-Encrypted: i=1; AJvYcCUOmT0sOwPnLdfMfxTJuopmDHSzvSduIh9GP9k9RBN47SVkJNAegTjNXHj8TeyfTgkGww1g629pW5fkRo80MS4fnA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzvsuRM0zRLxf7itEroMOgu13qn6vMmgdFzVKm2X5ZJt7JRciYr
	u9ekm/4J7Vun/Q4scz0oOhsti+7G1Qk0du6cBCmgSUTNUb/2dOVCu5hkhwW+KG4=
X-Google-Smtp-Source: AGHT+IFn6mZD7VAuPJpGXboHE3t2jLw85D4C8GbG5dm3JZAToWmK6RqCTXYC6Ij5VCK6Em2l90MGgg==
X-Received: by 2002:a5d:6b0b:0:b0:374:cb30:b9b3 with SMTP id ffacd0b85a97d-37a431475e3mr154093f8f.2.1726778965449;
        Thu, 19 Sep 2024 13:49:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3dff:6e76:1854:48ea? ([2001:8b0:aba:5f3c:3dff:6e76:1854:48ea])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7affca44sm4991035e9.46.2024.09.19.13.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 13:49:24 -0700 (PDT)
Message-ID: <8d8ce20565a08111040cb1a5846fdb8a26fce2d7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5 1/2] binutils: Fix packaging of bfd-plugins
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com, Joshua Watt
	 <JPEWhacker@gmail.com>, Randy MacLeod <randy.macleod@windriver.com>
Date: Thu, 19 Sep 2024 21:49:23 +0100
In-Reply-To: <17F6A8FDDFFA7DC2.31299@lists.openembedded.org>
References: <20240919124848.653457-1-Harish.Sadineni@windriver.com>
	 <17F6A8FDDFFA7DC2.31299@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 20:49:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204716

On Thu, 2024-09-19 at 14:41 +0100, Richard Purdie via lists.openembedded.or=
g wrote:
> On Thu, 2024-09-19 at 05:48 -0700, Sadineni, Harish via lists.openembedde=
d.org wrote:
> > From: Harish Sadineni <Harish.Sadineni@windriver.com>
> >=20
> > Fixes the follwing error while building nativesdk-binutils with i686-mi=
ngw32 as SDKMACHINE:
> > ERROR: nativesdk-binutils-2.43.1-r0 do_package: QA Issue: nativesdk-bin=
utils: Files/directories
> > were installed but not shipped in any package:
> > =C2=A0=C2=A0 /usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-w64-mi=
ngw32/usr/lib/bfd-plugins
> > =C2=A0=C2=A0 /usr/local/oe-sdk-hardcoded-buildpath/sysroots/i686-w64-mi=
ngw32/usr/lib/bfd-plugins/libdep.dll
> >=20
> > Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> > ---
> > =C2=A0meta/recipes-devtools/binutils/binutils_2.43.1.bb | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
> > diff --git a/meta/recipes-devtools/binutils/binutils_2.43.1.bb b/meta/r=
ecipes-devtools/binutils/binutils_2.43.1.bb
> > index 2cce40f1ef..eb7c16cbc4 100644
> > --- a/meta/recipes-devtools/binutils/binutils_2.43.1.bb
> > +++ b/meta/recipes-devtools/binutils/binutils_2.43.1.bb
> > @@ -72,5 +72,6 @@ SRC_URI:append:class-nativesdk =3D=C2=A0 " file://000=
3-binutils-nativesdk-Search-for-al
> > =C2=A0
> > =C2=A0USE_ALTERNATIVES_FOR:class-nativesdk =3D ""
> > =C2=A0FILES:${PN}:append:class-nativesdk =3D " ${bindir}"
> > +FILES:${PN}:append:class-nativesdk =3D " ${libdir}/bfd-plugins"
> > =C2=A0
> > =C2=A0BBCLASSEXTEND =3D "native nativesdk"
>=20
> I ended up digging into this a lot more. I was able to reproduce the
> failure locally but that implies the autobuilder isn't testing this
> combination. According to the configuration, it should be so I'm a bit
> puzzled why the autobuilder doesn't see it.
>=20
> The autobuilder config for this is here:
>=20
> https://git.yoctoproject.org/yocto-autobuilder-helper/tree/config.json#n1=
362
>=20
> Resulting in a build such as this:
>=20
> https://valkyrie.yoctoproject.org/#/builders/7/builds/162
>=20
> I would like to understand why automated testing isn't catching this.

Just to complete things on this topic, I realised the issue. We build
binutils-cross-canadian-* for mingw but nativesdk-bintuils isn't that
useful in general on mingw and isn't built. I'd be curious if you are
actually using it.

Cheers,

Richard

