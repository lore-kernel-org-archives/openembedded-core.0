Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RQxsW-0005lu-69
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 10:03:28 +0100
Received: by bkbzs2 with SMTP id zs2so1684553bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 00:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ImSm6RHiw0RMsmQ9Tuj33hPTYICT4VCPxshQGOUPras=;
	b=YTrHJONHbkM1vapbz8l/UHfD4ZZhH/llen95oOLdbcQmRzWV6Qx3+fTXNG8/ACCCho
	Q776NGQ0XIUCVoi3MdNirP336tAUQBxPChNFM9aHk6Ig0KLTfcxHWUTzHHn6hSuhNAQE
	fM5c60Wu2eKhsdoq9rv9Eh2ft8CsWX2YZbUQw=
Received: by 10.205.120.2 with SMTP id fw2mr24245703bkc.10.1321520223387;
	Thu, 17 Nov 2011 00:57:03 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y2sm1490276fag.12.2011.11.17.00.57.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Nov 2011 00:57:02 -0800 (PST)
Date: Thu, 17 Nov 2011 09:56:50 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111117085650.GA23959@jama.jama.net>
References: <1321496999.1264.24.camel@localhost.localdomain>
	<CAEsOVNdL3bTKA9rv6p9SEpvoY+a3b5y6Ftn=ySMVdgkW3nMm3w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEsOVNdL3bTKA9rv6p9SEpvoY+a3b5y6Ftn=ySMVdgkW3nMm3w@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: how to exclude files when packaging?
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
X-List-Received-Date: Thu, 17 Nov 2011 09:03:28 -0000
X-Groupsio-MsgNum: 12561
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Content-Disposition: inline

--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 17, 2011 at 08:14:06AM +0000, McClintock Matthew-B29882 wrote:
> On Wed, Nov 16, 2011 at 8:29 PM, Ni Qingliang
> <niqingliang@insigma.com.cn> wrote:
> > Hello, All:
> >        I'm working on opensaf, wrote a bb file for it,
> > and found that the FILES_${PN} has included /usr/lib/${PN}/*.
> > but there are some .a and .so(symlink) in /usr/lib/${PN}, which will
> > result QA issue.
> >        how to exclude some files (e.g. *.a, *.so) in FILES_${PN}?
> >
> >        there are some elf in /usr/lib/${PN} whose prefix is not 'lib', =
so if
> > no 'exclude' feature, I must redefine FILES_${PN} like this:
> >        FILES_${PN} =3D "/usr/lib/${PN}/*.so.* \
> >                       /usr/lib/${PN}/saf* \
> >                       /usr/lib/${PN}/open* \
> >                       /usr/lib/${PN}/immload \
> >                       /usr/lib/${PN}/nid_tipc \
> >                       /usr/lib/${PN}/smf* \
> >                       /usr/lib/${PN}/clc-cli/*"
>=20
> Explicitly list what you want in FILES_${PN}
>=20
> FILES_${PN} =3D /usr/lib/${PN}/saf
>=20
> Make another PACKAGE for other files
>=20
> PACKAGES =3D+ ${PN}-misc
> FILES_${PN}-misc =3D /usr/lib/${PN}/saf
>=20
> Maybe someone else can chime in if there is a way to mask certain files...

Be carefull with order of packages in PACKAGES usually you need it from
most specific files pattern to less specific and the problem above is
related to this:

http://lists.linuxtogo.org/pipermail/openembedded-core/2011-October/011283.=
html

which wasn't applied, so yes you have to redefine whole FILES_${PN} or
the part you need for your app, like I did for syslog-ng
http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-October/035607=
=2Ehtml

Regards,

>=20
> -M
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7EzFIACgkQN1Ujt2V2gBw6HQCfVFlNE0YQH4b4Zz3e5UM3u0+3
3RsAoJ+PTIfyoqYyZ9CMkcW/DF9MoteN
=aI7C
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--
