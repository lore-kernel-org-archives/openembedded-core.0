Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rdfxq-000258-VW
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 11:33:31 +0100
Received: by wgbds11 with SMTP id ds11so13376167wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 02:26:21 -0800 (PST)
Received: by 10.227.204.9 with SMTP id fk9mr9894864wbb.5.1324549581780;
	Thu, 22 Dec 2011 02:26:21 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id em4sm9155437wbb.20.2011.12.22.02.26.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Dec 2011 02:26:21 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Thu, 22 Dec 2011 11:26:16 +0100
In-Reply-To: <20111222091041.GI12791@jama.jama.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <alpine.DEB.2.00.1112220939580.26143@entw48>
	<20111222091041.GI12791@jama.jama.net>
Message-Id: <ABF02F6F-B5D0-425E-A568-B762D28A22D9@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: Regression bug: dbus messagebus user generation is wrong
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
X-List-Received-Date: Thu, 22 Dec 2011 10:33:31 -0000
X-Groupsio-MsgNum: 14659
Content-Type: multipart/signed;
	boundary="Apple-Mail=_524997AB-9FEE-4E88-B7D6-213E0F3448FE";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_524997AB-9FEE-4E88-B7D6-213E0F3448FE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 22 dec. 2011, om 10:10 heeft Martin Jansa het volgende geschreven:

> On Thu, Dec 22, 2011 at 09:49:01AM +0100, Bernhard Guillon wrote:
>> Hi all,
>> we switched the way we chown /usr/libexec/dbus-daemon-launch-helper
>> with this commit:
>>=20
>> commit 46e6c3fa8034b12d178d605f3f5d7efe69671a13
>> Author: Otavio Salvador <otavio@ossystems.com.br>
>> Date:   Fri Oct 21 02:49:51 2011 +0000
>>=20
>>     dbus: use useradd class to allow use in read-only filesystems
>>=20
>>     Move creation of required user/groups to useradd class thus =
allowing
>>     use with read-only filesystems and booting the initial boot.
>>=20
>>     Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>>=20
>>=20
>> We changed the owner ship of the user on the device before this =
commit.=20
>> Now we change the owner ship on build time which is wrong. If we =
change=20
>> the owner ship on buildtime we cannot know the gid of the messagebus=20=

>> group. On my system it is e.g 117 but on my targtet it is 997. There =
is no=20
>> standard mapping for gid to names so we need to switch back to change =
the=20
>> group on the device.
>=20
> See http://bugzilla.pokylinux.org/show_bug.cgi?id=3D1711
> but it's still broken in some cases (on my buildhost 3 from 5 machines
> are broken, 2 are working after last opkg changes).
>=20
> Good test is to enable testlab and run this in your deploy/images =
directory
> find . ! -type l -name \*tar.gz`; do=20
>  echo $i;=20
>  tar -tvf $i | grep dbus-daemon-launch;=20
>  tar --numeric-owner -tvf $i | grep dbus-daemon-launch;=20
>  tar xzvpf $i ./etc/group;=20
>  grep messagebus ./etc/group;=20
> done | tee -a image.test
>=20
> And working image needs to have not only messagebus as owner but also
> matching GID in 2nd line and last line from packaged /etc/group. With
> latest opkg fixes it seems to work, but only if there is messagebus in
> packaged /etc/group at all, reported here:
> =
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/01461=
9.html
> but probably got lost in other issues with new opkg, like this one
> =
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/01465=
4.html
> (if D is not needed to be set from opkg then why was =
offlineroot_varname.patch
> added in first place? and I have updated this after
> offlineroot_varname.patch removal and new version is in shr branch)
>=20
>> I can send a patch which reenables the postinstall owner ship change =
if=20
>> you like.
>=20
> Such patch is already on ML from me, now I'm using .bbappend from my
> layer=20
> =
http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dcommit;h=3Dc08=
dfd5f5559902f6966648f75d6c6bfd2597a5b

I'm willing to put that into meta-oe till the problem is 100% fixed.

regards,

Koen=

--Apple-Mail=_524997AB-9FEE-4E88-B7D6-213E0F3448FE
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7zBcsACgkQMkyGM64RGpHmoQCeIXBiWAOFlY3cOn2ueGx+9YWE
9kIAn3O68AcBTC9hK2KapwRKLaods/h5
=aNKC
-----END PGP SIGNATURE-----

--Apple-Mail=_524997AB-9FEE-4E88-B7D6-213E0F3448FE--
