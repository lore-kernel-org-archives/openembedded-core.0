Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0A7E16AC7E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 14:49:37 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id d1so2337149wiv.15
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 07:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0aZnJRi3Vi5PagtpX/RX6OTIRqiTc6/5nCljGjG7w3c=;
	b=t94h+Xd33eG0/fn3DV4NRGNZdx+W9wk/TAo7X8Rk9jZsz/hJQfSIwlKWQkNWf0a2sh
	RKj8n60xnJMdO9ihtQpJNX/ymiGffVZzyQN4/8Ydm0LsoSNBV67hwYiipn3lks9BATdb
	wqKUHSq+cxz6ebV/VSZo9/0667HYbpQGAKisSFIJj1Jx6F3+w8DHe2SBweXQftZMAfdl
	OE1KoRAh0uF7nqeGxAe/RSrxuP3uWtR5AeO1uHyb5kudPTOFBHcIGIYjsCYn/f5KhHV8
	UOXR7Vc/7kEWpQJari9GNkgNGOGGs3hispKXcMjESvNJDGahJs0W2OZfkhrJNHqciCdO
	luJQ==
X-Received: by 10.180.12.33 with SMTP id v1mr25826412wib.0.1406126976871;
	Wed, 23 Jul 2014 07:49:36 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	j6sm4555992wje.29.2014.07.23.07.49.35 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jul 2014 07:49:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 23 Jul 2014 16:49:52 +0200
To: Paul Barker <paul@paulbarker.me.uk>
Message-ID: <20140723144952.GG22875@jama>
References: <20140723135123.GA32767@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20140723135123.GA32767@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: gpgme-config
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
X-List-Received-Date: Wed, 23 Jul 2014 14:49:39 -0000
X-Groupsio-MsgNum: 55425
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1z3GODAf0autvy/P"
Content-Disposition: inline

--1z3GODAf0autvy/P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 23, 2014 at 01:51:23PM +0000, Paul Barker wrote:
> Hi all,
>=20
> I'm trying to build opkg with 'gpg' added to PACKAGECONFIG on the master =
branch
> of OE. The gpg support for opkg is provided by gpgme, which uses 'gpgme-c=
onfig'
> to determine CFLAGS and LIBS when building. After recent changes, the
> gpgme-config script is now just a dummy and doesn't do anything.
>=20
> Upstream gpgme do not provide a pkg-config file and an upstream issue abo=
ut this
> raised in 2012 was resolved WONTFIX (https://bugs.g10code.com/gnupg/issue=
1414).
>=20
> Our options are:
>=20
> 1) Add a .pc file to gpgme and maintain it within OE as it is very unlike=
ly to
>    be accepted upstream. Then I need to modify configure.ac in opkg to su=
pport
>    both this pkg-config file (for OE) and the gpgme-config utility (for a=
ll
>    other users of opkg).

This comment in original issue:
The gpgme-config scripts goes along with the gpgme.m4 code.  A .pc file
won't be able to do what we can do with this combination.

Makes me think that if we implement .pc.in which generates correct .pc
=66rom gpgme.m4 he won't be against accepting such patch upstream.

I think that biggest reason against -config scripts was that they aren't
cross-compile friendly (not sysroot-aware) so you either have whole path
to sysroot hardcoded in -config file and then have to mangle it for
target -dev package or vice versa and you need to prefix returned values
(like -I -L flags with sysroot).
=20
> 2) Make an exception to the policy on -config scripts for gpgme.
>=20
> I haven't really followed the discussion on why -config scripts needed to=
 be
> removed so I'll put this question to other OE developers. Would option (2=
) cause
> more problems in the long run? If so, is it worth the extra effort to fol=
low
> option (1)?
>=20
> I'll probably need someone to bounce a few autoconf and pkg-config questi=
ons off
> if I implement option (1) as I'm not very familiar with either system.

I'm no expert in this as well, but there are some examples we can copy.

> Thanks,
>=20
> --=20
> Paul Barker
>=20
> Email: paul@paulbarker.me.uk
> http://www.paulbarker.me.uk



> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1z3GODAf0autvy/P
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPPy5AACgkQN1Ujt2V2gBxKpACgqYSn/McvoeARFsNLkP9UwHr0
QvEAn0LT4wPn9X3CN+rEHNQeYwAnv2ow
=h29x
-----END PGP SIGNATURE-----

--1z3GODAf0autvy/P--
