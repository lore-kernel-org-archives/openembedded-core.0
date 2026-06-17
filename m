Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5293DCD98EE
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 08:39:17 +0000 (UTC)
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10891.1781685555858511183
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 01:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=gihgjSjb;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=bt71kpca;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.159, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id ECCA87A0124;
	Wed, 17 Jun 2026 04:39:14 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 17 Jun 2026 04:39:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1781685554; x=1781771954; bh=6lnw1cnBKg
	mSxuZJeq8Eh3Xyni3/ourPp37OTphvvio=; b=gihgjSjbPqNy5t9AuOfvv1kAwf
	8o/DnhvYBjThCgZpW1x/pvMfiVojTXTF3BAoYxFenB9wwkP1M4phgoZX5DpCrbJs
	LYV2tlIzx4991YwmbOUzpGyCaK4rbthIZYBxOG2ItV8NTbWzxLuTmvt7WNB2vvOR
	17kwW9mXfhDhlHzgXyjr3QsKNHogRtMh0NEfiKxkeHwT28VV/nNRqMcV/hg3+Rpt
	L4xaeS5ZoKEUjNYAEaWpICvRrB980VsX0CW4ekX64nDU/8oJWyoADHYREJHuWqWu
	2ZeuXYjnOdOcx78ezwQGAxIPl0xAmx6cuI5fK4KWMXa+acN2f0YGypyCt1vg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1781685554; x=1781771954; bh=6lnw1cnBKgmSxuZJeq8Eh3Xyni3/ourPp37
	OTphvvio=; b=bt71kpcaa3VyFadVrUXlcyevRL5uQRHTZXgbbjqy3hM0YRyfYxy
	d6w362TZgBvYcDfRJMLsww0mfiLta2hS7sWNDkwCfLRMNfSxx9++2A2L+c/+Ddjp
	yTsEQBiUhhsi8eR+HRYNC8daO+Nohb1RrfVh0tzTKefHSjgejsCu57OeMuddJskt
	0W0H3NqptDK4aa1MJPSNGX///6qUliG8BOAGDTVdbymmQMZElLiBod+oUHnOhc09
	/8H7YAaTVN1sm5YG1LzDbD9jZGogbatrF7ekPrt2IYz+2mBjrYRBBFapXP0tNyU2
	BJc2MJifcuu8Wews3OqPoe8kvPZbP+nv4YQ==
X-ME-Sender: <xms:Ml0yasRyxcYLQoo1E7DjKoBnT9JVn7NxNiLyM2HwX88lA5Ze8BATNw>
    <xme:Ml0yavyUcaRknpJIZ9sPYPGbHEFzpVtcmL98eijnIJyPlPC2xLbMNP4rwjAo9i2yT
    ylAiZJ2gMI2iFipWyt4Fu9uiSyIxnz4Joaw1eI3yiFoEVZW3ZaKtqA>
X-ME-Received: <xmr:Ml0yanfNzyQuf-TyB03rfhvCePQERZYi9NH5TbiAHnD2YZXE510FmmYb-pLn_wsXJh_BH55_iYcrnDRKDzjbVBsFuSCbQM9q7Z3JGfd4I05D>
X-ME-Proxy-Cause: dmFkZTGQTb8zRjBGt53ps9QB29S3J+T3Tyi5Xq76H2gtI7NVwhQWTi7e52CsjEOxPtE0Mo
    l8JQrWTom47sRH+xUDxkJTPHzhqSgHWaMHNka+4uTGet9L1TDMeIbuhBzWdcH5S10TjF9E
    CSiRbVVznQlF+099/43Da1xJN1L6nY5fQWAV+KPQI9Zea3kjXT96di42Db4ccdcK2RICFT
    2AFngU/LUN80tVh5uWykYIDvp1iMLLbVkh3HfKgIyeRrI3aahe4XI5YRuA8Xnuc+pdYDB7
    G2CX2dOHOoLSzPO2+LgRdJrKVaUrGjVZGvbprKvqG+MFktZCRR/KjGlKCtCOWOJNU38XEV
    fbaQYn5WGXAUsgxDnTWRIb6hXDG9LVfQWjOm5AFgBdpb3X48Oc0+yKH5U8K45G6YOnQR1W
    G8GySS4HCjv/VOKx2efn/14GPqp/kfNXf03q9z+oj/GR/WeFbCETR/0WfAL8Qyv/YJLVR7
    XgqjG8Ws2W33dxHaUbf4eWxlSdOiErsQFjmQ+Ttb/Roa4PxaG3faxOICPwFKqRkadJUW6n
    GD8VNQbAcRUIABq1+HfyGRRUjy6gYtK+i6Z1YrMYA0eE0PTz/BX+wjJkUFnK2kItgxdA0w
    TgyNxfhBIgc1IUOo/h1hf6ubF4T9llKLA2AVzDyYhWaQt1LhAan+MPlxlXLA
