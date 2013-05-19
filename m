Received: from mail-pa0-f43.google.com ([209.85.220.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UdyoS-0007uD-L6
	for openembedded-core@lists.openembedded.org;
	Sun, 19 May 2013 10:18:45 +0200
Received: by mail-pa0-f43.google.com with SMTP id hz10so4848578pad.16
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 May 2013 00:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=K4FFph91jN5y9Yje6e8TMAUWNQIjpLb7mwpwqwDU4BY=;
	b=LDg2m1WMuE9dnBJF/DNminnTKtsBkUsrtSi2By1Kwl35o0TtrlpXkY/0+Sj0NYSzzm
	B0/l3f2on8O56YmoBEMgdiXQ/FkOiMyjQJ0YP5nGJA0u1Y94TgvqPvz2OvxItNv2DtkE
	xXCGGniz2rHPTbAMVk3Ku39Wvm7z9vHmxphMaYZ5yi/RMaETa0kIVM1xkE1djP2E4qPE
	Q/yNRNA4vCEj6COfPgD8C/SS73dZyLhYEb9yHUR/fbkYwKfrXFL3xQCwcpxxhH+XK4kL
	hCA1qbocpiGzmIAh7LDwUTchDIhIkxTjsESd6cTuKIjaBgDU+47kZ3wZvl3vWCrs1YDC
	c7FQ==
X-Received: by 10.68.172.65 with SMTP id ba1mr55901017pbc.166.1368950373626;
	Sun, 19 May 2013 00:59:33 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k2sm20242141pat.7.2013.05.19.00.59.30 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 19 May 2013 00:59:32 -0700 (PDT)
Date: Sun, 19 May 2013 09:59:22 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Message-ID: <20130519075922.GC3196@jama>
References: <1367917522-29378-1-git-send-email-paul@paulbarker.me.uk>
	<CANyK_8e2uowYYky7Oq=yDsZcxWNVMmeTjaVxWEhubVspuQrLDw@mail.gmail.com>
	<20130508191416.GC3188@jama>
MIME-Version: 1.0
In-Reply-To: <20130508191416.GC3188@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt4: remove trailing slash from prefix
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
X-List-Received-Date: Sun, 19 May 2013 08:18:47 -0000
X-Groupsio-MsgNum: 39421
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vOmOzSkFvhd7u8Ms"
Content-Disposition: inline

--vOmOzSkFvhd7u8Ms
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 08, 2013 at 09:14:16PM +0200, Martin Jansa wrote:
> On Wed, May 08, 2013 at 07:07:57PM +0100, Paul Barker wrote:
> > On 7 May 2013 10:05, Paul Barker <paul@paulbarker.me.uk> wrote:
> > > The trailing slashs on "Prefix=3D${prefix}/" and "-prefix ${prefix}/"=
 are passed
> > > through to the generated pkgconfig files and may be joined to paths l=
ike
> > > "/include" yielding a final path with a double forward-slash (eg.
> > > "/usr//include"). This may end up in the debugging symbols in other a=
pplications
> > > or libraries which depend on qt4 which in turn causes the debugedit p=
rogram to
> > > fail with the message "canonicalization unexpectedly shrank by one ch=
aracter"
> > > when it tries to replace the double forward-slash with a single forwa=
rd-slash.
> > > Thus the function split_and_strip_files fails and ultimately do_packa=
ge fails.
> > >
> > > As this slash is removed from the prefix it is added into the regular=
 expression
> > > used to fix up pkgconfig files later in the recipe.
> > >
> > > This error was seen in vlc in meta-openembedded and should be solved =
by this
> > > change in openembedded-core.
> > >
> > > Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> >=20
> > Martin, could you check whether applying this patch to oe-core fixes
> > the vlc do_package failure you were seeing?
>=20
> Yes I plan to include it in next build, but I would like to fix
> webkit-efl build with newer binutils first, because that adds 3.9M lines=
=20
> from log.do_compile and resulting logs from world have 600M :/

Yes it fixed it, thanks!

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vOmOzSkFvhd7u8Ms
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGYhloACgkQN1Ujt2V2gBxweACePYW/Kdq5ZCR27qSdqy98BaJJ
EgYAoJmfMUATpY4gSfOzgaA5t0Z4e8Qo
=prK1
-----END PGP SIGNATURE-----

--vOmOzSkFvhd7u8Ms--
