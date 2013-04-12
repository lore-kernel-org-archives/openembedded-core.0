Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQfTP-0005jX-UC
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 17:01:15 +0200
Received: by mail-da0-f47.google.com with SMTP id s35so1171903dak.20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2013 07:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=PA35fBSEaU9NRSfUqhoRkT8vxbteYLkExSXr8yZv4XA=;
	b=YZZrFAZhmbwOzkinZHig2aAeztIRLUmo4VBN0wE4aQTLZZacSll4drgjIH5LPPrqrR
	ZIzdc44n4SVo0bUIn373Gfq5c9Kwxcg2b3L/qo/bF4iXIBzG2we7h5upYLtcukS6sJ+G
	Ix6qDzhOv83yy9OPQ5ZMyCrnjcCgZ6ENqRqe8vqc5Iiu9Mf5HRzEmdGUx605O8UGPu1Y
	/CBjt3DmQjMgNh1D9aOWJYZZ/8T/XYjZLwXrCrl48wek+HBze3/O3bMHx5qtUIChVrBm
	KiYdqvCz0IIo8M1tArCD0vvgJ7E/dWVGgKHVfgQ/OJXNsGIH9WlXtCN2hrf0xJvf81Dg
	6+Yg==
X-Received: by 10.68.247.100 with SMTP id yd4mr15111866pbc.47.1365777822555;
	Fri, 12 Apr 2013 07:43:42 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id jw10sm8863112pbb.3.2013.04.12.07.43.39
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 07:43:41 -0700 (PDT)
Date: Fri, 12 Apr 2013 16:43:35 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130412144335.GR2477@jama>
References: <20130412142015.GP2477@jama>
	<CAJTo0LayWKMpxzsX4t67LepAg3AjhJXWtQvoU8-NVG5Qi5eTpA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LayWKMpxzsX4t67LepAg3AjhJXWtQvoU8-NVG5Qi5eTpA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: wpa-supplicant postinsts failing without sysvinit in DISTRO_FEATURES
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
X-List-Received-Date: Fri, 12 Apr 2013 15:01:16 -0000
X-Groupsio-MsgNum: 37834
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FiqEyLLt06qkB6ow"
Content-Disposition: inline

--FiqEyLLt06qkB6ow
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2013 at 03:24:57PM +0100, Burton, Ross wrote:
> On 12 April 2013 15:20, Martin Jansa <martin.jansa@gmail.com> wrote:
> > oe-core/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
> >
> > defines pkg_postinst_wpa-supplicant
> > with:
> >         if [ "x$DBUSPID" !=3D "x" ]; then
> >                 /etc/init.d/dbus-1 reload || true
> >         fi
> >
> > and /etc/init.d/dbus-1 is missing without sysvinit in DISTRO_FEATURES
> >
> > Thanks to "true" it doesn't fail completely, but if the goal is no
> > warnings in images then errors should be fixed too :)
>=20
> We're going to see stuff like this a lot - clearly we need some
> abstraction over this.  One-off for dbus, or a general-purpose small
> abstraction over invoking systemctl or init scripts?

I have noticed this when testing upgrade paths, but general-purpose
abstraction will became quite complicated in images which have both
sysvinit and systemd scripts (I guess that checking which init is
running will be needed to decide if /etc/init.d/foo or systemctl should be
called :/).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FiqEyLLt06qkB6ow
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFoHZcACgkQN1Ujt2V2gBz7hwCfV82qhhLhWsHkpL5GH1jV8py+
8jkAn2XsuhcHhoRnmTVUtKG7zxvhSz1x
=vCo1
-----END PGP SIGNATURE-----

--FiqEyLLt06qkB6ow--
