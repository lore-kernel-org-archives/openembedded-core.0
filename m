Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SC7yv-0001Oc-41
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 13:21:01 +0200
Received: by wera1 with SMTP id a1so4082258wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 04:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2axmLqTzqGeIJTg4MuZb+3fOvMWjUcS5QNO1vkfAQQw=;
	b=ZqA33+OJyTR2hYYcPUUU4XH0vMYRexepMfTtbo2PbHA1sAWWczELcKQjhExXrJ5+7u
	Blr2VHDEBLDjgiN7UbEPVlOE25VPJ/fnIs3TOMQOmTD2TviLa5TK14d5OqGyEIHPFcTE
	htDJPVVbNmxq+nEfPpp2ev0mp0+nX9l8aKN1VxpSAyKc9Fam7Ubr6WPZOz7gKvnFdsnL
	ZyEhtB0lw0mdYU9CG0ReoYPjzTIsCNGrtd/t1Jb/Tm4z7/4sVPlcKyoVqm0wvX/Wxhpl
	D7UDzVenlaUzyvuUAa3dWS5PW2U50mC5xy4jqdwzEAUQc63IyEkoZUpp26BxsQZDSI87
	CDgA==
Received: by 10.180.100.2 with SMTP id eu2mr17695274wib.1.1332760321548;
	Mon, 26 Mar 2012 04:12:01 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k6sm40081162wie.9.2012.03.26.04.12.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Mar 2012 04:12:00 -0700 (PDT)
Date: Mon, 26 Mar 2012 13:11:58 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120326111157.GB3941@jama.jama.net>
References: <1332618407-30816-1-git-send-email-obi@opendreambox.org>
	<20120326092613.GA3941@jama.jama.net>
	<1332759748.28414.105.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1332759748.28414.105.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] busybox: move watch to /usr/bin for compatibility with procps
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
X-List-Received-Date: Mon, 26 Mar 2012 11:21:01 -0000
X-Groupsio-MsgNum: 19738
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Yylu36WmvOXNoKYn"
Content-Disposition: inline

--Yylu36WmvOXNoKYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 26, 2012 at 12:02:28PM +0100, Richard Purdie wrote:
> On Mon, 2012-03-26 at 11:26 +0200, Martin Jansa wrote:
> > On Sat, Mar 24, 2012 at 08:46:47PM +0100, Andreas Oberritter wrote:
> > > Commit 68dc2a3fa30c03a196d650de34d0c657a7b85454 broke opkg upgrade:
> > >=20
> > > | update-alternatives: Error: cannot register alternative watch to
> > > | /usr/bin/watch since it is already registered to /bin/watch
> > >=20
> > > Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> > > ---
> > > * Martin, can you please verify whether this really helps? I've built=
 a
> > >   rootfs with both busybox watch and procps installed. I didn't actua=
lly
> > >   do an opkg upgrade.
> >=20
> > Maybe it does for 2nd and later upgrades, but for some reason I now get
> > the same error from busybox upgrade too, probably because old u-a for
> > watch is removed only in busybox's prerm and not during upgrade.
> >=20
> > SHR root@Nokia-N900 / $ ll /usr/bin/watch*
> > lrwxrwxrwx 1 root root   17 Mar 26 09:13 /usr/bin/watch ->
> > ../../bin/busybox
> > -r-xr-xr-x 1 root root 9508 Mar 26 08:48 /usr/bin/watch.procps
> > SHR root@Nokia-N900 / $ ls -l /bin/watch
> > lrwxrwxrwx 1 root root 7 Mar 23 16:06 /bin/watch -> busybox
> >=20
> > SHR root@Nokia-N900 / $ cat /etc/busybox.links  | grep watch
> > /usr/bin/watch
> > SHR root@Nokia-N900 / $ cat /var/lib/opkg/alternatives/watch
> > /bin/watch
> > busybox 50
> >=20
> > And also busybox is upgraded after procps so even with old alternative
> > removed it would take 2 opkg upgrades to get it sorted.. but that's
> > quite common issue :/. e.g. u-a for runlevel causes many postinst issues
> > because update-rc.d assumes that runlevel is available during upgrade,
> > but if sysvinit (as runlevel provider) is configured after e.g. dbus you
> > get:
> >=20
> > Configuring dbus-1.
> > Cannot create link over existing -/etc/resolv.conf-.
> > /usr/sbin/update-rc.d: line 173: runlevel: not found
> > Unable to determine current runlevel
> > ...
> > Configuring busybox-syslog.
> > update-alternatives: Linking //etc/init.d/syslog to syslog.busybox
> > update-alternatives: Linking //etc/syslog-startup.conf to syslog-startu=
p.conf.busybox
> > /usr/sbin/update-rc.d: line 173: runlevel: not found
> > Unable to determine current runlevel
> > ...
> > Configuring busybox-udhcpc.
> > /usr/sbin/update-rc.d: line 173: runlevel: not found
> > Unable to determine current runlevel
> > ...
> > Configuring sysvinit.
> > update-alternatives: Linking //bin/mountpoint to mountpoint.sysvinit
> > update-alternatives: Linking //sbin/halt to halt.sysvinit
> > update-alternatives: Linking //sbin/reboot to reboot.sysvinit
> > update-alternatives: Linking //sbin/runlevel to runlevel.sysvinit
> > update-alternatives: Linking //sbin/shutdown to shutdown.sysvinit
> > update-alternatives: Linking //sbin/poweroff to poweroff.sysvinit
> > update-alternatives: Linking //usr/bin/last to last.sysvinit
> > update-alternatives: Linking //usr/bin/mesg to mesg.sysvinit
> > update-alternatives: Linking //usr/bin/wall to wall.sysvinit
> > update-alternatives: Linking //sbin/init to /sbin/init.sysvinit
> >=20
> > And dbus-1. busybox-syslog. busybox-udhcpc. postinsts are fine on 2nd r=
un.
> >=20
> > So this patch looks good, but there are still issues with u-a calls in =
postinst.
>=20
> I'll merge the patch but we should probably open a bug about these u-a

yes please it improves situation for people with reflashed image.. other
need just rm /var/lib/opkg/alternatives/watch to fix upgrade path

> issues so we can properly fix it at some point.

Fixing this issue will be a bit problematic, because for busybox when
you use -force-reinstall it can remove some required commands you need
to install it after it's removed.

So e.g. you need standalone wget and sed to be able to use
opkg install -force-reinstall, but -force-reinstall also doesn't resolve
this watch issue completely, because after first upgrade there is=20
new /usr/bin/watch path in /etc/busybox.links so prerm also doesn't
remove stalled /bin/watch alternative :/.

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Yylu36WmvOXNoKYn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9wTv0ACgkQN1Ujt2V2gBymdQCdFXyuru4ajk1qcMMoG/7eb3JI
9mcAnROuNISjWn6s9lKnCd8EpLlZzTWd
=BpVl
-----END PGP SIGNATURE-----

--Yylu36WmvOXNoKYn--
