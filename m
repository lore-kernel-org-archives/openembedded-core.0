Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5ACFC71E53
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 13:28:43 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 20 Jan 2017 05:28:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,258,1477983600"; d="scan'208";a="33177711"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga002.jf.intel.com with ESMTP; 20 Jan 2017 05:28:43 -0800
Date: Fri, 20 Jan 2017 15:29:21 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: Jason Wessel <jason.wessel@windriver.com>
Message-ID: <20170120132920.GA8341@mbabyjoh-desk.ger.corp.intel.com>
References: <20170119211441.126457-1-jason.wessel@windriver.com>
	<20170119211441.126457-2-jason.wessel@windriver.com>
	<f97e0ddf-dd9d-06d3-831c-fa47349a1e66@windriver.com>
MIME-Version: 1.0
In-Reply-To: <f97e0ddf-dd9d-06d3-831c-fa47349a1e66@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] Revert "kernel: Modify kernel modules installation path."
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
X-List-Received-Date: Fri, 20 Jan 2017 13:28:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jason,

On Thu, Jan 19, 2017 at 03:24:00PM -0600, Jason Wessel wrote:
> 
> The issue here is that in a multilib build the ${base_libdir} is resolving to /lib64 which completely breaks some tools that fully expect /lib/modules to be a fixed location regardless if the target is 32/64 or something else.
>

I would expect the kernel to be ok with this change if we provide the kernel command
line parameter: "firmware_class.path=${base_libdir}" or similar.

Could you please list the other tools that could break with this change?

> It may be fixable by using, ${nonarch_base_libdir}, but it wasn't quite that simple because it didn't fully work for the firmware loader so for now it would be best to just revert the two patches and keep oe-core working.
>
> Cheers,
> Jason.

Best Regards,
Maxin

> 
> On 01/19/2017 03:14 PM, Jason Wessel wrote:
> >This reverts commit 0ccb2efe9837e2915c093341a662dffc1df00866.
> >
> >The OVS fails to function and the kernel modules cannot be found by
> >any of the kernel tools such as depmod because they are installed
> >into the wrong directory in multilib 64bit/32bit bulids.
> >
> >Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> >---
> >  meta/classes/kernel-module-split.bbclass |  2 +-
> >  meta/classes/kernel.bbclass              | 12 ++++++------
> >  2 files changed, 7 insertions(+), 7 deletions(-)
> >
> >diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
> >index 0e4e110f0c..efe1b42656 100644
> >--- a/meta/classes/kernel-module-split.bbclass
> >+++ b/meta/classes/kernel-module-split.bbclass
> >@@ -127,7 +127,7 @@ python split_kernel_module_packages () {
> >      postinst = d.getVar('pkg_postinst_modules')
> >      postrm = d.getVar('pkg_postrm_modules')
> >-    modules = do_split_packages(d, root='${base_libdir}/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION")))
> >+    modules = do_split_packages(d, root='/lib/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='kernel-%s' % (d.getVar("KERNEL_VERSION")))
> >      if modules:
> >          metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE')
> >          d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
> >diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> >index 74517e8d92..3630042dbd 100644
> >--- a/meta/classes/kernel.bbclass
> >+++ b/meta/classes/kernel.bbclass
> >@@ -296,11 +296,11 @@ kernel_do_install() {
> >  	#
> >  	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> >  	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
> >-		oe_runmake DEPMOD=echo MODLIB=${D}${base_libdir}/modules/${KERNEL_VERSION} INSTALL_FW_PATH=${D}${base_libdir}/firmware modules_install
> >-		rm "${D}${base_libdir}/modules/${KERNEL_VERSION}/build"
> >-		rm "${D}${base_libdir}/modules/${KERNEL_VERSION}/source"
> >+		oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" modules_install
> >+		rm "${D}/lib/modules/${KERNEL_VERSION}/build"
> >+		rm "${D}/lib/modules/${KERNEL_VERSION}/source"
> >  		# If the kernel/ directory is empty remove it to prevent QA issues
> >-		rmdir --ignore-fail-on-non-empty "${D}${base_libdir}/modules/${KERNEL_VERSION}/kernel"
> >+		rmdir --ignore-fail-on-non-empty "${D}/lib/modules/${KERNEL_VERSION}/kernel"
> >  	else
> >  		bbnote "no modules to install"
> >  	fi
> >@@ -478,7 +478,7 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
> >  # kernel-image becomes kernel-image-${KERNEL_VERSION}
> >  PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev kernel-modules"
> >  FILES_${PN} = ""
> >-FILES_kernel-base = "${base_libdir}/modules/${KERNEL_VERSION}/modules.order ${base_libdir}/modules/${KERNEL_VERSION}/modules.builtin"
> >+FILES_kernel-base = "/lib/modules/${KERNEL_VERSION}/modules.order /lib/modules/${KERNEL_VERSION}/modules.builtin"
> >  FILES_kernel-image = ""
> >  FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build"
> >  FILES_kernel-vmlinux = "/boot/vmlinux-${KERNEL_VERSION_NAME}"
> >@@ -511,7 +511,7 @@ pkg_postinst_kernel-base () {
> >  PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
> >  python split_kernel_packages () {
> >-    do_split_packages(d, root='${base_libdir}/firmware', file_regex='^(.*)\.(bin|fw|cis|csp|dsp)$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
> >+    do_split_packages(d, root='/lib/firmware', file_regex='^(.*)\.(bin|fw|cis|csp|dsp)$', output_pattern='kernel-firmware-%s', description='Firmware for %s', recursive=True, extra_depends='')
> >  }
> >  # Many scripts want to look in arch/$arch/boot for the bootable
> 
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

