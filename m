Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SC6Ka-0007J0-U2
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 11:35:16 +0200
Received: by wera1 with SMTP id a1so4024158wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 02:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6N/EOd7zhzh9vxDVuQFi1DWh91mtlUyEa6TWRKiDr3s=;
	b=BF516cwR39VKxogP+TI9AYcXK2TvLU4hlcdWGZLbFoLY94E2pbNxAUgaoUKBTrjSDF
	yxqux/FDab4/hXKyOWLBJfAtGY8R82p+mNY4lDgsbXm2dcTRKYDuadKgqAblmSasqaR9
	2/4l+gZ/0oPBXbkUwnaKgGlBiHCJCJx3QLV/AiH5rjZPm5ZupApnkNobYzGgkvTVg+3c
	q/OpEQGE/ivOMFsReOvR6KRG2Nedjqr3AaNUcQz0HgxbR1pum9Htrf6C53BFOE9u/XgQ
	PF33A92HRj/msHpGlJpkLcXuL/XeMo8d+dZXlV27PIz8NSYGEVsCblDZEVYNO8eR7wzc
	c0AA==
Received: by 10.180.102.102 with SMTP id fn6mr16906492wib.10.1332753977235;
	Mon, 26 Mar 2012 02:26:17 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l5sm39459959wia.11.2012.03.26.02.26.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Mar 2012 02:26:16 -0700 (PDT)
Date: Mon, 26 Mar 2012 11:26:13 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120326092613.GA3941@jama.jama.net>
References: <1332618407-30816-1-git-send-email-obi@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <1332618407-30816-1-git-send-email-obi@opendreambox.org>
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
X-List-Received-Date: Mon, 26 Mar 2012 09:35:17 -0000
X-Groupsio-MsgNum: 19718
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline

--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 24, 2012 at 08:46:47PM +0100, Andreas Oberritter wrote:
> Commit 68dc2a3fa30c03a196d650de34d0c657a7b85454 broke opkg upgrade:
>=20
> | update-alternatives: Error: cannot register alternative watch to
> | /usr/bin/watch since it is already registered to /bin/watch
>=20
> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> ---
> * Martin, can you please verify whether this really helps? I've built a
>   rootfs with both busybox watch and procps installed. I didn't actually
>   do an opkg upgrade.

Maybe it does for 2nd and later upgrades, but for some reason I now get
the same error from busybox upgrade too, probably because old u-a for
watch is removed only in busybox's prerm and not during upgrade.

SHR root@Nokia-N900 / $ ll /usr/bin/watch*
lrwxrwxrwx 1 root root   17 Mar 26 09:13 /usr/bin/watch ->
=2E./../bin/busybox
-r-xr-xr-x 1 root root 9508 Mar 26 08:48 /usr/bin/watch.procps
SHR root@Nokia-N900 / $ ls -l /bin/watch
lrwxrwxrwx 1 root root 7 Mar 23 16:06 /bin/watch -> busybox

SHR root@Nokia-N900 / $ cat /etc/busybox.links  | grep watch
/usr/bin/watch
SHR root@Nokia-N900 / $ cat /var/lib/opkg/alternatives/watch
/bin/watch
busybox 50

And also busybox is upgraded after procps so even with old alternative
removed it would take 2 opkg upgrades to get it sorted.. but that's
quite common issue :/. e.g. u-a for runlevel causes many postinst issues
because update-rc.d assumes that runlevel is available during upgrade,
but if sysvinit (as runlevel provider) is configured after e.g. dbus you
get:

Configuring dbus-1.
Cannot create link over existing -/etc/resolv.conf-.
/usr/sbin/update-rc.d: line 173: runlevel: not found
Unable to determine current runlevel
=2E..
Configuring busybox-syslog.
update-alternatives: Linking //etc/init.d/syslog to syslog.busybox
update-alternatives: Linking //etc/syslog-startup.conf to syslog-startup.co=
nf.busybox
/usr/sbin/update-rc.d: line 173: runlevel: not found
Unable to determine current runlevel
=2E..
Configuring busybox-udhcpc.
/usr/sbin/update-rc.d: line 173: runlevel: not found
Unable to determine current runlevel
=2E..
Configuring sysvinit.
update-alternatives: Linking //bin/mountpoint to mountpoint.sysvinit
update-alternatives: Linking //sbin/halt to halt.sysvinit
update-alternatives: Linking //sbin/reboot to reboot.sysvinit
update-alternatives: Linking //sbin/runlevel to runlevel.sysvinit
update-alternatives: Linking //sbin/shutdown to shutdown.sysvinit
update-alternatives: Linking //sbin/poweroff to poweroff.sysvinit
update-alternatives: Linking //usr/bin/last to last.sysvinit
update-alternatives: Linking //usr/bin/mesg to mesg.sysvinit
update-alternatives: Linking //usr/bin/wall to wall.sysvinit
update-alternatives: Linking //sbin/init to /sbin/init.sysvinit

