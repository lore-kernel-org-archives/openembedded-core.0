Return-Path: <trini@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 160E2C43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 16:03:37 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1401.1783440210897042509
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 09:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=GmAnmNym;
 spf=pass (domain: konsulko.com, ip: 209.85.210.42, mailfrom: trini@konsulko.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7eb34c17b96so2694685a34.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 09:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1783440210; x=1784045010; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eJJ1FBAi1aWfqIYQb1u8rHMti13JZOrKNiM6K3k2CJU=;
        b=GmAnmNymkIEH/j1SCXWK/pkXy+TlCggL5iwoSGslZ+2Qm2hXo6BQ/znJ4h6cLhIfW1
         XzTPkYUjBL9TJT3TLWkAEGx1NbVIM+dUBuE6UwWRhqS4sKsJB1I2BTpozIymNxexnGnb
         LU2TB1mm1QSw5FZZ0wCvYwT8cpMtYjC037/Qk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783440210; x=1784045010;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eJJ1FBAi1aWfqIYQb1u8rHMti13JZOrKNiM6K3k2CJU=;
        b=HOCM7SrpDeE6gp3RBnQjz5+9d2J5wTwHtetZVqtfrvdqnBJzgisIVyrL5Ol+8GBTHj
         Uo4PHMsvpMK+1I5sy/qfi4vFmcZ0vPjjLGDPOufNrM7m8MxDfafT4pV3uPBLCf5UoXZ5
         JBl2IV7mPs/mG21wDmhYjQwg44pjfy97hW5jebqjuoMGSrs3nZJLYqL5S3mPVOygBEC9
         m1r/ebmgO7Y7/N9Xnr3MwD85KLHdBvdI9NpN6nUJi9yB75ajbxq1DmJ3Za6hV7VlLl5N
         tkBp5lHa18KZxKthm3q5c2w+g0H6wkTjoNrAZvKzKrYVUVYGJm5P+ZXhLSdywxFfSPn9
         iOoA==
X-Forwarded-Encrypted: i=1; AFNElJ8WoLXtVF2pjb1ayiSnC/r/tg3ujGETo/h6eLYY7Bfm91LqMawrqdxhNGtknLdgJZZ3PkgRybGtx9dai5ush//8KA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzz8W+gjWUlqWOip56KOK/1YAdxJh5VFAXOacZE7bX1gQRX46Xv
	Gb1DefPIgSOVwHQDPsiBYNiCsOr0vsRkrWLrzMdF2cCxAizrRHf7qmkk4gj2DP3V9m4=
X-Gm-Gg: AfdE7cnlACHSEYI3kZi4eWww+jQydiBmu3GzDfTGXW8LB+jlCGaV6rn1IFNtSqiJ/CJ
	uvGiTosBnXNY8zh7QGTxGz6beIXIgUuQ1wqJmTE6f3JkBZV/t7/rcyp3UxiTi7aSawprQWxd5/z
	XPCUJ1uksL9z9K7F6VrRKjZ2TknFPKkD7Rdg39f+BM/ozEIvximuSKvd6EO4AKllLTQoR61Qyez
	o+XLTVyO4Cza3DVZ5M23YiDt5W1wlPz4Q4E/TWHLO8FJLrEZttrvzST6Ib/EIOl7o2Xyo2/t5j0
	r46q98PV9RL/h4ZMv0pCsr+RGKv1JBvr7p3STTlvoJKKw5c5a/T+GYTN6n3i7BXxVpLQR20GbvN
	uHQz/B27QhJLXsyiOTpsgMceLfc0H33ORRuf0cAKPDQNb0vDu1lP0YydVRROxTvGQteE1f0Pa3u
	s3fUw+cugu5jCWKt5xuYv4DwMhyz3/Cg09KoZtTG22+MmYNf8Lbe+mL4XyaPEcNZ+JToMsIq/mF
	bljkNXWFZBYBZrzVpOp5lr+usPf6Q8+XfqpdP590uUj4jRN
X-Received: by 2002:a05:6830:82ba:b0:7e9:faea:3dd3 with SMTP id 46e09a7af769-7ebb239d41dmr3809334a34.28.1783440209887;
        Tue, 07 Jul 2026 09:03:29 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-100-56.totalplay.net. [189.203.100.56])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb544a26basm14333086a34.18.2026.07.07.09.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 09:03:28 -0700 (PDT)
