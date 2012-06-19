Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Sh40J-0006mX-JJ
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 21:22:20 +0200
Received: by dalh21 with SMTP id h21so8425066dal.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2012 12:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Z7bbitLfl1vITpsRihhbiOEcEQq/TisMS2vxxsojIrE=;
	b=qsfgopmcB15uwN0lsyJ4I4jo1zN4grqbtU+OwabDw9s5cE+Awyj002hy3H+jjWG9gR
	Rk5NOP7G6yFLV672Hx/jjLhLFs7fQuYrDuxuyxBuDOk1Q5A2C0bR+s8IOzNwn6Iz0hD4
	uKkzyOcqNkpcRlBrV+hUDve8VNXyCOPCmHiJVnluN1T6nO7qQfbnhxhhz8c/Woydvd1r
	j97MSUyKbQGU/SZNmJeQO0uswaujQnyb3RBbMBH3BX93iK2H2h0Z/IxfB7qET6coZFGN
	EG7fslTZD6XDRHQOMiSxwvtrfIbXX/3b7jubwXL4DFL/J0fVRQTsdFQSpwYu0axppkVA
	uZzw==
MIME-Version: 1.0
Received: by 10.68.220.39 with SMTP id pt7mr67999232pbc.40.1340133094658; Tue,
	19 Jun 2012 12:11:34 -0700 (PDT)
Received: by 10.68.229.135 with HTTP; Tue, 19 Jun 2012 12:11:34 -0700 (PDT)
In-Reply-To: <4FDD4C11.30101@windriver.com>
References: <cover.1339791495.git.bruce.ashfield@windriver.com>
	<40732c1c548493a69d437f3fbb125affa338b3e9.1339791495.git.bruce.ashfield@windriver.com>
	<4FDCC3AC.9030703@intel.com> <4FDD4C11.30101@windriver.com>
Date: Tue, 19 Jun 2012 15:11:34 -0400
Message-ID: <CADkTA4MAoffXOVQi=7Y9zN=2-U7wDTo5ARGiGXOhwRYtzzZ0yw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Saul Wold <saul.wold@intel.com>
Cc: liang.li@windriver.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] recipes-kernel: make perf a standalone package
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
X-List-Received-Date: Tue, 19 Jun 2012 19:22:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Jun 16, 2012 at 11:16 PM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> On 12-06-16 1:34 PM, Saul Wold wrote:
>>
>> On 06/15/2012 01:23 PM, Bruce Ashfield wrote:
>>>
>>> From: Liang Li<liang.li@windriver.com>
>>>
>>> perf has been coupled to the kernel packages via kernel.bbclass.
>>> While maintaining the build of perf out of the kernel source tree
>>> is desired the package coupling has proved to be awkward in
>>> several situations such as:
>>>
>>> - when a kernel recipe doesn't want to build/provide perf
>>> - when licensing of dependencies would prohibit perf and hence
>>> the kernel from being built.
>>>
>>> To solve some of these problems, this recipe is the extraction of
>>> the linux-tools.inc provided perf compilation into a standalone
>>> perf recipe that builds out of the kernel source, but is otherwise
>>> independent.
>>>
>>> No new functionality is provided above what the linux-tools.inc
>>> variant provided, but the separate recipe provides baseline for
>>> adding new functionality.
>>>
>>> Signed-off-by: Liang Li<liang.li@windriver.com>
>>> Signed-off-by: Bruce Ashfield<bruce.ashfield@windriver.com>
>>> ---
>>> meta/classes/kernel.bbclass | 7 +----
>>> meta/recipes-kernel/perf/perf_3.4.bb | 52
>>> ++++++++++++++++++++++++++++++++++
>>> 2 files changed, 53 insertions(+), 6 deletions(-)
>>> create mode 100644 meta/recipes-kernel/perf/perf_3.4.bb
>>>
>>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>>> index 116e10b..02234df 100644
>>> --- a/meta/classes/kernel.bbclass
>>> +++ b/meta/classes/kernel.bbclass
>>> @@ -469,7 +469,7 @@ python populate_packages_prepend () {
>>> metapkg = "kernel-modules"
>>> d.setVar('ALLOW_EMPTY_' + metapkg, "1")
>>> d.setVar('FILES_' + metapkg, "")
>>> - blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base',
>>> 'kernel-vmlinux', 'perf', 'perf-dbg', 'kernel-misc' ]
>>> + blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base',
>>> 'kernel-vmlinux', 'kernel-misc' ]
>>> for l in module_deps.values():
>>> for i in l:
>>> pkg = module_pattern % legitimize_package_name(re.match(module_regex,
>>> os.path.basename(i)).group(1))
>>> @@ -548,8 +548,3 @@ addtask deploy before do_build after do_install
>>>
>>> EXPORT_FUNCTIONS do_deploy
>>>
>>> -# perf must be enabled in individual kernel recipes
>>> -PACKAGES =+ "perf-dbg perf"
>>> -FILES_perf = "${bindir}/* \
>>> - ${libexecdir}"
>>> -FILES_perf-dbg = "${FILES_${PN}-dbg}"
>>> diff --git a/meta/recipes-kernel/perf/perf_3.4.bb
>>> b/meta/recipes-kernel/perf/perf_3.4.bb
>>> new file mode 100644
>>> index 0000000..9c8ceb0
>>> --- /dev/null
>>> +++ b/meta/recipes-kernel/perf/perf_3.4.bb
>>> @@ -0,0 +1,52 @@
>>> +SUMMARY = "Performance analysis tools for Linux"
>>> +DESCRIPTION = "Performance counters for Linux are a new kernel-based \
>>> +subsystem that provide a framework for all things \
>>> +performance analysis. It covers hardware level \
>>> +(CPU/PMU, Performance Monitoring Unit) features \
>>> +and software features (software counters, tracepoints) \
>>> +as well."
>>> +
>>> +LICENSE = "GPLv2"
>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
>>> +
>>
>> This fails to find the correct file in the poky-lsb case, not sure what
>> is going on yet, but here is the error from the autobuilder.
>>
>> ERROR: Function failed: perf: LIC_FILES_CHKSUM points to an invalid
>> file:
>>
>> /srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/kernel/source/COPYING
>>
>> NOTE: package perf-3.4-r0: task do_configure: Failed
>> ERROR: Task 3336
>>
>> (/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/meta/recipes-kernel/perf/perf_3.4.bb,
>> do_configure) failed with exit code '1'
>>
>> This can be reproduced by setting DISTRO="poky-lsb" in your local.conf
>>
>> Please investigate, thanks
>
>
> I forced x11 off in my gdk-pixbuf (I couldn't fine the right DISTRO_FEATURE
> tweak to do it .. but I digress), and I was able to build poky-lsb
> just fine here.
>
> NOTE: Running task 2673 of 2674 (ID: 8,
> /home/bruce/poky/meta/recipes-core/images/core-image-minimal.bb, do_rootfs)
> NOTE: package core-image-minimal-1.0-r0: task do_rootfs: Started
> NOTE: package core-image-minimal-1.0-r0: task do_rootfs: Succeeded
> NOTE: Running noexec task 2674 of 2674 (ID: 5,
> /home/bruce/poky/meta/recipes-core/images/core-image-minimal.bb, do_build)
> NOTE: Tasks Summary: Attempted 2674 tasks of which 2595 didn't need to be
> rerun and all succeeded.
>
> Care to elaborate on what exactly the autobuilder runs that would
> trigger this .. and remember, I'm a kernel guy, so I'm not familiar
> with all the ins and outs of what you may or may not being doing to
> trigger this .. so the more specific you are, the easier it is for
> me to help out.
>
> (i.e. what image was I suppose to build ? Which MACHINE ?)
>
> But as of now, I can't reproduce this, and it looks like a dependency
> problem on the kernel sources that has never been triggered here, so
> you are going to need to help me .. help you.

