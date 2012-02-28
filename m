Received: from outbound.icp-qv1-irony-out3.iinet.net.au ([203.59.1.148])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1S2GhL-0002ZW-Pw
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 07:38:09 +0100
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AvwEAEVzTE/LO4Se/2dsb2JhbABDs3OBB4IhUiiBKYgFDLhpiWmDFQtfhR0HPxAJDIM+BIhNkm+DIYlbgUc
X-IronPort-AV: E=Sophos;i="4.73,494,1325433600"; d="scan'208";a="764237068"
Received: from unknown (HELO gentoo_vm.DMA.local) ([203.59.132.158])
	by outbound.icp-qv1-irony-out3.iinet.net.au with ESMTP;
	28 Feb 2012 14:26:32 +0800
From: James Limbouris <james@digitalmatter.com.au>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Feb 2012 14:25:46 +0800
Message-Id: <1330410346-14477-1-git-send-email-james@digitalmatter.com.au>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH] mtd-utils: clean up old files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Feb 2012 06:38:09 -0000

Signed-off-by: James Limbouris <james@digitalmatter.com.au>
---
 .../add-exclusion-to-mkfs-jffs2-git-2.patch        |  103 ---------------
 .../add-exclusion-to-mkfs-jffs2-git.patch          |  136 --------------------
 .../mtd/mtd-utils/fix-ignoreerrors-git.patch       |   28 ----
 .../mtd/mtd-utils/remove-ubi.patch                 |   35 -----
 meta/recipes-devtools/mtd/mtd-utils_1.1.0+git.bb   |   28 ----
 5 files changed, 0 insertions(+), 330 deletions(-)
 delete mode 100644 meta/recipes-devtools/mtd/mtd-utils-1.4.9/mtd-utils-1.4.1/add-exclusion-to-mkfs-jffs2-git-2.patch
 delete mode 100644 meta/recipes-devtools/mtd/mtd-utils/add-exclusion-to-mkfs-jffs2-git.patch
 delete mode 100644 meta/recipes-devtools/mtd/mtd-utils/fix-ignoreerrors-git.patch
 delete mode 100644 meta/recipes-devtools/mtd/mtd-utils/remove-ubi.patch
 delete mode 100644 meta/recipes-devtools/mtd/mtd-utils_1.1.0+git.bb

