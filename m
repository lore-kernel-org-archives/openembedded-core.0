Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SouMo-00049P-JZ for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 12:41:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6BAUlK3002843
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 11:30:47 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01796-05 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 11:30:41 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6BAUdXu002837
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 11:30:40 +0100
Message-ID: <1342002640.7934.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 11 Jul 2012 11:30:40 +0100
In-Reply-To: <1341940070-27715-2-git-send-email-raj.khem@gmail.com>
References: <1341940070-27715-1-git-send-email-raj.khem@gmail.com>
	<1341940070-27715-2-git-send-email-raj.khem@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/2] kernel.bbclass: Make tree available for cross building external modules
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
X-List-Received-Date: Wed, 11 Jul 2012 10:41:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-07-10 at 10:07 -0700, Khem Raj wrote:
> We shave too much from kernel sources for making it work
> for on device external kernel module development that cross
> development of external modules wont work from same tree
> anymore. This patch makes a copy of tree which will eventually
> be staged for building external modules

It sounds from the further discussion that there is more to the patch
than just this. Firstly, a change like this needs a more precise
description.

Secondly, we're copying around *way* to much data in this approach. I'd
like to suggest an improvement but can't since the description above is
lacking, I can't even understand what the problem is you're trying to
fix.

So more discussion is needed.

I have a suspicion that this fix only "happens" to work when SDKMACHINE
== NATIVEMACHINE.

Cheers,

Richard


> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/kernel.bbclass |   15 +++++++++++++--
>  1 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 81c334b..b2b6fcd 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -80,6 +80,7 @@ KERNEL_ALT_IMAGETYPE ??= ""
>  # Define where the kernel headers are installed on the target as well as where
>  # they are staged.
>  KERNEL_SRC_PATH = "/usr/src/kernel"
> +UNPRUNED_KERNEL_SRC_PATH = "/usr/src/kernel-unpruned"
>  
>  KERNEL_IMAGETYPE_FOR_MAKE = "${@(lambda s: s[:-3] if s[-3:] == ".gz" else s)(d.getVar('KERNEL_IMAGETYPE', True))}"
>  
> @@ -135,7 +136,9 @@ kernel_do_install() {
>  	# kernel source tree.
>  	#
>  	kerneldir=${D}${KERNEL_SRC_PATH}
> +	unrprunedkerneldir=${D}${UNPRUNED_KERNEL_SRC_PATH}
>  	install -d $kerneldir
> +	install -d $unrprunedkerneldir
>  
>  	#
>  	# Store the kernel version in sysroots for module-base.bbclass
> @@ -176,7 +179,6 @@ kernel_do_install() {
>  	# and include files.
>  	#
>  	oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean
> -	make -C $kerneldir _mrproper_scripts
>  	find $kerneldir -path $kerneldir/lib -prune -o -path $kerneldir/tools -prune -o -path $kerneldir/scripts -prune -o -name "*.[csS]" -exec rm '{}' \;
>  	find $kerneldir/Documentation -name "*.txt" -exec rm '{}' \;
>  
> @@ -186,6 +188,9 @@ kernel_do_install() {
>  	if [ ${ARCH} = "powerpc" ]; then
>  		cp arch/powerpc/lib/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
>  	fi
> +	# make a copy of unpruned kernel tree
> +	cp -fR $kerneldir/* $unrprunedkerneldir
> +	make -C $kerneldir _mrproper_scripts
>  
>  	# Remove the following binaries which cause strip or arch QA errors
>  	# during do_package for cross-compiled platforms
> @@ -197,8 +202,14 @@ kernel_do_install() {
>  	done
>  }
>  
> +PACKAGE_PREPROCESS_FUNCS += "kernel_package_preprocess"
> +
> +kernel_package_preprocess () {
> +	rm -rf ${PKGD}/${UNPRUNED_KERNEL_SRC_PATH}
> +}
> +
>  sysroot_stage_all_append() {
> -	sysroot_stage_dir ${D}${KERNEL_SRC_PATH} ${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}
> +	sysroot_stage_dir ${D}${UNPRUNED_KERNEL_SRC_PATH} ${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}
>  }
>  
>  kernel_do_configure() {




