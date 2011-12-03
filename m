Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RWzI4-0003Kr-EA
	for openembedded-core@lists.openembedded.org;
	Sun, 04 Dec 2011 00:46:45 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 03 Dec 2011 15:39:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,291,1320652800"; d="scan'208";a="81941923"
Received: from unknown (HELO [10.255.15.251]) ([10.255.15.251])
	by azsmga001.ch.intel.com with ESMTP; 03 Dec 2011 15:39:58 -0800
Message-ID: <4EDAB34E.6050103@linux.intel.com>
Date: Sat, 03 Dec 2011 15:39:58 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1322840490.git.jiajun.xu@intel.com>
	<658bdcf24a1ade76126924fcb937c50abce6d08d.1322840490.git.jiajun.xu@intel.com>
In-Reply-To: <658bdcf24a1ade76126924fcb937c50abce6d08d.1322840490.git.jiajun.xu@intel.com>
Subject: Re: [PATCH 1/3] ltp: Add recipe from OE
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
X-List-Received-Date: Sat, 03 Dec 2011 23:46:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/02/2011 07:54 AM, Jiajun Xu wrote:
> Port ltp recipe from OE and upgraged to latest version(20110915).
> Install ltp into ${D}/opt/ltp and POSIX test suite is also copied
> into ${D}/opt/ltp/testcases.
>
> TODO: Some cases are removed since they depend on command 'expect'.
> It is not in Poky or OE and we will add it for enhancement next.
>
> Signed-off-by: Jiajun Xu<jiajun.xu@intel.com>
> ---
>   meta/recipes-extended/ltp/ltp_20110915.bb |   67 +++++++++++++++++++++++++++++
>   1 files changed, 67 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-extended/ltp/ltp_20110915.bb
>
> diff --git a/meta/recipes-extended/ltp/ltp_20110915.bb b/meta/recipes-extended/ltp/ltp_20110915.bb
> new file mode 100644
> index 0000000..ff5ea47
> --- /dev/null
> +++ b/meta/recipes-extended/ltp/ltp_20110915.bb
> @@ -0,0 +1,67 @@
> +SUMMARY = "Linux Test Project"
> +DESCRIPTION = "The Linux Test Project is a joint project with SGI, IBM, OSDL, and Bull with a goal to deliver test suites to the open source community that validate the reliability, robustness, and stability of Linux. The Linux Test Project is a collection of tools for testing the Linux kernel and related features."
> +HOMEPAGE = "http://ltp.sourceforge.net"
> +SECTION = "console/utils"
> +
> +PR = "r0"
> +
> +LICENSE = "GPLv2&  GPLv2+&  LGPLv2+&  LGPLv2.1+&  BSD-2-Clause"
> +SRC_URI = "${SOURCEFORGE_MIRROR}/ltp/ltp-full-${PV}.bz2"
> +

SRC_URI should go below the LIC_FILES_CHKSUM.

