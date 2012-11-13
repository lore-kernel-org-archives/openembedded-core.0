Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1TYKTC-0007EM-TM
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 18:40:19 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 13 Nov 2012 09:26:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,768,1344236400"; d="scan'208";a="167856046"
Received: from unknown (HELO localhost) ([10.255.12.144])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Nov 2012 09:26:23 -0800
From: tom.zanussi@intel.com
To: ross.burton@intel.com,
	openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2012 11:26:17 -0600
Message-Id: <18c50380955170a2cc9faba956f184b5bbe971dc.1352826909.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <cover.1352826909.git.tom.zanussi@intel.com>
References: <cover.1352826909.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1352826909.git.tom.zanussi@intel.com>
References: <cover.1352826909.git.tom.zanussi@intel.com>
Subject: [PATCH 1/3] packagegroup-core-tools-profile: replace 'legacy' lttng with lttng 2.0
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
X-List-Received-Date: Tue, 13 Nov 2012 17:40:19 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

packagegroup-core-tools-profile currently pulls in the 'legacy' lttng
packages, which are useless without legacy lttng support in the kernel.

This makes packagegroup-core-tools-profile pull in the lttng 2.0
packages instead, which don't need any kernel modifications to work.

(From OE-Core rev: f1f9d08ea8b32b0a51a1e3f7bcf488ba7e9dc21e)

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../packagegroup-core-tools-profile.bb             | 25 ++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index 1035036..edf41b1 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -5,7 +5,7 @@
 SUMMARY = "Profiling tools"
 LICENSE = "MIT"
 
-PR = "r1"
+PR = "r2"
 
 inherit packagegroup
 
@@ -29,8 +29,7 @@ PROFILETOOLS = "\
     oprofileui-server \
     powertop \
     latencytop \
-    lttng-control \
-    lttng-viewer"
+    "
 
 # systemtap needs elfutils which is not fully buildable on uclibc
 # hence we exclude it from uclibc based builds
@@ -44,10 +43,25 @@ SYSTEMTAP_mips = ""
 # which means we can not use syscall() to call it. So we ignore
 # it for x86_64/uclibc
 
-LTTNGUST = "lttng-ust"
+LTTNGUST = "lttng2-ust"
 LTTNGUST_libc-uclibc = ""
 LTTNGUST_mips = ""
 
+# lttng-tools, lttng-modules and babeltrace all depend on liburcu
+# which currentl doesn't build on mips
+
+LTTNGTOOLS = "lttng-tools"
+LTTNGTOOLS_mips = ""
+LTTNGTOOLS_aarch64 = ""
+
+LTTNGMODULES = "lttng-modules"
+LTTNGMODULES_mips = ""
+LTTNGMODULES_aarch64 = ""
+
+BABELTRACE = "babeltrace"
+BABELTRACE_mips = ""
+BABELTRACE_aarch64 = ""
+
 # valgrind does not work on mips
 
 VALGRIND = "valgrind"
@@ -65,6 +79,9 @@ VALGRIND_arm = ""
 RDEPENDS_${PN} = "\
     ${PROFILETOOLS} \
     ${LTTNGUST} \
+    ${LTTNGTOOLS} \
+    ${LTTNGMODULES} \
+    ${BABELTRACE} \
     ${SYSTEMTAP} \
     ${VALGRIND} \
     "
-- 
1.7.11.4



