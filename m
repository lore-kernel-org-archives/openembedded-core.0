Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R6JMU-0008DS-4C
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 11:45:02 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 21 Sep 2011 02:39:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="51195278"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.170])
	by orsmga002.jf.intel.com with ESMTP; 21 Sep 2011 02:39:40 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2011 02:39:29 -0700
Message-Id: <870d78888ddf98705ab9c4e1a3025c23bc2d6a37.1316597628.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1316597628.git.sgw@linux.intel.com>
References: <cover.1316597628.git.sgw@linux.intel.com>
In-Reply-To: <cover.1316597628.git.sgw@linux.intel.com>
References: <cover.1316597628.git.sgw@linux.intel.com>
Subject: [RC Fixes 13/19] Update python dependencies to be simply to "python"
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
X-List-Received-Date: Wed, 21 Sep 2011 09:45:04 -0000

From: Mark Hatle <mark.hatle@windriver.com>

Previously python dependencies were of the format "python(abi) = ..."
This format is not yet supportable within OE, so revert to a form
we know we can handle.

Introduce a change to package.bbclass that ensures it will causes the
sstate-cache's "package" to invalidate.  Since pythondeps changed, the
output of rpmdeps changes, which causes the per-file dependency
information to change.... thus we need to invalidate the cache!

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package.bbclass                |    6 ++++++
 meta/recipes-devtools/rpm/rpm/pythondeps.sh |   16 ++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.0.bb      |    4 +++-
 3 files changed, 25 insertions(+), 1 deletions(-)
 create mode 100755 meta/recipes-devtools/rpm/rpm/pythondeps.sh

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 3f5c904..e581ae2 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1,3 +1,9 @@
+# Change the following version to cause sstate to invalidate the package
+# cache.  This is useful if an item this class depends on changes in a
+# way that the output of this class changes.  rpmdeps is a good example
+# as any change to rpmdeps requires this to be rerun.
+PACKAGE_BBCLASS_VERSION = "r1"
+
 #
 # Packaging process
 #
diff --git a/meta/recipes-devtools/rpm/rpm/pythondeps.sh b/meta/recipes-devtools/rpm/rpm/pythondeps.sh
new file mode 100755
index 0000000..083b174
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/pythondeps.sh
@@ -0,0 +1,16 @@
+#!/bin/sh
+
+[ $# -ge 1 ] || {
+    cat > /dev/null
+    exit 0
+}
+
+case $1 in
+-R|--requires)
+    shift
+    grep "/usr/\(lib[^/]*\|share\)/python[^/]*/" >/dev/null && echo "python"
+    exit 0
+    ;;
+esac
+
+exit 0
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
index b805f7d..a7b360d 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
@@ -45,7 +45,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "bzip2 zlib db openssl elfutils expat libpcre attr acl popt ${extrarpmdeps}"
 extrarpmdeps = "python perl"
 extrarpmdeps_virtclass-native = ""
-PR = "r20"
+PR = "r21"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -63,6 +63,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.0-0.20101229.src.rpm;ex
 	   file://rpm-fileclass.patch \
 	   file://rpm-canonarch.patch \
 	   file://rpm-no-loopmsg.patch \
+	   file://pythondeps.sh \
 	  "
 
 #	   file://rpm-autoconf.patch \
@@ -352,6 +353,7 @@ do_install_append() {
 	# Enable Debian style arbitrary tags...
 	sed -i -e 's,%_arbitrary_tags[^_].*,%_arbitrary_tags %{_arbitrary_tags_debian},' ${D}/${libdir}/rpm/macros
 
+	install -m 0755 ${WORKDIR}/pythondeps.sh ${D}/${libdir}/rpm/pythondeps.sh
 	install -m 0755 ${WORKDIR}/perfile_rpmdeps.sh ${D}/${libdir}/rpm/perfile_rpmdeps.sh
 
 	# Remove unpackaged files (based on list in rpm.spec)
-- 
1.7.6



