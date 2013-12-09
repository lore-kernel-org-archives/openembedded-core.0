Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4D25C6E20E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2013 17:10:41 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id c13so1684804eek.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Dec 2013 09:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4s13jSU4446wysLT2uOjzQ2rY0E8D4qp1ugjAXfWIcU=;
	b=T8zug+dcCe1uA65zJOgt9e765mTn+UfM3TRFwVXecy9lHkyqN1TD70w6m1WLhH7HrO
	35CE3VrbPyd4PzaEAMmFKD6hhcGzRqk06k70SjD3mJ1ROlJk07K6rDH20Tsk/jJ6ZcBk
	7qwN+2B6mYR0pJURH5ZjC+KGZu/0eCS4QBxIsMXO+JWMFMe5yxwB8LyvVbSMhSf44xjX
	njBtci2WyySV4CfE9suMB7Y+xx9wpIcc0UX6JWCiKFSell2AeopyK01hNi4d+GRInpvQ
	SYvVb0Xw/mz9xmf/hk3HhGdCnL0ryY5Z11Qkhb0sQ8rQctqCBP0UKtDCXMM2ANbQsjzB
	rf8g==
X-Received: by 10.14.29.66 with SMTP id h42mr13730770eea.4.1386609040325;
	Mon, 09 Dec 2013 09:10:40 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id o1sm30981480eea.10.2013.12.09.09.10.39
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Dec 2013 09:10:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Dec 2013 18:10:55 +0100
Message-Id: <1386609055-8901-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1386609055-8901-1-git-send-email-Martin.Jansa@gmail.com>
References: <1386609055-8901-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Herb Kuta <herb.kuta@lge.com>
Subject: [PATCH 2/2] makedevs: Add trace option and fix permissions on files if they already exist
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
X-List-Received-Date: Mon, 09 Dec 2013 17:10:41 -0000

From: Herb Kuta <herb.kuta@lge.com>

* update version to 1.0.1

Signed-off-by: Herb Kuta <herb.kuta@lge.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{makedevs-1.0.0 => makedevs}/COPYING.patch     |   0
 .../{makedevs-1.0.0 => makedevs}/makedevs.c        | 120 +++++++++++++++------
 .../{makedevs_1.0.0.bb => makedevs_1.0.1.bb}       |   5 +-
 3 files changed, 88 insertions(+), 37 deletions(-)
 rename meta/recipes-devtools/makedevs/{makedevs-1.0.0 => makedevs}/COPYING.patch (100%)
 rename meta/recipes-devtools/makedevs/{makedevs-1.0.0 => makedevs}/makedevs.c (78%)
 rename meta/recipes-devtools/makedevs/{makedevs_1.0.0.bb => makedevs_1.0.1.bb} (82%)

diff --git a/meta/recipes-devtools/makedevs/makedevs-1.0.0/COPYING.patch b/meta/recipes-devtools/makedevs/makedevs/COPYING.patch
similarity index 100%
rename from meta/recipes-devtools/makedevs/makedevs-1.0.0/COPYING.patch
rename to meta/recipes-devtools/makedevs/makedevs/COPYING.patch
diff --git a/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c b/meta/recipes-devtools/makedevs/makedevs/makedevs.c
similarity index 78%
rename from meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
rename to meta/recipes-devtools/makedevs/makedevs/makedevs.c
index 003d4c3..771f33e 100644
--- a/meta/recipes-devtools/makedevs/makedevs-1.0.0/makedevs.c
+++ b/meta/recipes-devtools/makedevs/makedevs/makedevs.c
@@ -21,16 +21,18 @@
 #ifndef PATH_MAX
 #define PATH_MAX        4096
 #endif
