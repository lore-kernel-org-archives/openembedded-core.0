Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1610565D72
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 18:33:47 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 07 Jan 2015 10:30:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,716,1413270000"; d="scan'208";a="647724917"
Received: from dvhart-mac02.jf.intel.com (HELO [10.24.4.73]) ([10.24.4.73])
	by fmsmga001.fm.intel.com with ESMTP; 07 Jan 2015 10:33:20 -0800
User-Agent: Microsoft-MacOutlook/14.4.6.141106
Date: Wed, 07 Jan 2015 10:33:19 -0800
From: Darren Hart <dvhart@linux.intel.com>
Sender: "Hart, Darren" <darren.hart@intel.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Message-ID: <D0D2B965.B6633%darren.hart@intel.com>
Thread-Topic: RFC: Further kernel build process changes?
References: <1420633589.25779.69.camel@linuxfoundation.org>
	<54AD331F.5060009@windriver.com>
In-Reply-To: <54AD331F.5060009@windriver.com>
Mime-version: 1.0
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
X-List-Received-Date: Wed, 07 Jan 2015 18:33:56 -0000
Content-type: text/plain;
	charset="ISO-8859-1"
Content-transfer-encoding: quoted-printable


On 1/7/15, 5:22 AM, "Bruce Ashfield" <bruce.ashfield@windriver.com> wrote:

>On 2015-01-07 7:26 AM, Richard Purdie wrote:
>> I'm hearing (somewhat justified) complaints that the recent kernel
>> changes have destablised builds. Part of the question is whether the
>> recent changes are as clear to users as they could be, we're also
>> running into some problems due to mixing kernel source and build
>> artefacts in some places and not in others.
>
>And we've been bitten by the sheer diversity in the various additions
>and tweaks to the kernel build process .. which when wading in to try
>and make some improvements was always the risk :(
>
>>
>> At this point I think it may be worth looking at making some more
>> invasive but decisive changes, specifically that:
>>
>> STAGING_KERNEL_DIR moves
>>     from sysroots/MACHINE/usr/src/kernel
>>     to work-shared/MACHINE/kernel-source
>>
>> This is to make it clearer that the source here is not under the control
>> of sstate. The reasons why we don't want it under the control of sstate
>> are in other emails.
>
>I'm in agreement here.


I would prefer this approach as well.


>> The second change would be to split the kernel source into two:
>>
>> work-shared/MACHINE/kernel-source
>> work-shared/MACHINE/kernel-build
>>
>> where kernel-build is the kernel build output and kernel-source is kept
>> "pristine".
>>
>> This means the defconfig, the kernel-abiversion, System.map files and
>> output from "make scripts" would be in kernel-build.
>
>Exactly. When setting up the minimal external module build environment,
>to keep the impact in the shared directories small, I went with the
>current approach.
>
>Since we are breaking workflows with it .. this would be a good balance
>between the old and new efforts. I started mocking this up over the
>holidays
>but lost a week due to illness. I'll continue running with this now.


Also in agreement here, keeping the sourcedir pristine should reduce
confusion and complexity elsewhere.


>>
>> External module builds do work in this configuration *if* you pass in
>> the correct options e.g.:
>>
>> make -C work-shared/MACHINE/kernel-source
>>O=3Dwork-shared/MACHINE/kernel-build M=3D${S}
>>
>> I've put together a quick proof of concept of this below.


I was concerned about how this would impact hello-mod and recipes modeled
after it, however, in reviewing the patch below, it looks to have this
covered. I=B9ll verify this just as soon as my workstation is available
(it=B9s =B3busy=B2 updating=8A sigh).


>>
>> There are two other things up for discussion. There is of confusion  on
>> how the kernel source gets into STAGING_KERNEL_DIR in the first place.
>> We've added in "munging" code which does this in kernel.bbclass,
>> linux-yocto also has its share of "crazy" mess in this regard.
>
>:)
>
>>
>> We could wipe the slate clean and require that people put a parameter
>> against the element in SRC_URI that represents the kernel indicating it
>> should be directly extracted to STAGING_KERNEL_DIR. There is a bitbake
>> issue with being unable to override the extraction directory at present
>> but that can be fixed. The upside is that it would be clean, relatively
>> clear and allow  fragile code to be dropped. The downside is it means
>> tweaking all kernel recipes.


I=B9m concerned about adding yet more complexity to the SRC_URI=8A I don=B9t
have a better proposal though. Part of this fix will need to include fixes
to the kernel-dev manual, I can take that on once we hash this out.


>>
>> The second issue is that of the dependency to populate
>> STAGING_KERNEL_DIR which is now a "depends flag on do_install". The
>> intent is to have kernelsrc.bbclass do this, looking at the things there
>> (such as setting S=3D), I suspect it may not be fit for purpose. We could
>> adjust the class to check for a variable and set up the dependency if
>> its set.
>>
>> Anyhow, this does need thought and discussion but I'm putting it here as
>> a start to that, and to let people like Bruce see and experiment with
>> the code below.
>
>I'll blend your RFC with what I have on the cooker today and see if I
>can get a patch out ASAP.
>
>I still think it is worth working through these issues and pushing
>forward, we risk slipping deeper into the release if we drop everything
>and start over.
>
>As we all know, the code is complex and we have many workflows
>to support, and I know I'm churning as fast as I can on fixes.
>
>Bruce


