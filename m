Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 40AEF71AC8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 21:40:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 Jan 2017 13:40:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,241,1477983600"; 
	d="asc'?scan'208";a="1083710807"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.143])
	([10.219.5.143])
	by orsmga001.jf.intel.com with ESMTP; 16 Jan 2017 13:40:00 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <1484237986-31888-1-git-send-email-anibal.limon@linux.intel.com>
	<CAJTo0LYtE6TECPVqOfsdwdXnOFyvxEhXj2SHD79N1jmsScJkGA@mail.gmail.com>
	<587CF82F.9090207@linux.intel.com>
	<CAJTo0LaB5jYL2rjU3AHXAzzYeM49tcsb1dY3K+XH2=mv_x3T4w@mail.gmail.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <587D3E59.30206@linux.intel.com>
Date: Mon, 16 Jan 2017 15:42:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaB5jYL2rjU3AHXAzzYeM49tcsb1dY3K+XH2=mv_x3T4w@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] qemu: Upgrade to 2.8.0
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
X-List-Received-Date: Mon, 16 Jan 2017 21:40:01 -0000
X-Groupsio-MsgNum: 91806
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="ehvjDrQR2fsFV4cjX2hV2cXK7puH8twIo"

--ehvjDrQR2fsFV4cjX2hV2cXK7puH8twIo
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 01/16/2017 10:47 AM, Burton, Ross wrote:
> On 16 January 2017 at 16:43, An=C3=ADbal Lim=C3=B3n <anibal.limon@linux=
=2Eintel.com>
> wrote:
>=20
>> It's weird, i'll review it, but i don't imagine what is failing
>> gobject-introspection because a qemu upgrade.
>>
>=20
> The g-i build runs largely inside a qemu-user instance (the crash is in=
side
> qemu).

Hi,

I got the stack trace, it's an issue in the PPC TCG some patches in
upstream looks like could be cause the problem [1][2][3].


(gdb) bt
#0  0x000000000086e204 in static_code_gen_buffer ()
#1  0x000000000040e922 in cpu_tb_exec (itb=3D<optimized out>,
itb=3D<optimized out>, cpu=3D0x29864d0) at
/home/alimon/repos/poky/build-ppc/tmp/work/x86_64-linux/qemu-native/2.8.0=
-r0/qemu-2.8.0/cpu-exec.c:164
#2  cpu_loop_exec_tb (sc=3D<optimized out>, tb_exit=3D<synthetic pointer>=
,
last_tb=3D<synthetic pointer>, tb=3D<optimized out>, cpu=3D0x29864d0) at
/home/alimon/repos/poky/build-ppc/tmp/work/x86_64-linux/qemu-native/2.8.0=
-r0/qemu-2.8.0/cpu-exec.c:544
#3  cpu_exec (cpu=3Dcpu@entry=3D0x29864d0) at
/home/alimon/repos/poky/build-ppc/tmp/work/x86_64-linux/qemu-native/2.8.0=
-r0/qemu-2.8.0/cpu-exec.c:638
#4  0x0000000000445fba in cpu_loop (env=3Denv@entry=3D0x298e750) at
/home/alimon/repos/poky/build-ppc/tmp/work/x86_64-linux/qemu-native/2.8.0=
-r0/qemu-2.8.0/linux-user/main.c:1359
#5  0x0000000000448a95 in clone_func (arg=3D0x7fffffffa910) at
/home/alimon/repos/poky/build-ppc/tmp/work/x86_64-linux/qemu-native/2.8.0=
-r0/qemu-2.8.0/linux-user/syscall.c:6090
#6  0x00007ffff6a750a4 in start_thread (arg=3D0x7ffff7f4d700) at
pthread_create.c:309
#7  0x00007ffff67aa62d in clone () at
=2E./sysdeps/unix/sysv/linux/x86_64/clone.S:111

(gdb) info threds
  Id   Target Id         Frame
  1    Thread 0x7ffff7fd0780 (LWP 25006) "qemu-ppc"
pthread_cond_wait@@GLIBC_2.3.2 () at
=2E./nptl/sysdeps/unix/sysv/linux/x86_64/pthread_cond_wait.S:185
  2    Thread 0x7ffff647e700 (LWP 25010) "qemu-ppc" syscall () at
=2E./sysdeps/unix/sysv/linux/x86_64/syscall.S:38
* 3    Thread 0x7ffff7f4d700 (LWP 25011) "qemu-ppc" 0x000000000086e204
in static_code_gen_buffer ()

I'll send an email to the qemu mailing list.

Cheers,
	alimon

[1]
http://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Dbd6fefe71cec5a0c7d2be4ac=
96307f25db56abf9
[2]
http://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Dba4a8df83f474be1ba02510f=
960e5224f29d229c
[3]
http://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D4f5d326046fa522010c0a66f=
1bcaac9068253085

>=20
> Ross
>=20


--ehvjDrQR2fsFV4cjX2hV2cXK7puH8twIo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJYfT5eAAoJEGJqcE9h3glg8oEP/ROILly1ybYVDyvZXDydm7ti
CXK10kh34wB69FugV26IVhQSidmfyNwRs4xcLCnVlgtnHjOQf/dT1VQfM44Q160r
gb+VAScE+768XE0epvSfiANXaYpqBAm7HKzsWaA9Fr/BtKeMXwo0baNK7+KHNKnj
P6+GZbbFwual2X1YH6e6SuRXotTOjuLnXlQ4miFK2duYEKfeTOL1fVWt5yA9m0Xv
3J7eSKfQQaIraXIPZc823DYtxf0xCVVJhWjQz2tXVEFldR8hs7n1WqB8Fx6j6GsE
rgu0GEWbjjTKA28ILzRTgfkW0K4Afw5hAHWddaRdzgBkRW1lr5j4zsqHF5ruvaMD
Tb3TL2+6BkxhJuhHQmAa2vQ4wEK3BWM2KKVzoUTHfuHGxxIlmngdFO93vFHO3KoO
wFoWOEIEa7H8D6Y6nRgCEHpuhofMCoygz8pMrrLj6oVX7aDl3MPFIhxpJ2RrSEXD
y7UKF/2b/jeEZnXwX9r8nQZEz0b1LLfr7L3/RX5n6pKUyUvLxhQRtX3kGdj8qaKv
iM2x74LgwGhkrR1nTKGlh3Rza4P5gHx4AARdY8lSnZ/cns7CohYxNGhpM0b0OX4E
bSwytmtf5G6Nxc1NyyUVOg+LnVMZN6n0pNE745z+yFO4+yaR84JeaGdaDMMUNYpS
FSe8jMtlya81sj28POzS
=JJBR
-----END PGP SIGNATURE-----

--ehvjDrQR2fsFV4cjX2hV2cXK7puH8twIo--
