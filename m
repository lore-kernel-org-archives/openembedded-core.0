Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F254CD98D2
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 20:30:16 +0000 (UTC)
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.370.1781641809757585240
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 13:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=rSHRi6l/;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=XlEm5qRQ;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.159, mailfrom: paul@pbarker.dev)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 662807A0179;
	Tue, 16 Jun 2026 16:30:08 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Tue, 16 Jun 2026 16:30:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1781641808; x=1781728208; bh=Q9SrwSXwhA
	JYBJiao0khMwCRlk6svMsn0fDXI0mgalU=; b=rSHRi6l/vYYnAttkTiRxQHqERw
	CkFP/QcUlbxyst2Dkg7l56TEQUcfP1j1k5i0b/zaKTE4JVkZEIDZoIwLX8rrqe1o
	KjJCIxogvWllA319dlBNC0Vzky5OC61jfbsCzAxZQnn3OOzuLMgkmputfHRIYTrk
	V1jW5zLnkWVUqQewqE6eMDVtSbYkvlZ4YW16I2Vb2wRbaq5xgANVVVaNAvhdVJHv
	Qc39Ll3Sh3Hr4uQ7y//WVsf3JONa8YVu3Lj9zHdl+ZRn9fWj5YG6bDiiKHP0Xx8W
	0na12L+GoGCm5ohyvjvaWqYj1KqB2IqZgWpM7MUTK9UGptHelIMULBGMicfg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1781641808; x=1781728208; bh=Q9SrwSXwhAJYBJiao0khMwCRlk6svMsn0fD
	XI0mgalU=; b=XlEm5qRQFR5Kp/VixFJep/cHpQLm8gvOZfFEDPnyScE+IEaMmJz
	g2Fr6bm+CHY8devrgvJSdLNbm2tPC7SJuUH75J+EhLuV48upFAKNjqg+DmryX6Tl
	LB10VIp0QfIQjuQQG58yJo6x8Vy3ySzDKMrHoxhYby8PIT20EOa40oGgvPJy/2NU
	ww5/dl1FZjPDrY1AQFp2wv+CPa3NB0o70JdgKs+Cp5PQF11WX8okJJn7PTcgVIyU
	kIOsldJWt+ptWrZNKjMbrYL1cKITY20qzEqfNUV6yifUUjNiERcEAwzB+gV1EcVJ
	yaIAam+EzKpcDXtNlmlI+wSYDbsHPMeIn2Q==
X-ME-Sender: <xms:T7IxahfWBXjnBatUMDyvY9iWa2b6X4fBDZUJRHY0_XdVcCQrs3JQyQ>
    <xme:T7IxalNxnIC1iOi-imiUNbbIfXcwWfC1FWaH0iNSlVnv4A2OLA9guZoeKyD6oamcp
    olxO1a-wKU6OgH9BBIxkO4GOv6r8aaqiumzgd65E7snSjgMTNbdMRA>
X-ME-Received: <xmr:T7IxaoLIOfcFrvdcfs672XEN9NseaPxQIHsYqjss3PYEpMBEP9q8okrzJPB2Bv2EOB_f-5jBA7yz9vr7C2MFEqwGmdGA9eRUtaQP1fYWQotT>
X-ME-Proxy-Cause: dmFkZTExmcSPk+B4ta7IYu+CNJYYO8imkWHvFc/4GcxJ3UB41qpz8efJBxwPOYfXyB3JUI
    yeXDVxqtLioKtQG7qI0a3qlsIEs1gwMwObCfhik0m9SKJUT9o1jLTRmtqLapYs9kOxmziC
    uhsTF4Pfzb8L3yV8ytA0EI3siPjVclODWAamggyN0qPWb9c3F6swbvKQw9MgoA1tLv/LJo
    RaZ1G6ZAqkzYZzKNI0s2EyGaIjnPc7j9xn7z+q1foR18TaOxKIpsRZnNgzSjfO7gf98+yM
    YLM3iPMRpJc9Nq+WkifhUc/Qxy+3uWqVtTovrkfWGzt29s4l3eJiq4e5+A44UmlE0M7GaU
    YWGjas7zr5Ew+wSGhgBSVz4jexkeCRAxWWy1Lm9kRgy5D8Byl84GtIutcV6Wj870dq5iKd
    ErCON3fuOZ66h8eszGBLijR3IZuDpYZLPOhUpN299RZr8X35ncrCk/TPUTCRy5RMAgbn+v
    EvRVC2HNvGv9lG17GS+ndcBTm+ORvKKJbMQlLmJCB9KlpRtkkrZHgZm5lk7iOz6cEE1bHI
    xEMMqBic7Lhw0PR3YWtFxfVxSjqOk1BueNVNmukHz7RXN1QnQapcTOVXYjr2kF5dEVSFpF
    NrQQ9DpIM2Mu35rQNXb0GlzI9btTFAbFh4daNMwCRGTz+ahiGgX34lznGTIA
