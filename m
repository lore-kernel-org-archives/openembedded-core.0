Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RI2rW-0005ru-3G
	for openembedded-core@lists.openembedded.org;
	Sun, 23 Oct 2011 20:33:34 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Oct 2011 11:27:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="66250251"
Received: from unknown (HELO swold-mobl.lan) ([10.255.14.219])
	by orsmga001.jf.intel.com with ESMTP; 23 Oct 2011 11:27:31 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Oct 2011 11:27:03 -0700
Message-Id: <c9f5079f7c22555458a8e686ffbce590528e8cc8.1319394187.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1319394187.git.sgw@linux.intel.com>
References: <cover.1319394187.git.sgw@linux.intel.com>
In-Reply-To: <cover.1319394187.git.sgw@linux.intel.com>
References: <cover.1319394187.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 25/27] oprofile: Update to 0.9.7 and convert cvs->git
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
X-List-Received-Date: Sun, 23 Oct 2011 18:33:35 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../oprofile/{oprofile_0.9.6.bb => oprofile.inc}   |   13 +++------
 meta/recipes-kernel/oprofile/oprofile_0.9.7.bb     |   11 ++++++++
 meta/recipes-kernel/oprofile/oprofile_cvs.bb       |   28 --------------------
 meta/recipes-kernel/oprofile/oprofile_git.bb       |   11 ++++++++
 4 files changed, 26 insertions(+), 37 deletions(-)
 rename meta/recipes-kernel/oprofile/{oprofile_0.9.6.bb => oprofile.inc} (70%)
 create mode 100644 meta/recipes-kernel/oprofile/oprofile_0.9.7.bb
 delete mode 100644 meta/recipes-kernel/oprofile/oprofile_cvs.bb
 create mode 100644 meta/recipes-kernel/oprofile/oprofile_git.bb

diff --git a/meta/recipes-kernel/oprofile/oprofile_0.9.6.bb b/meta/recipes-kernel/oprofile/oprofile.inc
similarity index 70%
rename from meta/recipes-kernel/oprofile/oprofile_0.9.6.bb
rename to meta/recipes-kernel/oprofile/oprofile.inc
index 0f154c8..73a5a07 100644
--- a/meta/recipes-kernel/oprofile/oprofile_0.9.6.bb
+++ b/meta/recipes-kernel/oprofile/oprofile.inc
@@ -15,21 +15,16 @@ DEPENDS = "popt binutils"
 RDEPENDS_${PN} = "binutils-symlinks"
 RRECOMMENDS_${PN} = "kernel-vmlinux"
 
-FILES_${PN} = "${bindir} ${libdir}/${BPN}/lib*.so.* ${datadir}/${BPN}"
-FILES_${PN}-dev += "${libdir}/${BPN}/lib*.so ${libdir}/${BPN}/lib*.la"
+FILES_${PN} = "${bindir} ${libdir}/${BPN}/lib*${SOLIBS} ${datadir}/${BPN}"
+FILES_${PN}-dev += "${libdir}/${BPN}/lib*${SOLIBSDEV} ${libdir}/${BPN}/lib*.la"
 FILES_${PN}-staticdev += "${libdir}/${BPN}/lib*.a"
 
-PR = "r2"
+INC_PR = "r0"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/oprofile/oprofile-${PV}.tar.gz \
-           file://opstart.patch \
+SRC_URI = "file://opstart.patch \
            file://oprofile-no-query-modules.patch \
            file://acinclude.m4"
 
-SRC_URI[md5sum] = "4e407093ac06200185d5a5e6437d7242"
-SRC_URI[sha256sum] = "3f0dd40a7749fc650d25d79d42ebbff8f3b6db310c36e7c3839696cc09077880"
-S = "${WORKDIR}/oprofile-${PV}"
-
 inherit autotools
 
 EXTRA_OECONF = "--with-kernel-support --without-x"
diff --git a/meta/recipes-kernel/oprofile/oprofile_0.9.7.bb b/meta/recipes-kernel/oprofile/oprofile_0.9.7.bb
new file mode 100644
index 0000000..d7e1511
--- /dev/null
+++ b/meta/recipes-kernel/oprofile/oprofile_0.9.7.bb
@@ -0,0 +1,11 @@
+require oprofile.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI += "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "8b5d1d9b65f84420bcc3234777ad3be3"
+SRC_URI[sha256sum] = "cb5b507d5dea058d223fcad3cec8ff9638a4163106afd66d176798bbd973d527"
+
+S = "${WORKDIR}/oprofile-${PV}"
+
diff --git a/meta/recipes-kernel/oprofile/oprofile_cvs.bb b/meta/recipes-kernel/oprofile/oprofile_cvs.bb
deleted file mode 100644
index c66f4d3..0000000
--- a/meta/recipes-kernel/oprofile/oprofile_cvs.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-PV = "0.9.4+cvs${SRCDATE}"
-PR = "r1"
-SECTION = "devel"
-SUMMARY = "System-Wide Profiler"
-DESCRIPTION = "OProfile is a system-wide profiler for Linux systems, capable \
-of profiling all running code at low overhead."
-LICENSE = "GPL"
-DEPENDS = "popt binutils"
-RDEPENDS_${PN} = "binutils-symlinks"
-RRECOMMENDS_${PN} = "kernel-vmlinux"
-
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI = "cvs://anonymous@oprofile.cvs.sourceforge.net/cvsroot/oprofile;module=oprofile \
-           file://opstart.patch \
-	   file://acinclude.m4"
-S = "${WORKDIR}/oprofile"
-
-inherit autotools
-
-EXTRA_OECONF = "--with-kernel-support \
-		--without-x \
-		--disable-werror "
-
-do_configure () {
-	cp ${WORKDIR}/acinclude.m4 ${S}/
-	autotools_do_configure
-}
diff --git a/meta/recipes-kernel/oprofile/oprofile_git.bb b/meta/recipes-kernel/oprofile/oprofile_git.bb
new file mode 100644
index 0000000..c345548
--- /dev/null
+++ b/meta/recipes-kernel/oprofile/oprofile_git.bb
@@ -0,0 +1,11 @@
+require oprofile.inc
+
+SRCREV = "88f43190d412d28ebf5c75a76ba20343d0fe4c41"
+PV = "0.9.7+git${SRCPV}"
+PR = "${INC_PR}.0"
+
+SRC_URI += "git://oprofile.git.sourceforge.net/gitroot/${BPN}/${BPN};protocol=git"
+
+S = "${WORKDIR}/git"
+
+DEFAULT_PREFERENCE = "-1"
-- 
1.7.6.4



