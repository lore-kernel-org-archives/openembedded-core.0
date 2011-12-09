Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RZ2Cc-0003kL-4e
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Dec 2011 16:17:34 +0100
Received: by eekb15 with SMTP id b15so1575478eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Dec 2011 07:10:43 -0800 (PST)
Received: by 10.14.35.101 with SMTP id t77mr906566eea.216.1323443443052;
	Fri, 09 Dec 2011 07:10:43 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id 65sm32116096eeg.8.2011.12.09.07.10.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Dec 2011 07:10:42 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Fri, 9 Dec 2011 16:10:36 +0100
In-Reply-To: <1323443103.5309.178.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1323279247.30601.51.camel@ted>
	<201112080053.11966.schnitzeltony@gmx.de>
	<20111208070548.GB3761@jama.jama.net>
	<0B087DB2-2C7F-4A0B-A0D1-7E38D9E28807@dominion.thruhere.net>
	<1323443103.5309.178.camel@ted>
Message-Id: <57952375-D968-4AC3-BAF0-88B571479CDB@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
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
X-List-Received-Date: Fri, 09 Dec 2011 15:17:34 -0000
X-Groupsio-MsgNum: 13940
Content-Type: multipart/signed;
	boundary="Apple-Mail=_6D7C69AE-F33F-4F08-A9E5-2F9FAF9AF8D7";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_6D7C69AE-F33F-4F08-A9E5-2F9FAF9AF8D7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


Op 9 dec. 2011, om 16:05 heeft Richard Purdie het volgende geschreven:

> On Fri, 2011-12-09 at 14:44 +0100, Koen Kooi wrote:
>> Op 8 dec. 2011, om 08:05 heeft Martin Jansa het volgende geschreven:
>>=20
>>> On Thu, Dec 08, 2011 at 12:53:11AM +0100, Andreas M=FCller wrote:
>>>> On Wednesday, December 07, 2011 06:34:07 PM Richard Purdie wrote:
>>>>> We need pseudo to use the rootfs passwd/group files belonging to =
the
>>>>> rootfs when building images. This patch ensures that we use the =
rootfs
>>>>> files instead of those in the sysroot which can lead to incorrect =
file
>>>>> ownership issues.
>>>>>=20
>>>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>>>=20
>>>>> diff --git a/meta/classes/image.bbclass =
b/meta/classes/image.bbclass
>>>>> index 4642fa6..865d430 100644
>>>>> --- a/meta/classes/image.bbclass
>>>>> +++ b/meta/classes/image.bbclass
>>>>> @@ -121,6 +121,8 @@ IMAGE_LINGUAS ?=3D "de-de fr-fr en-gb"
>>>>>=20
>>>>> LINGUAS_INSTALL =3D "${@" ".join(map(lambda s: "locale-base-%s" % =
s,
>>>>> d.getVar('IMAGE_LINGUAS', 1).split()))}"
>>>>>=20
>>>>> +PSEUDO_PASSWD =3D "${IMAGE_ROOTFS}"
>>>>> +
>>>>> do_rootfs[nostamp] =3D "1"
>>>>> do_rootfs[dirs] =3D "${TOPDIR}"
>>>>> do_rootfs[lockfiles] +=3D "${IMAGE_ROOTFS}.lock"
>>>>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>>>>> index e80cc32..eeb1fc4 100644
>>>>> --- a/meta/conf/bitbake.conf
>>>>> +++ b/meta/conf/bitbake.conf
>>>>> @@ -580,11 +580,12 @@ SRC_URI =3D "file://${FILE}"
>>>>>=20
>>>>> # Use pseudo as the fakeroot implementation
>>>>> PSEUDO_LOCALSTATEDIR ?=3D "${WORKDIR}/pseudo/"
>>>>> +PSEUDO_PASSWD ?=3D "${STAGING_DIR_TARGET}"
>>>>> export PSEUDO_DISABLED =3D "1"
>>>>> #export PSEUDO_PREFIX =3D "${STAGING_DIR_NATIVE}${prefix_native}"
>>>>> #export PSEUDO_BINDIR =3D "${STAGING_DIR_NATIVE}${bindir_native}"
>>>>> #export PSEUDO_LIBDIR =3D
>>>>> "${STAGING_DIR_NATIVE}$PSEUDOBINDIR/../lib/pseudo/lib -FAKEROOTENV =
=3D
>>>>> "PSEUDO_PREFIX=3D${STAGING_DIR_NATIVE}${prefix_native}
>>>>> PSEUDO_LOCALSTATEDIR=3D${PSEUDO_LOCALSTATEDIR}
>>>>> PSEUDO_PASSWD=3D${STAGING_DIR_TARGET} PSEUDO_NOSYMLINKEXP=3D1
>>>>> PSEUDO_DISABLED=3D0" +FAKEROOTENV =3D
>>>>> "PSEUDO_PREFIX=3D${STAGING_DIR_NATIVE}${prefix_native}
>>>>> PSEUDO_LOCALSTATEDIR=3D${PSEUDO_LOCALSTATEDIR}
>>>>> PSEUDO_PASSWD=3D${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=3D1 =
PSEUDO_DISABLED=3D0"
>>>>> FAKEROOTNOENV =3D "PSEUDO_UNLOAD=3D1"
>>>>> FAKEROOTDIRS =3D "${PSEUDO_LOCALSTATEDIR}"
>>>>> PREFERRED_PROVIDER_virtual/fakeroot-native ?=3D "pseudo-native"
>>>> dbus still needs manual call of=20
>>>>=20
>>>> 	chown messagebus:messagebus /var/run/dbus /var/lib/dbus
>>>>=20
>>>> ( it is root:root on my image) and
>>>>=20
>>>> 	chown root:messagebus /usr/libexec/dbus-daemon-launch-helper
>>>>=20
>>>> ( it is avahi:netdev on my image )
>>>>=20
>>>> Does this one fix it?
>>>=20
>>> It did for me, see:
>>> http://bugzilla.pokylinux.org/show_bug.cgi?id=3D1711
>>>=20
>>>> To test: Is it enough to rebuild dbus?
>>>=20
>>> I had right owners in dbus package, wrong only in rootfs, so your =
issue
>>> could be different.
>>=20
>> I've also started seeing this issue recently, I wonder if it's due to =
switching MACHINEs and sstate invalidation.
>=20
> Has it continued since the above patch was merged or not?
>=20
> What we really need at this point is a clear reproducer for the bug.

I'm seeing it in a filesystem I built yesterday from an incremental =
build:

commit 493746f1d7f1410284880203c1ac462d61ab5299
Author: Martin Jansa <martin.jansa@gmail.com>
Date:   Tue Dec 6 09:35:21 2011 +0100


regards,

Koen=

--Apple-Mail=_6D7C69AE-F33F-4F08-A9E5-2F9FAF9AF8D7
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7iJO8ACgkQMkyGM64RGpEzfQCcDXLf37NNDmpfrFyPoGsc6xM7
K/YAoIOI4ngkl7dMGtNBr7T5SjtiZ8y0
=e9yY
-----END PGP SIGNATURE-----

--Apple-Mail=_6D7C69AE-F33F-4F08-A9E5-2F9FAF9AF8D7--
