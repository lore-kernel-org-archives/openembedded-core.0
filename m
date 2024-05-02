Return-Path: <patrick@stwcx.xyz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F715C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 13:06:16 +0000 (UTC)
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
 by mx.groups.io with SMTP id smtpd.web11.12880.1714655171308941935
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 06:06:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stwcx.xyz header.s=fm2 header.b=uOH6Ds2h;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=X+suMxjS;
 spf=pass (domain: stwcx.xyz, ip: 103.168.172.155, mailfrom: patrick@stwcx.xyz)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id A2C5E1140078;
	Thu,  2 May 2024 09:06:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 02 May 2024 09:06:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1714655170; x=1714741570; bh=9uP+YYvqGG
	6UhJ8oArZtxOHJuZ+RxemEjtFBlPAM7iU=; b=uOH6Ds2h2htbLCtE3ch+nTPTD8
	kOMm3MBOadeqmKrvg3ojxmrqEz3Y9XQ7DsUhodY24jTH2IYZz7Y/sDa24ShDYofK
	gPxlJho3S1OkgQeiuH25zqS295alyCioQ6DjqnRn15V8FKhBODhqMB1OZGWWJyQW
	BUcbxVUEsZG+NcmSE7eNYkXNWVR/XVJCdEBdEYAcNCp/g3HVQ5yRamJ0fJDdbgpl
	2Jjx27GIUH0TVyxNA/umT8X8Z/uVIljPRMFTceSxEtWtBGK+8IPtVu2YqiXyBJgD
	vVDltbqx0zDKLsVbJWaGEefUbJZCoAnz5gAq2/lQXzFnZAbNrqVwdJFpqr1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714655170; x=1714741570; bh=9uP+YYvqGG6UhJ8oArZtxOHJuZ+R
	xemEjtFBlPAM7iU=; b=X+suMxjS5bZZKBcl39bvZwW0Npcq/0zsCCp52ETTfSt+
	7cKJG3YH6MxuyOqCEVwf5kOSNkzQJbzalaC1gqLrolvxjfYbPcrB+R+gb/TbQVGf
	imysZrcpx96Tb2irFDcFj+2KzcNX3e7U62LDX6mSAEiD45GxB6+UZ3a50mh7meM2
	QxWEfyJSse+OhQCY+TdN5dassHYBVtLI3tmoZiNITOLufHDrRkdi3jHxl0ZguimQ
	xE1jiZl+ymDs3fLScZp61wOISnsJrwkewfGI8NoV440C6mil8xgbD3ONBXhYjhua
	OQkwSFpAX9vmR/Ua+8RJlCsbpnqDbkO6tZcys82Alw==
X-ME-Sender: <xms:wY8zZu07Rn0Kb1aoCdc8vuOYMDPvlcoJlKcPtURAglehY6x_MR_esw>
    <xme:wY8zZhGOMH02hIBlbsZHt-OZdACl1DJqH-qsmICCJus0ri8F7am8kNKRw1FkGRtd9
    2TjdrLd_IburvVRnXs>
X-ME-Received: <xmr:wY8zZm4bXJoX_p8WkrQ6MYV63T7bgHqv16_KpkZjjKHZGWiAd02CsxUgoVDfdR1waM_mCToyycQX5_ZDV0WlqUYX3v0hd2poHbQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddukedgiedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtdorredt
    tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
    hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeetveeugfevteettdefvedufeeh
    heetfeekuefgudfgtdefvddufeevveethffhffenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:wY8zZv3tJ2wLjN58UBCSDKrUpLuZB-zjn6-mBx9MzV5H8daM7KFyfw>
    <xmx:wY8zZhFnUfSuZrTRhDNrklSKdFxvInHkwRY8w_z7WAyYuZ-q9kFL4A>
    <xmx:wY8zZo_E1GtoexneORv6WmUHjM3SFP1XD4umAu7sqbvJvMHS7cjetQ>
    <xmx:wY8zZmm8obpqiryEVkpWAP1bKHVNICx4_UOG2UbXpvrrJBR4ZFk5hQ>
    <xmx:wo8zZm52Hg5deCyckzTFAW_lUOAS_D9AkTywvHs7u1-5-MeERIEWMl-b>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 May 2024 09:06:09 -0400 (EDT)
Date: Thu, 2 May 2024 08:06:08 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Lean Sheng Tan <sheng.tan@9elements.com>,
	Ross Burton <Ross.Burton@arm.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>,
	"Hansen, Alexander" <alexander.hansen@9elements.com>,
	John Chung <John.Chung@arm.com>
