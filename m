Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6986CD98C5
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 09:31:53 +0000 (UTC)
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.125845.1781515909597230805
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 02:31:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=OeTMmppe;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=JievcYOQ;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.155, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 5EC967A00AF;
	Mon, 15 Jun 2026 05:31:48 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 15 Jun 2026 05:31:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1781515908; x=1781602308; bh=qm4sFmyd6E
	wiUGiH8ZSy11Or7q1qJhxNdQ80b5C2BeQ=; b=OeTMmppeMM7qpbkRwC6NegVxVy
	bL1Q36jqcMRj2f1xxy/gPtAgLn0Mq6EG7jmQTB9PjN95zMoEocNvDV8stAR6Dpl6
	hjIKAE6OHxcy+iaIKc/malVFLevfnFnohM0dKrCnKGcS1XCWSw5xIQqs13DYMH7U
	cr6G8/0suk6EXqeGbHcWwivPbxGszfmcE9JCenJCUucyI9Behg36z7B1GnvRsLGG
	MeoncIMllN59JP8lYg5JpxLWY/nFD1rnDtMjVopBOOU6MXsAwTWvCJzrprVTc2+y
	LL5ZoCT047IxVLAIWulGFtqxPdKqLL7JV7tVcoCVZisKGpO2ICMTAALR54eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1781515908; x=1781602308; bh=qm4sFmyd6EwiUGiH8ZSy11Or7q1qJhxNdQ8
	0b5C2BeQ=; b=JievcYOQclc3cr11vjaY4nydz2oCwcgnnGSAOqUaFyFo/dKB2rN
	ejppFuW2DKIw/pqwF4M5qvxLUBumSuJZCrWrHG1BT2TF53o23GnuKvTWSIbYE5Xl
	zm0lBCvN7P4G6KFwEQBw42Nv9IeUAd4zAvJJ0JYqHtJfNBZxWdkf6288Me04IL7v
	+XiAMFPZVFpiBbTMPuwa7GExwVGgOWYPLS5QS94sDjCTXznJIMyGlC/dU8gxHlbV
	zcxUP7ONWo53SQvvN7+sg1AOvnziHJU4+noHXOapHWA//VE/7mNA835jVZcz0Njh
	hS57e9Pk7f0fv7lP7JvQDgEextSNssaDGTA==
X-ME-Sender: <xms:g8Yvaib-bYq0ekzL8cng7xn7ML0axhcPH-3wMJcbqA59VoK6dTLtBg>
    <xme:g8Yvarb5xtoO3tN0bjfcc1kVvYL7Ww5OEJAIcftVw0nbKYOpTpbht9xmLlhsmsCVE
    Y9pM0OA8EUhI2T3bWihtiqxLksyn1Wx3YJWi7d43fs8FL1hZLs2Eg>
X-ME-Received: <xmr:g8YvaqnMIicdm8KQLopdQMz6XlZiJWwyj05MTKCKytAosMvYQGrhz1FdX2VLaGBZH88cmilL-d7FP3ZBrn_6Jew8OF3vXLNmJ4o1bR7OZ4zK>
X-ME-Proxy-Cause: dmFkZTGaVP1SUaxOAimUl71Hw5lG1T9/0VBqPivbLADA0IwWJ7bvL0oqAPW0TBeQmpMVly
    OH0FfZx+/nMwdMQQvT3DZhDDqHQT34FATPbVfNips4fXZndsk98gH+quetJ1K6+CXjKOIn
    IIADFpknni24+0lm0s5jCTfiKreapmyMWzZfQekneD7Kn6e8uEYXdMasqz2iuEFaOyDkks
    wjNfdHHReU9fa5XGZGugP7PRA7Sek5o6SUR4yikkoV1o4JFM8QfBUBRvufZwW/J0PzIouc
    4A7MplBEnVhJ0biTMpCTBXZ2tSD0t5T1Ioz65JQP+2y9wJ5+7OW91TwfCLCmfb7PlP32i2
    ccCBpTV+COCoQg25gwrG0xrIXbaTv/z0dFNVUNqnE3X8zTuvTrApTtnmYcmPH5nmRo6P0q
    UNcqMgsOW/CeP+yzcagBlJ/XcDbWnOK5t91rWlC1sCH3qPZhJv/YyB8Sxea3Cdq38zmYyN
    tCACtjwz0qzkmV3JMcB342Ffui5vsWMe9P559y6EwOPTVOGNhb/ePzGh7/xOQezBCkUWuL
    1+4ojm6csgQd46L63+gjhXvdVDN8hgKLGg9GJ+yooKHX9hjnkcsmtswnjxWU9rUov3+YtL
    NZbqjeWJGzlk/OO2Py/PnXjFc19/e6yoecLcB17zqIZmeR9/6P2NtXFtSpgw
X-ME-Proxy: <xmx:hMYvavxCV0-iddjqEzJZJN4GtFZVAmuVW5fblTLAv5hXQO3zkX7w_w>
    <xmx:hMYvagNrbGDCI6OXYo3SrVWq32lAOBZPisWf4WBGWIfsCxQ4LJOCyw>
    <xmx:hMYvarQtqlQdavHmOicNRXvOcUxITcupLF1IiAsnwkc2jLK3kdfuzw>
    <xmx:hMYvambgCQfl2fa3ku8Y5oJABlbST70xZhOV6rjNss3vke7jxJABJQ>
    <xmx:hMYvas9w25_y7yx8l7Z4yq36az6i4fS2N-1uMwJ4S_xUJe9aD0zJyMtG>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Jun 2026 05:31:47 -0400 (EDT)
