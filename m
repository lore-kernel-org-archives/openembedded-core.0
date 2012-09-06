Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1T9QU1-000744-LI
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 03:02:14 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Sep 2012 17:49:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,377,1344236400"; d="scan'208";a="189414384"
Received: from unknown (HELO envy.home) ([10.255.13.50])
	by orsmga001.jf.intel.com with ESMTP; 05 Sep 2012 17:49:48 -0700
Message-ID: <5047F316.8030808@linux.intel.com>
Date: Wed, 05 Sep 2012 17:49:26 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120828 Thunderbird/15.0
MIME-Version: 1.0
To: McClintock Matthew-B29882 <B29882@freescale.com>
References: <1346136108-13062-1-git-send-email-koen@dominion.thruhere.net>
	<1346136108-13062-9-git-send-email-koen@dominion.thruhere.net>
	<70CC66F5C30A414DADDA6973E4CA391A64E50F@039-SN1MPN1-001.039d.mgd.msft.net>
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A64E50F@039-SN1MPN1-001.039d.mgd.msft.net>
X-Enigmail-Version: 1.4.4
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Scott Garman <scott.a.garman@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [for-denzil][meta-oe][PATCH 09/11] kernel: Add kernel headers to kernel-dev package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2012 01:02:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 09/05/2012 02:42 PM, McClintock Matthew-B29882 wrote:
> On Tue, Aug 28, 2012 at 1:41 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> From: Darren Hart <dvhart@linux.intel.com>
>>
>> [YOCTO #1614]
>>
>> Add the kernel headers to the kernel-dev package. This packages what was
>> already built and kept in sysroots for building modules with bitbake.
>> Making this available on the target requires removing some additional
>> host binaries.
>>
>> Move the location to /usr/src/kernel
>>
>> Before use on the target, the user will need to:
>>
>>     # cd /usr/src/kernel
>>     # make scripts
>>
>> This renders the kernel-misc recipe empty, so remove it.
>>
>> As we use /usr/src/kernel in several places (and I missed one in the
>> previous version), add a KERNEL_SRC_DIR variable and use that throughout
>> the class to avoid update errors in the future.
>>
>> Now that we package the kernel headers, drop the
>> kernel_package_preprocess function which removed them from PKGD.
>>
>> All *-sdk image recipes include dev-pkgs, so the kernel-dev package will
>> be installed by default on all such images.
>>
>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>> CC: Bruce Ashfield <bruce.ashfield@windriver.com>
>> CC: Tom Zanussi <tom.zanussi@intel.com>
>> CC: Khem Raj <raj.khem@gmail.com>
>>
>> ---
>>  meta/classes/kernel.bbclass |   25 +++++++++++--------------
>>  meta/conf/bitbake.conf      |    2 +-
>>  2 files changed, 12 insertions(+), 15 deletions(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 3ccd753..d79ba9f 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -77,6 +77,10 @@ EXTRA_OEMAKE = ""
>>
>>  KERNEL_ALT_IMAGETYPE ??= ""
>>
>> +# Define where the kernel headers are installed on the target as well as where
>> +# they are staged.
>> +KERNEL_SRC_PATH = "/usr/src/kernel"
>> +
>>  KERNEL_IMAGETYPE_FOR_MAKE = "${@(lambda s: s[:-3] if s[-3:] == ".gz" else s)(d.getVar('KERNEL_IMAGETYPE', True))}"
>>
>>  kernel_do_compile() {
>> @@ -130,7 +134,7 @@ kernel_do_install() {
>>         # Support for external module building - create a minimal copy of the
>>         # kernel source tree.
>>         #
>> -       kerneldir=${D}/kernel
>> +       kerneldir=${D}${KERNEL_SRC_PATH}
>>         install -d $kerneldir
>>
>>         #
>> @@ -191,20 +195,15 @@ kernel_do_install() {
>>         # Remove the following binaries which cause strip errors
>>         # during do_package for cross-compiled platforms
>>         bin_files="arch/powerpc/boot/addnote arch/powerpc/boot/hack-coff \
>> -                  arch/powerpc/boot/mktree"
>> +                  arch/powerpc/boot/mktree scripts/kconfig/zconf.tab.o \
>> +                  scripts/kconfig/conf.o"
>>         for entry in $bin_files; do
>>                 rm -f $kerneldir/$entry
>>         done
>>  }
>>
>> -PACKAGE_PREPROCESS_FUNCS += "kernel_package_preprocess"
>> -
>> -kernel_package_preprocess () {
>> -       rm -rf ${PKGD}/kernel
>> -}
>> -
>>  sysroot_stage_all_append() {
>> -       sysroot_stage_dir ${D}/kernel ${SYSROOT_DESTDIR}/kernel
>> +       sysroot_stage_dir ${D}${KERNEL_SRC_PATH} ${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}
>>  }
>>
>>  kernel_do_configure() {
>> @@ -252,13 +251,11 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
>>
>>  # kernel-base becomes kernel-${KERNEL_VERSION}
>>  # kernel-image becomes kernel-image-${KERNEL_VERISON}
>> -PACKAGES = "kernel kernel-base kernel-image kernel-dev kernel-vmlinux kernel-misc"
>> +PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev"
>>  FILES = ""
>>  FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
>> -FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config*"
>> +FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH}"
> 
> This patch is causing the following on denzil (which Scott applied to
> his denzil-next branch)
> 
> ERROR: QA Issue: non debug package contains .debug directory:
> kernel-dev path
> /work/p5020ds_64b-poky-linux/linux-qoriq-sdk-3.0.34-r4/packages-split/kernel-dev/usr/src/kernel/tools/perf/.debug/perf
> ERROR: QA run found fatal errors. Please consider fixing them.
> ERROR: Function failed: do_package_qa
> ERROR: Logfile of failure stored in:
> /local/home/mattsm/git/poky/build-denzil/tmp/work/p5020ds_64b-poky-linux/linux-qoriq-sdk-3.0.34-r4/temp/log.do_package.26851
> NOTE: package linux-qoriq-sdk-3.0.34-r4: task do_package: Failed
> ERROR: Task 13 (/local/home/mattsm/git/poky/build-denzil/../meta-fsl-ppc/recipes-kernel/linux/linux-qoriq-sdk.bb,
> do_package) failed with exit code '1'
> 
> At first glance, it looks like we should:
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 7ae2a53..511b22b 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -546,4 +546,5 @@ EXPORT_FUNCTIONS do_deploy
>  PACKAGES =+ "perf-dbg perf"
>  FILES_perf = "${bindir}/* \
>                ${libexecdir}"
> -FILES_perf-dbg = "${FILES_${PN}-dbg}"
> +FILES_perf-dbg = "${FILES_${PN}-dbg} \
> +                 ${KERNEL_SRC_PATH}/tools/perf/.debug"
> 
> Thoughts?

I suppose that or pull in the patches to separate perf into a separate
recipe, although that's 13+ patches. I prefer your solution for the
stable tree.

Tom may have another suggestion.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