+#define VERSION         "1.0.1"
 
 /* These are all stolen from busybox's libbb to make
- * error handling simpler (and since I maintain busybox, 
- * I'm rather partial to these for error handling). 
+ * error handling simpler (and since I maintain busybox,
+ * I'm rather partial to these for error handling).
  *  -Erik
  */
 static const char *const app_name = "makedevs";
 static const char *const memory_exhausted = "memory exhausted";
 static char default_rootdir[]=".";
 static char *rootdir = default_rootdir;
+static int trace = 0;
 
 struct name_id {
 	char name[MAX_NAME_LEN+1];
@@ -224,56 +226,95 @@ static void free_list(struct name_id *list)
 	}
 }
 
-static void add_new_directory(char *name, char *path, 
+static void add_new_directory(char *name, char *path,
 		unsigned long uid, unsigned long gid, unsigned long mode)
 {
-	mkdir(path, mode);
+	if (trace)
+		fprintf(stderr, "Directory: %s %s  UID: %ld  GID %ld  MODE: %04lo", path, name, uid, gid, mode);
+
+	if (mkdir(path, mode) < 0) {
+		if (EEXIST == errno) {
+			/* Unconditionally apply the mode setting to the existing directory.
+			 * XXX should output something when trace */
+			chmod(path, mode & ~S_IFMT);
+		}
+	}
+	if (trace)
+		putc('\n', stderr);
 	chown(path, uid, gid);
-//	printf("Directory: %s %s  UID: %ld  GID %ld  MODE: %04lo\n", path, name, uid, gid, mode);
 }
 
-static void add_new_device(char *name, char *path, unsigned long uid, 
+static void add_new_device(char *name, char *path, unsigned long uid,
 	unsigned long gid, unsigned long mode, dev_t rdev)
 {
 	int status;
 	struct stat sb;
 
+	if (trace) {
+		fprintf(stderr, "Device: %s %s  UID: %ld  GID: %ld  MODE: %04lo  MAJOR: %d  MINOR: %d",
+				path, name, uid, gid, mode, (short)(rdev >> 8), (short)(rdev & 0xff));
+	}
+
 	memset(&sb, 0, sizeof(struct stat));
 	status = lstat(path, &sb);
-
 	if (status >= 0) {
 		/* It is ok for some types of files to not exit on disk (such as
-		 * device nodes), but if they _do_ exist the specified mode had
-		 * better match the actual file or strange things will happen.... */
-		if ((mode & S_IFMT) != (sb.st_mode & S_IFMT))
-			error_msg_and_die("%s: file type does not match specified type!", path);
+		 * device nodes), but if they _do_ exist, the file type bits had
+		 * better match those of the actual file or strange things will happen... */
+		if ((mode & S_IFMT) != (sb.st_mode & S_IFMT)) {
+			if (trace)
+				putc('\n', stderr);
+			error_msg_and_die("%s: existing file (04%o) type does not match specified file type (04%lo)!",
+						path, (sb.st_mode & S_IFMT), (mode & S_IFMT));
+		}
+		if (mode != sb.st_mode) {
+			if (trace)
+				fprintf(stderr, " -- applying new mode 04%lo (old was 04%o)\n", mode & ~S_IFMT, sb.st_mode & ~S_IFMT);
+			/* Apply the mode setting to the existing device node */
+			chmod(path, mode & ~S_IFMT);
+		}
+		else {
+			if (trace)
+				fprintf(stderr, " -- extraneous entry in table\n", path);
+		}
+	}
+	else {
+		mknod(path, mode, rdev);
+		if (trace)
+			putc('\n', stderr);
+
 	}
 
-	mknod(path, mode, rdev);
 	chown(path, uid, gid);
-//	printf("Device: %s %s  UID: %ld  GID: %ld  MODE: %04lo  MAJOR: %d  MINOR: %d\n",
-//			path, name, uid, gid, mode, (short)(rdev >> 8), (short)(rdev & 0xff));
 }
 
 static void add_new_file(char *name, char *path, unsigned long uid,
 				  unsigned long gid, unsigned long mode)
 {
+	if (trace) {
+		fprintf(stderr, "File: %s %s  UID: %ld  GID: %ld  MODE: %04lo\n",
+			path, name, gid, uid, mode);
+	}
+
 	int fd = open(path,O_CREAT | O_WRONLY, mode);
-	if (fd < 0) { 
+	if (fd < 0) {
 		error_msg_and_die("%s: file can not be created!", path);
 	} else {
 		close(fd);
-	} 
+	}
 	chmod(path, mode);
 	chown(path, uid, gid);
-//	printf("File: %s %s  UID: %ld  GID: %ld  MODE: %04lo\n",
-//			path, name, gid, uid, mode);
 }
 
 
 static void add_new_fifo(char *name, char *path, unsigned long uid,
 				  unsigned long gid, unsigned long mode)
 {
+	if (trace) {
+		printf("Fifo: %s %s  UID: %ld  GID: %ld  MODE: %04lo\n",
+			path, name, gid, uid, mode);
+	}
+
 	int status;
 	struct stat sb;
 
@@ -289,8 +330,6 @@ static void add_new_fifo(char *name, char *path, unsigned long uid,
 			error_msg_and_die("%s: file can not be created with mknod!", path);
 	}
 	chown(path, uid, gid);
-//	printf("File: %s %s  UID: %ld  GID: %ld  MODE: %04lo\n",
-//			path, name, gid, uid, mode);
 }
 
 
@@ -299,7 +338,7 @@ static void add_new_fifo(char *name, char *path, unsigned long uid,
     /dev/mem    c      640      0       0       1       1       0        0        -
     /dev/zero   c      644      root    root    1       5       -        -        -
 
-    type can be one of: 
+    type can be one of:
 	f	A regular file
 	d	Directory
 	c	Character special device file
@@ -323,8 +362,9 @@ static int interpret_table_entry(char *line)
 
 	if (0 > sscanf(line, "%40s %c %lo %40s %40s %lu %lu %lu %lu %lu", path,
 		    &type, &mode, usr_buf, grp_buf, &major, &minor, &start,
-		    &increment, &count)) 
+		    &increment, &count))
 	{
+		fprintf(stderr, "%s: sscanf returned < 0 for line '%s'\n", app_name, line);
 		return 1;
 	}
 
