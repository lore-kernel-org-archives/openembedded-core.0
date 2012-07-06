Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1SnFKw-000290-08
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 22:41:10 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Jul 2012 13:30:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="189350798"
Received: from unknown (HELO localhost) ([10.255.13.37])
	by fmsmga002.fm.intel.com with ESMTP; 06 Jul 2012 13:30:03 -0700
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Fri,  6 Jul 2012 15:29:59 -0500
Message-Id: <aa1a296026a1d616f44f4882c1fe50ab98051a59.1341606068.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <a2ba99c6c2be42f7d30f5827361b0a6892659997.1341606068.git.tom.zanussi@intel.com>
References: <a2ba99c6c2be42f7d30f5827361b0a6892659997.1341606068.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1341606068.git.tom.zanussi@intel.com>
References: <cover.1341606068.git.tom.zanussi@intel.com>
Subject: [PATCH 3/3] perf: add arch-specific perf-tui feature
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
X-List-Received-Date: Fri, 06 Jul 2012 20:41:10 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

Add a new architecture-specific feature named 'perf-tui'.  Adding this
into the perf_features_by_arch table in perf.inc for a given arch will
enable the perf TUI (Text-base UI) user interface on a target built
for that arch, which adds libnewt and turns on the perf text UI
options in perf, if perf is included in an image.

If 'perf-tui' isn't named as a feature (the default), the perf TUI
will be disabled and unavailable.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/recipes-kernel/perf/perf_3.4.bb |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/perf/perf_3.4.bb
index a79e9e6..aa9dd6c 100644
--- a/meta/recipes-kernel/perf/perf_3.4.bb
+++ b/meta/recipes-kernel/perf/perf_3.4.bb
@@ -9,16 +9,19 @@ as well."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
-PR = "r2"
+PR = "r3"
 
 require perf.inc
 
 BUILDPERF_libc-uclibc = "no"
 
+TUI_DEPENDS = "${@perf_arch_supports_feature('perf-tui', 'libnewt', '',d)}"
+
 DEPENDS = "virtual/kernel \
            virtual/${MLPREFIX}libc \
            ${MLPREFIX}elfutils \
            ${MLPREFIX}binutils \
+           ${TUI_DEPENDS} \
           "
 
 SCRIPTING_RDEPENDS = "${@perf_arch_supports_feature('perf-scripting', 'perl perl-modules python', '',d)}"
@@ -47,6 +50,7 @@ S = "${STAGING_KERNEL_DIR}"
 B = "${WORKDIR}/${BPN}-${PV}"
 
 SCRIPTING_DEFINES = "${@perf_arch_supports_feature('perf-scripting', '', 'NO_LIBPERL=1 NO_LIBPYTHON=1',d)}"
+TUI_DEFINES = "${@perf_arch_supports_feature('perf-tui', '', 'NO_NEWT=1',d)}"
 
 EXTRA_OEMAKE = \
 		'-C ${S}/tools/perf \
@@ -56,7 +60,7 @@ EXTRA_OEMAKE = \
 		CC="${CC}" \
 		AR="${AR}" \
 		prefix=/usr \
-		NO_GTK2=1 NO_NEWT=1 NO_DWARF=1 ${SCRIPTING_DEFINES} \
+		NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 ${SCRIPTING_DEFINES} \
 		'
 
 do_compile() {
-- 
1.7.0.4



