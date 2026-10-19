Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C5AFCCF2D6
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 11:09:52 +0000 (UTC)
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32023.1792408181798811084
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 04:09:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=jlsyCTJQ;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=Jhe6gpjH;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.156, mailfrom: paul@pbarker.dev)
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 07DF37A00BA
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 07:09:41 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Mon, 19 Oct 2026 07:09:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792408180;
	 x=1792494580; bh=RRO1o3DP/DScR0DlcCPAVVIgRo1MDpnbkqvJ2V0AQLA=; b=
	jlsyCTJQAsVB5B4seyGHiYEm03kXU5mzF+bLxSXuweIN/j7h2WBKSkiTaI+hJgdM
	BYDyF5GOT7L3MJ6jy1DvdmN22Lm9oPSKXi3uMUDILFmPtaNePRAu7AYNDebuhE6D
	l4/LAqSJt5qEVRFZwCpnNfi0k63eKpi0qr4BxFiugPwJmR5YouoSYGmfQin06uj5
	mH2dnl122Ahw4Jhd1uec9evtxy+wSDVYEASoICLN4Ci+RP5f1GAGVweZzEkfgJrN
	2y3E+OCv2FOCQz7ywEv1jADKidakWV1U3fw6kM44z2Nc/sjNd8n8ppgBj/Fw3Mev
	8j16lpWSByZS7Z9MUZQ/wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792408180; x=
	1792494580; bh=RRO1o3DP/DScR0DlcCPAVVIgRo1MDpnbkqvJ2V0AQLA=; b=J
	he6gpjHqV76YsUety2bBclQMoDRDPlb7RdgyIq056uRYVLTPAseV04QZNwpfhArm
	DvtCgP2EpjnjnnNZGUD3tBfYX61kLMTUk1MhoCcll4A0TGVq0YBUG4SDcPsHNdd7
	+v9BaJCjHWjRQbiTMqyCEyO14vxBUE3hvyCxwVFYn2x+uCbb8nWmytXq2hnbphen
	ITimHmMKRRq/XnP22RPgvkmBsdANvamXzZOpDuqr4LckYo9jz8IDFF4b0UyIx6d7
	9bi8Dxr/NM3H2vpPVvxkE5uHb8dVi1mKr5T/UPea/JoTVXazr6ZP4ev6ARpTo6A+
	tYfJcwm3CRJFpp5UUomwA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792408180; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:uHE/jOkJcRYC18rdZ7o0EHAVYrHYCdPLIKkmmONnijovka5
	gvIYj8RPMBDDeOPJS0/COiSNH6XMB4rTNat34C6+LYK71fVcec+TCCKQgryOemNm
	Uza3TNyyJ7UrN0kWnXYXlKjQ0TcUQI1Ej+lbax+x7TAmEVn7Jq1ZnpvQd5r3wM30
	9zE75DwCvMFY7HwGjbXynyYwZsMAf60UUubiWfWxdUH2XTBliegqJFMAevfllvN0
	vFuqs3QhW6/GfzW0n/JYf7bSCLXz3r2YD0cvnl5pswTOE6VOu5IXpKx06XpkCA/T
	dDf1fuenzi/9hlAS5Xy3tXkoHbyefF04X7q9KAg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to,
	user-agent;
Message-Instance: m=1; h=sha256:8pRO93ejCab6STcOwvAAS+OJHX9OwgxQ+7LFr395VJA=:RRO1o3DP/DScR0DlcCPAVVIgRo1MDpnbkqvJ2V0AQLA=;
X-ME-Sender: <xms:dPrVaozsEOzqT_dFc--KiART2T4fCVffX1nmTK3xIdNIsLAAZ2Oa3A>
    <xme:dPrVajRA-ZPQx9zqb_PKxbPa0OSzvPoGMTszBVcJCqbSHE_rskFu9Kmt3fRbP0cC7
    4dFnXE1XVrVpQli5yOzQPRWkIgyhrY39GoOXNzvLZ5FpzD_2UVzfnRQ>
