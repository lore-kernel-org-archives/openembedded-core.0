Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C504E95392
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 12:08:47 +0000 (UTC)
Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18992.1770206917169241039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 04:08:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=MCw+pCgY;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=kAQ+wkIk;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.158, mailfrom: paul@pbarker.dev)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 84F891400153;
	Wed,  4 Feb 2026 07:08:36 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 04 Feb 2026 07:08:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1770206916; x=1770293316; bh=8R9F39LQb0
	9OzBpnWXXZCAh2q3KdLbyVhlLxCjIX/xM=; b=MCw+pCgY+sy266oejn54M3ywvS
	KRaf3LaziJpDqv8v0mhciv65DskJ3PAC7TLpBDIvDfKXdkcDn0f3G1uR7MRFN5Fg
	OkTyKi92QZwKlane9klQFm6qocIxuW1ygtS8mNAfeJOUKuYz1NuDUcUJG+yn2cQj
	sH3MnALXTAhRt02/tjShixGMT2psshkUqimy/cT8pzpWr6GFyjwmEduPGD73SY+Z
	KB/DXmMr6S2f/0+VS10pedLL7/CGU9GDrSH4LtPJVvaA0I1LueCoHVwxiUh6yXM3
	Zr5XENVTNq1srdj6m8FD77PW5bPVqnT+ZtJ07PdTnnLfsfUETslhn0BNQmYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1770206916; x=1770293316; bh=8R9F39LQb09OzBpnWXXZCAh2q3KdLbyVhlL
	xCjIX/xM=; b=kAQ+wkIk9jgvlLq86rgt2jmdtj0uAGmcUrgFEoLjCXQ9ziYjqA/
	I3PmWBRZoaDDf0Iuib0rbefWZVzpWDjKd4gUuf1bDpIMn/h8QHnyZGpoJgG525rH
	V6F1pLIoUHzIqUSCiJMxB1ntnF8WdFqjVbF10M/Q6ULhV7yaDm+Lc8IxCK9gWB9n
	Gl44AzeDKykkH1rNOrtWaeLTaIgIrsnE0X++3MqoMjz/AYv8dJxr4tjQR+dg1Gmk
	mw6wPu6CWmZx4ucN9qwiSDNBZGfGOg6yPYdkOQelx7EHZcoPwFdQ5GOoDEvYv4jI
	BECtr521BqhjLX7dkhccBlqHWD7BJwnUScQ==
X-ME-Sender: <xms:xDaDaQsRu0plYKzv5EReM-u9HixBMXTE4p2FFgFWAJXw2JZhszccoA>
    <xme:xDaDaQAEzlXKxAH_cHVaILMcy7D7GOXjhmxPttut4yGpBkuFT4cS0Mu1CdLLc9D-I
    mFUo5gKXyIHLuc2h6aTKtz1RYEqaB8pjmcU-ZMrZOl2zKriOwJTBqU>
X-ME-Received: <xmr:xDaDafaIbdc2Zsis_O1R3exJNVD97EAYLBoFJXOqIAbqRd53WlyatkwYOJo66v9QcA9CP5fosh00LEKs8uSeUAt9Kr-rAueXdeUkYveEwy15>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddukedvgedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfevffgjfhgtfgggsehgtderre
    dtreejnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsehpsggrrhhkvghr
    rdguvghvqeenucggtffrrghtthgvrhhnpefhkefhuefgleefleduleelhfektedvffeitd
    dtueeukefhieduiedvfeeuhedutdenucffohhmrghinhepohhpvghnvghmsggvugguvggu
    rdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopeelpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehhrghrihhshhdrshgrughinhgvnhhiseifihhnug
    hrihhvvghrrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvges
    lhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtoheprhgrnhguhi
    drmhgrtghlvghougesfihinhgurhhivhgvrhdrtghomhdprhgtphhtthhopehsuhhnuggv
    vghprdhkohhkkhhonhgurgesfihinhgurhhivhgvrhdrtghomhdprhgtphhtthhopegrlh
    hishhtrghirhdrfhhrrghntghishesfigutgdrtghomhdprhgtphhtthhopegsrhhutggv
    rdgrshhhfhhivghlugesghhmrghilhdrtghomhdprhgtphhtthhopeihohgrnhhnrdgtoh
    hnghgrlhesshhmihhlvgdrfhhrpdhrtghpthhtohepvghlmhgvhhguihdrhihouhhnvghs
    sehsmhhilhgvrdhfrhdprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinh
    hugihfohhunhgurghtihhonhdrohhrgh
