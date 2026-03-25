Return-Path: <patrick@stwcx.xyz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E4C9103A9BE
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 11:46:30 +0000 (UTC)
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20573.1774439188912837361
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 04:46:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm3 header.b=CAGh52Wc;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=biiTTNSG;
 spf=pass (domain: stwcx.xyz, ip: 202.12.124.145, mailfrom: patrick@stwcx.xyz)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 1B8991D0022A
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 07:46:28 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 25 Mar 2026 07:46:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1774439187; x=1774525587; bh=OFz/UsRyqs
	WcvJc+H910Fik6F46ZXPKJ/Po5KGKF/vc=; b=CAGh52WcQd0a6mEIBV3YoIHtXL
	xdHSrih2Dr7IFGsZCSS8VY7TP5EPTPFrRWXqI+7oaJW/PPJRuzocMd9ZbwiA2+am
	y2B5uE/ThWTE5e1K/tuz0kZnmE4fVfawxOLW7X8+nfjJ+q6pH8+UD5CTjrMRMMDq
	3Uod3QNtP9g3WLTG5Lq3SlNvNLX5EGSALfaDE+oUgMJ/ebSR9QZ99QbqhL24txvj
	XiahCqt0Uqb8bViJLB0PbgOaOgLsR+frCwWaBovhkq93b5NabEdBPZi2MZNzVjBX
	ZKWTQb3qxUjG8vkJbOHnCmAIt7ypwgUGg+g++Klkpo/L/Tz2xhp6VLJYFjyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1774439187; x=1774525587; bh=OFz/UsRyqsWcvJc+H910Fik6F46ZXPKJ/Po
	5KGKF/vc=; b=biiTTNSG3BrVjjmkrm5xMfnf84KjKMDL9Rk4a6//mGXUHrinaNU
	ofJ9dBcv+thaT5A6A61VCMyiOxMFb/lqIcPM2YI/tb59IpMN/e10szu8Z+mdkJWd
	+/zl1tBfohD55BZdW0zlCyu8XyI0M6KDepbeA1vfDuLENqpy5LpSQRq0sTMDeFVw
	AQEZWe10BTPS3Dlw2NjryZabD3Y7aAVujHHO0mNQxPHgqMfflw5aviGaDhRla2cF
	dkBNvc+RuW/SExnQc6isLs2H3h/AjDu2rygI3w0CUndd6LbXzmNWbEtGHYG6u8Kz
	kp7GY6dY/3CeL5x4sEVbgpJta0Uo1esSVZA==
X-ME-Sender: <xms:E8vDaZLYVJt18x9p2AR2RiN2rVm3T6GeMyTn5Lb3q6-Xoe5INQrndw>
    <xme:E8vDacF260ZJXWpj3DVrJ9vrCrhGvX7eHm9BXizBPpubfzOxUK1AER1ELekppvuYx
    SLzTuSPR2HXdLi8BASOBwVVxTVVhYmr9YUSKIwXaFOyPVzZ1X8g3pU>
X-ME-Received: <xmr:E8vDaXVhARNs1Hak6Mej4CMaT1h6NBaMfvA9qjWFu-ujt7_W2SmNo7M2fFU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvdegfeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuf
    fkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgr
    mhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepud
    fhffdvudeigfeuveffgeevhedvffdvfffffeehkedtgedugfehieeitefghfevnecuffho
    mhgrihhnpehgnhhurdhorhhgpdhkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdig
    hiiipdhnsggprhgtphhtthhopedupdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
    hophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggv
    ugdrohhrgh
X-ME-Proxy: <xmx:E8vDafgddwubogzgagKBbmt0Lq1nCbVv8OJ4Rm86OqNjm0LLO4OKYw>
    <xmx:E8vDaQSIaTjfo_f9pFckErBNGpwbtX-JnZhfyKYyaTcDsB3X3CY6_w>
    <xmx:E8vDaaFufXKL3DzbjJAQWVuAG5Gkda6AXlP5fTdYQyb5Apg0dutVog>
    <xmx:E8vDaQnKNxoE2x0s4TCEUem1lIx_3c-bYFsPgFCYJ4I7qIFBtKEkxA>
    <xmx:E8vDaQ5t5BajrlAGa4Cs_Ej2AYdnoIN1UM2UACQi-5OaINejtaqKF1uf>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Wed,
 25 Mar 2026 07:46:27 -0400 (EDT)
