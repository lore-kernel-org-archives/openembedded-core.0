Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9CD376A8CF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 20:42:46 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id l10so1237479eei.30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2013 13:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=B9j+A3AFB3g77485jdnvlWifjtpYAkvhb+HAL4H1lOE=;
	b=eLMFndPIn0TS52S4iux1xjoBVXaFqWvAFJg0PiPLvroL639v0HJ16sH4k8Otay2nhX
	CROocdrKOYSToemXBvoSVF+kA+j2/CnP3UWIGTJMA5gr4ZmlotAYHOCy5ioNkousmmaX
	rzV9U1R/CtKOUNcQprY8FWNOCi0OgnVfnvlYUhv5vfCDv8B2+SwaJnDKSYu5f0UrR/ls
	lHlP9FHHQI8s3FqTO5b16OmUG6RqeOMKIX6SMe91QNg3ESoJn0mr3B/kSxijp4vhxwAY
	yBun8dbWJqRZ+RmNcg4M9Ghr4Csw2O9PBYrUMtFgwz0hcoe9LHlIGjfrhtt/WdrMI5Ej
	ZjKw==
X-Received: by 10.15.98.203 with SMTP id bj51mr460123eeb.22.1370637767240;
	Fri, 07 Jun 2013 13:42:47 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id ba7sm938795eeb.0.2013.06.07.13.42.45
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 07 Jun 2013 13:42:46 -0700 (PDT)
Date: Fri, 7 Jun 2013 22:43:05 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Phil Blundell <pb@pbcl.net>
Message-ID: <20130607204305.GM22710@jama>
References: <20130607192007.GL22710@jama>
	<1370636049.4141.22.camel@pb-ThinkPad-R50e>
MIME-Version: 1.0
In-Reply-To: <1370636049.4141.22.camel@pb-ThinkPad-R50e>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: is sstate-cache really deterministic together with shlibs providers?
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
X-List-Received-Date: Fri, 07 Jun 2013 20:42:47 -0000
X-Groupsio-MsgNum: 40334
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jigfid2yHjNFZUTO"
Content-Disposition: inline

--jigfid2yHjNFZUTO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 07, 2013 at 09:14:09PM +0100, Phil Blundell wrote:
> On Fri, 2013-06-07 at 21:20 +0200, Martin Jansa wrote:
> > Imagine this process
> >=20
> > foo.bb DEPENDS on libabc.bb to provide libabc.1.so
> >=20
> > evil recipe bar.bb installs some binary crap in /opt/crap and because i=
t's
> > picky about libabc version it bundles own compy of libabc.so.1 and
> > installs it to /opt/crap/lib/libabc.so.1
> >=20
> > At the time of first build nobody notices libabc.1.so and foo, bar and
> > libabc are happily populated to sysroot.
> >=20
> > foo.bb is rebuilt because of some unrelated change, but this times it
> > uses bar as shlibs provider for libabc.so.1
>=20
> It sounds like the real bug here is that the shlibdeps code doesn't
> issue a diagnostic when it encounters this kind of ambiguous situation.
> It ought to be perfectly capable of figuring out that there are two
> copies of libabc.so.1 at large which belong to different packages and,
> absent additional guidance, it has no reliable way of knowing which one
> of those is going to satisfy the DT_NEEDED in any random binary.
>=20
> If shlibdeps stopped with an error in that situation, which arguably it
> ought to, then the erroneous dependency would never get into sstate and
> the scenario that you describe would not be able to happen.

I like both suggestions from you and from Richard, there is another
slightly related issue with
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4102

It's probably possible to create test case where I create sstate package
with libabc.so.1 provided by MACHINE_ARCH foo and then try to reuse this
sstate but with libabc.so.1 provided by TUNE_PKGARCH foo (e.g. with
different version) shlibs code will still find it provider by
MACHINE_ARCH foo and there isn't way to clean foo from incremental build
(only manually).

I'll create bug report and try to sum it there:
1) RP1: We should perhaps limit shlibs to the default linker search paths?
2) RP2+PB: Warning/Error if two things provide the same shlibs
   - probably better to error out when bar.bb is being built and tries
     to provide the same libabc libabc.bb, it can be in different order
     as bar does not depends on libabc, so next time it can show error
     when building libabc, but IMHO better then showing error when foo=20
     finds out 2 possible libabc providers
3) Restrict possible providers to stuff included in dependencies -=20
   I don't know how difficult it will be to implement this (to see all
   dependencies including transitive), but IMHO this one is most=20
   important and can also solve #4102, most tricky part would be to=20
   prevent shlib providers silently disappearing from RDEPENDS -=20
   when something doesn't declare dependency explicitly, but it was
   always there when do_package was executed - now missing providers
   are silently ignored IIRC. Buildhistory can probably help a lot to
   find missing explicit deps for shlibs providers when we restrict it.

   This will also ensure that when shlibs provider is changed, the
   package which is automagically RDEPENDing on it gets rebuilt too.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4628
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jigfid2yHjNFZUTO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGyRdkACgkQN1Ujt2V2gBx3+gCgj29kQu4J8WYt8jE87a9xytSr
RKcAniYPraKNrhZ+E3u0zZnzfeeChnJ6
=1M8p
-----END PGP SIGNATURE-----

--jigfid2yHjNFZUTO--
