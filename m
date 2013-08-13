Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D936F6A9E1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 06:11:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7D6BtsQ025301
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2013 23:11:55 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 12 Aug 2013 23:11:54 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Aug 2013 14:11:49 +0800
Message-ID: <84b37a5e56be40b8be0ad65fc4aa4974acfbdec4.1376363071.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1376363071.git.Qi.Chen@windriver.com>
References: <cover.1376363071.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhangle.Yang@windriver.com
Subject: [PATCH 1/3] makedevs: support using user/group names in device table files
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
X-List-Received-Date: Tue, 13 Aug 2013 06:11:55 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Compared to hard coding the numeric group and user ids in the device
table files, the way of using user/group names is preferred.

This patch adds the ability to makedevs to correctly deal with device
table files with user/group names in them.

To maintain backward compatibility, the way of using uid/gid is still
supported.

[YOCTO #1159]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../makedevs/makedevs-1.0.0/makedevs.c             |  207 +++++++++++++++++---
 1 file changed, 178 insertions(+), 29 deletions(-)

diff --git a/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c b/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
index 6c1f2fb..cc3707b 100644
--- a/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
+++ b/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
@@ -16,6 +16,11 @@
 
 #define MINORBITS	8
 #define MKDEV(ma,mi)	(((ma) << MINORBITS) | (mi))
+#define MAX_ID_LEN      40
+#define MAX_NAME_LEN    40
+#ifndef PATH_MAX
+#define PATH_MAX        4096
+#endif
 
 /* These are all stolen from busybox's libbb to make
  * error handling simpler (and since I maintain busybox, 
@@ -27,6 +32,15 @@ static const char *const memory_exhausted = "memory exhausted";
 static char default_rootdir[]=".";
 static char *rootdir = default_rootdir;
 
+struct name_id {
+	char name[MAX_NAME_LEN+1];
+	unsigned long id;
+	struct name_id *next;
+};
+
+static struct name_id *usr_list = NULL;
+static struct name_id *grp_list = NULL;
+
 static void verror_msg(const char *s, va_list p)
 {
 	fflush(stdout);
@@ -57,17 +71,6 @@ static void vperror_msg(const char *s, va_list p)
 	fprintf(stderr, "%s%s\n", s, strerror(err));
 }
 
-#if 0
-static void perror_msg(const char *s, ...)
-{
-	va_list p;
-
-	va_start(p, s);
-	vperror_msg(s, p);
-	va_end(p);
-}
-#endif
-
 static void perror_msg_and_die(const char *s, ...)
 {
 	va_list p;
@@ -102,6 +105,124 @@ static char *xstrdup(const char *s)
 	return t;
 }
 
+static struct name_id* alloc_node(void)
+{
+	struct name_id *node;
+	node = (struct name_id*)malloc(sizeof(struct name_id));
+	if (node == NULL) {
+		error_msg_and_die(memory_exhausted);
+	}
+	memset((void *)node->name, 0, MAX_NAME_LEN+1);
+	node->id = 0xffffffff;
+	node->next = NULL;
+	return node;
+}
+
+static struct name_id* parse_line(char *line)
+{
+	char *p;
+	int i;
+	char id_buf[MAX_ID_LEN+1];
+	struct name_id *node;
+	node = alloc_node();
+	p = line;
+	i = 0;
+	// Get name field
+	while (*p != ':') {
+		if (i > MAX_NAME_LEN)
+			error_msg_and_die("Name field too long");
+		node->name[i++] = *p++;
+	}
+	node->name[i] = '\0';
+	p++;
+	// Skip the second field
+	while (*p != ':')
+		p++;
+	p++;
+	// Get id field
+	i = 0;
+	while (*p != ':') {
+		if (i > MAX_ID_LEN)
+			error_msg_and_die("ID filed too long");
+		id_buf[i++] = *p++;
+	}
+	id_buf[i] = '\0';
+	node->id = atol(id_buf);
+	return node;
+}
+
+static void get_list_from_file(FILE *file, struct name_id **plist)
+{
+	char *line;
+	int len = 0;
+	size_t length = 256;
+	struct name_id *node, *cur;
+
+	if((line = (char *)malloc(length)) == NULL) {
+		error_msg_and_die(memory_exhausted);
+	}
+
+	while ((len = getline(&line, &length, file)) != -1) {
+		node = parse_line(line);
+		if (*plist == NULL) {
+			*plist = node;
+			cur = *plist;
+		} else {
+			cur->next = node;
+			cur = cur->next;
+		}
+	}
+
+	if (line)
+		free(line);
+}
+
+static unsigned long convert2guid(char *id_buf, struct name_id *search_list)
+{
+	char *p;
+	int isnum;
+	struct name_id *node;
+	p = id_buf;
+	isnum = 1;
+	while (*p != '\0') {
+		if (!isdigit(*p)) {
+			isnum = 0;
+			break;
+		}
+		p++;
+	}
+	if (isnum) {
+		// Check for bad user/group name
+		node = search_list;
+		while (node != NULL) {
+			if (!strncmp(node->name, id_buf, strlen(id_buf))) {
+				fprintf(stderr, "WARNING: Bad user/group name %s detected\n", id_buf);
+				break;
+			}
+			node = node->next;
+		}
+		return (unsigned long)atol(id_buf);
+	} else {
+		node = search_list;
+		while (node != NULL) {
+			if (!strncmp(node->name, id_buf, strlen(id_buf)))
+				return node->id;
+			node = node->next;
+		}
+		error_msg_and_die("No entry for %s in search list", id_buf);
+	}
+}
+
+static void free_list(struct name_id *list)
+{
+	struct name_id *cur;
+	cur = list;
+	while (cur != NULL) {
+		list = cur;
+		cur = cur->next;
+		free(list);
+	}
+}
 
 static void add_new_directory(char *name, char *path, 
 		unsigned long uid, unsigned long gid, unsigned long mode)
@@ -162,8 +283,9 @@ static void add_new_fifo(char *name, char *path, unsigned long uid,
 
 
 /*  device table entries take the form of:
-    <path>	<type> <mode>	<uid>	<gid>	<major>	<minor>	<start>	<inc>	<count>
+    <path>	<type> <mode>	<usr>	<grp>	<major>	<minor>	<start>	<inc>	<count>
     /dev/mem    c      640      0       0       1       1       0        0        -
+    /dev/zero   c      644      root    root    1       5       -        -        -
 
     type can be one of: 
 	f	A regular file
@@ -181,18 +303,23 @@ static void add_new_fifo(char *name, char *path, unsigned long uid,
 static int interpret_table_entry(char *line)
 {
 	char *name;
+	char usr_buf[MAX_ID_LEN];
+	char grp_buf[MAX_ID_LEN];
 	char path[4096], type;
 	unsigned long mode = 0755, uid = 0, gid = 0, major = 0, minor = 0;
 	unsigned long start = 0, increment = 1, count = 0;
 
-	if (0 > sscanf(line, "%40s %c %lo %lu %lu %lu %lu %lu %lu %lu", path,
-		    &type, &mode, &uid, &gid, &major, &minor, &start,
+	if (0 > sscanf(line, "%40s %c %lo %40s %40s %lu %lu %lu %lu %lu", path,
+		    &type, &mode, usr_buf, grp_buf, &major, &minor, &start,
 		    &increment, &count)) 
 	{
 		return 1;
 	}
 
-	if (!strcmp(path, "/")) {
+	uid = convert2guid(usr_buf, usr_list);
+	gid = convert2guid(grp_buf, grp_list);
+
+	if (strncmp(path, "/", 1)) {
 		error_msg_and_die("Device table entries require absolute paths");
 	}
 	name = xstrdup(path + 1);
@@ -231,7 +358,6 @@ static int interpret_table_entry(char *line)
 			/* FIXME:  MKDEV uses illicit insider knowledge of kernel 
 			 * major/minor representation...  */
 			dev_t rdev = MKDEV(major, minor);
-
 			add_new_device(name, path, uid, gid, mode, rdev);
 		}
 		break;