Saul and I have worked out some of the details on this, I've reworked the perf
recipe to be less like the kernel.bbclass variant, and a better citizen of the
sysroot.

Once my testing completes, I'll resubmit the series.

Cheers,

Bruce

>
> Cheers,
>
> Bruce
>
>
>>
>> Sau!
>>
>>
>>> +PR = "r0"
>>> +
>>> +BUILDPERF_libc-uclibc = "no"
>>> +
>>> +PERFDEPENDS = " \
>>> +virtual/${MLPREFIX}libc:do_populate_sysroot \
>>> +${MLPREFIX}elfutils:do_populate_sysroot \
>>> +${MLPREFIX}binutils:do_populate_sysroot \
>>> +"
>>> +RDEPENDS += "elfutils perl python"
>>> +
>>> +PROVIDES = "virtual/perf"
>>> +
>>> +S = "${STAGING_KERNEL_DIR}/source"
>>> +B = "${WORKDIR}/${BPN}-${PV}"
>>> +
>>> +EXTRA_OEMAKE = \
>>> + '-C ${S}/tools/perf \
>>> + O=${B} \
>>> + CROSS_COMPILE=${TARGET_PREFIX} \
>>> + ARCH=${TARGET_ARCH} \
>>> + CC="${CC}" \
>>> + AR="${AR}" \
>>> + prefix=/usr \
>>> + NO_GTK2=1 NO_NEWT=1 NO_DWARF=1 \
>>> + '
>>> +
>>> +do_configure[depends] = "virtual/kernel:do_populate_sysroot"
>>> +
>>> +do_compile() {
>>> + oe_runmake all
>>> +}
>>> +
>>> +do_compile[depends] = "${PERFDEPENDS}"
>>> +
>>> +do_install() {
>>> + oe_runmake DESTDIR=${D} install
>>> +}
>>> +
>>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>>> +
>>
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