Message-ID: <9ad4e8d57fb4019724138852b6998ffc484420c4.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH] systemd-conf: make KillUserProcesses
 configurable via PACKAGECONFIG
From: Paul Barker <paul@pbarker.dev>
To: clopez@igalia.com, openembedded-core@lists.openembedded.org
Date: Mon, 15 Jun 2026 10:31:41 +0100
In-Reply-To: <20260612135641.391245-1-clopez@igalia.com>
References: <20260612135641.391245-1-clopez@igalia.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-5DbR0+zzQKUBEuLn3E5t"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 09:31:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238828


--=-5DbR0+zzQKUBEuLn3E5t
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-06-12 at 14:56 +0100, Carlos Alberto Lopez Perez via
lists.openembedded.org wrote:
> The logind.conf config snippet installed by this recipe unconditionally
> sets KillUserProcesses=3Dyes, so logind terminates the whole session scop=
e
> when a login session ends. Among other things this kills detached screen
> or tmux sessions on logout, which is surprising on interactive developmen=
t
> images, and there is currently no recipe-level way to turn the policy off=
.
>=20
> Add a 'kill-user-processes' PACKAGECONFIG option, enabled by default,
> so behaviour is unchanged unless a distro or image opts out with:
>=20
>   PACKAGECONFIG:remove:pn-systemd-conf =3D "kill-user-processes"

Using :remove should be reserved for exceptional cases, not recommended
as the normal way to configure things. So perhaps we need to invert this
and have a "no-kill-user-processes" PACKAGECONFIG.

>=20
> Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
> ---
>  meta/recipes-core/systemd/systemd-conf/logind.conf | 2 +-
>  meta/recipes-core/systemd/systemd-conf_1.0.bb      | 6 +++++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd-conf/logind.conf b/meta/re=
cipes-core/systemd/systemd-conf/logind.conf
> index bf7f6920fa..25f01f3fb6 100644
> --- a/meta/recipes-core/systemd/systemd-conf/logind.conf
> +++ b/meta/recipes-core/systemd/systemd-conf/logind.conf
> @@ -1,2 +1,2 @@
>  [Login]
> -KillUserProcesses=3Dyes
> +KillUserProcesses=3D@KILL_USER_PROCESSES@
> diff --git a/meta/recipes-core/systemd/systemd-conf_1.0.bb b/meta/recipes=
-core/systemd/systemd-conf_1.0.bb
> index 60066cd60a..55bbeb69eb 100644
> --- a/meta/recipes-core/systemd/systemd-conf_1.0.bb
> +++ b/meta/recipes-core/systemd/systemd-conf_1.0.bb
> @@ -10,8 +10,9 @@ REQUIRED_DISTRO_FEATURES +=3D "usrmerge"
> =20
>  PE =3D "1"
> =20
> -PACKAGECONFIG ??=3D "dhcp-ethernet"
> +PACKAGECONFIG ??=3D "dhcp-ethernet kill-user-processes"
>  PACKAGECONFIG[dhcp-ethernet] =3D ""
> +PACKAGECONFIG[kill-user-processes] =3D ""
> =20
>  SRC_URI =3D "\
>      file://journald.conf \
> @@ -28,6 +29,9 @@ do_install() {
>  	install -D -m0644 ${S}/logind.conf ${D}${systemd_unitdir}/logind.conf.d=
/00-${PN}.conf
>  	install -D -m0644 ${S}/system.conf ${D}${systemd_unitdir}/system.conf.d=
/00-${PN}.conf
> =20
> +        KILL_USER_PROCESSES=3D"${@bb.utils.contains('PACKAGECONFIG', 'ki=
ll-user-processes', 'yes', 'no', d)}"
> +        sed -i "s/@KILL_USER_PROCESSES@/${KILL_USER_PROCESSES}/" ${D}${s=
ystemd_unitdir}/logind.conf.d/00-${PN}.conf
> +

Note that KillUserProcesses=3Dyes is the built-in default so we don't need
to set that in a logind.conf.d file. To disable this at systemd build
time we can add `-Ddefault-kill-user-processes=3Dfalse` to EXTRA_OEMESON.
So, I think we should handle this in systemd instead of systemd-conf and
drop the logind.conf file from systemd-conf completely.

systemd-conf should remain fairly lightweight, we don't want to turn all
systemd runtime options into PACKAGECONFIGs for systemd-conf or things
will get out of hand.

Best regards,

--=20
Paul Barker


--=-5DbR0+zzQKUBEuLn3E5t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCai/GfREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bsahAP0fYFcQlt6PVBtQBxU0LH8MHNphJqRURHO8
FHG9MAt+RAD8DeBNmGXFIQWbnqAaY5AfRpbZFqJxBrVEb8RnVQJThgA=
=0DIy
-----END PGP SIGNATURE-----

--=-5DbR0+zzQKUBEuLn3E5t--