X-ME-Proxy: <xmx:T7IxamF0cek8p1xqm0VPh5cvAZRfLX3Agrx-7h4OhBLDsceK2wYSzg>
    <xmx:T7IxagQxEKVmZ3zFLGQ92mXs2qvYBhIRVxCved6qk4PiQKV45ZxN9g>
    <xmx:T7IxaiFiNhm_fXVqrcNRgNJ5bMQzx8K22GHAYFuYdiMWUNYsL3tJQg>
    <xmx:T7Ixas8gUoiVKviFzWgtaI3OxG21a9TzMkwhtOztpaIGCTUVOuNQ3g>
    <xmx:ULIxamOVnUyJf6hIUojFkZ7Z5WVzhWZWjTmoOxdsAOI6-jFWZ4h6DNT7>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Jun 2026 16:30:06 -0400 (EDT)
Message-ID: <c00944a7d36d2836e7dad02aa060e57d8ad5215f.camel@pbarker.dev>
Subject: Re: [scarthgap 03/21] nfs-utils: fix CVE-2025-12801
From: Paul Barker <paul@pbarker.dev>
To: Sudhir Dumbhare <sudumbha@cisco.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 16 Jun 2026 21:29:58 +0100
In-Reply-To: <82309.1781595813770605230@lists.openembedded.org>
References: <cover.1781270474.git.jeremy.rosen@smile.fr>
	 <33321e687cf18e03bb1d824d58214d758b02078f.1781270474.git.jeremy.rosen@smile.fr>
	 <8dd3e431cafdd364285eeaa79bf89507a4f4c6a1.camel@pbarker.dev>
	 <82309.1781595813770605230@lists.openembedded.org>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-QVESsBI3T96rfUYiln+E"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 20:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238961


--=-QVESsBI3T96rfUYiln+E
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-06-16 at 00:43 -0700, Sudhir Dumbhare wrote:
> Hi Paul,
> Thank you for pointing this out and for referencing both the original ups=
tream commit and the RHEL backport.
>=20
> When applying the upstream change, including prerequisites [1][2][3] and =
the fix [4], as noted in [6],
> we observed the following compilation failure on scarthgap with nfs-utils=
 v2.6.4:
> nfsd_path.c:322:17: error: implicit declaration of function 'nfsd_run_tas=
k'
>=20
> Because of this, we backported only the required changes from [5], specif=
ically nfsd_run_task() and
> struct nfsd_task_t, to support the fix. Non-essential parts were trimmed =
to keep the patch minimal
> and build-safe for scarthgap.
>=20
> Please let us know if you would prefer us to align with the full backport=
, similar to the RHEL approach.
>=20
> References:
> [1] https://git.linux-nfs.org/?p=3Dsteved/nfs-utils.git;a=3Dcommit;h=3D7e=
8b36522f58657359c6842119fc516c6dd1baa4
> [2] https://git.linux-nfs.org/?p=3Dsteved/nfs-utils.git;a=3Dcommit;h=3D42=
f01e6a78fed98f12437ac8b28cfb12b6bad056
> [3] https://git.linux-nfs.org/?p=3Dsteved/nfs-utils.git;a=3Dcommit;h=3D51=
738ae56d922d4961e60dad73ad1c2d97d8d99b
> [4] Fixed by: https://git.linux-nfs.org/?p=3Dsteved/nfs-utils.git;a=3Dcom=
mit;h=3Df36bd900a899088ca1925de079bd58d6205a1f3c
> [5] Dependent patch: https://git.linux-nfs.org/?p=3Dsteved/nfs-utils.git;=
a=3Dcommit;h=3Dcd90f29257904f36509ea5a04a86f42398fbe94a
> [6] https://security-tracker.debian.org/tracker/CVE-2025-12801

Hi Sudhir,

It's true that upstream commit cd90f29257904f36509ea5a04a86f42398fbe94a
is not listed as a prerequisite in the Debian tracker. However, reading
the commit message suggests to me that we should backport it fully as
part of this set to ensure that we're fixing things properly.

Thanks,

--=20
Paul Barker


--=-QVESsBI3T96rfUYiln+E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCajGyRhEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bgdvAQDBQxCD0mg1RZwr1l70o0wuguNkKdK4ppEQ
vkiOetNDWQD/UOyWdnO8i2vKf+If3ZLTFMSr6DxTAPqXZL0iI+NO8A8=
=uVwT
-----END PGP SIGNATURE-----

--=-QVESsBI3T96rfUYiln+E--