@@ -249,17 +375,15 @@ static void parse_device_table(FILE * file)
 	size_t length = 256;
 	int len = 0;
 
+	if((line = (char *)malloc(length)) == NULL) {
+		error_msg_and_die(memory_exhausted);
+	}
 	/* Looks ok so far.  The general plan now is to read in one
 	 * line at a time, check for leading comment delimiters ('#'),
 	 * then try and parse the line as a device table.  If we fail
 	 * to parse things, try and help the poor fool to fix their
 	 * device table with a useful error msg... */
 
-	if((line = (char *)malloc(length)) == NULL) {
-		fclose(file);
-		return;
-	}
-
 	while ((len = getline(&line, &length, file)) != -1) {
 		/* First trim off any whitespace */
 
@@ -273,20 +397,20 @@ static void parse_device_table(FILE * file)
 		/* If this is NOT a comment line, try to interpret it */
 		if (*line != '#') interpret_table_entry(line);
 	}
-	if (line) free(line);
 
-	fclose(file);
+	if (line)
+		free(line);
 }
 
-static int go(char *dname, FILE * devtable)
+static int parse_devtable(FILE * devtable)
 {
 	struct stat sb;
 
-	if (lstat(dname, &sb)) {
-		perror_msg_and_die("%s", dname);
+	if (lstat(rootdir, &sb)) {
+		perror_msg_and_die("%s", rootdir);
 	}
-	if (chdir(dname))
-		perror_msg_and_die("%s", dname);
+	if (chdir(rootdir))
+		perror_msg_and_die("%s", rootdir);
 
 	if (devtable)
 		parse_device_table(devtable);
@@ -322,6 +446,10 @@ int main(int argc, char **argv)
 	int c, opt;
 	extern char *optarg;
 	struct stat statbuf;
+	char passwd_path[PATH_MAX];
+	char group_path[PATH_MAX];
+	FILE *passwd_file = NULL;
+	FILE *group_file = NULL;
 	FILE *devtable = NULL;
 
 	umask (0);
@@ -354,6 +482,27 @@ int main(int argc, char **argv)
 		}
 	}
 
-	go(rootdir, devtable);
+	// Get name-id mapping
+	sprintf(passwd_path, "%s/etc/passwd", rootdir);
+	sprintf(group_path, "%s/etc/group", rootdir);
+	if ((passwd_file = fopen(passwd_path, "r")) != NULL) {
+		get_list_from_file(passwd_file, &usr_list);
+		fclose(passwd_file);
+	}
+	if ((group_file = fopen(group_path, "r")) != NULL) {
+		get_list_from_file(group_file, &grp_list);
+		fclose(group_file);
+	}
+
+	// Parse devtable
+	if(devtable) {
+		parse_devtable(devtable);
+		fclose(devtable);
+	}
+
+	// Free list
+	free_list(usr_list);
+	free_list(grp_list);
+
 	return 0;
 }
-- 
1.7.9.5


