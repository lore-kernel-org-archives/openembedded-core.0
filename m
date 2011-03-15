Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@beagleboard.org>) id 1PzPgR-0008H6-1g
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Mar 2011 09:32:51 +0100
Received: by wyb40 with SMTP id 40so279340wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2011 01:31:09 -0700 (PDT)
Received: by 10.227.11.68 with SMTP id s4mr228058wbs.183.1300177868925;
	Tue, 15 Mar 2011 01:31:08 -0700 (PDT)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id d54sm4312348wej.34.2011.03.15.01.31.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Mar 2011 01:31:07 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@beagleboard.org>
In-Reply-To: <161e1f47c2460d5b2463300e31bf5eebb46b8698.1300172958.git.dvhart@linux.intel.com>
Date: Tue, 15 Mar 2011 09:31:05 +0100
Message-Id: <ACE0CCC0-8D25-4FC2-93B2-73C60636721A@beagleboard.org>
References: <161e1f47c2460d5b2463300e31bf5eebb46b8698.1300172958.git.dvhart@linux.intel.com>
To: Darren Hart <dvhart@linux.intel.com>
X-Mailer: Apple Mail (2.1082)
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
X-List-Received-Date: Tue, 15 Mar 2011 08:32:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 mrt 2011, om 08:25 heeft Darren Hart het volgende geschreven:

> NOT FOR INCLUSION
>=20
> Before we include something like this, it needs review from folks like =
Koen and
> Gary to confirm it works in their environment as well.
>=20
> The existing infrastructure uses an external build tree which =
references the
> kernel source in the work dir. If run with rm work, building external =
modules
> will fail.
>=20
> This patch places a configured source tree in sysroots. Striking a =
balance
> between minimal size and minimal maintenance is difficult. This =
version leans
> on the side of caution and removes only the obviously unecessary parts =
of the
> source tree to conserve space.
>=20
> Care is also taken to clean the hostprogs in scripts, and the modules =
are
> responsible for building them as needed.

I get this:

