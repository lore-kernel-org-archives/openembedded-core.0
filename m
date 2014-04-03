Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 3C4726F61F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Apr 2014 22:39:37 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1WVqIM-00029S-NI from drew_moseley@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Apr 2014 15:39:38 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 3 Apr 2014 15:39:38 -0700
Received: from sb-ubuntu-1204-64bit.alm.mentorg.com ([134.86.97.83]) by
	NA1-MAIL.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 3 Apr 2014 15:39:38 -0700
From: Drew Moseley <drew_moseley@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Apr 2014 18:39:31 -0400
Message-Id: <1396564772-783-1-git-send-email-drew_moseley@mentor.com>
X-Mailer: git-send-email 1.7.9.5
X-OriginalArrivalTime: 03 Apr 2014 22:39:38.0582 (UTC)
	FILETIME=[98937F60:01CF4F8D]
Subject: [PATCH 1/2] busybox: Use CCLD
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
X-List-Received-Date: Thu, 03 Apr 2014 22:39:42 -0000

Use the CCLD variable to ensure proper tuning parameters.
Notably when building on a x86-64 host with an i686 toolchain
there is an error building built-in.o because it is trying to
link 32-bit and 64-bit object files:

     i686-pc-linux-gnu-ld --sysroot=/work/dmoseley/Mentor/amd-2014.05/build.genericx86-64-external/tmp/sysroots/genericx86-64     -r -o applets/built-in.o applets/ap
     i686-pc-linux-gnu-ld: Relocatable linking with relocations from format elf64-x86-64 (applets/applets.o) to format elf32-i386 (applets/built-in.o) is not support
     make[1]: *** [applets/built-in.o] Error 1

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 meta/recipes-core/busybox/busybox.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 69b9b0c..eedbe46 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -17,6 +17,7 @@ BUSYBOX_SPLIT_SUID ?= "1"
 
 export EXTRA_CFLAGS = "${CFLAGS}"
 export EXTRA_LDFLAGS = "${LDFLAGS}"
+export EXTRA_OEMAKE += "'LD=${CCLD}'"
 
 PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
 
-- 
1.7.9.5