X-ME-Received: <xmr:dPrVavUbqaadqbK54iXGDV7DFufYwRFU_WrMaRFkoMu7IcRgT1_HtXtoEAjKxam30dYukoh_jKp57Xc6wMq6lKHkdVc8rdCUaF0i>
X-ME-Proxy-Cause: dmFkZTEMAmKwE6xBKld3ZJUaT8AUEVIUMSgUG2IqXX7cbwAqIf2GOawupQX2oYQd9Mf1Eg
    rtFqn1u/rNkAXboeq7X4ks5fR58jv9LkAar4wLKW4JHtHEFNFQy82fPWlU93OGC3mnPQrE
    9TV+NaBzcq96bLmBSNg7vM4N4qoAR3WxsFb5VoY4J+yhYf+Yp3SJXw5LKNtqtLNVaoXENz
    jHU9axBryfTKlYH/hZr8UljydHhSH78qrJRhMKpRE1crioYUD3Zo1Oe9pZQh6AcXwTtrzi
    wuPcHqrHJ83FAYq34l217Vrqug6aUfzz/1pBWekhoj6tYAwX3EtiXmGADKg4lbqLxVxacc
    i1KbYoSrK2uR7LvLLSbO4ti0VGdF1Hk2o37VlBJVXYygTwLx7+GLOtCKaA80UUyQj4Qhd0
    o9T3LLtDE8hGlFJrmx1cSNd7AKET5mGViVBTl6R1GsvDuMNX3Ys+a+9aYJaH/wanY+2SW8
    idSVb8rOwnJYUxSYrNVuol//rdp2SVYjfKCJUVoNI4UlY+ywJTyB3FO7j3/j4JwsJ6NNQU
    8pu1A+IYkfRBPxkWzU7mdZLij75YPLKaK3gvh6xGxzSDdTbqpIYl2BxrdFUa9ANyGuImB3
    DdrCcT3MQOSLC3p1fAHfBvovtpNW3zJOdYSSCohcfPKvnN6IvxIOvBL0bmVA
X-ME-Proxy: <xmx:dPrValYTG_rU-k82AqlFrL6XnK_CcvSTKNxy6PbnoHBFF_6hJl02Xg>
    <xmx:dPrVal21b-X0PrW13E-3oNq2KY3AH0cQ5Quy6Ioq8eX1xkeO5FCKaA>
    <xmx:dPrVangU1DN52e3WTfuvSJj1X33-7BBBe4J_HcwcFriXcKo5r1gWDA>
    <xmx:dPrVapaaOxKeMcGR3LHuC8vN2HKl_9cyB9-HKpxI2cJVcE36wmcFGA>
    <xmx:dPrVaivhx8L3DPummcr3GKFyIpcT0YFBx4eLh9vTQg5qi7Kp8PY16i2I>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Oct 2026 07:09:39 -0400 (EDT)
Message-ID: <92b3723f22c7eaef6c21cedbde230c4eb3f3ee38.camel@pbarker.dev>
Subject: Re: [OE-core][scarthgap][PATCH 1/2] go: Fix CVE-2026-33814
From: Paul Barker <paul@pbarker.dev>
To: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)"
	 <hthakar@cisco.com>, "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "xe-linux-external (Internal Group)" <xe-linux-external@cisco.com>, 
 Yoann Congal <yoann.congal@smile.fr>
Date: Mon, 19 Oct 2026 12:09:38 +0100
In-Reply-To: <PH7PR11MB85988110C1425A7BD276918FAD982@PH7PR11MB8598.namprd11.prod.outlook.com>
References: <20260831061447.180612-1-hthakar@cisco.com>
	 <7ceb1874bae6aae6c4bb27b948a38c1015960739.camel@pbarker.dev>
	 <PH7PR11MB85988110C1425A7BD276918FAD982@PH7PR11MB8598.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 11:09:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248157

On Mon, 2026-10-19 at 09:52 +0000, Hetvi Thakar -X (hthakar - E
INFOCHIPS PRIVATE LIMITED at Cisco) wrote:
> Hi Paul, Yoann,
>=20
> Thanks for the review.
>=20
> The go.mod, go.sum, and vendor/modules.txt changes are not required for t=
his Go 1.22 backport, as the upstream Go 1.25 commit updates the entire x/n=
et dependency to revision a9171bc8 [1].
>=20
> For Go 1.22, the required security fix is applied directly to src/net/htt=
p/h2_bundle.go [2]. The fix addresses the infinite CONTINUATION frame loop =
described in the CVE.
>=20
> Updating only the dependency metadata without updating the complete vendo=
red x/net source would be inconsistent. Since this is a focused security ba=
ckport, the dependency update is not needed.
>=20
> The additional validation-related change in the upstream commit is not ap=
plicable to Go 1.22, as the corresponding code is not present in this versi=
on [2].
>=20
> References:
> [1] https://go.googlesource.com/net/+/a9171bc8c6f19c50efad8880f96e361359e=
d5307%5E%21/
> [2] https://github.com/golang/go/blob/go1.22.12/src/net/http/h2_bundle.go

Hi Hetvi,

If you've checked this and you're confident that the go.mod/go.sum
changes are not needed then this patch can go ahead.

Best regards,

--=20
Paul Barker


