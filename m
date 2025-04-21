Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 420FDC369AB
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 12:26:57 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.14114.1745238414097538073
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Apr 2025 05:26:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bavrooqw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso32540515e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 05:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745238412; x=1745843212; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IT/bPwoMkMOv51TcgRMPBhKqo6GIEHjbLjMzPz7Wudk=;
        b=bavrooqwBD1/civHG96AxGPxkA0FuIwoamkXw3m2KWiB/GB/52TVr3ukpOiSVo+64G
         pju7CjAl0MycYaCJA+/FUz+bBWSRm2/WWZTbw3YpdnEqhlrqt0JPBHAYIcs9S4XBnjM9
         XQOR8XMH91ApL/tqWCNpQRD667y5p+Vgcuhss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745238412; x=1745843212;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IT/bPwoMkMOv51TcgRMPBhKqo6GIEHjbLjMzPz7Wudk=;
        b=N1cLiGXLnZyFJkSBSxP4kwEdd6sp4sr56lS1vmoTHbBWlMYO79bv5NgTOuuqvDi5y5
         lx/2yzU7Kbq6TFzQdJG07rSrqVtgsd7uppKIWOwOuU74AlJF33tHPdOoDeAUgoXr7kFV
         WCXCHh9kH0ruxgrZOr3EvvTElFVVMc8dpE1RfcMZO0KJoufcyODndPPi2xylkMn9vbCQ
         RyNi9rpiqLvsbzrdQE36KW5ACUnGEK8bSLdiDfx3RSv5p2/nlWxZqPB8ccvjCd50/OG+
         AlYyC6muzwRJJ5fS4Tj2Oz3HxHTAny1cCBtk4CBBaffD9DpA7gescegKs9ridzpwmmbW
         0Q/g==
X-Forwarded-Encrypted: i=1; AJvYcCUFufxXKkVSrCosNHKBm5Rc7JRKw/PWVxlHl3UxgeOxzrv2QgH3Jv0viMavj6k2rC2qUw6h1LU/YRZwpbE1Ab42Sg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwKeCi6u+NZMT8zrfkzFqXdKHo2ch6x8B+M1o5VI3drj4IS0zN+
	BG4y3eFucP62ZDyToQVtNlyo0tcwMkEUJ/coGPxsveh3gwTZvj3OJObAspGq9q6YYopukDMphNb
	r
X-Gm-Gg: ASbGnctKgDHvG6HTd3wc6uJf6jOfqD9ZP+lWsVkzLLaK+Ky9hopcP9kLMIamWtXh7eq
	yiMRiEmc1r3RWRBGECDB/IB2Xh7W2+9ZiXw6erumBJqS9rsBTF86FtZFuB5M3C6qCToNve3NN6Z
	vo7cmHDjDpEFwySZJseaeyqV2LycM12NvB9V8+OKA5Yty+7kRwtH+jD8JJv64TMEt8nfd4rRooq
	bA9XmylTfDIVJFmz/lG6FvZpOvobsBj3AGOb+RuIKmGnsL2APeW0ZLQ+43HFq1dZAcF918+/8hG
	n/Me/iiNa2sd3tWTJc0qRYHGeIQldeKOEtuFdiLIwF33qR2GvXyRERtN0V1lfWhB10MgBqFSzOS
	2nnd+Jc7xKUvtJcS2c7lsI2LIzb2xrQ==
X-Google-Smtp-Source: AGHT+IFCeYI5Ikb2k1t+fS5YwZDdeP8fhqAOxN2NGPfQcDBbLRjI4rtd6i1wOF2iSKUcfTZzQ89hVA==
X-Received: by 2002:a05:600c:1d0d:b0:43c:fae1:5151 with SMTP id 5b1f17b1804b1-4406abf90f4mr74580315e9.25.1745238412127;
        Mon, 21 Apr 2025 05:26:52 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1f12:50b3:e6fc:b6f8? ([2001:8b0:aba:5f3c:1f12:50b3:e6fc:b6f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5a9e6csm136304915e9.1.2025.04.21.05.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 05:26:51 -0700 (PDT)
Message-ID: <0bf48ef944adc7ba879149b5c9427bc770fa86f4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] icu: Add coreutils-native as DEPENDS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
Date: Mon, 21 Apr 2025 13:26:49 +0100
In-Reply-To: <20250418081919.382562-1-changqing.li@windriver.com>
References: <20250418081919.382562-1-changqing.li@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 12:26:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215175

On Fri, 2025-04-18 at 16:19 +0800, Changqing Li via lists.openembedded.org =
wrote:
> From: Changqing Li <changqing.li@windriver.com>
>=20
> icu will check program install path during do_configure, eg:
> checking for a BSD-compatible install... /path/to/install -c
>=20
> And this path will be writen into pkgdata.inc:
> INSTALL_CMD=3D$(INSTALL-L)
>=20
> Decided by if install is installed into recipe-sysroot-native during
> do_configure stage, the INSTALL_CMD could be
> /build/tmp/work/corei7-64-wrs-linux/icu/76-1/recipe-sysroot-native/usr/bi=
n/install
> or /build/tmp/hosttools/install
>=20
> Add coreutils-native as DEPENDS to make a determined result of
> INSTALL_CMD, avoid vary caused by the execute sequence of another task
> which DEPENDS on coreutils-native and also independent with do_configure
>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
> =C2=A0meta/recipes-support/icu/icu_76-1.bb | 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)

This needs to be fixed differently, we should be forcing it to use PATH
and set the value to just "install". We don't want to add dependencies
unless we really need them, they slow the builds down and add
inefficiencies.

Cheers,

Richard

