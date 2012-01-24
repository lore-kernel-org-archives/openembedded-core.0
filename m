Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <wade_farnsworth@mentor.com>) id 1RpoMB-00041Z-Cd
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jan 2012 22:56:47 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1RpoEg-00052s-VR from wade_farnsworth@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jan 2012 13:49:03 -0800
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 24 Jan 2012 13:48:14 -0800
Received: from [172.30.9.40] (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.1.289.1;
	Tue, 24 Jan 2012 13:49:02 -0800
Message-ID: <4F1F274D.9070509@mentor.com>
Date: Tue, 24 Jan 2012 14:49:01 -0700
From: Wade Farnsworth <wade_farnsworth@mentor.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4F1F26C6.8050501@mentor.com>
In-Reply-To: <4F1F26C6.8050501@mentor.com>
X-OriginalArrivalTime: 24 Jan 2012 21:48:14.0928 (UTC)
	FILETIME=[E01B3D00:01CCDAE1]
Subject: [PATCH 3/3] systemtap: build and install uprobes.ko
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
X-List-Received-Date: Tue, 24 Jan 2012 21:56:47 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

SystemTap needs to provide uprobes.ko in order to support user space
probing.  Build and install the uprobes.ko on systems where it makes
sense to.

Signed-off-by: Wade Farnsworth <wade_farnsworth@mentor.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.bb |   57 ++++++++++++++++++++++-
 1 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 298e005..22f3993 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -2,12 +2,12 @@ DESCRIPTION = "SystemTap - script-directed dynamic tracing and performance analy
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS = "elfutils sqlite3 systemtap-native"
+DEPENDS = "elfutils sqlite3 systemtap-native virtual/kernel"
 DEPENDS_virtclass-native = "elfutils sqlite3 gettext-native"
 DEPENDS_virtclass-nativesdk = "elfutils sqlite3 gettext-native"
 
 SRCREV = "a56e4b7800e3fa8f9df6f4434cb02f86f6e995bc"
-PR = "r4"
+PR = "r5"
 PV = "1.6+git${SRCPV}"
 
 SRC_URI = "git://sources.redhat.com/git/systemtap.git;protocol=git"
@@ -28,8 +28,59 @@ COMPATIBLE_HOST = '(x86_64.*|i.86.*|powerpc.*|arm.*)-linux'
 
 S = "${WORKDIR}/git"
 
-inherit autotools gettext
+inherit autotools gettext module-base
 
 BBCLASSEXTEND = "native nativesdk"
 
+FILES_${PN} += "${datadir}/systemtap/runtime/uprobes"
 FILES_${PN}-dbg += "${libexecdir}/systemtap/.debug"
+
+# Compile and install the uprobes kernel module.  Note that staprun
+# expects it in the systemtap/runtime directory, not in /lib/modules.
+# Note that we only build uprobes on machines with utrace support.
+do_compile_uprobes() {
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
+do_compile_uprobes_virtclass-native() {
+	:
+}
+
+do_compile_uprobes_virtclass-nativesdk() {
+	:
+}
+
+do_compile_append() {
+	do_compile_uprobes
+}
+
+do_install_uprobes() {
+	if [ -e "${S}/runtime/uprobes/uprobes.ko" ]
+	then
+		install -d ${D}/usr/share/systemtap/runtime/uprobes/
+		install -m 0644 ${S}/runtime/uprobes/uprobes.ko ${D}/usr/share/systemtap/runtime/uprobes/
+	fi
+}
+
+do_install_uprobes_virtclass-native() {
+	:
+}
+
+do_install_uprobes_virtclass-nativesdk() {
+	:
+}
+
+do_install_append() {
+	do_install_uprobes
+}
-- 
1.7.0.4



