Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A73CC44521
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 07:40:11 +0000 (UTC)
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4034.1784533210307490615
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 00:40:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=HATiBxYt;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=HWdGpu61;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.152, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 44ECF140003A;
	Mon, 20 Jul 2026 03:40:09 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 20 Jul 2026 03:40:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1784533209; x=1784619609; bh=595DKn78pf
	lTQFiNuKKvijgNZWAu/DsmhpOI7zTeaM4=; b=HATiBxYtUqWjm9R/wPmVJ+uo9s
	3FK4zNRs6twp0MOU0f+oErcwamg1SASHw2TO48JQbXyF4+MRqf/CuRmyj/ox00/4
	jJH2J+GAadhkqplLOuJUOqhcP7g5Yq91Z34oIznD8XAZwPfAfz0boMyM5tTcPTl+
	ox2wh4LWqOdA+NrgAQz6bGIqo4EXvuCSt1UFtITXBzNYSzAxM2oujCH0Fe/Rnsht
	gDDthXgbQ4Gw9M4D52tVJMu4ZgwhrigFPqJZ/OKgh94SEXveId0Zke55C4ZjTauD
	oCaz7Pq8nTwHc96VZ+vbicbIb2EUDsATiDfUkfpOSMkgX9PiXtYJrMkQj82w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784533209; x=1784619609; bh=595DKn78pflTQFiNuKKvijgNZWAu/DsmhpO
	I7zTeaM4=; b=HWdGpu61XQpVna9mm1cniKFwsQkRbhQJ7lxLHOomVyLXWYaoC47
	Bed9g7RpLcy5oXQE1WQEw1QKQjsWfKzyEx1fciJhiOqFi2Y+CwFKu+zlcU1k9nbA
	ZLGMBeWYIyz660RHvQiZml2dz8ii3bn6TqAxA7rfynE3u7391xTduLqgqM8sWhd9
	aP9PKONhRzkedRqva7/RMt3AJy4OqgF9GasiYIopem1aEQI5FpVOTDs3eRynBoC2
	Ui7WuoRZbE7kImQ604cFkCBmB4hT3j9Df0bL4O0YjkNYq4KWMiOiY17s2fGC5tcL
	JOLBcUFIabiV3QWlb7YfAOoMTQw22cCMXPw==
X-ME-Sender: <xms:2NBdamfbVNWY0OAZg2xIlD0cQoKnfZ8TdJK9vJ0CAZZR0KO15noTwA>
    <xme:2NBdanrsBVma0wWevEc9fDWyEY08rFj9uX2_T_nzlPOEozcXf6W2VVCM0lkg1E0N0
    ao1ePG6uswxe0LvSI_9uaExL4BXmDREMzRfyE9askkWdCWIMYVr>
X-ME-Received: <xmr:2NBdak5U8TqZoOsNfFNlr-EYcwMBaRDrM6_dmL4HeMeNgxeJPbFTfoghVXf3Poj6W_CsFZoJS6_EwLJ38aUIym3jtXpl8C19d6e6inu9gP1z>
X-ME-Proxy-Cause: dmFkZTFNJNjEjiVMsI6FCjG/PNwik6wIqAB5PSYgwIXPrWl+O3sA6Ngwlg6GcvzAsgUtG+
    z7jmhYCGb2w+XDZWmhqVDJzd1Sw8Mh1EyadCD1+GlLS9EKFyKCbvcJn3zL1sYGJj97BD5w
    sVD53/B78z5pbWcCSznUxI/SdHRr6KKnUIkrN3oxYIPpWZ4Z+s5ligc+ApRJZUvw3XwcLj
    wKuILch/rdoV308D2UvYFLq1Vs9qQPI/mnFkNpLadHMOa1Z35mK7GPSqxk8njLPMy/qfkz
    +u2/wjbl4tArPKEajD7+XE4fLm4EZ1OMHZLASIvkGXsmzkMfGtrfwqJ8M382FA+6oQXxZv
    Q+vYCqxr9YWND+m1v1odLrnEP7V0InJ0MNzOpUAkOpTvQE55C65gPDV5HfTix4cbLn0KZw
    DAEVRutIktas0PRjsYYbMf4LmAPBfjRYTLVfg7wnWwpgxAaEnbiRrJUstXFIJvWGPhAZe4
    q5LI+ExcsOPrnz2popIfyMWJUrwAvzyQrAs0Mm9LUTyDbGBm8wM6G/MLFAVsZlXrAaOYg5
    LTLfjT7BUZv1tS2IbObv35M6v3XulPOpa0rN5UaLcTy7Y8Ixlst0SCUCYCEAhEj+3ZrKcO
    KIjsbdbvPQdoJokF87SNUrEFUscFMkPszB4kYE96RffJ2l0SIgKADF3mWpuA
