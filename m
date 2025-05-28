Return-Path: <trini@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46638C54ED1
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 00:51:54 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web10.5258.1748393509687865594
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 17:51:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=HAct61U6;
 spf=pass (domain: konsulko.com, ip: 209.85.166.174, mailfrom: trini@konsulko.com)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3dca299003cso28231105ab.3
        for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 17:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1748393509; x=1748998309; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5JVJLveZuc18igWPFOsV+WvQmz9Hjp0DPbVmBZekzA8=;
        b=HAct61U6ib+lgAG3iNwckNxyC119ucwoAn9U2kLRT422Biwu5fjgrqaFWdaRFeRtYU
         dTKT5u/2LrZWXf/xHKwi0Uhm9kNnKRV66yX2TWjgEXQXUZSxFxizKHZqzOp/KEFSKqHe
         et7Y1zu7yvzkx73i3qVwtz+qMdQinee2jwsjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748393509; x=1748998309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JVJLveZuc18igWPFOsV+WvQmz9Hjp0DPbVmBZekzA8=;
        b=GMRuWEiahdqLcwIiNjk1oZLDto68A5zfZFWG2FDI52jbU/u/8gvRIL2+gbjE/zfSmA
         OXbDNcfHQ8bGts6wBQAWCvQKg4Uz2TaOUWSjVfUpIex9ynzkTX+7/zP37LtBxDVAnIV5
         lKTYkrrExALMwyl70mGAq9Ds8zwrqp8TZDQVDLO310/7zdEvfZtK2jCjEARvOgVd0XLr
         KDFexmpHyslJ/BldHGEzqR1G3TOQGR5ODtlT5SJk+nMCjkgzCKN6xuTA+OR1OYledXak
         eQkSxYjqFhR8QsnkfP5hneYtnwPDWVIRzxnxrTqSNy517U9j7wJTE/giePmZJLu6YJpg
         M0+A==
X-Gm-Message-State: AOJu0YwuSZJFqJAFlU79Ihqb9LQvoVF8XVuuDsIYpgJFdIgvXlKEiRFe
	Hpj5pUK+bIrvj+Jzzo8VBy8SvtSEz0cz3oDiK83cAvHeBLQzK/pfwyPXZS6hDinrfA0f69yWtTH
	fIviT4jw=
X-Gm-Gg: ASbGncv4/Z+VWdMEQ4hr/RnKYpuFcZ1FhOPXxmvUQsJgHgpmMO1umiej6YprxGXi22g
	cfYfHVqRaAlkNke4DGC3/GupcwozfWbYFnR3PJQq3AexAHPe00j7oeIxoWjHr/76p2MXmHaMYdm
	1i7Lqw96lWCkPRt1ccWwsQ20098nlsb3ODb+wbj73W2h3wCRfKBRm1jIMBd6g4ramwmgXMEWIEz
	V0+x5w1zb5PYLzEfJ2VahQQUki/1vlUREy+cFLaSkKCzlEj9g69mtb6Jy+0M6KNHd77xfrd92i/
	2p1zWHxrw0NozT+cAlcM7C82pU74jw5cTwI3CIZkr5nk7TqV8aAaRg+/yOfjhd6UomTU1imF5Hi
	WvwSpp4cKzCjL
X-Google-Smtp-Source: AGHT+IEXBk3ZiK97NkDme1dAJ+sppyzW+g9JyfQddNR2ePttWEReWUhXUpRXUWJNyiSYPo+QIC9xDA==
X-Received: by 2002:a05:6820:1986:b0:60b:d330:88eb with SMTP id 006d021491bc7-60bd3308942mr1649200eaf.8.1748393497004;
        Tue, 27 May 2025 17:51:37 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-100-42.totalplay.net. [189.203.100.42])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-60bd9d2474asm27706eaf.34.2025.05.27.17.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 17:51:35 -0700 (PDT)
Date: Tue, 27 May 2025 18:51:33 -0600
From: Tom Rini <trini@konsulko.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [PATCH v4 1/4] u-boot: disable CONFIG_BLOBLIST on genericarm64
 and qemuarm64
Message-ID: <20250528005133.GP100073@bill-the-cat>
References: <20250526083548.413834-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WUxI8QKM+erv77W9"
Content-Disposition: inline
In-Reply-To: <20250526083548.413834-1-mikko.rapeli@linaro.org>
X-Clacks-Overhead: GNU Terry Pratchett
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 00:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217325


--WUxI8QKM+erv77W9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 11:35:44AM +0300, Mikko Rapeli wrote:

> Booting u-boot on qemu with kvm is currently hanging on aarch64
> build host. Root cause is in u-boot and CONFIG_BLOBLIST can be
> disabled as a workaround.
>=20
> To reproduce, build on kvm enabled host where "kvm-ok"
> succeeds. For example genericarm64 machine and core-image-base
> should then boot with:
>=20
> $ runqemu slirp nographic novga snapshot kvm
>=20
> On qemuarm64, default kvm setup will boot directly to kernel
> and is not affected by this. If build enables u-boot as bios
> then the same issue happens.
>=20
> Without this config workaround, the boot hangs without
> any messages in qemu output but ctrl-a-c to qemu console
> can shutdown the emulated machine.
>=20
> This seems to have regressed after u-boot 2025.04 update.
> KVM boot can be detected from speed, for example genericarm64
> boots in 550 ms with KVM and without in over 5 seconds.
>=20
> Fixes: [YOCTO #15872]
>=20
> Upstream u-boot discussion:
> https://lists.denx.de/pipermail/u-boot/2025-May/590101.html
>=20
> Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>

I think it's a tad early to disable this. On the U-Boot side, it's being
looked in to. In fact, you're saying v2025.04 is working (current
release) and v2025.07-rcX is failing. At this point in the U-Boot cycle
I think we'll figure out the problem and fix it. If we can't figure out
how to keep all the use cases working for v2025.07 then disabling
BLOBLIST here in OE can be thought on, I would expect. Thanks.

--=20
Tom

--WUxI8QKM+erv77W9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmg2XhEACgkQFHw5/5Y0
tyy41QwAkw1oVnrpvKOsuSMDrD9Mly6mZJWrxUZ5rXmPF9KWslLxfuKwy4h65xZt
WF3YIxcCbREAKwFA7n1UneMBNQ5iVEBnXl8YUTMwHU0Ji3vNQw53Q+POPHhA5O4V
Pvjj96U34VA2DX+IBqGY52bXiHaUovyi13Sev3pA+7iaM/D0+LM862T1mM3qWJKB
/XnSvkCWq0dCfAzACQEosBtzRj49b5uI337tvGeSVZRQXMObsheJZwd7sEn90XmT
LpkkF54Mo/ue1LpUNjs959SILRvULNN/TmbNqGqREmsq6vuzI0tqfz/YEVWBJR+Y
X2uS8yp1Kab4ymUYZKjjVaAqDyJG/Tdu7R5hKdsnMSIEt1wam9JlxoeO7HShHxWI
K2pwhspR82yElj7ljC0Lezxqx8BU3LC7/fxTOlZlOyj7SUEk6e57+zoGeUT5QDjX
ZG+cCDTd7A1TxlUknO3S/qs1NNX74hHFLxBphp2EfRgEyLs3i0sTyXn43BJ7hWy3
RRTJBtVG
=VqwV
-----END PGP SIGNATURE-----

--WUxI8QKM+erv77W9--

