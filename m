Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7E66375591
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 13:09:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6AD9n4B011658
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Jul 2018 06:09:49 -0700 (PDT)
Received: from [128.224.56.93] (128.224.56.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Tue, 10 Jul 2018 06:09:49 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1531151586-30557-1-git-send-email-bruce.ashfield@windriver.com>
	<8e3f9ec13333061ecb0125e153df668abe8da1b9.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <6e69d647-df89-056c-9c8e-584e81a5c76a@windriver.com>
Date: Tue, 10 Jul 2018 09:09:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <8e3f9ec13333061ecb0125e153df668abe8da1b9.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] kernel-devsrc: restructure for out of tree (and on target) module builds
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
X-List-Received-Date: Tue, 10 Jul 2018 13:09:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07/10/2018 06:21 AM, Richard Purdie wrote:
> On Mon, 2018-07-09 at 11:53 -0400, Bruce Ashfield wrote:
>> The existing kernel-devsrc package starts with a full copy of the
>> kernel
>> source and then starts to strip out elements that are not required.
>>
>> This results in extra time (I/O) and extra space being taken up in
>> the
>> final package. The main purpose of the kernel-devsrc package has been
>> to
>> build modules against the running kernel, not to include a full copy
>> of
>> the source code for re-building the kernel. The end result was a
>> 600M kernel-devsrc package.
>>
>> This restructuring of the package uses an approach similar to other
>> distros, where the kernel-devsrc package is for building against the
>> running kernel and uses a curated set of copied infrastructure,
>> versus
>> a mass copy of the entire kernel.
>>
>> The differences in this approach versus other is largely due to the
>> architecture support and the split build/source directory of the
>> kernel.
>>
>> The result is a kernel-devsrc package of about 10M, which is capable
>> of running "make scripts" and compiling kernel modules against the
>> running kernel.
>>
>> Along with the changes to the copying of the infrascture, we also
>> have the following changes:
>>
>>   - a better/more explicit listing of dependencies for on-target
>>     builds of "make scripts" or "make modules_prepare"
>>
>>   - The kernel source is installed into /lib/modules/<version>/build
>>     and a symlink created from /usr/src/kernel to the new location.
>>     This aligns with the standard location for module support
>>     code
>>
>>   - There is also a symlink from /lib/modules/<version>/source ->
>> build
>>     to reserve a spot for a new package that is simply the kernel
>>     source. That package is not part of this update.
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>
>> v2: drop DEPENDS on perf. We no longer need to depend on perf since
>> the source
>>      is copied before modification.
> 
> It probably won't surprise you to know there were some issues with this
> patch, sadly.
> 

heh. No problem. These are just things I didn't have the configs
to test.

Outside of the multilib issue, I can fix things up. For the multlib,
I have no idea .. since this:

   file /usr/bin/libtool from install of libtool-2.4.6-r0.0.i586 
conflicts with file from package lib64-libtool-2.4.6-r0.0.x86_64

is greek to me :D

I'll look at these one by one, and see if anyone with more bitbake
knowledge wants to help out with that last one.

Bruce


> The main recurring issue (on all arches and poky+poky-lsb) is failure
> of the kernelmodule.KernelModuleTest.test_kernel_module test. The exact
> failure varies by arch, for x86-64:
> 
> https://autobuilder.yocto.io/builders/nightly-x86-64/builds/1154/steps/Running%20Sanity%20Tests/logs/stdio
> 
> |   CHK     include/generated/utsrelease.h
> |   DESCEND  objtool
> | /lib/modules/4.14.48-yocto-standard/build/tools/build/Makefile.build:37: /lib/modules/4.14.48-yocto-standard/build/tools/build/Build.include: No such file or directory
> | make[4]: *** No rule to make target '/lib/modules/4.14.48-yocto-standard/build/tools/build/Build.include'.  Stop.
> | make[3]: *** [Makefile:43: /lib/modules/4.14.48-yocto-standard/build/tools/objtool/fixdep-in.o] Error 2
> | make[2]: *** [/lib/modules/4.14.48-yocto-standard/build/tools/build/Makefile.include:4: fixdep] Error 2
> | make[1]: *** [Makefile:62: objtool] Error 2
> | make: *** [Makefile:1647: tools/objtool] Error 2
> 
> For mips:
> 
> https://autobuilder.yocto.io/builders/nightly-mips/builds/1115
> 
> |   HOSTCC  scripts/sortextable
> | make[1]: *** No rule to make target 'arch/mips/boot/tools/relocs_32.c', needed by 'arch/mips/boot/tools/relocs_32.o'.  Stop.
> | make: *** [arch/mips/Makefile:16: archscripts] Error 2
> 
> (same for mips64)
> 
> For arm:
> 
> https://autobuilder.yocto.io/builders/nightly-arm/builds/1187/
> 
> |   HOSTCC  scripts/sortextable
> | make[1]: *** No rule to make target 'arch/arm/tools/syscall.tbl', needed by 'arch/arm/include/generated/uapi/asm/unistd-common.h'.  Stop.
> | make: *** [arch/arm/Makefile:319: archheaders] Error 2
> 
> For arm64:
> 
> https://autobuilder.yocto.io/builders/nightly-arm64/builds/1101/steps/Running%20Sanity%20Tests/logs/stdio
> 
> |   CHK     include/generated/uapi/linux/version.h
> |   CHK     include/generated/utsrelease.h
> | make[1]: *** No rule to make target 'arch/arm64/kernel/vdso/vdso.lds', needed by 'arch/arm64/kernel/vdso/vdso.so.dbg'.  Stop.
> | make: *** [arch/arm64/Makefile:160: vdso_prepare] Error 2
>   
> 
> There was also a failure in building the build-appliance image:
> 
> https://autobuilder.yocto.io/builders/build-appliance/builds/1110
> 
> and also a failure in one of the multilib builds, probably from
> different dependencies pulled in by kernel-devsrc:
> 
> https://autobuilder.yocto.io/builders/nightly-multilib/builds/1139/steps/BuildImages_4/logs/stdio
> 
> Error: Transaction check error:
>    file /usr/bin/libtool from install of libtool-2.4.6-r0.0.i586 conflicts with file from package lib64-libtool-2.4.6-r0.0.x86_64
>    file /usr/bin/libtoolize from install of libtool-2.4.6-r0.0.i586 conflicts with file from package lib64-libtool-2.4.6-r0.0.x86_64
> 
> I'll retest with this patch removed just so we can unblock the other patches.
> 
> Cheers,
> 
> Richard
> 


