Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C099865C66
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 21:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t07LFecF028818; Wed, 7 Jan 2015 21:15:40 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NZgIvfQN_gqM; Wed,  7 Jan 2015 21:15:40 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t07LFQx0028810
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 7 Jan 2015 21:15:38 GMT
Message-ID: <1420665363.25779.73.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Darren Hart <dvhart@linux.intel.com>
Date: Wed, 07 Jan 2015 21:16:03 +0000
In-Reply-To: <D0D2B965.B6633%darren.hart@intel.com>
References: <1420633589.25779.69.camel@linuxfoundation.org>
	<54AD331F.5060009@windriver.com> <D0D2B965.B6633%darren.hart@intel.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Further kernel build process changes?
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
X-List-Received-Date: Wed, 07 Jan 2015 21:16:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2015-01-07 at 10:33 -0800, Darren Hart wrote:
> On 1/7/15, 5:22 AM, "Bruce Ashfield" <bruce.ashfield@windriver.com> wrote:
> >On 2015-01-07 7:26 AM, Richard Purdie wrote:
> >>
> >> External module builds do work in this configuration *if* you pass in
> >> the correct options e.g.:
> >>
> >> make -C work-shared/MACHINE/kernel-source
> >>O=work-shared/MACHINE/kernel-build M=${S}
> >>
> >> I've put together a quick proof of concept of this below.
> 
> 
> I was concerned about how this would impact hello-mod and recipes modeled
> after it, however, in reviewing the patch below, it looks to have this
> covered. I¹ll verify this just as soon as my workstation is available
> (it¹s ³busy² updatingŠ sigh).

I have not tested that yet, however it is something we need to do, if it
has issues, I think they should be solvable.

> A couple of first pass questions belowŠ prior to applying and testing
> myself...
>
> >> diff --git a/meta/classes/kernel-module-split.bbclass
> >>b/meta/classes/kernel-module-split.bbclass
> >> index 9a95b72..2d43b51 100644
> >> --- a/meta/classes/kernel-module-split.bbclass
> >> +++ b/meta/classes/kernel-module-split.bbclass
> >> @@ -70,7 +70,7 @@ python split_kernel_module_packages () {
> >>           m = kerverrexp.match(kernelver)
> >>           if m:
> >>               kernelver_stripped = m.group(1)
> >> -        staging_kernel_dir = d.getVar("STAGING_KERNEL_DIR", True)
> >> +        staging_kernel_dir = d.getVar("STAGING_KERNEL_BUILDDIR", True)
> >>           system_map_file = "%s/boot/System.map-%s" % (dvar, kernelver)
> >>           if not os.path.exists(system_map_file):
> >>               system_map_file = "%s/System.map-%s" %
> >>(staging_kernel_dir, kernelver)
> >> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> >> index 5cabc2c..b1a1ccf 100644
> >> --- a/meta/classes/kernel.bbclass
> >> +++ b/meta/classes/kernel.bbclass
> >> @@ -249,6 +249,10 @@ kernel_do_install() {
> >>   	cp .config $kerneldir/
> >>   	mkdir -p $kerneldir/include/config
> >>   	cp include/config/kernel.release
> >>$kerneldir/include/config/kernel.release
> >> +	if [ -e include/linux/version.h ]; then
> >> +		mkdir -p $kerneldir/include/linux
> >> +		cp include/linux/version.h $kerneldir/include/linux/version.h
> >> +	fi
> 
> 
> I know this bit someone with the recent changes, let¹s make sure we add a
> comment as to why this is required so we don¹t have to dig it out of the
> archives in a year when we¹re doing another round of fixes in this area.

I know Bruce is not convinced about this part yet and talked with Otavio
a little. We could do something like this:

diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
index c34eee7..58ec3f4 100644
--- a/meta/classes/module-base.bbclass
+++ b/meta/classes/module-base.bbclass
@@ -11,10 +11,12 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 do_configure[depends] += "virtual/kernel:do_install"
 
+EXTRA_KERNELSRC_TARGETS = ""
+
 # Function to ensure the kernel scripts are created. Expected to
 # be called before do_compile. See module.bbclass for an exmaple.
 do_make_scripts() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS 
 	make CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
-	           -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} scripts
+	           -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} scripts ${EXTRA_KERNELSRC_TARGETS}
 }

and then Otavio could add EXTRA_KERNELSRC_TARGETS +=
"linux/kernel/version.h" to the two problematic recipes.

