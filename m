Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <wade_farnsworth@mentor.com>) id 1RqVBA-0002bK-Th
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 20:40:17 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1RqV3c-0006gf-HU from wade_farnsworth@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 11:32:28 -0800
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 26 Jan 2012 11:32:28 -0800
Received: from [172.30.9.43] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.1.289.1;
	Thu, 26 Jan 2012 11:32:27 -0800
Message-ID: <4F21AA4B.607@mentor.com>
Date: Thu, 26 Jan 2012 12:32:27 -0700
From: Wade Farnsworth <wade_farnsworth@mentor.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4F1F26C6.8050501@mentor.com> <4F21A9CF.3020103@mentor.com>
In-Reply-To: <4F21A9CF.3020103@mentor.com>
X-OriginalArrivalTime: 26 Jan 2012 19:32:28.0464 (UTC)
	FILETIME=[3D42FB00:01CCDC61]
Subject: [PATCH v2 3/3] systemtap: build and install uprobes.ko
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
X-List-Received-Date: Thu, 26 Jan 2012 19:40:17 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

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
index 0000000..7ae9cb8
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
@@ -0,0 +1,42 @@
+DESCRIPTION = "UProbes kernel module for SystemTap"
+
+require systemtap_git.inc
+
+DEPENDS = "virtual/gettext systemtap virtual/kernel"
+
+PR = "r0"
+
+# On systems without CONFIG_UTRACE, this package is empty.
+ALLOW_EMPTY = 1
+
+inherit module-base
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
index 298e005..8c6f9a0 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -1,16 +1,12 @@
 DESCRIPTION = "SystemTap - script-directed dynamic tracing and performance analysis tool for Linux"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+require systemtap_git.inc
 
 DEPENDS = "elfutils sqlite3 systemtap-native"
 DEPENDS_virtclass-native = "elfutils sqlite3 gettext-native"
 DEPENDS_virtclass-nativesdk = "elfutils sqlite3 gettext-native"
 
-SRCREV = "a56e4b7800e3fa8f9df6f4434cb02f86f6e995bc"
-PR = "r4"
-PV = "1.6+git${SRCPV}"
-
-SRC_URI = "git://sources.redhat.com/git/systemtap.git;protocol=git"
+PR = "r5"
 
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
index 0000000..2e41d7d
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -0,0 +1,16 @@
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRCREV = "a56e4b7800e3fa8f9df6f4434cb02f86f6e995bc"
+PV = "1.6+git${SRCPV}"
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
1.7.0.4



