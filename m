Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F36E9EF4ED3
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 11:59:45 +0000 (UTC)
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53391.1775476781053138380
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2026 04:59:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=ytMEaFL1;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=r8kPLd07;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.156, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 34F687A01A4;
	Mon,  6 Apr 2026 07:59:40 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 06 Apr 2026 07:59:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1775476779; x=1775563179; bh=DpF8a5O5Xq
	7V72r7q9CLj9iu+zQA3KS01lNLD6a1I6c=; b=ytMEaFL1HSJKTuG1z9hsNYavxU
	yeVcOUa2Bov1DbDCF/MoXGD4Cpl6278UIPL3EXMJmCocuuHZZgk0KPeW6KF7f5VI
	c/r51IkrRC3L7ATMMGkPmfmZ75U+545PhaE1oA5Tp5ojTaCIkkclXo3SG5qRsudu
	pf/j6DBseoZOZ52tMoLmaloZEHmMdyWQvoO8fW3kviyASCijBovNZibsNz+y1i3Q
	RiWb+p+Z7H8ei9Su8WYdUrXkMlGr6DxoyAi6BjRs5yE82F9GGL+49nryXJhHwAQf
	n2h7V4gJluto6GnyN0E3VMop3OftHhORJNCTVTUJESVmZxdxKlFclknawyOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775476779; x=1775563179; bh=DpF8a5O5Xq7V72r7q9CLj9iu+zQA3KS01lN
	LD6a1I6c=; b=r8kPLd07SWnD6Kog/A8mylNSbLFFdMoSD7K9e3ziAeSsLcdw47o
	7bK/zcink3IhZbsYkgATxcg2LfwoyMs6oz3fS+A/QFFwFxom9nN2/WP+CdzuW63z
	e7EBO+Ipyumq6GUk7Lbxb9siwpExFkX7T3YvHt2m/11oYcYaUxth0Yv0X0w+VJSP
	lVWF1cqJAmgT+7rpVwKQuWCNNik0UOKK30W6O+m2waY4fuxBPGb0iHl9AX6ZBxfX
	k1xpSK7P7AcrdRmcgqpzF5nvsCBVRwOvBCmoI78Mne6O/ADa1IPwfbBD2HTOsxH2
	UVAndHFrdEvtu9oR79hkEbGtJ4HlK0SKrLg==
X-ME-Sender: <xms:K6DTaUBIUDXC4a7CxT7nOi4EQo31coarOMvw0EjzR4WJRypyGmSY1A>
    <xme:K6DTad866qDhkWzWtJ83DQCKOfiDbzKpY2y5u72GCTRKEiCrrgJjzMFiOpCeTny7F
    uOYLo2P_orlIDU6jWRDgCtHk_0mGo1v7dDDHAtK3KTu0_4BTeIiM8g>
X-ME-Received: <xmr:K6DTaU9zsdD5JF4KBlUhqsElO07LTtEUxBE8A2oydZLeT2bmFI8lkJp_ENzkzJye6zgWL7K9GpZ_wHF275029oDEAkWDtS6VNZNiml0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddujeeihecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecufghrlhcuvffnffculddqiedmnecujfgurhepkffuhffvve
    ffjghftggfggesghdtreertderjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehp
    rghulhesphgsrghrkhgvrhdruggvvheqnecuggftrfgrthhtvghrnhepvdefvdejkeelje
    evjeekieejveegieejueeuudehteetheejueeuffdvkeelueeinecuffhomhgrihhnpeho
    phgvnhgvmhgsvgguuggvugdrohhrghdpnhhishhtrdhgohhvpdguvggsihgrnhdrohhrgh
    dpphihthhhohhnrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhope
    efpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehvrghnuhhsuhhrihesmhhvihhs
    thgrrdgtohhmpdhrtghpthhtohephihorghnnhdrtghonhhgrghlsehsmhhilhgvrdhfrh
    dprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgv
    nhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:K6DTaUeWxQDpTMxz55lS-cROJdCmBeE3cHB747UFkTdvDVc_GGJF9Q>
    <xmx:K6DTadFB-l5MyNFXyj7PT_Fv4BTPIltCBcJyXD6VnjETWPsTrCwrfg>
    <xmx:K6DTaSdN7TxzztnkPesfuI8i84mO0NbFDmM-mE4o_vneMCLQEzazYg>
    <xmx:K6DTaXHtIYS7BPuEVNhbYw60I3sHsDQdw-x9P4UJSXbbQ5N1dd6NJQ>
    <xmx:K6DTaZMsPa1Zu3sgV1TD-MGDo5V4-xy-jeYBTEpRj_WrU8Dm9GSBSPzf>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Apr 2026 07:59:39 -0400 (EDT)
Message-ID: <990e40208f0077bfac5c062421012e5c83b56eca.camel@pbarker.dev>
Subject: Re: [OE-core][kirkstone 08/18] python3: Fix CVE-2025-15282
From: Paul Barker <paul@pbarker.dev>
To: vanusuri@mvista.com
Cc: yoann.congal@smile.fr, openembedded-core@lists.openembedded.org
Date: Mon, 06 Apr 2026 12:59:36 +0100
In-Reply-To: <CANQUz191KfwSFA_n3MP=Xt7KC6ddAvvKkJGKOwCmMBPtUi_5TA@mail.gmail.com>
References: <cover.1775435063.git.yoann.congal@smile.fr>
	 <c19d97a63c2b9b145a0370a961cbfef90b450010.1775435063.git.yoann.congal@smile.fr>
	 <053f62bc5f48a7ef16d955982e64adecf35714be.camel@pbarker.dev>
	 <CANQUz191KfwSFA_n3MP=Xt7KC6ddAvvKkJGKOwCmMBPtUi_5TA@mail.gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-mz9IUZG+5hlVya1+Cunu"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 11:59:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234674


--=-mz9IUZG+5hlVya1+Cunu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-04-06 at 17:14 +0530, Vijay Anusuri via
lists.openembedded.org wrote:
> On Mon, Apr 6, 2026 at 2:39=E2=80=AFPM Paul Barker via lists.openembedded=
.org <paul=3D
> pbarker.dev@lists.openembedded.org> wrote:
>=20
> > On Mon, 2026-04-06 at 08:26 +0200, Yoann Congal via
> > lists.openembedded.org wrote:
> > > From: Vijay Anusuri <vanusuri@mvista.com>
> > >=20
> > > Pick patch from 3.10 branch
> > >=20
> > > [1] https://nvd.nist.gov/vuln/detail/CVE-2025-15282
> > > [2] https://security-tracker.debian.org/tracker/CVE-2025-15282
> > >=20
> > > Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> > > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> >=20
> > The fix for this issue (referred to as gh-143925 upstream) looks to be
> > part of Python 3.10.20 [1]. Should we take a final Python stable update
> > instead of this patch?
> >=20
> > [1]: https://www.python.org/downloads/release/python-31020/
> >=20
> >=20
> --> Along with this CVE, Python 3.10.20 includes multiple security bug
> fixes. I think it's good to go with Python stable update to 3.10.20 .

Hi Vijay,

Are you able to send a patch to update to Python 3.10.20 on kirkstone?

Best regards,

--=20
Paul Barker


--=-mz9IUZG+5hlVya1+Cunu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCadOgKBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bsFgAQC3/zLNxZ4AF98AnX0ge6TY0Li05AkOdoxQ
sUAhBPP1dwEAqESDq1IN/NdasllZfKpWGlukj1va5XONLWW80tSNBQc=
=tqW8
-----END PGP SIGNATURE-----

--=-mz9IUZG+5hlVya1+Cunu--

