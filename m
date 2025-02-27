Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25521C021BE
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 11:44:09 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.8744.1740656643922492347
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 03:44:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Wzh6Wpcx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-390e3b3d3bcso793580f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 03:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1740656642; x=1741261442; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=e9uEoWPjItbf948cV8TqGUdip5SsYM+36ysmyzPkoGA=;
        b=Wzh6Wpcxr3IjtZw20OkxZXx34vE8isU1agsu9KhXPsTZ5DgjrCh7iPnKWMScmOeQX8
         Hhcko5KXcw7N5a5G5fXjDJsTjYlcyxeWnVHeoo0JcY59yYCHgqA1L6h36AV893ugFiV9
         VTk91OlUajP9k+CTnbfbMTanQB61LMCjUJqtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740656642; x=1741261442;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e9uEoWPjItbf948cV8TqGUdip5SsYM+36ysmyzPkoGA=;
        b=nfMlGMGHGKsNZcxdjEkmRM3626i/7sRb8UasXE4PjbBONHTO1+U/1BCpknMJZZfGyJ
         1zlNOi1puk45rLnUkhCmJ1dIk2fDd/wiHvj20Mn2CumNHliSyDFOjEVPqkMgPCGACyNy
         bvBRzteIDyqq4QMgNboY+JOT1B+3FVnCdLZHbKVl4tkiF6jaMVH4WYW05594dO7Aqoe9
         nSH/nryxkbmslI+hOSqFLS4dV0PhmOsUZXc2u52WyvmYR3QM+L6MkTkYuMEHJvdhFOZ8
         b0K1sr/b1RMRsrzqDBJ1CtqxLwUHYtClbQDm+xrSZ26ptfH1M+Nk89DdUNkBXOo+Tlvu
         zIyg==
X-Forwarded-Encrypted: i=1; AJvYcCX6z2+XdMI+gsBaZWa1sWRv/71nYYMTS4dNSm5PdxpXp5GtK75NEeL0V+LEoR78kNdXkPIG61ifETVp3Qt9SXtwtw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxzKpl+MjRqRCoU50lLlfrIBosmub7wP/yOXKoTfq+V8cwK140f
	V/bi0kQ+IJnSvGdWI0ncffVtvRwL5iWCyj49j+JLNs/h36Yh6nSeHPcPZE5Hl/E=
X-Gm-Gg: ASbGnctnP0B4nY5D88LjBQsTAE1YKnG+79KjGuUoStrk8a9eVDUbWs62k3yiTb8Dp25
	CiLHcyRFPSwrIaYydKBpcU/vH8zBSG3/gc5NJP9ZRmQWkt8wJR/sl1eQcqL2EmCB0clovFhLPBF
	CKu1TkLANTaIG70W6TOtIBRq7iAiLmR55FHWIz22YSXqlN7wMK6ZkFM5r/Db0IRZqd1JT/3bUIz
	DokfCKelD/+8mDVlxtpiO1rDF8ass3rCHP1Jy3+xg6ALEfUnceSoUTYm1/aEoG4tE1tkYAxuiUZ
	zfK4Rcu7BbCc5R7jFGmc5QQbPGH5AMyBzynmoDnN13R0BERdPRxqOmo4swvWEM9QcD0LhfsfQFi
	KijvjbNxDNaKiypI=
X-Google-Smtp-Source: AGHT+IFSQfnac69fPtn0f+1VTTsuOYU5krLb2Nj85BrX3uqYt+ASWxarGQOtgNzYTUvz8HPLOOoRHQ==
X-Received: by 2002:a05:6000:1a87:b0:390:e005:65b9 with SMTP id ffacd0b85a97d-390e005680amr5057137f8f.23.1740656642207;
        Thu, 27 Feb 2025 03:44:02 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:af40:c449:3dc9:d155? ([2001:8b0:aba:5f3c:af40:c449:3dc9:d155])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba5871f4sm53405995e9.39.2025.02.27.03.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 03:44:01 -0800 (PST)
Message-ID: <2b2bc885dcac8b7f57e615d3d1e181766a7e7f1d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] barebox.bbclass: use consistent make flags
 for menuconfig
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>, 
	openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de, Ulrich =?ISO-8859-1?Q?=D6lmann?=
	 <u.oelmann@pengutronix.de>
Date: Thu, 27 Feb 2025 11:44:00 +0000
In-Reply-To: <3601ee15eb248f29bf38f28f467cf058d425b7f2.camel@pengutronix.de>
References: <20250227092821.2766396-1-ejo@pengutronix.de>
		 <ce6258c66b0a7c5eeeb8cbcc6a38b5d39a8b3bd5.camel@linuxfoundation.org>
	 <3601ee15eb248f29bf38f28f467cf058d425b7f2.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 11:44:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211990

On Thu, 2025-02-27 at 12:23 +0100, Enrico J=C3=B6rns wrote:
> Am Donnerstag, dem 27.02.2025 um 11:17 +0000 schrieb Richard Purdie:
> > On Thu, 2025-02-27 at 10:28 +0100, Enrico J=C3=B6rns via
> > lists.openembedded.org wrote:
> > > This change is done similar to the change in the kernel.bbclass
> > > of
> > > commit 8c616bc0 ("kernel: Use consistent make flags for
> > > menuconfig").
> > >=20
> > > This was discovered since the new CONFIG_GCC_VERSION kconfig
> > > symbol
> > > reflected the host GCC version instead of the target ones after
> > > running
> > > do_menuconfig.
> > >=20
> > > Reported-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
> > > Signed-off-by: Enrico J=C3=B6rns <ejo@pengutronix.de>
> > > ---
> > > =C2=A0meta/classes-recipe/barebox.bbclass | 1 +
> > > =C2=A01 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/meta/classes-recipe/barebox.bbclass b/meta/classes-
> > > recipe/barebox.bbclass
> > > index 200ba08326..baba0a2965 100644
> > > --- a/meta/classes-recipe/barebox.bbclass
> > > +++ b/meta/classes-recipe/barebox.bbclass
> > > @@ -53,6 +53,7 @@ EXTRA_OEMAKE =3D " \
> > > =C2=A0=C2=A0=C2=A0=C2=A0 PKG_CONFIG=3Dpkg-config-native \
> > > =C2=A0=C2=A0=C2=A0=C2=A0 CROSS_PKG_CONFIG=3Dpkg-config \
> > > =C2=A0"
> > > +KCONFIG_CONFIG_COMMAND:append =3D " ${EXTRA_OEMAKE}"
> > > =C2=A0
> >=20
> > Can we use +=3D here rather than append?
>=20
> TBH I've copied the line from the kernel.bbclass.
> I guess this is because of
>=20
> =C2=A0 KCONFIG_CONFIG_COMMAND ??=3D "menuconfig"
>=20
> in the cml1.bbclass.
>=20
> If I'd replace the weak default there, it should work.
>=20
> Or would it make sense to just set EXTRA_OEMAKE in cml1.bbclass by
> default? Like
>=20
> =C2=A0 KCONFIG_CONFIG_COMMAND ??=3D "menuconfig ${EXTRA_OEMAKE}"

Setting it to just include it probably makes the most sense at this
point. I'm just trying to keep the variables simple!

That would affect busybox and u-boot but I suspect they probably need
the same fix too.

Cheers,

Richard

