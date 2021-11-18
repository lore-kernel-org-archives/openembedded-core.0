Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA69C433EF
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 01:53:42 +0000 (UTC)
Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.2187.1637200421199263324
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 17:53:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1AI1rdnO032501
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 17:53:39 -0800
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 17 Nov 2021 17:53:39 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 17 Nov 2021 17:53:39 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 17 Nov 2021 17:53:38 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardnott][PATCH] squashfs-tools: fix CVE-2021-41072
Date: Thu, 18 Nov 2021 09:53:36 +0800
Message-ID: <20211118015336.15595-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Nov 2021 01:53:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158464

From: Kai Kang <kai.kang@windriver.com>

Backport patches to fix CVE-2021-41072. And update context for verison
4.4 at same time.

CVE: CVE-2021-41072

Ref:
* https://nvd.nist.gov/vuln/detail/CVE-2021-41072

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../files/CVE-2021-41072-requisite-1.patch    | 135 +++++++
 .../files/CVE-2021-41072-requisite-2.patch    | 109 ++++++
 .../files/CVE-2021-41072-requisite-3.patch    | 330 ++++++++++++++++++
 .../squashfs-tools/files/CVE-2021-41072.patch | 316 +++++++++++++++++
 .../squashfs-tools/squashfs-tools_git.bb      |   4 +
 5 files changed, 894 insertions(+)
 create mode 100644 meta/recipes-devtools/squashfs-tools/files/CVE-2021-41072-requisite-1.patch
 create mode 100644 meta/recipes-devtools/squashfs-tools/files/CVE-2021-41072-requisite-2.patch
 create mode 100644 meta/recipes-devtools/squashfs-tools/files/CVE-2021-41072-requisite-3.patch
 create mode 100644 meta/recipes-devtools/squashfs-tools/files/CVE-2021-41072.patch

