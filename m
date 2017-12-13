Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 94F5C78890
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 02:46:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vBD2kBnG019349
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 18:46:11 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Tue, 12 Dec 2017 18:46:11 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Dec 2017 10:45:53 +0800
Message-ID: <e911950fbee39af9c5889c41872f2f77f94cc9c1.1513133105.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1513133105.git.liezhi.yang@windriver.com>
References: <cover.1513133105.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] image-live.bbclass: remove MLPREFIX from syslinux
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
X-List-Received-Date: Wed, 13 Dec 2017 02:46:11 -0000
Content-Type: text/plain

Fixed:
MACHINE = "qemux86-64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"
IMAGE_FSTYPES += "iso"

$ bitbake lib32-core-image-minimal
ERROR: lib32-core-image-minimal-1.0-r0 do_bootimg: The file /usr/include/printf.h is installed by both glibc and lib32-glibc, aborting

This was because:
lib32-syslinux -> lib32-glibc
virtual/kernel -> glibc

We can build 64bit syslinux (only build, not install) to fix the problem, the
do_bootimg only needs several data files of syslinux such as vesamenu.c32,
these files are not arch related.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/image-live.bbclass | 2 +-
 meta/classes/syslinux.bbclass   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index 9f8ff79..8872195 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -31,7 +31,7 @@ do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
                         mtools-native:do_populate_sysroot \
                         cdrtools-native:do_populate_sysroot \
                         virtual/kernel:do_deploy \
-                        ${MLPREFIX}syslinux:do_populate_sysroot \
+                        syslinux:do_populate_sysroot \
                         syslinux-native:do_populate_sysroot \
                         ${@oe.utils.ifelse(d.getVar('COMPRESSISO', False),'zisofs-tools-native:do_populate_sysroot','')} \
                         ${PN}:do_image_${@d.getVar('LIVE_ROOTFS_TYPE').replace('-', '_')} \
diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index d6f8824..98939ba 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -17,7 +17,7 @@
 # ${SYSLINUX_SERIAL_TTY} - Set alternate console=tty... kernel boot argument
 # ${SYSLINUX_KERNEL_ARGS} - Add additional kernel arguments
 
-do_bootimg[depends] += "${MLPREFIX}syslinux:do_populate_sysroot \
+do_bootimg[depends] += "syslinux:do_populate_sysroot \
                         syslinux-native:do_populate_sysroot"
 
 ISOLINUXDIR ?= "/isolinux"
-- 
2.7.4


