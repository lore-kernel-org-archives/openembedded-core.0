Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1SoHbN-0006KS-78
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 19:18:25 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 09 Jul 2012 10:07:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="120403879"
Received: from unknown (HELO localhost) ([10.255.13.39])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Jul 2012 10:07:16 -0700
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, sgw@linux.intel.com
Date: Mon,  9 Jul 2012 12:07:11 -0500
Message-Id: <59861210906bdddb91dab74b98f7d76bd3f115c4.1341852059.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <60e821b5a17b9199ba65f4bd6480c858cc351109.1341852059.git.tom.zanussi@intel.com>
References: <60e821b5a17b9199ba65f4bd6480c858cc351109.1341852059.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1341852059.git.tom.zanussi@intel.com>
References: <cover.1341852059.git.tom.zanussi@intel.com>
Subject: [PATCH 3/3] perf: add perf-tui feature
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
X-List-Received-Date: Mon, 09 Jul 2012 17:18:25 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

Add a new feature named 'perf-tui'.  Adding this into the
PERF_FEATURES variable in perf.inc will enable the perf TUI (Text-base
UI) user interface on a target, which adds libnewt and turns on the
perf text UI options in perf, if perf is included in an image.

If 'perf-tui' isn't named as a feature (the default), the perf TUI
will be disabled and unavailable.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 meta/recipes-kernel/perf/perf_3.4.bb |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/perf/perf_3.4.bb
index e96552c..ccb7425 100644
--- a/meta/recipes-kernel/perf/perf_3.4.bb
+++ b/meta/recipes-kernel/perf/perf_3.4.bb
@@ -9,16 +9,19 @@ as well."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
-PR = "r2"
+PR = "r3"
 
 require perf.inc
 
 BUILDPERF_libc-uclibc = "no"
 
+TUI_DEPENDS = "${@perf_feature_enabled('perf-tui', 'libnewt', '',d)}"
+
 DEPENDS = "virtual/kernel \
            virtual/${MLPREFIX}libc \
            ${MLPREFIX}elfutils \
            ${MLPREFIX}binutils \
+           ${TUI_DEPENDS} \
           "
 
 SCRIPTING_RDEPENDS = "${@perf_feature_enabled('perf-scripting', 'perl perl-modules python', '',d)}"
@@ -47,6 +50,7 @@ S = "${STAGING_KERNEL_DIR}"
 B = "${WORKDIR}/${BPN}-${PV}"
 
 SCRIPTING_DEFINES = "${@perf_feature_enabled('perf-scripting', '', 'NO_LIBPERL=1 NO_LIBPYTHON=1',d)}"
+TUI_DEFINES = "${@perf_feature_enabled('perf-tui', '', 'NO_NEWT=1',d)}"
 
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



