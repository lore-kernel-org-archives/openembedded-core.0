Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <qing.he@intel.com>) id 1Pz6lm-0005dp-LC
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Mar 2011 13:21:06 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 14 Mar 2011 05:01:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,315,1297065600"; d="scan'208";a="667008245"
Received: from qhe2-db.sh.intel.com ([10.239.13.48])
	by fmsmga002.fm.intel.com with ESMTP; 14 Mar 2011 05:01:41 -0700
Received: from qhe2 by qhe2-db.sh.intel.com with local (Exim 4.71)
	(envelope-from <qing.he@intel.com>)
	id 1Pz6MI-0005FZ-A8; Mon, 14 Mar 2011 19:54:46 +0800
Message-Id: <d81cc5bb35a36297384f3b5cef473b60449ea51a.1300103431.git.qing.he@intel.com>
In-Reply-To: <cover.1300103431.git.qing.he@intel.com>
References: <cover.1300103431.git.qing.he@intel.com>
Old-Date: Thu, 10 Mar 2011 18:28:55 +0800
Date: Mon, 14 Mar 2011 19:54:46 +0800
To: openembedded-core@lists.openembedded.org
From: Qing He <qing.he@intel.com>
Subject: [PATCH 1/4] sat-solver: add machine arch support
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
X-List-Received-Date: Mon, 14 Mar 2011 12:21:06 -0000

From: Qing He <qing.he@intel.com>

Signed-off-by: Qing He <qing.he@intel.com>
---
 .../sat-solver/sat-solver/builtin-arch.patch       |   28 +++++++++++++++++++
 .../sat-solver/sat-solver/no-builtin-arch.patch    |   29 ++++++++++++++++++++
 meta/recipes-extended/sat-solver/sat-solver_git.bb |   28 +++++++++++++++++-
 3 files changed, 83 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/sat-solver/sat-solver/builtin-arch.patch
 create mode 100644 meta/recipes-extended/sat-solver/sat-solver/no-builtin-arch.patch

diff --git a/meta/recipes-extended/sat-solver/sat-solver/builtin-arch.patch b/meta/recipes-extended/sat-solver/sat-solver/builtin-arch.patch
new file mode 100644
index 0000000..c228c36
--- /dev/null
+++ b/meta/recipes-extended/sat-solver/sat-solver/builtin-arch.patch
@@ -0,0 +1,28 @@
+This patch adds the ${MACHINE_ARCH} and ${PACKAGE_ARCH} to
+sat-solver available archs, see do_archpatch in .bb for more
+details, this is the version for ${BASE_PACKAGE_ARCH} already
+recognized in sat-sovler.
+
+Signed-off-by: Qing He <qing.he@intel.com>
+
+diff --git a/src/poolarch.c b/src/poolarch.c
+index 34a14a3..660959b 100644
+--- a/src/poolarch.c
++++ b/src/poolarch.c
+@@ -21,6 +21,7 @@
+ #include "util.h"
+ 
+ const char *archpolicies[] = {
++  "@MACHINE_ARCH@",	"@MACHINE_ARCH@:@PKG_ARCH_TAIL@",
+   "x86_64",	"x86_64:i686:i586:i486:i386",
+   "i686",	"i686:i586:i486:i386",
+   "i586",	"i586:i486:i386",
+@@ -72,7 +74,7 @@ pool_setarch(Pool *pool, const char *arch)
+       return;
+     }
+ #ifndef DEBIAN_SEMANTICS
+-  id = ARCH_NOARCH;
++  id = ARCH_ALL;
+ #else
+   id = ARCH_ALL;
+ #endif
diff --git a/meta/recipes-extended/sat-solver/sat-solver/no-builtin-arch.patch b/meta/recipes-extended/sat-solver/sat-solver/no-builtin-arch.patch
new file mode 100644
index 0000000..225fbfe
--- /dev/null
+++ b/meta/recipes-extended/sat-solver/sat-solver/no-builtin-arch.patch
@@ -0,0 +1,29 @@
+This patch adds the ${MACHINE_ARCH} and ${PACKAGE_ARCH} to
+sat-solver available archs, see do_archpatch in .bb for more
+details, this is the version for ${BASE_PACKAGE_ARCH} not
+recognized in sat-sovler.
+
+Signed-off-by: Qing He <qing.he@intel.com>
+
+diff --git a/src/poolarch.c b/src/poolarch.c
+index 34a14a3..36367ba 100644
+--- a/src/poolarch.c
++++ b/src/poolarch.c
+@@ -21,6 +21,8 @@
+ #include "util.h"
+ 
+ const char *archpolicies[] = {
++  "@MACHINE_ARCH@",	"@MACHINE_ARCH@:@PKG_ARCH@",
++  "@PKG_ARCH@",	"@PKG_ARCH@",
+   "x86_64",	"x86_64:i686:i586:i486:i386",
+   "i686",	"i686:i586:i486:i386",
+   "i586",	"i586:i486:i386",
+@@ -72,7 +74,7 @@ pool_setarch(Pool *pool, const char *arch)
+       return;
+     }
+ #ifndef DEBIAN_SEMANTICS
+-  id = ARCH_NOARCH;
++  id = ARCH_ALL;
+ #else
+   id = ARCH_ALL;
+ #endif
diff --git a/meta/recipes-extended/sat-solver/sat-solver_git.bb b/meta/recipes-extended/sat-solver/sat-solver_git.bb
index 02b6c75..54420cd 100644
--- a/meta/recipes-extended/sat-solver/sat-solver_git.bb
+++ b/meta/recipes-extended/sat-solver/sat-solver_git.bb
@@ -7,14 +7,38 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 DEPENDS = "libcheck rpm zlib expat db"
 
 PV = "0.0-git${SRCPV}"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "git://gitorious.org/opensuse/sat-solver.git;protocol=git \
            file://cmake.patch \
            file://rpm5.patch \
-	   file://db5.patch"
+           file://db5.patch \
+           file://builtin-arch.patch;apply=no \
+           file://no-builtin-arch.patch;apply=no \
+          "
 
 S = "${WORKDIR}/git"
 
 EXTRA_OECMAKE += "-DLIB=lib"
+
 inherit cmake pkgconfig
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+do_archpatch () {
+	PKG_ARCH_TAIL=`sed -n ${S}/src/poolarch.c -e "s|^  \"\(${BASE_PACKAGE_ARCH}\)\",.*\"\(.*\)\",.*$|\2|p"`
+	if [ "x${PKG_ARCH_TAIL}" == x ]; then
+		PATCHFILE=${WORKDIR}/no-builtin-arch.patch
+	else
+		PATCHFILE=${WORKDIR}/builtin-arch.patch
+	fi
+
+	sed -i "${PATCHFILE}" \
+		-e "s|@MACHINE_ARCH@|${MACHINE_ARCH}|g" \
+		-e "s|@PKG_ARCH@|${BASE_PACKAGE_ARCH}|g" \
+		-e "s|@PKG_ARCH_TAIL@|${PKG_ARCH_TAIL}|g"
+
+	patch -p1 -i "${PATCHFILE}"
+}
+
+addtask archpatch before do_patch after do_unpack
-- 
1.7.0



