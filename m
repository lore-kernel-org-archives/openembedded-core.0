Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RRmiK-0005me-21
	for openembedded-core@lists.openembedded.org;
	Sat, 19 Nov 2011 16:20:20 +0100
Received: by faat2 with SMTP id t2so5230395faa.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Nov 2011 07:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SHgt50LV7L15JHzxSYbpjXMAf5t186nU/u4oTf10LVk=;
	b=ZiFxvCwz5HVZvzpPUIjnFFzmnWyZ5OebRL0Wq9lVHYReGBRiVELXpN5K6glrgmMZTB
	oxjG3kDHHYMpaQiQFNZTCRff5zK2oEum6cUl33c4u2o1o5efFBdSgyZojvBjAJ/5gAdu
	0Mdn1S9O4+ZnppcGoBcapD7/Ivb5vQnuo9Bw0=
Received: by 10.152.136.2 with SMTP id pw2mr4779808lab.22.1321715631579;
	Sat, 19 Nov 2011 07:13:51 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id pi7sm3851492lab.5.2011.11.19.07.13.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 19 Nov 2011 07:13:50 -0800 (PST)
Date: Sat, 19 Nov 2011 16:13:37 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111119151337.GA3384@jama.jama.net>
References: <1321625613-30146-1-git-send-email-koen@dominion.thruhere.net>
	<CACW_hTYXNDBFWtxOK86fz5P55Va700rQYWpO6thrUH9OQsA+8Q@mail.gmail.com>
	<1423361.Uzi15gmuni@helios>
	<CACW_hTbp2zMZZQw17_-Pd-wSt3qfs1rs-CF8fLTyGssePwLk=A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACW_hTbp2zMZZQw17_-Pd-wSt3qfs1rs-CF8fLTyGssePwLk=A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] shared-mime-info: fix ordering of PACKAGES
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
X-List-Received-Date: Sat, 19 Nov 2011 15:20:20 -0000
X-Groupsio-MsgNum: 12650
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline

--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 19, 2011 at 04:02:49PM +0100, Frans Meulenbroeks wrote:
> 2011/11/18 Paul Eggleton <paul.eggleton@linux.intel.com>
>=20
> > On Friday 18 November 2011 15:28:28 Frans Meulenbroeks wrote:
> > > Is ordering of PACKAGES relevant? If so, please enlighten me why.
> >
> > It is. The packaging code reads this in order and the first package to
> > match a
> > file is the package that the file will go into; thus if you want to add=
 a
> > package that will include files that would normally be in one of the
> > default
> > packages you need to prepend to PACKAGES so that your new package gets =
the
> > files first.
> >
> > Ah, ok. understood.
> Not fully sure if the current behaviour is the most desirable one.
> Is it still possible to put a file into two packages by explicitly adding
> it to both?

And then make resulting packages RCONFLICTing each other? Imho this is
bad idea and it's good that this wasn't ever possible afaik.
=20
> Also it might be somewhat confusing that a line that adds say a dir to a
> package does not necessarily get all fies in that dir in the package
> Personally I think I prefer to have all added in that case, irrespective =
if
> a previous package already took a file from it.

Why confusing?
should only one package include all /usr/lib/foo and then separte
subpackages package only some parts of it so we won't pull whole big
/usr/lib/foo when we need in some image only
/usr/lib/foo/feature1 and /usr/lib/foo/feature2 in other package? And
what should shlibs report as feature1 provider? PN_feature1 or PN (which
also includes all /usr/lib/foo/feature1 files)?

Sorry but this idea seems wrong to me..

> Alternately it could be seen as a QA issue if a file could have been added
> to two packages (in which case a more strict pattern should have been used
> somewhere)
>=20
> Frans

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7Hx6EACgkQN1Ujt2V2gBy2SACdF+DaNpcrtF1JCt24j7rWR9eu
sAoAnjDS5L7YuisoHiHSR4ubz9yIrDQZ
=RZsG
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--
