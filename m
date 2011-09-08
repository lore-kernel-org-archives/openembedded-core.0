Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R1Z4n-0003Cg-F6
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Sep 2011 09:31:09 +0200
Received: by fxg11 with SMTP id 11so1321701fxg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Sep 2011 00:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NJou8TK4T7e5wi413SUB0E+R+VqiqkKS4/cAnyx3q9g=;
	b=MWcDKXeTODeg9aSLAMTKhEeOvds9qPGeLHu21sR2EgJHfBYJpBjNcCIIKobNZ+eeoM
	klhMJRSqqKqwHaJ+MofGIhq7q3aCzy3qir/HW0IwbdDiZAikBT4/C07y8HlZhYQE0IcL
	MSC7k50ShXOGfjyv0C64IFsw4GHwPEjCjZMGQ=
Received: by 10.223.42.6 with SMTP id q6mr615427fae.140.1315466766450;
	Thu, 08 Sep 2011 00:26:06 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k28sm947145faf.21.2011.09.08.00.26.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Sep 2011 00:26:04 -0700 (PDT)
Date: Thu, 8 Sep 2011 09:25:58 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110908072558.GA14074@jama.jama.net>
References: <79EAF6DF-304E-43B7-B97B-1FA6FFEBB91C@beagleboard.org>
MIME-Version: 1.0
In-Reply-To: <79EAF6DF-304E-43B7-B97B-1FA6FFEBB91C@beagleboard.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [RFC] Layer rework proposal
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
X-List-Received-Date: Thu, 08 Sep 2011 07:31:09 -0000
X-Groupsio-MsgNum: 9258
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline

--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 02, 2011 at 01:01:44PM +0200, Koen Kooi wrote:
> Hi,
>=20
> This has come up in the past, but no one has had time to site down and wr=
ite a proposal yet.
>=20
> Problem description: The OE-core layer has both too much in it and not en=
ough.
>=20
> Currently OE-core is basically a relabeling of the poky fork of OE. Due t=
o that heritage is has bits in it that aren't considered 'core', but serve =
as a testbed for the proper core metadata. The prime example of this is the=
 sato suite. To address this we will need to come up with guidelines what g=
oes into OE-core and what people expect to get out of it. Here's a start:
>=20
> Highlevel goals:
>=20
> 	1) Have a high quality set of "core" metadata
> 	2) OE-core needs to be useful on its own
> 	3) OE-core needs to be testable on its own
>=20
> Concrete rootfs goals:
>=20
> 	a) be able to build for the 4 blessed architectures: arm, mips, powerpc,=
 x86
> 	b) have multilib support
> 	c) be able to build a rootfs that has:
> 		o package management (rpm/deb/opkg)
> 		o networking support (ifupdown/connman/dnsmasq)
> 		o have remote access (dropbear/openssh)
> 		o have user management (shadow/pam)
>=20
> I think it's safe to say that we all agree on that minimum set of goals. =
 The tricky thing is where to put multimedia and GUI stuff. Qt and GTK are =
important enough to get put in core, but where do we draw the line? Where d=
o we stop splitting things in recipes-* and start splitting them into layer=
s and should those layers live in seperate repositories?
>=20
> My list of non-BSP, non-distro layers is:
>=20
> BBLAYERS =3D " \
>   ${TOPDIR}/sources/meta-openembedded/meta-oe \
>   ${TOPDIR}/sources/meta-openembedded/meta-efl \
>   ${TOPDIR}/sources/meta-openembedded/meta-gpe \
>   ${TOPDIR}/sources/meta-openembedded/meta-gnome \
>   ${TOPDIR}/sources/meta-openembedded/meta-xfce \
>   ${TOPDIR}/sources/openembedded-core/meta \
>   "
>=20
> The gpe, gnome and xfce layers need things like glib-2.0 and gtk, but the=
re's a larger overlay between the 3, so gpe and xfce end up depending on th=
e gnome layer. Meta-oe is the place where people put things they don't want=
 to maintain in a seperate layer, which isn't going to scale longterm.
>=20
> My not-so-fully-formed idea is:
>=20
> core - implements above goals
> x11 - base xorg libs, headers, apps. Has bbappends for core recipes to ad=
d x11 support via DISTRO_FEATURES
> gtk - base gtk things, libs, themes, icons, modules
> qt - base qt things + qwt
>=20
> efl - depends on core,x11
> gnome - depends on core,x11,gtk
> gpe - depends on core,x11,gtk
> opie - depends on core,qt
> sato - depends on core,x11,gtk
> xfce - depends on core,x11,gtk, gnome
>=20
> and finally:
>=20
> oe - leftovers
>=20
> With this layer structure as starting point can we start a discussion on =
how people would like to set it split? I'd like to leave the question of wh=
ich layer goes into what repository for later.

I like this proposal.

The point of being able to test oe-core also with graphics (sato) is
right, but to test that oe-core is usable in oe-core/x11/gtk/sato layer
stack is IMHO even more important as many people are using oe-core just
as one of the layers.

I've started to merge and upgrade x11 recipes from meta-oe to oe-core=20
(to be able to create x11 layer from it, if we decide so).
http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3Djan=
sa/x11
http://git.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=3Djan=
sa/x11
http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dshortlog;h=3Dre=
fs/heads/x11

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5obgYACgkQN1Ujt2V2gBwsPwCcCxb6PJ3HZGims4yeEYbxyaEs
SDAAoLpW0FaFfbZGR0PzQyrfK60bO0Rh
=RsK5
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--
