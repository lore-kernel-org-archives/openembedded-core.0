Return-Path: <Mats.Karrman@tritech.se>
Received: from tritech.se (tritech.se [46.59.120.190])
	by mail.openembedded.org (Postfix) with ESMTP id ED28669686
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 12:08:33 +0000 (UTC)
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id s2SC8SNm031900
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 13:08:33 +0100
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%10]) with mapi id
	14.02.0387.000; Fri, 28 Mar 2014 13:08:28 +0100
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Thread-Topic: eglibc: powerpc time related syscall malfunction - solved
Thread-Index: AQHPSn2QbRHDsc6hcE2TnNFc5au76g==
Date: Fri, 28 Mar 2014 12:08:28 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C5B3A7C97@post.tritech.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.82]
MIME-Version: 1.0
Subject: Re: eglibc: powerpc time related syscall malfunction - solved
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
X-List-Received-Date: Fri, 28 Mar 2014 12:08:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wednesday, March 26, 2014 5:10 PM, Mats K=E4rrman wrote:=0A=
> Hi,=0A=
>=0A=
> The system is an OE-Core Dora "distro-less" build for a 32-bit PowerPC MP=
C5125.=0A=
> Tune file used is tune-ppce300c3.inc.=0A=
> eglibc version 2.18, gcc 4.8.1, binutils 2.23.2 (Dora defaults).=0A=
> =0A=
> The symptom that made me discover the problem was that some programs coul=
d not=0A=
> get the correct system time while others could. The failing ones often go=
t the same=0A=
> "insane" time value every time a specific printout was triggered but diff=
erent printouts=0A=
> got different time values (i.e. probably uninitialized stack variables). =
E.g.:=0A=
> =0A=
> "date" (busybox) works.=0A=
> "logger" (same busybox binary) does not.=0A=
> Neither does the pppd (syslog too).=0A=
> File access dates are OK.=0A=
> A proprietary program using ftime() is not working.=0A=
> A little test program (see below) gets the correct time when using time()=
 but not=0A=
> when using ftime().=0A=
> =0A=
> The same HW with SW built on OE-classic 2011.03 does not have this error.=
=0A=
> Dora on i.MX6 also works OK.=0A=
> =0A=
> I tried different kernels (3.2 and 3.12), and different tunings (hard-flo=
at, soft-float, etc.)=0A=
> but the behavior is the same.=0A=
> =0A=
> Tried using strace and found that on the old OE-classic and on i.MX6 I go=
t trace=0A=
> logs for the syscalls to time (OE-classic) or gettimeofday (i.MX6) but fo=
r the=0A=
> new system there are no time related calls traced at all, not when it wor=
ks=0A=
> and not when it fails...=0A=
> =0A=
> Then I tried with gdb. The paths taken by the program depends a lot on th=
e=0A=
> machine tuning options used when building the image and SDK but I believe=
 I=0A=
> have found a common pattern:=0A=
> When it works, a time function invoking a syscall, e.g. __kernel_time, is=
 called=0A=
> but when it doesn't work, instead a "gnu_indirect_function" is called, re=
turning=0A=
> a pointer to either a vdso or a local function but after that the functio=
n isn't=0A=
> called. As I understand it, this should happen through as/ld magic but fo=
r some=0A=
> reason it doesn't.=0A=
>=0A=
=0A=
As it turned out, this is a known problem with powerpc and eglibc 2.18.=0A=
In 2.17 the use of vdso and indirect functions was not introduced yet and=
=0A=
in 2.19 it is fixed.=0A=
=0A=
The fact that the functions are implemented as vdso calls for later kernels=
=0A=
also explains why they are not visible to strace (the same is true for x86_=
64).=0A=
=0A=
I will send a patch containing a backport of the fix for Dora / eglibc 2.18=
 shortly.=0A=
=0A=
/M=0A=

