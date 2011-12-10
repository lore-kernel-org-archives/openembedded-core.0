Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RZB7L-0000lM-54
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Dec 2011 01:48:43 +0100
Received: (qmail invoked by alias); 10 Dec 2011 00:41:48 -0000
Received: from p5B0A26D1.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.38.209]
	by mail.gmx.net (mp003) with SMTP; 10 Dec 2011 01:41:48 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19QqFpFG7pQSGetuX9Uu0CLbO/kEbyzSi82ikdgBo
	hmpV5G6C/kdVlF
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Sat, 10 Dec 2011 01:41:56 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-103.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1323279247.30601.51.camel@ted> <1323443103.5309.178.camel@ted>
	<57952375-D968-4AC3-BAF0-88B571479CDB@dominion.thruhere.net>
In-Reply-To: <57952375-D968-4AC3-BAF0-88B571479CDB@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201112100141.57022.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH] bitbake.conf/image.bbclass: Ensure images use the correct passwd/group files
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
X-List-Received-Date: Sat, 10 Dec 2011 00:48:43 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Friday, December 09, 2011 04:10:36 PM Koen Kooi wrote:
> Op 9 dec. 2011, om 16:05 heeft Richard Purdie het volgende geschreven:
> > On Fri, 2011-12-09 at 14:44 +0100, Koen Kooi wrote:
> >> Op 8 dec. 2011, om 08:05 heeft Martin Jansa het volgende geschreven:
> >>> On Thu, Dec 08, 2011 at 12:53:11AM +0100, Andreas M=FCller wrote:
> >>>> On Wednesday, December 07, 2011 06:34:07 PM Richard Purdie wrote:
> >>>>> We need pseudo to use the rootfs passwd/group files belonging to the
> >>>>> rootfs when building images. This patch ensures that we use the
> >>>>> rootfs files instead of those in the sysroot which can lead to
> >>>>> incorrect file ownership issues.
> >>>>>=20
> >>>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >>>>>=20
> >>>>> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> >>>>> index 4642fa6..865d430 100644
> >>>>> --- a/meta/classes/image.bbclass
> >>>>> +++ b/meta/classes/image.bbclass
> >>>>> @@ -121,6 +121,8 @@ IMAGE_LINGUAS ?=3D "de-de fr-fr en-gb"
> >>>>>=20
> >>>>> LINGUAS_INSTALL =3D "${@" ".join(map(lambda s: "locale-base-%s" % s,
> >>>>> d.getVar('IMAGE_LINGUAS', 1).split()))}"
> >>>>>=20
> >>>>> +PSEUDO_PASSWD =3D "${IMAGE_ROOTFS}"
> >>>>> +
> >>>>> do_rootfs[nostamp] =3D "1"
> >>>>> do_rootfs[dirs] =3D "${TOPDIR}"
> >>>>> do_rootfs[lockfiles] +=3D "${IMAGE_ROOTFS}.lock"
> >>>>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> >>>>> index e80cc32..eeb1fc4 100644
> >>>>> --- a/meta/conf/bitbake.conf
> >>>>> +++ b/meta/conf/bitbake.conf
> >>>>> @@ -580,11 +580,12 @@ SRC_URI =3D "file://${FILE}"
> >>>>>=20
> >>>>> # Use pseudo as the fakeroot implementation
> >>>>> PSEUDO_LOCALSTATEDIR ?=3D "${WORKDIR}/pseudo/"
> >>>>> +PSEUDO_PASSWD ?=3D "${STAGING_DIR_TARGET}"
> >>>>> export PSEUDO_DISABLED =3D "1"
> >>>>> #export PSEUDO_PREFIX =3D "${STAGING_DIR_NATIVE}${prefix_native}"
> >>>>> #export PSEUDO_BINDIR =3D "${STAGING_DIR_NATIVE}${bindir_native}"
> >>>>> #export PSEUDO_LIBDIR =3D
> >>>>> "${STAGING_DIR_NATIVE}$PSEUDOBINDIR/../lib/pseudo/lib -FAKEROOTENV =
=3D
> >>>>> "PSEUDO_PREFIX=3D${STAGING_DIR_NATIVE}${prefix_native}
> >>>>> PSEUDO_LOCALSTATEDIR=3D${PSEUDO_LOCALSTATEDIR}
> >>>>> PSEUDO_PASSWD=3D${STAGING_DIR_TARGET} PSEUDO_NOSYMLINKEXP=3D1
> >>>>> PSEUDO_DISABLED=3D0" +FAKEROOTENV =3D
> >>>>> "PSEUDO_PREFIX=3D${STAGING_DIR_NATIVE}${prefix_native}
> >>>>> PSEUDO_LOCALSTATEDIR=3D${PSEUDO_LOCALSTATEDIR}
> >>>>> PSEUDO_PASSWD=3D${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=3D1
> >>>>> PSEUDO_DISABLED=3D0" FAKEROOTNOENV =3D "PSEUDO_UNLOAD=3D1"
> >>>>> FAKEROOTDIRS =3D "${PSEUDO_LOCALSTATEDIR}"
> >>>>> PREFERRED_PROVIDER_virtual/fakeroot-native ?=3D "pseudo-native"
> >>>>=20
> >>>> dbus still needs manual call of
> >>>>=20
> >>>> 	chown messagebus:messagebus /var/run/dbus /var/lib/dbus
> >>>>=20
> >>>> ( it is root:root on my image) and
> >>>>=20
> >>>> 	chown root:messagebus /usr/libexec/dbus-daemon-launch-helper
> >>>>=20
> >>>> ( it is avahi:netdev on my image )
> >>>>=20
> >>>> Does this one fix it?
> >>>=20
> >>> It did for me, see:
> >>> http://bugzilla.pokylinux.org/show_bug.cgi?id=3D1711
> >>>=20
> >>>> To test: Is it enough to rebuild dbus?
> >>>=20
> >>> I had right owners in dbus package, wrong only in rootfs, so your iss=
ue
> >>> could be different.
> >>=20
> >> I've also started seeing this issue recently, I wonder if it's due to
> >> switching MACHINEs and sstate invalidation.
> >=20
> > Has it continued since the above patch was merged or not?
> >=20
> > What we really need at this point is a clear reproducer for the bug.
=46or me the dbus bug is stable since Otavio's patch which moved all chown =
stuff=20
from pkg_postinst to do_install [1]
>=20
> I'm seeing it in a filesystem I built yesterday from an incremental build:
>=20
> commit 493746f1d7f1410284880203c1ac462d61ab5299
> Author: Martin Jansa <martin.jansa@gmail.com>
> Date:   Tue Dec 6 09:35:21 2011 +0100
>=20
In passwd/groups I have:

root@overo:~# cat /etc/passwd
=2E..
avahi:x:999:999::/var/run/avahi-daemon:/bin/false
messagebus:x:998:997::/var/lib/dbus:/bin/false

root@overo:~# cat /etc/group
=2E..
avahi:x:999:
netdev:x:998:
messagebus:x:997:
lock:x:996:

for messagebus group I see guid 997 and uuid 998 AND netdev uuid is 998!

After testing the patch - we are currently talking of - I have:=20

/var/run/dbus -> root:root
/var/lib/dbus -> 70:netdev
/usr/libexec/dbus-daemon-launch-helper -> root:netdev

and I swear before the patch I saw one of these files with owner avahi!

Is there some mechanism, enusring useradd/groupadd stuff working properly f=
or=20
multiple threads adding users/groups at the same time?

Andreas

[1] http://cgit.openembedded.org/openembedded-
core/commit/?id=3D46e6c3fa8034b12d178d605f3f5d7efe69671a13


