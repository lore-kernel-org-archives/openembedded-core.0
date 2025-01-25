Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEBCEC0218C
	for <webhook@archiver.kernel.org>; Sat, 25 Jan 2025 15:14:16 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.11684.1737818046820036330
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Jan 2025 07:14:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KEut9dY4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so34537355e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Jan 2025 07:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1737818045; x=1738422845; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s200OZY11SassNoxqlVpX8p+P3GHiLdOFBGFwtWzoDw=;
        b=KEut9dY48C99NnTSBuzYsLLpp52ciW2Iw0rO+NcOZMSFhPy/1uNoJdlpqt7Ky0xT63
         04gyHgm6tDBOXXyqs7EuqA8xNsgYzgrEW3c7JZfSXoBGtm4YUby7mKkkwCeja7C5QItg
         /aUTNktzZphJF9MbGYiIOBmsQV9S5xyct/094=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737818045; x=1738422845;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s200OZY11SassNoxqlVpX8p+P3GHiLdOFBGFwtWzoDw=;
        b=V3hblgdmbTj77e3zPKwdaPgMXHn1+Rl4PmuneNQyfP8JA+snuCSkZuMVhef44jarsv
         in/FaIwU7XYdZzMJlSlDk9MChpa/0gDlSl5wkmYQ7lz/OlNXsCjjGBPzqi+FSQ8LxX5k
         5B8Rp6G0VlQGMfKBZsw5INoQWqf6El0ShNjaJ+NKCpZWK0QJkXibpG0YitX1p6PVcG5j
         mqCUXomJy7aV7Oq3VUOtO/tgEgBmKgbpS/9VBLZPARbIty082fnFXe/r9CusHiJ6FhM2
         CrSIhpbvs5lmmEBUCvBFm6lL6k1g7y/5qIncTJjuDodT9W8O1nSUC30XaywTGvPDoqo7
         f5bA==
X-Forwarded-Encrypted: i=1; AJvYcCXapSuIj+3+APBCMrTxEgeqfAHKX/gTzJ7Llx1MWMNxDCNPRjqC8mApLqiwDecoNiLV2K6hio70RkQoz4LOIeiz+Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyzUE8mP0bpxLqKVwc7lCPRyfiGB3PabGk3zXrGrSEE2XJU6FVB
	bLkRQyz/DJPSU8AUZFuoUmenE+lQ190e8K0+GmxND36d98Chrs1ZKrbq7EZ7sbw=
X-Gm-Gg: ASbGncuIdqvCpycTc+oMu4GdsO+XGTpkoM9M+37ez1+BsemnOKg1uOgX3+dyow1Zkth
	06ztsYKNdXEYNVbOlOH0YNygSYCs+GFxozW8+6StLuUVN1iWWJ6GW/eFUcIZUXMv3yZAcPDVxJ9
	XzvsvbjaiHRNHdpRlv0hBycI4DoSGOpmvnreelENli2ujHrWMbXgNWKzRq2ysCDG/nM+aIW1QNB
	FNZnlWzNzkTgm4iE7wMGA69B58U0cs9qP32BiKhVTO2zG72ahOrKhhkcYOErdQ2cPOrWsyoTULc
	KN8T+BKsPpd9F/314+m9qdGPKJT2e2VpBbhVQhgMoNjW7j0jVBq80sMtPabD4vqe5oE=
X-Google-Smtp-Source: AGHT+IGVtGGUO+LpOoWVwLpR3enS+DSdvPwST4UvmfZ1bkKo4ffX/jBJuv8qo2R4dv3Oa5GEclgDig==
X-Received: by 2002:a05:600c:5112:b0:432:cbe5:4f09 with SMTP id 5b1f17b1804b1-438913becc3mr298299205e9.4.1737818045276;
        Sat, 25 Jan 2025 07:14:05 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:ac79:b32:597e:d068? ([2001:8b0:aba:5f3c:ac79:b32:597e:d068])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4857b8sm63353025e9.15.2025.01.25.07.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jan 2025 07:14:04 -0800 (PST)
Message-ID: <d714b64c8771314895ee07ef3fa8adaafb2024d7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] busybox: Correct SPDX license reference
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bage@debian.org, openembedded-core@lists.openembedded.org, "Yann E.
 MORIN"	 <yann.morin.1998@free.fr>
Date: Sat, 25 Jan 2025 15:14:03 +0000
In-Reply-To: <20250124200723.14829-1-bage@debian.org>
References: <20250124200723.14829-1-bage@debian.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Jan 2025 15:14:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210263

On Fri, 2025-01-24 at 21:07 +0100, Bastian Germann via lists.openembedded.o=
rg wrote:
> Commit 6238ee3ecd (recipes-core/busybox: fixup licensing information)
> claims that there is no applicable license identifier in SPDX, so a
> bzip2-1.0.4 is made up.
>=20
> There is no bzip2-1.0.4 license defined in SPDX. However, bzip2-1.0.6 is
> the same license.
>=20
> License-Update: wrong SPDX identifier
>=20
> Signed-off-by: Bastian Germann <bage@debian.org>
> ---
> =C2=A0meta/recipes-core/busybox/busybox.inc | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/bu=
sybox/busybox.inc
> index f778cff0f4..cebfd3c48c 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -7,7 +7,7 @@ DEPENDS +=3D "kern-tools-native virtual/crypt"
> =C2=A0
> =C2=A0# bzip2 applet in busybox is based on lightly-modified bzip2-1.0.4 =
source
> =C2=A0# the GPL is version 2 only
> -LICENSE =3D "GPL-2.0-only & bzip2-1.0.4"
> +LICENSE =3D "GPL-2.0-only & bzip2-1.0.6"
> =C2=A0LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dde10de48642ab74318e893a6=
1105afbb=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://archival/libarchive=
/bz/LICENSE;md5=3D28e3301eae987e8cfe19988e98383dae"

There is a bit of confusion here:

https://git.yoctoproject.org/poky/commit/meta/recipes-core/busybox/busybox.=
inc?h=3Dmaster&id=3D0776bf6600c42cec2961d3f6d33c8c9c09cbb1ce

Is the 1.0.4 and 1.0.6 license different or not?

Cheers,

Richard

