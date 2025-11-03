Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52501CCF9FE
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 14:58:22 +0000 (UTC)
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23239.1762181895154476072
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 06:58:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=jYZE43uM;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=qYkvT7eE;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.149, mailfrom: paul@pbarker.dev)
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 249EEEC023C;
	Mon,  3 Nov 2025 09:58:14 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Mon, 03 Nov 2025 09:58:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1762181894; x=1762268294; bh=KHbl/MA5u3
	mQnWaxONXgBdrfup9Bal64/WuvXu1NX6E=; b=jYZE43uMXBQ64cZUI9032C8BQk
	mxUQzVIX1effU/25szsrp+pzW91ujLrFpZMMS+Lpv0oRMdYZmOFMYzTGF2MPklD+
	xcbAZAG7CSl9+utp1vXGu9W3qMiQ+vKMmSxDVCukH6Bnq62pUX2ojIbgq3wTSCYP
	ib2aqVF40IqyY19NVx5BTfaYBhmErBoQN0IlxCax4cV36ZYn3tgO1EsyjfAGwzu7
	8xTulY2MuHF3Ci21CqOf1nxzKdBMuEweDIjg6CN677em5sz0dO9xvTLoTxBotyU6
	BBhn8BdADkAmlbZGU7jJckuVAjJ+KZ0EHYJmVby1QAeMupxtgkqb3MSF3mDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1762181894; x=1762268294; bh=KHbl/MA5u3mQnWaxONXgBdrfup9Bal64/Wu
	vXu1NX6E=; b=qYkvT7eEEM0qTuWH/Qpay0JX4rYLzCiVjw9aJ1YID8JsiWGEhn8
	sIvXkpqQAU4tMXVTt/9t2ylogYJC6xDCsb738StpA3BE508XnkK6xk8k0MnyvMpq
	euqtaGqTwdzeYldRsXCdRGnkBNZzZxKLvGstMp0rGyXceXN8zyLPof48BEkaH936
	jmUCvRQ+7C49MSWjoDKU3Frj+GWuXYwRkSR3Pt+8zdElNXYOdJ6etqowN4U+Xz2g
	5D35M6ZEM+eNuxJsVIjV6Qn9yDFjuF3hLn8c3IKCGgAkE1fzU97XKsfJCfsvx1RI
	Y+G6SZHGbvhEv/RUWycBGh0lJTtV8i/saJQ==
X-ME-Sender: <xms:BcMIaUROfFgrOwMfdH8-9_LohBr-L97fjUkC3GKNiHPswgHazpezNQ>
    <xme:BcMIaZNiwCutFBQ681aHbFgT_uuRearuImbxt5jGPC8QO0RLY6MEfxEDM3KKivGru
    3OyJwgQIy-26XSzxjUwPP8e_kCY-LH7dhhgRXcdTcHyukFktFg4xg>
X-ME-Received: <xmr:BcMIafMSfAc0jH0jq1Lg7W6ymEqavmzrHSfDQGg9GPLDugw3xQl7DVHGAamjO3dILny2qS0rpnGt7Zt3VezP0aRAaYexfg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddujeekgeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epgeffveeffefgledvteekhfevleelfeelleegtddvfeejvddugeefkedukeelhfeknecu
    ffhomhgrihhnpegrrhgthhhlihhnuhigrdhorhhgpdhgnhhurdhorhhgpdhkvghrnhgvlh
    drohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohepfedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepjhhorghohhhfsehgmhgrihhlrdgtohhmpdhrtghp
    thhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsg
    gvugguvggurdhorhhgpdhrtghpthhtohepqhhurghrvghsmhgrrdhjohhsvgesghhmrghi
    lhdrtghomh
X-ME-Proxy: <xmx:BcMIaRvnqMPD4XM19D6IWYdD-IcYZvZtD8SpwGIY6_wTASPfV9ZgjA>
    <xmx:BcMIaRUk0u_pK7r0Akw8patY0D8bAlhbEe-15aAHAcER6oQhzRRIVQ>
    <xmx:BcMIaRu80WxYcKByP_la7X2sZl3QK-wE6MBCKykqNlhU_Q2qcUoMQw>
    <xmx:BcMIaVVjBAUGq3kMp4eXqAb0zrQnzyKisxn90dgSrjXlg3QaEnuRXQ>
    <xmx:BsMIaY7RrisooMF-vNzSt1ZUK3B7jHlXPLYex3TSFPTjVTm6iN8TmVhg>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Nov 2025 09:58:13 -0500 (EST)
Message-ID: <6052589ab3fdb48fb79485fe7f7a80ed2ad21ec1.camel@pbarker.dev>
Subject: Re: [PATCH v2] readline: backport a patch to fix for caller setting
 rl_prompt to NULL
From: Paul Barker <paul@pbarker.dev>
To: =?ISO-8859-1?Q?Jo=E3o?= Henrique Ferreira de Freitas <joaohf@gmail.com>,
 	openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 03 Nov 2025 14:58:09 +0000
In-Reply-To: <20251031181228.3810813-1-joaohf@gmail.com>
References: <20251031181228.3810813-1-joaohf@gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 ep0k17xg==
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-wC07hi15w5DjZqtydKId"
User-Agent: Evolution 3.56.1-1+deb13u1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 14:58:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225662


