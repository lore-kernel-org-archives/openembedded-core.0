Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F26B1C021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 15:06:11 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.13157.1739459165176875667
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 07:06:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cZFT3J6D;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso11454735e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 07:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739459163; x=1740063963; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=651J1jhUqukym1tFkMbfYBSUivwVAp7ZWa6Y2H3XzZk=;
        b=cZFT3J6D7H+stk+YRRqUGN2Wf6zwNzKupTvL6aBJ5iaLyhBUrwdDOANwtdsQrRW3DN
         CvB4swksRipgB+v6F7O6Qg1X9/TESfrXxa6RKJ8spP8nEpeJU0fEo1rjHAl5jPiCeEjV
         ItMW5mL9bmmcSqCQHfNX8Uoj1AogmQVSkNjp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739459163; x=1740063963;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=651J1jhUqukym1tFkMbfYBSUivwVAp7ZWa6Y2H3XzZk=;
        b=F1wDY/Z2bjWEr+/uI+zLebUBFZVfc34sHG79/76gF8Z/2lWuOt6j+V9TMwl6JM70br
         By5AIBVc62Nry8SKm5JPIuQYR73P77rd2sgE9juXfUBYV9SLLhSKPiY86AGJV/Wvt77w
         fX+hYjmk0MUUgLZLLBqiNvFXMkT5ABUl4hh2eGFsg3KO0LaJsEsDALZRP/ASxrWHSDlg
         r2iPe7V/EMwaFSFgtdR/0Ju8OJooFCi51evmBrc16o7PQePAc9CSkgFqvCopQMaw59EG
         A+GlsrfnqhwaEaxrQhNn2wwLXEvYP2thk9X65tj6gijzgR4V47HxF4SnVoZiGz0N54N0
         VUxw==
X-Forwarded-Encrypted: i=1; AJvYcCWdxRAIFKPSth0gHnarfkFSpnxTgwAcn/dyXw7by6CKOTlTzeTvQpso+RwGpa2NuTCyiHJskBMLkPiPLek5jvLh4A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YztgWjE+Ln8OinTb29acGVhrB4j50MI4dTW80IpEXg/pil/HAnA
	1WsAVEek5FnO+WxeYVBGZ+exKQ2VHhuLNmcfJ+5OX0/ITvy/DcvqlDYJJVwvmI8=
X-Gm-Gg: ASbGncuZmfqgoIszeVeIoJs/m3Y7hOkNVM9JcOj0R2uBXpR6RZHqQi2hzSGqINI8t6Y
	y2hdXEGwp+mdBHhIulS0i7IJyaffJM6tC6ARJ7KOewn5XLmQ1FJBU0jGsQ+t8LmSlDf29rSqTo1
	E14cYTSRTrm8N7hUr1f6jTdII5rsRf4GVPEwO+wcWrcbf159kxYJFUeS8P8j76ZJq6mYWbIga+p
	E2XTBpz1Je4qcUQbvWL4B5X0Fj6tRtlOeS2fFhNcRFlHtLEhgOKuep3sGlSZ0YRHrM9LD7XdHjt
	iH04Xhx1KTSjvWSfk2BA5XitZwgMF8dK2zcD0WgF34AZEgTJeUKGHOWN5AR0XLWTtxyXJpXIayY
	57MBC