@@ -335,8 +375,10 @@ static int interpret_table_entry(char *line)
 		error_msg_and_die("Device table entries require absolute paths");
 	}
 	name = xstrdup(path + 1);
+	/* prefix path with rootdir */
 	sprintf(path, "%s/%s", rootdir, name);
 
+	/* XXX Why is name passed into all of the add_new_*() routines? */
 	switch (type) {
 	case 'd':
 		mode |= S_IFDIR;
@@ -361,13 +403,14 @@ static int interpret_table_entry(char *line)
 			for (i = start; i < start + count; i++) {
 				sprintf(buf, "%s%d", name, i);
 				sprintf(path, "%s/%s%d", rootdir, name, i);
-				/* FIXME:  MKDEV uses illicit insider knowledge of kernel 
+				/* FIXME:  MKDEV uses illicit insider knowledge of kernel
 				 * major/minor representation...  */
 				rdev = MKDEV(major, minor + (i - start) * increment);
+				sprintf(path, "%s/%s\0", rootdir, buf);
 				add_new_device(buf, path, uid, gid, mode, rdev);
 			}
 		} else {
-			/* FIXME:  MKDEV uses illicit insider knowledge of kernel 
+			/* FIXME:  MKDEV uses illicit insider knowledge of kernel
 			 * major/minor representation...  */
 			dev_t rdev = MKDEV(major, minor);
 			add_new_device(name, path, uid, gid, mode, rdev);
@@ -391,8 +434,9 @@ static void parse_device_table(FILE * file)
 		error_msg_and_die(memory_exhausted);
 	}
 	/* Looks ok so far.  The general plan now is to read in one
-	 * line at a time, check for leading comment delimiters ('#'),
-	 * then try and parse the line as a device table.  If we fail
+	 * line at a time, trim off leading and trailing whitespace,
+	 * check for leading comment delimiters ('#') or a blank line,
+	 * then try and parse the line as a device table entry. If we fail
 	 * to parse things, try and help the poor fool to fix their
 	 * device table with a useful error msg... */
 
