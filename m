Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 846E173D82
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 07:54:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3O7sKqL021377
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 00:54:20 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 24 Apr 2015 00:54:20 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Apr 2015 00:54:09 -0700
Message-ID: <ec4e620e85b28cb80f6a3503999e91601faedb0f.1429861978.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1429861978.git.liezhi.yang@windriver.com>
References: <cover.1429861978.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/12] mtd-utils: enable mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch
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
X-List-Received-Date: Fri, 24 Apr 2015 07:54:24 -0000
Content-Type: text/plain

We still need it, so update and enable it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...t-cleanmarker-with-flash_erase--j-command.patch |   22 ++++++++++++--------
 meta/recipes-devtools/mtd/mtd-utils_git.bb         |    1 +
 2 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils/mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch b/meta/recipes-devtools/mtd/mtd-utils/mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch
index a66087e..7207cfc 100644
--- a/meta/recipes-devtools/mtd/mtd-utils/mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch
+++ b/meta/recipes-devtools/mtd/mtd-utils/mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch
@@ -36,6 +36,10 @@ JFFS2: Erase block at 0x00028000 is not formatted. It will be erased
 Signed-off-by: Liu Shuo <b35362@freescale.com>
 Signed-off-by: Li Yang <leoli@freescale.com>
 
+Updated for the new version
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
 ---
 v2 : get length of availble freeoob bytes from oobinfo information,
       not use the ioctl ECCGETLAYOUT which is being deprecated.
@@ -44,18 +48,18 @@ v2 : get length of availble freeoob bytes from oobinfo information,
  1 files changed, 39 insertions(+), 7 deletions(-)
 
 diff --git a/flash_erase.c b/flash_erase.c
-index fe2eaca..3e94495 100644
+index 933373a..4b9d84b 100644
 --- a/flash_erase.c
 +++ b/flash_erase.c
-@@ -98,6 +98,7 @@ int main(int argc, char *argv[])
- 	int isNAND;
+@@ -99,6 +99,7 @@ int main(int argc, char *argv[])
+ 	bool isNAND;
  	int error = 0;
- 	uint64_t offset = 0;
+ 	off_t offset = 0;
 +	void *oob_data = NULL;
  
  	/*
  	 * Process user arguments
-@@ -197,15 +198,43 @@ int main(int argc, char *argv[])
+@@ -201,15 +202,43 @@ int main(int argc, char *argv[])
  			if (ioctl(fd, MEMGETOOBSEL, &oobinfo) != 0)
  				return sys_errmsg("%s: unable to get NAND oobinfo", mtd_device);
  
@@ -104,7 +108,7 @@ index fe2eaca..3e94495 100644
  			} else {
  				/* Legacy mode */
  				switch (mtd.oob_size) {
-@@ -223,7 +252,6 @@ int main(int argc, char *argv[])
+@@ -227,7 +256,6 @@ int main(int argc, char *argv[])
  						break;
  				}
  			}
@@ -112,13 +116,13 @@ index fe2eaca..3e94495 100644
  		}
  		cleanmarker.hdr_crc = cpu_to_je32(mtd_crc32(0, &cleanmarker, sizeof(cleanmarker) - 4));
  	}
-@@ -272,7 +300,8 @@ int main(int argc, char *argv[])
+@@ -276,7 +304,8 @@ int main(int argc, char *argv[])
  
  		/* write cleanmarker */
  		if (isNAND) {
--			if (mtd_write_oob(mtd_desc, &mtd, fd, offset + clmpos, clmlen, &cleanmarker) != 0) {
+-			if (mtd_write_oob(mtd_desc, &mtd, fd, (uint64_t)offset + clmpos, clmlen, &cleanmarker) != 0) {
 +			void *data = oob_data ? oob_data + clmpos : &cleanmarker;
-+			if (mtd_write_oob(mtd_desc, &mtd, fd, offset + clmpos, clmlen, data) != 0) {
++			if (mtd_write_oob(mtd_desc, &mtd, fd, (uint64_t)offset + clmpos, clmlen, data) != 0) {
  				sys_errmsg("%s: MTD writeoob failure", mtd_device);
  				continue;
  			}
diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index f991ea1..7010cac 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git \
            file://add-exclusion-to-mkfs-jffs2-git-2.patch \
            file://fix-armv7-neon-alignment.patch \
            file://0001-hashtable-Remove-duplicate-hashtable_iterator_value-.patch \
+           file://mtd-utils-fix-corrupt-cleanmarker-with-flash_erase--j-command.patch \
 "
 
 S = "${WORKDIR}/git/"
-- 
1.7.9.5


