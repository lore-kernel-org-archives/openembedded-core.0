Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 53F7C7197C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 22:43:37 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP; 19 Jan 2017 14:43:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,256,1477983600"; 
	d="asc'?scan'208";a="55359306"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.143])
	([10.219.5.143])
	by fmsmga005.fm.intel.com with ESMTP; 19 Jan 2017 14:43:38 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <1484237986-31888-1-git-send-email-anibal.limon@linux.intel.com>
	<CAJTo0LYtE6TECPVqOfsdwdXnOFyvxEhXj2SHD79N1jmsScJkGA@mail.gmail.com>
	<587CF82F.9090207@linux.intel.com>
	<CAJTo0LaB5jYL2rjU3AHXAzzYeM49tcsb1dY3K+XH2=mv_x3T4w@mail.gmail.com>
	<587D3E59.30206@linux.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <588141C7.2090504@linux.intel.com>
Date: Thu, 19 Jan 2017 16:46:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <587D3E59.30206@linux.intel.com>
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
X-List-Received-Date: Thu, 19 Jan 2017 22:43:38 -0000
X-Groupsio-MsgNum: 91951
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="EOetkGBEc2NXq35xFrWJQbcekWb1JJqVc"

--EOetkGBEc2NXq35xFrWJQbcekWb1JJqVc
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 01/16/2017 03:42 PM, An=EDbal Lim=F3n wrote:
>=20
>=20
> On 01/16/2017 10:47 AM, Burton, Ross wrote:
>> On 16 January 2017 at 16:43, An=EDbal Lim=F3n <anibal.limon@linux.inte=
l.com>
>> wrote:
>>
>>> It's weird, i'll review it, but i don't imagine what is failing
>>> gobject-introspection because a qemu upgrade.
>>>
>>
>> The g-i build runs largely inside a qemu-user instance (the crash is i=
nside
>> qemu).
>=20
> Hi,
>=20
> I got the stack trace, it's an issue in the PPC TCG some patches in
> upstream looks like could be cause the problem [1][2][3].
>=20
>=20
> (gdb) bt
> #0  0x000000000086e204 in static_code_gen_buffer ()
> #1  0x000000000040e922 in cpu_tb_exec (itb=3D<optimized out>,
> itb=3D<optimized out>, cpu=3D0x29864d0) at
> /home/alimon/repos/poky/build-ppc/tmp/work/x86_64-linux/qemu-native/2.8=
=2E0-r0/qemu-2.8.0/cpu-exec.c:164
> #2  cpu_loop_exec_tb (sc=3D<optimized out>, tb_exit=3D<synthetic pointe=
r>,
> last_tb=3D<synthetic pointer>, tb=3D<optimized out>, cpu=3D0x29864d0) a=
t
> /home/alimon/repos/poky/build-ppc/tmp/work/x86_64-linux/qemu-native/2.8=
=2E0-r0/qemu-2.8.0/cpu-exec.c:544
> #3  cpu_exec (cpu=3Dcpu@entry=3D0x29864d0) at
> /home/alimon/repos/poky/build-ppc/tmp/work/x86_64-linux/qemu-native/2.8=
=2E0-r0/qemu-2.8.0/cpu-exec.c:638
> #4  0x0000000000445fba in cpu_loop (env=3Denv@entry=3D0x298e750) at
> /home/alimon/repos/poky/build-ppc/tmp/work/x86_64-linux/qemu-native/2.8=
=2E0-r0/qemu-2.8.0/linux-user/main.c:1359
> #5  0x0000000000448a95 in clone_func (arg=3D0x7fffffffa910) at
> /home/alimon/repos/poky/build-ppc/tmp/work/x86_64-linux/qemu-native/2.8=
=2E0-r0/qemu-2.8.0/linux-user/syscall.c:6090
> #6  0x00007ffff6a750a4 in start_thread (arg=3D0x7ffff7f4d700) at
> pthread_create.c:309
> #7  0x00007ffff67aa62d in clone () at
> ../sysdeps/unix/sysv/linux/x86_64/clone.S:111
>=20
> (gdb) info threds
>   Id   Target Id         Frame
>   1    Thread 0x7ffff7fd0780 (LWP 25006) "qemu-ppc"
> pthread_cond_wait@@GLIBC_2.3.2 () at
> ../nptl/sysdeps/unix/sysv/linux/x86_64/pthread_cond_wait.S:185
>   2    Thread 0x7ffff647e700 (LWP 25010) "qemu-ppc" syscall () at
> ../sysdeps/unix/sysv/linux/x86_64/syscall.S:38
> * 3    Thread 0x7ffff7f4d700 (LWP 25011) "qemu-ppc" 0x000000000086e204
> in static_code_gen_buffer ()
>=20
> I'll send an email to the qemu mailing list.
>=20
> Cheers,
> 	alimon
>=20
> [1]
> http://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Dbd6fefe71cec5a0c7d2be4=
ac96307f25db56abf9
> [2]
> http://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Dba4a8df83f474be1ba0251=
0f960e5224f29d229c
> [3]
> http://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D4f5d326046fa522010c0a6=
6f1bcaac9068253085

I can't get a response from qemu people so i will send a minor upgrade
2.7.1 while i debug the issue.

	alimon

>=20
>>
>> Ross
>>
>=20
>=20
>=20


--EOetkGBEc2NXq35xFrWJQbcekWb1JJqVc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJYgUHJAAoJEGJqcE9h3glgSzEQAIHsq9rvtE49dFYbgw6ffWO3
f6Gnjj1hJwIoK80DoEAk9JpwJH1K5/VsJUjKRI4rSgRiCC2+IYggWDxUgxPz0JSE
YKyYRx7XR+CuxDg8upcxbbezuHu0umVwbYBJBIJ6ek2ZUl7rZNSolZ3jZe35bvvV
7nm/xLYg/zb449b/Naf7lJwfGMLVBJhmpE14L7F0RIYhKOVQee5RyO7gYNPYiuOu
X/tKhSEfw98Zvb8VTH+RDwRgxvRl6MDV0e839sucgiODLIPFxdo79ACBiF1d5tQB
30baVS14t3AOCAgqZ/IvBrvsK3YAHiEvGNnWhUwTFiR1UmJEN2sgFBP0ljLZFWhr
C8ehAoOH/aufuAK8KObMNG8476vFA5pn7gGsKDDJDFkH69zfW0IYwgmuBNq3WEHy
+HkMmbO3FdBfQgUzbH3g7Bcn3o4YgbqRHpkR6zpCYHsGIVUJ6m5wsqSGxTrnU5BQ
RtZ8RSp5CmSWAXjE4bRKd0CsIZ2PY0bQAk6/kzN1AOmTkpL16MZH4JQ73pRRnjPu
Kqu1IM1uzpnru0YZ9vdwa/RXZQd6Etbrw9fzXmeJlYqo5pkrexXZK3Gwn9XpW9T6
O4K9zFBB+k3AhBsdzFaDS4nT+qyzjkEM6sJJu8LVo5kX4On3oGsUwFM99FOQLIZb
ZJiFZCPw5oCCBknwN2so
=VCxt
-----END PGP SIGNATURE-----

--EOetkGBEc2NXq35xFrWJQbcekWb1JJqVc--
