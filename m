Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC98C55162
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 21:16:43 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30729.1785705396400068971
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 14:16:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KZGLB0X5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47fd4531020so1532155f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 14:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785705394; x=1786310194; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mJgi/y5aIZB5EQJUzfDDq5Y/2gO0QZ4fQkjEffTgcgU=;
        b=KZGLB0X5EBjjmC0k0WpUYVZIfkIcYVsTU+YISGCL2uUzTvFymPsatT6ptwET8Sxce8
         9GR/dnBN1aFwLjnXFIfNO/GGDtDknBYH78hQ0q8Ed8izltjIqemupvSl82dVV3h8S8S4
         cV/cZV/CZ7F0gKlnVRjBZhYfwas64ZBv2rwoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785705394; x=1786310194;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mJgi/y5aIZB5EQJUzfDDq5Y/2gO0QZ4fQkjEffTgcgU=;
        b=PEzBfiVP1gCafH2QzhiHwCic/xJUIjs6R6UVGzam8E2J97JiFXSvyxoD4nDO/reaAT
         pkAvy6BFIu/sw9DeO3elT+ztW3cDalEj+cLUZWhwb5jW31W4AOT2HHrfyvU6XFydSXlh
         WaRw7HYEMNtujm6W4jJHSJs9C94WG12Rw7Mn5EKJzrFrFO490zr5vh9nFz5TFaJY4iDW
         kAemgUDsDjmu1Ql2zumQ/Df0ExriG2NkKqT0y9azbNKVq7ap1PiXMoJhheRMt83Cq9rn
         yueqzn+DD5m2w9qO9c6PJFpdtJoJyZ96GOTj09LKmUuKZzUIchdPa6Nflob+9Y0uA1VI
         surg==
X-Forwarded-Encrypted: i=1; AHgh+Rourusn+ElCEBXxPGQL+7qJSBuLLeTwLJUUzMMjYXUXTS4lmP1tLN3i3u2FZTsUTQ8J4c+OuXrKF76eZB+UimVYZw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YydM2zHCJySfucKAjOZAIaQJVWQQZxbfjsKjRTFJbJBWkyQ34Qn
	Uy/5M4nSUyCFQcEcccYplQFfhv/nnprCZpgAh8bKYxhoGz0hWte0Bzmx4u0TaCZXxVc=
X-Gm-Gg: AR+sD10x2BYHHjL5EhonUPcbnxceXbBEi+C1EFUKRjz8LRAIj3xtcBplGc09qsGpQaf
	T1wKVsAVaSxdxFpDwRxItGnjMeg99mOlzV1Umdp0mlo2y4OZ8S5WTJDFd1ssRHvDNX9SoB+2Vjt
	I20rSJAhvhY1I62srhFDOy0dln9qrB9qlghy3Tt1Ov/PYJn8byfpnD6hDzt8VijHTu2hh1V4QMn
	AkobQnR9DIibWr/VbdzWWymH4PZD+MWThPkX18RDWK49THkwRQOISIQghmj0AIoJ2tR6lklsEGD
	weheHiO4uELuMGi06gHtFEm4XfZHY3ko7x3eX9gKwXkcKj+rdBeGWLOiKIy1aPQv80BxwZFaOe0
	YspjFFa1wZQxdKrKM0Z7HWSvclPLq+qGYGMWYQRs8Mq2KywZCQJMF/Capcl/ABAn1kap4U0+aUB
	/pGyDO2N7RGtmbYeriQpAt7HOLh7ShAMKZB4U9TFoqT2pjeHqpa/WBVP4tQFKXlpR/eW96Ip3Te
	rQftkA5NedavnrycUhhvttrjEGh7wB3tRM3X5Td9KH2ZP1AuE31yg==
X-Received: by 2002:a05:600d:8443:20b0:493:e974:41ac with SMTP id 5b1f17b1804b1-4980c6562c5mr123376325e9.16.1785705394394;
        Sun, 02 Aug 2026 14:16:34 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64? ([2001:8b0:aba:5f3c:11e3:e7fc:e526:8a64])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b7afe6sm154554445e9.0.2026.08.02.14.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 14:16:33 -0700 (PDT)
Message-ID: <ec4a11ec79c92ef2c06fe0cd55777189bb5d691a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 01/14] qemuboot: make do_write_qemuboot_conf a
 standalone sstate task
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: adrian.freihofer@siemens.com, openembedded-core@lists.openembedded.org
Date: Sun, 02 Aug 2026 22:16:32 +0100
In-Reply-To: <20260802195324.64533-2-adrian.freihofer@siemens.com>
References: <20260802195324.64533-1-adrian.freihofer@siemens.com>
	 <20260802195324.64533-2-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Aug 2026 21:16:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242587

On Sun, 2026-08-02 at 21:52 +0200, Adrian Freihofer via lists.openembedded.=
org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>=20
> There seems to be still some corner cases where the qemuboot.conf file
> is not deployed reliably.
>=20
> Previously do_write_qemuboot_conf wrote its output into IMGDEPLOYDIR,
> which is shared with do_image_complete. The conf file only reached
> DEPLOY_DIR_IMAGE when do_image_complete ran, so for example running:
>=20
> =C2=A0 bitbake <image> -c write_qemuboot_conf --force
>=20
> had no visible effect on the deployed conf.
>=20
> Introduce a dedicated QEMUBOOTCONFDEPLOYDIR and register
> do_write_qemuboot_conf as a proper SSTATE task with its own
> sstate-inputdirs/sstate-outputdirs pair pointing at DEPLOY_DIR_IMAGE.
> A matching do_write_qemuboot_conf_setscene task handles sstate restores.

Which issue is this fixing?

I think this should be running after do_image, before
do_image_complete, which is when the files in IMGDEPLOYDIR are
captured/handled and that is probably the real bug/slightly easier
fix...

Making that change would make it match the other image artefact
generation pieces.

Cheers,

Richard

