Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A65B7771EB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 21:49:25 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 31 Jan 2017 13:49:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,316,1477983600"; 
	d="asc'?scan'208";a="815573395"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.128.122])
	([10.219.128.122])
	by FMSMGA003.fm.intel.com with ESMTP; 31 Jan 2017 13:49:25 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <1484237986-31888-1-git-send-email-anibal.limon@linux.intel.com>
	<CAJTo0LYtE6TECPVqOfsdwdXnOFyvxEhXj2SHD79N1jmsScJkGA@mail.gmail.com>
	<587CF82F.9090207@linux.intel.com>
	<CAJTo0LaB5jYL2rjU3AHXAzzYeM49tcsb1dY3K+XH2=mv_x3T4w@mail.gmail.com>
	<587D3E59.30206@linux.intel.com> <588141C7.2090504@linux.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <5891071D.5020904@linux.intel.com>
Date: Tue, 31 Jan 2017 15:52:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <588141C7.2090504@linux.intel.com>
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
X-List-Received-Date: Tue, 31 Jan 2017 21:49:25 -0000
X-Groupsio-MsgNum: 92688
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="p1eimCikCk5NLIsorC2rJjoUIcM5FV8GS"

--p1eimCikCk5NLIsorC2rJjoUIcM5FV8GS
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 01/19/2017 04:46 PM, An=EDbal Lim=F3n wrote:
>=20
>=20
> On 01/16/2017 03:42 PM, An=EDbal Lim=F3n wrote:
>>
>>
>> On 01/16/2017 10:47 AM, Burton, Ross wrote:
>>> On 16 January 2017 at 16:43, An=EDbal Lim=F3n <anibal.limon@linux.int=
el.com>
>>> wrote:
>>>
>>>> It's weird, i'll review it, but i don't imagine what is failing
>>>> gobject-introspection because a qemu upgrade.
>>>>
>>>
>>> The g-i build runs largely inside a qemu-user instance (the crash is =
inside
>>> qemu).
>>
>> Hi,
>>
>> I got the stack trace, it's an issue in the PPC TCG some patches in
>> upstream looks like could be cause the problem [1][2][3].
>>
>>
>> (gdb) bt
>> #0  0x000000000086e204 in static_code_gen_buffer ()
>> #1  0x000000000040e922 in cpu_tb_exec (itb=3D<optimized out>,
>> itb=3D<optimized out>, cpu=3D0x29864d0) at
>> /home/alimon/repos/poky/build-ppc/tmp/work/x86_64-linux/qemu-native/2.=
8.0-r0/qemu-2.8.0/cpu-exec.c:164
>> #2  cpu_loop_exec_tb (sc=3D<optimized out>, tb_exit=3D<synthetic point=
er>,
>> last_tb=3D<synthetic pointer>, tb=3D<optimized out>, cpu=3D0x29864d0) =
at
>> /home/alimon/repos/poky/build-ppc/tmp/work/x86_64-linux/qemu-native/2.=
8.0-r0/qemu-2.8.0/cpu-exec.c:544
>> #3  cpu_exec (cpu=3Dcpu@entry=3D0x29864d0) at
>> /home/alimon/repos/poky/build-ppc/tmp/work/x86_64-linux/qemu-native/2.=
8.0-r0/qemu-2.8.0/cpu-exec.c:638
>> #4  0x0000000000445fba in cpu_loop (env=3Denv@entry=3D0x298e750) at
>> /home/alimon/repos/poky/build-ppc/tmp/work/x86_64-linux/qemu-native/2.=
8.0-r0/qemu-2.8.0/linux-user/main.c:1359
>> #5  0x0000000000448a95 in clone_func (arg=3D0x7fffffffa910) at
>> /home/alimon/repos/poky/build-ppc/tmp/work/x86_64-linux/qemu-native/2.=
8.0-r0/qemu-2.8.0/linux-user/syscall.c:6090
>> #6  0x00007ffff6a750a4 in start_thread (arg=3D0x7ffff7f4d700) at
>> pthread_create.c:309
>> #7  0x00007ffff67aa62d in clone () at
>> ../sysdeps/unix/sysv/linux/x86_64/clone.S:111
>>
>> (gdb) info threds
>>   Id   Target Id         Frame
>>   1    Thread 0x7ffff7fd0780 (LWP 25006) "qemu-ppc"
>> pthread_cond_wait@@GLIBC_2.3.2 () at
>> ../nptl/sysdeps/unix/sysv/linux/x86_64/pthread_cond_wait.S:185
>>   2    Thread 0x7ffff647e700 (LWP 25010) "qemu-ppc" syscall () at
>> ../sysdeps/unix/sysv/linux/x86_64/syscall.S:38
>> * 3    Thread 0x7ffff7f4d700 (LWP 25011) "qemu-ppc" 0x000000000086e204=

