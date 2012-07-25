Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Stw3h-0004Xt-4O
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 09:31:01 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Jul 2012 00:19:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="172897579"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.97])
	by azsmga001.ch.intel.com with ESMTP; 25 Jul 2012 00:19:29 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jul 2012 00:19:09 -0700
Message-Id: <628f394ac4d2f87418149d4fdf71ccae11111274.1343200454.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1343200454.git.sgw@linux.intel.com>
References: <cover.1343200454.git.sgw@linux.intel.com>
In-Reply-To: <cover.1343200454.git.sgw@linux.intel.com>
References: <cover.1343200454.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 15/28] remake: Add remake-native and remake
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
X-List-Received-Date: Wed, 25 Jul 2012 07:31:02 -0000

From: Wenzong Fan <wenzong.fan@windriver.com>

remake is a patched version of GNU Make that adds improved error
reporting, the ability to trace execution in a comprehensible way,
and a debugger.

[YOCTO #2402]

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/remake/remake.inc            |   16 ++++++++++++
 .../remake/remake/version-remake.texi.patch        |   16 ++++++++++++
 meta/recipes-devtools/remake/remake_git.bb         |   25 ++++++++++++++++++++
 3 files changed, 57 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/remake/remake.inc
 create mode 100644 meta/recipes-devtools/remake/remake/version-remake.texi.patch
 create mode 100644 meta/recipes-devtools/remake/remake_git.bb

diff --git a/meta/recipes-devtools/remake/remake.inc b/meta/recipes-devtools/remake/remake.inc
new file mode 100644
index 0000000..6ac833e
--- /dev/null
+++ b/meta/recipes-devtools/remake/remake.inc
@@ -0,0 +1,16 @@
+SUMMARY = "Makefile debugger which is gnumake 3.81 compatible"
+DESCRIPTION = "remake is a patched and modernized version of GNU make \
+utility that adds improved error reporting, the ability to trace \
+execution in a comprehensible way, and a debugger."
+
+HOMEPAGE = "http://bashdb.sourceforge.net/remake/"
+SECTION = "devel"
+
+SRC_URI = "git://github.com/rocky/remake.git"
+
+inherit autotools gettext update-alternatives
+
+ALTERNATIVE_${PN} = "make"
+ALTERNATIVE_LINK_NAME[make] = "${bindir}/make"
+ALTERNATIVE_TARGET[make] = "${bindir}/remake"
+ALTERNATIVE_PRIORITY = "100"
diff --git a/meta/recipes-devtools/remake/remake/version-remake.texi.patch b/meta/recipes-devtools/remake/remake/version-remake.texi.patch
new file mode 100644
index 0000000..fa6329e
--- /dev/null
+++ b/meta/recipes-devtools/remake/remake/version-remake.texi.patch
@@ -0,0 +1,16 @@
+Upstream-Status: Pending
+
+version-remake.texi is not there but it is required by remake.texi,
+just add it for getting the 'make remake.info' works.
+
+==============================================================
+diff --git a/doc/version-remake.texi b/doc/version-remake.texi
+new file mode 100644
+index 0000000..2a3b72b
+--- /dev/null
++++ b/doc/version-remake.texi
+@@ -0,0 +1,4 @@
++@set UPDATED 10 June 2012
++@set UPDATED-MONTH June 2012
++@set EDITION 3.82+dbg-0.9git
++@set VERSION 3.82+dbg-0.9git
diff --git a/meta/recipes-devtools/remake/remake_git.bb b/meta/recipes-devtools/remake/remake_git.bb
new file mode 100644
index 0000000..7e9857e9
--- /dev/null
+++ b/meta/recipes-devtools/remake/remake_git.bb
@@ -0,0 +1,25 @@
+PR = "r0"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://tests/COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://glob/COPYING.LIB;md5=4a770b67e6be0f60da244beb2de0fce4"
+require remake.inc
+
+SRC_URI += "file://version-remake.texi.patch"
+SRCREV = "414d6e84121c6740ff5079370c905dea0f0e1ddb"
+S = "${WORKDIR}/git"
+
+DEPENDS += "readline"
+PROVIDES += "make"
+
+do_configure_prepend() {
+    # create config.rpath which required by configure.ac
+    autopoint || touch config.rpath
+}
+
+do_compile_prepend() {
+    # updating .po and other gnu build files
+    make update
+}
+
+BBCLASSEXTEND = "native"
-- 
1.7.7.6



