Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1Ucc9v-00068z-6S
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 15:54:24 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 15 May 2013 06:35:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,677,1363158000"; d="scan'208";a="241915861"
Received: from unknown (HELO [10.255.13.40]) ([10.255.13.40])
	by AZSMGA002.ch.intel.com with ESMTP; 15 May 2013 06:35:00 -0700
Message-ID: <1368624899.1607.8.camel@empanada>
From: Tom Zanussi <tom.zanussi@intel.com>
To: "Moseley, Drew" <drew_moseley@mentor.com>
Date: Wed, 15 May 2013 08:34:59 -0500
In-Reply-To: <58F22199-6AD3-4FB0-9344-43A7BD08D003@mentor.com>
References: <1368579545-16079-1-git-send-email-drew_moseley@mentor.com>
	<1368596392.25898.61.camel@ted>
	<58F22199-6AD3-4FB0-9344-43A7BD08D003@mentor.com>
X-Mailer: Evolution 3.4.1 (3.4.1-2.fc17) 
Mime-Version: 1.0
Cc: "Ashfield, Bruce" <Bruce.Ashfield@windriver.com>,
	"<openembedded-core@lists.openembedded.org>"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel: Package additional modules files needed for systemtap
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
X-List-Received-Date: Wed, 15 May 2013 13:54:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-05-15 at 13:23 +0000, Moseley, Drew wrote:
> On May 15, 2013, at 1:39 AM, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > On Tue, 2013-05-14 at 17:59 -0700, Drew Moseley wrote:
> >> Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
> >> ---
> >> meta/classes/kernel.bbclass |    8 +++++---
> >> 1 file changed, 5 insertions(+), 3 deletions(-)
> >> 
> >> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> >> index 6ba31bd..f23818e 100644
> >> --- a/meta/classes/kernel.bbclass
> >> +++ b/meta/classes/kernel.bbclass
> >> @@ -108,8 +108,6 @@ kernel_do_install() {
> >> 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> >> 	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
> >> 		oe_runmake DEPMOD=echo INSTALL_MOD_PATH="${D}" modules_install
> >> -		rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.order"
> >> -		rm -f "${D}/lib/modules/${KERNEL_VERSION}/modules.builtin"
> >> 		rm "${D}/lib/modules/${KERNEL_VERSION}/build"
> >> 		rm "${D}/lib/modules/${KERNEL_VERSION}/source"
> >> 	else
> >> @@ -259,7 +257,11 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
> >> # kernel-image becomes kernel-image-${KERNEL_VERISON}
> >> PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev"
> >> FILES = ""
> >> -FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
> >> +FILES_kernel-image = " \
> >> +	/boot/${KERNEL_IMAGETYPE}* \
> >> +	${base_libdir}/modules/${KERNEL_VERSION}/modules.order \
> >> +	${base_libdir}/modules/${KERNEL_VERSION}/modules.builtin \
> >> +"
> >> FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH}"
> >> FILES_kernel-vmlinux = "/boot/vmlinux*"
> >> RDEPENDS_kernel = "kernel-base"
> > 
> > Should these really be installed into every system with a kernel?
> > Doesn't systemtap also need other symbol information so these files
> > would be better off in whatever other packages systemtap also needs?
> > 
> > Cheers,
> > 
> > Richard
> 
> Running systemtap probes without these files results in warning such as the following when trying to install packages:
> 
> Installing kernel-image-3.5.7.11 (3.5.7.11+gitr4+524c7f7782e2c671cccab87aafa1ee41f7202aaf-r6) to root...
> Configuring kernel-image-3.5.7.11.
> WARNING: could not open /lib/modules/3.5.7.11/modules.order: No such file or directory
> WARNING: could not open /lib/modules/3.5.7.11/modules.builtin: No such file or directory
> 
> but I suspect systemtap is not the only place where these files are used.  Below is the description of these files from the kernel Documentation/kbuild/kbuild.txt and they seem valuable on any module based system.
> 
> modules.order
> --------------------------------------------------
> This file records the order in which modules appear in Makefiles. This
> is used by modprobe to deterministically resolve aliases that match
> multiple modules.
> 
> modules.builtin
> --------------------------------------------------
> This file lists all modules that are built into the kernel. This is used
> by modprobe to not fail when trying to load something builtin.
> 

Hmm, is this happening when using the crosstap script?  I haven't seen
it before..

If this is happening when trying to compile probes on the target, that
isn't really supported yet, but there's a bug open for it in 1.5: 

Bug 4442 - systemtap: make it usable on-target 

https://bugzilla.yoctoproject.org/show_bug.cgi?id=4442

Part of that would be to get all the debug symbols systemtap needs on
the target, which as Richard mentions would be overkill to install on
every system regardless of whether systemtap or something else that
needs the kernel debug symbols was also installed..

It's on my plate for 1.5, but I haven't really spend much time thinking
about it yet..

Tom


> 
> Regards,
> Drew