>> in static_code_gen_buffer ()
>>
>> I'll send an email to the qemu mailing list.
>>
>> Cheers,
>> 	alimon
>>
>> [1]
>> http://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Dbd6fefe71cec5a0c7d2be=
4ac96307f25db56abf9

This patch caused the issue, i received a email with the patch for fix
this problem from the qemu-ppc ML.

https://lists.gnu.org/archive/html/qemu-ppc/2017-01/msg00413.html

I tested the patch and send again the qemu upgrade to 2.8.0.

Cheers,
	alimon

>> [2]
>> http://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3Dba4a8df83f474be1ba025=
10f960e5224f29d229c
>> [3]
>> http://git.qemu.org/?p=3Dqemu.git;a=3Dcommit;h=3D4f5d326046fa522010c0a=
66f1bcaac9068253085
>=20
> I can't get a response from qemu people so i will send a minor upgrade
> 2.7.1 while i debug the issue.
>=20
> 	alimon
>=20
>>
>>>
>>> Ross
>>>
>>
>>
>>
>=20
>=20
>=20


--p1eimCikCk5NLIsorC2rJjoUIcM5FV8GS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJYkQcgAAoJEGJqcE9h3glgdPsQAJ4nwMYqwZPRQA+Jj5gi06st
GeYQmIQNaJoxu8EWCbg7dRT3aVvFr0p6QEO2jGHhPk6zMTir08nSbfxrM4/Na5D+
5VMO5Z7Fuhk1aO7H0xEwWXQ35PqmYTipIjdKpQsNnfR9PyEnzB7IhxMKMJDw0Ewp
adygNx+/J4nwF4oBBW7xnwP42gHelSWJmJafGxs1G/IPdDxVcokw0msD6XpqZGUl
hGwbq0NMLfjdNGXEP58pcJEH1z02qNO/6OmO0/0q9jva/UmO0DQAH1TSzXEckPFd
KH60KhB6+ezdpd4Jtw/QbMkgWrP86jRNllGsUhZMr13zvriW/ByxmIMcowJ5zE/Q
MK6wHSa5uneTvZwtpTHecr2rYG8I1yOrwtB2vAjdYIcDBBYHwH+LyWbRDiOWzDNr
wGWx8/ANop2bc2FjIOc2uh69c0Q2OtMUoWlwrB+nV3JqeVnjqv0j9YkLtXbNoG22
iHgqqK23tsQT2w9FxK5pJ3s5CmdcRd2ajP+UeQvr7hmVR9nuwH8YhWSgpaiZxJ4x
nLO1n2tmdSyhHRClz/szET1HSZaCxKEJqOzx2BMeGYz4Cur/R1Lrv7r08ciLOM1G
Fo40pkXKLY9lFW3eh6rt6fkEMyjsSQhTww630To9fzwHcw8NbMokhT7P0KNiNqy2
7VZin6IVkIWw/Onk2dKT
=+gbV
-----END PGP SIGNATURE-----

--p1eimCikCk5NLIsorC2rJjoUIcM5FV8GS--
