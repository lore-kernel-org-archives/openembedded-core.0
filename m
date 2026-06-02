Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1AA6CD6E4A
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 09:47:43 +0000 (UTC)
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21248.1780393653921567669
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 02:47:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=R5gFZ+Er;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=Kl8Pk7es;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.157, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 055291400190;
	Tue,  2 Jun 2026 05:47:33 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 02 Jun 2026 05:47:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1780393653; x=1780480053; bh=OdMv5TZWA6
	Q7zmykNTv1AjVRFlCHMlyUIB+353bWB8Q=; b=R5gFZ+ErTD//mutHHnkVVSKLIE
	KTTHw+TxRpvHVMLS1l7RVa6nI+xpRu7mZ3AAg4KBpH/F46OzrXjTRalDTszi0CId
	v15v5urjvvl6JsYsEMTQrXqxcbvVD6QBnYCuURC2UaFolQRoQh/8mRPNmWZz+ftP
	+8Dr3ri8m0f2+BJLZ7WF5IPBcjXtR5yJ22vuFSX+rYYN0DTKbWC+NFI53/g/aPDc
	rMhw3F70xvPqGKkVJHe0Eb4tkSMfiWXpCsv8rlEnUOi9ag5JWYhKGkj//Rhlub7Q
	iMVsLs5kHrdhMV9pMJTe6AaiJpm2fgegpIhCdm2GKhjEkX0hSMofVkJSe3+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1780393653; x=1780480053; bh=OdMv5TZWA6Q7zmykNTv1AjVRFlCHMlyUIB+
	353bWB8Q=; b=Kl8Pk7esNEf4znXqlqw8rt2ftexf3UHdaIOgVuYqleywJ4RxJx2
	TNEnl39yazbFup67TOwEik3CqjE1HltSW+5YQ9DTYFlaZ0UkBlY/8JfS8FHeZ8+y
	VffO5+nPGs9BJou1xVt78uBy0boG/9DYOYhdwLEvHfJxIDbrO4ECoBvye6tK1nIm
	Y8M8Try/LgYRNb4LsVnr84Z/d6Ciw4QpTQldgrxj6Rv9YmI+71DRu3DUlv5aTZ0t
	g3z1hJRDNljP6+gTT++ZleeUheuxVWpSRyjAukJaWfT47+lY40R/iqlteg+5cHoP
	vvv/OPQ19WBrBOiRw3beDvPX/+vr0xiKOOw==
X-ME-Sender: <xms:tKYeanZM-5AnBdKepVPBAUhHEuR-L1Ol0IYaM9-7PtXBgaGTFQYX5A>
    <xme:tKYeasYxDStvHcXeaOGZmvgA7bAB037ReSSe2Z05b5QYXjr2OoV5ptz7g7L09Z1tc
    M5TpfAhInWGjuUVUuIwIZWsHha6_WLvX55ze_9hlKfPX-RvI_cEex3C>
X-ME-Received: <xmr:tKYeankLJ_rwCP8uLZDFG6jB1Eht9_jYjH6cdrp56oaeVLMrTOkjWNu8Qsq5lt3EJohe_ZhPjyOxPeDR8X8VEbQworKZVcVhEWWMWlDlMbwe5JEp6aipAlo3ZFV212Gl>
X-ME-Proxy-Cause: dmFkZTFOQn1FwdeCLB5V0wRef100Rq3z56KWBHtfOalC2ILnlcGvmoMIltELOy/Ffpd6JP
    Lvd0o3sbEc2NaAQ7F3wNgIazJ1W21TF3698JnWpz3t8zvpFNgqwm13A72Fas5aafOnJPHu
    J9wZwkDxwKAu8RSlE7Ka6ghxQGwumch54JHkdCTtRc9re6+Fwmhiqe1psnaTgK+1LOgRFv
    6Ndsf6IFLXWB6QdgDsHyMaIg/PJJZtw1OJR4O9LLlMv0W5fDmcQgZ17FasUj2bc24FRg5c
    0yup8FlLK9tdGkZf9sQvLVVy2z2OwcqhM8+iXK/yEH6LCd2+dXCKfNRtq/2dIVdiivwMKh
    H9M5gB0wlwQXRlflMVvJX6QGuBR3lXbUFF5G3BAwM/J6+fNXEfCSajWeEGR06IkDrojfe5
    fV3LTQcQNLPvV6+VqU6HneGZeI7c02T+JhgVmq4dSpo1kTN3QEdUkySmAcOYjday24SpUa
    ez8pg5vYfx1p8AAkHTkpbh7CQmLtTzRMx9dl6TEYDkqF/t18x9AKdrwlwFVDAD2S+N2C9K
    9/v8BVRUECg3frTtnCX4xaBTO9ad37ozUEnCTaA2va5BP1D+Q5BOIwcM47Er1ltoMdMXQ/
    bMXjDuLaGsNmnsv12WOrsLr5GPes/4CbfjbNFJN550F89+NZgbNx3/3P5Xpw