diff --git a/meta/recipes-devtools/squashfs-tools/files/CVE-2021-41072-requisite-1.patch b/meta/recipes-devtools/squashfs-tools/files/CVE-2021-41072-requisite-1.patch
new file mode 100644
index 0000000000..d01b5c6871
--- /dev/null
+++ b/meta/recipes-devtools/squashfs-tools/files/CVE-2021-41072-requisite-1.patch
@@ -0,0 +1,135 @@
+The commit is required by the fix for CVE-2021-41072.
+
+Upstream-Status: Backport [https://github.com/plougher/squashfs-tools/commit/80b8441]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 80b8441a37fcf8bf07dacf24d9d6c6459a0f6e36 Mon Sep 17 00:00:00 2001
+From: Phillip Lougher <phillip@squashfs.org.uk>
+Date: Sun, 12 Sep 2021 19:58:19 +0100
+Subject: [PATCH] unsquashfs: use squashfs_closedir() to delete directory
+
+Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
+---
+ squashfs-tools/unsquash-1.c    |  3 +--
+ squashfs-tools/unsquash-1234.c | 11 +++++++++--
+ squashfs-tools/unsquash-2.c    |  3 +--
+ squashfs-tools/unsquash-3.c    |  3 +--
+ squashfs-tools/unsquash-4.c    |  3 +--
+ squashfs-tools/unsquashfs.c    |  7 -------
+ squashfs-tools/unsquashfs.h    |  1 +
+ 7 files changed, 14 insertions(+), 17 deletions(-)
+
+diff --git a/squashfs-tools/unsquash-1.c b/squashfs-tools/unsquash-1.c
+index acba821..7598499 100644
+--- a/squashfs-tools/unsquash-1.c
++++ b/squashfs-tools/unsquash-1.c
+@@ -373,8 +373,7 @@ static struct dir *squashfs_opendir(unsigned int block_start, unsigned int offse
+ 	return dir;
+ 
+ corrupted:
+-	free(dir->dirs);
+-	free(dir);
++	squashfs_closedir(dir);
+ 	return NULL;
+ }
+ 
+diff --git a/squashfs-tools/unsquash-1234.c b/squashfs-tools/unsquash-1234.c
+index c2d4f42..0c8dfbb 100644
+--- a/squashfs-tools/unsquash-1234.c
++++ b/squashfs-tools/unsquash-1234.c
+@@ -25,8 +25,8 @@
+  * unsquash-4.
+  */
+ 
+-#define TRUE 1
+-#define FALSE 0
++#include "unsquashfs.h"
++
+ /*
+  * Check name for validity, name should not
+  *  - be ".", "./", or
+@@ -56,3 +56,10 @@ int check_name(char *name, int size)
+ 
+ 	return TRUE;
+ }
++
++
++void squashfs_closedir(struct dir *dir)
++{
++	free(dir->dirs);
++	free(dir);
++}
+diff --git a/squashfs-tools/unsquash-2.c b/squashfs-tools/unsquash-2.c
+index 0746b3d..86f62ba 100644
+--- a/squashfs-tools/unsquash-2.c
++++ b/squashfs-tools/unsquash-2.c
+@@ -465,8 +465,7 @@ static struct dir *squashfs_opendir(unsigned int block_start, unsigned int offse
+ 	return dir;
+ 
+ corrupted:
+-	free(dir->dirs);
+-	free(dir);
++	squashfs_closedir(dir);
+ 	return NULL;
+ }
+ 
+diff --git a/squashfs-tools/unsquash-3.c b/squashfs-tools/unsquash-3.c
+index 094caaa..c04aa9e 100644
+--- a/squashfs-tools/unsquash-3.c
++++ b/squashfs-tools/unsquash-3.c
+@@ -499,8 +499,7 @@ static struct dir *squashfs_opendir(unsigned int block_start, unsigned int offse
+ 	return dir;
+ 
+ corrupted:
+-	free(dir->dirs);
+-	free(dir);
++	squashfs_closedir(dir);
+ 	return NULL;
+ }
+ 
+diff --git a/squashfs-tools/unsquash-4.c b/squashfs-tools/unsquash-4.c
+index 3a1b9e1..ff62dcc 100644
+--- a/squashfs-tools/unsquash-4.c
++++ b/squashfs-tools/unsquash-4.c
+@@ -436,8 +436,7 @@ static struct dir *squashfs_opendir(unsigned int block_start, unsigned int offse
+ 	return dir;
+ 
+ corrupted:
+-	free(dir->dirs);
+-	free(dir);
++	squashfs_closedir(dir);
+ 	return NULL;
+ }
+ 
+diff --git a/squashfs-tools/unsquashfs.c b/squashfs-tools/unsquashfs.c
+index 7b590bd..04be53c 100644
+--- a/squashfs-tools/unsquashfs.c
++++ b/squashfs-tools/unsquashfs.c
+@@ -1350,13 +1350,6 @@ unsigned int *offset, unsigned int *type)
+ }
+ 
+ 
+-void squashfs_closedir(struct dir *dir)
+-{
+-	free(dir->dirs);
+-	free(dir);
+-}
+-
+-
+ char *get_component(char *target, char **targname)
+ {
+ 	char *start;
+diff --git a/squashfs-tools/unsquashfs.h b/squashfs-tools/unsquashfs.h
+index 2e9201c..5ecb2ab 100644
+--- a/squashfs-tools/unsquashfs.h
++++ b/squashfs-tools/unsquashfs.h
+@@ -291,4 +291,5 @@ extern long long *alloc_index_table(int);
+ 
+ /* unsquash-1234.c */
+ extern int check_name(char *, int);
++extern void squashfs_closedir(struct dir *);
+ #endif
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/squashfs-tools/files/CVE-2021-41072-requisite-2.patch b/meta/recipes-devtools/squashfs-tools/files/CVE-2021-41072-requisite-2.patch
new file mode 100644
index 0000000000..0b80d07b3b
--- /dev/null
+++ b/meta/recipes-devtools/squashfs-tools/files/CVE-2021-41072-requisite-2.patch
@@ -0,0 +1,109 @@
+The commit is required by the fix for CVE-2021-41072. Update context for
+version 4.4.
+
+Upstream-Status: Backport [https://github.com/plougher/squashfs-tools/commit/1993a4e]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 1993a4e7aeda04962bf26e84c15fba8b58837e10 Mon Sep 17 00:00:00 2001
+From: Phillip Lougher <phillip@squashfs.org.uk>
+Date: Sun, 12 Sep 2021 20:09:13 +0100
+Subject: [PATCH] unsquashfs: dynamically allocate name
+
+Dynamically allocate name rather than store it
+directly in structure.
+
+Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
+---
+ squashfs-tools/unsquash-1.c    | 2 +-
+ squashfs-tools/unsquash-1234.c | 5 +++++
+ squashfs-tools/unsquash-2.c    | 2 +-
+ squashfs-tools/unsquash-3.c    | 2 +-
+ squashfs-tools/unsquash-4.c    | 2 +-
+ squashfs-tools/unsquashfs.h    | 2 +-
+ 6 files changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/squashfs-tools/unsquash-1.c b/squashfs-tools/unsquash-1.c
+index 7598499..d0121c6 100644
+--- a/squashfs-tools/unsquash-1.c
++++ b/squashfs-tools/unsquash-1.c
+@@ -303,7 +303,7 @@ static struct dir *squashfs_opendir(unsi
+ 						"realloc failed!\n");
+ 				dir->dirs = new_dir;
+ 			}
+-			strcpy(dir->dirs[dir->dir_count].name, dire->name);
++			dir->dirs[dir->dir_count].name = strdup(dire->name);
+ 			dir->dirs[dir->dir_count].start_block =
+ 				dirh.start_block;
+ 			dir->dirs[dir->dir_count].offset = dire->offset;
+diff --git a/squashfs-tools/unsquash-1234.c b/squashfs-tools/unsquash-1234.c
+index 0c8dfbb..ac46d9d 100644
+--- a/squashfs-tools/unsquash-1234.c
++++ b/squashfs-tools/unsquash-1234.c
+@@ -60,6 +60,11 @@ int check_name(char *name, int size)
+ 
+ void squashfs_closedir(struct dir *dir)
+ {
++	int i;
++
++	for(i = 0; i < dir->dir_count; i++)
++		free(dir->dirs[i].name);
++
+ 	free(dir->dirs);
+ 	free(dir);
+ }
+diff --git a/squashfs-tools/unsquash-2.c b/squashfs-tools/unsquash-2.c
+index 86f62ba..e847980 100644
+--- a/squashfs-tools/unsquash-2.c
++++ b/squashfs-tools/unsquash-2.c
+@@ -404,7 +404,7 @@ static struct dir *squashfs_opendir(unsi
+ 						"realloc failed!\n");
+ 				dir->dirs = new_dir;
+ 			}
+-			strcpy(dir->dirs[dir->dir_count].name, dire->name);
++			dir->dirs[dir->dir_count].name = strdup(dire->name);
+ 			dir->dirs[dir->dir_count].start_block =
+ 				dirh.start_block;
+ 			dir->dirs[dir->dir_count].offset = dire->offset;
+diff --git a/squashfs-tools/unsquash-3.c b/squashfs-tools/unsquash-3.c
+index c04aa9e..8223f27 100644
+--- a/squashfs-tools/unsquash-3.c
++++ b/squashfs-tools/unsquash-3.c
+@@ -431,7 +431,7 @@ static struct dir *squashfs_opendir(unsi
+ 						"realloc failed!\n");
+ 				dir->dirs = new_dir;
+ 			}
+-			strcpy(dir->dirs[dir->dir_count].name, dire->name);
++			dir->dirs[dir->dir_count].name = strdup(dire->name);
+ 			dir->dirs[dir->dir_count].start_block =
+ 				dirh.start_block;
+ 			dir->dirs[dir->dir_count].offset = dire->offset;
+diff --git a/squashfs-tools/unsquash-4.c b/squashfs-tools/unsquash-4.c
+index ff62dcc..1e199a7 100644
+--- a/squashfs-tools/unsquash-4.c
++++ b/squashfs-tools/unsquash-4.c
+@@ -367,7 +367,7 @@ static struct dir *squashfs_opendir(unsi
+ 						"realloc failed!\n");
+ 				dir->dirs = new_dir;
+ 			}
+-			strcpy(dir->dirs[dir->dir_count].name, dire->name);
++			dir->dirs[dir->dir_count].name = strdup(dire->name);
+ 			dir->dirs[dir->dir_count].start_block =
+ 				dirh.start_block;
+ 			dir->dirs[dir->dir_count].offset = dire->offset;
+diff --git a/squashfs-tools/unsquashfs.h b/squashfs-tools/unsquashfs.h
+index 5ecb2ab..583fbe4 100644
+--- a/squashfs-tools/unsquashfs.h
++++ b/squashfs-tools/unsquashfs.h
+@@ -165,7 +165,7 @@ struct queue {
+ #define DIR_ENT_SIZE	16
+ 
+ struct dir_ent	{
+-	char		name[SQUASHFS_NAME_LEN + 1];
++	char		*name;
+ 	unsigned int	start_block;
+ 	unsigned int	offset;
+ 	unsigned int	type;
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/squashfs-tools/files/CVE-2021-41072-requisite-3.patch b/meta/recipes-devtools/squashfs-tools/files/CVE-2021-41072-requisite-3.patch
new file mode 100644
index 0000000000..fad5898f13
--- /dev/null
+++ b/meta/recipes-devtools/squashfs-tools/files/CVE-2021-41072-requisite-3.patch
@@ -0,0 +1,330 @@
+The commit is required by the fix for CVE-2021-41072. Update context for
+version 4.4.
+
+Upstream-Status: Backport [https://github.com/plougher/squashfs-tools/commit/9938154]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 9938154174756ee48a94ea0b076397a2944b028d Mon Sep 17 00:00:00 2001
+From: Phillip Lougher <phillip@squashfs.org.uk>
+Date: Sun, 12 Sep 2021 22:58:11 +0100
+Subject: [PATCH] unsquashfs: use linked list to store directory names
+
+This should bring higher performance, and it allows sorting
+if necessary (1.x and 2.0 filesystems).
+
+Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
+---
+ squashfs-tools/unsquash-1.c    | 30 +++++++++++++++---------------
+ squashfs-tools/unsquash-1234.c | 12 ++++++++----
+ squashfs-tools/unsquash-2.c    | 29 +++++++++++++++--------------
+ squashfs-tools/unsquash-3.c    | 29 +++++++++++++++--------------
+ squashfs-tools/unsquash-4.c    | 29 +++++++++++++++--------------
+ squashfs-tools/unsquashfs.c    | 16 ++++++++++------
+ squashfs-tools/unsquashfs.h    |  3 ++-
+ 7 files changed, 80 insertions(+), 68 deletions(-)
+
+diff --git a/squashfs-tools/unsquash-1.c b/squashfs-tools/unsquash-1.c
+index d0121c6..b604434 100644
+--- a/squashfs-tools/unsquash-1.c
++++ b/squashfs-tools/unsquash-1.c
+@@ -207,7 +207,7 @@ static struct dir *squashfs_opendir(unsi
+ 	long long start;
+ 	int bytes;
+ 	int dir_count, size;
+-	struct dir_ent *new_dir;
++	struct dir_ent *ent, *cur_ent = NULL;
+ 	struct dir *dir;
+ 
+ 	TRACE("squashfs_opendir: inode start block %d, offset %d\n",
+@@ -220,7 +220,7 @@ static struct dir *squashfs_opendir(unsi
+ 		EXIT_UNSQUASH("squashfs_opendir: malloc failed!\n");
+ 
+ 	dir->dir_count = 0;
+-	dir->cur_entry = 0;
++	dir->cur_entry = NULL;
+ 	dir->mode = (*i)->mode;
+ 	dir->uid = (*i)->uid;
+ 	dir->guid = (*i)->gid;
+@@ -295,19 +295,20 @@ static struct dir *squashfs_opendir(unsi
+ 			TRACE("squashfs_opendir: directory entry %s, inode "
+ 				"%d:%d, type %d\n", dire->name,
+ 				dirh.start_block, dire->offset, dire->type);
+-			if((dir->dir_count % DIR_ENT_SIZE) == 0) {
+-				new_dir = realloc(dir->dirs, (dir->dir_count +
+-					DIR_ENT_SIZE) * sizeof(struct dir_ent));
+-				if(new_dir == NULL)
+-					EXIT_UNSQUASH("squashfs_opendir: "
+-						"realloc failed!\n");
+-				dir->dirs = new_dir;
+-			}
+-			dir->dirs[dir->dir_count].name = strdup(dire->name);
+-			dir->dirs[dir->dir_count].start_block =
+-				dirh.start_block;
+-			dir->dirs[dir->dir_count].offset = dire->offset;
+-			dir->dirs[dir->dir_count].type = dire->type;
++			ent = malloc(sizeof(struct dir_ent));
++			if(ent == NULL)
++				MEM_ERROR();
++
++			ent->name = strdup(dire->name);
++			ent->start_block = dirh.start_block;
++			ent->offset = dire->offset;
++			ent->type = dire->type;
++			ent->next = NULL;
++			if(cur_ent == NULL)
++				dir->dirs = ent;
++			else
++				cur_ent->next = ent;
++			cur_ent = ent;
+ 			dir->dir_count ++;
+ 			bytes += dire->size + 1;
+ 		}
+diff --git a/squashfs-tools/unsquash-1234.c b/squashfs-tools/unsquash-1234.c
+index ac46d9d..e389f8d 100644
+--- a/squashfs-tools/unsquash-1234.c
++++ b/squashfs-tools/unsquash-1234.c
+@@ -60,11 +60,15 @@ int check_name(char *name, int size)
+ 
+ void squashfs_closedir(struct dir *dir)
+ {
+-	int i;
++	struct dir_ent *ent = dir->dirs;
+ 
+-	for(i = 0; i < dir->dir_count; i++)
+-		free(dir->dirs[i].name);
++	while(ent) {
++		struct dir_ent *tmp = ent;
++
++		ent = ent->next;
++		free(tmp->name);
++		free(tmp);
++	}
+ 
+-	free(dir->dirs);
+ 	free(dir);
+ }
+diff --git a/squashfs-tools/unsquash-2.c b/squashfs-tools/unsquash-2.c
+index e847980..956f96f 100644
+--- a/squashfs-tools/unsquash-2.c
++++ b/squashfs-tools/unsquash-2.c
+@@ -308,7 +308,7 @@ static struct dir *squashfs_opendir(unsi
+ 	long long start;
+ 	int bytes;
+ 	int dir_count, size;
+-	struct dir_ent *new_dir;
++	struct dir_ent *ent, *cur_ent = NULL;
+ 	struct dir *dir;
+ 
+ 	TRACE("squashfs_opendir: inode start block %d, offset %d\n",
+@@ -321,7 +321,7 @@ static struct dir *squashfs_opendir(unsi
+ 		EXIT_UNSQUASH("squashfs_opendir: malloc failed!\n");
+ 
+ 	dir->dir_count = 0;
+-	dir->cur_entry = 0;
++	dir->cur_entry = NULL;
+ 	dir->mode = (*i)->mode;
+ 	dir->uid = (*i)->uid;
+ 	dir->guid = (*i)->gid;
+@@ -396,19 +396,20 @@ static struct dir *squashfs_opendir(unsi
+ 			TRACE("squashfs_opendir: directory entry %s, inode "
+ 				"%d:%d, type %d\n", dire->name,
+ 				dirh.start_block, dire->offset, dire->type);
+-			if((dir->dir_count % DIR_ENT_SIZE) == 0) {
+-				new_dir = realloc(dir->dirs, (dir->dir_count +
+-					DIR_ENT_SIZE) * sizeof(struct dir_ent));
+-				if(new_dir == NULL)
+-					EXIT_UNSQUASH("squashfs_opendir: "
+-						"realloc failed!\n");
+-				dir->dirs = new_dir;
+-			}
+-			dir->dirs[dir->dir_count].name = strdup(dire->name);
+-			dir->dirs[dir->dir_count].start_block =
+-				dirh.start_block;
+-			dir->dirs[dir->dir_count].offset = dire->offset;
+-			dir->dirs[dir->dir_count].type = dire->type;
++			ent = malloc(sizeof(struct dir_ent));
++			if(ent == NULL)
++				MEM_ERROR();
++
++                        ent->name = strdup(dire->name);
++			ent->start_block = dirh.start_block;
++			ent->offset = dire->offset;
++			ent->type = dire->type;
++			ent->next = NULL;
++			if(cur_ent == NULL)
++				dir->dirs = ent;
++			else
++				cur_ent->next = ent;
++			cur_ent = ent;
+ 			dir->dir_count ++;
+ 			bytes += dire->size + 1;
+ 		}
+diff --git a/squashfs-tools/unsquash-3.c b/squashfs-tools/unsquash-3.c
+index 8223f27..835a574 100644
+--- a/squashfs-tools/unsquash-3.c
++++ b/squashfs-tools/unsquash-3.c
+@@ -334,7 +334,7 @@ static struct dir *squashfs_opendir(unsi
+ 	long long start;
+ 	int bytes;
+ 	int dir_count, size;
+-	struct dir_ent *new_dir;
++	struct dir_ent *ent, *cur_ent = NULL;
+ 	struct dir *dir;
+ 
+ 	TRACE("squashfs_opendir: inode start block %d, offset %d\n",
+@@ -347,7 +347,7 @@ static struct dir *squashfs_opendir(unsi
+ 		EXIT_UNSQUASH("squashfs_opendir: malloc failed!\n");
+ 
+ 	dir->dir_count = 0;
+-	dir->cur_entry = 0;
++	dir->cur_entry = NULL;
+ 	dir->mode = (*i)->mode;
+ 	dir->uid = (*i)->uid;
+ 	dir->guid = (*i)->gid;
+@@ -423,19 +423,20 @@ static struct dir *squashfs_opendir(unsi
+ 			TRACE("squashfs_opendir: directory entry %s, inode "
+ 				"%d:%d, type %d\n", dire->name,
+ 				dirh.start_block, dire->offset, dire->type);
+-			if((dir->dir_count % DIR_ENT_SIZE) == 0) {
+-				new_dir = realloc(dir->dirs, (dir->dir_count +
+-					DIR_ENT_SIZE) * sizeof(struct dir_ent));
+-				if(new_dir == NULL)
+-					EXIT_UNSQUASH("squashfs_opendir: "
+-						"realloc failed!\n");
+-				dir->dirs = new_dir;
+-			}
+-			dir->dirs[dir->dir_count].name = strdup(dire->name);
+-			dir->dirs[dir->dir_count].start_block =
+-				dirh.start_block;
+-			dir->dirs[dir->dir_count].offset = dire->offset;
+-			dir->dirs[dir->dir_count].type = dire->type;
++			ent = malloc(sizeof(struct dir_ent));
++			if(ent == NULL)
++				MEM_ERROR();
++
++                        ent->name = strdup(dire->name);
++			ent->start_block = dirh.start_block;
++			ent->offset = dire->offset;
++			ent->type = dire->type;
++			ent->next = NULL;
++			if(cur_ent == NULL)
++				dir->dirs = ent;
++			else
++				cur_ent->next = ent;
++			cur_ent = ent;
+ 			dir->dir_count ++;
+ 			bytes += dire->size + 1;
+ 		}
+diff --git a/squashfs-tools/unsquash-4.c b/squashfs-tools/unsquash-4.c
+index 1e199a7..694783d 100644
+--- a/squashfs-tools/unsquash-4.c
++++ b/squashfs-tools/unsquash-4.c
+@@ -281,7 +281,7 @@ static struct dir *squashfs_opendir(unsi
+ 	long long start;
+ 	long long bytes;
+ 	int dir_count, size;
+-	struct dir_ent *new_dir;
++	struct dir_ent *ent, *cur_ent = NULL;
+ 	struct dir *dir;
+ 
+ 	TRACE("squashfs_opendir: inode start block %d, offset %d\n",
+@@ -294,7 +294,7 @@ static struct dir *squashfs_opendir(unsi
+ 		EXIT_UNSQUASH("squashfs_opendir: malloc failed!\n");
+ 
+ 	dir->dir_count = 0;
+-	dir->cur_entry = 0;
++	dir->cur_entry = NULL;
+ 	dir->mode = (*i)->mode;
+ 	dir->uid = (*i)->uid;
+ 	dir->guid = (*i)->gid;
+@@ -359,19 +359,20 @@ static struct dir *squashfs_opendir(unsi
+ 			TRACE("squashfs_opendir: directory entry %s, inode "
+ 				"%d:%d, type %d\n", dire->name,
+ 				dirh.start_block, dire->offset, dire->type);
+-			if((dir->dir_count % DIR_ENT_SIZE) == 0) {
+-				new_dir = realloc(dir->dirs, (dir->dir_count +
+-					DIR_ENT_SIZE) * sizeof(struct dir_ent));
+-				if(new_dir == NULL)
+-					EXIT_UNSQUASH("squashfs_opendir: "
+-						"realloc failed!\n");
+-				dir->dirs = new_dir;
+-			}
+-			dir->dirs[dir->dir_count].name = strdup(dire->name);
+-			dir->dirs[dir->dir_count].start_block =
+-				dirh.start_block;
+-			dir->dirs[dir->dir_count].offset = dire->offset;
+-			dir->dirs[dir->dir_count].type = dire->type;
++			ent = malloc(sizeof(struct dir_ent));
++			if(ent == NULL)
++				MEM_ERROR();
++
++			ent->name = strdup(dire->name);
++			ent->start_block = dirh.start_block;
++			ent->offset = dire->offset;
++			ent->type = dire->type;
++			ent->next = NULL;
++			if(cur_ent == NULL)
++				dir->dirs = ent;
++			else
++				cur_ent->next = ent;
++			cur_ent = ent;
+ 			dir->dir_count ++;
+ 			bytes += dire->size + 1;
+ 		}
+diff --git a/squashfs-tools/unsquashfs.c b/squashfs-tools/unsquashfs.c
+index 04be53c..fee28ec 100644
+--- a/squashfs-tools/unsquashfs.c
++++ b/squashfs-tools/unsquashfs.c
+@@ -1277,14 +1277,18 @@ failed:
+ int squashfs_readdir(struct dir *dir, char **name, unsigned int *start_block,
+ unsigned int *offset, unsigned int *type)
+ {
+-	if(dir->cur_entry == dir->dir_count)
++	if(dir->cur_entry == NULL)
++		dir->cur_entry = dir->dirs;
++	else
++		dir->cur_entry = dir->cur_entry->next;
++
++	if(dir->cur_entry == NULL)
+ 		return FALSE;
+ 
+-	*name = dir->dirs[dir->cur_entry].name;
+-	*start_block = dir->dirs[dir->cur_entry].start_block;
+-	*offset = dir->dirs[dir->cur_entry].offset;
+-	*type = dir->dirs[dir->cur_entry].type;
+-	dir->cur_entry ++;
++	*name = dir->cur_entry->name;
++	*start_block = dir->cur_entry->start_block;
++	*offset = dir->cur_entry->offset;
++	*type = dir->cur_entry->type;
+ 
+ 	return TRUE;
+ }
+diff --git a/squashfs-tools/unsquashfs.h b/squashfs-tools/unsquashfs.h
+index 583fbe4..f8cf78c 100644
+--- a/squashfs-tools/unsquashfs.h
++++ b/squashfs-tools/unsquashfs.h
+@@ -169,17 +169,18 @@ struct dir_ent	{
+ 	unsigned int	start_block;
+ 	unsigned int	offset;
+ 	unsigned int	type;
++	struct dir_ent	*next;
+ };
+ 
+ struct dir {
+ 	int		dir_count;
+-	int 		cur_entry;
+ 	unsigned int	mode;
+ 	uid_t		uid;
+ 	gid_t		guid;
+ 	unsigned int	mtime;
+ 	unsigned int xattr;
+ 	struct dir_ent	*dirs;
++	struct dir_ent	*cur_entry;
+ };
+ 
+ struct file_entry {
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/squashfs-tools/files/CVE-2021-41072.patch b/meta/recipes-devtools/squashfs-tools/files/CVE-2021-41072.patch
new file mode 100644
index 0000000000..29ec3bbeab
--- /dev/null
+++ b/meta/recipes-devtools/squashfs-tools/files/CVE-2021-41072.patch
@@ -0,0 +1,316 @@
+CVE: CVE-2021-41072
+Upstream-Status: Backport [https://github.com/plougher/squashfs-tools/commit/e048580]
+
+Backport commit to fix CVE-2021-41072. And squash a follow-up fix for
+CVE-2021-41072 from upstream:
+https://github.com/plougher/squashfs-tools/commit/19fcc93
+
+Update context for version 4.4.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From e0485802ec72996c20026da320650d8362f555bd Mon Sep 17 00:00:00 2001
+From: Phillip Lougher <phillip@squashfs.org.uk>
+Date: Sun, 12 Sep 2021 23:50:06 +0100
+Subject: [PATCH] Unsquashfs: additional write outside destination directory
+ exploit fix
+
+An issue on github (https://github.com/plougher/squashfs-tools/issues/72)
+showed how some specially crafted Squashfs filesystems containing
+invalid file names (with '/' and '..') can cause Unsquashfs to write
+files outside of the destination directory.
+
+Since then it has been shown that specially crafted Squashfs filesystems
+that contain a symbolic link pointing outside of the destination directory,
+coupled with an identically named file within the same directory, can
+cause Unsquashfs to write files outside of the destination directory.
+
+Specifically the symbolic link produces a pathname pointing outside
+of the destination directory, which is then followed when writing the
+duplicate identically named file within the directory.
+
+This commit fixes this exploit by explictly checking for duplicate
+filenames within a directory.  As directories in v2.1, v3.x, and v4.0
+filesystems are sorted, this is achieved by checking for consecutively
+identical filenames.  Additionally directories are checked to
+ensure they are sorted, to avoid attempts to evade the duplicate
+check.
+
+Version 1.x and 2.0 filesystems (where the directories were unsorted)
+are sorted and then the above duplicate filename check is applied.
+
+Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
+---
+ squashfs-tools/Makefile        |   6 +-
+ squashfs-tools/unsquash-1.c    |   6 ++
+ squashfs-tools/unsquash-12.c   | 110 +++++++++++++++++++++++++++++++++
+ squashfs-tools/unsquash-1234.c |  21 +++++++
+ squashfs-tools/unsquash-2.c    |  16 +++++
+ squashfs-tools/unsquash-3.c    |   6 ++
+ squashfs-tools/unsquash-4.c    |   6 ++
+ squashfs-tools/unsquashfs.h    |   4 ++
+ 8 files changed, 173 insertions(+), 2 deletions(-)
+ create mode 100644 squashfs-tools/unsquash-12.c
+
+diff --git a/squashfs-tools/Makefile b/squashfs-tools/Makefile
+index 7262a2e..1b544ed 100755
+--- a/squashfs-tools/Makefile
++++ b/squashfs-tools/Makefile
+@@ -156,8 +156,8 @@ MKSQUASHFS_OBJS = mksquashfs.o read_fs.o
+ 	caches-queues-lists.o
+ 
+ UNSQUASHFS_OBJS = unsquashfs.o unsquash-1.o unsquash-2.o unsquash-3.o \
+-	unsquash-4.o unsquash-123.o unsquash-34.o unsquash-1234.o swap.o \
+-	compressor.o unsquashfs_info.o
++	unsquash-4.o unsquash-123.o unsquash-34.o unsquash-1234.o unsquash-12.o \
++	swap.o compressor.o unsquashfs_info.o
+ 
+ CFLAGS ?= -O2
+ CFLAGS += $(EXTRA_CFLAGS) $(INCLUDEDIR) -D_FILE_OFFSET_BITS=64 \
+@@ -353,6 +353,8 @@ unsquash-34.o: unsquashfs.h unsquash-34.c unsquashfs_error.h
+ 
+ unsquash-1234.o: unsquash-1234.c
+ 
++unsquash-12.o: unsquash-12.c unsquashfs.h
++
+ unsquashfs_xattr.o: unsquashfs_xattr.c unsquashfs.h squashfs_fs.h xattr.h
+ 
+ unsquashfs_info.o: unsquashfs.h squashfs_fs.h
+--- a/squashfs-tools/unsquash-1.c
++++ b/squashfs-tools/unsquash-1.c
+@@ -314,6 +314,12 @@ static struct dir *squashfs_opendir(unsi
+ 		}
+ 	}
+ 
++	/* check directory for duplicate names.  Need to sort directory first */
++	sort_directory(dir);
++	if(check_directory(dir) == FALSE) {
++		ERROR("File system corrupted: directory has duplicate names\n");
++		goto corrupted;
++	}
+ 	return dir;
+ 
+ corrupted:
+diff --git a/squashfs-tools/unsquash-12.c b/squashfs-tools/unsquash-12.c
+new file mode 100644
+index 0000000..61bf128
+--- /dev/null
++++ b/squashfs-tools/unsquash-12.c
+@@ -0,0 +1,110 @@
++/*
++ * Unsquash a squashfs filesystem.  This is a highly compressed read only
++ * filesystem.
++ *
++ * Copyright (c) 2021
++ * Phillip Lougher <phillip@squashfs.org.uk>
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License
++ * as published by the Free Software Foundation; either version 2,
++ * or (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
++ *
++ * unsquash-12.c
++ *
++ * Helper functions used by unsquash-1 and unsquash-2.
++ */
++
++#include "unsquashfs.h"
++
++/*
++ * Bottom up linked list merge sort.
++ *
++ */
++void sort_directory(struct dir *dir)
++{
++	struct dir_ent *cur, *l1, *l2, *next;
++	int len1, len2, stride = 1;
++
++	if(dir->dir_count < 2)
++		return;
++
++	/*
++	 * We can consider our linked-list to be made up of stride length
++	 * sublists.  Eacn iteration around this loop merges adjacent
++	 * stride length sublists into larger 2*stride sublists.  We stop
++	 * when stride becomes equal to the entire list.
++	 *
++	 * Initially stride = 1 (by definition a sublist of 1 is sorted), and
++	 * these 1 element sublists are merged into 2 element sublists,  which
++	 * are then merged into 4 element sublists and so on.
++	 */
++	do {
++		l2 = dir->dirs; /* head of current linked list */
++		cur = NULL; /* empty output list */
++
++		/*
++		 * Iterate through the linked list, merging adjacent sublists.
++		 * On each interation l2 points to the next sublist pair to be
++		 * merged (if there's only one sublist left this is simply added
++		 * to the output list)
++		 */
++		while(l2) {
++			l1 = l2;
++			for(len1 = 0; l2 && len1 < stride; len1 ++, l2 = l2->next);
++			len2 = stride;
++
++			/*
++			 * l1 points to first sublist.
++			 * l2 points to second sublist.
++			 * Merge them onto the output list
++			 */
++			while(len1 && l2 && len2) {
++				if(strcmp(l1->name, l2->name) <= 0) {
++					next = l1;
++					l1 = l1->next;
++					len1 --;
++				} else {
++					next = l2;
++					l2 = l2->next;
++					len2 --;
++				}
++
++				if(cur) {
++					cur->next = next;
++					cur = next;
++				} else
++					dir->dirs = cur = next;
++			}
++			/*
++			 * One sublist is now empty, copy the other one onto the
++			 * output list
++			 */
++			for(; len1; len1 --, l1 = l1->next) {
++				if(cur) {
++					cur->next = l1;
++					cur = l1;
++				} else
++					dir->dirs = cur = l1;
++			}
++			for(; l2 && len2; len2 --, l2 = l2->next) {
++				if(cur) {
++					cur->next = l2;
++					cur = l2;
++				} else
++					dir->dirs = cur = l2;
++			}
++		}
++		cur->next = NULL;
++		stride = stride << 1;
++	} while(stride < dir->dir_count);
++}
+diff --git a/squashfs-tools/unsquash-1234.c b/squashfs-tools/unsquash-1234.c
+index e389f8d..98a81ed 100644
+--- a/squashfs-tools/unsquash-1234.c
++++ b/squashfs-tools/unsquash-1234.c
+@@ -72,3 +72,24 @@ void squashfs_closedir(struct dir *dir)
+ 
+ 	free(dir);
+ }
++
++
++/*
++ * Check directory for duplicate names.  As the directory should be sorted,
++ * duplicates will be consecutive.  Obviously we also need to check if the
++ * directory has been deliberately unsorted, to evade this check.
++ */
++int check_directory(struct dir *dir)
++{
++	int i;
++	struct dir_ent *ent;
++
++	if(dir->dir_count < 2)
++		return TRUE;
++
++	for(ent = dir->dirs, i = 0; i < dir->dir_count - 1; ent = ent->next, i++)
++		if(strcmp(ent->name, ent->next->name) >= 0)
++			return FALSE;
++
++	return TRUE;
++}
+diff --git a/squashfs-tools/unsquash-2.c b/squashfs-tools/unsquash-2.c
+index 956f96f..0e36f7d 100644
+--- a/squashfs-tools/unsquash-2.c
++++ b/squashfs-tools/unsquash-2.c
+@@ -29,6 +29,7 @@ static squashfs_fragment_entry_2 *fragme
+ static unsigned int *uid_table, *guid_table;
+ static char *inode_table, *directory_table;
+ static squashfs_operations ops;
++static int needs_sorting = FALSE;
+ 
+ static void read_block_list(unsigned int *block_list, char *block_ptr, int blocks)
+ {
+@@ -415,6 +416,17 @@ static struct dir *squashfs_opendir(unsi
+ 		}
+ 	}
+ 
++	if(needs_sorting)
++		sort_directory(dir);
++
++	/* check directory for duplicate names and sorting */
++	if(check_directory(dir) == FALSE) {
++		if(needs_sorting)
++			ERROR("File system corrupted: directory has duplicate names\n");
++		else
++			ERROR("File system corrupted: directory has duplicate names or is unsorted\n");
++		goto corrupted;
++	}
+ 	return dir;
+ 
+ corrupted:
+--- a/squashfs-tools/unsquash-3.c
++++ b/squashfs-tools/unsquash-3.c
+@@ -442,6 +442,12 @@ static struct dir *squashfs_opendir(unsi
+ 		}
+ 	}
+ 
++	/* check directory for duplicate names and sorting */
++	if(check_directory(dir) == FALSE) {
++		ERROR("File system corrupted: directory has duplicate names or is unsorted\n");
++		goto corrupted;
++	}
++
+ 	return dir;
+ 
+ corrupted:
+diff --git a/squashfs-tools/unsquash-4.c b/squashfs-tools/unsquash-4.c
+index 694783d..c615bb8 100644
+--- a/squashfs-tools/unsquash-4.c
++++ b/squashfs-tools/unsquash-4.c
+@@ -378,6 +378,12 @@ static struct dir *squashfs_opendir(unsi
+ 		}
+ 	}
+ 
++	/* check directory for duplicate names and sorting */
++	if(check_directory(dir) == FALSE) {
++		ERROR("File system corrupted: directory has duplicate names or is unsorted\n");
++		goto corrupted;
++	}
++
+ 	return dir;
+ 
+ corrupted:
+diff --git a/squashfs-tools/unsquashfs.h b/squashfs-tools/unsquashfs.h
+index f8cf78c..bf2a80d 100644
+--- a/squashfs-tools/unsquashfs.h
++++ b/squashfs-tools/unsquashfs.h
+@@ -266,4 +266,8 @@ extern long long *alloc_index_table(int)
+ /* unsquash-1234.c */
+ extern int check_name(char *, int);
+ extern void squashfs_closedir(struct dir *);
++extern int check_directory(struct dir *);
++
++/* unsquash-12.c */
++extern void sort_directory(struct dir *);
+ #endif
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index 083e597b03..84c93d2845 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -12,6 +12,10 @@ SRCREV = "52eb4c279cd283ed9802dd1ceb686560b22ffb67"
 SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https \
            file://0001-squashfs-tools-fix-build-failure-against-gcc-10.patch;striplevel=2 \
            file://CVE-2021-40153.patch;striplevel=2 \
+           file://CVE-2021-41072-requisite-1.patch;striplevel=2 \
+           file://CVE-2021-41072-requisite-2.patch;striplevel=2 \
+           file://CVE-2021-41072-requisite-3.patch;striplevel=2 \
+           file://CVE-2021-41072.patch;striplevel=2 \
 "
 
 S = "${WORKDIR}/git/squashfs-tools"
-- 
2.17.1


