Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 020FDCD342F
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 10:50:05 +0000 (UTC)
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36118.1777978192625918537
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 03:49:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=hQ60E7k5;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=ieHibd/E;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.145, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 8BFBD1D000A1;
	Tue,  5 May 2026 06:49:51 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 05 May 2026 06:49:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1777978191; x=1778064591; bh=21r0uVXC82
	SGzGBVv7Q3sQTKFzEu8I/hRvWAK/nC67w=; b=hQ60E7k58AmsElm74EClYQqzg/
	kS6+aODOHwfP9PlVYb3yIkHhXrtuRFApVJyQ8wEzN1rTOVusBj/naawffatFXmuu
	5LUDO7iq9JQj1FmRzHAFHrUn3PyZAmWBkrtiT8+bwjGB3dSuJl2qGWZ15lpnFshb
	PBGXePLHTq5VLtm3NlICP6n57pt1GunCUoKOS9bQLU21FTRWNYLpbhOuyMHVfAvy
	tuQLHtKndw9nX940wMsXFVN8qG1oh4rQ0fK0dBNolBHlT2cLnXXblEBX1RC3uccS
	vUaiQHyiVzmvDd4idcky4N2UE64vQdI1bpkBpobnZQvL/7NGLG2Ljr1iC87Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1777978191; x=1778064591; bh=21r0uVXC82SGzGBVv7Q3sQTKFzEu8I/hRvW
	AK/nC67w=; b=ieHibd/ErZU/8WWpr3eqaKi3f3QZVJDyH+LvD8zvHQ0fSKQqww/
	2uc8h0DAI+arpGpfC3KZ+0wpyobrSRlGDWnpib9Up4OvuSEc9GJdlmKASlze5MLv
	w/e5ENZvniy4TOYFVemcig0CdQ+GgFNEzO9RD4OYMJ2thpenQoU6rAN96e4Nhe9e
	5Y9edn+M42DunexRg/AV4lWRxDKiX6SDgUN4/DlmREy7c/izStlVKGutqzv03+cb
	pv3WCaAO908JNa03jbLUoL5yAQCRvz1Shly73xX/3pWjwp2tlnneszGw1RgZu0Fq
	fO/H4MtruhufzRPzDp8SGTGi5N8wl1AQ0sw==
X-ME-Sender: <xms:T8v5acg2pcOmmA5fMuJhX_MIXK_yADsS_KZxF22Tsbb13X-qIbeBXA>
    <xme:T8v5aXnjo99htvYGufXouSuQ36HOcJDNjztNF-OsFIMc8OISVrgaDk8o9BzIKlwSz
    q5gmapiouYxgSfeMVAmx-yYFAsCpPrpBF6znLV-Tq5PRngzffKX2g>
X-ME-Received: <xmr:T8v5aXtl0J8nY8qFp5iiZ3Fwa84X4GbXjFRNMqlakgv0miIx_WKGi8GJa-X9DmlyAPWDPUE_CioDTQhtJoRK0vYDLxpA9JsrADJkSZTg6ag2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutdduhedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfevffgjfhgtfgggsehgtderre
    dtreejnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsehpsggrrhhkvghr
    rdguvghvqeenucggtffrrghtthgvrhhnpeejgefglefggefggffgjeefuefgleffgeevke
    fhgeeufeevgeekheevjeetjedufeenucffohhmrghinhepohhpvghnvghmsggvugguvggu
    rdhorhhgpdduuddrsggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthhopeej
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjihgrtghhvghnghdrshhhihesoh
    hsshdrqhhurghltghomhhmrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvggu
    qdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtoh
    epughmihhtrhihrdgsrghrhihshhhkohhvsehoshhsrdhquhgrlhgtohhmmhdrtghomhdp
    rhgtphhtthhopeiihhhirdgthhgvnhesohhsshdrqhhurghltghomhhmrdgtohhmpdhrtg
    hpthhtohepmhhirghoqhhinhhgrdhprghnsehoshhsrdhquhgrlhgtohhmmhdrtghomhdp
    rhgtphhtthhopehpvghnghhfvghirdiihhgrnhhgsehoshhsrdhquhgrlhgtohhmmhdrtg
    homhdprhgtphhtthhopehgrgholhgvrdiihhgrnhhgsehoshhsrdhquhgrlhgtohhmmhdr
    tghomh
X-ME-Proxy: <xmx:T8v5adZs2IsWIvDAMwlJsFu2rzwCyXSnc16dC-voaii5_n5ReZ42TA>
    <xmx:T8v5afDKtmfHw7MsPQMLcv3HlreslIWJcAr99s2zTHAcJNNH2MtNjg>
    <xmx:T8v5aV--CaqxUqJebkl2A-9qc3joWF5vwCnS185-nsoZZsPXY7uSfg>
    <xmx:T8v5abRkytGqGNQoVhRXUMd58wSeyjF_vUq1GuH0u7gQh2bTGfkARA>
    <xmx:T8v5aTPtd1i8WKK6XRsJw66lpHgnAueSEr5XO2D2JW6n8IWPWbynn9-x>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 May 2026 06:49:50 -0400 (EDT)
Message-ID: <9f01d33f39e1657d9286cf7b76906c54cd86535c.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v2] wpa-supplicant: add patches to support
 RSNE/RSNXE overriding
From: Paul Barker <paul@pbarker.dev>
To: jiacheng.shi@oss.qualcomm.com, openembedded-core@lists.openembedded.org
Cc: dmitry.baryshkov@oss.qualcomm.com, zhi.chen@oss.qualcomm.com, 
	miaoqing.pan@oss.qualcomm.com, pengfei.zhang@oss.qualcomm.com, 
	gaole.zhang@oss.qualcomm.com
