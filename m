Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 441E561013
	for <Openembedded-core@lists.openembedded.org>;
	Sat, 24 Aug 2013 17:15:47 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7OHRngn021510; Sat, 24 Aug 2013 18:27:50 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8NxRsZ5RzOQg; Sat, 24 Aug 2013 18:27:49 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7OHRh0D021503
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sat, 24 Aug 2013 18:27:45 +0100
Message-ID: <1377364531.6762.202.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jason Wessel <jason.wessel@windriver.com>
Date: Sat, 24 Aug 2013 18:15:31 +0100
In-Reply-To: <1377212667-5915-1-git-send-email-jason.wessel@windriver.com>
References: <1377212667-5915-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [v2 PATCH] kernel.bbclass, image.bbclass: Implement kernel INITRAMFS dependency and bundling
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
X-List-Received-Date: Sat, 24 Aug 2013 17:15:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-08-22 at 18:04 -0500, Jason Wessel wrote:
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
> [YOCTO #4072]
> 
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

I have a couple of things I'd really like to see get resolved here. One
is below, the other is I'm worried about the packaged output differences
since we can package the kernel into a package file and now its going to
be different.

I appreciate its a hard problem to solve but not impossible. Basically
we move the package generation for that single package into a separate
recipe and have it depend on the bundling task if/as/when needed. The
bundle task stashes the kernel in the sysroot, the other recipe simply
packages it. Its a little bit of a dance but should ensure we get
everything consistent.


> ---
>  meta/classes/image.bbclass  |   12 ++++++
>  meta/classes/kernel.bbclass |   96 +++++++++++++++++++++++++++++++++++++------
>  meta/conf/local.conf.sample |   20 +++++++++
>  3 files changed, 116 insertions(+), 12 deletions(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 909702a..23967ec 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -130,6 +130,10 @@ python () {
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
> @@ -629,3 +633,11 @@ do_package_write_deb[noexec] = "1"
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

But what about my bzip2'd image? ;-)

I'd suggest we rid of this and instead ensure that we're generating an
uncompressed cpio image. The image generation code will happily sort
that our for us if we ask it for that specific image type.

I'd also wondered if we could remove INITRAMFS_TASK since its just going
to confuse things and I'd prefer to maintain only one way of doing this
if at all possible.

Cheers,

Richard


