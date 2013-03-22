Received: from mail-pb0-f41.google.com ([209.85.160.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UIyL8-00074E-O6
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 10:32:47 +0100
Received: by mail-pb0-f41.google.com with SMTP id um15so2953683pbc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2013 02:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=NC+e0kiCyJVfdzmwqrEpZiVTHedTlrUIuDhvAnd/Su8=;
	b=J9l52TgDcnrFiEOgfLL/mJoAgYpTVkjcrCvplo3XndOqxwDAVeUaWHL4y17mG2d5fz
	SonTAmRw5chlP6BPID5Exxz2brZO+TTJXa+A6AHIbWxsLrdbygey+WvMabw5I8+/adzd
	JFhn0JeAi7KWTzzFIlSAfqt0kYA+S61WooGOISxUZQtaUbzxx/avq5+BsZa+C/nC1hA0
	TMzxytqoyzC2FV6FEmIwVEGrU5AIHG/XIt3OvKTnDW867fc7bJh2C2F7s32E1AcuB+N0
	/9EpLxto9hMX/ZpfQBsVHyZtZAcTrNd9p6ZZY+6hBAb6uQpbLQse6pkbRIudehFXxENd
	23qQ==
X-Received: by 10.68.176.68 with SMTP id cg4mr1531888pbc.49.1363943752329;
	Fri, 22 Mar 2013 02:15:52 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ti8sm1726653pbc.12.2013.03.22.02.15.49
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 02:15:51 -0700 (PDT)
Date: Fri, 22 Mar 2013 10:15:49 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Message-ID: <20130322091549.GC3219@jama>
References: <1363792150-24988-1-git-send-email-Martin.Jansa@gmail.com>
	<13d91230233.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
MIME-Version: 1.0
In-Reply-To: <13d91230233.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: Use u-a for getopt
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
X-List-Received-Date: Fri, 22 Mar 2013 09:32:48 -0000
X-Groupsio-MsgNum: 36894
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4ZLFUWh1odzi/v6L"
Content-Disposition: inline

--4ZLFUWh1odzi/v6L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2013 at 09:08:34AM +0100, Bernhard Reutner-Fischer wrote:
> On 20 March 2013 16:09:10 Martin Jansa <martin.jansa@gmail.com> wrote:
> > * when enable busybox installs getopt to ${base_bindir} and
> >   util-linux to ${bindir}, so there is no file conflict, but
> >   because busybox implementation does not support --long used
>=20
> Do you mean that Busybox' getopt does not support long options?
> If so, enable FEATURE_GETOPT_LONG in busybox instead of this patch?

Having lsb working correctly even when someone has bad busybox defconfig
is right thing to do, isn't it?

busybox's getopt supports --longoptions, but util-linux's also supports
--long alias for that and that's what lsb is using

$ getopt --longoptions
getopt: option '--longoptions' requires an argument
Try `getopt --help' for more information.
$ getopt --long
getopt: option '--longoptions' requires an argument
Try `getopt --help' for more information.

busybox (IIRC even with FEATURE_GETOPT_LONG enabled) reports
getopt: unrecognized option '--long'
BusyBox v1.20.2 (2013-03-16 17:45:30 PDT) multi-call binary.

lsb already RDEPENDS on util-linux, changing lsb to use --longoptions
would be good, but having /bin/getopt and /usr/bin/getopt without u-a=20
to select preferred one is bad, that's why I used this solution instead.

> >   by lsb_release (which RDEPENDS on util-linux) we need to use
> >   util-linux getopt even when busybox defconfig has it enabled
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-core/util-linux/util-linux.inc       | 6 ++++--
> >  meta/recipes-core/util-linux/util-linux_2.22.2.bb | 2 +-
> >  2 files changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-core/util-linux/util-linux.inc=20
> > b/meta/recipes-core/util-linux/util-linux.inc
> > index 41a5471..c75d318 100644
> > --- a/meta/recipes-core/util-linux/util-linux.inc
> > +++ b/meta/recipes-core/util-linux/util-linux.inc
> > @@ -110,7 +110,7 @@ do_install () {
> >
> >          sbinprogs=3D"agetty ctrlaltdel cfdisk vipw vigr"
> >          sbinprogs_a=3D"pivot_root hwclock mkswap mkfs.minix fsck.minix=
 losetup=20
> >          swapon fdisk readprofile fsck blkid blockdev"
> > -        usrbinprogs_a=3D"chfn chsh hexdump last logger mesg newgrp=20
> > renice utmpdump wall setsid chrt flock"
> > +        usrbinprogs_a=3D"chfn chsh hexdump last logger mesg newgrp=20
> > renice utmpdump wall setsid chrt flock getopt"
> >          binprogs_a=3D"dmesg kill more umount mount login reset"
> >
> >          if [ "${base_sbindir}" !=3D "${sbindir}" ]; then
> > @@ -146,7 +146,7 @@ ALTERNATIVE_PRIORITY =3D "100"
> >
> >  ALTERNATIVE_${PN}  =3D "dmesg kill more mkswap blockdev pivot_root"
> >  ALTERNATIVE_${PN} +=3D "mkfs.minix hexdump last logger mesg renice wal=
l"
> > -ALTERNATIVE_${PN} +=3D "setsid chrt flock hwclock utmpdump eject"
> > +ALTERNATIVE_${PN} +=3D "setsid chrt flock hwclock utmpdump eject getop=
t"
> >
> >  ALTERNATIVE_LINK_NAME[dmesg] =3D "${base_bindir}/dmesg"
> >  ALTERNATIVE_LINK_NAME[kill] =3D "${base_bindir}/kill"
> > @@ -156,6 +156,8 @@ ALTERNATIVE_LINK_NAME[blockdev] =3D=20
> > "${base_sbindir}/blockdev"
> >  ALTERNATIVE_LINK_NAME[pivot_root] =3D "${base_sbindir}/pivot_root"
> >  ALTERNATIVE_LINK_NAME[mkfs.minix] =3D "${base_sbindir}/mkfs.minix"
> >  ALTERNATIVE_LINK_NAME[eject] =3D "${bindir}/eject"
> > +ALTERNATIVE_LINK_NAME[getopt] =3D "${base_bindir}/getopt"
> > +ALTERNATIVE_TARGET[getopt] =3D "${bindir}/getopt"
> >
> >  ALTERNATIVE_${PN}-doc =3D "mountpoint.1 last.1 mesg.1 wall.1 sulogin.8=
=20
> >  utmpdump.1"
> >
> > diff --git a/meta/recipes-core/util-linux/util-linux_2.22.2.bb=20
> > b/meta/recipes-core/util-linux/util-linux_2.22.2.bb
> > index 9b94a47..43a55a6 100644
> > --- a/meta/recipes-core/util-linux/util-linux_2.22.2.bb
> > +++ b/meta/recipes-core/util-linux/util-linux_2.22.2.bb
> > @@ -1,5 +1,5 @@
> >  MAJOR_VERSION =3D "2.22"
> > -PR =3D "r2"
> > +PR =3D "r3"
> >  require util-linux.inc
> >
> >  SRC_URI +=3D "file://util-linux-ng-replace-siginterrupt.patch \
> > --
> > 1.8.1.5
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
>=20
> Sent with AquaMail for Android
> http://www.aqua-mail.com
>=20
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4ZLFUWh1odzi/v6L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFMIUUACgkQN1Ujt2V2gBzeuwCeK3hkhbUs/GwricL0LHZp0u5B
2BkAoIJRMMjwtLKK3W4sZexrbdhcWX49
=V6xt
-----END PGP SIGNATURE-----

--4ZLFUWh1odzi/v6L--
