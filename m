Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 172DAC5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 07:12:38 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.10451.1749021148035565864
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 00:12:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M5RCiBBa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a366843fa6so3405086f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 00:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749021146; x=1749625946; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+qE+1Izb2qzTkp0BooZxW2Hz44Z6Dysh8wn3wILUdI=;
        b=M5RCiBBao7igwe+SMKAdrkjIy6NmJdJT34bVZV60IdvqiYMhjo5SVJlTxgIcLTSHsu
         bW6lwdsk83xl3QoAr00sAbuLlwju4XjeSyU4C9DNc5OSLwZh0+TLWDBNd9ZBlR7pUWCg
         izSlYo0gFACuJEs7ngaUWQaZD2HmDS//U+BWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749021146; x=1749625946;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t+qE+1Izb2qzTkp0BooZxW2Hz44Z6Dysh8wn3wILUdI=;
        b=aWIglLDvVyRLZ224LeqH0kN6EJ9JrZ+yi4HMX0iwq0o5+V7NdVFm5euhjru+TNeuGG
         Nlqq9/vNmxCoiNojWk2KrvFnyfUR181ZJq+2wy0D2s+/iY3Y5wkTOBIo12uI9EbAdtFF
         4kotOdaIqOKwvy0ESjrdSB/8BWIWoV6iwNzZbZiTxkXBPpIFvT7xjP9X9+y/han6np24
         ZOIpiVScuVvj+FNwFt9JoucKEap6K08LrPkuhxTbU4LgfTZir1DukRLdumLo5/bvw9sA
         voyJ4ca90u3hPCMXU8jOo1FcVx2/elbw0g7n6COKbXrnCSMk/96ATZlEuN9OSIUY/gXv
         aEKw==
X-Forwarded-Encrypted: i=1; AJvYcCXxUs/MAUp5y5afbVS4bnDx5MUHIzGbVwiDrBfIc1GsBgTcCtyWRaUXJcYqH29Wm+AEmNSj5pW3Dp3ok1XxSrtnng==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwHpioUWTAAVZBfksBiyFZqRqc8Ci6T2vCMTgwChsjqNwHDCnju
	/a4nhDiSOnZvyOuk5+Zibrq7QtbcauNks4dN7a3M6uwRYN7AYl2dUSmFVkiZD0EVfH8=
X-Gm-Gg: ASbGnctktYPuRMEU7J6LQo8O8geqy/GJBjMvzSSrXotuwSGJ6mpHRjdhjBERFlZzpwM
	zgHGjMS9R+ICvvATc5VZ7di8YzdeWA1OImzmIhbOaMPxbi5qeG1/5Vu9si7Elb6sA4o5Uu+H/5J
	v9+eK0WZbnXRO7Z9B2We01GeuJSerYwdDvm3yo2c9pfsFw2/pmVJWauYSleC/xMDR9mGd8mBrSb
	7R+aL0xZ+rzFzuETh0/oO9LxMMEwpdvcZapx/DlymoW1E/b2vIIn23CBs/YAqq+ttV75C2Z3Cdq
	eArhvS4de1iNAPYqwlWaKJ4N+JBXn6BnkTxfXng4ub4S8H0XFPcmnAPmvIKYF++ptxs7i8RQMTd
	GksxQqeaM8nIBah7X94RZcED57m383o4A5t/lBBr81DFBovBQ3lo=
X-Google-Smtp-Source: AGHT+IFCAkBZK0OtfwPUfHFYsNHQ0hGqUT41eYOteHxFX7v7lEjYQF3vMBuVs+fNXgHRS6gqRYPUUA==
X-Received: by 2002:a5d:5f54:0:b0:3a4:dfc2:bb60 with SMTP id ffacd0b85a97d-3a51d937403mr1233041f8f.26.1749021146430;
        Wed, 04 Jun 2025 00:12:26 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:204c:fb2e:c462:29df? ([2001:8b0:aba:5f3c:204c:fb2e:c462:29df])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a521c64d22sm434495f8f.48.2025.06.04.00.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 00:12:25 -0700 (PDT)
Message-ID: <016900dc0028d234f57f41a4f16a76bfe89b10b7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v7 00/20] FIT image improvements
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Freihofer, Adrian" <adrian.freihofer@siemens.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 04 Jun 2025 08:12:25 +0100
In-Reply-To: <18458D867A23466E.18429@lists.openembedded.org>
References: <20250603082419.409564-1-adrian.freihofer@siemens.com>
			 <dd27e615bd3ea965dee284352c90794d77854cf0.camel@linuxfoundation.org>
		 <3338cd8105d0f0832f01bb0f8b705e26f91c50d2.camel@siemens.com>
	 <18458D867A23466E.18429@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 07:12:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217841

On Tue, 2025-06-03 at 15:07 +0100, Richard Purdie via lists.openembedded.or=
g wrote:
> On Tue, 2025-06-03 at 13:35 +0000, Freihofer, Adrian wrote:
> > My conclusion is that the change requested by this discussion
> > https://lists.openembedded.org/g/openembedded-core/message/217730
> > makes the linux-yocto-fitimage.bb incompatible with bitbake world.
> > I guess that bitbake world would now fail for all build configurations,
> > not only for musl.
> > The background is that the kernel artifact (linux.bin) which gets
> > included into the Fit image is no longer built by default. It requires
> > KERNEL_CLASSES +=3D "kernel-fit-extra-artifacts".
> >=20
> > I guess that this !fixup patch is the solution:
> >=20
> > diff --git a/meta/classes-recipe/kernel-fit-image.bbclass
> > b/meta/classes-recipe/kernel-fit-image.bbclass
> > index 6d80cd4bb47..d2eebb88bc2 100644
> > --- a/meta/classes-recipe/kernel-fit-image.bbclass
> > +++ b/meta/classes-recipe/kernel-fit-image.bbclass
> > @@ -7,6 +7,9 @@ UNPACKDIR =3D "${S}"
> >=20
> > =C2=A0PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >=20
> > +# This bbclass requires KERNEL_CLASSES +=3D "kernel-fit-extra-artifact=
s"
> > +EXCLUDE_FROM_WORLD =3D "1"
> > +
> > =C2=A0DEPENDS +=3D "\
> > =C2=A0=C2=A0=C2=A0=C2=A0 u-boot-tools-native dtc-native \
> >=20
> > But I need to test it before sending a new version. And today I have no
> > access to my build machine.
>=20
> I just saw this and it matches my other email. I also just realised
> there are mutliple other world build failures. To expedite things, I'll
> include the above change in a test build.

I an confirm this did build successfully. I'll just clean up my patch
in master-next with the above in it?

Cheers,

Richard

