Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1StCnm-0004zq-Bl
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 09:11:34 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6N5pIAP024388
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jul 2012 22:51:18 -0700 (PDT)
Received: from usp-ub1204-64.corp.ad.wrs.com (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Sun, 22 Jul 2012 22:51:17 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Jul 2012 13:50:53 +0800
Message-ID: <3d42be087d89558631512f873efd68f7057fd9f8.1343022482.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343022482.git.wenzong.fan@windriver.com>
References: <cover.1343022482.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] remake: Add remake-native and remake
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
X-List-Received-Date: Mon, 23 Jul 2012 07:11:34 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

remake is a patched version of GNU Make that adds improved error
reporting, the ability to trace execution in a comprehensible way,
and a debugger.

[YOCTO #2402]

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-devtools/remake/remake.inc            |   16 +++++++++++++
 .../remake/remake/version-remake.texi.patch        |   16 +++++++++++++
 meta/recipes-devtools/remake/remake_git.bb         |   25 ++++++++++++++++++++
 3 files changed, 57 insertions(+)
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
1.7.9.5



