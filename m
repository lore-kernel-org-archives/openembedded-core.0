Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD25C5AC7A
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 09:45:53 +0000 (UTC)
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39123.1786095943708229900
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2026 02:45:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=OVChVTnv;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=Re2qAQkP;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.144, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id B79CDEC011C;
	Fri,  7 Aug 2026 05:45:42 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 07 Aug 2026 05:45:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1786095942; x=1786182342; bh=Pa5uv9kpFd
	cjHZX30SiNQyWa7RnZwSpBwaWGKZ2OwKw=; b=OVChVTnvmwv46jFFcmn2Kxs69f
	fqOu+MY2GMlnSzrlye0K72flLT0JnjwXRr+UDGOH4pjJHm0tJorkER6oqFRObKZd
	ph6dYcNW6/lFBH9zrcfwxGLV7IxE5toc9g1ju4SEOtXPH2pPjYT8vSMX2+vdt3/H
	ENjJEJHQjoVLOELQIg2iImV68bTYSLOKw//FGvOZem6oIAl7YQhyjecHrwjqc2fh
	Swa9Wsiq5dL6yOIdnj82vKY9aFLFJyMrszks9yrITzlgru8Az3hCriu0Hqx6P0nt
	vQIMM/Ts+Te8Z6Kv38HXtO0V6j01hOUSo+XftRBFg2aSUc0O+bTI/auQSrBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1786095942; x=1786182342; bh=Pa5uv9kpFdcjHZX30SiNQyWa7RnZwSpBwaW
	GKZ2OwKw=; b=Re2qAQkPpQ/b0WadDSKg2FHI2Z24LBtWJAEigv0soA1OJC8zJ2y
	/tS3VZDmLPHYE4aN9dl6Coxny0N4kWYNt4X6Z9BuS5K9C8Ym8HKb94lb9fx4tTJf
	v+VYX3QXAmm7er3iigOMpXDibZvdY3azj3ZZonJy4awDhhkQ9LOQn2czeuZH0c9m
	zpRRwWQcBY7OgUxUxtpVa/nOzXhgKKrfbltvpVWOGwYOZ/UODDW8l+2PpLol7rPN
	OsOUFsVaNDMmBjpi7b832WlZElz29nZwAubVOVnpDjEfMv1ucK48PcxGTQIbCSgN
	e9lI3Lb21mlmbKipY7A+CwZZ14L3ttw3j7w==
X-ME-Sender: <xms:Rql1ak5V4DaFZ_-AadZskYo3NQJGh-CZy7MiN8BrsyTgaZU-gxeK0A>
    <xme:Rql1asxMPU3va2biNItgJXv8q1hUprVfJF8B88I4a3rYLOqusAcJe9jSQVlEAGvHT
    vB6UC4nU4aLYL5EHnMblFUI2YV44567VQxgwYYPpnqvpp-T4ioonj6W>
X-ME-Received: <xmr:Rql1aryNO02PaQJt4tIg9vW8y8LH8BUzdpPwrBE6hkdmk39hVjMRXCmu_mVk6XPT7Dj-Dfs3mne5ny8RjoT1xfn65rl4ydfFIdR2XjCzedfK>
X-ME-Proxy-Cause: dmFkZTEW8DatIMziu+x/CTbPupcg+L9ku7un+I/DMsjGI9c17dsj8O9M8olVJuJ+Wakv4O
    AvmENu1Mi/MZ0MLPPVKV+5Ibb7DDgIhTAL5P6xWbfBR7nJiBiak+vsfQRTQaSzovjshVfA
    2wfaYZ85VVB+etG4WU0bU4WFPkica37zoo3Wr4Cf7MOOpp67y+Vf85HI6A9AWxW7A0Ddys
    bqtipZOaf07u5XUBxT6Z0prkO3vmikKeNa+TiIe4YGcR2gZrv96D3GL2ZzSbTNR3hoegZH
    hDA7VGQ9w2SbXZ4kvN5qCUcOOA/ohTYg7ecZPFty1CY0G1Vjm8Grve3sTwsQ6Oy/q7CBZI
    HW5xTiCr672nfqD9rhxYQBN7gBrb9aad2+mjY4MtBbn7mx/oF/whpBqu8+1GRWYlqbPnXx
    xYbqr3Xoyq6qCg3lMfiGuFJ+McbugVSJ5/ZJwtS10BCqEmgvwq+8UTanCBV0Su1lZjIfMp
    7RoqB2e5tUeuNwFXv5tZ3mlI2ANqlz37Jfq1uCrCD0S5qmOD+kyI0v5SgZzYTGBxnrKJQt
    IzL7n6o4/D+4KsceO6MfkNB616mDkD1tVvYTTNYCiwJfU6fkSXCy6WllsO+TEy3Pz7SRAK
    2WKqhbmIp2o5MHsqeGwuqj2GBpxfECjGzBwIO0EA4ztBKZeY2qbHlCe37HPw
