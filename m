Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 845D86D7BB
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 17:14:41 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAKHEb3R006265; Wed, 20 Nov 2013 17:14:37 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id fmAbFDxZdIel; Wed, 20 Nov 2013 17:14:37 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAKHEUm2006262
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 20 Nov 2013 17:14:32 GMT
Message-ID: <1384967667.16887.76.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Crowe <mac@mcrowe.com>
Date: Wed, 20 Nov 2013 17:14:27 +0000
In-Reply-To: <20131120170428.GA28867@mcrowe.com>
References: <1376939513-10400-1-git-send-email-jason.wessel@windriver.com>
	<20131120170428.GA28867@mcrowe.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 20 Nov 2013 17:14:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-11-20 at 17:04 +0000, Mike Crowe wrote:
> This patch defeats using the sstate-cache. The kernel is resurrected from
> the sstate cache but ends up being built again since do_bundle_initramfs
> depends on do_compile. (Note that Richard Purdie's bitbake fix in
> http://git.openembedded.org/bitbake/commit/?h=master-next&id=f21910157d873c030b149c4cdc5b57c5062ab5a6
> is required for it to even work that well.)
> 
> When testing I also found that do_bundle_initramfs could race against
> do_install so I think that do_bundle_initramfs needs to be run after
> do_install.
> 
> Here's my RFC patch to ensure that the sstate cache continues to be used
> effectively. The plan is to run do_bundle_initramfs before do_deploy and
> then move the code to update the deploy directory to do_deploy but make it
> write to ${DEPLOYDIR} rather then ${DEPLOY_DIR_IMAGE}.
>
> In my limited testing this seems to make the sstate cache work effectively
> when INITRAMFS_IMAGE_BUNDLE="1" but I think it needs someone who actually
> uses this feature to test the patch and point out what I've got wrong
> before it can be merged.

This looks like the right thing to be doing, tasks should not be poking
into DEPLOY_DIR_IMAGE themselves as that bypasses sstate.

We need to kill the do_bundle_initramfs[nostamp] = "1" too.

Cheers,

Richard


> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 6959aa1..0ba0044 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -134,16 +134,6 @@ do_bundle_initramfs () {
>  		echo "There is kernel image bundled with initramfs: ${B}/${KERNEL_OUTPUT}.initramfs"
>  		install -m 0644 ${B}/${KERNEL_OUTPUT}.initramfs ${D}/boot/${KERNEL_IMAGETYPE}-initramfs-${MACHINE}.bin
>  		echo "${B}/${KERNEL_OUTPUT}.initramfs"
> -		cd ${B}
> -		# Update deploy directory
> -		if [ -e "${KERNEL_OUTPUT}.initramfs" ]; then
> -			echo "Copying deploy kernel-initramfs image and setting up links..."
> -			initramfs_base_name=${INITRAMFS_BASE_NAME}
> -			initramfs_symlink_name=${KERNEL_IMAGETYPE}-initramfs-${MACHINE}
> -			install -m 0644 ${KERNEL_OUTPUT}.initramfs ${DEPLOY_DIR_IMAGE}/${initramfs_base_name}.bin
> -			cd ${DEPLOY_DIR_IMAGE}
> -			ln -sf ${initramfs_base_name}.bin ${initramfs_symlink_name}.bin
> -		fi
>  	fi
>  }
>  do_bundle_initramfs[nostamp] = "1"
> @@ -152,7 +142,7 @@ python do_devshell_prepend () {
>      os.environ["LDFLAGS"] = ''
>  }
>  
> -addtask bundle_initramfs after do_compile before do_build
> +addtask bundle_initramfs after do_install before do_deploy
>  
>  kernel_do_compile() {
>  	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> @@ -479,6 +469,17 @@ kernel_do_deploy() {
>  	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${DEPLOYDIR}/${KERNEL_IMAGETYPE}
>  
>  	cp ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
> +
> +	cd ${B}
> +	# Update deploy directory
> +	if [ -e "${KERNEL_OUTPUT}.initramfs" ]; then
> +		echo "Copying deploy kernel-initramfs image and setting up links..."
> +		initramfs_base_name=${INITRAMFS_BASE_NAME}
> +		initramfs_symlink_name=${KERNEL_IMAGETYPE}-initramfs-${MACHINE}
> +		install -m 0644 ${KERNEL_OUTPUT}.initramfs ${DEPLOYDIR}/${initramfs_base_name}.bin
> +		cd ${DEPLOYDIR}
> +		ln -sf ${initramfs_base_name}.bin ${initramfs_symlink_name}.bin
> +	fi
>  }
>  do_deploy[dirs] = "${DEPLOYDIR} ${B}"
>  do_deploy[prefuncs] += "package_get_auto_pr"
> 
> 
> Mike.
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



