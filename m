Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B05456@freescale.com>) id 1TULSe-00030J-VA
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Nov 2012 18:55:17 +0100
Received: from mail62-ch1-R.bigfish.com (10.43.68.238) by
	CH1EHSOBE006.bigfish.com (10.43.70.56) with Microsoft SMTP Server id
	14.1.225.23; Fri, 2 Nov 2012 17:11:21 +0000
Received: from mail62-ch1 (localhost [127.0.0.1])	by mail62-ch1-R.bigfish.com
	(Postfix) with ESMTP id B1A74380124	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2012 17:11:21 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1de0h1202h1d1ah1d2ahzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h1354h137ah139eh13b6h1441h1504h1537h1155h)
Received: from mail62-ch1 (localhost.localdomain [127.0.0.1]) by mail62-ch1
	(MessageSwitch) id 1351876279990983_2897;
	Fri,  2 Nov 2012 17:11:19 +0000 (UTC)
Received: from CH1EHSMHS008.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.242])	by mail62-ch1.bigfish.com (Postfix) with ESMTP id
	E5A9840003F for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2012 17:11:19 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS008.bigfish.com
	(10.43.70.8) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 2 Nov 2012 17:11:19 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.318.3; Fri, 2 Nov 2012 17:11:18 +0000
Received: from localhost.localdomain ([10.232.15.67])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id qA2HBGu6008696;
	Fri, 2 Nov 2012 10:11:17 -0700
From: Yashpal Dutta <yashpal.dutta@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 3 Nov 2012 04:00:51 +0545
Message-ID: <1351894551-15670-1-git-send-email-yashpal.dutta@freescale.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCHv2] cryptodev kernel module recipe
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
X-List-Received-Date: Fri, 02 Nov 2012 17:55:17 -0000
Content-Type: text/plain

This is a /dev/crypto device driver, equivalent to those in OpenBSD or FreeBSD.
The main idea is to access of existing ciphers in kernel space from userspace,
thus enabling re-use of a hardware implementation of a cipher.

Signed-off-by: Yashpal Dutta <yashpal.dutta@freescale.com>
---
 meta/recipes-kernel/cryptodev/cryptodev_1.5.bb     |   17 +++++++++++++
 .../cryptodev/files/makefile_fixup.patch           |   26 ++++++++++++++++++++
 2 files changed, 43 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-kernel/cryptodev/cryptodev_1.5.bb
 create mode 100644 meta/recipes-kernel/cryptodev/files/makefile_fixup.patch

diff --git a/meta/recipes-kernel/cryptodev/cryptodev_1.5.bb b/meta/recipes-kernel/cryptodev/cryptodev_1.5.bb
new file mode 100644
index 0000000..0696e2a
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/cryptodev_1.5.bb
@@ -0,0 +1,17 @@
+SECTION = "devel"
+SUMMARY = "Linux Cryptodev KERNEL MODULE"
+DESCRIPTION = "The Cryptodev package contains the kernel /dev/crypto module"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+RCONFLICTS_${PN} = "ocf-linux"
+
+inherit module
+
+SRCREV = "1c24a0aa996630518d47826a2e3fea129ea094c7"
+
+SRC_URI = "git://repo.or.cz/cryptodev-linux.git;protocol=git \
+           file://makefile_fixup.patch"
+
+EXTRA_OEMAKE='KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
+
+S = "${WORKDIR}/git"
diff --git a/meta/recipes-kernel/cryptodev/files/makefile_fixup.patch b/meta/recipes-kernel/cryptodev/files/makefile_fixup.patch
new file mode 100644
index 0000000..323aacd
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/files/makefile_fixup.patch
@@ -0,0 +1,26 @@
+diff --git a/Makefile b/Makefile
+index 2be8825..b36d68c 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,6 +1,7 @@
+ KBUILD_CFLAGS += -I$(src)
+ KERNEL_DIR = /lib/modules/$(shell uname -r)/build
+ VERSION = 1.5
++PREFIX =
+ 
+ cryptodev-objs = ioctl.o main.o cryptlib.o authenc.o zc.o util.o
+ 
+@@ -12,10 +13,10 @@ build: version.h
+ version.h: Makefile
+ 	@echo "#define VERSION \"$(VERSION)\"" > version.h
+ 
+-install:
++modules_install:
+ 	make -C $(KERNEL_DIR) SUBDIRS=`pwd` modules_install
+-	@echo "Installing cryptodev.h in /usr/include/crypto ..."
+-	@install -D crypto/cryptodev.h /usr/include/crypto/cryptodev.h
++	@echo "Installing cryptodev.h in $(PREFIX)/usr/include/crypto ..."
++	@install -D crypto/cryptodev.h $(PREFIX)/usr/include/crypto/cryptodev.h
+ 
+ clean:
+ 	make -C $(KERNEL_DIR) SUBDIRS=`pwd` clean
-- 
1.7.0.4




