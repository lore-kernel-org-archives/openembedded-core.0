Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 667E3C35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 10:20:40 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.4445.1742379635110477516
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 03:20:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PVO8ft/q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso5765939f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 03:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742379633; x=1742984433; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iCNDajI1i0wOtnqGzoGbuXYi68QGQm7d6ixEbw9WknE=;
        b=PVO8ft/qdqomN/xXIWcJ8LY6MhPK3Rb12mwLBO7Xl4KrqNXZ/o54RyVYMd98Yj8e1b
         8ZtBmf1G9upmWvFqC3OeCVnTjQ6dXIrtESiPPDPSTJnjb4k8yq8zH7BN3OvO8N9rTFTZ
         WajWC5QZ2yhkVL5lVy3Z8+YPjOgyu8kQh9V7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742379633; x=1742984433;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iCNDajI1i0wOtnqGzoGbuXYi68QGQm7d6ixEbw9WknE=;
        b=Ogpjdl4PCgqELYwSNLF10b8jtl2pK+eFH6z1l9gsiki8VyqIOMlGryfCWDd08NxbGD
         p4wJomI4iRkhqLGcwJ8KIzHM26LBrRr770bUctUhGTgQxEuE/NiTJW76AcHzlCDFF9EQ
         aYwiO+Tz51YOG/w23CFgtB1p4OLbG14w3APdTNpoPi/m/NXpzqWsUsDPZqZshN90E/6W
         Al/l1arybTb+4EJLempJhhzPI/SXh9DF9PalOwYsGQ1cMDdfLrRSOej2cPR2VpndsZXh
         j76T8dtbsNT26k0+uO1fvWhcffIssgNfDkwVI+iMlEfqZrLpwlqmtA41EfbGgktEJS4i
         6GHA==
X-Forwarded-Encrypted: i=1; AJvYcCWo7UlCyMkplF9ztBx6Nba/bsh095Jf6gsRFTJCOWd1Xyq7T+z371O8cGFyhjSWpQVU6sHSDsWT37B0Ywfpp1fNPw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwnZYPPIQozoXx03h27iM+v7X9O6y6EwnKByyaBnRuIbjMP/f+/
	qtlgRk8UtpNNbsT+Hs7t6eHQT/Uh2REguIJeTGhmKM2CdM/gbkPFsVj8+dONXfM=
X-Gm-Gg: ASbGncvVmQWY6PIz+Y1uZHLcgbDRKp+AlhhWeaESEb1v4uaKut7DPK24ygt7w7Z1+vf
	VO8rfQD+favcvudGp+Feqny7k3+PQfYKcZ1vWmXdcuak+PyThOof3G8UgeG8+wIiQxfdlVaKhTZ
	7ISFWa/Gg7ECmBzuwFfUCLBe3lCT7ZIb5IbWESliyi+tdTvMCENGH6NF4pPzAZcu22C3gfbvgKN
	9s7KVtB2mS7TX7jxFE84kTs47N2TYvEI08WYjXLlNTinIb1vt7h2+5Yh/gdbJyt5Vfm5lTcjEKr
	jraXBXkH1JmAMn1g+vP0GyVugV9WlhoIoLqF3FoWf4mKqXBLugWOzBv7w80MhbOR4p+ysuqj3lh
	vP0wlBDLLTCbgC/Ys3HjQk5dWmsi7FEY=
X-Google-Smtp-Source: AGHT+IGUTCW0XUQZjXBp97QMA16UHWUsdMA4LOiTONKpqXLXybfg89/ca3Y/ERcwoy2ImSTlMx/UYw==
X-Received: by 2002:a05:6000:2c7:b0:391:4835:d888 with SMTP id ffacd0b85a97d-39973af9092mr1858035f8f.42.1742379633235;
        Wed, 19 Mar 2025 03:20:33 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:dad:b471:9c34:4577? ([2001:8b0:aba:5f3c:dad:b471:9c34:4577])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7ec14bsm20502776f8f.100.2025.03.19.03.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 03:20:32 -0700 (PDT)
Message-ID: <51cc8655a05cc6cfaef32ee550fe11175c23da9c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] mesa: correct download location
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Wed, 19 Mar 2025 10:20:31 +0000
In-Reply-To: <20250319100959.4102512-1-alex.kanavin@gmail.com>
References: <20250319100959.4102512-1-alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 10:20:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213320

On Wed, 2025-03-19 at 11:09 +0100, Alexander Kanavin via lists.openembedded=
.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
> =C2=A0meta/recipes-graphics/mesa/libglu_9.0.3.bb=C2=A0=C2=A0=C2=A0=C2=A0 =
| 2 +-
> =C2=A0meta/recipes-graphics/mesa/mesa-demos_8.5.0.bb | 2 +-
> =C2=A0meta/recipes-graphics/mesa/mesa.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A03 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-graphics/mesa/libglu_9.0.3.bb b/meta/recipes-gr=
aphics/mesa/libglu_9.0.3.bb
> index 8151727c52a..9e23ff830fc 100644
> --- a/meta/recipes-graphics/mesa/libglu_9.0.3.bb
> +++ b/meta/recipes-graphics/mesa/libglu_9.0.3.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://include/GL/glu.h;endline=
=3D29;md5=3D6b79c570f644363b35645
> =C2=A0# Epoch as this used to be part of mesa
> =C2=A0PE =3D "2"
> =C2=A0
> -SRC_URI =3D "https://mesa.freedesktop.org/archive/glu/glu-${PV}.tar.xz=
=C2=A0\
> +SRC_URI =3D "https://archive.mesa3d.org/glu/glu-${PV}.tar.xz=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "

Doesn't this have issues with the "older-versions" directory that archives =
are moved off into?

Cheers,

Richard

