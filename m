Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1Sm7jO-0003bS-3P
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 20:21:46 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Jul 2012 11:10:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="166453674"
Received: from unknown (HELO localhost) ([10.255.12.166])
	by orsmga002.jf.intel.com with ESMTP; 03 Jul 2012 11:10:42 -0700
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2012 13:10:31 -0500
Message-Id: <77d7acc3d33f44e2651af4c43c7423391185e1b6.1341338051.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <ef6a9af654411604543f0baf3fb9b366268ba233.1341338051.git.tom.zanussi@intel.com>
References: <ef6a9af654411604543f0baf3fb9b366268ba233.1341338051.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1341338051.git.tom.zanussi@intel.com>
References: <cover.1341338051.git.tom.zanussi@intel.com>
Subject: [PATCH 4/9] perf: enable Python bindings
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
X-List-Received-Date: Tue, 03 Jul 2012 18:21:46 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

Add support to enable the perf python bindings.  The combination of
these changes and the changes in the python-config sections in the
kernel Makefile enable all the python bindings currently available in
perf.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/recipes-kernel/perf/perf_3.4.bb |   12 +++++++++++-
 1 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/perf/perf_3.4.bb
index 997beb4..9f36484 100644
--- a/meta/recipes-kernel/perf/perf_3.4.bb
+++ b/meta/recipes-kernel/perf/perf_3.4.bb
@@ -9,7 +9,7 @@ as well."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
-PR = "r0"
+PR = "r1"
 
 BUILDPERF_libc-uclibc = "no"
 
@@ -24,6 +24,13 @@ PROVIDES = "virtual/perf"
 
 inherit kernel-arch
 
+# needed for building the tools/perf Python bindings
+inherit python-dir
+export STAGING_INCDIR
+export STAGING_LIBDIR
+export BUILD_SYS
+export HOST_SYS
+
 S = "${STAGING_KERNEL_DIR}"
 B = "${WORKDIR}/${BPN}-${PV}"
 
@@ -44,7 +51,10 @@ do_compile() {
 
 do_install() {
 	oe_runmake DESTDIR=${D} install
+	oe_runmake DESTDIR=${D} install-python_ext
 }
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+FILES_${PN}-dbg += "${libdir}/python*/site-packages/.debug"
+FILES_${PN} += "${libdir}/python*/site-packages"
-- 
1.7.0.4



