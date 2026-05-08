Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F240CD3445
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 14:34:36 +0000 (UTC)
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15149.1778250866925107148
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 07:34:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=Z/SDXd1Y;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=K08caYjt;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.153, mailfrom: paul@pbarker.dev)
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 0F81B7A0144;
	Fri,  8 May 2026 10:34:25 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Fri, 08 May 2026 10:34:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1778250865; x=1778337265; bh=XacsO3+85M
	VzZU7YuqAfdLHgtHXNQQMv1Js7xCRPsQA=; b=Z/SDXd1YYah6ldwHtciC9dTbP2
	p6UUbrT5COoDp9A+SpGUp7FdG1IXKTE0wEYMarIYP0kg0wX4eWrMpZALPvjBQu14
	76iDnBeTGUhGl2pzKMjaKpuaiK45ALmBXCBr5Ef3DOKP7/w+kIgRlH/5Ke8Rh/Ez
	addw7ZqW69K6HwxquFD1gXEdd5FyzA/sOS6bCl/5mieuLhw5hX+Tlonp12F95eig
	+QusfYItyhC7nbLU+kaaPPv/0k+FfUlUZBt4uDlm4rZx9ZQH1HZo+JTk0fM98rRp
	U5CKCKhxWTGR7o/5B2YzwTsJsPkNQqYHDvfLunWrt05qz4UZtj6JihVcQvog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1778250865; x=1778337265; bh=XacsO3+85MVzZU7YuqAfdLHgtHXNQQMv1Js
	7xCRPsQA=; b=K08caYjtvE7PsghhA1L0vE1jJLfUthdlavlwGCmdxL4B13ZpMLi
	i5oLx/h89olvie0uDq1vCdnSm76GX1q3cZ0YBRnQag/1GcQbPL3dJFI8sUqoEZA4
	NfcvrFfW5ME6RIbCunPgjeJ9KzkxJLJreCcXuFY3xH+cQpesyWnhn3oSdxhg5zPf
	qir9W6GW2tYMOiEJURER6wUBSrSjUzXnOgcnwIhi/6CzGvcMd5SHw2fjHkqwUVq2
	7LHsB8xPJJadNOXDw1jfr319Pves7khbsrnC4H+m+6oHBW38NSu9y60kzUapOpZA
	b/lRn0eyxO8p8KxQ5eWxaTIvOMfJre7hizQ==
X-ME-Sender: <xms:cfT9aSSEHnOsk99Qr0ASjt1ziX_u4m6ObAgBBVKzGs3fEDBUyjz7FA>
    <xme:cfT9afOSuCmnjqRTbWYgJkbpi5O60S5iMU0J0szRhGshFcQOUl5B--D7NWvbgbMjr
    bWJEyoz1HW7N9M8dMefrBaWXabae6R91CJJXGZOeEUV4eMJ7SZNLHE>
X-ME-Received: <xmr:cfT9adPrHv609PmgR4XLUdiKcOzGpvMG-pO2hOrU-GBOuAJ8VUDtSkwGFauhRSqWzzWPNJR-0qWsh5yT-8rVGumeP9aRwymgQONtaK-J6cOZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdduuddtiedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrh
    hlucfvnfffucdlqdeimdenucfjughrpefkuffhvfevffgjfhgtfgggsehgtderredtreej
    necuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsehpsggrrhhkvghrrdguvg
    hvqeenucggtffrrghtthgvrhhnpeevtdffgfehieevtdejleekhfehheeigeejkeffjefg
    hffhgeekledtvedugedtleenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorh
    hgpdihohgtthhophhrohhjvggtthdrohhrghdpuddurdgssgenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdrug
    gvvhdpnhgspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    ohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvg
    gurdhorhhgpdhrtghpthhtoheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhho
    uhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprhhoshhsrdgsuhhrthhonhesrghrmh
    drtghomh