X-ME-Proxy: <xmx:Ml0yarKuoSIfPKQvpI2cGePCytxiR3uvayCGXYThoZodraKoKHcM9w>
    <xmx:Ml0yaoHLqVN3e7p5I8igufwwGfxBF8v_Yvv9dfDwehoGlAVfT3MhMA>
    <xmx:Ml0yalp3pUID4U753XDOCfg4iaXFo8hFV_Zx5OmFEto7AIETfKBclg>
    <xmx:Ml0yahRgO_hAJMkJ01zYiX4DLuYBQdPrdyTYjhMMPltvnvoBsd4-0w>
    <xmx:Ml0yao0HU81DpQmYQaT8HIIvoQzco4lR1FTPSW2UROid99LPK7RC82Ll>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Jun 2026 04:39:13 -0400 (EDT)
Message-ID: <008b9a648f9e18975722958c76e92769cda9bd6d.camel@pbarker.dev>
Subject: Re: [OE-core][scarthgap 05/30] meta: fix generation of kernel
 CONFIG_ in SPDX3
From: Paul Barker <paul@pbarker.dev>
To: yoann.congal@smile.fr, openembedded-core@lists.openembedded.org
Date: Wed, 17 Jun 2026 09:39:07 +0100
In-Reply-To: <22e8bc2bcfe762c83c00b73a33384e63548e82c0.1781682189.git.yoann.congal@smile.fr>
References: <cover.1781682189.git.yoann.congal@smile.fr>
	 <22e8bc2bcfe762c83c00b73a33384e63548e82c0.1781682189.git.yoann.congal@smile.fr>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-rqE9Xcp1xJAr/KUsNt0m"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 08:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239024