Subject: Re: [OE-core] btrfs-tools-native build python error
Message-ID: <ZjOPwKHrUfzjbvWL@heinlein.vulture-banana.ts.net>
References: <CAMWxwJ0znPDyQAKAwv8PL9GwyCCEpW9+2SDmXsygNyK26_xF-A@mail.gmail.com>
 <CAMWxwJ1aad-ggrC+Bug=RGx1yQcFADOSWiZMDZv8S2AnJ7ntnw@mail.gmail.com>
 <5684983E-FC35-4766-BA02-4D5BCBCB6796@arm.com>
 <17C993B983870D20.19690@lists.openembedded.org>
 <CAMWxwJ3ok_d17XnVEgSm3H3qeKK+7U3AQ4OuwNFXTo-jWjtHoQ@mail.gmail.com>
 <ZjKzwmSpKmznOedr@heinlein.vulture-banana.ts.net>
 <CANNYZj8eFxRVx6PE9RuOPS2L0Km+4O=19XC6gDctZ4v3dVH-jw@mail.gmail.com>
 <ZjOMcNhYVh50R0lt@heinlein.vulture-banana.ts.net>
 <CANNYZj8M-XvZQK8w9czayXczA_3-8LPB-+pbqXSpzd224y5jRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DQ32XR4gSrjVJHjN"
Content-Disposition: inline
In-Reply-To: <CANNYZj8M-XvZQK8w9czayXczA_3-8LPB-+pbqXSpzd224y5jRQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 13:06:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198919


--DQ32XR4gSrjVJHjN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 02, 2024 at 02:57:30PM +0200, Alexander Kanavin wrote:
> On Thu, 2 May 2024 at 14:52, Patrick Williams <patrick@stwcx.xyz> wrote:
>=20
> > I'm not convinced this is true.  As I wrote, the final result of
> > PACKAGECONFIG is exactly what I expect; it includes `python` for the
> > btrfs-tools-native and doesn't for the plain btrfs-tools:
> >
> > ```
> > # pre-expansion value:
> > #   "     programs     convert     python     crypto-builtin "
> > PACKAGECONFIG=3D"     programs     convert     python     crypto-builti=
n "
> > ```
>=20
> Run experiments with plain poky and changes in local.conf, and that
> will convince you.
>=20
> > I've also tried switching to this, which is very clearly a "target"
> > qualifier and have the same exact results; it applies on "native"
> > `inherit_defer` evaluations:
> >
> > btrfs-tools_%.bbappend with...
> > ```
> > PACKAGECONFIG:remove:class-target =3D "python"
> > ```
>=20
> class-target:remove, not the other way around.

This is almost never correct and there is not a single example of it in
poky.  There _are_ examples of exactly what I wrote.

If you do `PACKAGECONFIG:class-target:remove` and there is not already
an explicit `PACKAGECONFIG:class-target` defined, this in effect creates
a _new_ _empty_ variable `PACKAGECONFIG:class-target`.  This is nearly
never what you want.  You typically want to take the base contents of
`PACAKGECONFIG` and remove something from it explicitly for the
`class-target` class.  What I wrote is exactly how to do that and what
there are multiple examples of in poky (see tclibc-barmetal.inc,
no-gplv3.inc, meta-openembedded uim_1.8.8.bb).

--=20
Patrick Williams

--DQ32XR4gSrjVJHjN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmYzj74ACgkQqwNHzC0A
wRlmQA//es3xx+VupFx0xcKur/MdNf1NYHG2vI8/9PcqTu3rHOB6/2cgKKGd1OiJ
FqZz8LXuyiNt0U+zrCFSH2S1F660IWr2ORCWhPk+8gxX1AgLjcnbhHs/OlCUzhB8
3g8PwXGjdllYZUdafOunlXiaauA4Zdj0VVXO5VFNZwfcXyGyUqIDiRN4mQeFdlOe
wwbPwsnloF1A9R6At7qs+zZVMNVagUI475iIqAM6/j/ehKtZgVwrxwKk3s6/MNzI
Y9YtC1GB6TZ9IXNLYruv6aLFrmPY8kvaY82TsxvlMmapqAZyO8p16MHm/gCDWDeX
xf36wFNu/L4jt4mQKWfl4LIjxqDMnWAPZSsBcLDXcTp5e8V5rl77jaZ2e3zP0TGS
JOp/+zt1rGhrYAp2HHoHyXhfY+1uqe+JFU+u0NnfCZWWu8o/AhD4L7G6kFIts7WM
jnJJsFaDKvyhi2VxU4ivX1ZxVKIvYmuzVvEyJ4aw+WXJ0z4JBSRfLi5t7b+Dtm+V
8GuqAC9hJd0w+jXLH2lggPCIWIOIjcmP7v49DphenUeNnz3zKuASJ5cxZMPqpL5I
4HaPOXuOypbfO+m5de14fT/alus9Pjzg7DQNE2QmShf96PxYhBuD+jmonIrBkn7U
PcRZYnBIuKxKiQFzlh8KZVZok1mw+6iaRRMQ3nsqsei0UbGgrOk=
=Rg0t
-----END PGP SIGNATURE-----

--DQ32XR4gSrjVJHjN--

