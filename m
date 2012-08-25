Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T5IkA-0002o5-JK for openembedded-core@lists.openembedded.org;
	Sat, 25 Aug 2012 17:57:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7PFjgOI008193
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2012 16:45:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17462-07 for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2012 16:45:36 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7PFjVeS008187
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2012 16:45:34 +0100
Message-ID: <1345909533.14369.109.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 25 Aug 2012 16:45:33 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: e2fsprogs: Fully remove/disable blkid
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
X-List-Received-Date: Sat, 25 Aug 2012 15:57:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We've removed libblkid from e2fsprogs as it was being provided by util-linux. The blkid
binary is also provided there and providing it within e2fsprogs too, linked against
a different and potentially incompatible library we're likely asking for trouble.

It also leads to inconsistencies in the native sysroot since we don't consistently
get one given provider of blkid (but always the liblibid from util-linux).

To clean this up, fully remove/disable the blkid binary and package.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
index 527e701..aea74f7 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
@@ -4,7 +4,6 @@ fixing, configuring , and debugging ext2 filesystems."
 HOMEPAGE = "http://e2fsprogs.sourceforge.net/"
 
 LICENSE = "GPLv2 & LGPLv2 & BSD & MIT"
-LICENSE_e2fsprogs-blkid = "LGPLv2"
 LICENSE_e2fsprogs-e2fsck = "GPLv2"
 LICENSE_e2fsprogs-mke2fs = "GPLv2"
 LICENSE_e2fsprogs-fsck = "GPLv2"
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb
index 8d4443b..5e07d6e 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb
@@ -1,6 +1,6 @@
 require e2fsprogs.inc
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI += "file://fallocate.patch \
             file://acinclude.m4 \
@@ -30,6 +30,7 @@ do_install () {
 	rm -f ${D}${base_libdir}/libblkid*
 	rm -rf ${D}${includedir}/blkid
 	rm -f ${D}${base_libdir}/pkgconfig/blkid.pc
+	rm -f ${D}${base_sbindir}/blkid
 }
 
 do_install_append () {
@@ -41,15 +42,11 @@ do_install_append () {
 	fi
 }
 
-# blkid used to be part of e2fsprogs but is useful outside, add it
-# as an RDEPENDS_${PN} so that anything relying on it being in e2fsprogs
-# still works
-RDEPENDS_e2fsprogs = "e2fsprogs-blkid e2fsprogs-badblocks"
+RDEPENDS_e2fsprogs = "e2fsprogs-badblocks"
 
-PACKAGES =+ "e2fsprogs-blkid e2fsprogs-e2fsck e2fsprogs-mke2fs e2fsprogs-fsck e2fsprogs-tune2fs e2fsprogs-badblocks"
+PACKAGES =+ "e2fsprogs-e2fsck e2fsprogs-mke2fs e2fsprogs-fsck e2fsprogs-tune2fs e2fsprogs-badblocks"
 PACKAGES =+ "libcomerr libss libe2p libext2fs"
 
-FILES_e2fsprogs-blkid = "${base_sbindir}/blkid"
 FILES_e2fsprogs-fsck = "${base_sbindir}/fsck"
 FILES_e2fsprogs-e2fsck = "${base_sbindir}/e2fsck ${base_sbindir}/fsck.ext*"
 FILES_e2fsprogs-mke2fs = "${base_sbindir}/mke2fs ${base_sbindir}/mkfs.ext* ${sysconfdir}/mke2fs.conf"




