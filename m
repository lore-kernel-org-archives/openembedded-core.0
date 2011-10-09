Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RCxwO-0001BJ-Ad
	for openembedded-core@lists.openembedded.org;
	Sun, 09 Oct 2011 20:17:36 +0200
Received: by bke11 with SMTP id 11so7586558bke.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Oct 2011 11:11:57 -0700 (PDT)
Received: by 10.223.14.153 with SMTP id g25mr24303372faa.6.1318183912825;
	Sun, 09 Oct 2011 11:11:52 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id v17sm26551404fai.18.2011.10.09.11.11.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 09 Oct 2011 11:11:51 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20111009181016.GB3847@jama.jama.net>
Date: Sun, 9 Oct 2011 20:11:45 +0200
Message-Id: <9CD7A2A3-228F-46AE-AE56-5D73C9372E4A@dominion.thruhere.net>
References: <1317910796.6398.86.camel@ted>
	<37FC7DDC-D175-45B4-AF8A-F4D5AF384750@dominion.thruhere.net>
	<20111009181016.GB3847@jama.jama.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: sstate.bbclass: Ensure machine specific stamps are only wiped for the current task
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
X-List-Received-Date: Sun, 09 Oct 2011 18:17:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 9 okt. 2011, om 20:10 heeft Martin Jansa het volgende geschreven:

> On Sun, Oct 09, 2011 at 01:25:09PM +0200, Koen Kooi wrote:
>>=20
>> Op 6 okt. 2011, om 16:19 heeft Richard Purdie het volgende =
geschreven:
>>=20
>>> sstate was being a little too ethusiastic about removing stamp files =
and
>>> was removing stamp files for other machines when it shouldn't have =
been.
>>>=20
>>> This patch teaches sstate about machine specific stamp extensions =
and
>>> allows it to only remove the current task's stampfiles.
>>=20
>> Not sure if it's related to this problem or not but sstate is still =
not working as intented for me when switching machines, it keeps =
rebuilding the toolchain when switching machine. What I did this =
morning:
>>=20
>> 1) wipe out tmp, sstate-cache, pseudodone
>> 2) MACHINE=3Dbeagleboard bitbake u-boot
>> 3) cp conf/machine/beagleboard.conf conf/machine/brokensstate.conf
>> 4) MACHINE=3Dbrokensstate bitbake u-boot
>=20
> Same here.. :/ (building 3 armv7 machines.. always "from scratch").

To eliminate varables: Angstrom/shr/aurora/micro/other/all of the above?

