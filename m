Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB03DC43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 08:56:53 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.146986.1783328208480448419
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 01:56:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bibFzhZM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-474bf35cccdso639709f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 01:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783328207; x=1783933007; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B3Dv25nobYi10u6KE6K+shc4sTSaBaE6tEVMpjNoa9Y=;
        b=bibFzhZMDX/FN8wWjfngDPJ2D/+MXHGIfVzRzigTFJikFM/7M6jvZzGawczUD5ntTo
         LGFYLepRi05Ka3xtGXFpf70i9PDd/nHx3xBLQAuIR5S7BKnt6yBU3sFD7IV1kDk9d9ZI
         /KA2E/N0rMmRtjSmQNPl7sQEQ9Mct9swR1/SQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328207; x=1783933007;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B3Dv25nobYi10u6KE6K+shc4sTSaBaE6tEVMpjNoa9Y=;
        b=cxdrx2IqD8L4OxCB0s/qh0HR2sD9Q8K04pYyybaXvryJ36OJAmP0KDYuLzYBOkhc02
         gyz3dy1VkeNtBKqEWSHk7cnta3tqqrVBJcZ+CZQTRaVpy/Av+GkEZVU4XMiT7n+35wEW
         hhKiE65cx8sS+wF/3SRf6NjwOkQYgM4iPaiozfJR9G26R+d67U2A6YXlVcpJFSt6mWj6
         7FHoannGoI8FRSpQF+04EbIXYywz4KYE0pLVneOpS4qjBAs08A34jdoDIeY4CgBGbsWM
         +vypceHSq/tg05TCSvR2Mxvw4OLDrpmm+jZEjaQ7wgq7dU+t4d0hyn+BbXRrztqEDjlI
         kbTA==
X-Forwarded-Encrypted: i=1; AHgh+RrMq3kIb918+jTcHAi/tqMOO0DHad+kSrxGDHSj1aArI9KQom5w3A4A0XGhkAt7OWMlyUjxfxqKxCrI5PUDje0VJg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzL+G8rpZJbzmxe3cILtQZad1n7puCWtlNOVznorwLHtepk1HEV
	fs+mhEIItjHwjwC/RkJ2mZNkuBq1r9i1UIn0O/9mgl6mW9aST8WMSRipQ0Tv8KtEhec=
X-Gm-Gg: AfdE7cm+pI0DXcyeVtFxmXuiS0Khfds5XuRLAquiTDqCzzeVtapOdG2x6L03LKe/B3w
	JD6FfZ2kZplTtOfrK5m4iz0K+GhA+SCtu660ESG/Scv7GwpepsImPm23O4u0ZVYbFUa92BTBkmz
	PxQUhJTnHDxpJmo4iM73WidYXjzaSSBj6qTGFN62SgLlBps+0tj52qeJKMzGhB8I3W9SfuJM3cX
	kCNRK61kVmRHlVA1Ha420vLC/zypBuZ3MugZoBb7eNaRLw4vJ4useju4i8uiN/PMWsVANgwvc9L
	EAWmn0DMmYRtgOAsd5zSXNwIL6bITPI6FCOaX50TNgJMK5GQZ+IhuNt1tbM5Df0NhppeOmphxZR
	TyO5gnbybGzqhYq+0kw1vZHEWdsBDAUik9CkkPClsIjh8O7C3cXj1BLDcM89BHMk+0mhFHzgJBY
	1NE8X99Z4KAnrJLQcAEdkY5ajDrBrWQKopHioPxrTBEkNlhY7aRZBKZ6BUmT9TmjAi1/l5yAooO
	+4e7Q==
X-Received: by 2002:adf:f98d:0:b0:46d:d6e0:9cc3 with SMTP id ffacd0b85a97d-47aae0db42emr8160364f8f.45.1783328206731;
        Mon, 06 Jul 2026 01:56:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3cdb:498e:44d8:3112? ([2001:8b0:aba:5f3c:3cdb:498e:44d8:3112])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d8cdsm24946236f8f.1.2026.07.06.01.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:56:45 -0700 (PDT)
Message-ID: <ebb0c3d6facbb9d88be4451aa981363d65c19d67.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] json-c: upgrade 0.18 -> 0.19
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Moritz.Haase@bmw.de, openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com, Ross Burton
	 <ross.burton@arm.com>
Date: Mon, 06 Jul 2026 09:56:44 +0100
In-Reply-To: <20260703105349.1664278-1-Moritz.Haase@bmw.de>
References: <20260703105349.1664278-1-Moritz.Haase@bmw.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 08:56:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240224