A couple of first pass questions below=8A prior to applying and testing
myself...


>
>>
>> Cheers,
>>
>> Richard
>>
>> diff --git a/meta/classes/kernel-module-split.bbclass
>>b/meta/classes/kernel-module-split.bbclass
>> index 9a95b72..2d43b51 100644
>> --- a/meta/classes/kernel-module-split.bbclass
>> +++ b/meta/classes/kernel-module-split.bbclass
>> @@ -70,7 +70,7 @@ python split_kernel_module_packages () {
>>           m =3D kerverrexp.match(kernelver)
>>           if m:
>>               kernelver_stripped =3D m.group(1)
>> -        staging_kernel_dir =3D d.getVar("STAGING_KERNEL_DIR", True)
>> +        staging_kernel_dir =3D d.getVar("STAGING_KERNEL_BUILDDIR", True)
>>           system_map_file =3D "%s/boot/System.map-%s" % (dvar, kernelver)
>>           if not os.path.exists(system_map_file):
>>               system_map_file =3D "%s/System.map-%s" %
>>(staging_kernel_dir, kernelver)
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 5cabc2c..b1a1ccf 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -249,6 +249,10 @@ kernel_do_install() {
>>   	cp .config $kerneldir/
>>   	mkdir -p $kerneldir/include/config
>>   	cp include/config/kernel.release
>>$kerneldir/include/config/kernel.release
>> +	if [ -e include/linux/version.h ]; then
>> +		mkdir -p $kerneldir/include/linux
>> +		cp include/linux/version.h $kerneldir/include/linux/version.h
>> +	fi


I know this bit someone with the recent changes, let=B9s make sure we add a
comment as to why this is required so we don=B9t have to dig it out of the
archives in a year when we=B9re doing another round of fixes in this area.


>>
>>   	# As of Linux kernel version 3.0.1, the clean target removes
>>   	# arch/powerpc/lib/crtsavres.o which is present in
>> @@ -268,6 +272,45 @@ kernel_do_install() {
>>   }
>>   do_install[prefuncs] +=3D "package_get_auto_pr"
>>
>> +addtask do_shared_workdir after do_compile before do_install
>> +
>> +do_shared_workdir () {
>> +	cd ${B}
>> +
>> +	kerneldir=3D${STAGING_KERNEL_BUILDDIR}
>> +	install -d $kerneldir
>> +
>> +	#
>> +	# Store the kernel version in sysroots for module-base.bbclass
>> +	#
>> +

OK, how does this impact the dependency on do_install=8A As we=B9re doing
stuff for building modules here, can that now depend on do_shared_workdir?

>> +	echo "${KERNEL_VERSION}" > $kerneldir/kernel-abiversion
>> +	
>> +	# Copy files required for module builds
>> +	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
>> +	cp Module.symvers $kerneldir/
>> +	cp .config $kerneldir/
>> +	mkdir -p $kerneldir/include/config
>> +	cp include/config/kernel.release
>>$kerneldir/include/config/kernel.release
>> +
>> +	# As of Linux kernel version 3.0.1, the clean target removes
>> +	# arch/powerpc/lib/crtsavres.o which is present in
>> +	# KBUILD_LDFLAGS_MODULE, making it required to build external modules.
>> +	if [ ${ARCH} =3D "powerpc" ]; then
>> +		mkdir -p $kerneldir/arch/powerpc/lib/
>> +		cp arch/powerpc/lib/crtsavres.o
>>$kerneldir/arch/powerpc/lib/crtsavres.o
>> +	fi
>> +
>> +	mkdir -p $kerneldir/include/generated/
>> +	cp -fR include/generated/* $kerneldir/include/generated/
>> +
>> +	if [ -d arch/${ARCH}/include/generated ]; then
>> +		mkdir -p $kerneldir/arch/${ARCH}/include/generated/
>> +		cp -fR arch/${ARCH}/include/generated/*
>>$kerneldir/arch/${ARCH}/include/generated/
>> +	fi


Some of the above is also present in do_install, do we need it in both
places? If so, we should abstract it if possible to avoid duplication and
risk of only one changing in the future when both should.


>> +}
>> +
>> +
>>   python sysroot_stage_all () {
>>       oe.path.copyhardlinktree(d.expand("${D}${KERNEL_SRC_PATH}"),
>>d.expand("${SYSROOT_DESTDIR}${KERNEL_SRC_PATH}"))
>>   }
>> diff --git a/meta/classes/module-base.bbclass
>>b/meta/classes/module-base.bbclass
>> index 9537ba9..c34eee7 100644
>> --- a/meta/classes/module-base.bbclass
>> +++ b/meta/classes/module-base.bbclass
>> @@ -3,16 +3,18 @@ inherit kernel-arch
>>   export OS =3D "${TARGET_OS}"
>>   export CROSS_COMPILE =3D "${TARGET_PREFIX}"
>>
>> -export KERNEL_VERSION =3D
>>"${@base_read_file('${STAGING_KERNEL_DIR}/kernel-abiversion')}"
>> +export KERNEL_VERSION =3D
>>"${@base_read_file('${STAGING_KERNEL_BUILDDIR}/kernel-abiversion')}"
>>   KERNEL_OBJECT_SUFFIX =3D ".ko"
>>
>>   # kernel modules are generally machine specific
>>   PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>
>> +do_configure[depends] +=3D "virtual/kernel:do_install"


I=B9m not clear on the separation of do_shared_workdir and do_install now...


>> +
>>   # Function to ensure the kernel scripts are created. Expected to
>>   # be called before do_compile. See module.bbclass for an exmaple.
>>   do_make_scripts() {
>>   	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>>   	make CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" AR=3D"${KERNEL_AR}" \
>> -	           -C ${STAGING_KERNEL_DIR} scripts
>> +	           -C ${STAGING_KERNEL_DIR} O=3D${STAGING_KERNEL_BUILDDIR}
>>scripts
>>   }
>> diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
>> index ad6f7af..4f466d7 100644
>> --- a/meta/classes/module.bbclass
>> +++ b/meta/classes/module.bbclass
>> @@ -13,6 +13,7 @@ module_do_compile() {
>>   		   KERNEL_VERSION=3D${KERNEL_VERSION}    \
>>   		   CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" \
>>   		   AR=3D"${KERNEL_AR}" \
>> +	           O=3D${STAGING_KERNEL_BUILDDIR} \
>>   		   ${MAKE_TARGETS}
>>   }
>>
>> @@ -21,6 +22,7 @@ module_do_install() {
>>   	oe_runmake DEPMOD=3Decho INSTALL_MOD_PATH=3D"${D}" \
>>   	           KERNEL_SRC=3D${STAGING_KERNEL_DIR} \
>>   	           CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" \
>> +	           O=3D${STAGING_KERNEL_BUILDDIR} \
>>   	           modules_install
>>   }
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 362d6b6..b1135c2 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -394,7 +394,8 @@ SDKPATHNATIVE =3D "${SDKPATH}/sysroots/${SDK_SYS}"
>>   ##################################################################
>>
>>   OLDEST_KERNEL =3D "2.6.32"
>> -STAGING_KERNEL_DIR =3D "${STAGING_DIR_HOST}/usr/src/kernel"
>> +STAGING_KERNEL_DIR =3D "${TMPDIR}/work-shared/${MACHINE}/kernel-source"
>> +STAGING_KERNEL_BUILDDIR =3D
>>"${TMPDIR}/work-shared/${MACHINE}/kernel-build"
>>
>>   ##################################################################
>>   # Specific image creation and rootfs population info.
>> diff --git a/meta/recipes-kernel/lttng/lttng-modules/sepbuild.patch
>>b/meta/recipes-kernel/lttng/lttng-modules/sepbuild.patch
>> new file mode 100644
>> index 0000000..1b46558
>> --- /dev/null
>> +++ b/meta/recipes-kernel/lttng/lttng-modules/sepbuild.patch
>> @@ -0,0 +1,17 @@
>> +Index: git/Makefile
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- git.orig/Makefile
>> ++++ git/Makefile
>> +@@ -67,10 +67,10 @@ else # KERNELRELEASE
>> + 	CFLAGS =3D $(EXTCFLAGS)
>> +
>> + default:
>> +-	$(MAKE) -C $(KERNEL_SRC) M=3D$(PWD) modules
>> ++	$(MAKE) -C $(KERNEL_SRC) M=3D$(PWD) O=3D$(O) modules
>> +
>> + modules_install:
>> +-	$(MAKE) -C $(KERNEL_SRC) M=3D$(PWD) modules_install
>> ++	$(MAKE) -C $(KERNEL_SRC) M=3D$(PWD) O=3D$(O) modules_install
>> +
>> + clean:
>> + 	$(MAKE) -C $(KERNEL_SRC) M=3D$(PWD) clean
>> diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.5.2.bb
>>b/meta/recipes-kernel/lttng/lttng-modules_2.5.2.bb
>> index 55df07f..58a4196 100644
>> --- a/meta/recipes-kernel/lttng/lttng-modules_2.5.2.bb
>> +++ b/meta/recipes-kernel/lttng/lttng-modules_2.5.2.bb
>> @@ -19,6 +19,7 @@ SRC_URI =3D
>>"git://git.lttng.org/lttng-modules.git;branch=3Dstable-2.5 \
>>             =20
>>file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
>>             =20
>>file://Fix-noargs-probes-should-calculate-alignment-and-eve.patch \
>>             =20
>>file://Update-kvm-instrumentation-compile-on-3.17-rc1.patch \
>> +           file://sepbuild.patch \
>>              "
>>
>>   export INSTALL_MOD_DIR=3D"kernel/lttng-modules"
>>
>