X-ME-Proxy: <xmx:cfT9aXt-WETBgGL4BEqDeaBLjcLruT_qOFA6V2k0oIdZMxcmbGwufg>
    <xmx:cfT9afXXFUkaWckz3YREPeFJ9r4cZICxvncFLNSiZ5VDUjJhBzJpWg>
    <xmx:cfT9aXuSwFS7O6lfRfl1daEVitdVvW3YvI2YbvQvmp2TtLDdyZPlRw>
    <xmx:cfT9aTXqzzo1R_d-cV9e1d2ywZkR78Ujroyw8tMfPp6c-473I4fT_g>
    <xmx:cfT9aR9Eyp8tgSWLbFjz6LUIwmWt8wGc5ARJFJ0j4sYVwj6Rg-JAwv9r>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 May 2026 10:34:24 -0400 (EDT)
Message-ID: <19e8ab84b95af90adaefb5b9e6aaee274347756c.camel@pbarker.dev>
Subject: Re: [OE-core] [AUH] xwayland: upgrading to 24.1.11 SUCCEEDED
From: Paul Barker <paul@pbarker.dev>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton
	 <ross.burton@arm.com>
Date: Fri, 08 May 2026 15:34:21 +0100
In-Reply-To: <0101019de3ee84c8-2ef478ee-0885-45ea-8f71-7161d16c9d8e-000000@us-west-2.amazonses.com>
References: 
	<0101019de3ee84c8-2ef478ee-0885-45ea-8f71-7161d16c9d8e-000000@us-west-2.amazonses.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=mQINBGC756sBEADXL6cawsZRrDvICz9Y1SG0/lW1me4xpq36obh7a0IGAzp3ywNRb/4MO
 DTqP4+DD0cIFuDY41/N17g0sNlp8z+/k/IIDmNPtYQOTVmAkrkdDU4BP8dD3Cp1PUw6nrbInfujAJ
 NrVM0IVDkwKTbL2Nu1P+xns4MIpF9Kj4XN5celYJ9vEJ2n0Bo0nO5T5vg46dihIaDl+24iNIHSsHq
 YyEdMBfY8kY2RulpaAyFOuaaHdIeDkejVvO5xLSiYLjB5qrRhgH134lJXsuLOsFQ64ybGECuOasnb
 auevsPBAaroQW0pqVb9FneGrWHxMCLlQHJRqQJRdVa6bsUdp6NWra8/0msPawSrFwGQdfJBTA3aXJ
 C2CG1JxEgj6QQjEQA49DSjgzdhInbiIK8Vbp/zedM4aVue7qJnwPMTFQM9lYx63b7wLN4Tu8B9YZ0
 UFdSwMCJuqmYGsYRUYdwM3ArjS0VO6WpU+HBKvzLK5GQfUTSM8KaZ5eA2Uo2ain8SSZb+WptUYKpx
 F9jbtCPbjpZKzGuX4iHFl9eT75TM9iXJNGAjB5xigkADLwVfPoJ5E53S+KdNVuOWHugyLMPNAQHOw
 pw5Rey+0zxyzPd4wphutc93UIU5g/029ngAc7DuKCq12jl7fhkjqFlFtYPIc1k7nd+RSezmH/qRes
 bMErHSX1MBSZQARAQABtB5QYXVsIEJhcmtlciA8cGF1bEBwYmFya2VyLmRldj6JAlcEEwEIAEECGw
 EFCwkIBwIGFQoJCAsCBBYCAwECHgECF4ACGQEWIQSYsqrBAKw/grtdVGd0l1yBt+ZrrAUCaWoNAgU
 JCxiQFgAKCRB0l1yBt+ZrrLhdD/sH+qTaxCDUg47eW329yJWCDZmO+iuYzNSyHMs1x0DHKNIQQ8zN
 pA2S/de4jElQuPHjw/IS8B3VmM62Wuq5vHuxNlFv9IMwrwqi6zhCDui8+nCN/AQGGXousJI/SeZjm
 Y5gS9cqh4vNY+huqEEfdTFXIfTBRkmnvYozSO2uDB3EMuiWgBlw2uLrtmkvPLn/m/GvEouLNox6wv
 tcJcIbL59a0+3jv/m7pnWoZXOkWmKQnfFWikqjuKCISNU0gzBSL4UOj8gtQ2z+vu7ffi29b6SV5IL
 m1yzdbkigEn4HL44lz3N+oHZ3wWsRqqeyGSX5fCfx3tGWg6scZQrpsjT5yq+LiffiXVNpjeJ9KzQw
 0cbAZ/9uhk1sWBroP+/gMhsWjlbFYXVlRvkNKGPI22eZtOEz4jF6OrOONyOoY3i26niJUyIgdBpca
 H0hKUSVQ8VnG7qVTNrQk9BbeoSszqRwViN7lfyVtK9b1TCFuGewOETGn0TPvSzruYCtD3CLm7mjuX
 AMBpIGoRUiCFVmF1hlOgqDyH4F6zRTHhKLpfmNzfQcg+Uo147Q2IHpoh0mJsL4FEZEI8hFyecX1Pq
 7HqnvxGD2OhCof1Z6LDxptX0wbgocnYFNxN5S1owcXZUQOFnzYLlLugrcEjlGCm4Gn7k4SiFERSBj
 UFsQgIhw/7lVVn4o4rQjUGF1bCBCYXJrZXIgPHBhdWxAcGF1bGJhcmtlci5tZS51az6JAlQEEwEIA
 D4CGwEFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AWIQSYsqrBAKw/grtdVGd0l1yBt+ZrrAUCaWoNAw
 UJCxiQFgAKCRB0l1yBt+ZrrHy+EADNMt+ewz8H7BUKpEMMhpaA1VxyXO5IqlKXS0gElMgHYXl7L7C
 0/qLfRH96vwVD33zM+f0Vl9aWWkom/k8s42tLyPvX7D5zTrj3r5muJ+d9dXWGwBFXxXlE9YjSP26K
 bYfRusmRHbbEPlLPSnrr9KYS2FGVD6ViRNhhVguflgPv2i18+fNBE3YyByfNCiQgO/SgaSdh172Ql
 tuYE1Chk6FD45tCUv3dI9lO2PlVwrciiVYvIv/jiTDEwZOISOClTE/Ha18pxDJfLhS8QQnLWuBNX6
 HUkLi78fVmVYbcWIkTuSHjfNoGTMaFijMg9Wl6poFrY++Pl0S40681zEIrwZhW5pKoqXoaElt29Yf
 OwVo6BIsSOLEqKiWsdP7PJTaJYU1ovnshBcOmuXMgc13AjQ4AhEGqI1TaEJ/E1jEDDyTQFeWgrfew
 YaWdqpgiDmRMTj/tIGVj9iy7qZQICUUtlfm0QK6w6M7qq0GdO2o+S3uVF6y2AxQo8l9LSHiW9O35I
 juR37zeqv72puYyOteVYJsJaw999HUmhXc/X/J9FQFw8twxPKDLLu+w8MqDo9bhllzR93Zy/OShuG
 yGybcX3DKO2R+AQ90tXLbxKmHLtrnG/zyDPhLv/LGD480v5hEoT+IS0u9wPD2vP5q36a5DtzqXA/7
 t9PCamLoCvZLleg7GY7QbUGF1bCBCYXJrZXIgPHBhdWxAcGJya3IudWs+iQJeBDABCgBIFiEEmLKq
 wQCsP4K7XVRndJdcgbfma6wFAmlqDRwqHSBwYnJrci51ayBkb21haW4gd2lsbCBiZSBhbGxvd2VkI
 HRvIGxhcHNlAAoJEHSXXIG35muspk0P/1G08N6zGSdw2p8+8f/1HhaYEb9KdQHT1JmQfZUrIHIpD2
 ELNb91Z6Pz197d/igGpox1dzYOwE0WolWo44ZHX2yw+p9V+HJAUKRe0SPc1iNLkTzaAZ7oYJ1DnFh
 aaqZi4VtKKabKeorJjcDvl2apMwT0agRuDklU97n++ZUuXIEo1Z9uRqEvXz0iTSY7wPxwfoVOQsgf
 dN1cBLd9OpoOtJRdDJzQUYqjNoQi+5M6KRfBxPLZkmYb4uCGlp1H4AV50eC61j84LBg1ItvU2u+Fx
 X2JB7lHTswubprD2ZsSwp1VziU6pUj3vtslMWKpBGslpLtnaO561dihGyElayMd4VFg7VR/TsglJv
 A10EDs2DMhoYPfRQWvwlr5+jPP6s9H8KSTCGFvQt438rP/gk0lcEZUJK0iE2/yq5gQfaCNI5FLN7C
 q8LVr00oS4doXfmFFxMq6z1rs5SXZorWssjG7v5DILnPxLqYloQK/ebM5Ixbzm0Lq/8vWL7sw7yOH
 JVYCHCApGzKNii6rYyHdi0K8UwvpD++GCWLyvbgP/H3l5FqL63gAN0Rw1CO5r22+SmG7aOmekJH3N
 ChZPI3NMLnKZPJC8ZQZ4S8yb5oA3rqTA2DMODvsrEVlaB2cQ6IWHSa/mvBwA8Ias3771cp4fZS7W7
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-jFt5rSUBYzfdsvRVoSFW"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 14:34:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236715