> >>   	# As of Linux kernel version 3.0.1, the clean target removes
> >>   	# arch/powerpc/lib/crtsavres.o which is present in
> >> @@ -268,6 +272,45 @@ kernel_do_install() {
> >>   }
> >>   do_install[prefuncs] += "package_get_auto_pr"
> >>
> >> +addtask do_shared_workdir after do_compile before do_install
> >> +
> >> +do_shared_workdir () {
> >> +	cd ${B}
> >> +
> >> +	kerneldir=${STAGING_KERNEL_BUILDDIR}
> >> +	install -d $kerneldir
> >> +
> >> +	#
> >> +	# Store the kernel version in sysroots for module-base.bbclass
> >> +	#
> >> +
> 
> OK, how does this impact the dependency on do_installŠ As we¹re doing
> stuff for building modules here, can that now depend on do_shared_workdir?

Yes, it can and the contents of do_install can be further pruned.

> >> +	echo "${KERNEL_VERSION}" > $kerneldir/kernel-abiversion
> >> +	
> >> +	# Copy files required for module builds
> >> +	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
> >> +	cp Module.symvers $kerneldir/
> >> +	cp .config $kerneldir/
> >> +	mkdir -p $kerneldir/include/config
> >> +	cp include/config/kernel.release
> >>$kerneldir/include/config/kernel.release
> >> +
> >> +	# As of Linux kernel version 3.0.1, the clean target removes
> >> +	# arch/powerpc/lib/crtsavres.o which is present in
> >> +	# KBUILD_LDFLAGS_MODULE, making it required to build external modules.
> >> +	if [ ${ARCH} = "powerpc" ]; then
> >> +		mkdir -p $kerneldir/arch/powerpc/lib/
> >> +		cp arch/powerpc/lib/crtsavres.o
> >>$kerneldir/arch/powerpc/lib/crtsavres.o
> >> +	fi
> >> +
> >> +	mkdir -p $kerneldir/include/generated/
> >> +	cp -fR include/generated/* $kerneldir/include/generated/
> >> +
> >> +	if [ -d arch/${ARCH}/include/generated ]; then
> >> +		mkdir -p $kerneldir/arch/${ARCH}/include/generated/
> >> +		cp -fR arch/${ARCH}/include/generated/*
> >>$kerneldir/arch/${ARCH}/include/generated/
> >> +	fi
> 
> Some of the above is also present in do_install, do we need it in both
> places? If so, we should abstract it if possible to avoid duplication and
> risk of only one changing in the future when both should.

do_shared_workdir would be specifically to populate
STAGING_KERNEL_BUILDDIR. 

do_install would become "for target use only" in the form of packages.
We may well defer all of that to the kernel-devsrc recipe. The patch was
a proof of concept, not a complete implementation. If there is any
commonality left, we need to share a function, agreed.

> >> +}
> >> +
> >> +
> >>   python sysroot_stage_all () {
> >>       oe.path.copyhardlinktree(d.expand("${D}${KERNEL_SRC_PATH}"),
> >>d.expand("${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}"))
> >>   }
> >> diff --git a/meta/classes/module-base.bbclass
> >>b/meta/classes/module-base.bbclass
> >> index 9537ba9..c34eee7 100644
> >> --- a/meta/classes/module-base.bbclass
> >> +++ b/meta/classes/module-base.bbclass
> >> @@ -3,16 +3,18 @@ inherit kernel-arch
> >>   export OS = "${TARGET_OS}"
> >>   export CROSS_COMPILE = "${TARGET_PREFIX}"
> >>
> >> -export KERNEL_VERSION =
> >>"${@base_read_file('${STAGING_KERNEL_DIR}/kernel-abiversion')}"
> >> +export KERNEL_VERSION =
> >>"${@base_read_file('${STAGING_KERNEL_BUILDDIR}/kernel-abiversion')}"
> >>   KERNEL_OBJECT_SUFFIX = ".ko"
> >>
> >>   # kernel modules are generally machine specific
> >>   PACKAGE_ARCH = "${MACHINE_ARCH}"
> >>
> >> +do_configure[depends] += "virtual/kernel:do_install"
> 
> 
> I¹m not clear on the separation of do_shared_workdir and do_install now...

See above, this probably needs to change.

The patch was really a test to see how badly a build would explode with
separate source and builddir and whether the kernel build system can
cope with three separate locations (source, build objects, module). From
that perspective it passed in that I could build oprofile, perf and some
kernel modules. From here we need a step back and to go through and do
it "properly".

Cheers,

Richard


