Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3546C6077D
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 03:30:47 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id rl6so3524496pac.1
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 20:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:date:message-id
	:cc:to:mime-version:x-mailer;
	bh=dMhBhVH5Ux8IECR21pBd4cKPmBVZrXnYSgtDjiNSRNY=;
	b=kpRGF/0KTkVNHRNQWc74vA4NxTu47+rt2il0l7aSG7QOwqQDmHpUuUpRy0usxH8pjm
	GtcgC8WSN1m0LElYDSynSULOemhxWrMvKVf8mdzuDMGrjZtuUIWH9rtruifRLT+3St+R
	2jWaMnf9BQLJ7m/nrXfxXXCplUr8AqFg2S4tmYf4aEDEJF7wjC8QbUyraCLE7KP9dWFa
	dYP6qNsb1y+75a0nXiR/515jaqxWMprYbslafxsCiUUBiLIzdgvOzTzwGEYVk5sK8x4U
	LD5JlQ7XdY7p87+LImAAAyxJAHheee9xOQ6aphq3SPNsEHDtgY8cZAmFWZ6l76FpmFys
	EuhQ==
X-Received: by 10.66.145.98 with SMTP id st2mr419843pab.24.1371526248226;
	Mon, 17 Jun 2013 20:30:48 -0700 (PDT)
Received: from scoonan-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	fp2sm16201647pbb.36.2013.06.17.20.30.46 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 17 Jun 2013 20:30:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Jun 2013 20:30:45 -0700
Message-Id: <A6E8629E-ED47-4DD7-8C53-B0D467BADA39@gmail.com>
To: "<openembedded-core@lists.openembedded.org> oe-core layer"
	<Openembedded-core@lists.openembedded.org>, 
	Bruce Ashfield <bruce.ashfield@windriver.com>
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
X-Mailer: Apple Mail (2.1508)
Cc: "yocto@yoctoproject.org \(yocto@yoctoproject.org\)"
	<yocto@yoctoproject.org>
Subject: Fix for kernel 3.8/gcc-4.8 segfault on qemuarm
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Jun 2013 03:30:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi Bruce and All

Finally after a long innings I have diagnosed the mystery behind the =
below segfault that we see on kernel 3.8 which compiled with gcc 4.8 but =
don't show when compiled with gcc 4.7


Unable to handle kernel paging request at virtual address ffffffff
pgd =3D c0004000
[ffffffff] *pgd=3D07ffe831, *pte=3D00000000, *ppte=3D00000000
Internal error: Oops: 17 [#1] PREEMPT ARM
Modules linked in:
CPU: 0    Not tainted  (3.8.0-yocto-standard+ #32)
PC is at kmem_cache_alloc+0x38/0x154
LR is at subsys_system_register+0x34/0xd8
pc : [<c00bd4d8>]    lr : [<c0327244>]    psr: a0000153
sp : c7835ef0  ip : c7904590  fp : 00000000
r10: c0688dc4  r9 : c06db900  r8 : c0327244
r7 : 00000000  r6 : 000080d0  r5 : c7801380  r4 : ffffffff
r3 : 00000000  r2 : 00000078  r1 : 000080d0  r0 : c7801380
Flags: NzCv  IRQs on  FIQs off  Mode SVC_32  ISA ARM  Segment kernel
Control: 00093177  Table: 00004000  DAC: 00000017
Process swapper (pid: 1, stack limit =3D 0xc78341b8)
Stack: (0xc7835ef0 to 0xc7836000)
5ee0:                                     c06a5564 c06b8b8c c7834028 =
00000000
5f00: c0680218 c0327244 c7835f28 c06a5564 00000006 c7834028 c06db900 =
c0688dd4
5f20: c7835f28 c00089a0 c0657f44 00000006 c086e561 00000006 00000000 =
c06a5534
5f40: c06a5564 00000006 c06db900 c0680218 c069fd68 0000008e c069fd5c =
c0680924
5f60: 00000006 00000006 c0680218 00000000 00000000 00000000 00000000 =
00000000
5f80: c04f5e68 00000000 00000000 00000000 00000000 00000000 00000000 =
c04f5e70
5fa0: 00000000 00000000 c04f5e68 c000deb0 00000000 00000000 00000000 =
00000000
5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000
5fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 =
00000000
[<c00bd4d8>] (kmem_cache_alloc+0x38/0x154) from [<c0327244>] =
(subsys_system_register+0x34/0xd8)
[<c0327244>] (subsys_system_register+0x34/0xd8) from [<c0688dd4>] =
(init_clocksource_sysfs+0x10/0x54)
[<c0688dd4>] (init_clocksource_sysfs+0x10/0x54) from [<c00089a0>] =
(do_one_initcall+0x10c/0x17c)
[<c00089a0>] (do_one_initcall+0x10c/0x17c) from [<c0680924>] =
(kernel_init_freeable+0x164/0x224)
[<c0680924>] (kernel_init_freeable+0x164/0x224) from [<c04f5e70>] =
(kernel_init+0x8/0x150)
[<c04f5e70>] (kernel_init+0x8/0x150) from [<c000deb0>] =
(ret_from_fork+0x14/0x24)
Code: e5934000 e3540000 0a00001a e5953014 (e7941003)
---[ end trace f4d187650e17fc5c ]---
Kernel panic - not syncing: Attempted to kill init! exitcode=3D0x0000000b


Please apply the patch below to linux-yocto-3.8

=
http://sakrah.dontexist.org/files/patches/0001-ARM-7668-1-fix-memset-relat=
ed-crashes-caused-by-rece.patch

This is a back port from 3.9 therefore safe. The problem is not limited =
to linux-yocto it also impacts upstream 3.8 stable
but 3.8 stable is end of life so why bother. If linux-yocto upgrades to =
3.9 or 3.10 and drops 3.8 in 1.5 then we are ok too.

Let me know how it goes

Thanks

-Khem