And dbus-1. busybox-syslog. busybox-udhcpc. postinsts are fine on 2nd run.

So this patch looks good, but there are still issues with u-a calls in post=
inst.

Cheers,
>=20
>  .../busybox/busybox-1.19.4/watch.in.usr-bin.patch  |   29 ++++++++++++++=
++++++
>  meta/recipes-core/busybox/busybox_1.19.4.bb        |    3 +-
>  2 files changed, 31 insertions(+), 1 deletions(-)
>  create mode 100644 meta/recipes-core/busybox/busybox-1.19.4/watch.in.usr=
-bin.patch
>=20
> diff --git a/meta/recipes-core/busybox/busybox-1.19.4/watch.in.usr-bin.pa=
tch b/meta/recipes-core/busybox/busybox-1.19.4/watch.in.usr-bin.patch
> new file mode 100644
> index 0000000..e8e1edf
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox-1.19.4/watch.in.usr-bin.patch
> @@ -0,0 +1,29 @@
> +Upstream-Status: Inappropriate [configuration]
> +
> +From f2372ab626a395d067704f4c318180fb6039de15 Mon Sep 17 00:00:00 2001
> +From: Andreas Oberritter <obi@opendreambox.org>
> +Date: Sat, 24 Mar 2012 17:36:48 +0100
> +Subject: [PATCH] watch: move from /bin to /usr/bin for compatibility with
> + procps
> +
> +Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> +---
> + include/applets.src.h |    2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/include/applets.src.h b/include/applets.src.h
> +index 87d9cbb..c148a8c 100644
> +--- a/include/applets.src.h
> ++++ b/include/applets.src.h
> +@@ -404,7 +404,7 @@ IF_VLOCK(APPLET(vlock, BB_DIR_USR_BIN, BB_SUID_REQUI=
RE))
> + IF_VOLNAME(APPLET(volname, BB_DIR_USR_BIN, BB_SUID_DROP))
> + /* Needs to be run by root or be suid root - needs to write to /dev/TTY=
: */
> + IF_WALL(APPLET(wall, BB_DIR_USR_BIN, BB_SUID_REQUIRE))
> +-IF_WATCH(APPLET(watch, BB_DIR_BIN, BB_SUID_DROP))
> ++IF_WATCH(APPLET(watch, BB_DIR_USR_BIN, BB_SUID_DROP))
> + IF_WATCHDOG(APPLET(watchdog, BB_DIR_SBIN, BB_SUID_DROP))
> + IF_WC(APPLET(wc, BB_DIR_USR_BIN, BB_SUID_DROP))
> + IF_WGET(APPLET(wget, BB_DIR_USR_BIN, BB_SUID_DROP))
> +--=20
> +1.7.5.4
> +
> diff --git a/meta/recipes-core/busybox/busybox_1.19.4.bb b/meta/recipes-c=
ore/busybox/busybox_1.19.4.bb
> index dff616d..3f22669 100644
> --- a/meta/recipes-core/busybox/busybox_1.19.4.bb
> +++ b/meta/recipes-core/busybox/busybox_1.19.4.bb
> @@ -1,5 +1,5 @@
>  require busybox.inc
> -PR =3D "r0"
> +PR =3D "r1"
> =20
>  SRC_URI =3D "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=
=3Dtarball \
>             file://udhcpscript.patch \
> @@ -8,6 +8,7 @@ SRC_URI =3D "http://www.busybox.net/downloads/busybox-${P=
V}.tar.bz2;name=3Dtarball \
>             file://get_header_tar.patch \
>             file://busybox-appletlib-dependency.patch \
>             file://run-parts.in.usr-bin.patch \
> +           file://watch.in.usr-bin.patch \
>             file://busybox-udhcpc-no_deconfig.patch \
>             file://find-touchscreen.sh \
>             file://busybox-cron \
> --=20
> 1.7.5.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Dxnq1zWXvFF0Q93v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9wNjUACgkQN1Ujt2V2gBz52gCff/Nv3I75eLNMQDJJPWZWkG7E
c44AoJjK3Sy3u2Kqwdd/iC8Q0u+r4ywE
=pYz5
-----END PGP SIGNATURE-----

--Dxnq1zWXvFF0Q93v--
