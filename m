Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E6EEC43458
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 13:29:53 +0000 (UTC)
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9494.1784035789123935561
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 06:29:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=SN0dDXm5;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=D4WlHMFN;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.150, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 443E8EC00B1;
	Tue, 14 Jul 2026 09:29:48 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 14 Jul 2026 09:29:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1784035788; x=1784122188; bh=JFSvOrtejY
	Ukc6RXaLLhwPHhYn9UD1AgoO2dZty8aY8=; b=SN0dDXm5hngmDKzaSPuXZ6HVLE
	Afz9R8xQUQyt5aJfjX/u5yD+YX193YiH3PqA+aIe1GPl1M/BXBI5/vtZsaCnVSdi
	2HthThhW6A45cJ8C2CvvnuE+qaAwg9Db7GXGshCNNeaNpDQWMq+jfqoPCC9LuAfD
	GTEmLqc+rgrZtX0zPt4UbaBP8coJTPfxd9PUIcxJMiCfiGqJiEJ3iq401qxLcrQ9
	Gar071S1j7TavyavHxFhhf/jEd5cWjDiq3fRn+I+n/Q5koS7mLAqwdQCtcPRUpaP
	zIr76CjwmVIstBbcoJtxbfOatS6I3eTdsqBbmxXXJLXOVMQRGOPz13Ac5BAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784035788; x=1784122188; bh=JFSvOrtejYUkc6RXaLLhwPHhYn9UD1AgoO2
	dZty8aY8=; b=D4WlHMFND7sDvnYa8n1AyXbtSJ9H6uk8WGjNqQhx+CyIyakGrfT
	sJWG8TorogNhBE4ZHrtU6LrDWbja67FxEA+lxcfxquMGyXRubqRcq+acZWURvWfY
	l1RieJXDQergfp9c9AlzIOUYBkLY28XqxoeoJu44/UBWCQnTzruk48TxVynGC6jd
	sZDpVz7aqJaRDBC5Tn3mY5h1iMuckzWNKQ3Mw7icZNd7nlzdNjS8O3K/hCvwNarc
	I95rnVnKAJ3ovwKqTIuw92ji33l2aK8FUSN/M24Ej5oiRCEsmTwb2If6TMjIcK/c
	z8+Y4hBccYlG79ZqAlGvKXqKwV45zb4PGkw==
X-ME-Sender: <xms:zDlWaoFmdXeMo8-N2f3cQ8bdtRJzwAXBmLZBdmf1aFZHs4ts9Ghg2w>
    <xme:zDlWanUqlIzNLiCtTxB6xUj8ntX-q2dyvo5dnO6mJKarZxxePHBQxreBOgJGyJ1p5
    ifCHmXgI0sKOjPXbdwVPM7uSxR6BauNq6DWCHy0FM9oWfWpAjelBw>
X-ME-Received: <xmr:zDlWavwnYMcEqAQGktm1HZa79zoUY6RJ-EgOHiZLr0mBvND-w96W0VjpDXCxjZHVjIHgpQi44bM6Vf1P59DJr8jZUO4NYOAaQAHm1SY>
X-ME-Proxy-Cause: dmFkZTFR37yoYdNLSvsgdcdUvZ+ruwCtQ7tjVr13D8lBNdFTfi5uMXkSArl8rAJ2e8NYQY
    NAssP15Dof6tUTH9N27C7KrVu1BzMc9AXdd9PqBuIDd3xCerOXIjYS9KI+5YRDD0xsvRc+
    Ih5+j1fg3fxgMEECxHBgu5QxAZAsp22WGLYYlHQ4IbI0zy4Av9TbL3MPxSAw81QdH83ftP
    cKRPa+H37miU3+hO5ZFpZOD1lcYe3Jamt+1AHqaZe7fmWBSi6foufTePrDsINEWXZNbkVx
    t6YN3HP5LZKAkxrWIwvUrv2wv5OggfepGUZ9ou8TjebsLBgIN+aCcCRHGOwnWPcllZTJa+
    nxzyxid6z2ojglIj0NRNo7GdPvVbQTvbZHgqsuW5tokoBhc9T1zjrPEP2pxfNlpIiZoX2t
    u+q0HuSYuHNVXihesaRsd/wwr2Rsgk6U8/mgHFYAu1xAt9Wyk7F88PN0CAqZSenTYT/3Qp
    vI3vH6cANai0k67QoEjH7lypyYtVkUxLK9lGS7bPVc8AfA1CgHWbCR2bISmcZ+rQHzf9z2
    dIv5n/SgoQxrqjp6n6vnV7w5w9dJ1zPRq1dkGgwwgUu79/3Lz/THUyzh6EDND8ZmxOBrwN
    PrCulXHq6ZsxbxAqMX4pzAaWfyFiaM0wGotP4ieDMlseHEUw7F966a/QZWDw
