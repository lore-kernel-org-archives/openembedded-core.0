Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QJQIt-0000EU-0d
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 15:15:15 +0200
Received: by wwb17 with SMTP id 17so4701458wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2011 06:12:30 -0700 (PDT)
Received: by 10.227.200.212 with SMTP id ex20mr7066907wbb.52.1304946750671;
	Mon, 09 May 2011 06:12:30 -0700 (PDT)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id bs4sm3749769wbb.1.2011.05.09.06.12.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 May 2011 06:12:20 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1B7A477C-E4A5-4EBC-A7E3-CAA30A583ADF@dominion.thruhere.net>
Date: Mon, 9 May 2011 15:12:18 +0200
Message-Id: <F9F06F28-D24C-4F5C-92FA-05C6BB7E9BF0@dominion.thruhere.net>
References: <E927045D-259E-49B7-A318-7755EEA7DCE0@dominion.thruhere.net>
	<1304691622.30391.124.camel@rex>
	<1B7A477C-E4A5-4EBC-A7E3-CAA30A583ADF@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [RFC] systemd units packaging
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
X-List-Received-Date: Mon, 09 May 2011 13:15:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 6 mei 2011, om 16:51 heeft Koen Kooi het volgende geschreven:

>=20
> Op 6 mei 2011, om 16:20 heeft Richard Purdie het volgende geschreven:
>=20
>> On Fri, 2011-05-06 at 15:39 +0200, Koen Kooi wrote:
>>> Now onto my issues:
>>>=20
>>> packaging:
>>> 	In OE .dev I added FILES_${PN} +=3D "${base_libdir}/systemd" to =
udev,
>>> dbus, rsyslog and avahi. This means we end up with both sysV script
>>> and systemd units. What I would like to have is ${PN}-sysvinit and
>>> ${PN}-systemd and the image recipe can choose which init systems =
gets
>>> used. Is something like that possible?
>>=20
>> I'm not sure that it is to be honest. We simply don't have the
>> capability in the package managers to be able to say "if systemd is
>> installed, install *-systemd where * is any currently installed
>> package". Its the same problem we have with locales.
>>=20
>> Now if we had that functionality, great, but we simply don't :(.
>>=20
>>> Are there better ways? Note that systemd support sysV initscripts as
>>> well, but it needs some care with naming. As I understand it, if a
>>> unit is found with the same name as a sysV script, only the unit =
will
>>> get used.
>>> A rootfs postprocess command that deletes /etc/init.d won't work,
>>> since it will come back when upgrading the packages.
>>>=20
>>> building:
>>> 	At the moment systemd enabled software installs the units =
regardless
>>> or config options. What should be do with software that has an =
option
>>> for that? And what if we need to patch the units files in? The
>>> initsystem is a choice at the image level, so artificially limiting =
it
>>> to a distro choice is not a good idea.
>>=20
>> Its an artificial limit but our tools don't give us any other option,
>> for now I think this has to be a distro config choice.
>=20
> Not quite, if we name the units correctly (or just alias them inside) =
the sysv scripts will get skipped. So if having both systemd and sysv =
files installed isn't a dealbreaker them we can make it an image choice. =
On debian and gentoo it's parallel installable with sysvinit, making it =
a matter of doing either init=3D/sbin/init  or init=3D/bin/systemd in =
your bootloader.

=46rom #systemd:

15:08 < koen> how can I have systemd skip sysv scripts with a slightly =
different name?
15:08 < koen> e.g. udevd vs udev
15:09 < sztanpet> symlink udevd.service to dev null, that should mask it
15:10 < sztanpet> automatically i dont know
15:10 < Mithrandir> add Names=3Dudevd to udev.service?
15:10 < Mithrandir> Names=3Dudevd.service, even
15:10 < Mithrandir> or symlink the .service file to the alias name




