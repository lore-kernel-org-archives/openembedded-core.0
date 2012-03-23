Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SB03H-0004O8-SA
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 09:41:00 +0100
Received: from eb-e6520 (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id D73BD4B01A5;
	Fri, 23 Mar 2012 09:31:15 +0100 (CET)
Date: Fri, 23 Mar 2012 09:31:14 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20120323093114.2f779b94@eb-e6520>
In-Reply-To: <4F6C2259.7000802@gmail.com>
References: <cover.1332347414.git.nitin.a.kamble@intel.com>
	<ADD6A3980E8C39419A432FF422031B4C0137B889@ORSMSX106.amr.corp.intel.com>
	<CAMKF1srP52bxqwkaqPZTQbRmhp_V+4-iJ7wTKeKWfC1z4W=fyw@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0137BAA8@ORSMSX106.amr.corp.intel.com>
	<CAMKF1sobw_wT_ZKhXs9Y-d0jSG-QWzKOprgf7+zM8a_BjjQgEQ@mail.gmail.com>
	<20120322131310.1c6455d1@eb-e6520>
	<CAMKF1sqEGjWMpPTQxP3j1bbP6H2FQqAgHZGm399ejC-RyDxboQ@mail.gmail.com>
	<20120322134340.1af3dfda@eb-e6520>
	<CAMKF1srORF53h-V+fKTjJn2jWg=f6nOaMf_eUmYPLnW-ovc7NQ@mail.gmail.com>
	<20120322141455.644058f0@eb-e6520>
	<ADD6A3980E8C39419A432FF422031B4C0137BE5C@ORSMSX106.amr.corp.intel.com>
	<CAMKF1srd0KanO6NfQtm0U39GZS_ANsu9KdRR0hirpKQrhMCxzg@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0137BEEB@ORSMSX106.amr.corp.intel.com>
	<CAMKF1sr=PedPsmpPSGC42Wvof9fHbR26JM2hgEZjA3h621ynxA@mail.gmail.com>
	<20120322223127.136698cf@eb-e6520> <4F6C2259.7000802@gmail.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: Jansa <martin.jansa@gmail.com>, Martin, Patches,
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with python support"
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
X-List-Received-Date: Fri, 23 Mar 2012 08:41:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Khem,

Le Fri, 23 Mar 2012 00:12:25 -0700,
Khem Raj <raj.khem@gmail.com> a =E9crit :
> OK can you try following patch ? (untested) it does not fix the paths so=
=20
> once you install sdk it will have to be fixed as you did with chrpath=20
> for testing
>=20
> http://paste.ubuntu.com/896082/
>=20
> I think issue is currently we are linking with static version of=20
> libpython and also the search path to find python executable for gdb=20
> when running is /usr/bin and not the python from SDK so this patch
> takes care of both
>=20
very good catch, now gdb runs fine and strace shows that it loads
the right library :

open("/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/python2.=
7/lib-dynload/readline.so",
O_RDONLY) =3D 6 fstat(6, {st_mode=3DS_IFREG|0755, st_size=3D23520, ...}) =
=3D 0
futex(0x7f3ada48e0a8, FUTEX_WAKE_PRIVATE, 2147483647) =3D 0
open("/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/lib/python2.=
7/lib-dynload/readline.so",
O_RDONLY) =3D 7 read(7,
"\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0`%\0\0\0\0\0\0"..., 832)
=3D 832 fstat(7, {st_mode=3DS_IFREG|0755, st_size=3D23520, ...}) =3D 0
mmap(NULL, 2118952, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 7,
0) =3D 0x7f3ad8a05000

Eric


