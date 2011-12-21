Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jiajun.xu@intel.com>) id 1RdP4e-0006K6-DK
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 17:31:24 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 Dec 2011 08:24:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="98854736"
Received: from unknown (HELO localhost) ([10.239.48.201])
	by fmsmga001.fm.intel.com with ESMTP; 21 Dec 2011 08:24:17 -0800
From: Jiajun Xu <jiajun.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Dec 2011 00:45:59 +0800
Message-Id: <0704926d6690953bd2c7cbae45c225325b60ec85.1324485726.git.jiajun.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1324485726.git.jiajun.xu@intel.com>
References: <cover.1324485726.git.jiajun.xu@intel.com>
Subject: [PATCH 1/3] ltp: Add recipe from OE
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
X-List-Received-Date: Wed, 21 Dec 2011 16:31:25 -0000

Port ltp recipe from OE and upgraged to latest version(20110915).
Install ltp into ${D}/opt/ltp and POSIX test suite is also copied
into ${D}/opt/ltp/testcases.

TODO: Some cases are removed since they depend on command 'expect'.
It is not in Poky or OE and we will add it for enhancement next.

Signed-off-by: Jiajun Xu <jiajun.xu@intel.com>
---
 meta/recipes-extended/ltp/ltp_20110915.bb |   68 +++++++++++++++++++++++++++++
 1 files changed, 68 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/ltp/ltp_20110915.bb

diff --git a/meta/recipes-extended/ltp/ltp_20110915.bb b/meta/recipes-extended/ltp/ltp_20110915.bb
new file mode 100644
index 0000000..dabc0f0
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp_20110915.bb
@@ -0,0 +1,68 @@
+SUMMARY = "Linux Test Project"
+DESCRIPTION = "The Linux Test Project is a joint project with SGI, IBM, OSDL, and Bull with a goal to deliver test suites to the open source community that validate the reliability, robustness, and stability of Linux. The Linux Test Project is a collection of tools for testing the Linux kernel and related features."
+HOMEPAGE = "http://ltp.sourceforge.net"
+SECTION = "console/utils"
+
+PR = "r0"
+
+LICENSE = "GPLv2 & GPLv2+ & LGPLv2+ & LGPLv2.1+ & BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
+		    file://testcases/kernel/mce-test/COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
+		    file://testcases/kernel/controllers/freezer/COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
+		    file://testcases/kernel/controllers/freezer/run_freezer.sh;startline=5;endline=17;md5=aeac3f7691caa2e76fd5a732fbd6510d \
+		    file://testcases/kernel/fs/ext4-new-features/ffsb-6.0-rc2/COPYING;md5=c46082167a314d785d012a244748d803 \
+		    file://testcases/kernel/hotplug/memory_hotplug/COPYING;md5=e04a2e542b2b8629bf9cd2ba29b0fe41 \
+		    file://testcases/kernel/hotplug/cpu_hotplug/COPYING;md5=e04a2e542b2b8629bf9cd2ba29b0fe41 \
+		    file://testcases/open_posix_testsuite/COPYING;md5=216e43b72efbe4ed9017cc19c4c68b01 \
+		    file://tools/netpipe-2.4/COPYING;md5=18810669f13b87348459e611d31ab760 \
+		    file://tools/netpipe-2.4-ipv6/COPYING;md5=18810669f13b87348459e611d31ab760 \
+		    file://tools/top-LTP/proc/COPYING;md5=6e29c688d912da12b66b73e32b03d812 \
+		    file://tools/pounder21/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+		    file://utils/benchmark/kernbench-0.42/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+		"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/ltp/ltp-full-${PV}.bz2"
+
+SRC_URI[md5sum] = "582fb78d7bf78a624a4387f29327d166"
+SRC_URI[sha256sum] = "013f7f2f6fdf46b7d73216533c3d4c2d91f0a2cec522bf026f7c8920ede83d2c"
+
+export prefix = "/opt/ltp"
+export exec_prefix = "/opt/ltp"
+
+inherit autotools
+
+FILES_${PN}-dbg += "/opt/ltp/runtest/.debug"
+FILES_${PN}-dbg += "/opt/ltp/testcases/bin/.debug"
+FILES_${PN}-dbg += "/opt/ltp/testcases/bin/*/bin/.debug"
+FILES_${PN}-dbg += "/opt/ltp/testcases/bin/*/test/.debug"
+FILES_${PN}-dbg += "/opt/ltp/scenario_groups/.debug"
+FILES_${PN}-dbg += "/opt/ltp/testscripts/.debug"
+FILES_${PN}-dbg += "/opt/ltp/testscripts/open_posix_testsuite/.debug"
+
+FILES_${PN} += "/opt/ltp/* /opt/ltp/runtest/* /opt/ltp/scenario_groups/* /opt/ltp/testcases/bin/* /opt/ltp/testcases/bin/*/bin/* /opt/ltp/testscripts/* /opt/ltp/testcases/open_posix_testsuite/* /opt/ltp/testcases/open_posix_testsuite/conformance/* /opt/ltp/testcases/open_posix_testsuite/Documentation/* /opt/ltp/testcases/open_posix_testsuite/functional/* /opt/ltp/testcases/open_posix_testsuite/include/* /opt/ltp/testcases/open_posix_testsuite/scripts/* /opt/ltp/testcases/open_posix_testsuite/stress/* /opt/ltp/testcases/open_posix_testsuite/tools/*"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+do_unpack_append() {
+        bb.build.exec_func('do_extract_tarball', d)
+}
+
+do_extract_tarball() {
+	if test -f ${WORKDIR}/ltp-full-${PV} ; then
+	    tar x --no-same-owner -f ${WORKDIR}/ltp-full-${PV} -C ${WORKDIR}
+	    rm -rf ${WORKDIR}/ltp-${PV}
+	    mv ${WORKDIR}/ltp-full-${PV} ${WORKDIR}/ltp-${PV}
+	fi
+}
+
+do_install(){
+	install -d ${D}/opt/ltp/
+	oe_runmake DESTDIR=${D} SKIP_IDCHECK=1 install
+	
+	# Copy POSIX test suite into ${D}/opt/ltp/testcases by manual
+	cp -r testcases/open_posix_testsuite ${D}/opt/ltp/testcases
+
+	# We need to remove all scripts which depend on /usr/bin/expect, since expect is not supported in poky
+	# We will add expect for enhancement in future
+	find ${D} -type f -print | xargs grep "\!.*\/usr\/bin\/expect" | awk -F":" '{print $1}' | xargs rm -f
+}
-- 
1.7.1



