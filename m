Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SfdT6-0004of-HE
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 22:50:08 +0200
Received: by werg55 with SMTP id g55so2254215wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2012 13:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=YjFQCknzlS63mph0IoP4GPawQN8YrmJj6i3QqaptEhc=;
	b=0jjJkNsfejQy3DOrCPJsIb+TcWT+0t82sgZsTVGqrVZVyBLutBD8McAff3kNTX2Bij
	a0F/bP5iNhfNqJKqU86V0Qh3XZo8W3iA16PHT5rmNLGIhRzbhdPQsA4VDO63iAItQSxg
	g70gIHFa7LB7RMGhj9TNxg4OUz1ghglfMWuacj3umw32daYD/IjjjH7vZBMsQGMjw7to
	XLXgKdAgEq+MHZxow7Cdeo3nGGgkz8n7miKzhoW6QdUo5e0ykGnMrtE1TlEbSkORfoY6
	tK3UT5UXGpEjlvXerPb4cx6D5Un+4A4/oOaIgcl0BbKJUktUwFstiJg8XBbbvmGfjDVU
	09gA==
Received: by 10.180.106.137 with SMTP id gu9mr7091853wib.8.1339792769582;
	Fri, 15 Jun 2012 13:39:29 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gc6sm5404628wib.0.2012.06.15.13.39.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 15 Jun 2012 13:39:28 -0700 (PDT)
Date: Fri, 15 Jun 2012 22:39:49 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120615203949.GY3140@jama.jama.net>
References: <20120615063647.GU3140@jama.jama.net>
	<CAMKF1srmOijugSfqfOivt2Sqfi0CvUVfZDRgUCprSShJ4nzf_w@mail.gmail.com>
	<1339771010.4471.14.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1339771010.4471.14.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: openssl does not build on recent distributions with perl-5.16.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Jun 2012 20:50:08 -0000
X-Groupsio-MsgNum: 23652
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R9baxdNnpTjJ7oIU"
Content-Disposition: inline

--R9baxdNnpTjJ7oIU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 15, 2012 at 03:36:50PM +0100, Richard Purdie wrote:
> On Fri, 2012-06-15 at 07:15 -0700, Khem Raj wrote:
> > On Thursday, June 14, 2012, Martin Jansa wrote:
> >         Hi,
> >
> >         openembedded-core/meta/recipes-connectivity/openssl/openssl.inc
> >
> >         is using perlpath.pl:
> >
> >          do_configure () {
> >                  cd util
> >                  perl perlpath.pl ${STAGING_BINDIR_NATIVE}
> >
> > I wonder why it's using host perl and not staged perl-native
> > May be missing inherit perlnative=20
>=20
> perlnative is not meant to be used as a replacement for the host
> system's perl, its meant for building target modules and target perl
> itself.=20
>=20
> We require perl to be on the host system. We're not meant to be using
> anything outside the standard perl install though. The alternative means
> effectively totally cratering build time as we'd have to build
> perl-native before pretty much anything else.
>=20
> So the best solution is likely to have something that adds find.pl to
> the native sysroot and have these recipes depend on it, at least short
> term. I'm extremely reluctant to start adding perl-native dependencies
> throughout the system due to performance considerations.

is there any other recipe depending on find.pl? (I've tried only minimal
image with perl-5.16), maybe sgml-common-native as Jack reported,=20
here it's used only in do_configure, that's why I added find.pl only to=20
openssl and better fix would be to send patch to use File::Find in=20
perlpath.pl to openssl upstream IMHO then adding find.pl to sysroot.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--R9baxdNnpTjJ7oIU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/bnZUACgkQN1Ujt2V2gByccQCeJ/t6WeyQuHXeVmEc6dL+srCh
2CkAnREll/howgDXosKMOIErFQ4wlF0b
=sKaB
-----END PGP SIGNATURE-----

--R9baxdNnpTjJ7oIU--
