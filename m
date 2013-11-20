Return-Path: <mac@mcrowe.com>
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mail.openembedded.org (Postfix) with ESMTP id 12A366D608
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 17:04:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.93,738,1378854000"; d="scan'208";a="44117497"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 20 Nov 2013 17:04:29 +0000
Received: from mac by deneb.mcrowe.com with local (Exim 4.80)
	(envelope-from <mac@mcrowe.com>) id 1VjBCW-0007dy-R2
	for Openembedded-core@lists.openembedded.org;
	Wed, 20 Nov 2013 17:04:28 +0000
Date: Wed, 20 Nov 2013 17:04:28 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Openembedded-core@lists.openembedded.org
Message-ID: <20131120170428.GA28867@mcrowe.com>
References: <1376939513-10400-1-git-send-email-jason.wessel@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1376939513-10400-1-git-send-email-jason.wessel@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] kernel.bbclass, image.bbclass: Implement kernel INITRAMFS dependency and bundling
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
X-List-Received-Date: Wed, 20 Nov 2013 17:04:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Monday 19 August 2013 at 14:11:53 -0500, Jason Wessel wrote:
> This patch aims to fix the following two cases for the INITRAMFS generation.
>   1) Allow an image recipe to specify a paired INITRAMFS recipe such
>      as core-image-minimal-initramfs.  This allows building a base
>      image which always generates the needed initramfs image in one step
>   2) Allow building a single binary which contains a kernel and
>      the initramfs.
> 
> A key requirement of the initramfs is to be able to add kernel
> modules.  The current implementation of the INITRAMFS_IMAGE variable
> has a circular dependency when using kernel modules in the initramfs
> image.bb file that is caused by kernel.bbclass trying to build the
> initramfs before the kernel's do_install rule.
> 
> The solution for this problem is to have the kernel's
> do_bundle_initramfs_image task depend on the do_rootfs from the
> INITRAMFS_IMAGE and not some intermediate point.  The image.bbclass
> will also sets up dependencies to make the initramfs creation task run
> last.
> 
> The code to bundle the kernel and initramfs together has been added.
> At a high level, all it is doing is invoking a second compilation of
> the kernel but changing the value of CONFIG_INITRAMFS_SOURCE to point
> to the generated initramfs from the image recipe.
> 
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  meta/classes/image.bbclass  |   12 ++++++
>  meta/classes/kernel.bbclass |   96 +++++++++++++++++++++++++++++++++++++------
>  meta/conf/local.conf.sample |   20 +++++++++
>  3 files changed, 116 insertions(+), 12 deletions(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 116bd22..78c25db 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -140,6 +140,10 @@ python () {
>      d.setVar('MULTILIB_VENDORS', ml_vendor_list)
>  
>      check_image_features(d)
> +    initramfs_image = d.getVar('INITRAMFS_IMAGE', True) or ""
> +    if initramfs_image != "":
> +        d.appendVarFlag('do_build', 'depends', " %s:do_bundle_initramfs" %  d.getVar('PN', True))
> +        d.appendVarFlag('do_bundle_initramfs', 'depends', " %s:do_rootfs" % initramfs_image)
>  }
>  
>  #
> @@ -614,3 +618,11 @@ do_package_write_deb[noexec] = "1"
>  do_package_write_rpm[noexec] = "1"
>  
>  addtask rootfs before do_build
> +# Allow the kernel to be repacked with the initramfs and boot image file as a single file
> +do_bundle_initramfs[depends] += "virtual/kernel:do_bundle_initramfs"
> +do_bundle_initramfs[nostamp] = "1"
> +do_bundle_initramfs[noexec] = "1"
> +do_bundle_initramfs () {
> +	:
> +}
> +addtask bundle_initramfs after do_rootfs
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index e039dfc..8cf66ce 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -9,6 +9,7 @@ INHIBIT_DEFAULT_DEPS = "1"
>  KERNEL_IMAGETYPE ?= "zImage"
>  INITRAMFS_IMAGE ?= ""
>  INITRAMFS_TASK ?= ""
> +INITRAMFS_IMAGE_BUNDLE ?= ""
>  
>  python __anonymous () {
>      kerneltype = d.getVar('KERNEL_IMAGETYPE', True) or ''
> @@ -19,7 +20,15 @@ python __anonymous () {
>  
>      image = d.getVar('INITRAMFS_IMAGE', True)
>      if image:
> -        d.setVar('INITRAMFS_TASK', '${INITRAMFS_IMAGE}:do_rootfs')
> +        d.appendVarFlag('do_bundle_initramfs', 'depends', ' ${INITRAMFS_IMAGE}:do_rootfs')
> +
> +    # NOTE: setting INITRAMFS_TASK is for backward compatibility
> +    #       The preferred method is to set INITRAMFS_IMAGE, because
> +    #       this INITRAMFS_TASK has circular dependency problems
> +    #       if the initramfs requires kernel modules
> +    image_task = d.getVar('INITRAMFS_TASK', True)
> +    if image_task:
> +        d.appendVarFlag('do_configure', 'depends', ' ${INITRAMFS_TASK}')
>  }
>  
>  inherit kernel-arch deploy
> @@ -72,9 +81,82 @@ KERNEL_SRC_PATH = "/usr/src/kernel"
>  
>  KERNEL_IMAGETYPE_FOR_MAKE = "${@(lambda s: s[:-3] if s[-3:] == ".gz" else s)(d.getVar('KERNEL_IMAGETYPE', True))}"
>  
> +copy_initramfs() {
> +	echo "Copying initramfs into ./usr ..."
> +	# Find and use the first initramfs image archive type we find
> +	rm -f ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
> +	for img in cpio.gz cpio.lzo cpio.lzma cpio.xz; do
> +		if [ -e "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img" ]; then
> +			cp ${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img ${B}/usr/.
> +			case $img in
> +			*gz)
> +				echo "gzip decompressing image"
> +				gunzip -f ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.$img
> +				break
> +				;;
> +			*lzo)
> +				echo "lzo decompressing image"
> +				lzop -df ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.$img
> +				break
> +				;;
> +			*lzma)
> +				echo "lzma decompressing image"
> +				lzmash -df ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.$img
> +				break
> +				;;
> +			*xz)
> +				echo "xz decompressing image"
> +				xz -df ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.$img
> +				break
> +				;;
> +			esac
> +		fi
> +	done
> +	echo "Finished copy of initramfs into ./usr"
> +}
> +
> +INITRAMFS_BASE_NAME = "${KERNEL_IMAGETYPE}-initramfs-${PV}-${PR}-${MACHINE}-${DATETIME}"
> +INITRAMFS_BASE_NAME[vardepsexclude] = "DATETIME"
> +do_bundle_initramfs () {
> +	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
> +		echo "Creating a kernel image with a bundled initramfs..."
> +		copy_initramfs
> +		if [ -e ${KERNEL_OUTPUT} ] ; then
> +			mv -f ${KERNEL_OUTPUT} ${KERNEL_OUTPUT}.bak
> +		fi
> +		use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
> +		kernel_do_compile
> +		mv -f ${KERNEL_OUTPUT} ${KERNEL_OUTPUT}.initramfs
> +		mv -f ${KERNEL_OUTPUT}.bak ${KERNEL_OUTPUT}
> +		# Update install area
> +		echo "There is kernel image bundled with initramfs: ${B}/${KERNEL_OUTPUT}.initramfs"
> +		install -m 0644 ${B}/${KERNEL_OUTPUT}.initramfs ${D}/boot/${KERNEL_IMAGETYPE}-initramfs-${MACHINE}.bin
> +		echo "${B}/${KERNEL_OUTPUT}.initramfs"
> +		cd ${B}
> +		# Update deploy directory
> +		if [ -e "${KERNEL_OUTPUT}.initramfs" ]; then
> +			echo "Copying deploy kernel-initramfs image and setting up links..."
> +			initramfs_base_name=${INITRAMFS_BASE_NAME}
> +			initramfs_symlink_name=${KERNEL_IMAGETYPE}-initramfs-${MACHINE}
> +			install -m 0644 ${KERNEL_OUTPUT}.initramfs ${DEPLOY_DIR_IMAGE}/${initramfs_base_name}.bin
> +			cd ${DEPLOY_DIR_IMAGE}
> +			ln -sf ${initramfs_base_name}.bin ${initramfs_symlink_name}.bin
> +		fi
> +	fi
> +}
> +do_bundle_initramfs[nostamp] = "1"
> +addtask bundle_initramfs after do_compile
> +
>  kernel_do_compile() {
>  	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> -	oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE} ${KERNEL_ALT_IMAGETYPE} CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
> +	# The $use_alternate_initrd is only set from
> +	# do_bundle_initramfs() This variable is specifically for the
> +	# case where we are making a second pass at the kernel
> +	# compilation and we want to force the kernel build to use a
> +	# different initramfs image.  The way to do that in the kernel
> +	# is to specify:
> +	# make ...args... CONFIG_INITRAMFS_SOURCE=some_other_initramfs.cpio
> +	oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE} ${KERNEL_ALT_IMAGETYPE} CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
>  	if test "${KERNEL_IMAGETYPE_FOR_MAKE}.gz" = "${KERNEL_IMAGETYPE}"; then
>  		gzip -9c < "${KERNEL_IMAGETYPE_FOR_MAKE}" > "${KERNEL_OUTPUT}"
>  	fi
> @@ -219,18 +301,8 @@ kernel_do_configure() {
>  		cp "${WORKDIR}/defconfig" "${B}/.config"
>  	fi
>  	yes '' | oe_runmake oldconfig
> -
> -	if [ ! -z "${INITRAMFS_IMAGE}" ]; then
> -		for img in cpio.gz cpio.lzo cpio.lzma cpio.xz; do
> -		if [ -e "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img" ]; then
> -			cp "${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.$img" initramfs.$img
> -		fi
> -		done
> -	fi
>  }
>  
> -do_configure[depends] += "${INITRAMFS_TASK}"
> -
>  do_savedefconfig() {
>  	oe_runmake savedefconfig
>  }
> diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
> index 2b078d0..17733ab 100644
> --- a/meta/conf/local.conf.sample
> +++ b/meta/conf/local.conf.sample
> @@ -146,6 +146,26 @@ EXTRA_IMAGE_FEATURES = "debug-tweaks"
>  USER_CLASSES ?= "buildstats image-mklibs image-prelink"
>  
>  #
> +# Kernel image features
> +#
> +# The INITRAMFS_IMAGE image variable will cause an additional recipe to
> +# be built as a dependency to the what ever rootfs recipe you might be
> +# using such as core-image-sato.  The initramfs might be needed for
> +# the initial boot of of the target system such as to load kernel
> +# modules prior to mounting the root file system.
> +#
> +# INITRAMFS_IMAGE_BUNDLE variable controls if the image recipe
> +# specified by the INITRAMFS_IMAGE will be run through an extra pass
> +# through the kernel compilation in order to build a single binary
> +# which contains both the kernel image and the initramfs.  The
> +# combined binary will be deposited into the tmp/deploy directory.
> +# NOTE: You can set INITRAMFS_IMAGE in an image recipe, but
> +#       INITRAMFS_IMAGE_BUNDLE can only be set in a conf file.
> +#
> +#INITRAMFS_IMAGE = "core-image-minimal-initramfs"
> +#INITRAMFS_IMAGE_BUNDLE = "1"
> +
> +#
>  # Runtime testing of images
>  #
>  # The build system can test booting virtual machine images under qemu (an emulator)
> -- 
> 1.7.9.5

