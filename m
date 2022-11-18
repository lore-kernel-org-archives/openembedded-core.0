Return-Path: <patrick@stwcx.xyz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC6FC4332F
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 20:25:31 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
 by mx.groups.io with SMTP id smtpd.web11.4228.1668803123344070024
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 12:25:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@stwcx.xyz header.s=fm1 header.b=OvfsbeDN;
 spf=pass (domain: stwcx.xyz, ip: 66.111.4.25, mailfrom: patrick@stwcx.xyz)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 649955C051D
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 15:25:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 18 Nov 2022 15:25:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1668803122; x=1668889522; bh=Kvq0ViIlqDwG+pnJiyJsWVIPcOwmTuEAaSC
	V0v0qknE=; b=OvfsbeDNZFpukbg5fvqOzhfg3HI7PT0XDkeIrPnMfzFB5gYESuI
	PwLiLLOa4imDtziV4T87xi3JgaWvM6bwds2kk708HG31CPV4Y7qcJAE/Qz1EU5x4
	WiMOdPf5jVN2wrR5D2b//A3tWFjQQVZkXLK7BORHL6faeelh/I9HgHRr+Z6UlwQp
	g1Oc94xWdSb4FdR0pRGRB3gvArGW+N7fKD4Lu4I1TuhVVI/Yl3EBqxtW/q2CZDnN
	Tvz9p7sB6bsrARnvmMunl720w2HHcU9vddDlv5WrNdURt0aHon4549Es1Jvlmsy5
	/OmXBe3eWpMZkCriOxw2svZLV8KfGCrfSFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668803122; x=
	1668889522; bh=Kvq0ViIlqDwG+pnJiyJsWVIPcOwmTuEAaSCV0v0qknE=; b=i
	B278hPg5Ud/eGCVmUlc/QPbIEGpFhyjWdX1JyvS2NxnD6J+HFXjrg8p5j4yYykD6
	SPtauacEzqRyFfopg6ULArP5o5/jCpegz3xxjazF/jBZ7TUrK1IW5gO1N5Ki2cbm
	afg2jXWpV5TI2xqXVqMcUHTfrv/lAJQELRz4HoASJV5LugG+Pz/KZPiJcQ6qFFuS
	GQsat39ZtmDuhhzuTGhknJHdKaUfyjNY7IC5v8dM4d5VfuaroJaQxGD5ztR3oe71
	wM4EZtAmrWJutjIIgy512q81Zikor7qg5Domx7Ea/yb8NkeKBhjkcZDs+PmJl6oV
	Z3UAvveu5b8ztDkUo02rg==
X-ME-Sender: <xms:Mup3Y77u9NP-3ZO_Ue4Wryuj0wHXDigMqDPFGFv2hRCljDRXdS6OJA>
    <xme:Mup3Yw535nCXzX-Z6GgYJzJ-dSd475mXe-Q9-rKvBqyqvAnf97O7a5O5QWkF1oM2k
    O3-bwMBQnMBTuoB6dk>
X-ME-Received: <xmr:Mup3YyedX_0q3W4wfYGRqefCSE7JRIJlOoO0PmJ5FBrl7SLe6tm54Q-sE1u_VbY8wt78sehjWaMxT6nK0czTRdBibtVzDpiIm_4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrhedtgddufeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpeffhf
    fvuffkgggtugesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgr
    mhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepje
    ffueelheelvdefveejueffjeejveeuveehtdduffdtgeelkedvtdevveetgfetnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkh
    esshhtfigtgidrgiihii
X-ME-Proxy: <xmx:Mup3Y8Jfvr9PaEDiB9reju-dRnByD-uxk6sUO_CbhEGePYB8IDKLBw>
    <xmx:Mup3Y_LVMm0wTw_9a3P8UmNCitop3T2VuFXUsQTJztSkGMswa4pH1A>
    <xmx:Mup3Y1wg28KuZyPJC4WsA8Sm9BRfBQ-VF8kUpo5IQvPXFxD3abfntA>
    <xmx:Mup3Y6k9cQj9SjwNsQ-Z2ohWuBk9tL0mUODhFltRxOvow9h6LnjHzQ>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Fri,
 18 Nov 2022 15:25:21 -0500 (EST)
