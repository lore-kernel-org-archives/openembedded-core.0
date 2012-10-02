Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TJ6HZ-0007Uw-MP
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 19:29:21 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TJ653-0004Bu-45
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Oct 2012 19:16:25 +0200
From: Phil Blundell <philb@gnu.org>
To: oe-core <openembedded-core@lists.openembedded.org>
Date: Tue, 02 Oct 2012 18:16:24 +0100
X-Mailer: Evolution 3.0.2- 
Message-ID: <1349198185.32611.100.camel@phil-desktop>
Mime-Version: 1.0
Subject: [PATCH] e2fsprogs: Don't install findfs
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
X-List-Received-Date: Tue, 02 Oct 2012 17:29:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This binary is provided by util-linux nowadays.  Fixes:

WARNING: The recipe is trying to install files into a shared area when those files already exist. Those files are:
     /fast/jenkins/workspace/.../tmp-eglibc/sysroots/x86_64-linux/sbin/findfs

Signed-off-by: Phil Blundell <pb@pbcl.net>
---
(Not very clear what it was doing in the tune2fs package in the first place 
since it doesn't really have anything to do with that program.)

 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb
index 3869c34..5d62ea0 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb
@@ -1,6 +1,6 @@
 require e2fsprogs.inc
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI += "file://fallocate.patch \
             file://acinclude.m4 \
@@ -32,6 +32,7 @@ do_install () {
 	rm -f ${D}${base_libdir}/pkgconfig/blkid.pc
 	rm -f ${D}${base_sbindir}/blkid
 	rm -f ${D}${base_sbindir}/fsck
+	rm -f ${D}${base_sbindir}/findfs
 }
 
 do_install_append () {
@@ -50,7 +51,7 @@ PACKAGES =+ "libcomerr libss libe2p libext2fs"
 
 FILES_e2fsprogs-e2fsck = "${base_sbindir}/e2fsck ${base_sbindir}/fsck.ext*"
 FILES_e2fsprogs-mke2fs = "${base_sbindir}/mke2fs ${base_sbindir}/mkfs.ext* ${sysconfdir}/mke2fs.conf"
-FILES_e2fsprogs-tune2fs = "${base_sbindir}/tune2fs ${base_sbindir}/e2label ${base_sbindir}/findfs"
+FILES_e2fsprogs-tune2fs = "${base_sbindir}/tune2fs ${base_sbindir}/e2label"
 FILES_e2fsprogs-badblocks = "${base_sbindir}/badblocks"
 FILES_libcomerr = "${base_libdir}/libcom_err.so.*"
 FILES_libss = "${base_libdir}/libss.so.*"
-- 
1.7.10.4