On Fri, 2026-07-03 at 12:53 +0200, Moritz Haase via lists.openembedded.org =
wrote:
> Release notes are available at [0].
>=20
> Newly added tests (see [1]) require the 'json_parse' app at (test) runtim=
e.
> Thus, apps are now being built and the 'json_parse' app is deployed in th=
e
> 'ptest' package. We do not package the apps separately as upstream doesn'=
t
> consider them to be ready for that (see [2]). This approach is based on t=
he
> discussion in [3].
>=20
> [0]: https://github.com/json-c/json-c/blob/json-c-0.19/ChangeLog
> [1]: https://github.com/json-c/json-c/blob/d9d8cab82291637671f6c90cf06e57=
8750a08718/tests/test_json_parse_cli.test#L18
> [2]: https://github.com/json-c/json-c/blob/d9d8cab82291637671f6c90cf06e57=
8750a08718/apps/CMakeLists.txt#L122-L124
> [3]: https://lists.openembedded.org/g/openembedded-core/topic/120026557#
>=20
> Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
> CC: alex.kanavin@gmail.com
> CC: mathieu.dubois-briand@bootlin.com
> ---
> changes in v3:
> - Deploy required app differently to hopefully fix failures seen
> =C2=A0 on Autobuilder (see [4]).
>=20
> changes in v2:
> - Build and deploy apps required to fix ptest failure, as discussed in [3=
].
>=20
> [4]: https://lists.openembedded.org/g/openembedded-core/topic/120061116#m=
sg240021
>=20
> ---
> =C2=A0.../json-c/{json-c_0.18.bb =3D> json-c_0.19.bb}=C2=A0=C2=A0=C2=A0 |=
 16 ++++++++++------
> =C2=A01 file changed, 10 insertions(+), 6 deletions(-)
> =C2=A0rename meta/recipes-devtools/json-c/{json-c_0.18.bb =3D> json-c_0.1=
9.bb} (72%)
>=20
> diff --git a/meta/recipes-devtools/json-c/json-c_0.18.bb b/meta/recipes-d=
evtools/json-c/json-c_0.19.bb
> similarity index 72%
> rename from meta/recipes-devtools/json-c/json-c_0.18.bb
> rename to meta/recipes-devtools/json-c/json-c_0.19.bb
> index c112aacf4bceb0c41dbe2e1643d2d7e0944bf250..6f357b45b97c602cb19523089=
fb63ada2a1384f5 100644
> --- a/meta/recipes-devtools/json-c/json-c_0.18.bb
> +++ b/meta/recipes-devtools/json-c/json-c_0.19.bb
> @@ -9,23 +9,23 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dde54b60fbbc3=
5123ba193fea8ee216f2"
> =C2=A0SRC_URI =3D "https://s3.amazonaws.com/json-c_releases/releases/${BP=
}.tar.gz=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file:/=
/run-ptest=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> -SRC_URI[sha256sum] =3D "876ab046479166b869afc6896d288183bbc0e5843f141200=
c677b3e8dfb11724"
> +SRC_URI[sha256sum] =3D "37ad0249902e301bd9052bf712e511fcc6acff4ecaad4b59=
00aad9ce564e26de"
> =C2=A0
> =C2=A0# NVD uses full tag name including date
> -CVE_VERSION =3D "0.18-20240915"
> +CVE_VERSION =3D "0.19-20260627"
> =C2=A0
> =C2=A0UPSTREAM_CHECK_URI =3D "https://github.com/${BPN}/${BPN}/tags"
> =C2=A0UPSTREAM_CHECK_REGEX =3D "json-c-(?P<pver>\d+(\.\d+)+)-\d+"
> =C2=A0
> =C2=A0RPROVIDES:${PN} =3D "libjson"
> =C2=A0
> -# Apps aren't needed/packaged and their CMakeLists.txt is incompatible w=
ith CMake 4+.
> -EXTRA_OECMAKE =3D "-DDISABLE_WERROR=3DON \
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 -DBUILD_APPS=3DOFF \
> -"
> +EXTRA_OECMAKE =3D "-DDISABLE_WERROR=3DON"
> =C2=A0
> =C2=A0inherit cmake ptest
> =C2=A0
> +# xxd is required by the 'json_parse_cli' test.
> +RDEPENDS:${PN}-ptest +=3D "xxd"
> +

This patch turns out to be the one breaking oe-selftest:

e.g.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4276
https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4216

The reason is that prior to this change, those tests don't build glib-
2.0 but after them, they do due to the new xxd -> vim -> desktop-file-
utils -> glib-2.0 dependency chain.

Not quite sure what we'll do about that yet, we may need to add more
locales to the selftest I guess but the extra dependencies aren't
ideal.

Cheers,

Richard




