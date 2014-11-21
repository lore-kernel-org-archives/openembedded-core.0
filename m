Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 11E7072146
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Nov 2014 17:20:21 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 21 Nov 2014 09:13:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,432,1413270000"; d="scan'208";a="626293800"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.72])
	by fmsmga001.fm.intel.com with ESMTP; 21 Nov 2014 09:20:19 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Nov 2014 09:20:13 -0800
Message-Id: <81d1ebf7f97edf08ecbb62daec49389e7a5ebe3a.1416590209.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1416590209.git.sgw@linux.intel.com>
References: <cover.1416590209.git.sgw@linux.intel.com>
In-Reply-To: <cover.1416590209.git.sgw@linux.intel.com>
References: <cover.1416590209.git.sgw@linux.intel.com>
Subject: [PATCH 3/7] npth: Upgrade to 1.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Nov 2014 17:20:26 -0000

Add patch for adding pkgconfig file.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/npth/npth/pkgconfig.patch     | 48 ++++++++++++++++++++++
 .../npth/{npth_1.0.bb => npth_1.1.bb}              |  5 ++-
 2 files changed, 51 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/npth/npth/pkgconfig.patch
 rename meta/recipes-support/npth/{npth_1.0.bb => npth_1.1.bb} (74%)

diff --git a/meta/recipes-support/npth/npth/pkgconfig.patch b/meta/recipes-support/npth/npth/pkgconfig.patch
new file mode 100644
index 0000000..55d12c2
--- /dev/null
+++ b/meta/recipes-support/npth/npth/pkgconfig.patch
@@ -0,0 +1,48 @@
+Added npth pkgconfig file
+
+Upstream-Status: Incompatible [oe-core specific]
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+Index: npth-1.1/src/npth.pc.in
+===================================================================
+--- /dev/null
++++ npth-1.1/src/npth.pc.in
+@@ -0,0 +1,10 @@
++prefix=@prefix@
++exec_prefix=@exec_prefix@
++libdir=@libdir@
++includedir=@includedir@
++
++Name: npth
++Description: a new portable posix threading library
++Version: @VERSION@
++Libs: -L${libdir} -lnpth
++Cflags: -I${includedir}
+Index: npth-1.1/src/Makefile.am
+===================================================================
+--- npth-1.1.orig/src/Makefile.am
++++ npth-1.1/src/Makefile.am
+@@ -27,8 +27,10 @@
+ # License along with this program; if not, see <http://www.gnu.org/licenses/>.
+ 
+ ## Process this file with automake to produce Makefile.in
++pkgconfigdir = $(libdir)/pkgconfig
++pkgconfig_DATA = npth.pc
+ 
+-EXTRA_DIST = libnpth.vers
++EXTRA_DIST = libnpth.vers npth.pc
+ #	     versioninfo.rc.in
+ nodist_include_HEADERS = npth.h
+ 
+Index: npth-1.1/configure.ac
+===================================================================
+--- npth-1.1.orig/configure.ac
++++ npth-1.1/configure.ac
+@@ -337,6 +337,7 @@ src/Makefile
+ w32/Makefile
+ tests/Makefile])
+ AC_CONFIG_FILES(npth-config, chmod +x npth-config)
++AC_CONFIG_FILES([src/npth.pc])
+ AC_OUTPUT
+ 
+ echo "
diff --git a/meta/recipes-support/npth/npth_1.0.bb b/meta/recipes-support/npth/npth_1.1.bb
similarity index 74%
rename from meta/recipes-support/npth/npth_1.0.bb
rename to meta/recipes-support/npth/npth_1.1.bb
index 3356ba0..72a194e 100644
--- a/meta/recipes-support/npth/npth_1.0.bb
+++ b/meta/recipes-support/npth/npth_1.1.bb
@@ -7,10 +7,11 @@ LIC_FILES_CHKSUM = "\
     file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6\
     "
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/npth/npth-${PV}.tar.bz2 \
+           file://pkgconfig.patch \
           "
 
-SRC_URI[md5sum] = "36869bf10378ea08c155cd5c3580a1dd"
-SRC_URI[sha256sum] = "9ad49de376310effab7fdad69581054b0fa9023d062032d06e73058146c8f76e"
+SRC_URI[md5sum] = "aaffc8ef3e955ab50a1905809f268a23"
+SRC_URI[sha256sum] = "896c561eb2ec8da35f11828fb04a3fbff12d41ff657c799056d7dc4a66e5df7f"
 
 BINCONFIG = "${bindir}/npth-config"
 
-- 
1.8.3.1