X-ME-Proxy: <xmx:tKYeaozhVEDw4sgFZ5tHns0Rk3fBYzjNVG0XICjr2fCYZ-rkT4H8Fw>
    <xmx:tKYealNOnuXEOqNNa4cxomr_zpo3knaotVRLlKkIX_ueUAs6z_Ofcg>
    <xmx:tKYeasTW4crn0oG5gwfBtz0vREBvriuhzmuv2AdgKtv86APziWFKsA>
    <xmx:tKYeajY8YRnx2gxukxAJ2RIQ5P8OmhBA6UUpt37pes4t7x_Hy8MPgA>
    <xmx:taYeaqpciHR4qo_AJwiwzY32F7COnLbIDnKgcmE14_l8P9-SKkJVlEKg>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Jun 2026 05:47:32 -0400 (EDT)
Message-ID: <6ceb62e54b682d5245b840f464b234e255178ccd.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH 0/8] Licensing fixes
From: Paul Barker <paul@pbarker.dev>
To: JPEWhacker@gmail.com, openembedded-core@lists.openembedded.org
Date: Tue, 02 Jun 2026 10:47:29 +0100
In-Reply-To: <20260601181251.123019-1-JPEWhacker@gmail.com>
References: <20260601181251.123019-1-JPEWhacker@gmail.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-+1R1rBC+vJNAcd3sQ3dD"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 09:47:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238027


--=-+1R1rBC+vJNAcd3sQ3dD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-06-01 at 12:11 -0600, Joshua Watt via
lists.openembedded.org wrote:
> Cleans up the licenses on several recipes to use a known SPDX license
> identifier if one exists
>=20
> Joshua Watt (8):
>   mobile-broadband-provider-info: Fix license to be CC-PDDC
>   gettext-minimal-native: Use SPDX License Identifier
>   glib-2.0: Change from Public Domain to Gnome GCR Documentation License
>   python3-pyelftools: Update license to Unlicense
>   ttf-bitstream-vera: Use SPDX license identifier
>   sqlite3: Use SPDX identifier
>   pixman: Change PD license to HPND-sell-variant
>   util-macros: Remove redundant MIT license
>=20
>  .../mobile-broadband-provider-info_20251101.bb                  | 2 +-
>  meta/recipes-core/gettext/gettext-minimal-native_1.0.bb         | 2 +-
>  meta/recipes-core/glib-2.0/glib.inc                             | 2 +-
>  meta/recipes-devtools/python/python3-pyelftools_0.32.bb         | 2 +-
>  meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb      | 2 +-
>  meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb                 | 2 +-
>  meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb           | 2 +-
>  meta/recipes-support/sqlite/sqlite3_3.53.0.bb                   | 2 +-
>  8 files changed, 8 insertions(+), 8 deletions(-)

Hi Joshua,

I've reviewed all of these patches, looked at the relevant licenses and
SPDX license pages. All of the changes look correct to me.

Reviewed-by: Paul Barker <paul@pbarker.dev>

Best regards,

--=20
Paul Barker


--=-+1R1rBC+vJNAcd3sQ3dD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCah6msREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0btqdAP9q5+TITrO3WqBcc5FPHVetjUFZUuktA4SA
11MwNR+EWwEAwkhJiBOk6lWjUyEDneK84fz6OydYsjldusKiH5KY0QM=
=cLgB
-----END PGP SIGNATURE-----

--=-+1R1rBC+vJNAcd3sQ3dD--