--=-rqE9Xcp1xJAr/KUsNt0m
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-06-17 at 09:44 +0200, Yoann Congal via
lists.openembedded.org wrote:
> From: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
>=20
> With the current solution, using a separate task
> (do_create_kernel_config_spdx) there is a dependency issue. Sometimes
> the final rootfs SBOM does not contain the CONFIG_ values.
>=20
> do_create_kernel_config_spdx is executed after do_create_spdx which
> deploys the SPDX file. do_create_kernel_config_spdx calls
> oe.sbom30.find_root_obj_in_jsonld to read from the deploy directory,
> which is OK, but the do_create_kernel_config_spdx ends up writing to
> this deployed file (updating it).
>=20
> do_create_rootfs_spdx has an explicit dependency to all do_create_spdx
> tasks, but there is nothing that prevents executing
> do_create_kernel_config_spdx after do_create_rootfs_spdx.
>=20
> To fix it, instead, now read from the workdir, and write to the
> workdir, and do the processing from the do_create_spdx task:
> we append to the do_create_spdx task.
> Furthermore, update oeqa selftest to execute do_create_spdx instead
> of removed function.
>=20
> Also only execute this task if create-spdx-3.0 was inherited,
> previously this code could be executed if create-spdx-2.2 is
> inherited.
>=20
> (cherry picked from commit 8417f4a186e78a9d309541f5d0e711178bb80488)
>=20
> Fixes: 1fff29a04287 ("kernel.bbclass: Add task to export kernel configura=
tion to SPDX")
> Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootli=
n.com>
> Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  meta/classes-recipe/kernel.bbclass   | 27 +++++++++++++++------------
>  meta/lib/oeqa/selftest/cases/spdx.py |  2 +-
>  2 files changed, 16 insertions(+), 13 deletions(-)
>=20
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ker=
nel.bbclass
> index 39e198864e4..618324f75ff 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -870,14 +870,13 @@ addtask deploy after do_populate_sysroot do_package=
data
> =20
>  EXPORT_FUNCTIONS do_deploy
> =20
> -python __anonymous() {
> -    inherits =3D (d.getVar("INHERIT") or "")
> -    if "create-spdx" in inherits:
> -        bb.build.addtask('do_create_kernel_config_spdx', 'do_populate_li=
c do_deploy', 'do_create_spdx', d)
> -}
> +do_create_spdx:append() {
> +    def create_kernel_config_spdx(d):
> +        if not bb.data.inherits_class("create-spdx-3.0", d):
> +            return
> +        if d.getVar("SPDX_INCLUDE_KERNEL_CONFIG", True) !=3D "1":
> +            return
> =20
> -python do_create_kernel_config_spdx() {
> -    if d.getVar("SPDX_INCLUDE_KERNEL_CONFIG", True) =3D=3D "1":
>          import oe.spdx30
>          import oe.spdx30_tasks
>          from pathlib import Path
> @@ -909,9 +908,11 @@ python do_create_kernel_config_spdx() {
>          except Exception as e:
>              bb.error(f"Failed to parse kernel config file: {e}")
> =20
> -        build, build_objset =3D oe.sbom30.find_root_obj_in_jsonld(
> -            d, "recipes", f"recipe-{pn}", oe.spdx30.build_Build
> -        )
> +        path =3D oe.sbom30.jsonld_arch_path(d, pkg_arch, "recipes", f"re=
cipe-{pn}", deploydir=3Ddeploydir)
> +        build_objset =3D oe.sbom30.load_jsonld(d, path, required=3DTrue)
> +        build =3D build_objset.find_root(oe.spdx30.build_Build)
> +        if not build:
> +            bb.fatal("No root %s found in %s" % (oe.spdx30.build_Build._=
_name__, path))
> =20
>          kernel_build =3D build_objset.add_root(
>              oe.spdx30.build_Build(
> @@ -930,9 +931,11 @@ python do_create_kernel_config_spdx() {
>              [kernel_build]
>          )
> =20
> -        oe.sbom30.write_jsonld_doc(d, build_objset, deploydir / pkg_arch=
 / "recipes" / f"recipe-{pn}.spdx.json")
> +        oe.sbom30.write_jsonld_doc(d, build_objset, path)
> +
> +    create_kernel_config_spdx(d)
>  }
> -do_create_kernel_config_spdx[depends] =3D "virtual/kernel:do_configure"
> +do_create_spdx[depends] +=3D "virtual/kernel:do_configure"
> =20
>  # Add using Device Tree support
>  inherit kernel-devicetree
> diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftes=
t/cases/spdx.py
> index 035f3fe3363..3373988ca40 100644
> --- a/meta/lib/oeqa/selftest/cases/spdx.py
> +++ b/meta/lib/oeqa/selftest/cases/spdx.py
> @@ -298,7 +298,7 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase)=
:
>          objset =3D self.check_recipe_spdx(
>              kernel_recipe,
>              spdx_path,
> -            task=3D"do_create_kernel_config_spdx",
> +            task=3D"do_create_spdx",
>              extraconf=3D"""\
>                  INHERIT +=3D "create-spdx"
>                  SPDX_INCLUDE_KERNEL_CONFIG =3D "1"

I agree this is worth backporting as it fixes omissions in generated
SPDX data. But it removes a task (do_create_kernel_config_spdx) so we
need to be careful.

In this case I doubt anyone is calling do_create_kernel_config_spdx
directly, so we should be able to handle this by highlighting the
removal in the release notes for the next scarthgap release.

Best regards,

--=20
Paul Barker


--=-rqE9Xcp1xJAr/KUsNt0m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCajJdKxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bq41AP4s6/p7KEcwBNao/y05qbTP0ZFYlrpcb5aJ
ODeBnG5NiwD9F4EJOTzy4Qdp6XRLFo9Dc3Mf+kmtHgkLmZ2OxX/XMQw=
=uS4C
-----END PGP SIGNATURE-----

--=-rqE9Xcp1xJAr/KUsNt0m--

