Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R0zUv-00037C-U6
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Sep 2011 19:31:46 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Sep 2011 10:26:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,339,1312182000"; d="scan'208";a="49562720"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.39])
	by fmsmga002.fm.intel.com with ESMTP; 06 Sep 2011 10:26:27 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Sep 2011 10:26:22 -0700
Message-Id: <e215c5e99f7a038c5488afac45dc596532bfda1e.1315329511.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1315329511.git.sgw@linux.intel.com>
References: <cover.1315329511.git.sgw@linux.intel.com>
In-Reply-To: <cover.1315329511.git.sgw@linux.intel.com>
References: <cover.1315329511.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 2/5] mtd-utils: update to version to 1.4.6
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
X-List-Received-Date: Tue, 06 Sep 2011 17:31:46 -0000

From: Denis Carikli <denis@eukrea.com>

mtd-utils 1.4.6 is the lastest release of mtd-utils
  at this time.

Signed-off-by: Denis Carikli <denis@eukrea.com>
---
 .../add-exclusion-to-mkfs-jffs2-git-2.patch        |    0
 .../add-exclusion-to-mkfs-jffs2-git-2.patch        |  103 ++++++++++++++++++++
 .../mtd/{mtd-utils_1.4.1.bb => mtd-utils_1.4.6.bb} |    7 +-
 3 files changed, 105 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/mtd/{mtd-utils-1.4.1 => mtd-utils-1.4.6}/add-exclusion-to-mkfs-jffs2-git-2.patch (100%)
 create mode 100644 meta/recipes-devtools/mtd/mtd-utils-1.4.6/mtd-utils-1.4.1/add-exclusion-to-mkfs-jffs2-git-2.patch
 rename meta/recipes-devtools/mtd/{mtd-utils_1.4.1.bb => mtd-utils_1.4.6.bb} (81%)

diff --git a/meta/recipes-devtools/mtd/mtd-utils-1.4.1/add-exclusion-to-mkfs-jffs2-git-2.patch b/meta/recipes-devtools/mtd/mtd-utils-1.4.6/add-exclusion-to-mkfs-jffs2-git-2.patch
similarity index 100%
rename from meta/recipes-devtools/mtd/mtd-utils-1.4.1/add-exclusion-to-mkfs-jffs2-git-2.patch
rename to meta/recipes-devtools/mtd/mtd-utils-1.4.6/add-exclusion-to-mkfs-jffs2-git-2.patch
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
diff --git a/meta/recipes-devtools/mtd/mtd-utils_1.4.1.bb b/meta/recipes-devtools/mtd/mtd-utils_1.4.6.bb
similarity index 81%
rename from meta/recipes-devtools/mtd/mtd-utils_1.4.1.bb
rename to meta/recipes-devtools/mtd/mtd-utils_1.4.6.bb
index c05149d..79f4f15 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_1.4.1.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_1.4.6.bb
@@ -6,12 +6,12 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
 
-SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git;tag=3c3674a6e1d3f59554b0ff68ca59be2fd4134e0c \
+SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git;tag=baafd8ace3301e9d2ba314a376bad008314b34ff \
 		file://add-exclusion-to-mkfs-jffs2-git-2.patch"
 
 S = "${WORKDIR}/git/"
 
-PR = "r1"
+PR = "r0"
 
 EXTRA_OEMAKE = "'CC=${CC}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
 
@@ -26,6 +26,3 @@ do_install () {
 PARALLEL_MAKE = ""
 
 BBCLASSEXTEND = "native"
-
-SRC_URI[md5sum] = "645519b753b364d52c4b941dcee3dd7e"
-SRC_URI[sha256sum] = "51d6a77c7e673219bb89c4b119f336d9f2f5a5e065a12ecf9636c5348d099a0e"
-- 
1.7.6