Date: Tue, 05 May 2026 11:49:44 +0100
In-Reply-To: <d7dc7eb8-2e4c-4d8b-a1dd-465a5eb455c0@oss.qualcomm.com>
References: <20260424093601.1867587-1-jiacheng.shi@oss.qualcomm.com>
	 <e0a1a2fa3b627a698b46cf3ef645a29bb1e98127.camel@pbarker.dev>
	 <d7dc7eb8-2e4c-4d8b-a1dd-465a5eb455c0@oss.qualcomm.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-NC3dGCs3C3qSpV59iMYG"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 10:50:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236482


--=-NC3dGCs3C3qSpV59iMYG
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-04-24 at 18:40 +0800, Jiacheng Shi (Consultant) via
lists.openembedded.org wrote:
> On 4/24/2026 5:54 PM, Paul Barker wrote:
> > On Fri, 2026-04-24 at 17:36 +0800, Jiacheng Shi via
> > lists.openembedded.org wrote:
> > > Add RSN/RSNXE override support in wpa_supplicant to pass Wi-Fi
> > > certification test FC 5.2.3.3.
> > >=20
> > > During the 2EAPMSG exchange, the STA did not apply the SNonce_Cookie
> > > provided by the AP as required by the test specification, resulting
> > > in sniffer validation failure.
> > > To address this, allow RSN/RSNX overriding in STA mode and explicitly
> > > signal SNonce_Cookie=E2=80=93based override capability.
> > >=20
> > > Signed-off-by: Jiacheng Shi <jiacheng.shi@oss.qualcomm.com>
> > > ---
> > > v2:
> > >   * Change commit message
> > >=20
> > >   ...r-specific-element-types-for-RSNE-RS.patch |  34 +
> > >   ...-overriding-elements-into-IE-parsing.patch |  58 ++
> > >   ...ide-element-to-override-RSNE-content.patch |  36 +
> > >   ...ride-element-to-override-RSNXE-conte.patch |  36 +
> > >   ...eature-flags-to-indicate-RSN-overrid.patch |  67 ++
> > >   ...a-capability-flag-for-RSN-overriding.patch |  65 ++
> > >   ...ions-to-access-RSNE-RSNXE-from-BSS-e.patch | 448 +++++++++++
> > >   ...bilities-for-AKM-suites-available-wi.patch |  66 ++
> > >   .../0013-RSNE-RSNXE-overriding-for-STA.patch  | 739 +++++++++++++++=
+++
> > >   ...-Selection-element-to-indicate-which.patch | 415 ++++++++++
> > >   ...cookie-to-indicate-support-for-RSN-o.patch |  84 ++
> > >   .../wpa-supplicant/wpa-supplicant_2.11.bb     |  11 +
> > >   12 files changed, 2059 insertions(+)
> > >   create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-sup=
plicant/0005-Define-WFA-vendor-specific-element-types-for-RSNE-RS.patch
> > >   create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-sup=
plicant/0006-Add-RSN-overriding-elements-into-IE-parsing.patch
> > >   create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-sup=
plicant/0007-Allow-RSNE-Override-element-to-override-RSNE-content.patch
> > >   create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-sup=
plicant/0008-Allow-RSNXE-Override-element-to-override-RSNXE-conte.patch
> > >   create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-sup=
plicant/0009-Add-QCA-vendor-feature-flags-to-indicate-RSN-overrid.patch
> > >   create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-sup=
plicant/0010-nl80211-Add-a-capability-flag-for-RSN-overriding.patch
> > >   create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-sup=
plicant/0011-Use-helper-functions-to-access-RSNE-RSNXE-from-BSS-e.patch
> > >   create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-sup=
plicant/0012-Make-driver-capabilities-for-AKM-suites-available-wi.patch
> > >   create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-sup=
plicant/0013-RSNE-RSNXE-overriding-for-STA.patch
> > >   create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-sup=
plicant/0014-RSNO-Use-the-RSN-Selection-element-to-indicate-which.patch
> > >   create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-sup=
plicant/0015-RSNO-Use-SNonce-cookie-to-indicate-support-for-RSN-o.patch
> > Hi,
> >=20
> > This is a lot to backport for a new feature. Have you tried asking
> > upstream for a new release? That would be a better path forward if they
> > have important new features in their development branch.
> >=20
> > Thanks,
>=20
> Hi,
>=20
> Since we don't have control over the upstream release schedule,
> would it be possible to merge these certification-related patches first?
> Once wpa_suoolicant version 2.12 is ready, we can then proceed to remove =
them accordingly.

I think we need to at least ask upstream to make a release. hostap v2.11
was released back in July 2024, and there have been a lot of new
features added since then.

If upstream have been asked for a new release, and it doesn't look like
one is forthcoming, then the question is - how stable and well tested is
upstream's main branch? If it's in a good state, we could consider an
update to a more recent git commit hash instead of backporting patches.

Best regards,

--=20
Paul Barker


--=-NC3dGCs3C3qSpV59iMYG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCafnLSBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bkgxAPsFmvGzKqZoOlm4cqTaacNHW9EVaF8iuf3L
KXg5eUFuNAEAhPGWAlQ+vyC5TeLVJ6NJRG41GMYq6We0BP+7j8PLNwQ=
=Tub8
-----END PGP SIGNATURE-----

--=-NC3dGCs3C3qSpV59iMYG--

