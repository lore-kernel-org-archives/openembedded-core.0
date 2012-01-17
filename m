Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4ao-0006h2-Im
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:40:34 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2012 00:32:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96632855"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:32:52 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:31:53 -0800
Message-Id: <c06596378e7cb78ff51dafd378a2ce98218ed82d.1326786989.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 08/62] ncurses-native: install to libdir, not base_libdir
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
X-List-Received-Date: Tue, 17 Jan 2012 08:40:35 -0000

From: Christopher Larson <chris_larson@mentor.com>

For target, both base_libdir and libdir in sysroot can be used, as we pass
--sysroot to the toolchain. For native, we don't do this, and we also only add
-L<sysroot>/${libdir}, not -L<sysroot>/${base_libdir}, resulting in other
native recipes (like readline-native) failing to find the ncurses libraries.

readline-native only built successfully on hosts where it could fall back to
their ncurses/termcap rather than the one in the sysroot.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-core/ncurses/ncurses.inc |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 8321d7b..43303b7 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://ncurses/base/version.c;beginline=1;endline=27;md5=cbc
 SECTION = "libs"
 DEPENDS = "ncurses-native"
 DEPENDS_virtclass-native = ""
-INC_PR = "r3"
+INC_PR = "r4"
 
 inherit autotools binconfig multilib_header
 
@@ -26,8 +26,8 @@ ENABLE_WIDEC ?= "true"
 # builds.
 BUILD_CPPFLAGS += "-D_GNU_SOURCE"
 
-# tic from the -native build cannot run without setting this explicitly
-BUILD_LDFLAGS_virtclass-native += "-Wl,-rpath,${base_libdir}"
+# natives don't generally look in base_libdir
+base_libdir_virtclass-native = "${libdir}"
 
 # Helper function for do_configure to allow multiple configurations
 # $1 the directory to run configure in
-- 
1.7.6.5



