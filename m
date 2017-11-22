Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 9F0AA70057
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 13:16:58 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id vAMDGxFs003574
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 14:16:59 +0100
Received: from dev.sbt.siemens.com ([163.242.56.100])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id vAMDGxML013098;
	Wed, 22 Nov 2017 14:16:59 +0100
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id 35882AF;
	Wed, 22 Nov 2017 14:17:01 +0100 (CET)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Nov 2017 14:16:25 +0100
Message-Id: <1511356585-9082-1-git-send-email-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] mtd-utils: Fix flash_eraseall installation conflict
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Nov 2017 13:17:00 -0000

override correctly busybox's applet when CONFIG_FLASH_ERASEALL=y is set

Error: update-alternatives: not linking /builds/image/1.0-r0/rootfs/usr/
sbin/flash_eraseall to /bin/busybox.nosuid since /builds/image/1.0-r0/
rootfs/usr/sbin/flash_eraseall exists and is not a link

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/recipes-devtools/mtd/mtd-utils_git.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 4fbc54f..56952b5 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig update-alternatives
 
 DEPENDS = "zlib lzo e2fsprogs util-linux"
 
@@ -30,6 +30,10 @@ PACKAGECONFIG[xattr] = ",,acl,"
 
 EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} ${@bb.utils.contains('PACKAGECONFIG', 'xattr', '', '-DWITHOUT_XATTR', d)} -I${S}/include' 'BUILDDIR=${S}'"
 
+ALTERNATIVE_${PN} = "flash_eraseall"
+ALTERNATIVE_LINK_NAME[flash_eraseall] = "/usr/sbin/flash_eraseall"
+ALTERNATIVE_PRIORITY[flash_eraseall] = "100"
+
 do_install () {
 	oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
 }
-- 
2.1.4


