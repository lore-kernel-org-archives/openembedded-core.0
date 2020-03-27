Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.16278.1585327140415251825
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2020 09:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: ssajal@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 02RGcxv2027735
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2020 09:38:59 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Fri, 27 Mar 2020
 09:38:58 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 20885)	id C0E73900276;
 Fri, 27 Mar 2020 09:38:58 -0700 (PDT)
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] u-boot: Fix CVE-2020-8432
Date: Fri, 27 Mar 2020 09:38:51 -0700
Message-ID: <20200327163851.5867-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Fix a double free in cmd/gpt.c, function do_rename_gpt_parts().

CVE: CVE-2020-8432

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc     |   1 +
 ...error-cases-during-gpt-rename-more-c.patch | 116 ++++++++++++++++++
 2 files changed, 117 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/u-boot/0001-cmd-gpt-Address-error-cases-during-gpt-rename-more-c.patch

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index edd0004792..a6bbd37d2a 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -15,6 +15,7 @@ PE = "1"
 SRCREV = "303f8fed261020c1cb7da32dad63b610bf6873dd"
 
 SRC_URI = "git://git.denx.de/u-boot.git \
+           file://0001-cmd-gpt-Address-error-cases-during-gpt-rename-more-c.patch \
           "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-bsp/u-boot/u-boot/0001-cmd-gpt-Address-error-cases-during-gpt-rename-more-c.patch b/meta/recipes-bsp/u-boot/u-boot/0001-cmd-gpt-Address-error-cases-during-gpt-rename-more-c.patch
new file mode 100644
index 0000000000..71f2c4a414
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/u-boot/0001-cmd-gpt-Address-error-cases-during-gpt-rename-more-c.patch
@@ -0,0 +1,116 @@
+From 5749faa3d6837d6dbaf2119fc3ec49a326690c8f Mon Sep 17 00:00:00 2001
+From: Tom Rini <trini@konsulko.com>
+Date: Tue, 21 Jan 2020 11:53:38 -0500
+Subject: [PATCH] cmd/gpt: Address error cases during gpt rename more correctly
+
+New analysis by the tool has shown that we have some cases where we
+weren't handling the error exit condition correctly.  When we ran into
+the ENOMEM case we wouldn't exit the function and thus incorrect things
+could happen.  Rework the unwinding such that we don't need a helper
+function now and free what we may have allocated.
+
+Fixes: 18030d04d25d ("GPT: fix memory leaks identified by Coverity")
+Reported-by: Coverity (CID: 275475, 275476)
+Cc: Alison Chaiken <alison@she-devel.com>
+Cc: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
+Cc: Jordy <jordy@simplyhacker.com>
+Signed-off-by: Tom Rini <trini@konsulko.com>
+Reviewed-by: Simon Goldschmidt <simon.k.r.goldschmidt@gmail.com>
+
+CVE: CVE-2020-8432
+Upstream-Status: Backport [5749faa3d6837d6dbaf2119fc3ec49a326690c8f]
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ cmd/gpt.c | 47 ++++++++++++-----------------------------------
+ 1 file changed, 12 insertions(+), 35 deletions(-)
+
+diff --git a/cmd/gpt.c b/cmd/gpt.c
+index 0c4349f4b2..964702bad4 100644
+--- a/cmd/gpt.c
++++ b/cmd/gpt.c
+@@ -633,21 +633,6 @@ static int do_disk_guid(struct blk_desc *dev_desc, char * const namestr)
+ }
+ 
+ #ifdef CONFIG_CMD_GPT_RENAME
+-/*
+- * There are 3 malloc() calls in set_gpt_info() and there is no info about which
+- * failed.
+- */
+-static void set_gpt_cleanup(char **str_disk_guid,
+-			    disk_partition_t **partitions)
+-{
+-#ifdef CONFIG_RANDOM_UUID
+-	if (str_disk_guid)
+-		free(str_disk_guid);
+-#endif
+-	if (partitions)
+-		free(partitions);
+-}
+-
+ static int do_rename_gpt_parts(struct blk_desc *dev_desc, char *subcomm,
+ 			       char *name1, char *name2)
+ {
+@@ -655,7 +640,7 @@ static int do_rename_gpt_parts(struct blk_desc *dev_desc, char *subcomm,
+ 	struct disk_part *curr;
+ 	disk_partition_t *new_partitions = NULL;
+ 	char disk_guid[UUID_STR_LEN + 1];
+-	char *partitions_list, *str_disk_guid;
++	char *partitions_list, *str_disk_guid = NULL;
+ 	u8 part_count = 0;
+ 	int partlistlen, ret, numparts = 0, partnum, i = 1, ctr1 = 0, ctr2 = 0;
+ 
+@@ -697,14 +682,8 @@ static int do_rename_gpt_parts(struct blk_desc *dev_desc, char *subcomm,
+ 	/* set_gpt_info allocates new_partitions and str_disk_guid */
+ 	ret = set_gpt_info(dev_desc, partitions_list, &str_disk_guid,
+ 			   &new_partitions, &part_count);
+-	if (ret < 0) {
+-		del_gpt_info();
+-		free(partitions_list);
+-		if (ret == -ENOMEM)
+-			set_gpt_cleanup(&str_disk_guid, &new_partitions);
+-		else
+-			goto out;
+-	}
++	if (ret < 0)
++		goto out;
+ 
+ 	if (!strcmp(subcomm, "swap")) {
+ 		if ((strlen(name1) > PART_NAME_LEN) || (strlen(name2) > PART_NAME_LEN)) {
+@@ -766,14 +745,8 @@ static int do_rename_gpt_parts(struct blk_desc *dev_desc, char *subcomm,
+ 	 * Even though valid pointers are here passed into set_gpt_info(),
+ 	 * it mallocs again, and there's no way to tell which failed.
+ 	 */
+-	if (ret < 0) {
+-		del_gpt_info();
+-		free(partitions_list);
+-		if (ret == -ENOMEM)
+-			set_gpt_cleanup(&str_disk_guid, &new_partitions);
+-		else
+-			goto out;
+-	}
++	if (ret < 0)
++		goto out;
+ 
+ 	debug("Writing new partition table\n");
+ 	ret = gpt_restore(dev_desc, disk_guid, new_partitions, numparts);
+@@ -795,10 +768,14 @@ static int do_rename_gpt_parts(struct blk_desc *dev_desc, char *subcomm,
+ 	}
+ 	printf("new partition table with %d partitions is:\n", numparts);
+ 	print_gpt_info();
+-	del_gpt_info();
+  out:
+-	free(new_partitions);
+-	free(str_disk_guid);
++	del_gpt_info();
++#ifdef CONFIG_RANDOM_UUID
++	if (str_disk_guid)
++		free(str_disk_guid);
++#endif
++	if (new_partitions)
++		free(new_partitions);
+ 	free(partitions_list);
+ 	return ret;
+ }
+-- 
+2.20.1
+
-- 
2.24.1