| cp: cannot open =
`./.pc/0001-PSP-3.0.1.6-kernel-source-patched-with-OCF-Linux.patch/crypto/=
ocf/ixp4xx/ixp4xx.c' for reading: Permission denied

After adding 'do_make_scripts' in my module do_compile and applying your =
patch. So it seems to be tripping on the quilt directory :(

regards,

Koen


>=20
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> CC: Koen Kooi <koen@beagleboard.org>
> CC: Gary Thomas <gary@mlbassoc.com>
> ---
> meta/classes/kernel.bbclass               |   96 =
++++++++++------------------
> meta/classes/module.bbclass               |    9 ++-
> meta/recipes-kernel/linux/linux-yocto.inc |    4 +
> 3 files changed, 45 insertions(+), 64 deletions(-)
>=20
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 90a7d64..c714931 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -110,78 +110,50 @@ kernel_do_install() {
> 		install -d ${D}/etc/modprobe.d
> 	fi
>=20
> -
> +	#
> +	# Support for external module building - create a minimal copy =
of the
> +	# kernel source tree.
> +	#
> +	kerneldir=3D${STAGING_KERNEL_DIR}
> +	install -d $kerneldir
>=20
> 	#
> -	# Support for external module building - create a minimal copy =
of the kernel source tree
> +	# Copy the entire source tree. In case an external build =
directory is
> +	# used, copy the build directory over first, then copy over the =
source
> +	# dir. This ensures the original Makefiles are used and not the
> +	# redirecting Makefiles in the build directory.
> 	#
> -	kerneldir=3D${D}/kernel/
> -
> -	# Take care of arch specific headers=09
> -	# Kernel 2.6.27 moved headers from includes/asm-${ARCH} to =
arch/${ARCH}/include/asm
> -	if [ -e arch/${ARCH}/include/asm/ ] ; then=20
> -		install -d $kerneldir/arch/${ARCH}/
> -		cp -fR arch/${ARCH}/* $kerneldir/arch/${ARCH}/
> -
> -	# Check for arch/x86 on i386
> -	elif [ -d arch/x86/include/asm/ ]; then
> -		if [ -e include/asm ] ; then
> -			install -d $kerneldir/include/asm/
> -			cp -fR arch/x86/include/asm/* =
$kerneldir/include/asm/
> -		fi
> -		install -d $kerneldir/arch/x86/include
> -		cp -fR arch/x86/* $kerneldir/arch/x86/
> +	# work and sysroots can be
> +	# on different partitions, so we can't rely on hardlinking,
> +	# unfortunately.
> +	#
> +	cp -fR ./ $kerneldir
> +	if [ ! "${S}" =3D=3D "${B}" ]; then
> +		cp -fR ${S}/* $kerneldir
> 	fi
>=20
> -	# Take care of the rest of the main directories we need
> -	for entry in drivers/crypto drivers/media include scripts; do
> -		if [ -d $entry ]; then
> -			mkdir -p $kerneldir/$entry
> -			cp -fR $entry/* $kerneldir/$entry/
> -		fi
> -	done
> -
> -	install -m 0644 .config $kerneldir/config-${KERNEL_VERSION}
> -	ln -sf config-${KERNEL_VERSION} $kerneldir/.config
> -	ln -sf config-${KERNEL_VERSION} $kerneldir/kernel-config
> -	echo "${KERNEL_VERSION}" >$kerneldir/kernel-abiversion
> -	echo "${S}" >$kerneldir/kernel-source
> -	echo "${KERNEL_CCSUFFIX}" >$kerneldir/kernel-ccsuffix
> -	echo "${KERNEL_LDSUFFIX}" >$kerneldir/kernel-ldsuffix
> -	[ -e vmlinux ] && install -m 0644 vmlinux $kerneldir/=09
> -	install -m 0644 ${KERNEL_OUTPUT} $kerneldir/${KERNEL_IMAGETYPE}
> -	install -m 0644 System.map =
$kerneldir/System.map-${KERNEL_VERSION}
> -	[ -e Module.symvers ] && install -m 0644 Module.symvers =
$kerneldir/
> -
> -	# Copy over the main Makefiles
> -	[ -e Rules.make ] && install -m 0644 Rules.make $kerneldir/
> -	[ -e Makefile ] && install -m 0644 Makefile $kerneldir/
> -	# Check if arch/${ARCH}/Makefile exists and install it
> -	if [ -e arch/${ARCH}/Makefile ]; then
> -		install -d $kerneldir/arch/${ARCH}
> -		install -m 0644 arch/${ARCH}/Makefile* =
$kerneldir/arch/${ARCH}
> -	# Otherwise check arch/x86/Makefile for i386 and x86_64 on =
kernels >=3D 2.6.24
> -	elif [ -e arch/x86/Makefile ]; then
> -		install -d $kerneldir/arch/x86
> -		install -m 0644 arch/x86/Makefile* $kerneldir/arch/x86
> -	fi
> +	#
> +	# Clean and remove files not needed for building modules.
> +	# Some distributions go through a lot more trouble to strip out
> +	# unecessary headers, for now, we just prune the obvious bits.
> +	#
> +	# We don't want to leave host-arch binaries in /sysroots, so
> +	# we clean the scripts dir while leaving the generated config
> +	# and include files.
> +	#
> +	oe_runmake -C $kerneldir CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" =
clean
> +	make _mrproper_scripts
> +	find $kerneldir -path $kerneldir/scripts -prune -o -name =
"*.[csS]" -exec rm '{}' \;
> +	find $kerneldir/Documentation -name "*.txt" -exec rm '{}' \;
>=20
> 	# Remove the following binaries which cause strip errors
> 	# during do_package for cross-compiled platforms
> 	bin_files=3D"arch/powerpc/boot/addnote =
arch/powerpc/boot/hack-coff \
> -		arch/powerpc/boot/mktree scripts/bin2c =
scripts/conmakehash \
> -		scripts/ihex2fw scripts/kallsyms scripts/pnmtologo =
scripts/basic/docproc \
> -		scripts/basic/fixdep scripts/basic/hash scripts/dtc/dtc =
\
> -		scripts/genksyms/genksyms scripts/kconfig/conf =
scripts/mod/mk_elfconfig \
> -		scripts/mod/modpost scripts/recordmcount"
> -	rm -rf $kerneldir/scripts/*.o
> -	rm -rf $kerneldir/scripts/basic/*.o
> -	rm -rf $kerneldir/scripts/kconfig/*.o
> -	rm -rf $kerneldir/scripts/mod/*.o
> -	rm -rf $kerneldir/scripts/dtc/*.o
> +	           arch/powerpc/boot/mktree"
> 	for entry in $bin_files; do
> -		rm -f $kerneldir/$entry
> -	done=09
> +	        rm -f $kerneldir/$entry
> +	done
> +
> }
>=20
> sysroot_stage_all_append() {
> diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
> index bbceaf7..572df0d 100644
> --- a/meta/classes/module.bbclass
> +++ b/meta/classes/module.bbclass
> @@ -3,14 +3,19 @@ DEPENDS +=3D "virtual/kernel"
>=20
> inherit module-base
>=20
> -# Ensure the hostprogs are available for module compilation
> -module_do_compile_prepend() {
> +#
> +# Ensure the hostprogs are available for module compilation. Modules =
that
> +# inherit this recipe and override do_compile() should be sure to =
call
> +# do_make_scripts() or ensure the scripts are built independently.
> +#
> +do_make_scripts() {
> 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS=20
> 	oe_runmake CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" =
AR=3D"${KERNEL_AR}" \
> 	           -C ${STAGING_KERNEL_DIR} scripts
> }
>=20
> module_do_compile() {
> +	do_make_scripts
> 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> 	oe_runmake KERNEL_PATH=3D${STAGING_KERNEL_DIR}   \
> 		   KERNEL_SRC=3D${STAGING_KERNEL_DIR}    \
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc =
b/meta/recipes-kernel/linux/linux-yocto.inc
> index 0812144..582e386 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -21,3 +21,7 @@ inherit kernel-yocto
> require linux-dtb.inc
>=20
> B =3D "${WORKDIR}/linux-${MACHINE}-${LINUX_KERNEL_TYPE}-build"
> +
> +do_install_append(){
> +	rm -rf ${STAGING_KERNEL_DIR}/$KMETA
> +}
> --=20
> 1.7.1
>=20



