Received: from stoexhub01.domain01.net ([83.145.59.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QcdVi-0005EY-C4
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 15:11:54 +0200
Received: from localhost (193.235.91.228) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server id 8.3.137.0; Fri, 1 Jul 2011
	15:08:08 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Jul 2011 15:07:57 +0200
Message-ID: <8b9a58eeedbb3c4e95d7ed71b8da1507f31bb384.1309525642.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1309525642.git.anders@chargestorm.se>
References: <cover.1309525642.git.anders@chargestorm.se>
MIME-Version: 1.0
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH v5 1/8] Remove support for building 2.4 kernels
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
X-List-Received-Date: Fri, 01 Jul 2011 13:11:54 -0000
Content-Type: text/plain

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 meta/classes/kernel.bbclass      |   12 ++----------
 meta/classes/module-base.bbclass |    2 +-
 2 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index f282a57..25f4855 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -73,9 +73,6 @@ KERNEL_ALT_IMAGETYPE ??= ""
 kernel_do_compile() {
 	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
 	oe_runmake include/linux/version.h CC="${KERNEL_CC}" LD="${KERNEL_LD}"
-	if [ "${KERNEL_MAJOR_VERSION}" != "2.6" ]; then
-		oe_runmake dep CC="${KERNEL_CC}" LD="${KERNEL_LD}"
-	fi
 	oe_runmake ${KERNEL_IMAGETYPE} ${KERNEL_ALT_IMAGETYPE} CC="${KERNEL_CC}" LD="${KERNEL_LD}"
 }
 
@@ -111,9 +108,7 @@ kernel_do_install() {
 	install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
 	[ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/boot/Module.symvers-${KERNEL_VERSION}
 	install -d ${D}/etc/modutils
-	if [ "${KERNEL_MAJOR_VERSION}" = "2.6" ]; then
-		install -d ${D}/etc/modprobe.d
-	fi
+	install -d ${D}/etc/modprobe.d
 
 	#
 	# Support for external module building - create a minimal copy of the
@@ -397,10 +392,7 @@ python populate_packages_prepend () {
 		# Write out any modconf fragment
 		modconf = bb.data.getVar('module_conf_%s' % basename, d, 1)
 		if modconf:
-			if bb.data.getVar("KERNEL_MAJOR_VERSION", d, 1) == "2.6":
-				name = '%s/etc/modprobe.d/%s.conf' % (dvar, basename)
-			else:
-				name = '%s/etc/modutils/%s.conf' % (dvar, basename)
+			name = '%s/etc/modprobe.d/%s.conf' % (dvar, basename)
 			f = open(name, 'w')
 			f.write("%s\n" % modconf)
 			f.close()
diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
index c98bace..a7cf233 100644
--- a/meta/classes/module-base.bbclass
+++ b/meta/classes/module-base.bbclass
@@ -7,7 +7,7 @@ export CROSS_COMPILE = "${TARGET_PREFIX}"
 
 export KERNEL_VERSION = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-abiversion')}"
 export KERNEL_SOURCE = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-source')}"
-KERNEL_OBJECT_SUFFIX = "${@[".o", ".ko"][base_read_file('${STAGING_KERNEL_DIR}/kernel-abiversion') > "2.6.0"]}"
+KERNEL_OBJECT_SUFFIX = ".ko"
 KERNEL_CCSUFFIX = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-ccsuffix')}"
 KERNEL_LDSUFFIX = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-ldsuffix')}"
 KERNEL_ARSUFFIX = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-arsuffix')}"
-- 
1.7.4.1



