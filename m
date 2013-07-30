Return-Path: <mihai.prica@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 0013F6B0AC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 09:45:13 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 30 Jul 2013 02:45:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,777,1367996400"; d="scan'208";a="275220574"
Received: from mihai-vostro-460.rb.intel.com ([10.237.105.61])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Jul 2013 02:45:13 -0700
From: Mihai Prica <mihai.prica@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jul 2013 12:45:16 +0300
Message-Id: <1375177516-9199-1-git-send-email-mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] makedevs: Change numeric user/group ids to user/group names in device table
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
X-List-Received-Date: Tue, 30 Jul 2013 09:45:14 -0000

Full usernames and groupnames should be used instead  of numeric ids in
meta/files/device_table-minimal.txt.

[YOCTO #1159]

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 meta/files/device_table-minimal.txt                |   47 ++++++++++----------
 .../makedevs/makedevs-1.0.0/makedevs.c             |   23 ++++++++--
 2 files changed, 43 insertions(+), 27 deletions(-)

diff --git a/meta/files/device_table-minimal.txt b/meta/files/device_table-minimal.txt
index 02ed534..41c6e0b 100644
--- a/meta/files/device_table-minimal.txt
+++ b/meta/files/device_table-minimal.txt
@@ -1,5 +1,5 @@
-#<path>	<type> <mode>	<uid>	<gid>	<major>	<minor>	<start>	<inc>	<count>
-#/dev/mem    c      640      0       0       1       1       0        0        -
+#<path>	<type> <mode>	<username>	<groupname>	<major>	<minor>	<start>	<inc>	<count>
+#/dev/mem    c      640      root       root       1       1       0        0        -
 #
 #type can be one of: 
 #    f	A regular file
@@ -8,24 +8,25 @@
 #    b	Block special device file
 #    p	Fifo (named pipe)
 
-/dev		d	755	0	0	-	-	-	-	-
-/dev/initctl	p	600	0	0	-	-	-	-	-
-/dev/apm_bios	c	660	0	46	10	134	-	-	-
-/dev/fb0	c	600	0	0	29	0	-	-	-
-/dev/hda	b	660	0	6	3	0	-	-	-
-/dev/hda	b	660	0	6	3	1	1	1	19
-/dev/kmem	c	640	0	15	1	2	-	-	-
-/dev/kmsg	c	600	0	0	1	11	-	-	-
-/dev/mem	c	640	0	15	1	1	-	-	-
-/dev/null	c	666	0	0	1	3	-	-	-
-/dev/ram	b	640	0	0	1	0	0	1	4
-/dev/tty	c	662	0	5	5	0	-	-	-
-/dev/tty	c	666	0	5	4	0	0	1	9
-/dev/ttyS	c	640	0	5	4	64	0	1	1
-/dev/ttySA	c	640	0	5	204	5	0	1	1
-/dev/zero	c	644	0	0	1	5	-	-	-
-/dev/mtd	c	660	0	6	90	0	0	2	8
-/dev/mtdblock	b	640	0	0	31	0	0	1	8
-/dev/console	c	662	0	5	5	1	-	-	-
-/dev/random	c	644	0	0	1	8	-	-	-
-/dev/urandom	c	644	0	0	1	9	-	-	-
+/dev		d	755	root	root	-	-	-	-	-
+/dev/initctl	p	600	root	root	-	-	-	-	-
+/dev/apm_bios	c	660	root	plugdev	10	134	-	-	-
+/dev/fb0	c	600	root	root	29	0	-	-	-
+/dev/hda	b	660	root	disk	3	0	-	-	-
+/dev/hda	b	660	root	disk	3	1	1	1	20
+/dev/kmem	c	640	root	kmem	1	2	-	-	-
+/dev/kmsg	c	600	root	root	1	11	-	-	-
+/dev/mem	c	640	root	kmem	1	1	-	-	-
+/dev/null	c	666	root	root	1	3	-	-	-
+/dev/ram	b	640	root	root	1	0	0	1	4
+/dev/tty	c	662	root    tty	5	0	-	-	-
+/dev/tty	c	666	root	tty	4	0	0	1	9
+/dev/ttyS	c	640	root	tty	4	64	0	1	1
+/dev/ttySA	c	640	root	tty	204	5	0	1	1
+/dev/zero	c	644	root	root	1	5	-	-	-
+/dev/mtd	c	660	root	disk	90	0	0	2	8
+/dev/mtdblock	b	640	root	root	0	31	0	0	1	8
+/dev/console	c	662	root	root	5	1	-	-	-
+/dev/random	c	644	root	root	1	8	-	-	-
+/dev/urandom	c	644	root	root	1	9	-	-	-
+
diff --git a/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c b/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
index 6c1f2fb..26bbe33 100644
--- a/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
+++ b/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
@@ -13,6 +13,8 @@
 #include <libgen.h>
 #include <sys/types.h>
 #include <sys/stat.h>
+#include <pwd.h>
+#include <grp.h>
 
 #define MINORBITS	8
 #define MKDEV(ma,mi)	(((ma) << MINORBITS) | (mi))
@@ -180,13 +182,15 @@ static void add_new_fifo(char *name, char *path, unsigned long uid,
 */
 static int interpret_table_entry(char *line)
 {
-	char *name;
-	char path[4096], type;
+	char *name;	
+	char path[4096], username[32], groupname[32], type;
 	unsigned long mode = 0755, uid = 0, gid = 0, major = 0, minor = 0;
 	unsigned long start = 0, increment = 1, count = 0;
+	struct passwd *pw;
+	struct group *gr;
 
-	if (0 > sscanf(line, "%40s %c %lo %lu %lu %lu %lu %lu %lu %lu", path,
-		    &type, &mode, &uid, &gid, &major, &minor, &start,
+	if (0 > sscanf(line, "%40s %c %lo %s %s %lu %lu %lu %lu %lu", path,
+		    &type, &mode, &username, &groupname, &major, &minor, &start,	
 		    &increment, &count)) 
 	{
 		return 1;
@@ -198,6 +202,17 @@ static int interpret_table_entry(char *line)
 	name = xstrdup(path + 1);
 	sprintf(path, "%s/%s", rootdir, name);
 
+	pw = getpwnam(username);
+	if (pw == NULL) {
+		error_msg_and_die("Username does not exist in the user database");
+	}
+	uid = pw->pw_uid;
+	gr = getgrnam(groupname);
+	if (gr == NULL) {
+		error_msg_and_die("Groupname does not exist in the group database ");
+	}
+	gid = gr->gr_gid;
+	
 	switch (type) {
 	case 'd':
 		mode |= S_IFDIR;
-- 
1.7.9.5


