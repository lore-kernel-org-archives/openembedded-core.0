Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CAEDC55160
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 11:52:36 +0000 (UTC)
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9930.1785412349444853907
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 04:52:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=eo5j5QVU;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=JKI9wB5i;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.153, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C3AC514000F7;
	Thu, 30 Jul 2026 07:52:28 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 30 Jul 2026 07:52:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1785412348; x=1785498748; bh=yS3aNPCzHU
	XGCnr47KORd2Q9mSguYBwldSdGpcN0Pcg=; b=eo5j5QVUUAkFxKoBRxuhCiirzn
	WCmC7IrOIwqUJiRm5qt6zx00Pu0w4DnhxAWscJqwC3dkEyH5/BDHiHtc88nf5BWb
	uQeLA3L3fwjWc0Dp9T38WtHzzur1YiYb+aqHdgm7gEWwSquMnjkjlwuqwrozAEln
	2pZFfcN+f1xBeQ5gtsb+aSpnr+EzF5S2aduo/ldviDXAhjDQX4ZkRVWTHABu6qBV
	wnfCly8tfHhT1nzHO1eaZZ37MgBljLrIFuTy/lvmWfFRr3pifgRHLFnLln7eU/Z4
	pRwcLktPmVT3vRXpCBNM/3kFn6GY6fxqV+IQPeg55xL/v4foGQyzKuItUs3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1785412348; x=1785498748; bh=yS3aNPCzHUXGCnr47KORd2Q9mSguYBwldSd
	GpcN0Pcg=; b=JKI9wB5i2IXxm6HbxTZiUtsa1lhikYjCScdONW+nSL8iDRpvyoe
	RYpOP5YUNgwxupOb5ixt23jDltPGgotMRhpvPMAak9SlcR3St5KM8SNtpvBtP6E/
	USpRnVjFstD9w/skNR3pHbf0jy6CuYWmTQMBiofNZAQASJs0rM5FR6VFUODKPsiy
	QmfccsQVBAqjMP/54j/T3vgMrXX/OGeAfBDRJvyve8yPJCwLdUy6WQaqsKphUftD
	rqvfS+X+sTKTpkTICTGp8EocAqLZxVsZtcgKFNuPj1AZ966DDQtaXtqp6lFtxa5J
	vy+OLG2mH/vGPLWSvMcKOxNIZjYdo1QBgkw==
X-ME-Sender: <xms:_DpraoeSediw9zK0_CXb1Is6DJ4831uu3i6YwUDc4JDltBsoAwlTGA>
    <xme:_DpragNNcGRDeziKyD6GBrvwgl2P_uTmjzpywJNeQNC-oyBswoSQ_uNH2wdhIso4Q
    --ej0fqCberXUgG0WRu1jek7Fdz0YhIY5gMcjz3ykmQTO7Ji4PaXtbW>
X-ME-Received: <xmr:_DpranJyDnYBMXbK99vlOWI_wb2MP3eMnpLJMvzn7FaXrocJNjLduEHHFyCUPilKjaWyQ4LzUVF_GM8PNk0alr32pG7bPzAn3lM85LdgMdzI>
X-ME-Proxy-Cause: dmFkZTGcuTcQDwJqOQTv8nmVkc6/Zm874noLTCFexGTQqhDKnsGdDcPi/M4/0EY4QkKXHy
    Lt7rEBIPnNHrQftDd+YhSdCQzUNg/CHiiEMmqsSzYP1JSkzGoxmOW38kVE/hvKxOkUcvrt
    46ukXXGeUvqhMWZJRKjfj/83f/w1s4Q/ZZHw731KyBan3E/E58VX+ii/aGbw1h+VWeZ2qi
    7gAEAwFQr+DFyc96ACIjxcwh31Smx6rj4BEpztETyxBNEF0aLxLMtmICo09KtV298d+d+j
    MTHoz8DmeExX9JiqqFi7pQ9pFehz0bFzXlWgksw7DW4WYH07acWe+tGFlPodh9dNLAaVCf
    afwReK7dliFCW3BY8jgWR0X3M2BNmBsLE5CRxxQRpaGEEU7Ro32xcA53IILWSGDZd4Cmsy
    Zk+K3pcMvFxb8s4ElmgMm2+uiq8jJdV53puqPfYWau8cmPqe8jAE4/Cnvh31zFfW2APoRt
    95/XSFHwmoKmCKJw1N0voec/hZf+Ms5egQe58UyPnaVXBYPPyXfJko0EljaCx5sfTyaavy
    Fkn3IaEGOIhroAwANmF+rK7TaFKtgSRk61Kg2B9/BKcmXr+t0PgPkdsH0Cgm2+cRh3IXbu
    dsdo1n0uqQ9MkdDhLHm5KWuqnTtab62UTm9Dhb7N0Zxqy1P9LIDShZIG5ySg
