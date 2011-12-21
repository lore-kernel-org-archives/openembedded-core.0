Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RdI0r-0007uE-S1
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 09:59:02 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 21 Dec 2011 00:51:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="49312542"
Received: from pgsmsx603.gar.corp.intel.com ([10.221.43.87])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Dec 2011 00:51:54 -0800
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx603.gar.corp.intel.com (10.221.43.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 21 Dec 2011 16:51:19 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 21 Dec 2011 16:51:19 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Wed, 21 Dec 2011 16:51:17 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Martin Jansa
	<martin.jansa@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, =?iso-8859-1?Q?Andreas_M=FCller?=
	<schnitzeltony@gmx.de>, Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 21 Dec 2011 16:51:16 +0800
Thread-Topic: opkg still breaks meta-toolchain-gmae
Thread-Index: Acy/siLj72s9X4jqRQ6I7V5HIXhktgAChCzw
Message-ID: <1865303E0DED764181A9D882DEF65FB6EA8B6E1B0D@shsmsx502.ccr.corp.intel.com>
References: <1865303E0DED764181A9D882DEF65FB6EA8B6E1A65@shsmsx502.ccr.corp.intel.com>
In-Reply-To: <1865303E0DED764181A9D882DEF65FB6EA8B6E1A65@shsmsx502.ccr.corp.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: opkg still breaks meta-toolchain-gmae
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
X-List-Received-Date: Wed, 21 Dec 2011 08:59:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Cui, Dexuan wrote on 2011-12-21:
> Hi all,
> After I upgraded to the latest poky master (commit 4648aadf),
> core-image-sato-sdk can build file, but meta-toolchain-gmae (with ipk
> packaging) still doesn't work. Now the failure is:
>=20
> | error: Failed dependencies:
> |   libsdl-nativesdk is needed by qemu-nativesdk-0.15.1-r1.x86_64
> NOTE: package meta-toolchain-gmae-1.0-r6: task do_populate_sdk: Failed
Sorry, I need to correct this above:
It's actually rpm packaging(rpm did work fine with the slightly older commi=
t 45987c5135) rather than ipk.

If I use ipk packaging, I get the similar mkdir failure:
mkdir: cannot create directory `/var/lib/opkg': Permission denied
and, I finally got a libsdl failure, too:
| Collected errors:
|  * satisfy_dependencies_for: Cannot satisfy the following dependencies fo=
r task-sdk-host-nativesdk:
|  *    libsdl-nativesdk *
So I suppose the libsdl patch(" fix packaging") is suspicious.

BTW, I use "MACHINE=3Dqemux86".

>=20
>=20
> If I built with a slightly older commit  45987c5135, the failure is: |
> mkdir: cannot create directory `/var/lib/opkg'\'': Permission denied |
> Configuring libc6. ... | + install -m 0644
> /distro/dcui/1220/p1/build/tmp/work/i586-poky-linux/meta-toolchain-gma
> e- 1.0-r6/opkg-sdk.conf
> /distro/dcui/1220/p1/build/tmp/work/i586-poky-linux/meta-toolchain-gma
> e- 1.0-r6/sdk/image//opt/poky/1.1+snapshot/sysroots/x86_64-pokysdk-l' |
> mkdir: cannot create directory `/var/lib/opkg': Permission denied ... |
> gtk-update-icon-cache: Failed to open file |
> /usr/share/icons/whiteglass/.icon-theme.cache : Permission denied ... |
> + do_exit=3D1 | + test 1 =3D 1 | + exit 1 NOTE: package
> meta-toolchain-gmae-1.0-r6: task do_populate_sdk: Failed
>=20
> Looks somewhat the ${D} is empty, so the host directories are being
> installed into???

Thanks,
-- Dexuan



