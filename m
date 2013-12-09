Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6F120610F8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2013 13:43:34 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id e49so1568742eek.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Dec 2013 05:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TVeL3d9r4leJ9CorG55TAaQDW2zr408PgNOnxZhdPH8=;
	b=TfvqCEhnoZBXhiq5zIC4rIfNsKoqkkZ84eL795NVx6JVDfTXUq5xG5ijZ9x84vt+SY
	s7hu/p+NF/khZw4kMcp//JcvR6/OXUKpMYN79F+JBNGBoNEDY/qB6Nsn1G4aCLKcDjug
	5IY6f/W7Qx9gEygdDtzuqUHSEpvkbicBboZEB/83YeLh2PlrxXO98FMsmIPjxXUnbIRH
	MO1qK7UzPrUEyVeNdqnvWuTCF6JCEa9vt0yb6qHtLh3ZQSuKlQe7HZYtuydXd7H9o9R7
	lKXlXAKG6vZMj8lSjQRGmOs4+TFZj+8bQLUggEi1s5SlxYXsxb4xNGbay0XT4/qfowJh
	rYtQ==
X-Received: by 10.15.101.9 with SMTP id bo9mr12741867eeb.32.1386596613391;
	Mon, 09 Dec 2013 05:43:33 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id e3sm28935515eeg.11.2013.12.09.05.43.31
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Dec 2013 05:43:32 -0800 (PST)
Date: Mon, 9 Dec 2013 14:43:50 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20131209134350.GB3713@jama>
References: <1386588627.25847.77.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1386588627.25847.77.camel@ted>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Build directory reuse issue - make WORKDIR machine specific?
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
X-List-Received-Date: Mon, 09 Dec 2013 13:43:36 -0000
X-Groupsio-MsgNum: 48021
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aVD9QWMuhilNxW9f"
Content-Disposition: inline

--aVD9QWMuhilNxW9f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 09, 2013 at 11:30:27AM +0000, Richard Purdie wrote:
> We have a type of bug where a build directory has configuration changed
> halfway through its usage and this breaks other parts of the system. The
> one we keep seeing can be seen with this sequence:
>=20
> MACHINE=3Dqemumips bitbake perl; =20
> MACHINE=3Drouterstationpro bitbake perl -c populate_sysroot -f;=20
> MACHINE=3Drouterstationpro bitbake libxml-parser-perl
>=20
> which results in:
>=20
> ERROR: QA Issue: package libxml-parser-perl contains bad RPATH /media/bui=
ld1/poky/build/tmp/sysroots/routerstationpro/usr/lib in file /media/build1/=
poky/build/tmp/work/mips32-poky-linux/libxml-parser-perl/2.41-r3/packages-s=
plit/libxml-parser-perl/usr/lib/perl/vendor_perl/5.14.3/auto/XML/Parser/Exp=
at/Expat.so
>=20
> Basically the trouble is the perl workdir has "qemumips" paths in it, we
> then switch to routerstationpro and the qemumips ones slip into the
> routerstationpro sysroot. The trouble is this kind of corruption can
> happen silently and results in very weird and hard to debug errors. In
> this case it comes from:
>=20
> usr/lib/perl/5.14.3/ExtUtils/Liblist/Kid.pm:    push(@libpath, "/home/pok=
ybuild/yocto-autobuilder/yocto-slave/nightly-mips-lsb/build/build/tmp/sysro=
ots/qemumips/usr/lib");
>=20
> which is in the routerstationpro sysroot, therefore the RPATH gets added
> when it shouldn't be.
>=20
> Options to address this as far as I can tell are:
>=20
> a) Save the machine name during do_configure to WORKDIR and then check
> it in subsequent tasks
> b) Make WORKDIR be machine specific.

I guess I haven't seen this issue because I'm using rm_work. Stamps
already gone after "bitbake perl" so running it for routerstationpro
reuses it from sstate just like it would for MACHINE_ARCh WORKDIR,
right? Can we do something like that as c) solution?

What would happen in a) when the check detects different MACHINE?
- fail with good error message?
- automagically "fix" workdir content like sstate_installpkg does?

> b) looks attractive but could be confusing as we'd no longer have
> PACKAGE_ARCH workdirs, they'd all be "machine specific" however they
> would still get reused by sstate as they are today. It does however
> neatly sidestep the set of issues we're currently seeing.
>=20
> Thoughts?
>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aVD9QWMuhilNxW9f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKlyRYACgkQN1Ujt2V2gBzQ/ACeNYivjD5uiKcBm72rUt/3EVxq
h+QAn2NZtl3I5O9xSBaddtTerfYG+qBE
=sfBM
-----END PGP SIGNATURE-----

--aVD9QWMuhilNxW9f--