--=-jFt5rSUBYzfdsvRVoSFW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-05-01 at 14:25 +0000, Auto Upgrade Helper via
lists.openembedded.org wrote:
> Hello,
>=20
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe(s) *xwayland* to *24.1.1=
1* has Succeeded.
>=20
> Next steps:
>     - apply the patch: git am 0001-xwayland-upgrade-24.1.9-24.1.11.patch
>     - check the changes to upstream patches and summarize them in the com=
mit message,
>     - compile an image that contains the package
>     - perform some basic sanity tests
>     - amend the patch and sign it off: git commit -s --reset-author --ame=
nd
>     - send it to the appropriate mailing list
>=20
> Alternatively, if you believe the recipe should not be upgraded at this t=
ime,
> you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> automatic upgrades would no longer be attempted.
>=20
> Please review the attached files for further information and build/update=
 failures.
> Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_=
bug.cgi?product=3DAutomated%20Update%20Handler
>=20
> Regards,
> The Upgrade Helper
>=20
> -- >8 --
> From 0e80e3b1bdbadff59e81ff8282a89fd2edc3a2b0 Mon Sep 17 00:00:00 2001
> From: Upgrade Helper <auh@yoctoproject.org>
> Date: Fri, 1 May 2026 12:46:21 +0000
> Subject: [PATCH] xwayland: upgrade 24.1.9 -> 24.1.11
>=20
> ---
>  ...xwayland_24.1.9.bb =3D> xwayland_24.1.11.bb} | 38 ++++++++++++++++++-
>  1 file changed, 36 insertions(+), 2 deletions(-)
>  rename meta/recipes-graphics/xwayland/{xwayland_24.1.9.bb =3D> xwayland_=
24.1.11.bb} (62%)
>=20
> diff --git a/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb b/meta/rec=
ipes-graphics/xwayland/xwayland_24.1.11.bb
> similarity index 62%
> rename from meta/recipes-graphics/xwayland/xwayland_24.1.9.bb
> rename to meta/recipes-graphics/xwayland/xwayland_24.1.11.bb
> index c4e2d7cfdb..a5cc7f41b6 100644
> --- a/meta/recipes-graphics/xwayland/xwayland_24.1.9.bb
> +++ b/meta/recipes-graphics/xwayland/xwayland_24.1.11.bb
> @@ -1,3 +1,37 @@
> +# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgra=
de'.
> +# The following is the difference between the old and the new license te=
xt.
> +# Please update the LICENSE value if needed, and summarize the changes i=
n
> +# the commit message via 'License-Update:' tag.
> +# (example: 'License-Update: copyright years updated.')
> +#
> +# The changes:
> +#
> +# --- COPYING
> +# +++ COPYING
> +# @@ -314,6 +314,11 @@
> +#  OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN TH=
E
> +#  SOFTWARE.
> +# =20
> +# +Except as contained in this notice, the name of Silicon Graphics, Inc=
.
> +# +shall not be used in advertising or otherwise to promote the sale, us=
e or
> +# +other dealings in this Software without prior written authorization f=
rom
> +# +Silicon Graphics, Inc.
> +# +
> +# =20
> +#  Copyright (c) 1994, 1995  Hewlett-Packard Company
> +# =20
> +# @@ -1778,6 +1783,8 @@
> +#  USE OR OTHER DEALINGS IN THE SOFTWARE.
> +# =20
> +# =20
> +# +Author: Eamon Walsh <ewalsh@tycho.nsa.gov>
> +# +
> +#  Permission to use, copy, modify, distribute, and sell this software a=
nd its
> +#  documentation for any purpose is hereby granted without fee, provided=
 that