X-ME-Proxy: <xmx:2NBdatp8MS97eyqcFsz6fk6SnWONdv7IimPo37GSSbJIGDa6ItcjlQ>
    <xmx:2dBdamiAlx1lKejspI-eDi1aHKMInnZsUW6GkYWrC3xM816or-sb_A>
    <xmx:2dBdanKdUFGdwKK1RUNvN-SMM0pfshhxWQny-xAP25IhXTi5a1Y7oA>
    <xmx:2dBdamB_snu5NlyTUR-fTLi3Z8Kep5t_dyukSFh4EujYdDIYAfoimA>
    <xmx:2dBdau_dARY4_OTPkPPV8MBDaJS9rUyq3sSVpo9vLYqqN-10CmpaJNyb>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Jul 2026 03:40:07 -0400 (EDT)
Message-ID: <c791b1b82e236039c614ab41402844c965fdc6c5.camel@pbarker.dev>
Subject: Re: [OE-core][wrynose 05/17] kernel-fit-image: Add
 KERNEL_DTBVENDORED support for FIT_CONF_DEFAULT_DTB
From: Paul Barker <paul@pbarker.dev>
To: Yoann Congal <yoann.congal@smile.fr>, 
	openembedded-core@lists.openembedded.org
Cc: Ryan Eatmon <reatmon@ti.com>
Date: Mon, 20 Jul 2026 08:39:59 +0100
In-Reply-To: <1b6dd4f66b2f4c1a12791a1db3a53729ce043fd0.1784364567.git.yoann.congal@smile.fr>
References: <cover.1784364567.git.yoann.congal@smile.fr>
	 <1b6dd4f66b2f4c1a12791a1db3a53729ce043fd0.1784364567.git.yoann.congal@smile.fr>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-hGBXXS6GyAzmCaqxmcm2"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 07:40:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241330


--=-hGBXXS6GyAzmCaqxmcm2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2026-07-18 at 10:52 +0200, Yoann Congal wrote:
> From: Ryan Eatmon <reatmon@ti.com>
>=20
> When specifying a FIT_CONF_DEFAULT_DTB for a machine, you have to
> exactly align the name with what will be in the fitImage file or you
> will get a build error.  If you also turn on KERNEL_DTBVENDORED then you
> must also specify the vendor directory as part of the dtb name that you
> want for the default, but you must manually do the same mapping that the
> kernel-fit-image class is doing when it generates the fit-image.its file.
>=20
> This patch just adds the same logic to figure out the value for the
> requested default dtb and eliminate the need to understand the internal
> mapping of the class.  It should make specifying the value more
> intuitive.  The same value that you put in the KERNEL_DEVICETREE can be
> used in the FIT_CONF_DEFAULT_DTB and the new code will correctly honor
> the KERNEL_DTBVENDORED setting.
>=20
> Before:
>=20
>   KERNEL_DEVICETREE =3D "
>     ti/k3-am62p5-sk.dtb \
>     ... \
>   "
>   FIT_CONF_DEFAULT_DTB =3D "ti_k3-am62p5-sk.dtb"
>=20
> After:
>=20
>   KERNEL_DEVICETREE =3D "
>     ti/k3-am62p5-sk.dtb \
>     ... \
>   "
>   FIT_CONF_DEFAULT_DTB =3D "ti/k3-am62p5-sk.dtb"
>=20
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 3bceb2dabeee13c0a80ddd74ea7ae991606d6772)
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>

Hi Yoann,

This looks like an enhancement rather than a bug fix. If there is a
strong reason to backport it though we could take it as it's small, self
contained and not invasive.

Does the previous syntax (FIT_CONF_DEFAULT_DTB =3D "ti_k3-am62p5-sk.dtb")
still work after this patch?

If we do take this, should we take the accompanying test case [1]?

[1]: https://lore.kernel.org/openembedded-core/20260706221933.4026508-2-rea=
tmon@ti.com/

Best regards,

--=20
Paul Barker


--=-hGBXXS6GyAzmCaqxmcm2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCal3QzxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0brQNAQDaKmtHGGXJQxFm4GDCLhOdxoDazgbBpOkO
7sUr9GNLlQD/TYqQ5KDpnY6i3Y+Lm87ZzwhGhf0fGjzpAqR52hjoEAI=
=6xc/
-----END PGP SIGNATURE-----

--=-hGBXXS6GyAzmCaqxmcm2--

