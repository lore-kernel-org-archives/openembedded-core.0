Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QlpHD-0007Hb-06
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 23:34:55 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6QLUeso028055
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 14:30:40 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 26 Jul 2011 14:30:40 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Jul 2011 16:31:06 -0500
Message-ID: <f37fcfa993314db58e3734ffb0de119f47e7e8a8.1311715727.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311715727.git.mark.hatle@windriver.com>
References: <cover.1311715727.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [v2 PATCH 5/8] linux-libc-headers: Fix file conflict -- ..install.cmd
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
X-List-Received-Date: Tue, 26 Jul 2011 21:34:55 -0000
Content-Type: text/plain

The ..install.cmd conflicts between various configure runs.

This isn't used anywhere, so remove it to avoid the conflict.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../linux-libc-headers-yocto_git.bb                |    5 ++++-
 .../linux-libc-headers_2.6.37.2.bb                 |    5 ++++-
 .../linux-libc-headers_2.6.39.bb                   |    5 +++++
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers-yocto_git.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers-yocto_git.bb
index a9b041f..1c709cb 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers-yocto_git.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers-yocto_git.bb
@@ -10,7 +10,7 @@ RPROVIDES_${PN}-dev = "linux-libc-headers-dev"
 RPROVIDES_${PN}-dbg = "linux-libc-headers-dbg"
 SRCREV = "69cfbdf9f1ff461a75e5b77d6d7ba35e97db4cc3"
 PV = "2.6.37+git-${SRCPV}"
-PR = "r3"
+PR = "r4"
 
 SRCREV_FORMAT = "meta_machine"
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-2.6.37;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
@@ -47,6 +47,9 @@ do_compile () {
 do_install() {
 	set_arch
 	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=$ARCH
+
+        # The ..install.cmd conflicts between various configure runs
+        find ${D}${includedir} -name ..install.cmd | xargs rm -f
 }
 
 BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb
index 51c4926..55d7527 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb
@@ -2,7 +2,7 @@ require linux-libc-headers.inc
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS += "unifdef-native"
-PR = "r1"
+PR = "r2"
 
 SRC_URI += " file://connector-msg-size-fix.patch"
 
@@ -43,6 +43,9 @@ do_install() {
 	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=$ARCH
 	# Kernel should not be exporting this header
 	rm -f ${D}${exec_prefix}/include/scsi/scsi.h
+
+	# The ..install.cmd conflicts between various configure runs
+	find ${D}${includedir} -name ..install.cmd | xargs rm -f
 }
 
 BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.39.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.39.bb
index 65c19ec..14f5e8a 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.39.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.39.bb
@@ -9,6 +9,8 @@ SRC_URI[sha256sum] = "584d17f2a3ee18a9501d7ff36907639e538cfdba4529978b8550c461d4
 
 S = "${WORKDIR}/linux-${PV}"
 
+PR = "r2"
+
 set_arch() {
 	case ${TARGET_ARCH} in
 		alpha*)   ARCH=alpha ;;
@@ -44,6 +46,9 @@ do_install() {
 	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=$ARCH
 	# Kernel should not be exporting this header
 	rm -f ${D}${exec_prefix}/include/scsi/scsi.h
+
+        # The ..install.cmd conflicts between various configure runs
+        find ${D}${includedir} -name ..install.cmd | xargs rm -f
 }
 
 BBCLASSEXTEND = "nativesdk"
-- 
1.7.3.4