X-ME-Proxy: <xmx:xDaDaTUKBce2R76ZtuB7Bd3BlIzHKfQNhs8o2vRDxs5Jjsjip4DsVw>
    <xmx:xDaDaWMmrSQ1G_tjQvC9hKn0eaYr90wO2iEN_WluujgbupG-78eYqA>
    <xmx:xDaDaVYAHH38O3X-kqXLJQirDsJFjlu8HUNTk5HMCI9p15oCl25Eog>
    <xmx:xDaDad9kiBl_yIsvGCR-ZvOGk2nI9wt0lKGaUU91R69l3XTxGeXVUw>
    <xmx:xDaDaehf4tKofHSl9JrBHSdZKHreEVS81c2y__ajaY2aDJNZWmujdH0g>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Feb 2026 07:08:34 -0500 (EST)
Message-ID: <7a5a57f6d7c89428fa5392d3c330aa77fdfdf113.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v5 14/15] make-mod-scripts: fix for buildpath
 issues with rust-out-of-tree compilation
From: Paul Barker <paul@pbarker.dev>
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com, 
	alistair.francis@wdc.com, bruce.ashfield@gmail.com, yoann.congal@smile.fr, 
	elmehdi.younes@smile.fr, richard.purdie@linuxfoundation.org
Date: Wed, 04 Feb 2026 12:08:31 +0000
In-Reply-To: <20260129163910.2612040-15-Harish.Sadineni@windriver.com>
References: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
	 <20260129163910.2612040-15-Harish.Sadineni@windriver.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-qbLB1HPco9vNOF8JjCrZ"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 12:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230515


--=-qbLB1HPco9vNOF8JjCrZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-01-29 at 08:39 -0800, Sadineni, Harish via
lists.openembedded.org wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>=20
> Fixes buildpath issues when compiling rust-out-of-tree recipe.
>=20
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>  .../make-mod-scripts/make-mod-scripts_1.0.bb              | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb=
 b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> index 874e16e642..d6b2178767 100644
> --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> @@ -36,3 +36,11 @@ do_configure() {
>  		-C ${STAGING_KERNEL_DIR} O=3D${STAGING_KERNEL_BUILDDIR} $t
>  	done
>  }
> +
> +RUST_DEBUG_REMAP ?=3D "--remap-path-prefix=3D${TMPDIR}/work-shared=3D${T=
ARGET_DBGSRC_DIR} \
> +                     --remap-path-prefix=3D${TMPDIR}/work=3D${TARGET_DBG=
SRC_DIR} \
> +"
> +KRUSTFLAGS:append =3D " ${RUST_DEBUG_REMAP}"
> +EXTRA_OEMAKE:append =3D " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-=
kernel', \
> +                                             ' KRUSTFLAGS=3D"${KRUSTFLAG=
S}"', '',d)}"
> +
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#230155): https://lists.openembedded.org/g/openembedde=
d-core/message/230155
> Mute This Topic: https://lists.openembedded.org/mt/117528985/1826184
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [pa=
ul@pbarker.dev]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

Looking at this, and the other uses of KRUSTFLAGS, could we just set
KRUSTFLAGS and add it to EXTRA_OEMAKE unconditionally in each recipe
where it is needed? There should be no harm in setting KRUSTFLAGS if no
Rust code actually gets built. For modules, this can be done in
module-rust.bbclass instead of in each Rust module recipe.

Best regards,

--=20
Paul Barker


--=-qbLB1HPco9vNOF8JjCrZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaYM2vxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bttVAPwJQyebEIfStek47GAniHOSERP0fX/9GVAs
zWpnvIu6fAEA6A3iFYsa8xogvGcPU+20t2UPIkZPhFNzefBMJ6KZ4Ak=
=V0JP
-----END PGP SIGNATURE-----

--=-qbLB1HPco9vNOF8JjCrZ--