> +#  this permission notice appear in supporting documentation.  This perm=
ission
> +#=20
> +#

We discussed this update on the patch review call, we were concerned
about the LICENSE expression in the recipe not accurately covering
everything documented in the COPYING file in the source tree. So, I
grabbed xwayland v24.1.11 and ran scancode on the COPYING file alone:

  $ scancode --license --json results.json COPYING
  $ jq '.files[0].detected_license_expression_spdx' results.json

This gave the wonderful expression:

  "MIT AND ((X11 AND HPND-sell-variant AND HPND AND
  LicenseRef-scancode-other-permissive) AND BSD-3-Clause) AND ((ICU AND
  LicenseRef-scancode-other-permissive) AND NCSA) AND
  (LicenseRef-scancode-mit-old-style AND
  LicenseRef-scancode-other-permissive AND
  LicenseRef-scancode-warranty-disclaimer AND (ICU AND
  LicenseRef-scancode-other-permissive)) AND (MIT-open-group AND X11)
  AND (LicenseRef-scancode-mit-old-style AND
  LicenseRef-scancode-other-permissive AND
  LicenseRef-scancode-warranty-disclaimer) AND HPND AND
  LicenseRef-scancode-other-permissive AND DEC-3-Clause AND NCSA AND
  SGI-B-2.0 AND LicenseRef-scancode-xfree86-1.0 AND
  (LicenseRef-scancode-other-permissive AND (ICU AND
  LicenseRef-scancode-other-permissive) AND
  LicenseRef-scancode-warranty-disclaimer) AND (HPND-sell-variant AND
  LicenseRef-scancode-mit-old-style AND
  LicenseRef-scancode-other-permissive AND
  LicenseRef-scancode-warranty-disclaimer) AND (ICU AND
  LicenseRef-scancode-other-permissive) AND (MIT AND NCSA) AND
  (LicenseRef-scancode-other-permissive AND ICU AND
  LicenseRef-scancode-warranty-disclaimer) AND Adobe-Display-PostScript
  AND HPND-UC AND LicenseRef-scancode-mit-old-style AND
  LicenseRef-scancode-warranty-disclaimer AND HPND-sell-variant AND
  (LicenseRef-scancode-mit-old-style AND
  LicenseRef-scancode-other-permissive) AND
  (LicenseRef-scancode-mit-old-style AND (ICU AND
  LicenseRef-scancode-other-permissive) AND
  LicenseRef-scancode-warranty-disclaimer) AND
  (LicenseRef-scancode-mit-old-style AND
  LicenseRef-scancode-other-permissive AND (ICU AND
  LicenseRef-scancode-other-permissive) AND
  LicenseRef-scancode-warranty-disclaimer) AND
  (LicenseRef-scancode-mit-old-style AND
  LicenseRef-scancode-other-permissive AND (ICU AND
  LicenseRef-scancode-other-permissive)) AND ISC AND ICU AND X11 AND
  BSD-3-Clause AND (LicenseRef-scancode-mit-old-style AND HPND) AND
  HPND-sell-MIT-disclaimer-xserver AND (HPND-MIT-disclaimer AND
  HPND-sell-variant-MIT-disclaimer AND HPND-sell-variant)"

Resolving this to something we can use is beyond me... Do we have any
license wrangling experts who would like to assist?

Best regards,

--=20
Paul Barker


--=-jFt5rSUBYzfdsvRVoSFW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaf30bREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bsxIAP9evdGZsTDVa6RgMkWhDgTpdLbCD2dzNYCw
xKq71+PdIAEAvMeI6MQjw2WsFN6hbuhRCxl4t9md6CXFs33gib/INwo=
=LBLf
-----END PGP SIGNATURE-----

--=-jFt5rSUBYzfdsvRVoSFW--

