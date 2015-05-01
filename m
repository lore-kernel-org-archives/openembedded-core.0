Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 500CC73DA4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 May 2015 14:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t41ESwOY020587; Fri, 1 May 2015 15:28:58 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QYXCuFd2y8Nn; Fri,  1 May 2015 15:28:58 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t41ESjag020579
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 1 May 2015 15:28:56 +0100
Message-ID: <1430490525.18360.14.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Date: Fri, 01 May 2015 15:28:45 +0100
In-Reply-To: <1429030567-20338-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1429030567-20338-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel.bbclass: Fix race condition
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
X-List-Received-Date: Fri, 01 May 2015 14:29:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-04-14 at 19:56 +0300, Ed Bartosh wrote:
> Race condition between do_compile_kernelmodules and do_shared_workdir
> tasks occurs when do_compilemodules changes files in include/generated/*
> while do_shared_workdir tries to copy them to shared working directory.
> 
> Functionality of do_shared_workdir has been moved to separate function
> mk_shared_workdir and called from do_kernel_compile. do_shared_workdir
> left in the code as it may be used in many recipes.

Its called from do_kernel_install according to the patch?

This leaves a race since some code depends on the do_shared_work task
and shared_work is added after compile before install.

Cheers,

Richard

> [YOCTO #7321]
> 
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/classes/kernel.bbclass | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 125ed88..aad430a 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -231,6 +231,8 @@ kernel_do_install() {
>  	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/boot/Module.symvers-${KERNEL_VERSION}
>  	install -d ${D}${sysconfdir}/modules-load.d
>  	install -d ${D}${sysconfdir}/modprobe.d
> +
> +	mk_shared_workdir
>  }
>  do_install[prefuncs] += "package_get_auto_pr"
>  
> @@ -245,7 +247,7 @@ emit_depmod_pkgdata() {
>  
>  PACKAGEFUNCS += "emit_depmod_pkgdata"
>  
> -do_shared_workdir () {
> +mk_shared_workdir () {
>  	cd ${B}
>  
>  	kerneldir=${STAGING_KERNEL_BUILDDIR}
> @@ -289,6 +291,14 @@ do_shared_workdir () {
>  	fi
>  }
>  
> +# NOTE!!! Functionality of do_shared_workdir has been moved to mk_shared_workdir
> +# and called from kernel_do_compile.
> +# It caused race condition with do_compile_kernelmodules when it runs
> +# in parallel with do_compile_kernelmodules
> +do_shared_workdir () {
> +	:
> +}
> +
>  # We don't need to stage anything, not the modules/firmware since those would clash with linux-firmware
>  sysroot_stage_all () {
>  	:
> -- 
> 2.1.4
> 



