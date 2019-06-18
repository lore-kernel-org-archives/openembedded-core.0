Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 1FDD17C786
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 01:28:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E646F40BC2;
	Tue, 18 Jun 2019 01:28:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id tivIO_zf-CI0; Tue, 18 Jun 2019 01:28:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C758E40B86;
	Tue, 18 Jun 2019 01:28:15 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 99EDC17038E;
	Mon, 17 Jun 2019 21:28:14 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Jun 2019 21:28:06 -0400
Message-Id: <1560821287-20630-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH v2 1/2] mtd-utils: upgrade 2.0.2 -> 2.1.0+
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
X-List-Received-Date: Tue, 18 Jun 2019 01:28:16 -0000

From: Denys Dmytriyenko <denys@ti.com>

* 0001-Revert-Return-correct-error-number-in-ubi_get_vol_in.patch is upstreamed
* Add "crypto" PACKAGECONFIG for UBIFS crypto features
* One extra commit after 2.1.0 release tag is pulled in to fix openssl error
  when "crypto" PACKAGECONFIG is not enabled:
| In file included from ../git/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c:25:
| ../git/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h:49:10: fatal error: openssl/rand.h: No such file or directory
|  #include <openssl/rand.h>
|           ^~~~~~~~~~~~~~~~
| compilation terminated.
| Makefile:3457: recipe for target 'ubifs-utils/mkfs.ubifs/mkfs_ubifs-mkfs.ubifs.o' failed
| make: *** [ubifs-utils/mkfs.ubifs/mkfs_ubifs-mkfs.ubifs.o] Error 1

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...rn-correct-error-number-in-ubi_get_vol_in.patch | 92 ----------------------
 meta/recipes-devtools/mtd/mtd-utils_git.bb         |  6 +-
 2 files changed, 3 insertions(+), 95 deletions(-)
 delete mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-Revert-Return-correct-error-number-in-ubi_get_vol_in.patch

diff --git a/meta/recipes-devtools/mtd/mtd-utils/0001-Revert-Return-correct-error-number-in-ubi_get_vol_in.patch b/meta/recipes-devtools/mtd/mtd-utils/0001-Revert-Return-correct-error-number-in-ubi_get_vol_in.patch
deleted file mode 100644
index 4ece56b..0000000
--- a/meta/recipes-devtools/mtd/mtd-utils/0001-Revert-Return-correct-error-number-in-ubi_get_vol_in.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-From 0f833ac73ad631248826386e2918d8571ecf0347 Mon Sep 17 00:00:00 2001
-From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
-Date: Sat, 9 Jun 2018 16:45:22 +0200
-Subject: [PATCH] Revert "Return correct error number in ubi_get_vol_info1"
-
-This reverts commit dede98ffb706676309488d7cc660f569548d5930.
-
-The original commit tried to fix a descrepancy between the implementation
-and the documentation by making the implementation comply.
-
-When making the change, it was overlooked, that ubinfo and ubirename were
-written against the implementation instead of the behaviour specified by
-the documentation. So were further internal functions like
-ubi_get_vol_info1_nm which further breaks ubirmvol.
-
-A report with an outline of a resulting problem can be read on
-the mailing list:
-
-http://lists.infradead.org/pipermail/linux-mtd/2018-June/081562.html
-
-From the report:
-
-steps to reproduce: have mtd-utils 2.0.1 or 2.0.2
-
-0. make a bunch of ubi volumes in sequential order
-
-ubimkvol /dev/ubi0 -s 64KiB -N test1
-ubimkvol /dev/ubi0 -s 64KiB -N test2
-ubimkvol /dev/ubi0 -s 64KiB -N test3
-ubimkvol /dev/ubi0 -s 64KiB -N test4
-..
-
-1. delete the test1 volume, making a hole in the volume table
-
-ubirmvol /dev/ubi0 -N test1
-
-2. try an affected tool (i.e. "ubirmvol /dev/ubi0 -N test4" )
-
- |root at mr24:/# ubirmvol /dev/ubi0 -N test4
- |ubirmvol: error!: cannot find UBI volume "test4"
- |         error 19 (No such device)
-
-or "ubinfo -a"
-
- | root at mr24:/# ubinfo -a
- | UBI version:                    1
- | Count of UBI devices:           1
- | UBI control device major/minor: 10:59
- | Present UBI devices:            ubi0
- |
- | ubi0
- | Volumes count:                           11
- | Logical eraseblock size:                 15872 bytes, 15.5 KiB
- | Total amount of logical eraseblocks:     1952 (30982144 bytes, 29.5 MiB)
- | Amount of available logical eraseblocks: 75 (1190400 bytes, 1.1 MiB)
- | Maximum count of volumes                 92
- | Count of bad physical eraseblocks:       0
- | Count of reserved physical eraseblocks:  40
- | Current maximum erase counter value:     984
- | Minimum input/output unit size:          512 bytes
- | Character device major/minor:            251:0
- | ubinfo: error!: libubi failed to probe volume 5 on ubi0
- |        error 19 (No such device)
- | Present volumes:                         0, 1, 2, 3, 4root at mr24:/#
-
-Reported-by: Christian Lamparter <chunkeey@gmail.com>
-Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
-Upstream-Status: Accepted [http://git.infradead.org/mtd-utils.git/commit/0f833ac73ad631248826386e2918d8571ecf0347]
----
- lib/libubi.c | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/lib/libubi.c b/lib/libubi.c
-index b50e68a..978b433 100644
---- a/lib/libubi.c
-+++ b/lib/libubi.c
-@@ -1240,11 +1240,8 @@ int ubi_get_vol_info1(libubi_t desc, int dev_num, int vol_id,
- 	info->dev_num = dev_num;
- 	info->vol_id = vol_id;
- 
--	if (vol_get_major(lib, dev_num, vol_id, &info->major, &info->minor)) {
--		if (errno == ENOENT)
--			errno = ENODEV;
-+	if (vol_get_major(lib, dev_num, vol_id, &info->major, &info->minor))
- 		return -1;
--	}
- 
- 	ret = vol_read_data(lib->vol_type, dev_num, vol_id, buf, 50);
- 	if (ret < 0)
--- 
-2.14.4
-
diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 9ffac2e..6415fff 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -10,12 +10,11 @@ inherit autotools pkgconfig update-alternatives
 DEPENDS = "zlib e2fsprogs util-linux"
 RDEPENDS_mtd-utils-tests += "bash"
 
-PV = "2.0.2+${SRCPV}"
+PV = "2.1.0+${SRCPV}"
 
-SRCREV = "bc63d36e39f389c8c17f6a8e9db47f2acc884659"
+SRCREV = "b5027be5f470830ac9543db3c52e076b13abd313"
 SRC_URI = "git://git.infradead.org/mtd-utils.git \
            file://add-exclusion-to-mkfs-jffs2-git-2.patch \
-           file://0001-Revert-Return-correct-error-number-in-ubi_get_vol_in.patch \
 "
 
 S = "${WORKDIR}/git/"
@@ -28,6 +27,7 @@ EXTRA_OECONF += "--enable-install-tests"
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'xattr', d)} lzo"
 PACKAGECONFIG[lzo] = "--with-lzo,--without-lzo,lzo"
 PACKAGECONFIG[xattr] = "--with-xattr,--without-xattr,acl"
+PACKAGECONFIG[crypto] = "--with-crypto,--without-crypto,openssl"
 
 CPPFLAGS_append_riscv64  = " -pthread -D_REENTRANT"
 
-- 
2.7.4


