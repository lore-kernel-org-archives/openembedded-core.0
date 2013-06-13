Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 339C061EBD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jun 2013 21:21:58 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5DLRbfS026590; Thu, 13 Jun 2013 22:27:37 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id K0QK7v9xL297; Thu, 13 Jun 2013 22:27:37 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5DLRYIa026581
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 13 Jun 2013 22:27:36 +0100
Message-ID: <1371158507.20823.64.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Crowe <mac@mcrowe.com>
Date: Thu, 13 Jun 2013 22:21:47 +0100
In-Reply-To: <20130613111601.GA27137@mcrowe.com>
References: <20130613111601.GA27137@mcrowe.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: populate-sysroot files in sstate cache overwritten by "empty" ones
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
X-List-Received-Date: Thu, 13 Jun 2013 21:22:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-06-13 at 12:16 +0100, Mike Crowe wrote:
> I've managed to find a relatively easy way to cause a perfectly valid
> sstate populate-sysroot file to be overwritten with a (virtually) empty
> one. The circumstances that provoke this in our layer are rather more
> complex but end up with the same situation.
> 
> The problem seems to be caused by having an ancillary task in recipe1 that
> depends on do_configure and the same ancillary task in recipe2 that depends
> on recipe1:populate-sysroot. The result is that recipe1:do_configure runs
> followed by recipe1:do_populate_sysroot without the intervening important
> tasks such as do_install.
> 
> To reproduce the problem, first apply this patch to oe-core to arrange for
> the required dependencies to exist:
> 
> diff --git a/meta/recipes-core/mac-test/mac-test.bb b/meta/recipes-core/mac-test/mac-test.bb
> new file mode 100644
> index 0000000..48d656a
> --- /dev/null
> +++ b/meta/recipes-core/mac-test/mac-test.bb
> @@ -0,0 +1,15 @@
> +inherit module
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
> +                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +DEPENDS = "virtual/kernel"
> +
> +do_extract_config() {
> +}
> +addtask extract_config after do_populate_sysroot
> +
> +do_compile() {
> +}
> +
> +do_install() {
> +}
> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.8.bb b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
> index 1517f40..3f14603 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_3.8.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
> @@ -28,3 +28,9 @@ KERNEL_FEATURES_append = " ${KERNEL_EXTRA_FEATURES}"
>  KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc"
>  KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "" ,d)}"
> +
> +do_extract_config() {
> +		    cp ${B}/.config /tmp/somewhere-safe
> +}
> +
> +addtask extract_config after do_configure
> 
> 
> Now do:
> 
>  export BB_NUMBER_THREADS=8
>  bitbake kernel-yocto mac-test
> 
>  # At this point kernel-yocto's populate-sysroot.tgz file in the sstate
>  # cache is correct.
> 
>  bitbake -c clean kernel-yocto mac-test
>  bitbake -c extract_config kernel-yocto mac-test
> 
>  # Now kernel-yocto's populate-sysroot.tgz file is virtually empty
> 
> 
> The log from the failing build looks like:
> 
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks
> NOTE: Running setscene task 35 of 36 (/home/mac/nobackup/git/oe-core/meta/recipes-core/mac-test/mac-test.bb, do_populate_sysroot_setscene)
> NOTE: recipe mac-test-1.0-r0: task do_populate_sysroot_setscene: Started
> NOTE: recipe mac-test-1.0-r0: task do_populate_sysroot_setscene: Succeeded
> NOTE: Running setscene task 36 of 36 (/home/mac/nobackup/git/oe-core/meta/recipes-kernel/linux/linux-yocto_3.8.bb, do_populate_sysroot_setscene)
> NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_populate_sysroot_setscene: Started
> NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_populate_sysroot_setscene: Succeeded
> NOTE: Executing RunQueue Tasks
> NOTE: Running task 175 of 269 (ID: 6, /home/mac/nobackup/git/oe-core/meta/recipes-kernel/linux/linux-yocto_3.8.bb, do_fetch)
> NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_fetch: Started
> NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_fetch: Succeeded
> NOTE: Running task 248 of 269 (ID: 2, /home/mac/nobackup/git/oe-core/meta/recipes-kernel/linux/linux-yocto_3.8.bb, do_unpack)
> NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_unpack: Started
> NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_unpack: Succeeded
> NOTE: Running task 249 of 269 (ID: 1, /home/mac/nobackup/git/oe-core/meta/recipes-kernel/linux/linux-yocto_3.8.bb, do_kernel_checkout)
> NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_kernel_checkout: Started
> NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_kernel_checkout: Succeeded
> NOTE: Running task 250 of 269 (ID: 0, /home/mac/nobackup/git/oe-core/meta/recipes-kernel/linux/linux-yocto_3.8.bb, do_validate_branches)
> NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_validate_branches: Started
> NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_validate_branches: Succeeded
> NOTE: Running task 251 of 269 (ID: 3, /home/mac/nobackup/git/oe-core/meta/recipes-kernel/linux/linux-yocto_3.8.bb, do_patch)
> NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_patch: Started
> NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_patch: Succeeded
> NOTE: Running task 252 of 269 (ID: 7, /home/mac/nobackup/git/oe-core/meta/recipes-kernel/linux/linux-yocto_3.8.bb, do_kernel_configme)
> NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_kernel_configme: Started
> NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_kernel_configme: Succeeded
> NOTE: Running task 253 of 269 (ID: 8, /home/mac/nobackup/git/oe-core/meta/recipes-kernel/linux/linux-yocto_3.8.bb, do_configure)
> NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_configure: Started
> NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_configure: Succeeded
> NOTE: Running task 262 of 269 (ID: 5, /home/mac/nobackup/git/oe-core/meta/recipes-kernel/linux/linux-yocto_3.8.bb, do_populate_sysroot)
> NOTE: Running task 263 of 269 (ID: 16, /home/mac/nobackup/git/oe-core/meta/recipes-kernel/linux/linux-yocto_3.8.bb, do_extract_config)
> NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_populate_sysroot: Started
> NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_extract_config: Started
> NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_extract_config: Succeeded
> NOTE: recipe linux-yocto-3.8.13+gitedd6461602_AUTOINC+1f973c0fc8-r4.1: task do_populate_sysroot: Succeeded
> NOTE: Running task 269 of 269 (ID: 25, /home/mac/nobackup/git/oe-core/meta/recipes-core/mac-test/mac-test.bb, do_extract_config)
> NOTE: recipe mac-test-1.0-r0: task do_extract_config: Started
> NOTE: recipe mac-test-1.0-r0: task do_extract_config: Succeeded
> NOTE: Tasks Summary: Attempted 269 tasks of which 259 didn't need to be rerun and all succeeded.

Hmm, interesting.

There is some code in staging.bbclass:

BB_SETSCENE_VERIFY_FUNCTION = "sysroot_checkhashes"

where sysroot_checkhashes() is meant to notice that do_configure reruns
and hence forces do_populate_sysroot to rerun. It appears to do this
successfully, however its missing out the dependencies of
do_populate_sysroot (compile, install) which is why the package ends up
broken.

I think this is a collision of two sets of data, there are some tasks
being skipped which shouldn't be. So I'd guess that the values from
BB_SETSCENE_VERIFY_FUNCTION aren't being processed with respect to
removing things from the setscene covered list.

Cheers,

Richard