X-ME-Proxy: <xmx:Rql1akxro5pePzYqYd53PpoNwRI-2T1VWHKG4WHXFUJ-kvIYRZWR7g>
    <xmx:Rql1ala0ILGCzv57B_7H7XuKY4je7jy46NxyeL5ZqMSLH9kJRjQb4A>
    <xmx:Rql1alVmNqRzMzHE3HfuOaSzxE6JwinbR-C3SRPfBkHy9sjQoKEqCA>
    <xmx:Rql1ajg4ry2h3RrhQ7C5ipGvBwiggt73LDviswftsZdBEa-dIDx0KA>
    <xmx:Rql1aoNnphAnVqGdTNyf7v0Pk0PrEetulzby0yVXvtAgya9pQfvcXxDi>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 05:45:41 -0400 (EDT)
Message-ID: <72c5184f8c87333de0b988aa9df125abf1da1393.camel@pbarker.dev>
Subject: Re: [PATCH 1/7] util-linux: inherit upstream-stable-release-point
From: Paul Barker <paul@pbarker.dev>
To: daniel.turull@ericsson.com, openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, Randy.MacLeod@windriver.com, 
	alex.kanavin@gmail.com
Date: Fri, 07 Aug 2026 10:45:37 +0100
In-Reply-To: <20260731122522.1647968-2-daniel.turull@ericsson.com>
References: <20260731122522.1647968-1-daniel.turull@ericsson.com>
	 <20260731122522.1647968-2-daniel.turull@ericsson.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-KKHBNweyDY8E0Cr3KRmE"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 09:45:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242997


--=-KKHBNweyDY8E0Cr3KRmE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-07-31 at 14:25 +0200, daniel.turull@ericsson.com wrote:
> From: Daniel Turull <daniel.turull@ericsson.com>
>=20
> util-linux's README ("Stable Branches") documents stable/v<major>.<minor>
> branches whose maintenance releases are bug fixes only, so upgrades
> within a major.minor are stable point upgrades per the OE-Core stable
> release policy (ref-manual, "Stable Point Release Upgrades").
>=20
>   https://docs.yoctoproject.org/dev/ref-manual/release-process.html#stabl=
e-point-release-upgrades
>   https://github.com/util-linux/util-linux/blob/v2.42.2/README#L95
>=20
> Checked the last point release for feature creep:
>=20
>   2.42.2 (Jun 16 2026), against 2.42.1 (May 18 2026): 32 commits, all
>   fixes or hardening -- memory safety (a libblkid use-after-free, two
>   buffer overflows, a libfdisk GPT fix), privilege tightening
>   (X-mount.subdir restricted for non-root), diagnostics (fanotify queue
>   overflow detection) and documentation. No new options or behaviour.
>=20
> These releases are not picked up on the OE stable branches: util-linux ha=
s
> had zero point-release bumps on kirkstone, scarthgap or wrynose since eac=
h
> branch forked from master, leaving them at 2.37.4, 2.39.3 and 2.41.3
> respectively. This addresses that gap going forward.
>=20
> This addresses the general case on master, where PV is 2.42.x. Since the
> regex is derived from PV, an older branch scopes it to that branch's seri=
es,
> and the 2.39 series scarthgap ships does not qualify. 2.39 adopted the ne=
w
> kernel mount API, so 2.39.1 introduced
> LIBMOUNT_FORCE_MOUNT2=3D{always,never,auto} as, in its own words, "a stab=
le
> workaround for use cases where new kernel API is not ready to use"; the
> series also took new CPU model support and libblkid bcachefs sub-device
> label probing. That is a property of the 2.39 series rather than of the
> project -- 2.42.2 is 32 commits of pure fixes -- but it means this must n=
ot
> be backported unchanged, and each branch's series needs checking on its o=
wn.
> For the avoidance of doubt it is not a development-series effect either:
> util-linux has no development/stable version split, and pre-release work
> goes to -rc tags.
>=20
> AI-Generated: Kiro with Claude Opus 5
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>

Hi Daniel,

We merged the rest of this series but skipped this patch as I wanted to
take a closer look at that last paragraph above.

Scarthgap already has v2.39.3, so API fixes in 2.39.1 aren't really an
issue. However, reading the 2.39.1 release notes it aimed to "resolve
the regression that occurred due to the v2.39 rewrite for the new kernel
mount interface" which sounds like a valid fix for me. Supporting new
CPU models is low risk and likely wanted by many users of our stable
branches anyway. And allowing libblkid to handle bcachefs' version
scheme and sub-device labels is low risk and a sensible way to handle
what was still a moving target.

So I'd say util-linux have shown good judgement in managing a stable
branch and we should be able to track any of their stable branches.

Please send a v2 with an updated commit message if you agree with my
conclusions.

Best regards,

--=20
Paul Barker


--=-KKHBNweyDY8E0Cr3KRmE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCanWpQREccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bnS7AQCYCAXxzSB9SAGJtMXhlB3dfVl1I3Y7gjJL
l5QN0GDSdwD+MxSceRhG55kgl0X8hvG++EoJ53stfhKMzuj2ASDQoAM=
=+2LZ
-----END PGP SIGNATURE-----

--=-KKHBNweyDY8E0Cr3KRmE--

