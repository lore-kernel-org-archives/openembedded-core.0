Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1Sm7jT-0003bS-Og
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 20:21:51 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 Jul 2012 11:10:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="161053602"
Received: from unknown (HELO localhost) ([10.255.12.166])
	by orsmga001.jf.intel.com with ESMTP; 03 Jul 2012 11:10:51 -0700
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2012 13:10:36 -0500
Message-Id: <246e913de2b0b5f18666c018ac001053cd32a7e7.1341338051.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <ef6a9af654411604543f0baf3fb9b366268ba233.1341338051.git.tom.zanussi@intel.com>
References: <ef6a9af654411604543f0baf3fb9b366268ba233.1341338051.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1341338051.git.tom.zanussi@intel.com>
References: <cover.1341338051.git.tom.zanussi@intel.com>
Subject: [PATCH 9/9] perf: add perf-tui MACHINE_FEATURE
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
X-List-Received-Date: Tue, 03 Jul 2012 18:21:52 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

Add a new MACHINE_FEATURE named 'perf-tui'.  Adding this into any
machine configuration will enable perf TUI (Text-base UI) user
interface on the target, which adds libnewt and turns on the perf text
UI options in perf, if perf is included in an image.

If 'perf-tui' isn't named as a feature (the default), the perf TUI
will be disabled and unavailable.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/recipes-kernel/perf/perf_3.4.bb |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/perf/perf_3.4.bb
index 81121c1..8932bd1 100644
--- a/meta/recipes-kernel/perf/perf_3.4.bb
+++ b/meta/recipes-kernel/perf/perf_3.4.bb
@@ -9,17 +9,21 @@ as well."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
-PR = "r1"
+PR = "r2"
 
 BUILDPERF_libc-uclibc = "no"
 
+TUI_DEPENDS = "${@base_contains('MACHINE_FEATURES', 'perf-tui', 'libnewt', '',d)}"
+
 DEPENDS = "virtual/kernel \
            virtual/${MLPREFIX}libc \
            ${MLPREFIX}elfutils \
            ${MLPREFIX}binutils \
+           ${TUI_DEPENDS} \
           "
 
 SCRIPTING_RDEPENDS = "${@base_contains('MACHINE_FEATURES', 'perf-scripting', 'perl perl-modules python', '',d)}"
+TUI_RDEPENDS = "${@base_contains('MACHINE_FEATURES', 'perf-tui', 'libnewt', '',d)}"
 RDEPENDS_${PN} += "elfutils ${SCRIPTING_RDEPENDS}"
 
 PROVIDES = "virtual/perf"
@@ -45,6 +49,7 @@ S = "${STAGING_KERNEL_DIR}"
 B = "${WORKDIR}/${BPN}-${PV}"
 
 SCRIPTING_DEFINES = "${@base_contains('MACHINE_FEATURES', 'perf-scripting', '', 'NO_LIBPERL=1 NO_LIBPYTHON=1',d)}"
+TUI_DEFINES = "${@base_contains('MACHINE_FEATURES', 'perf-tui', '', 'NO_NEWT=1',d)}"
 
 EXTRA_OEMAKE = \
 		'-C ${S}/tools/perf \
@@ -54,7 +59,7 @@ EXTRA_OEMAKE = \
 		CC="${CC}" \
 		AR="${AR}" \
 		prefix=/usr \
-		NO_GTK2=1 NO_NEWT=1 NO_DWARF=1 ${SCRIPTING_DEFINES} \
+		NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 ${SCRIPTING_DEFINES} \
 		'
 
 do_compile() {
-- 
1.7.0.4



