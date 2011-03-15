Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1PzXkI-0002sU-AR
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Mar 2011 18:09:24 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 15 Mar 2011 10:07:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,188,1299484800"; d="scan'208";a="720424535"
Received: from unknown (HELO [10.255.12.146]) ([10.255.12.146])
	by orsmga001.jf.intel.com with ESMTP; 15 Mar 2011 10:07:22 -0700
Message-ID: <4D7F9CC2.2030002@linux.intel.com>
Date: Tue, 15 Mar 2011 10:07:14 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Koen Kooi <koen@beagleboard.org>
References: <161e1f47c2460d5b2463300e31bf5eebb46b8698.1300172958.git.dvhart@linux.intel.com>
	<ACE0CCC0-8D25-4FC2-93B2-73C60636721A@beagleboard.org>
In-Reply-To: <ACE0CCC0-8D25-4FC2-93B2-73C60636721A@beagleboard.org>
Cc: openembedded-core oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [RFC] kernel: rework kernel and module classes to allow for building out-of-tree modules
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
X-List-Received-Date: Tue, 15 Mar 2011 17:09:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



On 03/15/2011 01:31 AM, Koen Kooi wrote:
>
> Op 15 mrt 2011, om 08:25 heeft Darren Hart het volgende geschreven:
>
>> NOT FOR INCLUSION
>>
>> Before we include something like this, it needs review from folks
>> like Koen and Gary to confirm it works in their environment as
>> well.
>>
>> The existing infrastructure uses an external build tree which
>> references the kernel source in the work dir. If run with rm work,
>> building external modules will fail.
>>
>> This patch places a configured source tree in sysroots. Striking a
>> balance between minimal size and minimal maintenance is difficult.
>> This version leans on the side of caution and removes only the
>> obviously unecessary parts of the source tree to conserve space.
>>
>> Care is also taken to clean the hostprogs in scripts, and the
>> modules are responsible for building them as needed.
>
> I get this:
>
> | cp: cannot open
> `./.pc/0001-PSP-3.0.1.6-kernel-source-patched-with-OCF-Linux.patch/crypto/ocf/ixp4xx/ixp4xx.c'
> for reading: Permission denied
>
> After adding 'do_make_scripts' in my module do_compile and applying
> your patch. So it seems to be tripping on the quilt directory :(

What are the ownership and perms on those?

I suppose we could avoid the .pc directory - but it's going to require 
something more than cp or some additional scripting. Something like 
tar's exclude functionality might be needed - but I hate to add the 
intermediate step as the kernel recipes are already so slow.

--
Darren

>
> regards,
>
> Koen
>
>
>>
>> Signed-off-by: Darren Hart<dvhart@linux.intel.com> CC: Koen
>> Kooi<koen@beagleboard.org> CC: Gary Thomas<gary@mlbassoc.com> ---
>> meta/classes/kernel.bbclass               |   96
>> ++++++++++------------------ meta/classes/module.bbclass
>> |    9 ++- meta/recipes-kernel/linux/linux-yocto.inc |    4 + 3
>> files changed, 45 insertions(+), 64 deletions(-)
>>
>> diff --git a/meta/classes/kernel.bbclass
>> b/meta/classes/kernel.bbclass index 90a7d64..c714931 100644 ---
>> a/meta/classes/kernel.bbclass +++ b/meta/classes/kernel.bbclass @@
>> -110,78 +110,50 @@ kernel_do_install() { install -d
>> ${D}/etc/modprobe.d fi
>>
>> - +	# +	# Support for external module building - create a minimal
>> copy of the +	# kernel source tree. +	# +
>> kerneldir=${STAGING_KERNEL_DIR} +	install -d $kerneldir
>>
>> # -	# Support for external module building - create a minimal copy
>> of the kernel source tree +	# Copy the entire source tree. In case
>> an external build directory is +	# used, copy the build directory
>> over first, then copy over the source +	# dir. This ensures the
>> original Makefiles are used and not the +	# redirecting Makefiles
>> in the build directory. # -	kerneldir=${D}/kernel/ - -	# Take care
>> of arch specific headers -	# Kernel 2.6.27 moved headers from
>> includes/asm-${ARCH} to arch/${ARCH}/include/asm -	if [ -e
>> arch/${ARCH}/include/asm/ ] ; then -		install -d
>> $kerneldir/arch/${ARCH}/ -		cp -fR arch/${ARCH}/*
>> $kerneldir/arch/${ARCH}/ - -	# Check for arch/x86 on i386 -	elif [
>> -d arch/x86/include/asm/ ]; then -		if [ -e include/asm ] ; then -
>> install -d $kerneldir/include/asm/ -			cp -fR
>> arch/x86/include/asm/* $kerneldir/include/asm/ -		fi -		install -d
>> $kerneldir/arch/x86/include -		cp -fR arch/x86/*
>> $kerneldir/arch/x86/ +	# work and sysroots can be +	# on different
>> partitions, so we can't rely on hardlinking, +	# unfortunately. +
>> # +	cp -fR ./ $kerneldir +	if [ ! "${S}" == "${B}" ]; then +		cp
>> -fR ${S}/* $kerneldir fi
>>
>> -	# Take care of the rest of the main directories we need -	for
>> entry in drivers/crypto drivers/media include scripts; do -		if [
>> -d $entry ]; then -			mkdir -p $kerneldir/$entry -			cp -fR
>> $entry/* $kerneldir/$entry/ -		fi -	done - -	install -m 0644
>> .config $kerneldir/config-${KERNEL_VERSION} -	ln -sf
>> config-${KERNEL_VERSION} $kerneldir/.config -	ln -sf
>> config-${KERNEL_VERSION} $kerneldir/kernel-config -	echo
>> "${KERNEL_VERSION}">$kerneldir/kernel-abiversion -	echo
>> "${S}">$kerneldir/kernel-source -	echo
>> "${KERNEL_CCSUFFIX}">$kerneldir/kernel-ccsuffix -	echo
>> "${KERNEL_LDSUFFIX}">$kerneldir/kernel-ldsuffix -	[ -e vmlinux ]&&
>> install -m 0644 vmlinux $kerneldir/ -	install -m 0644
>> ${KERNEL_OUTPUT} $kerneldir/${KERNEL_IMAGETYPE} -	install -m 0644
>> System.map $kerneldir/System.map-${KERNEL_VERSION} -	[ -e
>> Module.symvers ]&&  install -m 0644 Module.symvers $kerneldir/ - -
>> # Copy over the main Makefiles -	[ -e Rules.make ]&&  install -m
>> 0644 Rules.make $kerneldir/ -	[ -e Makefile ]&&  install -m 0644
>> Makefile $kerneldir/ -	# Check if arch/${ARCH}/Makefile exists and
>> install it -	if [ -e arch/${ARCH}/Makefile ]; then -		install -d
>> $kerneldir/arch/${ARCH} -		install -m 0644 arch/${ARCH}/Makefile*
>> $kerneldir/arch/${ARCH} -	# Otherwise check arch/x86/Makefile for
>> i386 and x86_64 on kernels>= 2.6.24 -	elif [ -e arch/x86/Makefile
>> ]; then -		install -d $kerneldir/arch/x86 -		install -m 0644
>> arch/x86/Makefile* $kerneldir/arch/x86 -	fi +	# +	# Clean and
>> remove files not needed for building modules. +	# Some
>> distributions go through a lot more trouble to strip out +	#
>> unecessary headers, for now, we just prune the obvious bits. +	# +
>> # We don't want to leave host-arch binaries in /sysroots, so +	# we
>> clean the scripts dir while leaving the generated config +	# and
>> include files. +	# +	oe_runmake -C $kerneldir CC="${KERNEL_CC}"
>> LD="${KERNEL_LD}" clean +	make _mrproper_scripts +	find $kerneldir
>> -path $kerneldir/scripts -prune -o -name "*.[csS]" -exec rm '{}'
>> \; +	find $kerneldir/Documentation -name "*.txt" -exec rm '{}' \;
>>
>> # Remove the following binaries which cause strip errors # during
>> do_package for cross-compiled platforms
>> bin_files="arch/powerpc/boot/addnote arch/powerpc/boot/hack-coff \
>> -		arch/powerpc/boot/mktree scripts/bin2c scripts/conmakehash \ -
>> scripts/ihex2fw scripts/kallsyms scripts/pnmtologo
>> scripts/basic/docproc \ -		scripts/basic/fixdep scripts/basic/hash
>> scripts/dtc/dtc \ -		scripts/genksyms/genksyms scripts/kconfig/conf
>> scripts/mod/mk_elfconfig \ -		scripts/mod/modpost
>> scripts/recordmcount" -	rm -rf $kerneldir/scripts/*.o -	rm -rf
>> $kerneldir/scripts/basic/*.o -	rm -rf
>> $kerneldir/scripts/kconfig/*.o -	rm -rf $kerneldir/scripts/mod/*.o
>> -	rm -rf $kerneldir/scripts/dtc/*.o +
>> arch/powerpc/boot/mktree" for entry in $bin_files; do -		rm -f
>> $kerneldir/$entry -	done +	        rm -f $kerneldir/$entry +	done
>> + }
>>
>> sysroot_stage_all_append() { diff --git
>> a/meta/classes/module.bbclass b/meta/classes/module.bbclass index
>> bbceaf7..572df0d 100644 --- a/meta/classes/module.bbclass +++
>> b/meta/classes/module.bbclass @@ -3,14 +3,19 @@ DEPENDS +=
>> "virtual/kernel"
>>
>> inherit module-base
>>
>> -# Ensure the hostprogs are available for module compilation
>> -module_do_compile_prepend() { +# +# Ensure the hostprogs are
>> available for module compilation. Modules that +# inherit this
>> recipe and override do_compile() should be sure to call +#
>> do_make_scripts() or ensure the scripts are built independently.
>> +# +do_make_scripts() { unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>> oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
>> -C ${STAGING_KERNEL_DIR} scripts }
>>
>> module_do_compile() { +	do_make_scripts unset CFLAGS CPPFLAGS
>> CXXFLAGS LDFLAGS oe_runmake KERNEL_PATH=${STAGING_KERNEL_DIR}   \
>> KERNEL_SRC=${STAGING_KERNEL_DIR}    \ diff --git
>> a/meta/recipes-kernel/linux/linux-yocto.inc
>> b/meta/recipes-kernel/linux/linux-yocto.inc index 0812144..582e386
>> 100644 --- a/meta/recipes-kernel/linux/linux-yocto.inc +++
>> b/meta/recipes-kernel/linux/linux-yocto.inc @@ -21,3 +21,7 @@
>> inherit kernel-yocto require linux-dtb.inc
>>
>> B = "${WORKDIR}/linux-${MACHINE}-${LINUX_KERNEL_TYPE}-build" +
>> +do_install_append(){ +	rm -rf ${STAGING_KERNEL_DIR}/$KMETA +} --
>> 1.7.1
>>
>

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


