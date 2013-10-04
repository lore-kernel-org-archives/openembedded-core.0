Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by mail.openembedded.org (Postfix) with ESMTP id 839E560EA3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2013 18:41:39 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MU50015OQKTN5F0@vms173001.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Fri, 04 Oct 2013 13:41:22 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 09A0720179; Fri,
	04 Oct 2013 14:41:16 -0400 (EDT)
Date: Fri, 04 Oct 2013 14:41:16 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Message-id: <20131004184116.GA8393@denix.org>
References: <1380045500-10798-1-git-send-email-fcooper@ti.com>
MIME-version: 1.0
In-reply-to: <1380045500-10798-1-git-send-email-fcooper@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Darren Hart <dvhart@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [for dylan][PATCH] kernel.bbclass: Correct post(inst|rm) package association
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
X-List-Received-Date: Fri, 04 Oct 2013 18:41:40 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Ping. Is Dylan still alive?


On Tue, Sep 24, 2013 at 12:58:20PM -0500, Franklin S. Cooper Jr wrote:
> From: Darren Hart <dvhart@linux.intel.com>
> 
> Fixes [YOCTO #4991]
> 
> The kernel image is installed as part of the kernel-image package, but
> the symlink creation/removal via alternatives is being done in
> pkg_post(inst|rm)_kernel-base.
> 
> Move the postinst alternatives logic into the kernel-image functions.
> 
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/classes/kernel.bbclass |   29 +++++++++++++----------------
>  1 files changed, 13 insertions(+), 16 deletions(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 3320747..c417038 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -237,14 +237,6 @@ do_savedefconfig() {
>  do_savedefconfig[nostamp] = "1"
>  addtask savedefconfig after do_configure
>  
> -pkg_postinst_kernel-base () {
> -	update-alternatives --install /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
> -}
> -
> -pkg_postrm_kernel-base () {
> -	update-alternatives --remove ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} || true
> -}
> -
>  inherit cml1
>  
>  EXPORT_FUNCTIONS do_compile do_install do_configure
> @@ -272,14 +264,19 @@ ALLOW_EMPTY_kernel-modules = "1"
>  DESCRIPTION_kernel-modules = "Kernel modules meta package"
>  
>  pkg_postinst_kernel-image () {
> -if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
> -	mkdir -p $D/lib/modules/${KERNEL_VERSION}
> -fi
> -if [ -n "$D" ]; then
> -	depmodwrapper -a -b $D ${KERNEL_VERSION}
> -else
> -	depmod -a ${KERNEL_VERSION}
> -fi
> +	update-alternatives --install /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
> +	if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
> +		mkdir -p $D/lib/modules/${KERNEL_VERSION}
> +	fi
> +	if [ -n "$D" ]; then
> +		depmodwrapper -a -b $D ${KERNEL_VERSION}
> +	else
> +		depmod -a ${KERNEL_VERSION}
> +	fi
> +}
> +
> +pkg_postrm_kernel-image () {
> +	update-alternatives --remove ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} || true
>  }
>  
>  PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
> -- 
> 1.7.0.4
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

