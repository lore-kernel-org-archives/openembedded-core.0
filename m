Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RutvN-0004HI-JK
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 23:54:09 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Feb 2012 14:46:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122206397"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.116])
	by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2012 14:46:00 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2012 14:45:34 -0800
Message-Id: <3cc4ba935444240b93abdc726342658ada803118.1328654424.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328654424.git.sgw@linux.intel.com>
References: <cover.1328654424.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328654424.git.sgw@linux.intel.com>
References: <cover.1328654424.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 14/35] systemtap: build and install uprobes.ko
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
X-List-Received-Date: Tue, 07 Feb 2012 22:54:10 -0000

From: Wade Farnsworth <wade_farnsworth@mentor.com>

SystemTap needs to provide uprobes.ko in order to support user space
probing.  Build and install the module on systems that support it.

Additionally, split off common bits into systemtap_git.inc.

Signed-off-by: Wade Farnsworth <wade_farnsworth@mentor.com>
---
 .../systemtap/systemtap-uprobes_git.bb             |   42 ++++++++++++++++++++
 meta/recipes-kernel/systemtap/systemtap_git.bb     |   18 +-------
 meta/recipes-kernel/systemtap/systemtap_git.inc    |   16 +++++++
 3 files changed, 61 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
 create mode 100644 meta/recipes-kernel/systemtap/systemtap_git.inc

diff --git a/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb b/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
new file mode 100644
index 0000000..7fa6748
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
@@ -0,0 +1,42 @@
+DESCRIPTION = "UProbes kernel module for SystemTap"
+
+require systemtap_git.inc
+
+DEPENDS = "systemtap virtual/kernel"
+
+PR = "r0"
+
+# On systems without CONFIG_UTRACE, this package is empty.
+ALLOW_EMPTY_${PN} = 1
+
+inherit module-base gettext
+
+FILES_${PN} += "${datadir}/systemtap/runtime/uprobes"
+
+EXTRA_OEMAKE = ""
+
+# Compile and install the uprobes kernel module on machines with utrace
+# support.  Note that staprun expects it in the systemtap/runtime directory,
+# not in /lib/modules.
+do_compile() {
+	if grep -q "CONFIG_UTRACE=y" ${STAGING_KERNEL_DIR}/.config
+	then
+		unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS CC LD CPP
+		oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
+			   AR="${KERNEL_AR}" \
+			   -C ${STAGING_KERNEL_DIR} scripts
+		oe_runmake KDIR=${STAGING_KERNEL_DIR}   \
+			   M="${S}/runtime/uprobes/" \
+			   CC="${KERNEL_CC}" LD="${KERNEL_LD}" \
+			   AR="${KERNEL_AR}" \
+			   -C "${S}/runtime/uprobes/"
+	fi
+}
+
+do_install() {
+	if [ -e "${S}/runtime/uprobes/uprobes.ko" ]
+	then
+		install -d ${D}/usr/share/systemtap/runtime/uprobes/
+		install -m 0644 ${S}/runtime/uprobes/uprobes.ko ${D}/usr/share/systemtap/runtime/uprobes/
+	fi
+}
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index fb3c0ef..c4a9d87 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -1,16 +1,12 @@
 DESCRIPTION = "SystemTap - script-directed dynamic tracing and performance analysis tool for Linux"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+require systemtap_git.inc
 
 DEPENDS = "elfutils sqlite3 systemtap-native"
 DEPENDS_virtclass-native = "elfutils-native sqlite3-native gettext-native"
 DEPENDS_virtclass-nativesdk = "elfutils-nativesdk sqlite3-nativesdk gettext-nativesdk"
 
-SRCREV = "83bd2699d8cff2f2d6b9eaf5ea254e4cb6b33e81"
-PR = "r1"
-PV = "1.7+git${SRCPV}"
-
-SRC_URI = "git://sources.redhat.com/git/systemtap.git;protocol=git"
+PR = "r2"
 
 EXTRA_OECONF += "--with-libelf=${STAGING_DIR_TARGET} --without-rpm \
 	     ac_cv_file__usr_include_nss=no \
@@ -20,14 +16,6 @@ EXTRA_OECONF += "--with-libelf=${STAGING_DIR_TARGET} --without-rpm \
 	     ac_cv_file__usr_include_avahi_client=no \
 	     ac_cv_file__usr_include_avahi_common=no "
 
-SRC_URI[md5sum]    = "cb202866ed704c44a876d041f788bdee"
-SRC_URI[sha256sum] = "8ffe35caec0d937bd23fd78a3a8d94b58907cc0de0330b35e38f9f764815c459"
-
-# systemtap doesn't support mips
-COMPATIBLE_HOST = '(x86_64.*|i.86.*|powerpc.*|arm.*)-linux'
-
-S = "${WORKDIR}/git"
-
 inherit autotools gettext
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
new file mode 100644
index 0000000..cc250ff
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -0,0 +1,16 @@
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRCREV = "83bd2699d8cff2f2d6b9eaf5ea254e4cb6b33e81"
+PV = "1.7+git${SRCPV}"
+
+SRC_URI = "git://sources.redhat.com/git/systemtap.git;protocol=git"
+
+SRC_URI[md5sum]    = "cb202866ed704c44a876d041f788bdee"
+SRC_URI[sha256sum] = "8ffe35caec0d937bd23fd78a3a8d94b58907cc0de0330b35e38f9f764815c459"
+
+# systemtap doesn't support mips
+COMPATIBLE_HOST = '(x86_64.*|i.86.*|powerpc.*|arm.*)-linux'
+
+S = "${WORKDIR}/git"
+
-- 
1.7.6.5



