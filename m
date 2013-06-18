Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 37A6E6023E
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 04:41:21 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id 10so3486228pdi.39
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 21:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=SQmPNfS32I4cgIYaef4Hwe4vSI4bwX/fZNBwI9/mSKM=;
	b=UcQ+GC2900Ns7Totu6I5gdKHv7QZhVUR8jbEk2uQAY2qbuKdBvShPD0/ye/pzD2ILM
	EW6ALy54/nQcahbFPozBiYngykUTiUQlO/ABQ378gKd9m6A26LCg+XCWQOBRFPpSLoA0
	41D7HH2/v0wlga0FHgJ53ZllssP9xsDkELkwwtT9Ht/mLZGDM+rcXyibNsqv9kAKixNN
	//e6bcWi4r9My9izYYJfRNU+2JwnDbU7/rdZz49U342dAob7R1Tz99zrM9o2FuOLAW8T
	DYqi0NF+iURgy1KWlmEZscZ0vma9PFpUY7KMFaMpvKCYFSnIM+nlcpzLgIFUBJpVS3bd
	vQvQ==
X-Received: by 10.66.146.104 with SMTP id tb8mr499754pab.170.1371530482212;
	Mon, 17 Jun 2013 21:41:22 -0700 (PDT)
Received: from scoonan-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id xz1sm17766741pab.5.2013.06.17.21.41.20
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 17 Jun 2013 21:41:21 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <51BFE413.2020303@windriver.com>
Date: Mon, 17 Jun 2013 21:41:18 -0700
Message-Id: <99677DAA-0C63-481C-9499-0E4F00188725@gmail.com>
References: <A6E8629E-ED47-4DD7-8C53-B0D467BADA39@gmail.com>
	<51BFE413.2020303@windriver.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
X-Mailer: Apple Mail (2.1508)
Cc: "yocto@yoctoproject.org \(yocto@yoctoproject.org\)"
	<yocto@yoctoproject.org>,
	"<openembedded-core@lists.openembedded.org> oe-core layer"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: Fix for kernel 3.8/gcc-4.8 segfault on qemuarm
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
X-List-Received-Date: Tue, 18 Jun 2013 04:41:21 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Jun 17, 2013, at 9:37 PM, Bruce Ashfield =
<bruce.ashfield@windriver.com> wrote:

