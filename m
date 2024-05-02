Return-Path: <patrick@stwcx.xyz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84EB7C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 12:52:06 +0000 (UTC)
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
 by mx.groups.io with SMTP id smtpd.web10.4429.1714654323739646893
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 05:52:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm2 header.b=l+KzAfVX;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=Abuk35ni;
 spf=pass (domain: stwcx.xyz, ip: 103.168.172.155, mailfrom: patrick@stwcx.xyz)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id D77651140083;
	Thu,  2 May 2024 08:52:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 02 May 2024 08:52:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1714654322; x=1714740722; bh=OtCb2xDadn
	DTYnz3T+fMuekYcXG07wTP8VPDcSBHFWU=; b=l+KzAfVXtM1p6u+mZH1+ilEPsD
	o+7NkQQ7EB2rsu1PZQdUWyQ9KxHtc3FfSBhajE01L6PD5xz0EnSx40PtVr0MqOlI
	TM1nph5OopISOtgk7WqOrNrgda3JCxdC2QV4HHcm5RVjVI2QsUXe3NV6REIfX/1t
	jop9yKpC+PmRXqV6vqIycobac63KRissIJnZKyv6JPuK9PtmvuxjsKNqHg+FG8Ba
	WoFgBRRPYtA3I8g2dFKHpBefFsbRqgXPgj4A88CKYbvZA6PEOWbd0tyzmMNXeDEO
	jakGpPnrrFPWxY+ELVwRhCaGlWbbErRhmf3CuFnq2b3fHFujCyFP2/d3MOgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714654322; x=1714740722; bh=OtCb2xDadnDTYnz3T+fMuekYcXG0
	7wTP8VPDcSBHFWU=; b=Abuk35niw0hE2+5U3pYlFiFS79OCylUuZHVD0bo047Jf
	AbooJ6NI47ePcZvwcBYMp10jJgdFM7v0AgtGAEu7U58gF0JivFnhXoBz9h0wSDzj
	nShpOHfZGMhRVz6ogGT2q9ThNK40G+k8wogtdfT490Il7zSynTSZ17sRuviDEi2G
	ZgRK5UywTwgfC9fLIjHAzuDtdcJZPL+rZZ3jmezIxvhGUnS1MEufWZlVvFA4mB5/
	e8S/II0M2HZHpXgadg28sx4azxqDZwQtgwmYinTb67MzOI6OKeOdjIoF2X2HvCYx
	60EyYs3XRJI+xQGy0AKhAsiEMWbf9unJPYHSgWkE0A==
X-ME-Sender: <xms:cowzZoerowGDDaEooJUwZmX508BLKtHC0bb8NbwD6NFLW60GPzK5LA>
    <xme:cowzZqNuNTk3SpCZAc6JTXD_v5RXP48EB5lJHAF6uM4Ca6iEzjuFcHGCEZPKIsLuW
    MzhQqI9LbxJhHIxMbQ>
X-ME-Received: <xmr:cowzZpjlyqx957FYjPVV_xKxnVkEGzO-D1gIGLAM44A5yoQK9xAtjR-PxEIUg9jdbi6xCqehGWfLMirLmy7eoj91z31hXxz3DXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddukedgheekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpefgleffhffhieelledthfefleff
    feeivddvfffhffetfeehueelheduheffhfeghfenucffohhmrghinhepohhpvghnvghmsg
    gvugguvggurdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:cowzZt-9rZnkaQm4nl8ls_x1u-Qud7T6g98Q7D3qZS02zu0RUL9-IQ>
    <xmx:cowzZkv2Zy-V_vg2tbJ1mNu3PQGm4FyVYdbTJzMTHDlTBG4q9ZIy_w>
    <xmx:cowzZkHclS5UwYJ9I4dKueE3TR-ekRXer86OnGTPZKUt4A5rkTk-5Q>
    <xmx:cowzZjO_OlajeWUwK4NfivrwagzHfPSWpiJisx-OHDsJY_KfgIQ6zA>
    <xmx:cowzZogAf7bCebKE1mV83O7LKEWqM93Mv9WRe7QPj9BZ1s9j5_V6C5Fi>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 May 2024 08:52:02 -0400 (EDT)
Date: Thu, 2 May 2024 07:52:00 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Lean Sheng Tan <sheng.tan@9elements.com>,
	Ross Burton <Ross.Burton@arm.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
	"Hansen, Alexander" <alexander.hansen@9elements.com>,
	John Chung <John.Chung@arm.com>