>=20
>> And behold:
>>=20
>> NOTE: Resolving any missing task queue dependencies
>> NOTE: Preparing runqueue
>> NOTE: Executing SetScene Tasks
>> NOTE: package gcc-cross-4.5-r43+svnr178923: task =
do_populate_sysroot_setscene: Started
>> NOTE: package mtd-utils-1.4.6-r0: task do_populate_sysroot_setscene: =
Started
>> NOTE: package gcc-runtime-4.5-r43+svnr178923: task =
do_populate_sysroot_setscene: Started
>> NOTE: package eglibc-2.12-r27: task do_populate_sysroot_setscene: =
Started
>> NOTE: package mtd-utils-1.4.6-r0: task do_populate_sysroot_setscene: =
Succeeded
>> NOTE: package bash-4.1-r2: task do_populate_sysroot_setscene: Started
>> NOTE: package bash-4.1-r2: task do_populate_sysroot_setscene: =
Succeeded
>> NOTE: package gcc-cross-4.5-r43+svnr178923: task =
do_populate_sysroot_setscene: Succeeded
>> NOTE: package binutils-cross-2.20.1-r7: task =
do_populate_sysroot_setscene: Started
>> NOTE: package linux-libc-headers-2.6.39-r2: task =
do_populate_sysroot_setscene: Started
>> NOTE: package eglibc-2.12-r27: task do_populate_sysroot_setscene: =
Succeeded
>> NOTE: package binutils-cross-2.20.1-r7: task =
do_populate_sysroot_setscene: Succeeded
>> NOTE: package linux-libc-headers-2.6.39-r2: task =
do_populate_sysroot_setscene: Succeeded
>> NOTE: package libgcc-4.5-r43+svnr178923: task =
do_populate_sysroot_setscene: Started
>> NOTE: package gcc-runtime-4.5-r43+svnr178923: task =
do_populate_sysroot_setscene: Succeeded
>> NOTE: package gcc-cross-intermediate-4.5-r43+svnr178923: task =
do_populate_sysroot_setscene: Started
>> NOTE: package zlib-1.2.5-r0: task do_populate_sysroot_setscene: =
Started
>> NOTE: package libgcc-4.5-r43+svnr178923: task =
do_populate_sysroot_setscene: Succeeded
>> NOTE: package lzo-2.05-r0: task do_populate_sysroot_setscene: Started
>> NOTE: package zlib-1.2.5-r0: task do_populate_sysroot_setscene: =
Succeeded
>> NOTE: package e2fsprogs-1.41.14-r2: task =
do_populate_sysroot_setscene: Started
>> NOTE: package util-linux-2.19.1-r7: task =
do_populate_sysroot_setscene: Started
>> NOTE: package lzo-2.05-r0: task do_populate_sysroot_setscene: =
Succeeded
>> NOTE: package e2fsprogs-1.41.14-r2: task =
do_populate_sysroot_setscene: Succeeded
>> NOTE: package libtool-cross-2.4-r4: task =
do_populate_sysroot_setscene: Started
>> NOTE: package gettext-0.18.1.1-r4: task do_populate_sysroot_setscene: =
Started
>> NOTE: package libtool-cross-2.4-r4: task =
do_populate_sysroot_setscene: Succeeded
>> NOTE: package util-linux-2.19.1-r7: task =
do_populate_sysroot_setscene: Succeeded
>> NOTE: package gcc-cross-intermediate-4.5-r43+svnr178923: task =
do_populate_sysroot_setscene: Succeeded
>> NOTE: package ncurses-5.9-r1.1: task do_populate_sysroot_setscene: =
Started
>> NOTE: package perl-5.12.3-r5: task do_populate_sysroot_setscene: =
Started
>> NOTE: package eglibc-initial-2.12-r27: task =
do_populate_sysroot_setscene: Started
>> NOTE: package eglibc-initial-2.12-r27: task =
do_populate_sysroot_setscene: Succeeded
>> NOTE: package ncurses-5.9-r1.1: task do_populate_sysroot_setscene: =
Succeeded
>> NOTE: package db-5.1.19-r3: task do_populate_sysroot_setscene: =
Started
>> NOTE: package expat-2.0.1-r0: task do_populate_sysroot_setscene: =
Started
>> NOTE: package expat-2.0.1-r0: task do_populate_sysroot_setscene: =
Succeeded
>> NOTE: package perl-5.12.3-r5: task do_populate_sysroot_setscene: =
Succeeded
>> NOTE: package gettext-0.18.1.1-r4: task do_populate_sysroot_setscene: =
Succeeded
>> NOTE: package gdbm-1.8.3-r4: task do_populate_sysroot_setscene: =
Started
>> NOTE: package gcc-cross-initial-4.5-r43+svnr178923: task =
do_populate_sysroot_setscene: Started
>> NOTE: package gdbm-1.8.3-r4: task do_populate_sysroot_setscene: =
Succeeded
>> NOTE: package db-5.1.19-r3: task do_populate_sysroot_setscene: =
Succeeded
>> NOTE: package gcc-cross-initial-4.5-r43+svnr178923: task =
do_populate_sysroot_setscene: Succeeded
>> NOTE: Executing RunQueue Tasks
>> NOTE: Running task 536 of 920 (ID: 918, =
/OE/tentacle/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cr=
oss-initial_4.5.bb, do_populate_lic)
>> NOTE: Running task 549 of 920 (ID: 452, =
/OE/tentacle/sources/meta-openembedded/meta-oe/recipes-devtools/binutils/b=
inutils-cross_2.20.1.bb, do_fetch)
>> NOTE: Running task 553 of 920 (ID: 504, =
/OE/tentacle/sources/openembedded-core/meta/recipes-kernel/linux-libc-head=
ers/linux-libc-headers_2.6.39.bb, do_fetch)
>> NOTE: Running task 558 of 920 (ID: 538, =
/OE/tentacle/sources/meta-openembedded/meta-oe/recipes-devtools/gcc/gcc-cr=
oss-intermediate_4.5.bb, do_populate_lic)
>> NOTE: package gcc-cross-initial-4.5-r43+svnr178923: task =
do_populate_lic: Started
>> NOTE: package binutils-cross-2.20.1-r7: task do_fetch: Started
>> [..]
>> NOTE: package eglibc-2.12-r27: task do_compile: Started
>>=20
>>=20
>> What I suspect is happing is that angstrom is somehow putting =
$MACHINE in a var that upsets the sstate logic and/or rm_work upsets =
sstate and/or something else is broken. The problem is that I have no =
idea how to debug this except to ping Richard and get the magic diffsigs =
incantation.
>>=20
>> regards,
>>=20
>> Koen
>>=20
>>=20
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



