Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B73E6817F
	for <webhook@archiver.kernel.org>; Tue, 17 Feb 2026 12:59:36 +0000 (UTC)
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11269.1771333175373337906
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Feb 2026 04:59:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=RnOQIUX9;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=aoakbsme;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.155, mailfrom: paul@pbarker.dev)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4DE7114001F4;
	Tue, 17 Feb 2026 07:59:34 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 17 Feb 2026 07:59:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1771333174; x=1771419574; bh=dLIdRXSLv+
	plrPuhJP8TTjG8NmYYw4nJqVBao3DWlC4=; b=RnOQIUX9Edte/NT/7Z0+feK/Nv
	i25jSwFTcfKwSqVTGnrW9n32IExYqQPgc0ZzE2KfsJXmbJe8WEss4PoU8mn+81kg
	39o6BNV6/5JWNSy8/GzT3R6rudfbRKKrzWoXciFNUm+24aMrdcsrtZRfqdyrhQJ0
	im8aakhgGvDMWWrMfIWqL9UYQFS2ZHA/n1trBlZePeWGaWM/Z89AuPvARj0DwKnM
	a0jPKns4orbvisE9draqw+RhzP8vjOXYMG/IqBG3/t06fP0/A3Fjg5SzpW0UZpoq
	odaT7G/Q+Dol5g3Uou1OgFW0FxDx9gKKsXyjfF/rBZ7UuzpXxGSJAvpciZoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1771333174; x=1771419574; bh=dLIdRXSLv+plrPuhJP8TTjG8NmYYw4nJqVB
	ao3DWlC4=; b=aoakbsmeYyFdoT/dH1AhcbUAjcCov6N20MjW9Qn3XAJpZnSSGcK
	nQ0DjuRebvt+8/VkPX2uFWoCVfl8TFVVeHrRTpokBrEZ49AZyRwg5ltLVYImBBne
	Gl5DxNYYEF8uIk2hoJL09LD9NGctTjecxigzcSNWF9n0VtXpPtyRNnk+p4DPXAms
	nb80hc5xpvKLDMSrVXNVj3jPO1FK+i5h9dJytL8Um24FyfUnm4tvocT14cENqAaX
	TqgDn1s1PhCQ6FKvdL2+shU2O29ni9xlVdz641MjBr+00q6X2Jhien1X9a7UTmTb
	WZHHaICSH+2mAeou2sX9T/JNQiZvnfBEPRA==
X-ME-Sender: <xms:NWaUaXl45BRGBznElBjKPwxURWH2WHXNyYK8mia5fsDyAvTM6jA5jw>
    <xme:NWaUaR3CPorOy_q2zfXp_Bn_8DkiZ9JNyxCkz_2SMcIpMSqgSfm7ZAAZAGZU2PJGU
    f0oKxYpb3DQiIxzZSx0tcgkxIxmejvOLoWMkRR6qnjVukSWFodP96E>
X-ME-Received: <xmr:NWaUaSrCxMXjpSVjSyj04RtzGa1Jw1Q2PfT7Bh89PW6Wb8T2fJ1Pv0tJ1_bCooTIQBR-41tABRdhKps6crwJLwmXHiKmXaknAu2Au6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvudelkedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepkffuhffvveffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceu
    rghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    ephfekhfeugfelfeeludellefhkeetvdffiedttdeuueekhfeiudeivdefueehuddtnecu
    ffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggv
    vhdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohephi
    horghnnhdrtghonhhgrghlsehsmhhilhgvrdhfrhdprhgtphhtthhopehjrghvihgvrhdr
    vhhighhuvghrrgesughighhirdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvg
    guqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthht
    oheprhhitghhrghrugdrphhurhguihgvsehlihhnuhigfhhouhhnuggrthhiohhnrdhorh
    hg
