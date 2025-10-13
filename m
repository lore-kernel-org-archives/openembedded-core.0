Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C92ECCD183
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 16:10:20 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.web10.48270.1760371818820750848
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Oct 2025 09:10:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EVbGsXre;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6348447d5easo4134425d50.0
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 09:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760371818; x=1760976618; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3Z62jQbRLsEKZJZIy3Ww8kLkffH6T+tthwBeAuZBNY=;
        b=EVbGsXreOwuvfNc4XKpedA7tSvIzlM19R3Oi+owNkzChzaE1mfWxDO5utpdDPYPptO
         CopZAkamZiynfccD2yCd8VduLA1rT6dKUpint2zZvLQds463tz034ELckqk3kxs9h0O/
         OiFxi4CPIIosr0l4VMtkoWxArtiuE09udbqyB9UbYCP553pPMMD7OBzxAxyqZpPGtQKd
         IhtQ79Nb2fWPkZ1dUlYZ5Mg7pzhxGxDbT93stJWqiC1LFu4nOA7GIY09N4ORSlN7uTY2
         mPOsZbHSOavvcwqGXP6HwzaZuQMH10ID8CF7xvl9jy04dqiYLQq6/CuvW7jtlqh2IxDV
         TPlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760371818; x=1760976618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C3Z62jQbRLsEKZJZIy3Ww8kLkffH6T+tthwBeAuZBNY=;
        b=pvvGSRrP5da4Dsmfvt+JLF5ecTUVNGT60xfQs7xvH94aOl7GlGz+7ib3e6Ol2O8M1V
         +RjuBUbZ4ngBKDoZ8Ddk1NB4sDwIiMDtktUXjaxgARZreV5+KjnZ6WuRGKFl0Q9JAmp+
         BmbVXw5FIB0emqj4oelJpXLTMrDecX77iNnQeNv0md7H7yMvHR8RPLzzLFOS33g1fffb
         qWXjmHc8tFgyFEpSKpZDiJv6A64v5jEhp4wbmbyc92jc0qtcyVt+ZapzJPEx4o1xajHi
         DncE84pI4oVxV3ercG4XE7y46khDMawp85X2Hyf3uGuQp9VtjxrjOl4L2WxMmTwH3TyL
         4QkQ==
X-Gm-Message-State: AOJu0YzulJxzEaM4a9g/FaMtVRZU+iHO28aDnE8N86vDktVxgBMJnXLS
	XhhLV9YqxVlwz+Bmjv+WauAg7El/R7eTFz+sg+/OfEctwLyBg1xypkfbJeV8U/cjyYdFFU33L8r
	LqUdN2ghQ/HYzFWHBgwng2fSAizT9Pbe4q1GKn6Q=
X-Gm-Gg: ASbGncscqC0I/nNUAiTq2Jo60UI/XlEAOzhUHlujBziBkqHhKhAF8Jp/TnSlgTv0Qjh
	TqBfwIFxjIn5mD34h/zyI+HEbdSSzf/QKhdVgv/KYExP70M6nIVirPseMcwz9S9IpSOaVVuSvuA
	Oe8o08u/1W9ymipRuNMhnntnXMrUEqUcWQ2YA8FsYLa9yPd1GllzmZOCyNGWBodxGwmjbRhbtKY
	YIv/y3h4wCQoGygsPgpYUM6s0IjP1LJxgmQoKseFt9mleTm2tqbul/Pz/Q=
X-Google-Smtp-Source: AGHT+IGAnmultyDqlQB31ZSuX9C51Kbuh0F0pM+ph9V80Ck+vCj+H8UACHCTGN+EHfEf+jKzYyyr3DZc70ZPdO93hkk=
X-Received: by 2002:a53:ab11:0:b0:635:4ecc:fc26 with SMTP id
 956f58d0204a3-63ccb9617a0mr14947937d50.46.1760371817737; Mon, 13 Oct 2025
 09:10:17 -0700 (PDT)
MIME-Version: 1.0
References: <20250926195204.2323521-1-ross.burton@arm.com> <CAMKF1sqQSpAJ4UZQf4ms9_zSJuoKy4nSxfu4Z7P9yEULSJnX9Q@mail.gmail.com>
 <4055C6B5-DB43-45CB-A143-F211800E7D4C@arm.com>
In-Reply-To: <4055C6B5-DB43-45CB-A143-F211800E7D4C@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Oct 2025 09:09:50 -0700
X-Gm-Features: AS18NWB0hWesTOC19zn6_Vd5T_SSYxWHhZ0wBhvdhH86Pt0bsQj9kNxorCi4jyM
Message-ID: <CAMKF1soCw+CY4C9qvggnuK7nc0AA4Z_2gfWZcaGG2Nru_SChUw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] meson: upgrade to 1.9.1
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Oct 2025 16:10:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224789

On Mon, Oct 13, 2025 at 6:32=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> On 3 Oct 2025, at 17:55, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > taisei has started to fail building -
> > https://errors.yoctoproject.org/Errors/Details/884351/
> > it seems it could be related to this upgrade.
>
> Is this still failing? I can=E2=80=99t replicate immediately.

I patched it with
https://git.openembedded.org/meta-openembedded/commit/?id=3D67fa4530d1071a8=
e915b1fa130ac8c6377ea3c1b

>
> Ross

