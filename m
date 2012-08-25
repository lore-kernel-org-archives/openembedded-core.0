Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T5Ikl-0002qN-Hp for openembedded-core@lists.openembedded.org;
	Sat, 25 Aug 2012 17:58:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7PFkJvo008206
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2012 16:46:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16836-10 for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2012 16:46:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7PFkA54008200
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Aug 2012 16:46:11 +0100
Message-ID: <1345909572.14369.110.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 25 Aug 2012 16:46:12 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: e2fsprogs: Drop fsck binary
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
X-List-Received-Date: Sat, 25 Aug 2012 15:58:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There are conflicts in the native sysroot over the fsck binary. Whilst
providing people with alternatives is good to a point, the source in util-linux
is clearly the copy which is now being maintained and moved forwards which the copy
in e2fsprogs being older and with less features.

The simplest solution is simply to no longer offer this and used the maintained
version from util-linux.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb
index 5e07d6e..3869c34 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb
@@ -1,6 +1,6 @@
 require e2fsprogs.inc
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI += "file://fallocate.patch \
             file://acinclude.m4 \
@@ -31,6 +31,7 @@ do_install () {
 	rm -rf ${D}${includedir}/blkid
 	rm -f ${D}${base_libdir}/pkgconfig/blkid.pc
 	rm -f ${D}${base_sbindir}/blkid
+	rm -f ${D}${base_sbindir}/fsck
 }
 
 do_install_append () {
@@ -44,10 +45,9 @@ do_install_append () {
 
 RDEPENDS_e2fsprogs = "e2fsprogs-badblocks"
 
-PACKAGES =+ "e2fsprogs-e2fsck e2fsprogs-mke2fs e2fsprogs-fsck e2fsprogs-tune2fs e2fsprogs-badblocks"
+PACKAGES =+ "e2fsprogs-e2fsck e2fsprogs-mke2fs e2fsprogs-tune2fs e2fsprogs-badblocks"
 PACKAGES =+ "libcomerr libss libe2p libext2fs"
 
-FILES_e2fsprogs-fsck = "${base_sbindir}/fsck"
 FILES_e2fsprogs-e2fsck = "${base_sbindir}/e2fsck ${base_sbindir}/fsck.ext*"
 FILES_e2fsprogs-mke2fs = "${base_sbindir}/mke2fs ${base_sbindir}/mkfs.ext* ${sysconfdir}/mke2fs.conf"
 FILES_e2fsprogs-tune2fs = "${base_sbindir}/tune2fs ${base_sbindir}/e2label ${base_sbindir}/findfs"




