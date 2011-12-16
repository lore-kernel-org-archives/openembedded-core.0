Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rbf73-0006mD-Ct
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 22:14:41 +0100
Received: by werm13 with SMTP id m13so679749wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 13:07:38 -0800 (PST)
Received: by 10.216.138.219 with SMTP id a69mr1270047wej.6.1324069658350;
	Fri, 16 Dec 2011 13:07:38 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id gn4sm14606293wib.20.2011.12.16.13.07.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Dec 2011 13:07:37 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Fri, 16 Dec 2011 22:07:32 +0100
In-Reply-To: <4EEB8E58.3030806@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4EEB8E58.3030806@linux.intel.com>
Message-Id: <59473640-1B02-42F9-A44D-6747552F80DE@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: Can we drop eglibc-utils from LIBC_DEPENDENCIES?
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
X-List-Received-Date: Fri, 16 Dec 2011 21:14:41 -0000
X-Groupsio-MsgNum: 14349
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C6403182-91AE-43CF-A0C2-16AF7016A4B9";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C6403182-91AE-43CF-A0C2-16AF7016A4B9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 16 dec. 2011, om 19:30 heeft Darren Hart het volgende geschreven:

> I'm working on a minimal distro definition, and found that =
eglibc-utils
> pulls in bash (needed for tzconfig and xtrace apparently)

My first thought is: fix the bashisms in those scripts, I bet =
ubuntu/fedora/arch/gentoo have patches for that,

> which pulls in
> gettext, which requires wchar support. I'd like to remove eglibc-utils
> from my distro definition. I could override the default I suspect, but =
I
> wonder if eglibc-utils should be made an optional package that distro
> definitions, images, or users should specifically add if needed?
>=20
> The relevant bit of code appears to be:
>=20
> meta/conf/distro/include/tclibc-eglibc.inc
>=20
> LIBC_DEPENDENCIES =3D "libsegfault \
> 		     eglibc \
>    		     eglibc-dbg \
>    		     eglibc-dev \
>    		     eglibc-utils \
>    		     eglibc-thread-db \
>    		     eglibc-localedata-i18n \
>    		     eglibc-gconv-ibm850 \
>    		     eglibc-gconv-cp1252 \
>    		     eglibc-gconv-iso8859-1 \
>    		     eglibc-gconv-iso8859-15 \
>    		     locale-base-en-us \
>    		     locale-base-en-gb "
>=20
> eglibc-dbg and eglibc-dev also seem like they could be made optional.
>=20
> Thoughts? Would anyone object to me removing at least eglibc-utils =
from
> LIBC_DEPENDENCIES?

I did a little digging:

koen@dominion:/OE/tentacle/sources/openembedded-core$ git grep =
LIBC_DEPENDENCIES
meta/conf/distro/include/tclibc-eglibc.inc:LIBC_DEPENDENCIES =3D =
"libsegfault \
meta/conf/distro/include/tclibc-uclibc.inc:LIBC_DEPENDENCIES =3D "\
meta/recipes-core/tasks/task-core-nfs.bb:GLIBC_DEPENDENCIES =3D =
"glibc-utils"
=
meta/recipes-core/tasks/task-core-nfs.bb:RRECOMMENDS_task-core-nfs-server_=
append_libc-glibc =3D " ${GLIBC_DEPENDENCIES}"
meta/recipes-core/tasks/task-core-standalone-sdk-target.bb:    =
${LIBC_DEPENDENCIES} \

So it's only used for debug and/or SDK uses. I am going to argue that if =
you're going to support debug and SDK you're not minimal anymore and can =
live with bash/gettext/etc.

Since I was bored I dug up an OE-classic:

koen@dominion:/OE/org.openembedded.dev$ git blame  =
recipes/tasks/task-sdk-bare.bb
749310c7 packages/tasks/task-sdk-bare.bb (Koen Kooi 2008-07-07 21:24:38 =
+0000  1) DESCRIPTION =3D "Packages for a standalone  SDK or external =
toolchain"
[..]
9bff47f7 packages/tasks/task-sdk-bare.bb (Tom Rini  2008-11-26 13:16:21 =
-0500  8) GLIBC_PKGS =3D "\
749310c7 packages/tasks/task-sdk-bare.bb (Koen Kooi 2008-07-07 21:24:38 =
+0000  9)     glibc \
749310c7 packages/tasks/task-sdk-bare.bb (Koen Kooi 2008-07-07 21:24:38 =
+0000 10)     glibc-dbg \
86fa8521 packages/tasks/task-sdk-bare.bb (Tom Rini  2009-02-04 02:07:47 =
-0500 11)     virtual-libc-dev \
749310c7 packages/tasks/task-sdk-bare.bb (Koen Kooi 2008-07-07 21:24:38 =
+0000 12)     glibc-utils \
749310c7 packages/tasks/task-sdk-bare.bb (Koen Kooi 2008-07-07 21:24:38 =
+0000 13)     libsegfault \
749310c7 packages/tasks/task-sdk-bare.bb (Koen Kooi 2008-07-07 21:24:38 =
+0000 14)     glibc-thread-db \
f18a05e2 recipes/tasks/task-sdk-bare.bb  (Tom Rini  2010-02-09 16:43:45 =
-0700 15) "
9bff47f7 packages/tasks/task-sdk-bare.bb (Tom Rini  2008-11-26 13:16:21 =
-0500 16)=20
edd3a1de recipes/tasks/task-sdk-bare.bb  (Tom Rini  2011-01-18 17:56:52 =
-0700 17) LIBC_PKGS_libc-glibc =3D "${GLIBC_PKGS}"
edd3a1de recipes/tasks/task-sdk-bare.bb  (Tom Rini  2011-01-18 17:56:52 =
-0700 18) LIBC_PKGS_libc-uclibc =3D "uclibc uclibc-dev uclibc-thread-db"

So a few years ago that list of packages was only meant for SDK usage.

If you meant GLIBC_DEPENDENCIES (note the extra 'G'), then you need to =
check if they are still needed for NFS operation. If so I am going to =
argue that the dependencies should move to the recipes in question =
instead of hiding in the task. If it's just a convenience package go =
ahead and remove it, people wanting it can create a new task :)

regards,

Koen




--Apple-Mail=_C6403182-91AE-43CF-A0C2-16AF7016A4B9
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7rsxcACgkQMkyGM64RGpEH/QCfTQCuy0WDiUy+OhdaqIZqvP8g
AUYAnjmOt1QWhUxCl8C9ZiNoZfnaeJs1
=Plc9
-----END PGP SIGNATURE-----

--Apple-Mail=_C6403182-91AE-43CF-A0C2-16AF7016A4B9--
