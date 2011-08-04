Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX18PjSrAQAouZHdnDzBRJlfh8xQr6VditoY=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1Qoqgm-00026V-6n
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 07:41:48 +0200
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p745bOf6019387
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Aug 2011 00:37:25 -0500
Mime-Version: 1.0 (Apple Message framework v1084)
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <4E3964A2.9020704@windriver.com>
Date: Thu, 4 Aug 2011 00:37:24 -0500
Message-Id: <DA53B8C1-B1AB-4621-B1CC-753DE184A2A7@kernel.crashing.org>
References: <BC707063-0722-4F72-A066-4E811125354B@kernel.crashing.org>
	<4E395D20.8020608@windriver.com>
	<AE047C85-8214-4716-920E-3B0177117231@kernel.crashing.org>
	<4E3964A2.9020704@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: prelink issue with ppc64?
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
X-List-Received-Date: Thu, 04 Aug 2011 05:41:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 3, 2011, at 10:09 AM, Mark Hatle wrote:

> On 8/3/11 9:53 AM, Kumar Gala wrote:
>>=20
>> On Aug 3, 2011, at 9:37 AM, Mark Hatle wrote:
>>=20
>>> On 8/3/11 12:35 AM, Kumar Gala wrote:
>>>> If prelink gets a chance to properly run I get a rootfs that does:
>>>>=20
>>>> /sbin/init: relocation error: /lib64/libc.so.6: symbol =
_rtld_global_ro, version GLIBC_PRIVATE not defined in file ld64.so.1 =
with link time reference
>>>>=20
>>>> if 'baselib' is set to /lib we get:
>>>>=20
>>>> =
/local/home/galak/git/poky/build-p5020/tmp/sysroots/x86_64-linux/usr/sbin/=
prelink: /sbin/init.sysvinit: Using /lib/ld64.so.1, not /lib64/ld64.so.1 =
as dynamic linker
>>>>=20
>>>> if 'baselib' is set to /lib64 we get:
>>>>=20
>>>> Assigned virtual address space slots for libraries:
>>>> /lib64/ld64.so.1                                             =
00000080f4910000-00000080f49473d0
>>>> /lib64/libc.so.6                                             =
00000080f4950000-00000080f4afe090
>>>> /lib64/libdl.so.2                                            =
00000080f4b10000-00000080f4b23520
>>>> /lib64/libcrypt.so.1                                         =
00000080f4b10000-00000080f4b57708
>>>> /lib64/libutil.so.1                                          =
00000080f4b10000-00000080f4b234a0
>>>> Would prelink /lib64/ld-2.13.so
>>>> Would prelink /lib64/libc-2.13.so
>>>>=20
>>>> Not sure what prelink is doing but it seems to breaking things.  =
Any ideas?
>>>>=20
>>>> ---
>>>>=20
>>>> I'm also concerned that we use /etc/prelink.conf when invoking =
prelink.
>>>=20
>>> Prelinker is being run within the rootfs, so the /etc/prelink.conf =
being used is
>>> the one inside of the image -- NOT the system version.
>>=20
>> Is this because of psuedo or something else?
>=20
> In the cross prelinker, we pass in the --root=3D<image>.  This =
instructs the
> cross-prelinker to prefix <image> to most paths.
>=20
>>> I would suspect that the cross-prelinker rtld emulation is likely =
setup for the
>>> LSB style library paths and may be causing some of the problems.
>=20
> You can run the cross-prelinker's rtld emulation by running the =
prelink-rtld
> program located in =
build/tmp-eglibc/work/x86_64-linux/usr/sbin/prelink-rtld
>=20
> Passing --root=3D<path> will setup the sysroot path for reference, =
adding in
> --target-paths will allow you to pass further arguments as referenced =
on the
> sysroot.
>=20
> So prelink-rtld --root=3D/foo/bar/build/sysroot/image --target-paths =
/sbin/init
>=20
> Should give you back an ldd like syntax within the sysroot, for =
/sbin/init.
> (without --target-paths, you need to specify the full path to the =
/sbin/init..
> this is useful when running the rtld against items outside of the =
image.)
>=20
>>>=20
>>> I'd suggest simply disabling prelink and getting everything to work =
first.. once
>>> it does we can work through any prelinker issues.  (Prelink on PPC64 =
hasn't been
>>> tested within the oe-core environment.. so it could very well have =
issues beyond
>>> the ld.so path.)
>>=20
>> Everything else is working, so prelink is what fails for me (at least =
for a simple minimal) build.
>>=20
>> any suggestions on how to try and debug further, who might be more =
familiar with prelink and what its doing?  When I ran readelf -a on =
ld-2.13.so after prelink was getting weird results, not sure if thats =
normal or not.
>=20
> I'm the prelink maintainer for Yocto, however I know more about the =
way the
> cross-prelinker functionality works then how the ELF specific prelink =
functions
> work.  I've been relying on the upstream prelink project to manage the
> individual architecture/ABI prelink standards.
>=20
> My suggestion is to disable cross-prelinking, and revert to the =
upstream prelink
> project -- run the binary on the target and see if it fails in the =
same way.  If
> it does, then we know it's a deeper problem then the cross prelink =
integration.
>=20
> You can pull down the git repository:  =
git://git.yoctoproject.org/prelink-cross.git
>=20
> The "master" branch is identical to the upstream SVN branch.  The
> "cross_prelink" branch is the current state of integration.

So running prelink on target seems ok.  I used the version from =
prelink_git.bb.

- k=


