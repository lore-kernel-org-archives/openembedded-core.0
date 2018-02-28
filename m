Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 827B971A84
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 21:12:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w1SLCJmD016736
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 28 Feb 2018 13:12:20 -0800
Received: from server.local (128.224.23.186) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 28 Feb 2018 13:11:40 -0800
To: Mark Hatle <mark.hatle@windriver.com>, <richard.purdie@linuxfoundation.org>
References: <1519845645-21713-1-git-send-email-bruce.ashfield@windriver.com>
	<d466c889-34db-0275-bf40-511f953230ee@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <bff2627e-3655-a6cc-753c-29999fbbe941@windriver.com>
Date: Wed, 28 Feb 2018 16:12:06 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <d466c889-34db-0275-bf40-511f953230ee@windriver.com>
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
X-List-Received-Date: Wed, 28 Feb 2018 21:12:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2018-02-28 4:10 PM, Mark Hatle wrote:
> One question, below inline:
> 
> On 2/28/18 1:20 PM, Bruce Ashfield wrote:
>> The existing kernel-devsrc package starts with a full copy of the kernel
>> source and then starts to strip out elements that are not required.
>>
>> This results in extra time (I/O) and extra space being taken up in the
>> final package. The main purpose of the kernel-devsrc package has been to
>> build modules against the running kernel, not to include a full copy of
>> the source code for re-building the kernel. The end result was a
>> 600M kernel-devsrc package.
>>
>> This restructuring of the package uses an approach similar to other
>> distros, where the kernel-devsrc package is for building against the
>> running kernel and uses a curated set of copied infrastructure, versus
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
>>   - There is also a symlink from /lib/modules/<version>/source -> build
>>     to reserve a spot for a new package that is simply the kernel
>>     source. That package is not part of this update.
>>
>> [YOCTO #12535]
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>>
>>   v2: fix arch/arm devsrc builds
>>
>>   The arch conditional code for ARM was using invalid variables for the
>>   current version of the recipe. Those are now fixed, and we can package
>>   for ARM.
>>
>>   meta/recipes-kernel/linux/kernel-devsrc.bb | 178 ++++++++++++++++++++++-------
>>   1 file changed, 138 insertions(+), 40 deletions(-)
>>
>> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
>> index c1b5b7786d7c..738290ac2dc3 100644
>> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
>> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
>> @@ -30,50 +30,148 @@ do_populate_sysroot[noexec] = "1"
>>   S = "${STAGING_KERNEL_DIR}"
>>   B = "${STAGING_KERNEL_BUILDDIR}"
>>   
>> -KERNEL_VERSION = "${@get_kernelversion_headers('${S}')}"
>> -
> 
> I see this is removed, but later items reference KERNEL_VERSION.  Is that
> defined elsewhere?

Yup. It comes from the base classes. That variable in the current
form, is actually empty.

Bruce

> 
> --Mark
> 
>>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>>   
>> +KERNEL_BUILD_ROOT="/lib/modules/"
>> +
>>   do_install() {
>> -        kerneldir=${D}${KERNEL_SRC_PATH}
>> -        install -d $kerneldir
>> -
>> -        #
>> -        # Copy the staging dir source (and module build support) into the devsrc structure.
>> -        # We can keep this copy simple and take everything, since a we'll clean up any build
>> -        # artifacts afterwards, and the extra i/o is not significant
>> -        #
>> -        cd ${B}
>> -        find . -type d -name '.git*' -prune -o -path '.debug' -prune -o -type f -print0 | cpio --null -pdlu $kerneldir
>> -        cd ${S}
>> -	find . -type d -name '.git*' -prune -o -type d -name '.kernel-meta' -prune -o -type f -print0 | cpio --null -pdlu $kerneldir
>> -
>> -        # Explicitly set KBUILD_OUTPUT to ensure that the image directory is cleaned and not
>> -        # The main build artifacts. We clean the directory to avoid QA errors on mismatched
>> -        # architecture (since scripts and helpers are native format).
>> -        KBUILD_OUTPUT="$kerneldir"
>> -        oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean _mrproper_scripts
>> -        # make clean generates an absolute path symlink called "source"
>> -        # in $kerneldir points to $kerneldir, which doesn't make any
>> -        # sense, so remove it.
>> -        if [ -L $kerneldir/source ]; then
>> -            bbnote "Removing $kerneldir/source symlink"
>> -            rm -f $kerneldir/source
>> -        fi
>> -
>> -        # As of Linux kernel version 3.0.1, the clean target removes
>> -        # arch/powerpc/lib/crtsavres.o which is present in
>> -        # KBUILD_LDFLAGS_MODULE, making it required to build external modules.
>> -        if [ ${ARCH} = "powerpc" ]; then
>> -                mkdir -p $kerneldir/arch/powerpc/lib/
>> -                cp ${B}/arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
>> -        fi
>> -
>> -        chown -R root:root ${D}
>> +    kerneldir=${D}${KERNEL_BUILD_ROOT}${KERNEL_VERSION}
>> +    install -d $kerneldir
>> +
>> +    # create the directory structure
>> +    rm -f $kerneldir/build
>> +    rm -f $kerneldir/source
>> +    mkdir -p $kerneldir/build
>> +
>> +    # for compatibility with some older variants of this package, we
>> +    # create  a /usr/src/kernel symlink to /lib/modules/<version>/source
>> +    mkdir -p ${D}/usr/src
>> +    (
>> +	cd ${D}/usr/src
>> +	ln -s ${KERNEL_BUILD_ROOT}${KERNEL_VERSION}/source kernel
>> +    )
>> +
>> +    # for on target purposes, we unify build and source
>> +    (
>> +	cd $kerneldir
>> +	ln -s build source
>> +    )
>> +
>> +    # first copy everything
>> +    (
>> +	cd ${S}
>> +	cp --parents $(find  -type f -name "Makefile*" -o -name "Kconfig*") $kerneldir/build
>> +    )
>> +
>> +    # then drop all but the needed Makefiles/Kconfig files
>> +    rm -rf $kerneldir/build/Documentation
>> +    rm -rf $kerneldir/build/scripts
>> +    rm -rf $kerneldir/build/include
>> +
>> +    # now copy in parts from the build that we'll need later
>> +    (
>> +	cd ${B}
>> +
>> +	cp Module.symvers $kerneldir/build
>> +	cp System.map* $kerneldir/build
>> +	if [ -s Module.markers ]; then
>> +	    cp Module.markers $kerneldir/build
>> +	fi
>> +
>> +	cp .config $kerneldir/build
>> +
>> +	# TODO: this scripts copy will likely blow up QA, so for now, we
>> +	#       require a more complex 'make scripts' to restore these, versus
>> +	#       copying them here. Left as a reference to indicate that we
>> +	#       know the scripts must be dealt with.
>> +	# cp -a scripts $kerneldir/build
>> +
>> +	if [ -f tools/objtool/objtool ]; then
>> +	    cp -a tools/objtool/objtool $kerneldir/build/tools/objtool/
>> +	fi
>> +	if [ -d arch/${ARCH}/scripts ]; then
>> +	    cp -a arch/${ARCH}/scripts $kerneldir/build/arch/${ARCH}
>> +	fi
>> +	if [ -f arch/${ARCH}/*lds ]; then
>> +	    cp -a arch/${ARCH}/*lds $kerneldir/build/arch/${ARCH}
>> +	fi
>> +
>> +	rm -f $kerneldir/build/scripts/*.o
>> +	rm -f $kerneldir/build/scripts/*/*.o
>> +
>> +	if [ "${ARCH}" = "powerpc" ]; then
>> +	    cp -a --parents arch/powerpc/lib/crtsavres.[So] $kerneldir/build/
>> +	fi
>> +
>> +	cp -a include $kerneldir/build/include
>> +    )
>> +
>> +    # now grab the chunks from the source tree that we need
>> +    (
>> +	cd ${S}
>> +
>> +	cp -a scripts $kerneldir/build
>> +	if [ "${ARCH}" = "arm64" ]; then
>> +	    # arch/arm64/include/asm/xen references arch/arm
>> +	    cp -a --parents arch/arm/include/asm/xen $kerneldir/build/
>> +	    # arch/arm64/include/asm/opcodes.h references arch/arm
>> +	    cp -a --parents arch/arm/include/asm/opcodes.h $kerneldir/build/
>> +	fi
>> +
>> +	# include the machine specific headers for ARM variants, if available.
>> +	if [ "${ARCH}" = "arm" ]; then
>> +	    cp -a --parents arch/${ARCH}/mach-*/include $kerneldir/build/
>> +
>> +	    # include a few files for 'make prepare'
>> +	    cp -a --parents arch/arm/tools/gen-mach-types $kerneldir/build/
>> +	    cp -a --parents arch/arm/tools/mach-types $kerneldir/build/
>> +	fi
>> +
>> +	if [ -d arch/${ARCH}/include ]; then
>> +	    cp -a --parents arch/${ARCH}/include $kerneldir/build/
>> +	fi
>> +
>> +	cp -a include $kerneldir/build
>> +
>> +	if [ "${ARCH}" = "x86" ]; then
>> +	    # files for 'make prepare' to succeed with kernel-devel
>> +	    cp -a --parents arch/x86/entry/syscalls/syscall_32.tbl $kerneldir/build/
>> +	    cp -a --parents arch/x86/entry/syscalls/syscalltbl.sh $kerneldir/build/
>> +	    cp -a --parents arch/x86/entry/syscalls/syscallhdr.sh $kerneldir/build/
>> +	    cp -a --parents arch/x86/entry/syscalls/syscall_64.tbl $kerneldir/build/
>> +	    cp -a --parents arch/x86/tools/relocs_32.c $kerneldir/build/
>> +	    cp -a --parents arch/x86/tools/relocs_64.c $kerneldir/build/
>> +	    cp -a --parents arch/x86/tools/relocs.c $kerneldir/build/
>> +	    cp -a --parents arch/x86/tools/relocs_common.c $kerneldir/build/
>> +	    cp -a --parents arch/x86/tools/relocs.h $kerneldir/build/
>> +	    cp -a --parents tools/include/tools/le_byteshift.h $kerneldir/build/
>> +	    cp -a --parents tools/include/tools/be_byteshift.h $kerneldir/build/
>> +	    cp -a --parents arch/x86/purgatory/purgatory.c $kerneldir/build/
>> +	    cp -a --parents arch/x86/purgatory/sha256.h $kerneldir/build/
>> +	    cp -a --parents arch/x86/purgatory/sha256.c $kerneldir/build/
>> +	    cp -a --parents arch/x86/purgatory/stack.S $kerneldir/build/
>> +	    cp -a --parents arch/x86/purgatory/string.c $kerneldir/build/
>> +	    cp -a --parents arch/x86/purgatory/setup-x86_64.S $kerneldir/build/
>> +	    cp -a --parents arch/x86/purgatory/entry64.S $kerneldir/build/
>> +	    cp -a --parents arch/x86/boot/string.h $kerneldir/build/
>> +	    cp -a --parents arch/x86/boot/string.c $kerneldir/build/
>> +	    cp -a --parents arch/x86/boot/ctype.h $kerneldir/build/
>> +	fi
>> +    )
>> +
>> +    # Make sure the Makefile and version.h have a matching timestamp so that
>> +    # external modules can be built
>> +    touch -r $kerneldir/build/Makefile $kerneldir/build/include/generated/uapi/linux/version.h
>> +
>> +    # Copy .config to include/config/auto.conf so "make prepare" is unnecessary.
>> +    cp $kerneldir/build/.config $kerneldir/build/include/config/auto.conf
>> +
>> +    chown -R root:root ${D}
>>   }
>> +
>>   # Ensure we don't race against "make scripts" during cpio
>>   do_install[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
>>   
>> -PACKAGES = "kernel-devsrc"
>> -FILES_${PN} = "${KERNEL_SRC_PATH}"
>> -RDEPENDS_${PN} = "bc"
>> +FILES_${PN} = "${KERNEL_BUILD_ROOT} ${KERNEL_SRC_PATH}"
>> +FILES_${PN}-dbg += "${KERNEL_BUILD_ROOT}*/build/scripts/*/.debug/*"
>> +RDEPENDS_${PN} = "bc glibc-utils"
>>
> 


