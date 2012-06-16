Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1Sfx4r-0007HY-KG
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Jun 2012 19:46:26 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga09.intel.com with ESMTP/TLS/RC4-MD5; 16 Jun 2012 10:34:40 -0700
Received: by pbbro8 with SMTP id ro8so6486966pbb.25
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jun 2012 10:34:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:organization:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=ODxuCjELrn5O7ekw3nebs6sdFoG5FD30ksk0/l7gF6c=;
	b=noUfui3/LnWIYioxvBs3rhXZ8MsdCFIBs98UsuS5J+9v0lD2TMtfvz9O/Cz0fudtv8
	XglxypfahzcJE/nkVJz61DEc/PL2TantfMLd9LXl70/41DF8onobRfdGnQwRjCn18GB0
	iTPaGSQL9J7EJ6HV6IHwhDIhImxUWcn2AhIm+Un2zdj3JfUH4jEsXijtaQrFgbMIxQ3b
	fxIXqsnVJ53A8C4Z/nhLwu/GZR8AxIzt+awDysh+LdKReI8ENg/KYqYygnCUX91J8UR6
	Bk2CcNvZGbHJ6tOue8/OyFKkmQuJAJUPeNyBWirU8wa6b2aDpPOXCXLE649HHFaAEFnR
	aYjA==
Received: by 10.68.236.102 with SMTP id ut6mr10288118pbc.113.1339868080564;
	Sat, 16 Jun 2012 10:34:40 -0700 (PDT)
Received: from [10.6.18.71] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id pg3sm17458408pbc.2.2012.06.16.10.34.37
	(version=SSLv3 cipher=OTHER); Sat, 16 Jun 2012 10:34:38 -0700 (PDT)
Message-ID: <4FDCC3AC.9030703@intel.com>
Date: Sat, 16 Jun 2012 10:34:36 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1339791495.git.bruce.ashfield@windriver.com>
	<40732c1c548493a69d437f3fbb125affa338b3e9.1339791495.git.bruce.ashfield@windriver.com>
In-Reply-To: <40732c1c548493a69d437f3fbb125affa338b3e9.1339791495.git.bruce.ashfield@windriver.com>
X-Gm-Message-State: ALoCoQmgOEfJAbtDmLJ8Ava9QpMA85mOTYWsOqTn3jwDoVvFwDrXWZXrPatnnMy09vkcpErerWka
Cc: liang.li@windriver.com
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
X-List-Received-Date: Sat, 16 Jun 2012 17:46:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/15/2012 01:23 PM, Bruce Ashfield wrote:
> From: Liang Li<liang.li@windriver.com>
>
> perf has been coupled to the kernel packages via kernel.bbclass.
> While maintaining the build of perf out of the kernel source tree
> is desired the package coupling has proved to be awkward in
> several situations such as:
>
>    - when a kernel recipe doesn't want to build/provide perf
>    - when licensing of dependencies would prohibit perf and hence
>      the kernel from being built.
>
> To solve some of these problems, this recipe is the extraction of
> the linux-tools.inc provided perf compilation into a standalone
> perf recipe that builds out of the kernel source, but is otherwise
> independent.
>
> No new functionality is provided above what the linux-tools.inc
> variant provided, but the separate recipe provides baseline for
> adding new functionality.
>
> Signed-off-by: Liang Li<liang.li@windriver.com>
> Signed-off-by: Bruce Ashfield<bruce.ashfield@windriver.com>
> ---
>   meta/classes/kernel.bbclass          |    7 +----
>   meta/recipes-kernel/perf/perf_3.4.bb |   52 ++++++++++++++++++++++++++++++++++
>   2 files changed, 53 insertions(+), 6 deletions(-)
>   create mode 100644 meta/recipes-kernel/perf/perf_3.4.bb
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 116e10b..02234df 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -469,7 +469,7 @@ python populate_packages_prepend () {
>   	metapkg = "kernel-modules"
>   	d.setVar('ALLOW_EMPTY_' + metapkg, "1")
>   	d.setVar('FILES_' + metapkg, "")
> -	blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux', 'perf', 'perf-dbg', 'kernel-misc' ]
> +	blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux', 'kernel-misc' ]
>   	for l in module_deps.values():
>   		for i in l:
>   			pkg = module_pattern % legitimize_package_name(re.match(module_regex, os.path.basename(i)).group(1))
> @@ -548,8 +548,3 @@ addtask deploy before do_build after do_install
>
>   EXPORT_FUNCTIONS do_deploy
>
> -# perf must be enabled in individual kernel recipes
> -PACKAGES =+ "perf-dbg perf"
> -FILES_perf = "${bindir}/* \
> -              ${libexecdir}"
> -FILES_perf-dbg = "${FILES_${PN}-dbg}"
> diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/perf/perf_3.4.bb
> new file mode 100644
> index 0000000..9c8ceb0
> --- /dev/null
> +++ b/meta/recipes-kernel/perf/perf_3.4.bb
> @@ -0,0 +1,52 @@
> +SUMMARY = "Performance analysis tools for Linux"
> +DESCRIPTION = "Performance counters for Linux are a new kernel-based \
> +subsystem that provide a framework for all things \
> +performance analysis. It covers hardware level \
> +(CPU/PMU, Performance Monitoring Unit) features \
> +and software features (software counters, tracepoints) \
> +as well."
> +
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
> +
This fails to find the correct file in the poky-lsb case, not sure what 
is going on yet, but here is the error from the autobuilder.

ERROR: Function failed: perf: LIC_FILES_CHKSUM points to an invalid 
file: 
/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/sysroots/qemux86/kernel/source/COPYING
NOTE: package perf-3.4-r0: task do_configure: Failed
ERROR: Task 3336 
(/srv/home/pokybuild/yocto-autobuilder/yocto-slave/nightly-x86/build/meta/recipes-kernel/perf/perf_3.4.bb, 
do_configure) failed with exit code '1'

This can be reproduced by setting DISTRO="poky-lsb" in your local.conf

Please investigate, thanks

	Sau!


> +PR = "r0"
> +
> +BUILDPERF_libc-uclibc = "no"
> +
> +PERFDEPENDS = " \
> +virtual/${MLPREFIX}libc:do_populate_sysroot \
> +${MLPREFIX}elfutils:do_populate_sysroot \
> +${MLPREFIX}binutils:do_populate_sysroot \
> +"
> +RDEPENDS += "elfutils perl python"
> +
> +PROVIDES = "virtual/perf"
> +
> +S = "${STAGING_KERNEL_DIR}/source"
> +B = "${WORKDIR}/${BPN}-${PV}"
> +
> +EXTRA_OEMAKE = \
> +		'-C ${S}/tools/perf \
> +		O=${B} \
> +		CROSS_COMPILE=${TARGET_PREFIX} \
> +		ARCH=${TARGET_ARCH} \
> +		CC="${CC}" \
> +		AR="${AR}" \
> +		prefix=/usr \
> +		NO_GTK2=1 NO_NEWT=1 NO_DWARF=1 \
> +		'
> +
> +do_configure[depends] = "virtual/kernel:do_populate_sysroot"
> +
> +do_compile() {
> +	oe_runmake all
> +}
> +
> +do_compile[depends] = "${PERFDEPENDS}"
> +
> +do_install() {
> +	oe_runmake DESTDIR=${D} install
> +}
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +



