Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1SB8CJ-0000kH-0b
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 18:22:43 +0100
Received: by obqv19 with SMTP id v19so2738850obq.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 10:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=AK2wdbGvCIIAHo5JloShEwKnKKt7AYseLDNSlpw9Zss=;
	b=fdxfZ9i4P7q8KVpot89ZY2D4k2DEs2Mqg3bLK6ABEzYBmPZI7QAo9aa6uH0Q8eqpv8
	WDTdpCNWY8cEmsaLIds87dUha4WshC+Q4Yp5dX3eHtp0vTE7pRtT214jeV1BtyQvqEn2
	wZi19DlaBIUyqgWCxeiwZbHi13L4NlBwEx1gpSZZHKOTp5jwReHyQD2gHxtQDjejDi4b
	EBB7sL1WvTsoSfPa55Z4wVrEeF8RRJFpN8S+WWR3X7qW82K0q52yCeR9rHtKOLbI83l4
	fsJ5I48WKK19Nxnsjr9jlGypgv9g5mInScxp7H8sLrAtBHlS2+kX/3qw4CRG7FSymbpT
	nTeg==
Received: by 10.182.72.71 with SMTP id b7mr15661057obv.11.1332522826283;
	Fri, 23 Mar 2012 10:13:46 -0700 (PDT)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id d6sm6509259oeh.3.2012.03.23.10.13.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 10:13:45 -0700 (PDT)
Date: Fri, 23 Mar 2012 10:13:47 -0700
From: Tom Rini <tom.rini@gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120323171347.GF9551@bill-the-cat>
References: <4DCCC4C4-51F4-43CF-ACF2-BF3D2BAD7BDC@dominion.thruhere.net>
	<1332506475.9740.409.camel@ted>
	<CAEsOVNfaP_NzdnigOOfgOcdhkHgQfEYVoS-K0pPn1dH4PdZpEQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEsOVNfaP_NzdnigOOfgOcdhkHgQfEYVoS-K0pPn1dH4PdZpEQ@mail.gmail.com>
Organization: Texas Instruments
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: sstate reuse for -native, -cross across different host glibc version, how to make it work?
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
X-List-Received-Date: Fri, 23 Mar 2012 17:22:43 -0000
X-Groupsio-MsgNum: 19598
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5CUMAwwhRxlRszMD"
Content-Disposition: inline

--5CUMAwwhRxlRszMD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2012 at 04:35:12PM +0000, McClintock Matthew-B29882 wrote:
> On Fri, Mar 23, 2012 at 7:41 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Fri, 2012-03-23 at 13:22 +0100, Koen Kooi wrote:
> >> I turned on sstate mirroring for angstrom recently and I'm getting
> >> reports of build failures due to missing GLIBC_2.14 symbols:
> >>
> >> arm-angstrom-linux-gnueabi-gcc: /lib/x86_64-linux-gnu/libc.so.6:
> >> version `GLIBC_2.14' not found (required by
> >> arm-angstrom-linux-gnueabi-gcc)
> >>
> >> The sstate tarballs are built on a Fedora16 VM and the breakage occurs
> >> when it being used on systems with an older c library (e.g. debian).
> >> To get rid of this problem there are multiple options, but I think the
> >> 2 most obvious are:
> >>
> >> 1) inject host distroname and distroversion into the checksums
> >> 2) build everything against a native libc
> >>
> > 3) Use an older version on the VM which is the oldest distro you plan to
> > build against.
> >
> >> Would it be appropriate to get 1) into oe-core before the branchpoint?
> >
> > We've talked about this and its been on the "to fix" list but nobody has
> > got around to it. Its hard as we need to come up with something that
> > isn't going to kill performance of the checksum calculations. A cat
> > operation on a few files for each checksum for example isn't
> > appropriate. We may need to do something at the bitbake level as there
> > is also the issue of checksuming local files such as those in file://
> > urls and including that in the sstate checksums.
> >
> > So whilst I'd love to see fixes for these and they are bugfixes, they're
> > going to have to be well written patches and its late in cycle for
> > invasive changes :(.
>=20
> Can't you just inject a variable into native.bbclass:
>=20
> LIBC_DEP =3D `ldd /bin/sh | grep libc`

That just catches one of the many variables.  If you want sstate reuse
of the "runs on host" side of things, you need to capture either all of
the libraries we may use, build the published feed linking vs these
libraries (VM or chroot or sysroot games) and the include some way to
say "yes, X is usbale here".  lsb_release and a little bit of mapping
(which can/should be done at the distro level) gets you this easier.

--=20
Tom

--5CUMAwwhRxlRszMD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk9sr0sACgkQdZngf2G4WwMfbgCfZ8Wq81lKdqA8YlsRmB2YbNfu
7AcAn1lPO5XM5H1uX/JsVnFrEH39kU+e
=ziJO
-----END PGP SIGNATURE-----

--5CUMAwwhRxlRszMD--
