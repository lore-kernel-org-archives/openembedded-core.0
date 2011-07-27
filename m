Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qm8ll-0007Gm-82
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 20:23:45 +0200
Received: by wyg30 with SMTP id 30so1373847wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 11:19:30 -0700 (PDT)
Received: by 10.216.141.155 with SMTP id g27mr88270wej.76.1311790770689;
	Wed, 27 Jul 2011 11:19:30 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id gb1sm118908wbb.20.2011.07.27.11.19.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 27 Jul 2011 11:19:29 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <03130D5D-C573-4B6D-949D-EA7EEB7A5A76@dominion.thruhere.net>
Date: Wed, 27 Jul 2011 20:19:23 +0200
Message-Id: <408CB1D5-74F0-477A-B9BB-9D2CA4E78C04@dominion.thruhere.net>
References: <cover.1311683981.git.richard.purdie@linuxfoundation.org>
	<346abefc87d21d0cc111ef87a6e48f40c5b6cb0b.1311683981.git.richard.purdie@linuxfoundation.org>
	<03130D5D-C573-4B6D-949D-EA7EEB7A5A76@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: do_rootfs broken, was: Re: [PATCH 1/3] Add ARM tune file overhaul based largely on work from Mark Hatle
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
X-List-Received-Date: Wed, 27 Jul 2011 18:23:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 jul. 2011, om 19:31 heeft Koen Kooi het volgende geschreven:

> <snip patch>
>=20
> It looks like PACKAGE_*_ARCHS is broken in the rootfs class:
>=20
> cat =
/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/work/beagleboard-angstrom-li=
nux-gnueabi/efl-nodm-image-1.0-r0/opkg.conf:
> arch all 1
> arch any 6
> arch noarch 11
> arch arm 16
> arch beagleboard 21
>=20
> But the one in the opkg config package is correct:
>=20
> koen@dominion:/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/deploy$ =
dpkg-deb -x ipk/beagleboard/opkg-config-base_1.0-r0_beagleboard.ipk tmp/
> koen@dominion:/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/deploy$ =
cat tmp/etc/opkg/arch.conf=20
> arch all 1
> arch any 6
> arch noarch 11
> arch arm 16
> arch armv4 21
> arch armv4t 26
> arch armv5te 31
> arch armv6 36
> arch armv7 41
> arch armv7a 46
> arch beagleboard 51
> koen@dominion:/OE/tentacle/build/tmp-angstrom_2010_x-eglibc/deploy$=20

bitbake -e:

# PACKAGE_ARCHS=3Dall any noarch ${PACKAGE_EXTRA_ARCHS} ${MACHINE_ARCH}
PACKAGE_ARCHS=3D"all any noarch arm armv4 armv4t armv5 armv5t armv5-vfp =
armv5t-vfp armv5e armv5te armv5e-vfp armv5te-vfp armv6-vfp armv6t-vfp =
armv7-vfp armv7t2-vfp armv7a-vfp armv7at2-vfp armv7a-vfp-neon =
armv7at2-vfp-neon beagleboard"

bitbake -e some-image:

# PACKAGE_ARCHS=3Dall any noarch ${PACKAGE_EXTRA_ARCHS} ${MACHINE_ARCH}
PACKAGE_ARCHS=3D"all any noarch arm beagleboard"
PACKAGE_EXTRA_ARCHS_tune-armv7thf-neon=3D"armv5hf-vfp armv5thf-vfp =
armv5ehf-vfp armv5tehf-vfp armv6hf-vfp armv6thf-vfp armv7hf-vfp =
armv7t2hf-vfp armv7hf-vfp-neon armv7at2hf-vfp-neon"

So it looks like all the tune-* overrides don't get expanded when =
building an image.



