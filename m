Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QZ1XX-0003za-5r
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 16:02:51 +0200
Received: by wyb34 with SMTP id 34so2309095wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 06:59:17 -0700 (PDT)
Received: by 10.227.24.74 with SMTP id u10mr4916579wbb.69.1308664757730;
	Tue, 21 Jun 2011 06:59:17 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fm6sm1445245wbb.27.2011.06.21.06.59.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Jun 2011 06:59:16 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Jun 2011 15:59:07 +0200
Message-Id: <1308664747-32727-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] linux-libc-headers: add 2.6.39
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
X-List-Received-Date: Tue, 21 Jun 2011 14:02:51 -0000

The 2.6.37.2 version is kept to allow the qemu kernels and libc headers version to match
---
 .../linux-libc-headers_2.6.39.bb                   |   49 ++++++++++++++++++++
 1 files changed, 49 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.39.bb

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.39.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.39.bb
new file mode 100644
index 0000000..65c19ec
--- /dev/null
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.39.bb
@@ -0,0 +1,49 @@
+require linux-libc-headers.inc
+
+INHIBIT_DEFAULT_DEPS = "1"
+DEPENDS += "unifdef-native"
+
+SRC_URI += " file://connector-msg-size-fix.patch"
+SRC_URI[md5sum] = "1aab7a741abe08d42e8eccf20de61e05"
+SRC_URI[sha256sum] = "584d17f2a3ee18a9501d7ff36907639e538cfdba4529978b8550c461d45c61f6"
+
+S = "${WORKDIR}/linux-${PV}"
+
+set_arch() {
+	case ${TARGET_ARCH} in
+		alpha*)   ARCH=alpha ;;
+		arm*)     ARCH=arm ;;
+		cris*)    ARCH=cris ;;
+		hppa*)    ARCH=parisc ;;
+		i*86*)    ARCH=i386 ;;
+		ia64*)    ARCH=ia64 ;;
+		mips*)    ARCH=mips ;;
+		m68k*)    ARCH=m68k ;;
+		powerpc*) ARCH=powerpc ;;
+		s390*)    ARCH=s390 ;;
+		sh*)      ARCH=sh ;;
+		sparc64*) ARCH=sparc64 ;;
+		sparc*)   ARCH=sparc ;;
+		x86_64*)  ARCH=x86_64 ;;
+		avr32*)   ARCH=avr32 ;;
+		bfin*)    ARCH=blackfin ;;
+		microblaze*) ARCH=microblaze ;;
+	esac
+}
+
+do_configure() {
+	set_arch
+	oe_runmake allnoconfig ARCH=$ARCH
+}
+
+do_compile () {
+}
+
+do_install() {
+	set_arch
+	oe_runmake headers_install INSTALL_HDR_PATH=${D}${exec_prefix} ARCH=$ARCH
+	# Kernel should not be exporting this header
+	rm -f ${D}${exec_prefix}/include/scsi/scsi.h
+}
+
+BBCLASSEXTEND = "nativesdk"
-- 
1.6.6.1



