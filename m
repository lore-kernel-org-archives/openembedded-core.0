Received: from mail-ea0-f170.google.com ([209.85.215.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1URmKt-0006Yt-H0
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 18:33:04 +0200
Received: by mail-ea0-f170.google.com with SMTP id a15so2362325eae.29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 09:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=hSaV2Y6lVSVCaFu595dExslmsALOXBnUbo2qNs+/3KQ=;
	b=oLRVM8dUHnirlau5e0ObdWQnYmmuve9NvBtMA1XmdAtl5qVudO7S02Stk06mkAR3a+
	pBXgfOz7RYFWiIl1fqfewFj91k71GARpw/LCTpc4bO9pQcCaLEzY8MZGUypJ6WiqTox4
	MhxkC637dEe/MR9ekKMTchpJj+785gJVAcRp61mFC90mR2DEYL9HZU+nudtUmmAiwYFh
	g+ywASwSuJ3TfrmhV9qLVEMz5Qiiuif4daoTLFbxzasyVKN5+D+eTa3KpyV/vpQjDYef
	vGEEI7SEQh96zzNEtFWakThdJ3eGkNuOTCsFEjbLH8Pd7ygs+IBvA3G3R8I2rwus9Eqo
	k1eQ==
X-Received: by 10.15.35.193 with SMTP id g41mr63714353eev.45.1366042526539;
	Mon, 15 Apr 2013 09:15:26 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id a2sm26157713eem.11.2013.04.15.09.15.25
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 09:15:25 -0700 (PDT)
Date: Mon, 15 Apr 2013 18:15:31 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20130415161531.GH10628@jama.dyndns-home.com>
References: <1366024028-24911-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1366024028-24911-8-git-send-email-richard.purdie@linuxfoundation.org>
	<516C19C6.9080807@windriver.com> <1366040453.8670.66.camel@ted>
	<516C2180.7070001@windriver.com>
MIME-Version: 1.0
In-Reply-To: <516C2180.7070001@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 7/7] allarch: Drop various problematic allarch usages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Apr 2013 16:33:07 -0000
X-List-Received-Date: Mon, 15 Apr 2013 16:33:07 -0000
X-Groupsio-MsgNum: 37973
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lrvsYIebpInmECXG"
Content-Disposition: inline

--lrvsYIebpInmECXG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2013 at 10:49:20AM -0500, Mark Hatle wrote:
> On 4/15/13 10:40 AM, Richard Purdie wrote:
> > On Mon, 2013-04-15 at 10:16 -0500, Mark Hatle wrote:
> >> On 4/15/13 6:07 AM, Richard Purdie wrote:
> >>> In each of these cases allarch is used where the package in question =
has a
> >>> dependency on things which are not allach and change when MACHINE is =
changed.
> >>>
> >>> This leads to a rebuild of the package each time MACHINE is switched =
and
> >>> the sstate checksum changes. The dependencies in question are not sui=
ted
> >>> be being marked as ABISAFE.
> >>
> >> In each of these cases, does the contents of the package change when t=
he MACHINE
> >> (or something in that machine) are modified?  If so, I agree they are =
definitely
> >> not allarch.
> >
> > The contents does not, the sstate checksum however does due to the
> > dependencies. The dependencies are thinks like gtk+ and dbus.
> >
> >> However, if the dependency really doesn't matter, then why isn't ABISA=
FE correct
> >> in each case?
> >
> > I'm using ABISAFE in this context as shorthand for
> > SIGGEN_EXCLUDERECIPES_ABISAFE and those are defined as things which
> > don't need to rebuild if the dependency changes.
>=20
> So this can't be set on a package specific basis?  If that is the case, i=
t may=20
> make sense to look into a recipe specific way of declaring a 'lack' of=20
> dependency on rebuilding others in the future.
>=20
> > gtk+ and dbus both provide libraries and we do want software to rebuild
> > if they change. In the allarch case we could whitelist the dependency
> > however in the general case we shouldn't.
>=20
> Ya I agree, I thought it could be done easily on a per-package basis.

Yes it can be
SIGGEN_EXCLUDERECIPES_ABISAFE +=3D "distcc-config->distcc"
should work.

> > Even with that problem addressed somehow, it leaves an issue with ipk
> > multilibs where the distcc-config allarch recipe would always depend
> > upon "distcc" and hence distcc would get pulled into the image,
> > regardless of any other multilib settings (which in turn pulls in gtk+
> > for example). A "lib64-xxx-image" would therefore end up with near
> > enough two copies of half the system due to this. This is something we
> > really need to fix in the opkg implementation of multilibs but I have no
> > idea how.
>=20
> This is more then just a problem in opkg, it may be more evident there.. =
but it=20
> is something we should look into as well.
>=20
> > Combine the two issues together, neither of which can be addressed at
> > this point of the release cycle and I put the above patch forwards until
> > we can better resolve this.
> >
> > Cheers,
> >
> > Richard
> >
> >
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--lrvsYIebpInmECXG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFsJ6MACgkQN1Ujt2V2gBxf4wCfQtChyJCHNporMPdv+pvYLF4H
APgAniPza6xUwsexDdXx4i7Xs3eC2k4y
=Mlcn
-----END PGP SIGNATURE-----

--lrvsYIebpInmECXG--