This patch defeats using the sstate-cache. The kernel is resurrected from
the sstate cache but ends up being built again since do_bundle_initramfs
depends on do_compile. (Note that Richard Purdie's bitbake fix in
http://git.openembedded.org/bitbake/commit/?h=master-next&id=f21910157d873c030b149c4cdc5b57c5062ab5a6
is required for it to even work that well.)

When testing I also found that do_bundle_initramfs could race against
do_install so I think that do_bundle_initramfs needs to be run after
do_install.

Here's my RFC patch to ensure that the sstate cache continues to be used
effectively. The plan is to run do_bundle_initramfs before do_deploy and
then move the code to update the deploy directory to do_deploy but make it
write to ${DEPLOYDIR} rather then ${DEPLOY_DIR_IMAGE}.

In my limited testing this seems to make the sstate cache work effectively
when INITRAMFS_IMAGE_BUNDLE="1" but I think it needs someone who actually
uses this feature to test the patch and point out what I've got wrong
before it can be merged.

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 6959aa1..0ba0044 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -134,16 +134,6 @@ do_bundle_initramfs () {
 		echo "There is kernel image bundled with initramfs: ${B}/${KERNEL_OUTPUT}.initramfs"
 		install -m 0644 ${B}/${KERNEL_OUTPUT}.initramfs ${D}/boot/${KERNEL_IMAGETYPE}-initramfs-${MACHINE}.bin
 		echo "${B}/${KERNEL_OUTPUT}.initramfs"
-		cd ${B}
-		# Update deploy directory
-		if [ -e "${KERNEL_OUTPUT}.initramfs" ]; then
-			echo "Copying deploy kernel-initramfs image and setting up links..."
-			initramfs_base_name=${INITRAMFS_BASE_NAME}
-			initramfs_symlink_name=${KERNEL_IMAGETYPE}-initramfs-${MACHINE}
-			install -m 0644 ${KERNEL_OUTPUT}.initramfs ${DEPLOY_DIR_IMAGE}/${initramfs_base_name}.bin
-			cd ${DEPLOY_DIR_IMAGE}
-			ln -sf ${initramfs_base_name}.bin ${initramfs_symlink_name}.bin
-		fi
 	fi
 }
 do_bundle_initramfs[nostamp] = "1"
@@ -152,7 +142,7 @@ python do_devshell_prepend () {
     os.environ["LDFLAGS"] = ''
 }
 
-addtask bundle_initramfs after do_compile before do_build
+addtask bundle_initramfs after do_install before do_deploy
 
 kernel_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
@@ -479,6 +469,17 @@ kernel_do_deploy() {
 	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${DEPLOYDIR}/${KERNEL_IMAGETYPE}
 
 	cp ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
+
+	cd ${B}
+	# Update deploy directory
+	if [ -e "${KERNEL_OUTPUT}.initramfs" ]; then
+		echo "Copying deploy kernel-initramfs image and setting up links..."
+		initramfs_base_name=${INITRAMFS_BASE_NAME}
+		initramfs_symlink_name=${KERNEL_IMAGETYPE}-initramfs-${MACHINE}
+		install -m 0644 ${KERNEL_OUTPUT}.initramfs ${DEPLOYDIR}/${initramfs_base_name}.bin
+		cd ${DEPLOYDIR}
+		ln -sf ${initramfs_base_name}.bin ${initramfs_symlink_name}.bin
+	fi
 }
 do_deploy[dirs] = "${DEPLOYDIR} ${B}"
 do_deploy[prefuncs] += "package_get_auto_pr"


Mike.

