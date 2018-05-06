Return-Path: <niko.mauno@iki.fi>
Received: from sirokuusama2.dnainternet.net (sirokuusama2.dnainternet.net
	[83.102.40.153])
	by mail.openembedded.org (Postfix) with ESMTP id 17313607DE
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 May 2018 02:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by sirokuusama2.dnainternet.net (Postfix) with ESMTP id 8024F20E58;
	Sun,  6 May 2018 05:50:47 +0300 (EEST)
X-Virus-Scanned: DNA Internet at dnainternet.net
X-Spam-Flag: NO
X-Spam-Score: 0.652
X-Spam-Level: 
X-Spam-Status: No, score=0.652 tagged_above=-9999 required=6
	tests=[SPF_NEUTRAL=0.652] autolearn=disabled
Received: from sirokuusama2.dnainternet.net ([83.102.40.153])
	by localhost (sirokuusama2.dnainternet.net [127.0.0.1]) (DNA Internet,
	port 10041)
	with ESMTP id XwnpmRR_6-jH; Sun,  6 May 2018 05:50:47 +0300 (EEST)
Received: from omenapuu2.dnainternet.net (omenapuu2.dnainternet.net
	[83.102.40.54])
	by sirokuusama2.dnainternet.net (Postfix) with ESMTP id 2471A2022A;
	Sun,  6 May 2018 05:50:47 +0300 (EEST)
Received: from localhost.localdomain (82-181-15-94.bb.dnainternet.fi
	[82.181.15.94])
	by omenapuu2.dnainternet.net (Postfix) with ESMTP id 759812A2;
	Sun,  6 May 2018 05:50:43 +0300 (EEST)
From: Niko Mauno <niko.mauno@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Sun,  6 May 2018 05:50:41 +0300
Message-Id: <20180506025041.104782-1-niko.mauno@iki.fi>
X-Mailer: git-send-email 2.16.3
Subject: [PATCH v3 2/3] e2fsprogs: Complement update-alternatives scope
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
X-List-Received-Date: Sun, 06 May 2018 02:50:48 -0000

Avoid collision of e2fsprogs provided tune2fs, mke2fs and mkfs.ext2
commands with corresponding BusyBox provided applets in case both
packages are installed to same rootfs, by adding these commands to
update-alternatives scope

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb
index 56abb3b5d3..c4739b98c8 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb
@@ -75,6 +75,12 @@ do_install_append_class-nativesdk() {
 	e2fsprogs_conf_fixup
 }
 
+do_install_append_class-target() {
+	mv ${D}${base_sbindir}/mke2fs ${D}${base_sbindir}/mke2fs.e2fsprogs
+	mv ${D}${base_sbindir}/mkfs.ext2 ${D}${base_sbindir}/mkfs.ext2.e2fsprogs
+	mv ${D}${base_sbindir}/tune2fs ${D}${base_sbindir}/tune2fs.e2fsprogs
+}
+
 RDEPENDS_e2fsprogs = "e2fsprogs-badblocks"
 RRECOMMENDS_e2fsprogs = "e2fsprogs-mke2fs e2fsprogs-e2fsck"
 
@@ -83,8 +89,8 @@ PACKAGES =+ "libcomerr libss libe2p libext2fs"
 
 FILES_e2fsprogs-resize2fs = "${base_sbindir}/resize2fs*"
 FILES_e2fsprogs-e2fsck = "${base_sbindir}/e2fsck ${base_sbindir}/fsck.ext*"
-FILES_e2fsprogs-mke2fs = "${base_sbindir}/mke2fs ${base_sbindir}/mkfs.ext* ${sysconfdir}/mke2fs.conf"
-FILES_e2fsprogs-tune2fs = "${base_sbindir}/tune2fs ${base_sbindir}/e2label"
+FILES_e2fsprogs-mke2fs = "${base_sbindir}/mke2fs.e2fsprogs ${base_sbindir}/mkfs.ext* ${sysconfdir}/mke2fs.conf"
+FILES_e2fsprogs-tune2fs = "${base_sbindir}/tune2fs.e2fsprogs ${base_sbindir}/e2label"
 FILES_e2fsprogs-badblocks = "${base_sbindir}/badblocks"
 FILES_libcomerr = "${base_libdir}/libcom_err.so.*"
 FILES_libss = "${base_libdir}/libss.so.*"
@@ -100,6 +106,13 @@ ALTERNATIVE_TARGET[chattr] = "${base_bindir}/chattr.e2fsprogs"
 ALTERNATIVE_${PN}-doc = "fsck.8"
 ALTERNATIVE_LINK_NAME[fsck.8] = "${mandir}/man8/fsck.8"
 
+ALTERNATIVE_e2fsprogs-mke2fs = "mke2fs mkfs.ext2"
+ALTERNATIVE_LINK_NAME[mke2fs] = "${base_sbindir}/mke2fs"
+ALTERNATIVE_LINK_NAME[mkfs.ext2] = "${base_sbindir}/mkfs.ext2"
+
+ALTERNATIVE_e2fsprogs-tune2fs = "tune2fs"
+ALTERNATIVE_LINK_NAME[tune2fs] = "${base_sbindir}/tune2fs"
+
 RDEPENDS_${PN}-ptest += "${PN} ${PN}-tune2fs coreutils procps bash"
 
 do_compile_ptest() {
-- 
2.16.3


