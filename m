Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RdGil-0005gF-1o
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 08:36:15 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 20 Dec 2011 23:29:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="88811540"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by orsmga001.jf.intel.com with ESMTP; 20 Dec 2011 23:29:08 -0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 21 Dec 2011 15:28:32 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Wed, 21 Dec 2011 15:28:31 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, =?iso-8859-1?Q?Andreas_M=FCller?=
	<schnitzeltony@gmx.de>, Koen Kooi <koen@dominion.thruhere.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 21 Dec 2011 15:28:29 +0800
Thread-Topic: opkg still breaks meta-toolchain-gmae
Thread-Index: Acy/siLj72s9X4jqRQ6I7V5HIXhktg==
Message-ID: <1865303E0DED764181A9D882DEF65FB6EA8B6E1A65@shsmsx502.ccr.corp.intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: opkg still breaks meta-toolchain-gmae
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
X-List-Received-Date: Wed, 21 Dec 2011 07:36:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all,
After I upgraded to the latest poky master (commit 4648aadf), core-image-sa=
to-sdk can build file, but meta-toolchain-gmae (with ipk packaging) still d=
oesn't work. Now the failure is:

| error: Failed dependencies:
|   libsdl-nativesdk is needed by qemu-nativesdk-0.15.1-r1.x86_64
NOTE: package meta-toolchain-gmae-1.0-r6: task do_populate_sdk: Failed


If I built with a slightly older commit  45987c5135, the failure is:
| mkdir: cannot create directory `/var/lib/opkg'\'': Permission denied
| Configuring libc6.
...
| + install -m 0644 /distro/dcui/1220/p1/build/tmp/work/i586-poky-linux/met=
a-toolchain-gmae-1.0-r6/opkg-sdk.conf /distro/dcui/1220/p1/build/tmp/work/i=
586-poky-linux/meta-toolchain-gmae-1.0-r6/sdk/image//opt/poky/1.1+snapshot/=
sysroots/x86_64-pokysdk-l'
| mkdir: cannot create directory `/var/lib/opkg': Permission denied
...
| gtk-update-icon-cache: Failed to open file /usr/share/icons/whiteglass/.i=
con-theme.cache : Permission denied
...
| + do_exit=3D1
| + test 1 =3D 1
| + exit 1
NOTE: package meta-toolchain-gmae-1.0-r6: task do_populate_sdk: Failed

Looks somewhat the ${D} is empty, so the host directories are being install=
ed into???

Thanks,
-- Dexuan