diff --git a/meta/recipes-devtools/mtd/mtd-utils-1.4.9/mtd-utils-1.4.1/add-exclusion-to-mkfs-jffs2-git-2.patch b/meta/recipes-devtools/mtd/mtd-utils-1.4.9/mtd-utils-1.4.1/add-exclusion-to-mkfs-jffs2-git-2.patch
deleted file mode 100644
index 57d6a30..0000000
--- a/meta/recipes-devtools/mtd/mtd-utils-1.4.9/mtd-utils-1.4.1/add-exclusion-to-mkfs-jffs2-git-2.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-Upstream-Status: Pending
-
---- /tmp/mkfs.jffs2.c	2009-01-11 15:28:41.000000000 +0100
-+++ git/mkfs.jffs2.c	2009-01-11 15:59:29.000000000 +0100
-@@ -100,6 +100,11 @@
- 	struct rb_node hardlink_rb;
- };
- 
-+struct ignorepath_entry {
-+	struct ignorepath_entry* next;  /* Points to the next ignorepath element */
-+	char name[PATH_MAX];        /* Name of the entry */
-+};
-+static struct ignorepath_entry* ignorepath = 0;
- struct rb_root hardlinks;
- static int out_fd = -1;
- static int in_fd = -1;
-@@ -408,7 +413,7 @@
- 	char *hpath, *tpath;
- 	struct dirent *dp, **namelist;
- 	struct filesystem_entry *entry;
--
-+	struct ignorepath_entry* element = ignorepath;
- 
- 	if (lstat(hostpath, &sb)) {
- 		perror_msg_and_die("%s", hostpath);
-@@ -417,6 +422,15 @@
- 	entry = add_host_filesystem_entry(targetpath, hostpath,
- 			sb.st_uid, sb.st_gid, sb.st_mode, 0, parent);
- 
-+	while ( element ) {
-+		if ( strcmp( element->name, targetpath ) == 0 ) {
-+			printf( "Note: ignoring directories below '%s'\n", targetpath );
-+			return entry;
-+			break;
-+		}
-+		element = element->next;
-+	}
-+
- 	n = scandir(hostpath, &namelist, 0, alphasort);
- 	if (n < 0) {
- 		perror_msg_and_die("opening directory %s", hostpath);
-@@ -1453,6 +1467,7 @@
- 	{"root", 1, NULL, 'r'},
- 	{"pagesize", 1, NULL, 's'},
- 	{"eraseblock", 1, NULL, 'e'},
-+	{"ignore", 1, NULL, 'I'},
- 	{"output", 1, NULL, 'o'},
- 	{"help", 0, NULL, 'h'},
- 	{"verbose", 0, NULL, 'v'},
-@@ -1500,6 +1515,7 @@
- "  -L, --list-compressors  Show the list of the avaiable compressors\n"
- "  -t, --test-compression  Call decompress and compare with the original (for test)\n"
- "  -n, --no-cleanmarkers   Don't add a cleanmarker to every eraseblock\n"
-+"  -I, --ignore=PATH       Ignore sub directory and file tree below PATH when recursing over the file system\n"
- "  -o, --output=FILE       Output to FILE (default: stdout)\n"
- "  -l, --little-endian     Create a little-endian filesystem\n"
- "  -b, --big-endian        Create a big-endian filesystem\n"
-@@ -1666,6 +1682,7 @@
- 	char *compr_name = NULL;
- 	int compr_prior  = -1;
- 	int warn_page_size = 0;
-+	struct ignorepath_entry* element = ignorepath;
- 
- 	page_size = sysconf(_SC_PAGESIZE);
- 	if (page_size < 0) /* System doesn't know so ... */
-@@ -1676,7 +1693,7 @@
- 	jffs2_compressors_init();
- 
- 	while ((opt = getopt_long(argc, argv,
--					"D:d:r:s:o:qUPfh?vVe:lbp::nc:m:x:X:Lty:i:", long_options, &c)) >= 0)
-+					"D:d:r:s:I:o:qUPfh?vVe:lbp::nc:m:x:X:Lty:i:", long_options, &c)) >= 0)
- 	{
- 		switch (opt) {
- 			case 'D':
-@@ -1700,6 +1717,28 @@
- 				warn_page_size = 0; /* set by user, so don't need to warn */
- 				break;
- 
-+			case 'I':
-+				printf( "Note: Adding '%s' to ignore Path\n", optarg );
-+				element = ignorepath;
-+				if ( !ignorepath ) {
-+					ignorepath = xmalloc( sizeof( struct ignorepath_entry ) );
-+					ignorepath->next = 0;
-+					strcpy( &ignorepath->name[0], optarg );
-+				} else {
-+					while ( element->next ) element = element->next;
-+					element->next = xmalloc( sizeof( struct ignorepath_entry ) );
-+ 					element->next->next = 0;
-+					strcpy( &element->next->name[0], optarg );
-+				}
-+				printf( "--------- Dumping ignore path list ----------------\n" );
-+				element = ignorepath;
-+				while ( element ) {
-+					printf( "  * '%s'\n", &element->name[0] );
-+					element = element->next;
-+				}
-+				printf( "---------------------------------------------------\n" );
-+				break;
-+
- 			case 'o':
- 				if (out_fd != -1) {
- 					error_msg_and_die("output filename specified more than once");
diff --git a/meta/recipes-devtools/mtd/mtd-utils/add-exclusion-to-mkfs-jffs2-git.patch b/meta/recipes-devtools/mtd/mtd-utils/add-exclusion-to-mkfs-jffs2-git.patch
deleted file mode 100644
index 60edb8f..0000000
--- a/meta/recipes-devtools/mtd/mtd-utils/add-exclusion-to-mkfs-jffs2-git.patch
+++ /dev/null
@@ -1,136 +0,0 @@
-Upstream-Status: Pending
-
----
- mkfs.jffs2.c |   44 ++++++++++++++++++++++++++++++++++++++++++--
- 1 file changed, 42 insertions(+), 2 deletions(-)
-
---- git.orig/mkfs.jffs2.c
-+++ git/mkfs.jffs2.c
-@@ -98,10 +98,16 @@ struct filesystem_entry {
- 	struct filesystem_entry *next;	/* Only relevant to non-directories */
- 	struct filesystem_entry *files;	/* Only relevant to directories */
- 	struct rb_node hardlink_rb;
- };
- 
-+struct ignorepath_entry {
-+	struct ignorepath_entry* next;	/* Points to the next ignorepath element */
-+	char name[PATH_MAX];		/* Name of the entry */
-+};
-+
-+static struct ignorepath_entry* ignorepath = 0;
- struct rb_root hardlinks;
- static int out_fd = -1;
- static int in_fd = -1;
- static char default_rootdir[] = ".";
- static char *rootdir = default_rootdir;
-@@ -404,19 +410,28 @@ static struct filesystem_entry *recursiv
- 	int i, n;
- 	struct stat sb;
- 	char *hpath, *tpath;
- 	struct dirent *dp, **namelist;
- 	struct filesystem_entry *entry;
--
-+	struct ignorepath_entry* element = ignorepath;
- 
- 	if (lstat(hostpath, &sb)) {
- 		perror_msg_and_die("%s", hostpath);
- 	}
- 
- 	entry = add_host_filesystem_entry(targetpath, hostpath,
- 			sb.st_uid, sb.st_gid, sb.st_mode, 0, parent);
- 
-+	while ( element ) {
-+		if ( strcmp( element->name, targetpath ) == 0 ) {
-+			printf( "Note: ignoring directories below '%s'\n", targetpath );
-+			return entry;
-+			break;
-+		}
-+		element = element->next;
-+	}
-+
- 	n = scandir(hostpath, &namelist, 0, alphasort);
- 	if (n < 0) {
- 		perror_msg_and_die("opening directory %s", hostpath);
- 	}
- 
-@@ -1446,10 +1461,11 @@ static void create_target_filesystem(str
- static struct option long_options[] = {
- 	{"pad", 2, NULL, 'p'},
- 	{"root", 1, NULL, 'r'},
- 	{"pagesize", 1, NULL, 's'},
- 	{"eraseblock", 1, NULL, 'e'},
-+	{"ignore", 1, NULL, 'I'},
- 	{"output", 1, NULL, 'o'},
- 	{"help", 0, NULL, 'h'},
- 	{"verbose", 0, NULL, 'v'},
- 	{"version", 0, NULL, 'V'},
- 	{"big-endian", 0, NULL, 'b'},
-@@ -1493,10 +1509,11 @@ static char *helptext =
- "  -y, --compressor-priority=PRIORITY:COMPRESSOR_NAME\n"
- "                          Set the priority of a compressor\n"
- "  -L, --list-compressors  Show the list of the avaiable compressors\n"
- "  -t, --test-compression  Call decompress and compare with the original (for test)\n"
- "  -n, --no-cleanmarkers   Don't add a cleanmarker to every eraseblock\n"
-+"  -I, --ignore=PATH       Ignore sub directory and file tree below PATH when recursing over the file system\n"
- "  -o, --output=FILE       Output to FILE (default: stdout)\n"
- "  -l, --little-endian     Create a little-endian filesystem\n"
- "  -b, --big-endian        Create a big-endian filesystem\n"
- "  -D, --devtable=FILE     Use the named FILE as a device table file\n"
- "  -f, --faketime          Change all file times to '0' for regression testing\n"
-@@ -1659,21 +1676,22 @@ int main(int argc, char **argv)
- 	FILE *devtable = NULL;
- 	struct filesystem_entry *root;
- 	char *compr_name = NULL;
- 	int compr_prior  = -1;
- 	int warn_page_size = 0;
-+  	struct ignorepath_entry* element = ignorepath;
- 
- 	page_size = sysconf(_SC_PAGESIZE);
- 	if (page_size < 0) /* System doesn't know so ... */
- 		page_size = 4096; /* ... we make an educated guess */
- 	if (page_size != 4096)
- 		warn_page_size = 1; /* warn user if page size not 4096 */
- 
- 	jffs2_compressors_init();
- 
- 	while ((opt = getopt_long(argc, argv,
--					"D:d:r:s:o:qUPfh?vVe:lbp::nc:m:x:X:Lty:i:", long_options, &c)) >= 0)
-+   					"D:d:r:s:I:o:qUPfh?vVe:lbp::nc:m:x:X:Lty:i:", long_options, &c)) >= 0)
- 	{
- 		switch (opt) {
- 			case 'D':
- 				devtable = xfopen(optarg, "r");
- 				if (fstat(fileno(devtable), &sb) < 0)
-@@ -1693,10 +1711,32 @@ int main(int argc, char **argv)
- 			case 's':
- 				page_size = strtol(optarg, NULL, 0);
- 				warn_page_size = 0; /* set by user, so don't need to warn */
- 				break;
- 
-+			case 'I':
-+				printf( "Note: Adding '%s' to ignore Path\n", optarg );
-+				element = ignorepath;
-+				if ( !ignorepath ) {
-+					ignorepath = xmalloc( sizeof( struct ignorepath_entry ) );
-+					ignorepath->next = 0;
-+					strcpy( &ignorepath->name[0], optarg );
-+				} else {
-+					while ( element->next ) element = element->next;
-+					element->next = xmalloc( sizeof( struct ignorepath_entry ) );
-+ 					element->next->next = 0;
-+					strcpy( &element->next->name[0], optarg );
-+				}
-+				printf( "--------- Dumping ignore path list ----------------\n" );
-+				element = ignorepath;
-+				while ( element ) {
-+					printf( "  * '%s'\n", &element->name[0] );
-+					element = element->next;
-+				}
-+				printf( "---------------------------------------------------\n" );
-+				break;
-+
- 			case 'o':
- 				if (out_fd != -1) {
- 					error_msg_and_die("output filename specified more than once");
- 				}
- 				out_fd = open(optarg, O_CREAT | O_TRUNC | O_RDWR, 0644);
diff --git a/meta/recipes-devtools/mtd/mtd-utils/fix-ignoreerrors-git.patch b/meta/recipes-devtools/mtd/mtd-utils/fix-ignoreerrors-git.patch
deleted file mode 100644
index f532a27..0000000
--- a/meta/recipes-devtools/mtd/mtd-utils/fix-ignoreerrors-git.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Upstream-Status: Pending
-
----
- nanddump.c |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-Index: git/nanddump.c
-===================================================================
---- git.orig/nanddump.c	2007-01-23 15:42:34.000000000 +0000
-+++ git/nanddump.c	2007-01-23 15:47:57.000000000 +0000
-@@ -281,7 +281,7 @@ int main(int argc, char **argv)
- 			}
- 		}
- 
--		if (badblock) {
-+		if (badblock && !ignoreerrors) {
- 			if (omitbad)
- 				continue;
- 			memset (readbuf, 0xff, bs);
-@@ -335,7 +335,7 @@ int main(int argc, char **argv)
- 		if (omitoob)
- 			continue;
- 
--		if (badblock) {
-+		if (badblock && !ignoreerrors) {
- 			memset (readbuf, 0xff, meminfo.oobsize);
- 		} else {
- 			/* Read OOB data and exit on failure */
diff --git a/meta/recipes-devtools/mtd/mtd-utils/remove-ubi.patch b/meta/recipes-devtools/mtd/mtd-utils/remove-ubi.patch
deleted file mode 100644
index 24a4697..0000000
--- a/meta/recipes-devtools/mtd/mtd-utils/remove-ubi.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
----
- Makefile |    3 ---
- 1 file changed, 3 deletions(-)
-
---- git.orig/Makefile
-+++ git/Makefile
-@@ -41,19 +41,17 @@ $(BUILDDIR)/%.o: %.c
- 	$(CC) $(CFLAGS) -g -c -o $@ $< -g -Wp,-MD,$(BUILDDIR)/.$(<F).dep
- 
- .SUFFIXES:
- 
- all: $(TARGETS)
--	make -C $(BUILDDIR)/ubi-utils
- 
- IGNORE=${wildcard $(BUILDDIR)/.*.c.dep}
- -include ${IGNORE}
- 
- clean:
- 	rm -f $(BUILDDIR)/*.o $(TARGETS) $(BUILDDIR)/.*.c.dep $(SYMLINKS)
- 	if [ "$(BUILDDIR)x" != ".x" ]; then rm -rf $(BUILDDIR); fi
--	make -C $(BUILDDIR)/ubi-utils clean
- 
- $(SYMLINKS):
- 	ln -sf ../fs/jffs2/$@ $@
- 
- $(BUILDDIR)/mkfs.jffs2: $(BUILDDIR)/crc32.o \
-@@ -91,6 +89,5 @@ $(BUILDDIR)/fectest: $(BUILDDIR)/fectest
- install: ${TARGETS}
- 	mkdir -p ${DESTDIR}/${SBINDIR}
- 	install -m0755 ${TARGETS} ${DESTDIR}/${SBINDIR}/
- 	mkdir -p ${DESTDIR}/${MANDIR}/man1
- 	gzip -9c mkfs.jffs2.1 > ${DESTDIR}/${MANDIR}/man1/mkfs.jffs2.1.gz
--	make -C $(BUILDDIR)/ubi-utils install
diff --git a/meta/recipes-devtools/mtd/mtd-utils_1.1.0+git.bb b/meta/recipes-devtools/mtd/mtd-utils_1.1.0+git.bb
deleted file mode 100644
index 04531de..0000000
--- a/meta/recipes-devtools/mtd/mtd-utils_1.1.0+git.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-DESCRIPTION = "Tools for managing memory technology devices."
-SECTION = "base"
-DEPENDS = "zlib lzo"
-HOMEPAGE = "http://www.linux-mtd.infradead.org/"
-LICENSE = "GPLv2"
-PR = "r2"
-
-SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git;tag=b995f89a81589be8d8a41c374a6df109d0ee12b3 \
-           file://add-exclusion-to-mkfs-jffs2-git.patch \
-	   file://remove-ubi.patch \
-	   file://fix-ignoreerrors-git.patch"
-
-S = "${WORKDIR}/git/"
-
-EXTRA_OEMAKE = "'CC=${CC}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR'"
-
-do_install () {
-	oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
-	install -d ${D}${includedir}/mtd/
-	for f in ${S}/include/mtd/*.h; do
-		install -m 0644 $f ${D}${includedir}/mtd/
-	done
-
-}
-
-PARALLEL_MAKE = ""
-
-BBCLASSEXTEND = "native"
-- 
1.7.3.4



