Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RT7UQ-00007u-T4
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 08:43:30 +0100
Received: by wwo1 with SMTP id 1so1171501wwo.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 23:36:59 -0800 (PST)
Received: by 10.227.207.205 with SMTP id fz13mr14232846wbb.0.1322033819437;
	Tue, 22 Nov 2011 23:36:59 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id v10sm7804497wiy.23.2011.11.22.23.36.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Nov 2011 23:36:58 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Wed, 23 Nov 2011 08:36:58 +0100
In-Reply-To: <4ECC9A64.4080009@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4ECC9A64.4080009@linux.intel.com>
Message-Id: <C39A2CE4-DFD3-4C4D-B9F3-B37406404A1C@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: RFC: grub-efi native tools
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
X-List-Received-Date: Wed, 23 Nov 2011 07:43:31 -0000
X-Groupsio-MsgNum: 12794
Content-Type: multipart/signed;
	boundary="Apple-Mail=_4A13C4BB-987E-4029-AFB7-F5936F5B8190";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_4A13C4BB-987E-4029-AFB7-F5936F5B8190
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 23 nov. 2011, om 08:01 heeft Darren Hart het volgende geschreven:

> While working towards supporting efi boot in live images, I have been
> refactoring bootimg.bbclass, syslinux.bbclass, and adding recipes and
> classes for grub-efi.
>=20
> I'd like the seasoned OE experts' opinions on a question of
> implementation. grub-efi seems to require a final step after the =
normal
> build to assemble the efi image, specifically:
>=20
> grub-mkimage -p / -d ./grub-core/ -O i386-efi -o ./bootia32.efi \
>             boot linux fat serial part_msdos normal
>=20
> grub-mkimage is a tool built during the grub-efi do_compile step, so =
it
> needs to be native in order to run the above command. So I'm left with =
a
> few options:
>=20
> 1) Use BBCLASSEXTEND=3D"native" and make grub-efi depend on
>   grub-efi-native so the native grub-mkimage is available.
>   - I'm not sure how to avoid a circular dependency there,
>     other than making an explicit grub-efi-native_1.99.bb.

One way:

DEPENDS =3D "grub-efi-native"
DEPENDS_virtclass-native =3D ""

But the proper way is IMAGE_DEPENDS =3D "grub-efi-native" in the image =
classes that need it.


>   - No component of the grub-efi build needs to be installed
>     on the target rootfs - so perhaps the the target arch version
>     isn't needed at all...

BBCLASSEXTEND is quite cheap.

> 2) Only build grub-efi-native.
>   - The above grub-mkimage command fails with some incorrect elf =
format
>     error messages on the grub kernel.img file. A similar error was
>     reported on the grub mailing list when compiling with cygwin.
>     Some work may be required to fix GRUB here.
>   - Installing output of -native recipes onto the target seems to be a
>     bit at odds with the existing mechanisms (it doesn't find
>     bootia32.efi when placed in ${STAGING_LIBDIR}/grub by a -native
>     build, for example).
>=20
> 3) Tweak the build so that only the grub-* utilities are built =
natively.
>   - The Linux kernel build does this for some of the internal
>     tooling required for the build (Kconfig, etc.).
>   - If we did want to install the tools on the target, we wouldn't =
have
>     the target arch binaries available. Perhaps both could be built.
>=20
> So there are a number of ways to go about this. If someone can =
leverage
> some experience with OE to indicate which of these would be met with =
the
> least resistance, both in terms of implementation as well as upstream
> acceptance, I would appreciate it.

Have a look at u-boot-mkimage, there's a native and target version =
available.

regards,

Koen=

--Apple-Mail=_4A13C4BB-987E-4029-AFB7-F5936F5B8190
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7MopoACgkQMkyGM64RGpFwiwCgpMfgMmn5cu6xWPp75G+MN01a
AdAAniKs++J0f9oiAh7rnZeKvdnS7suu
=KVU0
-----END PGP SIGNATURE-----

--Apple-Mail=_4A13C4BB-987E-4029-AFB7-F5936F5B8190--
