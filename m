Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Snzhc-0008LN-O6
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 00:11:40 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 Jul 2012 15:00:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="162806145"
Received: from unknown (HELO [10.255.12.157]) ([10.255.12.157])
	by orsmga001.jf.intel.com with ESMTP; 08 Jul 2012 15:00:29 -0700
Message-ID: <4FFA02FD.20803@linux.intel.com>
Date: Sun, 08 Jul 2012 15:00:29 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <a2ba99c6c2be42f7d30f5827361b0a6892659997.1341606068.git.tom.zanussi@intel.com>
	<ad53f92454d7311ad5e8531b46e150e0bb5d4611.1341606068.git.tom.zanussi@intel.com>
In-Reply-To: <ad53f92454d7311ad5e8531b46e150e0bb5d4611.1341606068.git.tom.zanussi@intel.com>
Subject: Re: [PATCH 2/3] perf: add arch-specific perf-scripting feature
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
X-List-Received-Date: Sun, 08 Jul 2012 22:11:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/06/2012 01:29 PM, tom.zanussi@intel.com wrote:
> From: Tom Zanussi <tom.zanussi@intel.com>
>
> Add a new architecture-specific feature named 'perf-scripting'.
> Adding this into the perf_features_by_arch table in perf.inc for a
> given arch will enable perf scripting on a target built for that arch,
> which will turn on all the language bindings currently aavailable in
> perf (Perl and Python), if perf is included in an image.
>
> If 'perf-scripting' isn't named as a feature (the default), all perf
> language bindings will be disabled and unavailable.
>
> Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
> ---
>   meta/recipes-kernel/perf/perf_3.4.bb |   12 +++++++++---
>   1 files changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/perf/perf_3.4.bb
> index d494243..a79e9e6 100644
> --- a/meta/recipes-kernel/perf/perf_3.4.bb
> +++ b/meta/recipes-kernel/perf/perf_3.4.bb
> @@ -9,7 +9,7 @@ as well."
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
>
> -PR = "r1"
> +PR = "r2"
>
>   require perf.inc
>
> @@ -21,7 +21,8 @@ DEPENDS = "virtual/kernel \
>              ${MLPREFIX}binutils \
>             "
>
> -RDEPENDS_${PN} += "elfutils perl perl-modules python"
> +SCRIPTING_RDEPENDS = "${@perf_arch_supports_feature('perf-scripting', 'perl perl-modules python', '',d)}"
> +RDEPENDS_${PN} += "elfutils ${SCRIPTING_RDEPENDS}"
>
>   PROVIDES = "virtual/perf"
>
> @@ -45,6 +46,8 @@ export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version
>   S = "${STAGING_KERNEL_DIR}"
>   B = "${WORKDIR}/${BPN}-${PV}"
>
> +SCRIPTING_DEFINES = "${@perf_arch_supports_feature('perf-scripting', '', 'NO_LIBPERL=1 NO_LIBPYTHON=1',d)}"
> +
>   EXTRA_OEMAKE = \
>   		'-C ${S}/tools/perf \
>   		O=${B} \
> @@ -53,7 +56,7 @@ EXTRA_OEMAKE = \
>   		CC="${CC}" \
>   		AR="${AR}" \
>   		prefix=/usr \
> -		NO_GTK2=1 NO_NEWT=1 NO_DWARF=1 \
> +		NO_GTK2=1 NO_NEWT=1 NO_DWARF=1 ${SCRIPTING_DEFINES} \
>   		'
>
>   do_compile() {
> @@ -62,6 +65,9 @@ do_compile() {
>
>   do_install() {
>   	oe_runmake DESTDIR=${D} install
> +	if [ "${@perf_arch_supports_feature('perf-scripting', 1, 0, d)}" = "1" ]; then
> +		oe_runmake DESTDIR=${D} install-python_ext
> +	fi
>   }
>
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>

Tom,

I am not sure this one is working correctly, I this set of 3 in a build 
and it failed, so I bicested down to this patch.  I am still seeing the 
setup.py: Permission denied problem:
> | install scripts/python/bin/* -t '/srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/qemux86_64-poky-linux/perf-3.4-r3/image/usr/libexec/perf-core/scripts/python/bin'
> | make: Leaving directory `/srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/sysroots/qemux86-64/usr/src/kernel/tools/perf'
> | NOTE: make -j 16 -C /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/sysroots/qemux86-64/usr/src/kernel/tools/perf O=/srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/qemux86_64-poky-linux/perf-3.4-r3/perf-3.4 CROSS_COMPILE=x86_64-poky-linux- ARCH=x86 CC=x86_64-poky-linux-gcc    -m64 --sysroot=/srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/sysroots/qemux86-64 AR=x86_64-poky-linux-ar prefix=/usr NO_GTK2=1 NO_DWARF=1 DESTDIR=/srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/qemux86_64-poky-linux/perf-3.4-r3/image install-python_ext
> | make: Entering directory `/srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/sysroots/qemux86-64/usr/src/kernel/tools/perf'
> | util/setup.py --quiet install --root='//srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/qemux86_64-poky-linux/perf-3.4-r3/image'
> | make: execvp: util/setup.py: Permission denied
> | make: *** [install-python_ext] Error 127
> | make: Leaving directory `/srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/sysroots/qemux86-64/usr/src/kernel/tools/perf'
> | ERROR: oe_runmake failed
> | ERROR: Function failed: do_install (see /srv/ssd/sgw_ab/yocto-autobuilder/yocto-slave/nightly-x86-64/build/build/tmp/work/qemux86_64-poky-linux/perf-3.4-r3/temp/log.do_install.6037 for further information)


Sau!



