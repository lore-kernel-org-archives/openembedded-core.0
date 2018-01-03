Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 358277806D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jan 2018 13:55:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w03DtoXY008144
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 3 Jan 2018 05:55:50 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 3 Jan 2018 05:55:49 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1513133105.git.liezhi.yang@windriver.com>
	<e911950fbee39af9c5889c41872f2f77f94cc9c1.1513133105.git.liezhi.yang@windriver.com>
	<1514983400.5525.137.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <8555d421-668e-a2ba-d405-4ef01ee2f3f4@windriver.com>
Date: Wed, 3 Jan 2018 21:56:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1514983400.5525.137.camel@linuxfoundation.org>
Subject: Re: [PATCH 2/2] image-live.bbclass: remove MLPREFIX from syslinux
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
X-List-Received-Date: Wed, 03 Jan 2018 13:55:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 01/03/2018 08:43 PM, Richard Purdie wrote:
> On Wed, 2017-12-13 at 10:45 +0800, Robert Yang wrote:
>> Fixed:
>> MACHINE = "qemux86-64"
>> require conf/multilib.conf
>> MULTILIBS = "multilib:lib32"
>> DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
>> IMAGE_FSTYPES += "iso"
>>
>> $ bitbake lib32-core-image-minimal
>> ERROR: lib32-core-image-minimal-1.0-r0 do_bootimg: The file
>> /usr/include/printf.h is installed by both glibc and lib32-glibc,
>> aborting
>>
>> This was because:
>> lib32-syslinux -> lib32-glibc
>> virtual/kernel -> glibc
>>
>> We can build 64bit syslinux (only build, not install) to fix the
>> problem, the
>> do_bootimg only needs several data files of syslinux such as
>> vesamenu.c32,
>> these files are not arch related.
> 
> Hi Robert,

Hi RP,

Thanks for the reply.

> 
> I've been thinking about this one and I'm not 100% convinced this is
> the right thing to do.
> 
> When we build "lib32-core-image-minimal", one of the things we want to
> avoid is building two different toolchains, there should only be one
> needed for this image.
> 
> If there is a dependency on "syslinux", that will need the non-multilib
> toolchain. I suspect that is why libX-syslinux was used as a
> dependency.
> 
> Also, there are some things which never make sense as a multilib, the
> kernel is one example and I'm starting to wonder if syslinux would be
> another. In the kernel (and kernel module) case we'd provide all the
> libX variants from the same recipe, we may want to do that for
> syslinux.

I think that syslinux is different from kernel, 64bit kernel can provide
32bit kernel via kernel config, but syslinux can't (except these non
arch files).

> 
> It may be we can't avoid the multiple compiler issue and the current
> codebase may not do so, I think currently we can avoid multiple glibc
> though.

I'm not sure about a problem on this, should lib32-image can run 64bit
programs or not ? If yes, then kernel should be 64bit, and we can't avoid
building 64bit compilers. And I'm leaning to yes since we call it multilib,
the pure 32bit image which can't run 64bit programs can't be called multilib.

I did a rough search on why glibc is built, when bitbake lib32-image, it
is because:

64 bit kernel -> gcc-cross-x86_64 -> virtual/${TARGET_PREFIX}libc-for-gcc,
and the TARGET_PREFIX is x86_64 when building gcc-cross-x86_64,
While the virtual/x86_64-poky-linux-libc-for-gcc is provided by glibc.

I tried to remove the depends, both "bitbake gcc-cross-x86_64" and
"bitbake linux-yocto" can be built, but other recipes such as quilt would
be failed:

| 
/workspace1/lyang1/test_1/tmp/work/core2-64-poky-linux/libgcc/7.2.0-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/7.2.0/ld: 
cannot find crti.o: No such file or directory
| 
/workspace1/lyang1/test_1/tmp/work/core2-64-poky-linux/libgcc/7.2.0-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/7.2.0/ld: 
cannot find -lc
| 
/workspace1/lyang1/test_1/tmp/work/core2-64-poky-linux/libgcc/7.2.0-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux/../../libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/7.2.0/ld: 
cannot find crtn.o: No such file or directory
| collect2: error: ld returned 1 exit status
| Makefile:978: recipe for target 'libgcc_s.so' failed

And move virtual/${TARGET_PREFIX}libc-for-gcc to BASE_DEFAULT_DEPS can't make
it work either, so it seems that we can't avoid building glibc.

> 
> Regardless, I do think this needs a little more thought, we also need
> better multiple test cases as we're not catching issues like this. 
> think this needs to be revisited along with your outstanding multilib
> patch series which I haven't found the time to review yet (sorry).

That's all right, I'm very glad to make mutilib work well, including
adding test cases for them. It is nearly broken after changed from
smart + rpm5 to dnf + rpm4, those patches fixed the problem.

// Robert

> 
> Cheers,
> 
> Richard
> 

