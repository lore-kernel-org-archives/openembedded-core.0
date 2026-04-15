Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB27F41984
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 09:35:41 +0000 (UTC)
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15019.1776245741109304834
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 02:35:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=d5icrUik;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=JSOuS3XW;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.154, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3E1891400156;
	Wed, 15 Apr 2026 05:35:40 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 15 Apr 2026 05:35:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1776245740; x=1776332140; bh=pb7KS5l+mi
	GzVG0+woNSsmin6871FF3fmxgVuRP8wLA=; b=d5icrUik7F46t2k1TeNJGgsGY6
	KmL5Kdi8GTWFfpffH+uUPozJC2c2W7L86rkcK3mZBoon5XbqiUZOIKTopbx8Scqy
	rtEvU4cnQRpdsSz431wlx9joFWRsRyNlYmuYEbl1AFMSMeRmdPXHyJAJ2WAV7BEF
	/2fD402s7XDkjL86qie5qChhoxztcHm7GcvnpClO4cyaZzNU1oe3/qr2SlhYauQu
	6xg/Ulum0VNLM42f6a0nSmefVWNju2vWbFsU74nNfP+Mo3L8syp4MMf0Tp5BsOSK
	PRXhcnmf1YeoYRtNf7kjLJB8MJ1EvwPPUOOC+ciK16UKClTt9++PQrqLwrkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1776245740; x=1776332140; bh=pb7KS5l+miGzVG0+woNSsmin6871FF3fmxg
	VuRP8wLA=; b=JSOuS3XWVWFPDnRGNNz1uJ5EYUumENBa/qbHItV8skpT4aIbdyW
	ug88y8j3MOc8bR6eeJmDsXCMH2eQV2qot/+XXy/I78OBBXXkGVms5eNh3LIGXFmL
	FDzf+wiWdiUlBANDpw+idbu+6V3FyrsyRYiFgHrf9jPU5G5HmMENDwlLCdIBYirB
	zObYmIC2DfXAsk7rG9ce7G+vZ9C2Z+aG5CgBY6fLXWX8pLBmbsl9Qhb7gauamJrr
	VcMDVhz5+m6aYYVVW7y5yioTw51JCYSn52Wqnl5ANMfFegNSLwBvx6MMJWdzrYJ+
	5pTeV0oFWUa6QGgZCw2XZ6EDDMBEddye1rQ==
X-ME-Sender: <xms:61vfaUATImKYdTWjPr3c7X3Zr509fhZOzQPJgicuAb3M8oNMBbVHrw>
    <xme:61vfad-pn1bZsoCY0AVTMgJSg0h5saVcgTSXa8WnvIjWhq5ZLAgZ9b47SF52gOxan
    WZ70DBFr5AnqdqfD87NMb2FnASz4b2I3WUCZ8zs9sbnFg0VmdlWjdw>
X-ME-Received: <xmr:61vfaU-2q4RMgYkP4oPiYwE-ETmpv2s9ISUSE8rl3f3Rg78GBIsjdtkCLfXCrsIfTjcoEqCmo5gQzu0spNbsPaWRonDQzLqV8MGyb3U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdegfeejfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepkffuhffvveffjghftggfggesghdtreertd
    erjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepfffgledvuddvhedvtdfhtdffheduuefgieffte
    eutdejueehgeetieelvdektdehnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpuhgr
    phhiqdhgrhhouhhprdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepphgruhhlsehpsggrrhhkvghrrdguvghvpdhnsggprhgtphhtthho
    peefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehqihdrtghhvghnseifihhnug
    hrihhvvghrrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvges
    lhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepmhhnshesgh
    homhhsphgrtggvrdgtohhm
