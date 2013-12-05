Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 09B356DC00;
	Thu,  5 Dec 2013 00:54:50 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id q10so11084869ead.3
	for <multiple recipients>; Wed, 04 Dec 2013 16:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=atmPFf/DHX6nBlvLbMfJQVNbpD1XQLN+BlhR2D+wKJ0=;
	b=YFMmOkws0kWOCPy2kauBByJsMynHTDbeLt9mxa9xPqv4FHjE/SIierrz2idDErQ7Q6
	L14qZ4TuzuxbnLxSTZuy4DJc0pOCkKrGKNv24k0HgGDX9s8cZnNiw3sciC0cp7e9Gi3T
	XFohvulOunGOwCuRcQ+ZEjJfQYC2gwpJwcg6KtGSa1gqnbYDj/gS1eZI5tuxTFRokj1y
	cf5V6rDWmqdSqhFJ7dRLG1LnHkDQVCWOufHx9mw5+EsTDjc+vWZBhph8MYhWXaJrVKcY
	HVqzjMGHqrzLM/pmwCFWK3wuRly3R1Xbi86Huj9M3Fz2Sar+EYDSpF8ZLltV/3vrOZsA
	gh8A==
X-Received: by 10.14.115.133 with SMTP id e5mr9664600eeh.91.1386204890182;
	Wed, 04 Dec 2013 16:54:50 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id h3sm75039369eem.15.2013.12.04.16.54.48
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Dec 2013 16:54:49 -0800 (PST)
Date: Thu, 5 Dec 2013 01:55:01 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20131205005501.GB3724@jama>
References: <1386203938-13338-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1386203938-13338-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] cmake: respect ${S} and ${B}
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Dec 2013 00:54:53 -0000
X-Groupsio-MsgNum: 47910
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NDin8bjvE/0mNLFQ"
Content-Disposition: inline

--NDin8bjvE/0mNLFQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 05, 2013 at 12:38:57AM +0000, Ross Burton wrote:
> Hi,
>=20
> This is a Request For Comments because it changes behaviour of the cmake =
class
> and I'm not entirely knowledgeable in cmake.

Neither am I, but patch looks reasonable and I like it, because I was
planing to do something similar.

> For some reason, cmake.bbclass doesn't use ${S} and ${B}, but instead has=
 it's
> own variables OECMAKE_SOURCEPATH ("." by default) and OECMAKE_BUILDPATH (=
"" by
> default).  Those defaults meant that the build happened in the source dir=
ectory,
> which conveniently was ${S}.  Unless ${B} was also set, in which case it =
all
> broke.
>=20
> I don't see a good reason for cmake.bbclass having it's own special versi=
ons of
> ${S} and ${B}, so this patch drops them and replicates some of the logic =
in
> autotools.bbclass: specifically the part where if ${S} and ${B} are diffe=
rent,
> delete ${B} before building.  This ensures that switching machine doesn't=
 re-use
> the same build directory, which was the cause of me going back to look at=
 this
> (libproxy trying to use the nuc sysroot when I'm building for qemux86-64).
>=20
> Some open questions:
>=20
> 1) As I understand it cmake has more reliable support for out-of-tree bui=
lds
> than autotools.  If this is the case should cmake.bbclass set B ?=3D
> "${WORKDIR}/build", or leave setting of B to separatebuilddir.inc?  Are t=
here
> known recipes using cmake that fail with out-of-tree builds?
>=20
> 2) Is dropping OECMAKE_SOURCEPATH and OECMAKE_BUILDPATH acceptable?  Noth=
ing in
> oe-core uses them and there's three (IIRC) recipes in meta-oe that use th=
em.
> Assuming the answer to (1) is "separatebuilddir.inc" then the only fallout
> should be these recipes using in-tree builds until OECMAKE_BUILDPATH is r=
eplaced
> with B.
>=20
> Feedback and testing from people who actively use cmake very welcome.
>=20
> Cheers,
> Ross
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NDin8bjvE/0mNLFQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKfzuUACgkQN1Ujt2V2gBwrbQCcCemD7FElBv24XTqw3KHcNstS
mfUAn0Nkb3W93cJ9q81VcCJ25Kv19XoY
=8DiX
-----END PGP SIGNATURE-----

--NDin8bjvE/0mNLFQ--
