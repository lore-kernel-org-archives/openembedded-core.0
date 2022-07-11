Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9FA5C43334
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 18:42:27 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.180.1657564943045647881
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 11:42:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=WAPs0HIz;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1657564943;
  x=1689100943;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=vp+kDjNNsxw0QHOJzDMb3pEP3ImEzN8NfVCnz4iCm6Y=;
  b=WAPs0HIz/nAhBvuVN31ReXLCY95aaZUgO2Ro8Z+EZomdUiEvuiRvgbP0
   iqNdAw5M1edH+MyxTvWmPEBAprMNuv1w08bSngQhXgodKEgKOoE3xXpIA
   pTpciAoZCrRm25xnd6ffopjYWZ7piDJhcNehqxHThgDhDWpyLZXwR7HTA
   5M7QAYN4OngpGYofvH2eQO157IKdjAtdbwpm8JgpPsPR00KvP0GyqdrDo
   xBR5IJ4fWBI4vrN2gWKv3suCstIN0HfYaUiSi4ClNLjHqPu1sMZB+z6s+
   zgwQMw/f2oL5iX47Vl7B7w253fwc+beDGWAUdYzmopua6m4qQYRsndriR
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] qemu: Avoid accidental librdmacm linkage
Thread-Topic: [OE-core] [PATCH] qemu: Avoid accidental librdmacm linkage
Thread-Index: AQHYlSEkLcaw1dHagUaBMikI5H4Dz615gWyA
Date: Mon, 11 Jul 2022 18:42:21 +0000
Message-ID: <81f50f6f0da7441998ed05862b9b0e7e@axis.com>
References: <20220711122406.79439-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220711122406.79439-1-richard.purdie@linuxfoundation.org>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Jul 2022 18:42:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167878

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Richard Purdie
> Sent: den 11 juli 2022 14:24
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] qemu: Avoid accidental librdmacm linkage
>=20
> Avoid accidentally linking to the rdma library from the host by
> adding a PACKAGECONFIG for the option. This was found on new
> Fedora 36 autobuilder workers.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/qemu/qemu.inc | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-
> devtools/qemu/qemu.inc
> index ef4e949805b..e9095fd750f 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -186,6 +186,7 @@ PACKAGECONFIG[pulsedio] =3D "--enable-pa,--disable-
> pa,pulseaudio"
>  PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-selinux"
>  PACKAGECONFIG[bpf] =3D "--enable-bpf,--disable-bpf,libbpf"
>  PACKAGECONFIG[capstone] =3D "--enable-capstone,--disable-capstone"
> +PACKAGECONFIG[rdma] =3D "--enable-dma,--disable-rdma"

Shouldn't that be "--enable-rdma"?

>=20
>  INSANE_SKIP:${PN} =3D "arch"
>=20
> --
> 2.34.1

//Peter


