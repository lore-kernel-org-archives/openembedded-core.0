Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF0ABD41C3A
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 11:59:48 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.35473.1731585578271594775
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Nov 2024 03:59:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y8mQeUrG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-37d51055097so344911f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 03:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1731585576; x=1732190376; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B3Fw3jzE3AIGpKErCPfLQ5LHgSp5jE/pKDV+6t/+Sjs=;
        b=Y8mQeUrG/vwTY2VTo1Cp31aBX/zdxa9KOQ797x7qLJ/0DEQIC+x9o8QWzbAih3mGo2
         OVIqPLmJ3iFXQtP3UxLhQdXTOp/yf044fAI3umRBTgNig48miPKVXZPqrdvxZN+etcLq
         JFG4LTSAvzT9ik05rFBqN6GMqiO8vGmVI7VUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731585576; x=1732190376;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B3Fw3jzE3AIGpKErCPfLQ5LHgSp5jE/pKDV+6t/+Sjs=;
        b=F6hTwbGzG8BcLS7jiFhHGWiNlSe+3uhuB9j+QRg2UzMB5eHe6nfxOxLWVLdsaK36dC
         5j9jBnYVcd9LrSOYKifXbJpbvwhtVyJ7W6+xQCwBEySX5vsonVIDltmHfJ3UZqolSmv5
         dI4E95VNmI8x/RwnbkCWHbnduPSgSCsBpa1MZ1Fl6mUSuAx9WW9hazq0VLYeKiEd+OrE
         3WA4Z4y19+ismRuLZh1SzMEZais6ThjN7dNk/pLT0l2PupE+RGJtb7mwE4D+RHG4y9p6
         xqftSjVOIWsujU0FzJ8CFYgjhkz0p6yIRpi9ER9vz5LF8fxKnI/2nduBRzcVfoV5ZE9g
         9e8g==
X-Forwarded-Encrypted: i=1; AJvYcCVPnItytLLEFwOHBbUjBS54XOyzv7eNfdW812v3BuP2vrahiwTJH4pLd8f2re2l1qZRMpY6tPNg2BXavNJkY4s5LQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzKZcq9aczHf9TapHrz7CYprDQ9FEhBlHTmAhzHUVbqedJl3ylK
	hnht319tKNKm9p9ThCz7IwyQ/g/n89EPh2jZYfaMvuU9Pxrz/gp+KqZyKGckZ5c=
X-Google-Smtp-Source: AGHT+IFSetXGrrH4BLoBkX39MyT3+FAeEfFOsQ8keKT91D7v15W7XIJ4BJ9tEU77UJbkSW1nR/cqrA==
X-Received: by 2002:a05:6000:1888:b0:37d:5338:872c with SMTP id ffacd0b85a97d-382184feee6mr1507987f8f.1.1731585576229;
        Thu, 14 Nov 2024 03:59:36 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:593b:1ea:4243:8543? ([2001:8b0:aba:5f3c:593b:1ea:4243:8543])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821ada3199sm1274261f8f.22.2024.11.14.03.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 03:59:35 -0800 (PST)
Message-ID: <7504602b93a0b57df5c9aafd536efa2d581ae024.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] python3: add bluez5-native to DEPENDS
 conditionally
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: gudni.m.g@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 14 Nov 2024 11:59:34 +0000
In-Reply-To: <20241111173421.44377-3-gudni.m.g@gmail.com>
References: <20241111173421.44377-1-gudni.m.g@gmail.com>
	 <20241111173421.44377-3-gudni.m.g@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 11:59:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207154

On Mon, 2024-11-11 at 17:34 +0000, Gu=C3=B0ni M=C3=A1r Gilbert via lists.op=
enembedded.org wrote:
> When bluetooth is in DISTRO_FEATURES, Python should enable support for Bl=
uetooth sockets
> in the socket library. To enable AF_BLUETOOTH socket family and its proto=
cols, bluetooth.h
> header needs to be available at build-time.
>=20
> With this change a Python application can open and use Bluetooth sockets =
natively without
> using 3rd party packages like pybluez.
>=20
> An example is the following line:
> =C2=A0=C2=A0=C2=A0 sock =3D socket.socket(socket.AF_BLUETOOTH, socket.SOC=
K_STREAM, socket.BTPROTO_RFCOMM)
>=20
> With this patch the code will not fail due to missing symbols.
>=20
> Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudni.m.g@gmail.com>
> ---
> =C2=A0meta/recipes-devtools/python/python3_3.13.0.bb | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/python/python3_3.13.0.bb b/meta/recipe=
s-devtools/python/python3_3.13.0.bb
> index 54742f5257..8a98386576 100644
> --- a/meta/recipes-devtools/python/python3_3.13.0.bb
> +++ b/meta/recipes-devtools/python/python3_3.13.0.bb
> @@ -71,6 +71,9 @@ DEPENDS =3D "bzip2-replacement-native expat libffi bzip=
2 openssl sqlite3 zlib virt
> =C2=A0DEPENDS:append:class-target =3D " python3-native"
> =C2=A0DEPENDS:append:class-nativesdk =3D " python3-native"
> =C2=A0
> +# Enable support for AF_BLUETOOTH socket family
> +DEPENDS:append:class-target =3D " ${@bb.utils.contains('DISTRO_FEATURES'=
, 'bluetooth', 'bluez5-native', '', d)}"
> +
> =C2=A0EXTRA_OECONF =3D " --without-ensurepip --enable-shared --with-platl=
ibdir=3D${baselib} --with-system-expat"
> =C2=A0EXTRA_OECONF:append:class-native =3D " --bindir=3D${bindir}/${PN}"
> =C2=A0EXTRA_OECONF:append:class-target =3D " --with-build-python=3Dnative=
python3"


This doesn't make sense to be. You're adding a -native dependency for a
target recipe. How is the target toolchain finding native headers? That
sounds like a really bad idea...

I appreciate there may be dependency issues but native headers
shouldn't be accessed by target toolchains as it can cause all kinds of
issues.

Cheers,

Richard


