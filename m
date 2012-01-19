Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnoKN-0004Cw-NI
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 10:30:40 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Jan 2012 01:22:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97472081"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 19 Jan 2012 01:22:56 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2012 01:22:22 -0800
Message-Id: <a07e6449a19deec698f6682c97f8f5c8d3b51486.1326964778.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 01/33] m4: A better refactoring
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
X-List-Received-Date: Thu, 19 Jan 2012 09:30:40 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/m4/m4-1.4.16.inc       |   14 ++++++++++++++
 meta/recipes-devtools/m4/m4-1.4.9.inc        |   13 +++++++++++++
 meta/recipes-devtools/m4/m4-native_1.4.16.bb |    2 +-
 meta/recipes-devtools/m4/m4-native_1.4.9.bb  |    4 ++--
 meta/recipes-devtools/m4/m4.inc              |   11 +----------
 meta/recipes-devtools/m4/m4_1.4.16.bb        |    2 +-
 meta/recipes-devtools/m4/m4_1.4.9.bb         |   19 +------------------
 7 files changed, 33 insertions(+), 32 deletions(-)
 create mode 100644 meta/recipes-devtools/m4/m4-1.4.16.inc
 create mode 100644 meta/recipes-devtools/m4/m4-1.4.9.inc

diff --git a/meta/recipes-devtools/m4/m4-1.4.16.inc b/meta/recipes-devtools/m4/m4-1.4.16.inc
new file mode 100644
index 0000000..139193c
--- /dev/null
+++ b/meta/recipes-devtools/m4/m4-1.4.16.inc
@@ -0,0 +1,14 @@
+require m4.inc
+
+LICENSE = "GPLv3"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
+	            file://examples/COPYING;md5=fbc986d45b3dae6725c29870dd6b669d"
+
+PR = "r2"
+SRC_URI += "file://ac_config_links.patch"
+
+SRC_URI[md5sum] = "a5dfb4f2b7370e9d34293d23fd09b280"
+SRC_URI[sha256sum] = "e9176a35bb13a1b08482359aa554ee8072794f58f00e4827bf0e06b570c827da"
+
+
diff --git a/meta/recipes-devtools/m4/m4-1.4.9.inc b/meta/recipes-devtools/m4/m4-1.4.9.inc
new file mode 100644
index 0000000..a5d243c
--- /dev/null
+++ b/meta/recipes-devtools/m4/m4-1.4.9.inc
@@ -0,0 +1,13 @@
+require m4.inc
+
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe\
+	file://examples/COPYING;md5=1d49bd61dc590f014cae7173b43e3e5c"
+
+PR = "r1"
+SRC_URI += "file://fix_for_circular_dependency.patch"
+
+SRC_URI[md5sum] = "1ba8e147aff5e79bd2bfb983d86b53d5"
+SRC_URI[sha256sum] = "815ce53853fbf6493617f467389b799208b1ec98296b95be44a683f8bcfd7c47"
+
diff --git a/meta/recipes-devtools/m4/m4-native_1.4.16.bb b/meta/recipes-devtools/m4/m4-native_1.4.16.bb
index 39ed4e8..06d8aa2 100644
--- a/meta/recipes-devtools/m4/m4-native_1.4.16.bb
+++ b/meta/recipes-devtools/m4/m4-native_1.4.16.bb
@@ -1,4 +1,4 @@
-require m4.inc
+require m4-${PV}.inc
 
 inherit native
 
diff --git a/meta/recipes-devtools/m4/m4-native_1.4.9.bb b/meta/recipes-devtools/m4/m4-native_1.4.9.bb
index fa871b3..23a21d0 100644
--- a/meta/recipes-devtools/m4/m4-native_1.4.9.bb
+++ b/meta/recipes-devtools/m4/m4-native_1.4.9.bb
@@ -1,5 +1,4 @@
-require m4_${PV}.bb
-inherit native
+require m4-${PV}.inc
 
 INHIBIT_AUTOTOOLS_DEPS = "1"
 DEPENDS += "gnu-config-native"
@@ -10,3 +9,4 @@ do_configure()  {
 	oe_runconf
 }
 
+inherit native
diff --git a/meta/recipes-devtools/m4/m4.inc b/meta/recipes-devtools/m4/m4.inc
index bc1dacb..a130318 100644
--- a/meta/recipes-devtools/m4/m4.inc
+++ b/meta/recipes-devtools/m4/m4.inc
@@ -2,18 +2,9 @@ SUMMARY = "Traditional Unix macro processor"
 DESCRIPTION = "GNU m4 is an implementation of the traditional Unix macro processor.  It is mostly SVR4 \
 compatible although it has some extensions (for example, handling more than 9 positional parameters to macros). \
 GNU M4 also has built-in functions for including files, running shell commands, doing arithmetic, etc."
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
-	            file://examples/COPYING;md5=fbc986d45b3dae6725c29870dd6b669d"
-
-PR = "r2"
-SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz \
-           file://ac_config_links.patch"
-
-SRC_URI[md5sum] = "a5dfb4f2b7370e9d34293d23fd09b280"
-SRC_URI[sha256sum] = "e9176a35bb13a1b08482359aa554ee8072794f58f00e4827bf0e06b570c827da"
 
 inherit autotools
 
 EXTRA_OEMAKE += "'infodir=${infodir}'"
 
+SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz"
diff --git a/meta/recipes-devtools/m4/m4_1.4.16.bb b/meta/recipes-devtools/m4/m4_1.4.16.bb
index bb4ca35..b12c0ad 100644
--- a/meta/recipes-devtools/m4/m4_1.4.16.bb
+++ b/meta/recipes-devtools/m4/m4_1.4.16.bb
@@ -1,3 +1,3 @@
-require m4.inc
+require m4-${PV}.inc
 
 BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/m4/m4_1.4.9.bb b/meta/recipes-devtools/m4/m4_1.4.9.bb
index e79239b..b12c0ad 100644
--- a/meta/recipes-devtools/m4/m4_1.4.9.bb
+++ b/meta/recipes-devtools/m4/m4_1.4.9.bb
@@ -1,20 +1,3 @@
-SUMMARY = "Traditional Unix macro processor"
-DESCRIPTION = "GNU m4 is an implementation of the traditional Unix macro processor.  It is mostly SVR4 \
-compatible although it has some extensions (for example, handling more than 9 positional parameters to macros). \
-GNU M4 also has built-in functions for including files, running shell commands, doing arithmetic, etc."
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe\
-	file://examples/COPYING;md5=1d49bd61dc590f014cae7173b43e3e5c"
-
-PR = "r1"
-SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz \
-	file://fix_for_circular_dependency.patch "
-
-SRC_URI[md5sum] = "1ba8e147aff5e79bd2bfb983d86b53d5"
-SRC_URI[sha256sum] = "815ce53853fbf6493617f467389b799208b1ec98296b95be44a683f8bcfd7c47"
-
-inherit autotools
-
-EXTRA_OEMAKE += "'infodir=${infodir}'"
+require m4-${PV}.inc
 
 BBCLASSEXTEND = "nativesdk"
-- 
1.7.6.5