X-ME-Proxy: <xmx:zDlWalO3B9SxPqw8MzWfKYuqs937-RW_ZXxcDXfHdu3tDZzQUY-BSQ>
    <xmx:zDlWag4eSBoqrKJ8KofKKwpyZ_LAFPAa_mmRygYaT9i8Xruqec-ZEg>
    <xmx:zDlWamNLNXK_3OvraFFd4toWNStFPksHte0k8c1vzg2Ig4ot759WSA>
    <xmx:zDlWaum9RLeRW8MlyUw7wxwL_QLXcD62VzOe2N6-l9S2nDTrkI7ikw>
    <xmx:zDlWaiqMJrYEzZxpxoiwwVFqZveBABNsn0v10YTGlvhTzm3-OSUfAsTK>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jul 2026 09:29:47 -0400 (EDT)
Message-ID: <41e73e08d277a3c95cb73815d9515e0e66f92f3a.camel@pbarker.dev>
Subject: Re: [OE-core][wrynose 12/18] util-linux: upgrade 2.41.3 -> 2.41.5
From: Paul Barker <paul@pbarker.dev>
To: Yoann Congal <yoann.congal@smile.fr>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 14 Jul 2026 14:29:44 +0100
In-Reply-To: <743ed34569e6c0db29b91a4e6035ace4a39bb55a.1783697455.git.yoann.congal@smile.fr>
References: <cover.1783697455.git.yoann.congal@smile.fr>
	 <743ed34569e6c0db29b91a4e6035ace4a39bb55a.1783697455.git.yoann.congal@smile.fr>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-hGJ9W8cq90saIy3BF+1/"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 13:29:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240892


--=-hGJ9W8cq90saIy3BF+1/
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-07-10 at 18:36 +0200, Yoann Congal wrote:
> From: Siva Balasubramanian <sivakumar.bs@gmail.com>
>=20
> 2.41.4 and 2.41.5 are point releases in the same 2.41 stable series and
> contain only bug fixes and security fixes (no new features, no API/ABI
> breaks), so the upgrade complies with the stable branch policy.
>=20
> Among the fixes pulled in:
>  - Several mount(8) TOCTOU / symlink hardening fixes (incl. CVE-2026-2745=
6)
>  - libblkid integer overflow in parse_dos_extended() and a use-after-free
>    in partition probing
>  - pam_lastlog2: fix libpam linking in the autotools build so
>    pam_lastlog2.so links against libpam (fixes the runtime "undefined
>    symbol: pam_syslog" / dlopen failure) [YOCTO #16320]
>=20
> Drop two backports that are now part of the release:
>  - 0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlink-a.patch
>    (upstream f55f9906, released in 2.41.4)
>  - the pam_lastlog2 libpam linking backport (upstream 5683ed6320e0,
>    cherry-picked to the 2.41 stable branch as c8d0af0421f6, released in
>    2.41.5)
>=20
> Full changes: https://github.com/util-linux/util-linux/compare/v2.41.3...=
v2.41.5
>=20
> Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>

Hi Yoann,

Please drop this, I've replied to the original patch.

Best regards,

--=20
Paul Barker


--=-hGJ9W8cq90saIy3BF+1/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCalY5yBEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0brrpAQDiA5Fs3Nv+f8mD2vQgZLcMBy0TX41HboaO
k6/JtuJs/gEA2qYSKZYH1u76qHbPFo6vBbWH78dKXJP8lx9vAOeh/QY=
=ifv2
-----END PGP SIGNATURE-----

--=-hGJ9W8cq90saIy3BF+1/--

