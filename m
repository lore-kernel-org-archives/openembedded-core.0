Received: from atl4mhfb03.myregisteredsite.com ([209.17.115.61])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <milo-software@users.sourceforge.net>)
	id 1U6kCR-0000U7-Eg for openembedded-core@lists.openembedded.org;
	Sat, 16 Feb 2013 17:01:16 +0100
Received: from atl4mhob14.myregisteredsite.com
	(atl4mhob14.myregisteredsite.com [209.17.115.52])
	by atl4mhfb03.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r1GFjB0C014473 for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2013 10:45:11 -0500
Received: from mailpod.hostingplatform.com (mail.networksolutionsemail.com
	[205.178.146.50])
	by atl4mhob14.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r1GFjA6A004154 for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2013 10:45:10 -0500
Received: (qmail 23010 invoked by uid 0); 16 Feb 2013 15:45:09 -0000
Received: from unknown (HELO phenom.lan) (mike@milosoftware.com@85.150.144.104)
	by 0 with ESMTPA; 16 Feb 2013 15:45:09 -0000
From: MiLo <milo-software@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Feb 2013 16:45:05 +0100
Message-Id: <1361029505-32439-1-git-send-email-milo-software@users.sourceforge.net>
X-Mailer: git-send-email 1.7.5.4
Cc: MiLo <milo-software@users.sourceforge.net>
Subject: [PATCH] util-linux: Add package for libmount
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
X-List-Received-Date: Sat, 16 Feb 2013 16:01:16 -0000

The libmount shared library was part of util-linux. This caused
util-linux-mount to RDEPEND on util-linux, so including that would
also drag in all of util-linux and all its recommendations.

To break this circular dependency, add a libmount package that holds
the libmount.so.* files, just like the other libraries built by util-
linux.
---
 meta/recipes-core/util-linux/util-linux.inc       |    3 +++
 meta/recipes-core/util-linux/util-linux_2.22.2.bb |    2 +-
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 10439c0..bd7b089 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -31,6 +31,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
 PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfdisk \
              util-linux-swaponoff util-linux-losetup util-linux-umount \
              util-linux-mount util-linux-readprofile util-linux-libblkid \
+             util-linux-libmount util-linux-libmount-dev \
              util-linux-libblkid-dev util-linux-libuuid util-linux-libuuid-dev \
              util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid \
              util-linux-mkfs util-linux-mcookie util-linux-reset"
@@ -64,6 +65,8 @@ FILES_util-linux-reset = "${base_bindir}/reset"
 
 FILES_util-linux-libblkid = "${base_libdir}/libblkid.so.*"
 FILES_util-linux-libblkid-dev = "${base_libdir}/libblkid.so ${base_libdir}/libblkid.la ${includedir}/blkid ${libdir}/pkgconfig/blkid.pc"
+FILES_util-linux-libmount = "${base_libdir}/libmount.so.*"
+FILES_util-linux-libmount-dev = "${base_libdir}/libmount.so ${base_libdir}/libmount.la ${includedir}/libmount ${libdir}/pkgconfig/mount.pc"
 FILES_util-linux-libuuid = "${base_libdir}/libuuid.so.*"
 FILES_util-linux-libuuid-dev = "${base_libdir}/libuuid.so ${base_libdir}/libuuid.la ${includedir}/uuid ${libdir}/pkgconfig/uuid.pc"
 FILES_util-linux-lscpu = "${bindir}/lscpu"
diff --git a/meta/recipes-core/util-linux/util-linux_2.22.2.bb b/meta/recipes-core/util-linux/util-linux_2.22.2.bb
index dd95573..f91784b 100644
--- a/meta/recipes-core/util-linux/util-linux_2.22.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.22.2.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.22"
-PR = "r0"
+PR = "r1"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
-- 
1.7.5.4