Subject: Re: [OE-core] btrfs-tools-native build python error
Message-ID: <ZjOMcNhYVh50R0lt@heinlein.vulture-banana.ts.net>
References: <CAMWxwJ0znPDyQAKAwv8PL9GwyCCEpW9+2SDmXsygNyK26_xF-A@mail.gmail.com>
 <CAMWxwJ1aad-ggrC+Bug=RGx1yQcFADOSWiZMDZv8S2AnJ7ntnw@mail.gmail.com>
 <5684983E-FC35-4766-BA02-4D5BCBCB6796@arm.com>
 <17C993B983870D20.19690@lists.openembedded.org>
 <CAMWxwJ3ok_d17XnVEgSm3H3qeKK+7U3AQ4OuwNFXTo-jWjtHoQ@mail.gmail.com>
 <ZjKzwmSpKmznOedr@heinlein.vulture-banana.ts.net>
 <CANNYZj8eFxRVx6PE9RuOPS2L0Km+4O=19XC6gDctZ4v3dVH-jw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ThNcwGX9oHe92gpN"
Content-Disposition: inline
In-Reply-To: <CANNYZj8eFxRVx6PE9RuOPS2L0Km+4O=19XC6gDctZ4v3dVH-jw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 12:52:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198915


--ThNcwGX9oHe92gpN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 02, 2024 at 11:28:54AM +0200, Alexander Kanavin wrote:
> On Wed, 1 May 2024 at 23:27, Patrick Williams via
> lists.openembedded.org <patrick=3Dstwcx.xyz@lists.openembedded.org>
> wrote:
> > What is going on here?  Well, this:
> >
> > ```
> > meta-phosphor/conf/distro/include/phosphor-pkg-tweaks.inc
> > 6:# Disable python from btrfs-tools
> > 7:PACKAGECONFIG:remove:pn-btrfs-tools =3D "python"
> > ```
> >
> > We explicitly remove `python` from the _target_ btrfs-tools
> > `PACKAGECONFIG`, because we don't want it on-device (since that pulls
> > python itself as a side-effect).  If I remove this _target_ setting
> > everything works fine for the native package:
>=20
> It's not a target setting. PACKAGECONFIG without qualifier overrides
> applies to all variants.

I'm not convinced this is true.  As I wrote, the final result of
PACKAGECONFIG is exactly what I expect; it includes `python` for the
btrfs-tools-native and doesn't for the plain btrfs-tools:

```
# pre-expansion value:
#   "     programs     convert     python     crypto-builtin "
PACKAGECONFIG=3D"     programs     convert     python     crypto-builtin "
```

I've also tried switching to this, which is very clearly a "target"
qualifier and have the same exact results; it applies on "native"
`inherit_defer` evaluations:

btrfs-tools_%.bbappend with...
```
PACKAGECONFIG:remove:class-target =3D "python"
```

--=20
Patrick Williams

--ThNcwGX9oHe92gpN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmYzjG4ACgkQqwNHzC0A
wRnQSw//a+NxtwR5TSqhPSF4taLz2GJ8DBRLQcdGVY1bh2sTaCe3BqtufDAItBoJ
v0ItkCob5l5YtAhzW2loau07vfU1a8pTodRf8K90glnj/ZkJAJOMNLakqwwwKAms
D6ZnaVVnY5ImIJpHNsuMrg49/0cWC/Ryes8S7ibdar876C9NVf8Faq0MtEIGhkRd
oXaV7VF79pfhhXaoThUPtOR5CdKCRKv+grb9jlx1eMDXoq/uo41IFRjttwkJwmZl
jbrOoxpiZ4b2QT5Zc6gHbCbs98MAa5nXYAnTQjeQJRPrdakYc2kymJqBsm2wGKEz
K46Ms6KWfPB1dfJRjVFWXuarYlMIXFZwPo6cd48qeI0Zggs+1du9HSwbf0EP5kme
qHoCaPuB1txzTgeC5bFuixcZMCU6UWgZ0+Ujkr02psX3B7ctlWE8T9ff4kPuNOeX
PHejozsNKyzmwizXgcL+BUBH8PEJo5Z0l7JmS8Wxu5y5pddL5o/nKYgDsC0u60pS
ltMKEoNYkph0bv4Isc4xcrJUaR0MY6CCPGC+40Zh/OsEYChjUxVdiORVmwM054++
kOae0L18comkj7XKxmdxwfhs8UXsE6Sxge1ttKoEVRKI448NiP0IY6JJYDwLEa17
WxpyLcmS0s1DphrTY3ozPfNLPAxKaJ6cgxf/+58Ra04dSDjUQJ0=
=1TiO
-----END PGP SIGNATURE-----

--ThNcwGX9oHe92gpN--

