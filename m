Return-Path: <luca.boccassi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 650F6C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 15:32:07 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web12.12478.1648481525974506753
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 08:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: luca.boccassi@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id y10so17355255edv.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 08:32:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=MYs9Q+/tIKPg/wIwu0mSuTg0bpl2abydXLodqzxdqgc=;
        b=Z58pV137B8QCH/ZBsYaV3S8QRLK75xNG3EYyZyf+/ODSwKfVbf/JJN8c66kM0cyhow
         0xrsLH1wZc1/xn3imp9bl01WU8toVXbQy2/WV8RNmM3CQhccCkAZhkfAILjqk5tbN3He
         QfUbVIRF+T9C84LAxbsRz7EmDEoBXOoylzZd+R4jIfQU7I+C3UI+dlQxJ2uU5xfTwVZZ
         terpc/GHKjY4kszRQBXzuADaCDtOtjcntnVFChl2lw4J4C79ZqCIvB9jZBNzGcuurOb/
         T3V7M5hjGqloh7ewywSuFQVdABtHQ4KHE2kHnw6/3vUxKOGKnjgyY/wPo4aTFSXCs+Z/
         6+Ug==
X-Gm-Message-State: AOAM533srlpaq4gs7vdG46UGn0M3+MLi7zfl6aCvg09hm6FdaEDwR3aV
	mQeIadjwArVWd9A0vOnv8Uo=
X-Google-Smtp-Source: 
 ABdhPJyyymeQB+fA+PXfpG1FOgD1ZL8D9bWLydE/s+tbDbiFovIobv90xyWf0Krpnp5yiUwAHcAnhQ==
X-Received: by 2002:aa7:c30f:0:b0:419:2af:4845 with SMTP id
 l15-20020aa7c30f000000b0041902af4845mr17066708edq.296.1648481524268;
        Mon, 28 Mar 2022 08:32:04 -0700 (PDT)
Received: from localhost ([137.220.125.106])
        by smtp.gmail.com with ESMTPSA id
 hu8-20020a170907a08800b006dfd2056ab2sm6105169ejc.97.2022.03.28.08.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 08:32:03 -0700 (PDT)
Message-ID: <0b46c32fb91e47f1e561a29d323f231bc59684c1.camel@debian.org>
Subject: Re: [OE-core] [PATCH 2/2] mount-copybind: add
 MOUNT_COPYBIND_AVOID_OVERLAYFS env var to skip OverlayFS
From: Luca Boccassi <bluca@debian.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	openembedded-core@lists.openembedded.org
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Date: Mon, 28 Mar 2022 16:32:02 +0100
In-Reply-To: <2c8e51a2-fd18-9781-7686-21d7a5376443@bootlin.com>
References: <20220325184032.1880706-1-luca.boccassi@gmail.com>
	 <20220325184032.1880706-2-luca.boccassi@gmail.com>
	 <2c8e51a2-fd18-9781-7686-21d7a5376443@bootlin.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-KltE4uYl56XTxfJB1OUi"
User-Agent: Evolution 3.38.3-1+plugin 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Mar 2022 15:32:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163712


--=-KltE4uYl56XTxfJB1OUi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2022-03-28 at 17:30 +0200, Michael Opdenacker wrote:
> Hi Luca,
>=20
> On 3/25/22 19:40, Luca Bocassi wrote:
> > From: Luca Boccassi <luca.boccassi@microsoft.com>
> >=20
> > In some cases we don't want to even attempt to set up OverlayFS, for
> > example because SELinux in enforcing mode would kill the process
> > attempting to use the mount. See:
> >=20
> > https://lore.kernel.org/all/CA+FmFJBDwt52Z-dVGfuUcnRMiMtGPhK4cCQJ=3DJ_f=
g0r3x-b6ng@mail.gmail.com/T/#mef98aa406324096d1889d3d467251f30456f403c
> >=20
> > If MOUNT_COPYBIND_AVOID_OVERLAYFS=3D1 is set, skip directly to copy and
> > bind mount.
> >=20
> > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
>=20
>=20
> Thanks for the patch!
> Now that the patch is merged, would you mind proposing a patch to add a
> description of it to the documentation? You'll probably do it better
> than I would.
>=20
> Thanks in advance
> Michael.

Sure I can do that, where should it be listed exactly?

--=20
Kind regards,
Luca Boccassi

--=-KltE4uYl56XTxfJB1OUi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCSqx93EIPGOymuRKGv37813JB4FAmJB1PIACgkQKGv37813
JB6QrBAAqpzdktMpLbM4cSyIc2vL3YTOpl6TGfI3u0TCNGSb065gOlkYh1tC6eRf
VnjV3Ox0jeQz9hTakJiFRE/O4/ZvDMy5Ekr1/Uqvqsqoac0wK1OGLuNgl3fppMMN
6pnAErGgZMdHVB6aJkfUYUytBRyiczv+zn/qxJPhgINQY+gq6GAa6uMzI5RxKMrv
3CVqo8Zr8HKxL1R/yGVo82Nzx9I2QMhUlGXOqVwR45LEreS9zAykcXfvLjMapVcC
FqR61Q/ipG+2JOxTEQK1ukKzxleCOUk3XU/ROJspApr8rSEZKbykSbx1qfr1wq6o
dKGpZGP4HYCTSFlwdoy+ZP8BJ2a7BOnHEq6PxpeeNojAIQVkOSexSInLFp1g5Bu8
5+LlypJxM3w1Wlt5TwgZsDmMASH7ulrnLNI4NtmRVxcG4T023Lcw3wd5ecfYZEhi
vynog4th0H7L2VLOY1AN874UvDNr1JFx9OFePPBDs8FGTAHjuYvhT4EzX5EyYHXh
qlpgTMYrZU6aYRNvCVHXHcgFGyZtJeKuyS9JsIpVtTISUw+qCtbCc/oZBEBSZZnV
+GGAqpGjABrstre+oTDaIDFnPoieA9pDNJMmdE1ltTzghrYDlBufjyWfGLo4icMp
sUWjdqoz5ul4hPxemT9Y8WrOdaBIavURqA1cNKqqjMuVtiFCLCU=
=uwAh
-----END PGP SIGNATURE-----

--=-KltE4uYl56XTxfJB1OUi--

