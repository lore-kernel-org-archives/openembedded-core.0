Received: from mail-pb0-f48.google.com ([209.85.160.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tynuo-000308-5q
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 19:22:22 +0100
Received: by mail-pb0-f48.google.com with SMTP id wy12so353594pbc.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jan 2013 10:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=z7PsAnJl89cQZmrGmJ4ka8KDMjt0wgYZNIa9V6raTfs=;
	b=l1R9Pjh7R7ow98HIpMW8Xvh05a1zi4yVlgIDWiGG646ujMM6ud3a2O5qbqsKw9RKTm
	bwFK/RDV47pE39eOB+TUG+x7UMgwZMPcupyYbC9sY/J32zAg8wl8hwbaW3fAj9mzVEPm
	ZkjyeBl8dxSp/c7pM35pEt8h8fb8S9lP/KlE+LrW9y3O/0n7cbUBQF1+lrs0OYRwQfwH
	l6J0dyy9XAFzkzvgcdbJ1xQiwSfPCuFrloLy7xcIwow0OI769/esx1XPWKQXg9IumNpN
	zLSq66iCvjTLJb4tmhHJiCcuyr7AHYp43+oSgfbrzGXsLM6QEP2A4Iz+BTjA1oeN0ad9
	OJ9w==
X-Received: by 10.68.219.67 with SMTP id pm3mr16247117pbc.150.1359137198698;
	Fri, 25 Jan 2013 10:06:38 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ot3sm1056843pbb.38.2013.01.25.10.06.35
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 10:06:37 -0800 (PST)
Date: Fri, 25 Jan 2013 19:06:34 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20130125180634.GC16904@jama.palm1.palmone.com>
References: <1359125976-26763-1-git-send-email-radu.moisan@intel.com>
	<CAJTo0LanTczb=N=dgA+3DHc=WABsivhsmPzO6riEy9_Neb6DbQ@mail.gmail.com>
	<20130125151241.GJ3200@jama>
	<CAJTo0LYW7BJ1WT=+GcHXDDRb+ONuKiUxw0ehEkNJgt=b6HY42Q@mail.gmail.com>
	<CALbNGRRM2u80Pdbt7XOhbWTDBBceEpmdN-1drCTVTp_Ez7UQFg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRRM2u80Pdbt7XOhbWTDBBceEpmdN-1drCTVTp_Ez7UQFg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] systemd: set default.target to multi-user.target
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
X-List-Received-Date: Fri, 25 Jan 2013 18:22:29 -0000
X-Groupsio-MsgNum: 34464
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="da4uJneut+ArUgXk"
Content-Disposition: inline

--da4uJneut+ArUgXk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 25, 2013 at 06:53:54PM +0100, Andreas M=FCller wrote:
> On Fri, Jan 25, 2013 at 6:50 PM, Burton, Ross <ross.burton@intel.com> wro=
te:
> > Hi,
> >
> > Been chatting to Richard.  How about systemd ships a symlink to
> > multi-user, and the X11 init script packages change the symlink to
> > graphical in their postinst.
> >
> > (we must remember to put this in the release notes for anyone who has
> > a custom X init script)
> >
> > Ross
> >
> Have not yet tested but how about:
>=20
> pkg_postinst_systemd () {
> if [ -n "$D" ]; then
> 	# no display-manager.service around?
> 	if [ ! -e ${D}${systemd_unitdir}/systemd/system/display-manager.service =
-a \

I think you wanted $D ^ here.

> 	     ! grep 'Alias=3Ddisplay-manager.service'
> ${D}${systemd_unitdir}/systemd/system ]; then
> 		ln -s ${systemd_unitdir}/system/multi-user.target
> ${D}${systemd_unitdir}/systemd/system/default.target
> 	fi
> fi

Cannot we just just u-a for default.target ? And each possible target
providing own u-a alternative (DMs with higher prio then systemd)?

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--da4uJneut+ArUgXk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlECyaoACgkQN1Ujt2V2gBzysgCgtTBXb4NxJ+NkqOqta2PuctWp
JngAnR4CnQT3X9FCpyCn77P/I7mzcsTO
=YHJ0
-----END PGP SIGNATURE-----

--da4uJneut+ArUgXk--