X-ME-Proxy: <xmx:NWaUaed1ED8wu7C1zsMTO3BjQTqVKR1RB47GxVGTjXBYK7fj1KbPZw>
    <xmx:NWaUaRrzJFRQq7DniXmkHZ1MSd2xVnScNbfVLbAwhX6DHjnWQLoarw>
    <xmx:NWaUafErs_yslc-1Ln76wpWsK_bK2KlngyN4ftmHbu225Pkl3XSP1g>
    <xmx:NWaUaRtP25ky4soUjFTFJEMGRtZc5vOTaFtyynMMUX1paGNFD_sDbA>
    <xmx:NmaUaRQ83vIRSAVdhGC-UYWgTLj51epofw_jcl3kqBn_hZc-oAKarzuE>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Feb 2026 07:59:32 -0500 (EST)
Message-ID: <b374f672f29106dd0c0d02c314f81e9d4ad8bf8d.camel@pbarker.dev>
Subject: Re: [OE-core] [scarthgap 00/28] Pull request (cover letter only)
From: Paul Barker <paul@pbarker.dev>
To: yoann.congal@smile.fr, Javier Viguera <javier.viguera@digi.com>, 
	openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org
Date: Tue, 17 Feb 2026 12:59:26 +0000
In-Reply-To: <DGH6UWVR18RO.2LU166X88G2RC@smile.fr>
References: <cover.1771008295.git.yoann.congal@smile.fr>
	 <b18d950d-4a43-4797-8c9d-0a7b350d04fc@digi.com>
	 <DGH6UWVR18RO.2LU166X88G2RC@smile.fr>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-rEaEJio95qbWTxXuTU13"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Feb 2026 12:59:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231251


--=-rEaEJio95qbWTxXuTU13
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-02-17 at 12:09 +0100, Yoann Congal via
lists.openembedded.org wrote:
> On Tue Feb 17, 2026 at 11:18 AM CET, Javier Viguera wrote:
> > Hi Yoann,
> >=20
> > On 2/13/26 19:47, Yoann Congal via lists.openembedded.org wrote:
> > >=20
> > > Richard Purdie (2):
> > >    pseudo: Update to 1.9.3 release
> > >    pseudo: Update to include an openat2 fix
> > >=20
> >=20
> > The backport of the pseudo patches to Scarthgap broke the build on=20
> > Ubuntu 20, as it still uses glibc 2.31, so the pseudo-native build fail=
s=20
> > with:
> >=20
> > > In file included from pseudo_ports.h:5,
> > >                  from pseudo.h:164,
> > >                  from pseudo_wrappers.c:30:
> > > ports/linux/pseudo_wrappers.c: In function =E2=80=98syscall=E2=80=99:
> > > ports/linux/portdefs.h:59:21: error: =E2=80=98__NR_openat2=E2=80=99 u=
ndeclared (first=20
> > use in this function); did you mean =E2=80=98real_openat2=E2=80=99?
> > >    59 | #define SYS_openat2 __NR_openat2
> > >       |                     ^~~~~~~~~~~~
> >=20
> > According to poky.conf, ubuntu-20 is still a supported distro to build=
=20
> > Scarthgap, so I guess this needs to be somehow fixed.
>=20
> Thanks for the report, I'm working on a fix.
> In this case, __NR_openat2 is not present in the kernel headers.
> (Ubuntu 20.04 is on Linux 5.4, the openat2 syscall was added in 5.6)

Can we just define __NR_openat2 if it is not already defined?

It's defined in include/uapi/asm-generic/unistd.h as:
    #define __NR_openat2 437

Best regards,

--=20
Paul Barker


--=-rEaEJio95qbWTxXuTU13
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaZRmLxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bsDyAQCamBWTkAnv2Au5ZIkuiQi4FkPZcgD6P7n1
MH15kYOj3gD+M5gZwWMugzRe6QC82Tp/6C5RlRi0hZkibdZkp9Lfygc=
=Zn19
-----END PGP SIGNATURE-----

--=-rEaEJio95qbWTxXuTU13--