> On 13-06-17 11:30 PM, Khem Raj wrote:
>> Hi Bruce and All
>>=20
>> Finally after a long innings I have diagnosed the mystery behind the =
below segfault that we see on kernel 3.8 which compiled with gcc 4.8 but =
don't show when compiled with gcc 4.7
>>=20
>>=20
>=20
> There also seems to be a follow up patch:
>=20
> commit 418df63adac56841ef6b0f1fcf435bc64d4ed177
> Author: Nicolas Pitre <nicolas.pitre@linaro.org>
> Date:   Tue Mar 12 13:00:42 2013 +0100
>=20
>    ARM: 7670/1: fix the memset fix
>=20
>    Commit 455bd4c430b0 ("ARM: 7668/1: fix memset-related crashes =
caused by
>    recent GCC (4.7.2) optimizations") attempted to fix a compliance =
issue
>    with the memset return value.  However the memset itself became =
broken
>    by that patch for misaligned pointers.
>=20
>    This fixes the above by branching over the entry code from the
>    misaligned fixup code to avoid reloading the original pointer.
>=20
>    Also, because the function entry alignment is wrong in the Thumb =
mode
>    compilation, that fixup code is moved to the end.
>=20
>    While at it, the entry instructions are slightly reworked to help =
dual
>    issue pipelines.
>=20
>    Signed-off-by: Nicolas Pitre <nico@linaro.org>
>    Tested-by: Alexander Holler <holler@ahsoftware.de>
>    Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
>=20
> :100644 100644 d912e73... 94b0650... M  arch/arm/lib/memset.S
>=20
> --------
>=20
> I've staged it as well, and will do a boot test in the morning once
> my build has completed. Time to call it a night here.

I did not need anything other than the first patch to get over the =
segfault. but yes it completes the fix
so having both is better

>=20
> Bruce
>=20
>> Unable to handle kernel paging request at virtual address ffffffff
>> pgd =3D c0004000
>> [ffffffff] *pgd=3D07ffe831, *pte=3D00000000, *ppte=3D00000000
>> Internal error: Oops: 17 [#1] PREEMPT ARM
>> Modules linked in:
>> CPU: 0    Not tainted  (3.8.0-yocto-standard+ #32)
>> PC is at kmem_cache_alloc+0x38/0x154
>> LR is at subsys_system_register+0x34/0xd8
>> pc : [<c00bd4d8>]    lr : [<c0327244>]    psr: a0000153
>> sp : c7835ef0  ip : c7904590  fp : 00000000
>> r10: c0688dc4  r9 : c06db900  r8 : c0327244
>> r7 : 00000000  r6 : 000080d0  r5 : c7801380  r4 : ffffffff
>> r3 : 00000000  r2 : 00000078  r1 : 000080d0  r0 : c7801380
>> Flags: NzCv  IRQs on  FIQs off  Mode SVC_32  ISA ARM  Segment kernel
>> Control: 00093177  Table: 00004000  DAC: 00000017
>> Process swapper (pid: 1, stack limit =3D 0xc78341b8)
>> Stack: (0xc7835ef0 to 0xc7836000)
>> 5ee0:                                     c06a5564 c06b8b8c c7834028 =
00000000
>> 5f00: c0680218 c0327244 c7835f28 c06a5564 00000006 c7834028 c06db900 =
c0688dd4
>> 5f20: c7835f28 c00089a0 c0657f44 00000006 c086e561 00000006 00000000 =
c06a5534
>> 5f40: c06a5564 00000006 c06db900 c0680218 c069fd68 0000008e c069fd5c =
c0680924
>> 5f60: 00000006 00000006 c0680218 00000000 00000000 00000000 00000000 =
00000000
>> 5f80: c04f5e68 00000000 00000000 00000000 00000000 00000000 00000000 =
c04f5e70
>> 5fa0: 00000000 00000000 c04f5e68 c000deb0 00000000 00000000 00000000 =
00000000
>> 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 =
00000000
>> 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 =
00000000
>> [<c00bd4d8>] (kmem_cache_alloc+0x38/0x154) from [<c0327244>] =
(subsys_system_register+0x34/0xd8)
>> [<c0327244>] (subsys_system_register+0x34/0xd8) from [<c0688dd4>] =
(init_clocksource_sysfs+0x10/0x54)
>> [<c0688dd4>] (init_clocksource_sysfs+0x10/0x54) from [<c00089a0>] =
(do_one_initcall+0x10c/0x17c)
>> [<c00089a0>] (do_one_initcall+0x10c/0x17c) from [<c0680924>] =
(kernel_init_freeable+0x164/0x224)
>> [<c0680924>] (kernel_init_freeable+0x164/0x224) from [<c04f5e70>] =
(kernel_init+0x8/0x150)
>> [<c04f5e70>] (kernel_init+0x8/0x150) from [<c000deb0>] =
(ret_from_fork+0x14/0x24)
>> Code: e5934000 e3540000 0a00001a e5953014 (e7941003)
>> ---[ end trace f4d187650e17fc5c ]---
>> Kernel panic - not syncing: Attempted to kill init! =
exitcode=3D0x0000000b
>>=20
>>=20
>> Please apply the patch below to linux-yocto-3.8
>>=20
>> =
http://sakrah.dontexist.org/files/patches/0001-ARM-7668-1-fix-memset-relat=
ed-crashes-caused-by-rece.patch
>>=20
>> This is a back port from 3.9 therefore safe. The problem is not =
limited to linux-yocto it also impacts upstream 3.8 stable
>> but 3.8 stable is end of life so why bother. If linux-yocto upgrades =
to 3.9 or 3.10 and drops 3.8 in 1.5 then we are ok too.
>>=20
>> Let me know how it goes
>>=20
>> Thanks
>>=20
>> -Khem
>>=20
>=20


