Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4b4-0006um-0c
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:40:50 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 17 Jan 2012 00:33:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96633094"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:33:10 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:32:36 -0800
Message-Id: <a680d539593f57953b1a0f365047b4c9294783b9.1326786990.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 51/62] m4: refactor .bb and .inc files
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
X-List-Received-Date: Tue, 17 Jan 2012 08:40:51 -0000

The orignal had common code in the m4_1.4.16.bb file that was
in the m4.inc file. m4-native was then including the m4.bb file
and picking up the BBCLASSEXTEND, which causes the fetch to fail.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/m4/m4-native_1.4.16.bb |    3 ++-
 meta/recipes-devtools/m4/m4.inc              |   19 +++++++++++++++++++
 meta/recipes-devtools/m4/m4_1.4.16.bb        |   19 +------------------
 3 files changed, 22 insertions(+), 19 deletions(-)
 create mode 100644 meta/recipes-devtools/m4/m4.inc

diff --git a/meta/recipes-devtools/m4/m4-native_1.4.16.bb b/meta/recipes-devtools/m4/m4-native_1.4.16.bb
index fa871b3..39ed4e8 100644
--- a/meta/recipes-devtools/m4/m4-native_1.4.16.bb
+++ b/meta/recipes-devtools/m4/m4-native_1.4.16.bb
@@ -1,4 +1,5 @@
-require m4_${PV}.bb
+require m4.inc
+
 inherit native
 
 INHIBIT_AUTOTOOLS_DEPS = "1"
diff --git a/meta/recipes-devtools/m4/m4.inc b/meta/recipes-devtools/m4/m4.inc
new file mode 100644
index 0000000..bc1dacb
--- /dev/null
+++ b/meta/recipes-devtools/m4/m4.inc
@@ -0,0 +1,19 @@
+SUMMARY = "Traditional Unix macro processor"
+DESCRIPTION = "GNU m4 is an implementation of the traditional Unix macro processor.  It is mostly SVR4 \
+compatible although it has some extensions (for example, handling more than 9 positional parameters to macros). \
+GNU M4 also has built-in functions for including files, running shell commands, doing arithmetic, etc."
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
+	            file://examples/COPYING;md5=fbc986d45b3dae6725c29870dd6b669d"
+
+PR = "r2"
+SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz \
+           file://ac_config_links.patch"
+
+SRC_URI[md5sum] = "a5dfb4f2b7370e9d34293d23fd09b280"
+SRC_URI[sha256sum] = "e9176a35bb13a1b08482359aa554ee8072794f58f00e4827bf0e06b570c827da"
+
+inherit autotools
+
+EXTRA_OEMAKE += "'infodir=${infodir}'"
+
diff --git a/meta/recipes-devtools/m4/m4_1.4.16.bb b/meta/recipes-devtools/m4/m4_1.4.16.bb
index 58b0491..bb4ca35 100644
--- a/meta/recipes-devtools/m4/m4_1.4.16.bb
+++ b/meta/recipes-devtools/m4/m4_1.4.16.bb
@@ -1,20 +1,3 @@
-SUMMARY = "Traditional Unix macro processor"
-DESCRIPTION = "GNU m4 is an implementation of the traditional Unix macro processor.  It is mostly SVR4 \
-compatible although it has some extensions (for example, handling more than 9 positional parameters to macros). \
-GNU M4 also has built-in functions for including files, running shell commands, doing arithmetic, etc."
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
-	file://examples/COPYING;md5=fbc986d45b3dae6725c29870dd6b669d"
-
-PR = "r1"
-SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz \
-           file://ac_config_links.patch"
-
-SRC_URI[md5sum] = "a5dfb4f2b7370e9d34293d23fd09b280"
-SRC_URI[sha256sum] = "e9176a35bb13a1b08482359aa554ee8072794f58f00e4827bf0e06b570c827da"
-
-inherit autotools
-
-EXTRA_OEMAKE += "'infodir=${infodir}'"
+require m4.inc
 
 BBCLASSEXTEND = "nativesdk"
-- 
1.7.6.5