@@ -406,8 +450,8 @@ static void parse_device_table(FILE * file)
 		/* trim leading whitespace */
 		memmove(line, &line[strspn(line, " \n\r\t\v")], len + 1);
 
-		/* If this is NOT a comment line, try to interpret it */
-		if (*line != '#') interpret_table_entry(line);
+		/* If this is NOT a comment or an empty line, try to interpret it */
+		if (*line != '#' && *line != '\0') interpret_table_entry(line);
 	}
 
 	if (line)
@@ -434,6 +478,7 @@ static int parse_devtable(FILE * devtable)
 static struct option long_options[] = {
 	{"root", 1, NULL, 'r'},
 	{"help", 0, NULL, 'h'},
+	{"trace", 0, NULL, 't'},
 	{"version", 0, NULL, 'v'},
 	{"devtable", 1, NULL, 'D'},
 	{NULL, 0, NULL, 0}
@@ -446,11 +491,10 @@ static char *helptext =
 	"  -r, -d, --root=DIR     Build filesystem from directory DIR (default: cwd)\n"
 	"  -D, --devtable=FILE    Use the named FILE as a device table file\n"
 	"  -h, --help             Display this help text\n"
+	"  -t, --trace            Be verbose\n"
 	"  -v, --version          Display version information\n\n";
 
 
-static char *revtext = "$Revision: 0.1 $";
-
 int main(int argc, char **argv)
 {
 	int c, opt;
@@ -470,7 +514,7 @@ int main(int argc, char **argv)
 		exit(1);
 	}
 
-	while ((opt = getopt_long(argc, argv, "D:d:r:qhv", 
+	while ((opt = getopt_long(argc, argv, "D:d:r:htv",
 			long_options, &c)) >= 0) {
 		switch (opt) {
 		case 'D':
@@ -493,12 +537,20 @@ int main(int argc, char **argv)
 			} else {
 				closedir(dir);
 			}
-			rootdir = xstrdup(optarg);
+			/* If "/" is specified, use "" because rootdir is always prepended to a
+			 * string that starts with "/" */
+			if (0 == strcmp(optarg, "/"))
+				rootdir = xstrdup("");
+			else
+				rootdir = xstrdup(optarg);
+			break;
+
+		case 't':
+			trace = 1;
 			break;
 
 		case 'v':
-			printf("makedevs revision %.*s\n",
-					(int) strlen(revtext) - 13, revtext + 11);
+			printf("%s: %s\n", app_name, VERSION);
 			exit(0);
 		default:
 			fprintf(stderr, helptext);
diff --git a/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb b/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb
similarity index 82%
rename from meta/recipes-devtools/makedevs/makedevs_1.0.0.bb
rename to meta/recipes-devtools/makedevs/makedevs_1.0.1.bb
index 17b9fce..6aa75a8 100644
--- a/meta/recipes-devtools/makedevs/makedevs_1.0.0.bb
+++ b/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 SECTION = "base"
 SRC_URI = "file://makedevs.c \
            file://COPYING.patch"
-PR = "r7"
 
 FILES_${PN}_append_class-nativesdk = " ${datadir}"
 
@@ -22,8 +21,8 @@ do_install() {
 }
 
 do_install_append_class-nativesdk() {
-        install -d ${D}${datadir}
-        install -m 644 ${COREBASE}/meta/files/device_table-minimal.txt ${D}${datadir}/
+	install -d ${D}${datadir}
+	install -m 644 ${COREBASE}/meta/files/device_table-minimal.txt ${D}${datadir}/
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
1.8.4.3


