Received: from 2.mo1.mail-out.ovh.net ([178.32.119.250]
	helo=mo1.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@eukrea.com>) id 1QzUT6-0008TM-GG
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Sep 2011 16:11:40 +0200
Received: from mail194.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with SMTP id 78D641014C0B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2011 15:31:46 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 2 Sep 2011 15:31:27 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO PCDEV1.lan)
	(denis%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 2 Sep 2011 15:31:25 +0200
From: Denis Carikli <denis@eukrea.com>
To: openembedded-core@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.1 (mo1.mail-out.ovh.net)
Date: Fri,  2 Sep 2011 15:31:06 +0200
Message-Id: <1314970267-20365-1-git-send-email-denis@eukrea.com>
X-Mailer: git-send-email 1.7.4.1
X-Ovh-Tracer-Id: 15757250671277186498
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeftddrudegucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlvddtmdenlhhinhhugidvgiculddqvddtmd
Subject: [PATCH 1/2] mtd-utils: update to version to 1.4.6
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
X-List-Received-Date: Fri, 02 Sep 2011 14:11:40 -0000

mtd-utils 1.4.6 is the lastest release of mtd-utils
  at this time.

Signed-off-by: Denis Carikli <denis@eukrea.com>
---
 .../add-exclusion-to-mkfs-jffs2-git-2.patch        |  103 --------------------
 .../add-exclusion-to-mkfs-jffs2-git-2.patch        |  103 ++++++++++++++++++++
 meta/recipes-devtools/mtd/mtd-utils_1.4.1.bb       |   31 ------
 meta/recipes-devtools/mtd/mtd-utils_1.4.6.bb       |   28 ++++++
 4 files changed, 131 insertions(+), 134 deletions(-)
 delete mode 100644 meta/recipes-devtools/mtd/mtd-utils-1.4.1/add-exclusion-to-mkfs-jffs2-git-2.patch
 create mode 100644 meta/recipes-devtools/mtd/mtd-utils-1.4.6/mtd-utils-1.4.1/add-exclusion-to-mkfs-jffs2-git-2.patch
 delete mode 100644 meta/recipes-devtools/mtd/mtd-utils_1.4.1.bb
 create mode 100644 meta/recipes-devtools/mtd/mtd-utils_1.4.6.bb

diff --git a/meta/recipes-devtools/mtd/mtd-utils-1.4.1/add-exclusion-to-mkfs-jffs2-git-2.patch b/meta/recipes-devtools/mtd/mtd-utils-1.4.1/add-exclusion-to-mkfs-jffs2-git-2.patch
deleted file mode 100644
index 57d6a30..0000000
--- a/meta/recipes-devtools/mtd/mtd-utils-1.4.1/add-exclusion-to-mkfs-jffs2-git-2.patch
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
diff --git a/meta/recipes-devtools/mtd/mtd-utils-1.4.6/mtd-utils-1.4.1/add-exclusion-to-mkfs-jffs2-git-2.patch b/meta/recipes-devtools/mtd/mtd-utils-1.4.6/mtd-utils-1.4.1/add-exclusion-to-mkfs-jffs2-git-2.patch
new file mode 100644
index 0000000..57d6a30
--- /dev/null
+++ b/meta/recipes-devtools/mtd/mtd-utils-1.4.6/mtd-utils-1.4.1/add-exclusion-to-mkfs-jffs2-git-2.patch
@@ -0,0 +1,103 @@
+Upstream-Status: Pending
+
+--- /tmp/mkfs.jffs2.c	2009-01-11 15:28:41.000000000 +0100
++++ git/mkfs.jffs2.c	2009-01-11 15:59:29.000000000 +0100
+@@ -100,6 +100,11 @@
+ 	struct rb_node hardlink_rb;
+ };
+ 
++struct ignorepath_entry {
++	struct ignorepath_entry* next;  /* Points to the next ignorepath element */
++	char name[PATH_MAX];        /* Name of the entry */
++};
++static struct ignorepath_entry* ignorepath = 0;
+ struct rb_root hardlinks;
+ static int out_fd = -1;
+ static int in_fd = -1;
+@@ -408,7 +413,7 @@
+ 	char *hpath, *tpath;
+ 	struct dirent *dp, **namelist;
+ 	struct filesystem_entry *entry;
+-
++	struct ignorepath_entry* element = ignorepath;
+ 
+ 	if (lstat(hostpath, &sb)) {
+ 		perror_msg_and_die("%s", hostpath);
+@@ -417,6 +422,15 @@
+ 	entry = add_host_filesystem_entry(targetpath, hostpath,
+ 			sb.st_uid, sb.st_gid, sb.st_mode, 0, parent);
+ 
++	while ( element ) {
++		if ( strcmp( element->name, targetpath ) == 0 ) {
++			printf( "Note: ignoring directories below '%s'\n", targetpath );
++			return entry;
++			break;
++		}
++		element = element->next;
++	}
++
+ 	n = scandir(hostpath, &namelist, 0, alphasort);
+ 	if (n < 0) {
+ 		perror_msg_and_die("opening directory %s", hostpath);
+@@ -1453,6 +1467,7 @@
+ 	{"root", 1, NULL, 'r'},
+ 	{"pagesize", 1, NULL, 's'},
+ 	{"eraseblock", 1, NULL, 'e'},
++	{"ignore", 1, NULL, 'I'},
+ 	{"output", 1, NULL, 'o'},
+ 	{"help", 0, NULL, 'h'},
+ 	{"verbose", 0, NULL, 'v'},
+@@ -1500,6 +1515,7 @@
+ "  -L, --list-compressors  Show the list of the avaiable compressors\n"
+ "  -t, --test-compression  Call decompress and compare with the original (for test)\n"
+ "  -n, --no-cleanmarkers   Don't add a cleanmarker to every eraseblock\n"
++"  -I, --ignore=PATH       Ignore sub directory and file tree below PATH when recursing over the file system\n"
+ "  -o, --output=FILE       Output to FILE (default: stdout)\n"
+ "  -l, --little-endian     Create a little-endian filesystem\n"
+ "  -b, --big-endian        Create a big-endian filesystem\n"
+@@ -1666,6 +1682,7 @@
+ 	char *compr_name = NULL;
+ 	int compr_prior  = -1;
+ 	int warn_page_size = 0;
++	struct ignorepath_entry* element = ignorepath;
+ 
+ 	page_size = sysconf(_SC_PAGESIZE);
+ 	if (page_size < 0) /* System doesn't know so ... */
+@@ -1676,7 +1693,7 @@
+ 	jffs2_compressors_init();
+ 
+ 	while ((opt = getopt_long(argc, argv,
+-					"D:d:r:s:o:qUPfh?vVe:lbp::nc:m:x:X:Lty:i:", long_options, &c)) >= 0)
++					"D:d:r:s:I:o:qUPfh?vVe:lbp::nc:m:x:X:Lty:i:", long_options, &c)) >= 0)
+ 	{
+ 		switch (opt) {
+ 			case 'D':
+@@ -1700,6 +1717,28 @@
+ 				warn_page_size = 0; /* set by user, so don't need to warn */
+ 				break;
+ 
++			case 'I':
++				printf( "Note: Adding '%s' to ignore Path\n", optarg );
++				element = ignorepath;
++				if ( !ignorepath ) {
++					ignorepath = xmalloc( sizeof( struct ignorepath_entry ) );
++					ignorepath->next = 0;
++					strcpy( &ignorepath->name[0], optarg );
++				} else {
++					while ( element->next ) element = element->next;
++					element->next = xmalloc( sizeof( struct ignorepath_entry ) );
++ 					element->next->next = 0;
++					strcpy( &element->next->name[0], optarg );
++				}
++				printf( "--------- Dumping ignore path list ----------------\n" );
++				element = ignorepath;
++				while ( element ) {
++					printf( "  * '%s'\n", &element->name[0] );
++					element = element->next;
++				}
++				printf( "---------------------------------------------------\n" );
++				break;
++
+ 			case 'o':
+ 				if (out_fd != -1) {
+ 					error_msg_and_die("output filename specified more than once");
diff --git a/meta/recipes-devtools/mtd/mtd-utils_1.4.1.bb b/meta/recipes-devtools/mtd/mtd-utils_1.4.1.bb
deleted file mode 100644
index c05149d..0000000
--- a/meta/recipes-devtools/mtd/mtd-utils_1.4.1.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-DESCRIPTION = "Tools for managing memory technology devices."
-SECTION = "base"
-DEPENDS = "zlib lzo e2fsprogs util-linux"
-HOMEPAGE = "http://www.linux-mtd.infradead.org/"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
-                    file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
-
-SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git;tag=3c3674a6e1d3f59554b0ff68ca59be2fd4134e0c \
-		file://add-exclusion-to-mkfs-jffs2-git-2.patch"
-
-S = "${WORKDIR}/git/"
-
-PR = "r1"
-
-EXTRA_OEMAKE = "'CC=${CC}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
-
-do_install () {
-	oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
-	install -d ${D}${includedir}/mtd/
-	for f in ${S}/include/mtd/*.h; do
-		install -m 0644 $f ${D}${includedir}/mtd/
-	done
-}
-
-PARALLEL_MAKE = ""
-
-BBCLASSEXTEND = "native"
-
-SRC_URI[md5sum] = "645519b753b364d52c4b941dcee3dd7e"
-SRC_URI[sha256sum] = "51d6a77c7e673219bb89c4b119f336d9f2f5a5e065a12ecf9636c5348d099a0e"
diff --git a/meta/recipes-devtools/mtd/mtd-utils_1.4.6.bb b/meta/recipes-devtools/mtd/mtd-utils_1.4.6.bb
new file mode 100644
index 0000000..e1bc5f5
--- /dev/null
+++ b/meta/recipes-devtools/mtd/mtd-utils_1.4.6.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "Tools for managing memory technology devices."
+SECTION = "base"
+DEPENDS = "zlib lzo e2fsprogs util-linux"
+HOMEPAGE = "http://www.linux-mtd.infradead.org/"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
+                    file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
+
+SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git;tag=3c3674a6e1d3f59554b0ff68ca59be2fd4134e0c \
+		file://add-exclusion-to-mkfs-jffs2-git-2.patch"
+
+S = "${WORKDIR}/git/"
+
+PR = "r1"
+
+EXTRA_OEMAKE = "'CC=${CC}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
+
+do_install () {
+	oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
+	install -d ${D}${includedir}/mtd/
+	for f in ${S}/include/mtd/*.h; do
+		install -m 0644 $f ${D}${includedir}/mtd/
+	done
+}
+
+PARALLEL_MAKE = ""
+
+BBCLASSEXTEND = "native"
-- 
1.7.4.1



