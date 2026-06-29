Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8757CC43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 22:44:53 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9537.1782773090733335050
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 15:44:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=inbBuQ7T;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493b5d61302so88905e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 15:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782773089; x=1783377889; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JtoNqnjiQfI8oDCsxGjPxorZtAg5PbEwom9GHYEZ9Bs=;
        b=inbBuQ7TuRepL0dU2WtAYpRWnlydab7FcMGdBMGfQCwcvVV7QGsvEVg7dYgjle7Akz
         c88kP47RSm1GxsEgxifgDIKydeTq7zA0COrkE8F4LAAWRmKhvuP9XG+O5z7zpu/T8vxQ
         0yx04/qGC38aS1nEc94kfp73WM+c/qAxhLVGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782773089; x=1783377889;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JtoNqnjiQfI8oDCsxGjPxorZtAg5PbEwom9GHYEZ9Bs=;
        b=poA1+G8Cid8uVF6I42/j1pcz0GWiVFb6qKPKWN5xYuJspi14Z1JvkbdrlrIcONtCLG
         ura97l+KErpQBYhbmaKOVehEdObk82/lmldHbdSQKhgMkn9muR0h52SGvLDn0bo3Drho
         B7+ILbh5Qqg5zfK5bkitPUMSmyqI80KaIFessytSBd6XuammSmuZuhO3QMTgqPpXUHxp
         t0gAqe9zQQv+43UvOWmVvSefkuRaLI9VlCFOpgMuNOR56PBUp5k1YtDIrC5cxyQmg5Su
         0n8iuD7itykRekTumKhdA5WBqkZSlg1/d4WgWciXbsbuq5PGovDE8hYWCbOhd01bp1Lg
         bQxw==
X-Forwarded-Encrypted: i=1; AFNElJ+F7ZDeNWFf6BIoYGDBtoBtOPp3iaUG4kX2g/qFHBHJbbIQBtze0dPA16HSYRRrzOcWNQqOyI2b5lRx8vSjJspJMg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx9k6iI76212JDwdbC/M+RR/hqa1UmaYAeoF8ObEI3aOJ5tvgdj
	vRBd6ZdEhm5v12DOQYqv9ohQVjeBLG6fvpDzkJW5F5hvZ1zUZnEDn0/7nDbGbaq8tu0=
X-Gm-Gg: AfdE7ckx3Uv+8JSVdxxDkz4cWbgro1rFdmU8G5vVPxyYb/+4AyP477FezKS+2m5XNwF
	n7o6hPUoJu660A2+LZZz7FTrh+uM121/lDk+UAwdGKz8o+a/7Xh/88BereUYBUM6hpDwJczT7eD
	c004hVVYBpmZaxWxEjXl9x1eeNQ6Tq3YsvUv4vQMOO/D/7n82y8FD1RJrpBdOF7igkQQPw1KVKE
	LNE1eFhwqfdAXD5Zx3lBb5CRepDiu0CBWr3Qi4tgKuMjqC7uvbaBmrdbddm30DPemhkxW6FSAwV
	n8TEIn/VHRpDvf3shHnqSlwAqZlrGP+F+2OQxmGEl3/SaLKKiWJQayh08Sa59kVV6IWB27lCmcn
	k8oO7KJQS/cDrGM/6fhSs9imLNRzdaDJtB2Rezb5NJq4Xx1YsGz4mvT1bycdr0JSwJ+giVrMhuU
	ie1UJdIobLHC3TfxCe6qtbDzIOSvlnwUTYKjppWbTEqNLd24+LK1+aKF5//I/EyHaM0XRhqowLk
	3D6
X-Received: by 2002:a05:600c:3e0f:b0:489:32b:ac0b with SMTP id 5b1f17b1804b1-493b8cd4532mr10394735e9.6.1782773088814;
        Mon, 29 Jun 2026 15:44:48 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493b8cb62f1sm34035965e9.15.2026.06.29.15.44.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 15:44:48 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Jun 2026 00:44:47 +0200
Message-Id: <DJLWBE1WSDSN.G0FEJAKOMOUI@smile.fr>
Subject: Re: [OE-core] [PATCH] dropbear: Clarify LICENSE and drop PD
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <richard.purdie@linuxfoundation.org>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260602150018.189097-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20260602150018.189097-1-richard.purdie@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 22:44:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239828

On Tue Jun 2, 2026 at 5:00 PM CEST, Richard Purdie via lists.openembedded.o=
rg wrote:
> The "public-domain" code has a MIT license header so we can remove
> that from LICENSE (MIT is already listed).
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-core/dropbear/dropbear_2025.89.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/dropbear/dropbear_2025.89.bb b/meta/recipe=
s-core/dropbear/dropbear_2025.89.bb
> index 957a0901fb0..ece065265ff 100644
> --- a/meta/recipes-core/dropbear/dropbear_2025.89.bb
> +++ b/meta/recipes-core/dropbear/dropbear_2025.89.bb
> @@ -5,7 +5,8 @@ SECTION =3D "console/network"
> =20
>  # some files are from other projects and have others license terms:
>  #   public domain, OpenSSH 3.5p1, OpenSSH3.6.1p2, PuTTY
> -LICENSE =3D "MIT & BSD-3-Clause & BSD-2-Clause & PD"
> +# The 'public-domain' file is headered as MIT
> +LICENSE =3D "MIT & BSD-3-Clause & BSD-2-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D25cf44512b7bc8966a48b6b1a9b76=
05f"

While reviewing backporting this patch for scarthgap, I've look at the
licences of dropbear:
The "'public-domain' file headered as MIT" is (I think):
https://github.com/mkj/dropbear/blob/DROPBEAR_2026.91/src/curve25519.c
(indeed MIT header)

But:
* vendored libtommcrypt is "PD OR WTFPL"
  https://github.com/mkj/dropbear/blob/DROPBEAR_2026.91/libtomcrypt/LICENSE
* vendored libtommath is "Unlicense"
  https://github.com/mkj/dropbear/blob/DROPBEAR_2026.91/libtommath/LICENSE
... is that OK that those don't appear in LICENSE?

If yes, then the argument is still valid for scarthgap and I'll will
backport.

Regards,

> =20
>  DEPENDS =3D "zlib virtual/crypt"


--=20
Yoann Congal
Smile ECS


