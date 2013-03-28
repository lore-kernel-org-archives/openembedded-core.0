Received: from co1ehsobe006.messaging.microsoft.com ([216.32.180.189]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1UL4z7-0003II-6p
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Mar 2013 06:02:46 +0100
Received: from mail169-co1-R.bigfish.com (10.243.78.231) by
	CO1EHSOBE008.bigfish.com (10.243.66.71) with Microsoft SMTP Server id
	14.1.225.23; Thu, 28 Mar 2013 04:15:29 +0000
Received: from mail169-co1 (localhost [127.0.0.1])	by
	mail169-co1-R.bigfish.com (Postfix) with ESMTP id DBE37B8018C	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2013 04:15:28 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1fc6h1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail169-co1 (localhost.localdomain [127.0.0.1]) by mail169-co1
	(MessageSwitch) id 1364444127275965_6736;
	Thu, 28 Mar 2013 04:15:27 +0000 (UTC)
Received: from CO1EHSMHS021.bigfish.com (unknown [10.243.78.252])	by
	mail169-co1.bigfish.com (Postfix) with ESMTP id 370053000A0	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2013 04:15:27 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS021.bigfish.com
	(10.243.66.31) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 28 Mar 2013 04:15:26 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Thu, 28 Mar 2013 04:15:25 +0000
Received: from b19537-desktop.ap.freescale.net
	(b19537-desktop.ap.freescale.net [10.192.208.197])	by
	az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id r2S4FLTu026319;
	Wed, 27 Mar 2013 21:15:23 -0700
From: Zhenhua Luo <zhenhua.luo@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Mar 2013 12:18:45 +0800
Message-ID: <1364444326-16088-1-git-send-email-zhenhua.luo@freescale.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Zhenhua Luo <zhenhua.luo@freescale.com>
Subject: [oe-core v3] rpm: split out run-postinsts
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Mar 2013 05:02:47 -0000
Content-Type: text/plain

1. Split out run-postinsts script into separated package, sometimes only the
   postinsts script is required to run all postinsts scripts in /etc/rpm-postinsts/
   instead of the whole rpm package.
2. Set ROOTFS_PKGMANAGE_BOOTSTRAP to rpm-postinsts

Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
---
 meta/classes/rootfs_rpm.bbclass        |    4 +---
 meta/recipes-devtools/rpm/rpm_5.4.9.bb |    8 +++++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 8392a1e..07ac0e3 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -3,6 +3,7 @@
 #
 
 ROOTFS_PKGMANAGE = "rpm smartpm"
+ROOTFS_PKGMANAGE_BOOTSTRAP = "rpm-postinsts"
 
 # Add 50Meg of extra space for Smart
 IMAGE_ROOTFS_EXTRA_SPACE_append = "${@base_contains("PACKAGE_INSTALL", "smartpm", " + 51200", "" ,d)}"
@@ -10,9 +11,6 @@ IMAGE_ROOTFS_EXTRA_SPACE_append = "${@base_contains("PACKAGE_INSTALL", "smartpm"
 # Smart is python based, so be sure python-native is available to us.
 EXTRANATIVEPATH += "python-native"
 
-# Postinstalls on device are handled within this class at present
-ROOTFS_PKGMANAGE_BOOTSTRAP = ""
-
 do_rootfs[depends] += "rpm-native:do_populate_sysroot"
 do_rootfs[depends] += "rpmresolve-native:do_populate_sysroot"
 do_rootfs[depends] += "python-smartpm-native:do_populate_sysroot"
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index 6286771..cfdc390 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "libpcre attr acl popt ossp-uuid file bison-native"
-PR = "r61"
+PR = "r62"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -199,7 +199,7 @@ CFLAGS_append = " -DRPM_VENDOR_WINDRIVER -DRPM_VENDOR_POKY -DRPM_VENDOR_OE"
 
 LDFLAGS_append_libc-uclibc = "-lrt -lpthread"
 
-PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev ${PN}-staticdev ${PN}-common ${PN}-build python-rpm-dbg python-rpm-staticdev python-rpm-dev python-rpm perl-module-rpm perl-module-rpm-dev ${PN}-locale"
+PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-libs ${PN}-dev ${PN}-staticdev ${PN}-common ${PN}-build python-rpm-dbg python-rpm-staticdev python-rpm-dev python-rpm perl-module-rpm perl-module-rpm-dev ${PN}-locale ${PN}-postinsts"
 
 SOLIBS = "5.4.so"
 
@@ -223,9 +223,11 @@ FILES_${PN} =  "${bindir}/rpm \
 		${libdir}/rpm/bin/wget \
 		/var/lib/rpm \
 		/var/cache/rpm \
-		${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts \
 		"
 
+FILES_${PN}-postinsts = "${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts \
+                "
+
 FILES_${PN}-dbg += "${libdir}/rpm/.debug \
 		${libdir}/rpm/bin/.debug \
 		"
-- 
1.7.5.4