Date: Wed, 25 Mar 2026 07:46:27 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc: fix buildpaths QA with LTO
Message-ID: <acPLE7KjSfvxXthX@heinlein>
References: <20260325113951.1278864-1-patrick@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/exjHfOK8PS/GBKR"
Content-Disposition: inline
In-Reply-To: <20260325113951.1278864-1-patrick@stwcx.xyz>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 11:46:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233890


--/exjHfOK8PS/GBKR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 07:39:51AM -0400, Patrick Williams wrote:
> When LTO is enabled, due to a gcc bug[1], the linker needs the same
> flags in DEBUG_PREFIX_MAP as the compiler.  Without this the buildpaths
> QA failure can occur due to unstripped build directory strings in the
> DWARF data.
>=20
> With GCC 15.2 this can be noticed by setting many meson-built packages,
> such as systemd, with:
>=20
>     EXTRA_OEMESON:append:class-target =3D " -Db_lto=3Dtrue"
>=20
> Add the DEBUG_PREFIX_MAP to the TARGET_LDFLAGS for gcc.
>=20
> While the lto.inc enables LTO across the whole image, some packages
> either manually enable LTO on their own or downstream recipe
> maintainers have explicitly set LTO in specific packages, so it is not
> sufficient to set this in lto.inc only.
>=20
> [1]: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D109805
>=20
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> ---

A few other mailing list threads also talk about this problem.

One alternative is to re-add it to the TARGET_LDFLAGS in bitbake.conf by
reverting 1797741aad02b8bf429fac4b81e30cdda64b5448 [1], but that seems to
have problems for cgo applications which might be resolved by another
patch[2].  Adding to lto.inc[3] isn't sufficient for the reasons I
mentioned above.

[1]: https://lore.kernel.org/openembedded-core/20260122194959.13457-2-rs@ti=
=2Ecom/#t
[2]: https://lore.kernel.org/openembedded-core/20260127170344.2960247-2-rs@=
ti.com/
[3]: https://lore.kernel.org/openembedded-core/20260204052638.284617-1-chan=
gqing.li@windriver.com/
--=20
Patrick Williams

--/exjHfOK8PS/GBKR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmnDyxEbFIAAAAAABAAO
bWFudTIsMi41KzEuMTEsMiwyAAoJEKsDR8wtAMEZ5UEP/it6H+RsfZ6w1Qvjo5V+
v29WlwuJx0bGGsmZIvh1nssDieN05OT+QtXg7CgnYUWNvno4PKizF2/ZhG2nuADg
P71Yter8Vx5834HfeA53CGb1CJDO2TPhwp9UveFb7k6UzuPXUUK3pTTJaD0d3WAX
rDcO8C/4WIc/iP78AjeR3XCQl76HrXx/cOLEFz3/KvPmGnIkMA30TOIlpsXs74gO
G+ocTQJtQIuo1nxfDBaPDywF5uOeP6sgJFT/QlwdHfZPWef9LIGRNpOCE9kODmE9
isE0QRp3xYwmbu+4gM/3cB/1pBZLkgahq6ZJ8jhv/m25Bffu+xuR7aWk4P5rG3K/
vmkXiiDI1YapxOQ6cmFy9FIpJO6cFOPC5A4n2dZnj/1s6dOCFxL5md05jzT3jnLe
B0Wl8W0adrnNVOqtl3njVdRGpeemwD27a/nE8PDe7WRMKNPOTodoYk0vJJmQcYf7
9EMZQj2qwNy5q6v2TqqO8Pck33vIMifitM2P3RuOw/iEXCbwyudMTSaXl9iLdTb5
Lo7XVcuW0CHr+V4fBlWPeLdS6J4xSnbP9t+thW4eWKgxryKy8Vm1NwwrvbKf8UVu
f3DSxnud+6GVy7kQeQJ3QS0P9Ow9v3AhuAkh/CY3w24Cq/VNEy7v8zWBv1E28Jhg
izoi46fcLiJdoLM6xOjSoZta
=9cGj
-----END PGP SIGNATURE-----

--/exjHfOK8PS/GBKR--