--=-wC07hi15w5DjZqtydKId
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2025-10-31 at 15:12 -0300, Jo=C3=A3o Henrique Ferreira de Freitas
wrote:
> I've observed this issue affecting iwctl and connmanctl.
>=20
> Patching readline solves the issue.
>=20
> The original patch from [5] mixes many fixes in one commit. I've extract
> only what matters to solve the issues observed with connman and iwd. The
> final patch is the same patch sent by readline author to readline's mail =
list [6].
>=20
> References:
>=20
> 1: https://gitlab.archlinux.org/archlinux/packaging/packages/readline/-/i=
ssues/1
> 2: https://gitlab.archlinux.org/archlinux/packaging/packages/readline/-/c=
ommit/b30636dc66fc783a091af51b049dc5240f861dd0
> 3: https://lists.gnu.org/archive/html/bug-readline/2025-07/msg00007.html
> 4: https://lore.kernel.org/connman/20251018212411.181909-1-jsbronder@cold=
-front.org/
> 5: https://cgit.git.savannah.gnu.org/cgit/readline.git/commit/display.c?h=
=3Ddevel&id=3D488d7edc22894d30b6de7f2d4190bf7403f63ffd
> 6: https://lists.gnu.org/archive/html/bug-readline/2025-07/txtmA7rksnmmi.=
txt
>=20
> Fixes [YOCTO #16047]
>=20
> CC: Jose Quaresma <quaresma.jose@gmail.com>
> Signed-off-by: Jo=C3=A3o Henrique Ferreira de Freitas <joaohf@gmail.com>
> ---
>=20
> Notes:
>     changes in v2:
>     - add readline fix author name
>     - add explanation why and where the original patch come from
>=20
>  ...for-caller-setting-rl_prompt-to-NULL.patch | 42 +++++++++++++++++++
>  meta/recipes-core/readline/readline_8.3.bb    |  5 ++-
>  2 files changed, 45 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-core/readline/readline/fix-for-caller-se=
tting-rl_prompt-to-NULL.patch
>=20
> diff --git a/meta/recipes-core/readline/readline/fix-for-caller-setting-r=
l_prompt-to-NULL.patch b/meta/recipes-core/readline/readline/fix-for-caller=
-setting-rl_prompt-to-NULL.patch
> new file mode 100644
> index 0000000000..c8ac712d56
> --- /dev/null
> +++ b/meta/recipes-core/readline/readline/fix-for-caller-setting-rl_promp=
t-to-NULL.patch
> @@ -0,0 +1,42 @@
> +From a0a4c011c0c5e598c5b51cbf81d3b4501fa72e0c Mon Sep 17 00:00:00 2001
> +From: Chet Ramey <chet.ramey@case.edu>
> +Date: Thu, 30 Oct 2025 14:19:41 -0300
> +Subject: [PATCH] fix for caller setting rl_prompt to NULL
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/readli=
ne.git/commit/display.c?h=3Ddevel&id=3D488d7edc22894d30b6de7f2d4190bf7403f6=
3ffd]
> +Signed-off-by: Jo=C3=A3o Henrique Ferreira de Freitas <joaohf@gmail.com>
> +---
> +
> +Notes:
> +    The original patch came from [1, 2] and it has been integrated into
> +    readline git repository, commit (488d7edc22894d30b6de7f2d4190bf7403f=
63ffd)
> +   =20
> +    This patch has only the fix needed to solve the follow issues [3,4].
> +   =20
> +    I added the original author as this patch has been sent through read=
line mail
> +    list.
> +   =20
> +    1: https://lists.gnu.org/archive/html/bug-readline/2025-07/msg00007.=
html
> +    2: https://lists.gnu.org/archive/html/bug-readline/2025-07/txtmA7rks=
nmmi.txt
> +    3: https://lore.kernel.org/connman/20251018212411.181909-1-jsbronder=
@cold-front.org/
> +    4: https://gitlab.archlinux.org/archlinux/packaging/packages/readlin=
e/-/issues/1

We should keep these notes above the "---" divider in the patch file so
that they're not lost if devtool or another tool is used to rebase
patches.

> diff --git a/meta/recipes-core/readline/readline_8.3.bb b/meta/recipes-co=
re/readline/readline_8.3.bb
> index a2f23eb353..8bc4477946 100644
> --- a/meta/recipes-core/readline/readline_8.3.bb
> +++ b/meta/recipes-core/readline/readline_8.3.bb
> @@ -1,7 +1,8 @@
>  require readline.inc
> =20
>  SRC_URI +=3D "file://norpath.patch \
> -            file://fix-for-readline-event-hook.patch \
> -            "
> +           file://fix-for-readline-event-hook.patch \
> +           file://fix-for-caller-setting-rl_prompt-to-NULL.patch \
> +           "

Minor nitpick: Looks like there's an unnecessary whitespace change here.

Thanks,

--=20
Paul Barker

--=-wC07hi15w5DjZqtydKId
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaQjDAREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bkW4AQCk+2wZ3OGQHefZXhPkaOsF9x33cpKRDG8s
Zqfe8eMCKQEAqjn5wnivIOJTzj13jz5/xemQJ/77HjxzeIGFlS59eQM=
=7qrl
-----END PGP SIGNATURE-----

--=-wC07hi15w5DjZqtydKId--

