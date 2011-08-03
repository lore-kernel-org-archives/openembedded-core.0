Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Qod8l-0007zZ-9N
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 17:13:47 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p73F9NV3002045
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Aug 2011 08:09:23 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Wed, 3 Aug 2011 08:09:23 -0700
Message-ID: <4E3964A2.9020704@windriver.com>
Date: Wed, 3 Aug 2011 10:09:22 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <BC707063-0722-4F72-A066-4E811125354B@kernel.crashing.org>
	<4E395D20.8020608@windriver.com>
	<AE047C85-8214-4716-920E-3B0177117231@kernel.crashing.org>
In-Reply-To: <AE047C85-8214-4716-920E-3B0177117231@kernel.crashing.org>
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
X-List-Received-Date: Wed, 03 Aug 2011 15:13:47 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 8/3/11 9:53 AM, Kumar Gala wrote:
> 
> On Aug 3, 2011, at 9:37 AM, Mark Hatle wrote:
> 
>> On 8/3/11 12:35 AM, Kumar Gala wrote:
>>> If prelink gets a chance to properly run I get a rootfs that does:
>>>
>>> /sbin/init: relocation error: /lib64/libc.so.6: symbol _rtld_global_ro, version GLIBC_PRIVATE not defined in file ld64.so.1 with link time reference
>>>
>>> if 'baselib' is set to /lib we get:
>>>
>>> /local/home/galak/git/poky/build-p5020/tmp/sysroots/x86_64-linux/usr/sbin/prelink: /sbin/init.sysvinit: Using /lib/ld64.so.1, not /lib64/ld64.so.1 as dynamic linker
>>>
>>> if 'baselib' is set to /lib64 we get:
>>>
>>> Assigned virtual address space slots for libraries:
>>> /lib64/ld64.so.1                                             00000080f4910000-00000080f49473d0
>>> /lib64/libc.so.6                                             00000080f4950000-00000080f4afe090
>>> /lib64/libdl.so.2                                            00000080f4b10000-00000080f4b23520
>>> /lib64/libcrypt.so.1                                         00000080f4b10000-00000080f4b57708
>>> /lib64/libutil.so.1                                          00000080f4b10000-00000080f4b234a0
>>> Would prelink /lib64/ld-2.13.so
>>> Would prelink /lib64/libc-2.13.so
>>>
>>> Not sure what prelink is doing but it seems to breaking things.  Any ideas?
>>>
>>> ---
>>>
>>> I'm also concerned that we use /etc/prelink.conf when invoking prelink.
>>
>> Prelinker is being run within the rootfs, so the /etc/prelink.conf being used is
>> the one inside of the image -- NOT the system version.
> 
> Is this because of psuedo or something else?

In the cross prelinker, we pass in the --root=<image>.  This instructs the
cross-prelinker to prefix <image> to most paths.

>> I would suspect that the cross-prelinker rtld emulation is likely setup for the
>> LSB style library paths and may be causing some of the problems.

You can run the cross-prelinker's rtld emulation by running the prelink-rtld
program located in build/tmp-eglibc/work/x86_64-linux/usr/sbin/prelink-rtld

Passing --root=<path> will setup the sysroot path for reference, adding in
--target-paths will allow you to pass further arguments as referenced on the
sysroot.

So prelink-rtld --root=/foo/bar/build/sysroot/image --target-paths /sbin/init

Should give you back an ldd like syntax within the sysroot, for /sbin/init.
(without --target-paths, you need to specify the full path to the /sbin/init..
this is useful when running the rtld against items outside of the image.)

>>
>> I'd suggest simply disabling prelink and getting everything to work first.. once
>> it does we can work through any prelinker issues.  (Prelink on PPC64 hasn't been
>> tested within the oe-core environment.. so it could very well have issues beyond
>> the ld.so path.)
> 
> Everything else is working, so prelink is what fails for me (at least for a simple minimal) build.
> 
> any suggestions on how to try and debug further, who might be more familiar with prelink and what its doing?  When I ran readelf -a on ld-2.13.so after prelink was getting weird results, not sure if thats normal or not.

I'm the prelink maintainer for Yocto, however I know more about the way the
cross-prelinker functionality works then how the ELF specific prelink functions
work.  I've been relying on the upstream prelink project to manage the
individual architecture/ABI prelink standards.

My suggestion is to disable cross-prelinking, and revert to the upstream prelink
project -- run the binary on the target and see if it fails in the same way.  If
it does, then we know it's a deeper problem then the cross prelink integration.

You can pull down the git repository:  git://git.yoctoproject.org/prelink-cross.git

The "master" branch is identical to the upstream SVN branch.  The
"cross_prelink" branch is the current state of integration.

--Mark

> - k
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



