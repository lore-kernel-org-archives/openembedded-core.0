Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QNJqr-00084W-T9
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 09:10:26 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 20 May 2011 00:07:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,241,1304319600"; d="scan'208";a="439578073"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.39])
	by azsmga001.ch.intel.com with ESMTP; 20 May 2011 00:07:07 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 May 2011 00:06:58 -0700
Message-Id: <4c5701ba9746df83913c12029a08dedec29fd221.1305874831.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1305874831.git.sgw@linux.intel.com>
References: <cover.1305874831.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305874831.git.sgw@linux.intel.com>
References: <cover.1305874831.git.sgw@linux.intel.com>
Subject: [PATCH 08/12] opkg-utils: Synchronise with OE
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
X-List-Received-Date: Fri, 20 May 2011 07:10:26 -0000

From: Khem Raj <raj.khem@gmail.com>

Import mtime-int.patch from OE commit
c81990aecae3bdf70a7c924699776b248ab7a006

Pass LDFLAGS to linker to avoid missing GNU_HASH QA errors

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../opkg-utils/opkg-utils/mtime-int.patch          |   29 ++++++++++++++++++++
 meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb |    7 +++-
 2 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/mtime-int.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/mtime-int.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/mtime-int.patch
new file mode 100644
index 0000000..fdbce21
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/mtime-int.patch
@@ -0,0 +1,29 @@
+Convert mtime to int before comparing it
+
+The st_mtime attribute (which is a float) is compared against a value
+from the timestamp database, which was stored as an integer there.
+
+When working on a filesystem with precise timestamps the comparision
+will fail nearly everytime hence.
+
+Although it might be possible to enhance the database to store the
+fractional part too, this will complicate things more than we would
+gain by this change.
+
+Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
+
+Upstream-Status: Pending
+
+Index: opkg-utils/opkg-make-index
+===================================================================
+--- opkg-utils.orig/opkg-make-index
++++ opkg-utils/opkg-make-index
+@@ -100,7 +100,7 @@ for filename in files:
+      pkg = None
+      fnameStat = os.stat(filename)
+      if old_pkg_hash.has_key(basename):
+-          if pkgsStamps.has_key(basename) and fnameStat.st_mtime == pkgsStamps[basename]:
++          if pkgsStamps.has_key(basename) and int(fnameStat.st_mtime) == pkgsStamps[basename]:
+             if (verbose):
+                sys.stderr.write("Found %s in Packages\n" % (filename,))
+             pkg = old_pkg_hash[basename]
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
index 0db6f80..79cee2e 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
@@ -9,10 +9,12 @@ RDEPENDS_${PN} = "python"
 RDEPENDS_${PN}_virtclass-native = ""
 SRCREV = "4747"
 PV = "0.1.8+svnr${SRCPV}"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "svn://svn.openmoko.org/trunk/src/host/;module=opkg-utils;proto=http \
-           file://index-ignore-filenotfound.patch"
+           file://index-ignore-filenotfound.patch \
+           file://mtime-int.patch \
+           "
 
 S = "${WORKDIR}/opkg-utils"
 
@@ -24,3 +26,4 @@ do_install() {
 }
 
 BBCLASSEXTEND = "native"
+TARGET_CC_ARCH += "${LDFLAGS}"
-- 
1.7.3.4