> +LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
> +		    file://testcases/kernel/mce-test/COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
> +		    file://testcases/kernel/controllers/freezer/COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
> +		    file://testcases/kernel/controllers/freezer/run_freezer.sh;startline=5;endline=17;md5=aeac3f7691caa2e76fd5a732fbd6510d \
> +		    file://testcases/kernel/fs/ext4-new-features/ffsb-6.0-rc2/COPYING;md5=c46082167a314d785d012a244748d803 \
> +		    file://testcases/kernel/hotplug/memory_hotplug/COPYING;md5=e04a2e542b2b8629bf9cd2ba29b0fe41 \
> +		    file://testcases/kernel/hotplug/cpu_hotplug/COPYING;md5=e04a2e542b2b8629bf9cd2ba29b0fe41 \
> +		    file://testcases/open_posix_testsuite/COPYING;md5=216e43b72efbe4ed9017cc19c4c68b01 \
> +		    file://tools/netpipe-2.4/COPYING;md5=18810669f13b87348459e611d31ab760 \
> +		    file://tools/netpipe-2.4-ipv6/COPYING;md5=18810669f13b87348459e611d31ab760 \
> +		    file://tools/top-LTP/proc/COPYING;md5=6e29c688d912da12b66b73e32b03d812 \
> +		    file://tools/pounder21/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
> +		    file://utils/benchmark/kernbench-0.42/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
> +		"
> +
> +SRC_URI[md5sum] = "582fb78d7bf78a624a4387f29327d166"
> +SRC_URI[sha256sum] = "013f7f2f6fdf46b7d73216533c3d4c2d91f0a2cec522bf026f7c8920ede83d2c"
> +
> +export prefix = "/opt/ltp"
> +export exec_prefix = "/opt/ltp"
> +
> +inherit autotools
> +
> +FILES_${PN}-dbg += "/opt/ltp/runtest/.debug"
> +FILES_${PN}-dbg += "/opt/ltp/testcases/bin/.debug"
> +FILES_${PN}-dbg += "/opt/ltp/testcases/bin/*/bin/.debug"
> +FILES_${PN}-dbg += "/opt/ltp/testcases/bin/*/test/.debug"
> +FILES_${PN}-dbg += "/opt/ltp/scenario_groups/.debug"
> +FILES_${PN}-dbg += "/opt/ltp/testscripts/.debug"
> +FILES_${PN}-dbg += "/opt/ltp/testscripts/open_posix_testsuite/.debug"
> +
> +FILES_${PN} += "/opt/ltp/* /opt/ltp/runtest/* /opt/ltp/scenario_groups/* /opt/ltp/testcases/bin/* /opt/ltp/testcases/bin/*/bin/* /opt/ltp/testscripts/* /opt/ltp/testcases/open_posix_testsuite/* /opt/ltp/testcases/open_posix_testsuite/conformance/* /opt/ltp/testcases/open_posix_testsuite/Documentation/* /opt/ltp/testcases/open_posix_testsuite/functional/* /opt/ltp/testcases/open_posix_testsuite/include/* /opt/ltp/testcases/open_posix_testsuite/scripts/* /opt/ltp/testcases/open_posix_testsuite/stress/* /opt/ltp/testcases/open_posix_testsuite/tools/*"
> +
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +
> +do_unpack_append() {
> +        bb.build.exec_func('do_extract_tarball', d)
> +}
> +
> +do_extract_tarball() {
> +	if test -f ${WORKDIR}/ltp-full-${PV} ; then
> +	    tar x --no-same-owner -f ${WORKDIR}/ltp-full-${PV}
> +	    mv ${WORKDIR}/ltp-full-${PV} ${WORKDIR}/ltp-${PV}
> +	fi
> +}
> +
The "mv" seems to cause a problem.  Is there a reason you do this 
instead of just setting "S = ${WORKDIR}/ltp-full-${PV} if that's what 
the tarball normally extracts to?



ERROR: Function 'do_extract_tarball' failed (see 
/srv/home/swold/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/work/i586-poky-linux/ltp-20110915-r0/temp/log.do_unpack.714 
for further information)
ERROR: Logfile of failure stored in: 
/srv/home/swold/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/work/i586-poky-linux/ltp-20110915-r0/temp/log.do_unpack.714
Log data follows:
| NOTE: Unpacking /srv/home/swold/downloads/ltp-full-20110915.bz2 to 
/srv/home/swold/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/work/i586-poky-linux/ltp-20110915-r0/
| DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 
'common-linux', 'common-glibc', 'i586-linux', 'common']
| ERROR: Function 'do_extract_tarball' failed (see 
/srv/home/swold/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/work/i586-poky-linux/ltp-20110915-r0/temp/log.do_unpack.714 
for further information)
| mv: cannot overwrite directory 
`/srv/home/swold/yocto-autobuilder/yocto-slave/nightly-x86/build/build/tmp/work/i586-poky-linux/ltp-20110915-r0/ltp-20110915/ltp-full-20110915' 
with non-directory
NOTE: package ltp-20110915-r0: task do_unpack: Failed
ERROR: Task 2303 
(/srv/home/swold/yocto-autobuilder/yocto-slave/nightly-x86/build/meta/recipes-extended/ltp/ltp_20110915.bb, 
do_unpack) failed with exit code '1'

> +do_install(){
> +	install -d ${D}/opt/ltp/
> +	oe_runmake DESTDIR=${D} SKIP_IDCHECK=1 install
> +	
> +	# Copy POSIX test suite into ${D}/opt/ltp/testcases by manual
> +	cp -r testcases/open_posix_testsuite ${D}/opt/ltp/testcases
> +
> +	# We need to remove all scripts which depend on /usr/bin/expect, since expect is not supported in poky
> +	# We will add expect for enhancement in future
> +	find ${D} -type f -print | xargs grep "\!.*\/usr\/bin\/expect" | awk -F":" '{print $1}' | xargs rm -f
> +}


