Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 07D6765D00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2018 10:21:17 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w6AALGET027137
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 10 Jul 2018 11:21:18 +0100
Message-ID: <8e3f9ec13333061ecb0125e153df668abe8da1b9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Tue, 10 Jul 2018 11:21:16 +0100
In-Reply-To: <1531151586-30557-1-git-send-email-bruce.ashfield@windriver.com>
References: <1531151586-30557-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
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
X-List-Received-Date: Tue, 10 Jul 2018 10:21:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-07-09 at 11:53 -0400, Bruce Ashfield wrote:
> The existing kernel-devsrc package starts with a full copy of the
> kernel
> source and then starts to strip out elements that are not required.
> 
> This results in extra time (I/O) and extra space being taken up in
> the
> final package. The main purpose of the kernel-devsrc package has been
> to
> build modules against the running kernel, not to include a full copy
> of
> the source code for re-building the kernel. The end result was a
> 600M kernel-devsrc package.
> 
> This restructuring of the package uses an approach similar to other
> distros, where the kernel-devsrc package is for building against the
> running kernel and uses a curated set of copied infrastructure,
> versus
> a mass copy of the entire kernel.
> 
> The differences in this approach versus other is largely due to the
> architecture support and the split build/source directory of the
> kernel.
> 
> The result is a kernel-devsrc package of about 10M, which is capable
> of running "make scripts" and compiling kernel modules against the
> running kernel.
> 
> Along with the changes to the copying of the infrascture, we also
> have the following changes:
> 
>  - a better/more explicit listing of dependencies for on-target
>    builds of "make scripts" or "make modules_prepare"
> 
>  - The kernel source is installed into /lib/modules/<version>/build
>    and a symlink created from /usr/src/kernel to the new location.
>    This aligns with the standard location for module support
>    code
> 
>  - There is also a symlink from /lib/modules/<version>/source ->
> build
>    to reserve a spot for a new package that is simply the kernel
>    source. That package is not part of this update.
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
> 
> v2: drop DEPENDS on perf. We no longer need to depend on perf since
> the source
>     is copied before modification.

It probably won't surprise you to know there were some issues with this
patch, sadly.

The main recurring issue (on all arches and poky+poky-lsb) is failure
of the kernelmodule.KernelModuleTest.test_kernel_module test. The exact
failure varies by arch, for x86-64:

https://autobuilder.yocto.io/builders/nightly-x86-64/builds/1154/steps/Running%20Sanity%20Tests/logs/stdio

|   CHK     include/generated/utsrelease.h
|   DESCEND  objtool
| /lib/modules/4.14.48-yocto-standard/build/tools/build/Makefile.build:37: /lib/modules/4.14.48-yocto-standard/build/tools/build/Build.include: No such file or directory
| make[4]: *** No rule to make target '/lib/modules/4.14.48-yocto-standard/build/tools/build/Build.include'.  Stop.
| make[3]: *** [Makefile:43: /lib/modules/4.14.48-yocto-standard/build/tools/objtool/fixdep-in.o] Error 2
| make[2]: *** [/lib/modules/4.14.48-yocto-standard/build/tools/build/Makefile.include:4: fixdep] Error 2
| make[1]: *** [Makefile:62: objtool] Error 2
| make: *** [Makefile:1647: tools/objtool] Error 2

For mips:

https://autobuilder.yocto.io/builders/nightly-mips/builds/1115

|   HOSTCC  scripts/sortextable
| make[1]: *** No rule to make target 'arch/mips/boot/tools/relocs_32.c', needed by 'arch/mips/boot/tools/relocs_32.o'.  Stop.
| make: *** [arch/mips/Makefile:16: archscripts] Error 2

(same for mips64)

For arm:

https://autobuilder.yocto.io/builders/nightly-arm/builds/1187/

|   HOSTCC  scripts/sortextable
| make[1]: *** No rule to make target 'arch/arm/tools/syscall.tbl', needed by 'arch/arm/include/generated/uapi/asm/unistd-common.h'.  Stop.
| make: *** [arch/arm/Makefile:319: archheaders] Error 2

For arm64:

https://autobuilder.yocto.io/builders/nightly-arm64/builds/1101/steps/Running%20Sanity%20Tests/logs/stdio

|   CHK     include/generated/uapi/linux/version.h
|   CHK     include/generated/utsrelease.h
| make[1]: *** No rule to make target 'arch/arm64/kernel/vdso/vdso.lds', needed by 'arch/arm64/kernel/vdso/vdso.so.dbg'.  Stop.
| make: *** [arch/arm64/Makefile:160: vdso_prepare] Error 2
 

There was also a failure in building the build-appliance image:

https://autobuilder.yocto.io/builders/build-appliance/builds/1110

and also a failure in one of the multilib builds, probably from
different dependencies pulled in by kernel-devsrc:

https://autobuilder.yocto.io/builders/nightly-multilib/builds/1139/steps/BuildImages_4/logs/stdio

Error: Transaction check error:
  file /usr/bin/libtool from install of libtool-2.4.6-r0.0.i586 conflicts with file from package lib64-libtool-2.4.6-r0.0.x86_64
  file /usr/bin/libtoolize from install of libtool-2.4.6-r0.0.i586 conflicts with file from package lib64-libtool-2.4.6-r0.0.x86_64

I'll retest with this patch removed just so we can unblock the other patches.

Cheers,

Richard