X-ME-Proxy: <xmx:_DprapFv68OK0pPkGbZjo1Kx6V4aNNo_PGCHplzKw3PxqLaE3_Z46Q>
    <xmx:_DpranRE7XKpNm56ypXhC7wjkL20mKQRCry_P6wiy2yp-jgJG_rRbQ>
    <xmx:_DpratFIDmvlgJUFDODRgQ2eC89HjwuYhDjddfaWMsr-0vpK8hARzw>
    <xmx:_Dprar95waQqDkczG5WAu1EZy6qW1psm1oH8wisCiFHGDF8XMXCvPw>
    <xmx:_Dprag29N7t8jE5CJ4jSLhxDCeMHAv1TLKPSnZJpElPV3DvQEvbIfuy7>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jul 2026 07:52:28 -0400 (EDT)
Message-ID: <69f5608c9989dbcf3ce0049b6770dd7407881bc6.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH v2 2/2] opkg: enable sha256 checksum
 verification by default
From: Paul Barker <paul@pbarker.dev>
To: ecordonnier@snap.com, openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2026 12:52:25 +0100
In-Reply-To: <20260730091017.171702-2-ecordonnier@snap.com>
References: <20260730091017.171702-1-ecordonnier@snap.com>
	 <20260730091017.171702-2-ecordonnier@snap.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-oNV8k6iUKVmB1tHKOMJo"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 11:52:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242342


--=-oNV8k6iUKVmB1tHKOMJo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-07-30 at 11:10 +0200, Etienne Cordonnier via
lists.openembedded.org wrote:
> From: Etienne Cordonnier <ecordonnier@snap.com>
>=20
> WITH_SHA256=3DON adds no external dependency: sha256.c is a self-containe=
d
> 528-line pure C implementation already present in the source tree.
>=20
> oe-core already generates SHA256Sum fields in the Packages index
> (via --checksum sha256 in OpkgIndexer.write_index), but opkg silently
> ignores them unless compiled with WITH_SHA256=3DON.  Enabling sha256 by
> default makes those checksums actually verified at install time,
> improving package integrity checking at zero dependency cost.
>=20
> Once SHA256 is universally available, --checksum md5 can also be
> dropped from OpkgIndexer.write_index() -- MD5 is collision-prone and
> should not be relied upon for integrity checking -- completing the
> deprecation noted in https://git.openembedded.org/openembedded-core/commi=
t/?id=3De462f47489f35902b6972f9837d9adfa542fc796
> (2019).
>=20
> AI-Generated: Claude Sonnet 4.6
> Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>

Hi,

Claude likes to include irrelevant information in commit messages,
please re-write this one to focus on the relevant bits.

Otherwise this LGTM.

Best regards,

--=20
Paul Barker


--=-oNV8k6iUKVmB1tHKOMJo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCams6+REccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bs4EAQCpq4tFh+xJJ4y4rBeEDhVgo0aD5Ya3ls6P
JJx69NNldwD+NNUrKRTc2bKP5W7uxmLXTruaApForz2U8nXm9oh6Kgs=
=ZTpg
-----END PGP SIGNATURE-----

--=-oNV8k6iUKVmB1tHKOMJo--

