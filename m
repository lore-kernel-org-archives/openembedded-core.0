Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1UAikz-0005OF-QQ
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 16:18:15 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 27 Feb 2013 07:01:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,747,1355126400"; d="scan'208";a="206899478"
Received: from unknown (HELO localhost) ([10.255.12.236])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Feb 2013 07:00:54 -0800
From: tom.zanussi@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Feb 2013 09:00:50 -0600
Message-Id: <60e36bd6e9918321d80fbffe4a4ca7f0ff49c389.1361976853.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <4a4c5cf843e4c4ff22843b8e6097786e88a06bd1.1361976853.git.tom.zanussi@linux.intel.com>
References: <4a4c5cf843e4c4ff22843b8e6097786e88a06bd1.1361976853.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1361976853.git.tom.zanussi@linux.intel.com>
References: <cover.1361976853.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 2/3] perf: add perf-trace feature
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Feb 2013 15:18:17 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

Add a new feature named 'perf-trace'.  Adding this into the
PERF_FEATURES variable in perf.inc will enable 'perf trace' support on
the target.  'perf trace' is meant to be perf's 'strace on steroids'
utility, and it also adds libaudit to the image, if perf is included
in an image.

If 'perf-trace' isn't named as a feature (the default), 'perf trace'
support will be disabled and unavailable.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 meta/recipes-kernel/perf/perf_3.4.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/perf/perf_3.4.bb
index e89a7c3..dad7c86 100644
--- a/meta/recipes-kernel/perf/perf_3.4.bb
+++ b/meta/recipes-kernel/perf/perf_3.4.bb
@@ -9,7 +9,7 @@ as well."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
 
-PR = "r8"
+PR = "r9"
 
 require perf.inc
 
@@ -17,6 +17,7 @@ BUILDPERF_libc-uclibc = "no"
 
 TUI_DEPENDS = "${@perf_feature_enabled('perf-tui', 'libnewt', '',d)}"
 SCRIPTING_DEPENDS = "${@perf_feature_enabled('perf-scripting', 'perl python', '',d)}"
+TRACE_DEPENDS = "${@perf_feature_enabled('perf-trace', 'libaudit', '',d)}"
 
 DEPENDS = "virtual/kernel \
            virtual/${MLPREFIX}libc \
@@ -24,6 +25,7 @@ DEPENDS = "virtual/kernel \
            ${MLPREFIX}binutils \
            ${TUI_DEPENDS} \
            ${SCRIPTING_DEPENDS} \
+           ${TRACE_DEPENDS} \
            bison flex \
           "
 
@@ -54,6 +56,7 @@ B = "${WORKDIR}/${BPN}-${PV}"
 
 SCRIPTING_DEFINES = "${@perf_feature_enabled('perf-scripting', '', 'NO_LIBPERL=1 NO_LIBPYTHON=1',d)}"
 TUI_DEFINES = "${@perf_feature_enabled('perf-tui', '', 'NO_NEWT=1',d)}"
+TRACE_DEFINES = "${@perf_feature_enabled('perf-trace', '', 'NO_LIBAUDIT=1',d)}"
 
 export LDFLAGS = "-ldl -lutil"
 EXTRA_OEMAKE = \
@@ -64,7 +67,7 @@ EXTRA_OEMAKE = \
 		CC="${CC}" \
 		AR="${AR}" \
 		perfexecdir=${libexecdir} \
-		NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 ${SCRIPTING_DEFINES} \
+		NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 ${SCRIPTING_DEFINES} ${TRACE_DEFINES} \
 		'
 
 # We already pass the correct arguments to our compiler for the CFLAGS (if we
-- 
1.7.11.4