Date: Tue, 7 Jul 2026 10:03:25 -0600
From: Tom Rini <trini@konsulko.com>
To: Paul Barker <paul@pbarker.dev>
Cc: leon.anavi@konsulko.com, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] meta: Add pam to the defaults if using systemd
Message-ID: <20260707160325.GA2784214@bill-the-cat>
References: <20260703142916.2868287-1-leon.anavi@konsulko.com>
 <40bc682b0d30a05ea7043ca1a5ac1699c72ae268.camel@pbarker.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FcmlgPYoBJbs/1nZ"
Content-Disposition: inline
In-Reply-To: <40bc682b0d30a05ea7043ca1a5ac1699c72ae268.camel@pbarker.dev>
X-Clacks-Overhead: GNU Terry Pratchett
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 16:03:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240402


--FcmlgPYoBJbs/1nZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 06, 2026 at 10:52:48AM +0100, Paul Barker wrote:
> On Fri, 2026-07-03 at 17:29 +0300, Leon Anavi via lists.openembedded.org
> wrote:
> > Add pam to the list of DISTRO_FEATURES_DEFAULTS if variable
> > VIRTUAL-RUNTIME_init_manager has been set to systemd. Otherwise
> > having systemd in conjunction with wayland but without pam leads
> > to a conflict with the REQUIRED_DISTRO_FEATURES for weston related
> > recipes.
> >=20
> > This adjustment is required following these recent changes that
> > switched VIRTUAL-RUNTIME_init_manager to systemd by default and added
> > wayland to DISTRO_FEATURES_DEFAULTS which affects "nodistro":
> >=20
> > - 159148f4de2595556fef6e8678578df83383857b
> >   meta: Support opting out of any distro features
> >   (Please note that this commit also extended DISTRO_FEATURES_DEFAULTS
> >   with wayland and vulkan.)
> >=20
> > - 0b4061c5d50261f826d0edb4b478d2d305274b7c
> >   conf: Switch to systemd by default and simplify init manager selection
> >=20
> > This fixes issues with test_machine_world when running the
> > yocto-check-layer script for BSP layers that include weston in the
> > dependency chain, for example meta-tegra:
> >=20
> > ERROR: Required build target 'meta-world-pkgdata' has no buildable prov=
iders.
> > Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'l4=
t-graphics-demos', 'weston']
> >=20
> > The weston recipe has pam in REQUIRED_DISTRO_FEATURES if systemd is
> > enabled. Therefore, it makes sense to also add pam to the defaults
> > through DISTRO_FEATURES_DEFAULTS.
> >=20
> > Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> > ---
> >  meta/conf/distro/include/default-distrovars.inc | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/con=
f/distro/include/default-distrovars.inc
> > index 69c6db589b..2eadfcbd74 100644
> > --- a/meta/conf/distro/include/default-distrovars.inc
> > +++ b/meta/conf/distro/include/default-distrovars.inc
> > @@ -29,6 +29,7 @@ DISTRO_FEATURES_DEFAULTS ?=3D " \
> >      acl alsa bluetooth debuginfod ext2 ipv4 ipv6 \
> >      wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccomp pulseaudio \
> >      gobject-introspection-data ldconfig opengl ptest multiarch wayland=
 vulkan \
> > +    ${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd',=
 'pam', '', d)} \
> >      "
> >  IMAGE_FEATURES ?=3D ""
>=20
> Hi Leon,
>=20
> I'm not sure we want to enable pam for everyone using systemd, there may
> be many systemd users who don't use weston.
>=20
> If we do want to enable pam whenever systemd is in use, the better place
> to do it is in meta/conf/distro/include/init-manager-systemd.inc.
>=20
> An alternative, though not the most satisfying, may be to add a
> REQUIRED_DISTRO_FEATURES check to the l4t-graphics-demos recipe in
> meta-tegra.

Hey Paul,

So, it's certainly an interesting part of making a layer be
yocto-check-layer compatible. Related to what I believe Leon mentioned
elsewhere, there's a lot of unsatisfying changes one needs to make to
the metadata in order to pass the signature check part of the script. So
please do let us know if the right answer here, for yocto-check-layer
compatibility is to instead add a check in l4t-graphics-demos to pass
the signature test. Thanks!

--=20
Tom

--FcmlgPYoBJbs/1nZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTzzqh0PWDgGS+bTHor4qD1Cr/kCgUCak0jSgAKCRAr4qD1Cr/k
CpYrAP9gyQSZx0uOe6B5ue5t1abWWPGhtHQr5Ui6C8Ucw6sYSwD/b/brcfMYT0lA
1pejWBtYD+JhURFPsEv4huvDQWqs8Qo=
=moFU
-----END PGP SIGNATURE-----

--FcmlgPYoBJbs/1nZ--