X-Google-Smtp-Source: AGHT+IGsON0m/XbscnT5/4oVuG0eOC3AsiyaQXbt0C1WkTdeTXu4ehw0gFp1HP5v8hYGxSWwssQf3A==
X-Received: by 2002:a05:600c:3149:b0:439:5696:7633 with SMTP id 5b1f17b1804b1-439601b7febmr46918185e9.20.1739459163054;
        Thu, 13 Feb 2025 07:06:03 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:66a6:37ea:420a:4b6e? ([2001:8b0:aba:5f3c:66a6:37ea:420a:4b6e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258b43c9sm2173836f8f.10.2025.02.13.07.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 07:06:02 -0800 (PST)
Message-ID: <aaee021d000c6419c813d9b095f3e092aec15a72.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v12 1/5] rpm-sequoia-crypto-policy: New recipe
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?B=F6sz=F6rm=E9nyi_Zolt=E1n?= <zboszor@gmail.com>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Randy MacLeod
	 <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Feb 2025 15:06:01 +0000
In-Reply-To: <ecec863d-30bc-430b-9705-1ab720117550@gmail.com>
References: <20250212043532.1258912-1-zboszor@gmail.com>
	 <D7RCWUM2L2UY.1XEGKH8ENRDW0@bootlin.com>
	 <1823CA649EDDAA06.9844@lists.openembedded.org>
	 <ecec863d-30bc-430b-9705-1ab720117550@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 15:06:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211344

On Thu, 2025-02-13 at 15:43 +0100, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n w=
rote:
> 2025. 02. 13. 15:20 keltez=C3=A9ssel, Zoltan Boszormenyi via
> lists.openembedded.org =C3=ADrta:
> > 2025. 02. 13. 14:36 keltez=C3=A9ssel, Mathieu Dubois-Briand =C3=ADrta:
> > > On Wed Feb 12, 2025 at 5:35 AM CET, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=
=A9nyi wrote:
> > > > This ships a crypto policy file for rpm-sequoia.
> > > >=20
> > > > Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmai=
l.com>
> > > > ---
> > > Hi Zolt=C3=A1n,
> > >=20
> > > I believe we have a new issue with this version:
> > >=20
> > > > python/build-crypto-policies.py --reloadcmds policies output
> > > > /tmp/tmpqvyryz80: line 5: Bad configuration option:
> > > > pubkeyacceptedalgorithms
> > > > /tmp/tmpqvyryz80: line 6: Bad configuration option:
> > > > hostbasedacceptedalgorithms
> > > > /tmp/tmpqvyryz80: line 8: Bad configuration option:
> > > > requiredrsasize
> > > > /tmp/tmpqvyryz80: terminating, 3 bad configuration options
> > > > There is an error in OpenSSH server generated policy
> > >=20
> > > https://autobuilder.yoctoproject.org/valkyrie/?#/builders/3/builds/10=
27/steps/11/logs/stdio
> > > =C2=A0
> > >=20
> > >=20
> > > Can you have a look at this error please?
> >=20
> > I tested the recipe on Fedora 41 with:
> > * nss 3.107.0 installed with /usr/bin/nss-policy-check present, and
> > * faking uninstalling it by renaming /usr/bin/nss-policy-check
> >=20
> > Both worked.
> >=20
> > Some of your build hosts where nss was not installed complained
> > about executing nss-policy-check unconditionally, which is now
> > fixed.
> >=20
> > I think this is on a build host with a very old nss version
> > installed.
> > Can you uninstall it?
>=20
> I found an alternative solution but it involves patching out
> most of the policy generators:
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> $ git diff python/policygenerators/__init__.py
> diff --git a/python/policygenerators/__init__.py
> b/python/policygenerators/__init__.py
> index 0e3013e..180fb2a 100644
> --- a/python/policygenerators/__init__.py
> +++ b/python/policygenerators/__init__.py
> @@ -3,34 +3,8 @@
> =C2=A0=C2=A0# Copyright (c) 2019 Red Hat, Inc.
> =C2=A0=C2=A0# Copyright (c) 2019 Tom=C3=A1=C5=A1 Mr=C3=A1z <tmraz@fedorap=
roject.org>
>=20
> -from .bind import BindGenerator
> -from .gnutls import GnuTLSGenerator
> -from .java import JavaGenerator
> -from .krb5 import KRB5Generator
> -from .libreswan import LibreswanGenerator
> -from .libssh import LibsshGenerator
> -from .nss import NSSGenerator
> -from .openssh import OpenSSHClientGenerator, OpenSSHServerGenerator
> -from .openssl import (
> -=C2=A0=C2=A0=C2=A0 OpenSSLConfigGenerator,
> -=C2=A0=C2=A0=C2=A0 OpenSSLFIPSGenerator,
> -=C2=A0=C2=A0=C2=A0 OpenSSLGenerator,
> -)
> -from .sequoia import RPMSequoiaGenerator, SequoiaGenerator
> +from .sequoia import RPMSequoiaGenerator
>=20
> =C2=A0=C2=A0__all__ =3D [
> -=C2=A0=C2=A0=C2=A0 'BindGenerator',
> -=C2=A0=C2=A0=C2=A0 'GnuTLSGenerator',
> -=C2=A0=C2=A0=C2=A0 'JavaGenerator',
> -=C2=A0=C2=A0=C2=A0 'KRB5Generator',
> -=C2=A0=C2=A0=C2=A0 'LibreswanGenerator',
> -=C2=A0=C2=A0=C2=A0 'LibsshGenerator',
> -=C2=A0=C2=A0=C2=A0 'NSSGenerator',
> -=C2=A0=C2=A0=C2=A0 'OpenSSHClientGenerator',
> -=C2=A0=C2=A0=C2=A0 'OpenSSHServerGenerator',
> -=C2=A0=C2=A0=C2=A0 'OpenSSLConfigGenerator',
> -=C2=A0=C2=A0=C2=A0 'OpenSSLFIPSGenerator',
> -=C2=A0=C2=A0=C2=A0 'OpenSSLGenerator',
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'RPMSequoiaGenerator',
> -=C2=A0=C2=A0=C2=A0 'SequoiaGenerator',
> =C2=A0=C2=A0]
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> That should work with this old nss version according to
> the log.do_compile output.
>=20
> I can't see an easy way to make these imports and list conditional,
> so the patch would be "Upstream-Status: Inappropriate".
>=20
> Since it should only happen for the native build, the patch can be
>=20
> SRC_URI:append:class-native =3D "..."
>=20
> As far as I know, /usr/bin is filtered from target builds but not
> from native builds.

We only allow access to things from HOSTTOOLS, nothing else is meant to
be used, even for native builds.

Cheers,

Richard