Date: Fri, 18 Nov 2022 14:25:20 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: openembedded-core@lists.openembedded.org
Subject: useradd: shadow RDEPEND
Message-ID: <Y3fqMOrQ0uSV9CTx@heinlein.taila677.ts.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7Ck2YlYTqm9XjOoQ"
Content-Disposition: inline
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 20:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173493


--7Ck2YlYTqm9XjOoQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

It seems like ever since useradd.bbclass was written it added an RDEPEND
on "shadow".  See commit a82885db00956734922291d8a17eb135461204fa for an
ancient reference.  I'm wondering if this is really necessary?

Recent commit 84efd72d48616405dbe4d73ec95917077144ed09 added systemd's
udev to USERADD_PACKAGES so that a "GROUPADD_PARAM:udev" took effect.
In our initramfs we have a package that depends on udev (in order to
deal with the emmc device containing the rootfs), but we also explicitly
'PACKAGE_EXCLUDE =3D "shadow"' in the initramfs recipe.  It seems like
this was done to avoid all the PAM dependencies that shadow would drag
in.  This now ends up un-buildable without adding
'USERADD_PACKAGES:remove =3D "udev"' to our systemd_%.bbappend.

I briefly considered using eudev in the initramfs, and systemd-udev in
our rootfs, but unfortunately there is also
'CONFLICT_DISTRO_FEATURES =3D "systemd"' in eudev.

I suppose the shadow-RDEPEND is necessary for the case where the package
is installed via RPM/IPK?  Is there any mechanism to specify that this
RDEPEND doesn't need to be satisfied in a static image that I'm not
aware of?

--=20
Patrick Williams

--7Ck2YlYTqm9XjOoQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmN36i4ACgkQqwNHzC0A
wRmSgg/+Ozxk0n+vBpDgjFmjBZYOiKiXE+Unux7kKbxZdBobjuB2jDG6ZOUTRJw5
/Rkysa/090Tf665NrpNxu2IL/2izccB+HmC37vr53nPBSz+AHWEeB+WG5zQWBhAS
MRGn/KjE2QnRuxuoeOcnvtAqRVNnjsBgMBy6N1CE8RnguNGDzfYO4TczdB4CSk4n
8BLW+1b8HmifcnRMSdSCJieNifpDPlM/hAVebqQuxKnDpUgUm9oHjXkTugh/+BBX
YsRNG0yDDevIWNYefdKCe2PEL5/pTQsNFLM9CLo66WXkBpZLVq1iqQefIC+OYeSU
DpZi/7iUXQRy7jxhKgJLWhkHGLO5Uc2SMG56RJRGE5IVdyj3syBK7NCRWoC3D+zm
H/5oKaXiZJ0+fdFFKEkUfVxwZ5SNn/MGsqURqzS8+D44mkLXqYVnIOP43QAvkU9L
D2plksykc9VyMu7fRtZ+UV6SaqY9G3TkCfX+XZ9mr76kug2JCfs1Z11ozvPMGmbi
4P8gqWW7KpvJslMZfdG5gMyVsnU7L23NshtbCok/hojySLhYN2cRbtSvrESYVCmv
FgvfkTU2V0iakxgLhgva3JSiJFtSaclD6CY8mYLXzhHZ8f+yFe4FzbrBi4Lq9oFU
mLRvpcnKr5bJMPTjDpPTI1cTN0e/OGROy2gdxympIJEhacWQGjY=
=J9SJ
-----END PGP SIGNATURE-----

--7Ck2YlYTqm9XjOoQ--