X-ME-Proxy: <xmx:61vfaUcdhj54ig1RXf5htfiqkcHW3Vb89HJzOLeTtP3YDFjVHkHP3g>
    <xmx:61vfadG8PReXlx0i8dkcrJtZ-5cBnM0Cm2XgfLR35LsVhZ2Tyt-2nQ>
    <xmx:61vfaSesKrZAjRqrRjuSDsggcw38zMVqka4c5Ye-hia15ZqzGaTWyg>
    <xmx:61vfaXFgndowDIQqZ3oK-p85PN1XI_CFhvXKFuKDeMmIkUk-L5J98g>
    <xmx:7FvfafvUTYLkVzuQIpkxRTMJW-ZysKQz9e3mw-ZJIzZNMa8564z-DMnL>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Apr 2026 05:35:38 -0400 (EDT)
Message-ID: <a47f8c392202243c914de017786490472464b556.camel@pbarker.dev>
Subject: Re: [OE-core][PATCH] systemd: add osc-context PACKAGECONFIG
From: Paul Barker <paul@pbarker.dev>
To: Qi.Chen@windriver.com, openembedded-core@lists.openembedded.org
Cc: mns@gomspace.com
Date: Wed, 15 Apr 2026 10:35:36 +0100
In-Reply-To: <20260415082949.3446677-1-Qi.Chen@windriver.com>
References: <20260415082949.3446677-1-Qi.Chen@windriver.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-iCRS2Sxoh2GJ9nIGiwT1"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 09:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235190


--=-iCRS2Sxoh2GJ9nIGiwT1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-04-15 at 16:29 +0800, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>=20
> Add a new PACKAGECONFIG to give users the choice of whether to
> have /etc/profile.d/80-systemd-osc-context.sh file or not.
>=20
> This is because the /etc/profile.d/80-systemd-osc-context.sh[1] is settin=
g
> PS0 with OSC 3008 standard[2]. If a terminal (e.g., minicom) cannot
> deal with this OSC 3008 standard, it will just output the whole contents.
> This is quite annoying. See example output below:
>=20
>   3008;start=3D9c578e41-1a0f-4b47-9a87-ab22adebe376;machineid=3Dcc467af9b=
edc4d98a437e5d744928301;...
>=20
> Below are steps of how to reproduce the issue with qemu:
> 1. IMAGE_INSTALL:append =3D " bash"
> 2. bitbake core-image-minimal
> 3. runqemu snapshot kvm nographic qemuparams=3D"-serial pty"
> 4. minicom -D /dev/pts/X -b 115200 (/dev/pts/X is the one printed in the =
step 3)
> 5. [In minicom] type any command or just type "Enter" key
>=20
> A new PR is also created for systemd upstream:
>   https://github.com/systemd/systemd/pull/41647
> If systemd accepts the PR, we can then use the new option. Otherwise, we'=
ll need
> to keep the way it is now.
>=20
> [1] https://github.com/systemd/systemd/commit/dadbb34919abd3fefeb5b8ccc97=
94da9398a2503
> [2] https://uapi-group.org/specifications/specs/osc_context/
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>

I think the best way to solve this problem is to set TERM for the serial
port in question, perhaps to something like `vt100` if you expect to be
connecting with minicom. That would have to be hardcoded in the inittab
or relevant systemd unit file as there's no negotiation of terminal type
when connecting over serial.

The `80-systemd-osc-context.sh` script in systemd also needs
modification, it assumes that anything other than TERM=3Ddumb can support
OSC 3008 messages. We all know TERM and terminfo is a mess, but it's
equally messy to just assume support for features like this.

Adding a PACKAGECONFIG and/or an option to the systemd build system to
control whether this is installed is not a good solution - a target
system may have multiple types of terminal in use, some of which do
support OSC 3008.

Best regards,

--=20
Paul Barker


--=-iCRS2Sxoh2GJ9nIGiwT1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCad9b6BEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bvjXAQDuiE4F2Rd8VlUrBk7gSgA4sqU+xr36aOS7
5+0KoSZzlAEAwbovKJkDa6ifAT+j6QKV72CvMhuXp2t+HKpcHQ7mTwI=
=53U6
-----END PGP SIGNATURE-----

--=-iCRS2Sxoh2GJ9nIGiwT1--

