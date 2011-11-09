Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1ROFDO-0001VZ-6M
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 21:57:46 +0100
Received: (qmail invoked by alias); 09 Nov 2011 20:51:25 -0000
Received: from p5B0A37AB.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.55.171]
	by mail.gmx.net (mp049) with SMTP; 09 Nov 2011 21:51:25 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX199wj5c0Jd9QuOlGxkvndPLFMenxaYsw7ee6lw+t9
	jGU/4NoFfUWM8X
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 9 Nov 2011 21:56:20 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-100.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <201110272230.29012.schnitzeltony@gmx.de>
	<201111092138.57868.schnitzeltony@gmx.de>
	<20111109203916.GG21022@jama.jama.net>
In-Reply-To: <20111109203916.GG21022@jama.jama.net>
MIME-Version: 1.0
Message-Id: <201111092156.20514.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: Trouble by last dbus patch (46e6c3fa8034b12d178d605f3f5d7efe69671a13)?
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
X-List-Received-Date: Wed, 09 Nov 2011 20:57:46 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wednesday, November 09, 2011 09:39:16 PM Martin Jansa wrote:
> On Wed, Nov 09, 2011 at 09:38:57PM +0100, Andreas M=FCller wrote:
> > On Saturday, October 29, 2011 12:33:46 AM Andreas M=FCller wrote:
> > > On Friday, October 28, 2011 12:22:11 PM Richard Purdie wrote:
> > > > On Thu, 2011-10-27 at 22:30 +0200, Andreas M=FCller wrote:
> > > > > Since the last updates of all layers (angstrom based) I have issu=
es
> > > > > with
> > > > >=20
> > > > > * networkmanager/nm-applet (meta-oe): I am not allowed to change
> > > > > the settings
> > > > >=20
> > > > >   any more
> > > > >=20
> > > > > * xfce-session (meta-oe): Logging out takes very long and
> > > > > Restart/Shutdown is
> > > > >=20
> > > > >   disabled
> > > > >=20
> > > > > I remember that I had similar issues a while ago. That could be
> > > > > worked around by starting some dbus stuff ( do not exactly
> > > > > remember what it was ).
> > > > >=20
> > > > > With this vague idea I checked and found in oe-core:
> > > > > | dbus: use useradd class to allow use in read-only filesystems
> > > > > | author	Otavio Salvador <otavio@ossystems.com.br>
> > > > > | commit	46e6c3fa8034b12d178d605f3f5d7efe69671a13
> > > > >=20
> > > > > Not understanding totally what is all about I see in /etc/passw
> > > > >=20
> > > > > | messagebus:x:999:998::/var/lib/dbus:/bin/sh
> > > > >=20
> > > > > but I don't have /var/lib/dbus on my sytem!!
> > > > >=20
> > > > > I did not check yet, but maybe this is an incompatibilty with
> > > > > angstrom custom
> > > > >=20
> > > > > | FILESYSTEM_PERMS_TABLES =3D "fs-perms-angstrom.txt"
> > > > >=20
> > > > > somebody around to enlight the darkness?
> > > >=20
> > > > There are some issues due to the orcering of when we now start some
> > > > of the services. After the above change the dbus service starts much
> > > > earlier on first boot, before some of the other postinstalls have
> > > > run. This can mean you see errors due to users which have not yet
> > > > been created by postinstalls (e.g. avahi or xuser) yet the dbus
> > > > files reference these and its trying to start those services.
> > > >=20
> > > > We're looking at fixing the remaining adduser type postinstalls to
> > > > address this. I'm not sure if this is related to the problem you we=
re
> > > > seeing above or not.
> > >=20
> > > FYI: reverting the patch fixes mentioned issues here.
> >=20
> > Maybe I missed something but after starting a new image - to get the
> > errors mentioned above worked around - I still have to do manually on
> > the machine :
> >=20
> > chown messagebus:messagebus /var/run/dbus ${D}${localstatedir}/lib/dbus
> > chown root:messagebus /usr/libexec/dbus-daemon-launch-helper
> > chmod 4754 /usr/libexec/dbus-daemon-launch-helper
> >=20
> > As long as this is not fixed, can we have this additionally in
> > pkg_postinst_dbus temporary?
>=20
> You have wrong ${D} there, but you can apply
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dshr&id=
=3D283b
> 046e6e38afb63125776afdb5ee5fea0d0b7e which still works, but it's not prop=
er
> fix.
That's exactly the workaround I meant :)

Andreas


