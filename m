Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 662BC60191
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 10:52:52 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w6PAqp0N031841
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 11:52:52 +0100
Message-ID: <3b6d108714acd149de780b51c996ea7f4aa392eb.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 25 Jul 2018 11:52:51 +0100
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: oe-selftest test cases which write to meta/
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
X-List-Received-Date: Wed, 25 Jul 2018 10:52:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

As some will have gathered we want to parallelise oe-selftest. In the
weekly status report I promised a report of the problems.

There are some test cases which write to meta/ and these interfere with
other tests which may be running in parallel. I've run oe-selftest with
monitoring in the background to spot changes. The tests I found were
making changes are:

devtool.DevtoolUpdateTests.test_devtool_update_recipe
bblayers.BitbakeLayers.test_bitbakelayers_createlayer
devtool.DevtoolUpdateTests.test_devtool_update_recipe_git
devtool.DevtoolUpdateTests.test_devtool_update_recipe_append_git
devtool.DevtoolUpdateTests.test_devtool_update_recipe_local_files
devtool.DevtoolUpgradeTests.test_devtool_finish_modify_origlayer
devtool.DevtoolUpgradeTests.test_devtool_load_plugin
recipetool.RecipetoolTests.test_recipetool_load_plugin
bbtests.BitbakeTests.test_run_bitbake_from_dir_2

I believe Paul is going to look at a generic solution for
devtool.DevtoolUpgradeTests and devtool.DevtoolUpdateTests where we'll
make a copy of meta/ since those have a genuine need to modify the
meta/ directory for the test.

That will leave:

bblayers.BitbakeLayers.test_bitbakelayers_createlayer
devtool.DevtoolUpgradeTests.test_devtool_load_plugin
recipetool.RecipetoolTests.test_recipetool_load_plugin
bbtests.BitbakeTests.test_run_bitbake_from_dir_2

I suspect these 4 don't break other tests so we don't need to fix these
before enabling parallelisation by default but we still need to fix
them.

createlayer is probably easy to fix, the load_plugins test is harder
(both are the same issue). The last bitbake one generates a cookerlog
in an annoying location so is hopefully easy to fix by choice of
working directory too.

Details follow below with a list of files each test changes or creates.

Cheers,

Richard



*** devtool.DevtoolUpdateTests.test_devtool_update_recipe:

diff --git a/meta/recipes-extended/minicom/minicom_2.7.1.bb b/meta/recipes-extended/minicom/minicom_2.7.1.bb
index 1e6f1317ebe..94c75d8b7d8 100644
--- a/meta/recipes-extended/minicom/minicom_2.7.1.bb
+++ b/meta/recipes-extended/minicom/minicom_2.7.1.bb
@@ -11,7 +11,9 @@ SRC_URI = "${DEBIAN_MIRROR}/main/m/${BPN}/${BPN}_${PV}.orig.tar.gz \
            file://allow.to.disable.lockdev.patch \
            file://0001-fix-minicom-h-v-return-value-is-not-0.patch \
            file://0001-Fix-build-issus-surfaced-due-to-musl.patch \
-          "
+           file://0001-Change-the-README.patch \
+           file://0002-Add-a-new-file.patch \
+           "
 
 SRC_URI[md5sum] = "9021cb8c5445f6e6e74b2acc39962d62"
 SRC_URI[sha256sum] = "532f836b7a677eb0cb1dca8d70302b73729c3d30df26d58368d712e5cca041f1"


*** bblayers.BitbakeLayers.test_bitbakelayers_createlayer

test-bitbakelayer-layercreate/COPYING.MIT
test-bitbakelayer-layercreate/README
test-bitbakelayer-layercreate/conf/layer.conf
test-bitbakelayer-layercreate/recipes-example/example/example_0.1.bb

*** devtool.DevtoolUpdateTests.test_devtool_update_recipe_append_git

diff --git a/meta/recipes-devtools/mtd/mtd-utils/add-exclusion-to-mkfs-jffs2-git-2.patch b/meta/recipes-devtools/mtd/mtd-utils/add-exclusion-to-mkfs-jffs2-git-2.patch
deleted file mode 100644
index 5d874d9810b..00000000000
--- a/meta/recipes-devtools/mtd/mtd-utils/add-exclusion-to-mkfs-jffs2-git-2.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-Upstream-Status: Pending
-
-Index: git/jffsX-utils/mkfs.jffs2.c
-===================================================================
---- git.orig/jffsX-utils/mkfs.jffs2.c
-+++ git/jffsX-utils/mkfs.jffs2.c
-@@ -100,6 +100,11 @@ struct filesystem_entry {
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
-@@ -309,7 +314,7 @@ static struct filesystem_entry *recursiv
- 	char *hpath, *tpath;
- 	struct dirent *dp, **namelist;
- 	struct filesystem_entry *entry;
--
-+	struct ignorepath_entry* element = ignorepath;
- 
- 	if (lstat(hostpath, &sb)) {
- 		sys_errmsg_die("%s", hostpath);
-@@ -318,6 +323,15 @@ static struct filesystem_entry *recursiv
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
- 		sys_errmsg_die("opening directory %s", hostpath);
-@@ -1359,6 +1373,7 @@ static struct option long_options[] = {
- 	{"root", 1, NULL, 'r'},
- 	{"pagesize", 1, NULL, 's'},
- 	{"eraseblock", 1, NULL, 'e'},
-+	{"ignore", 1, NULL, 'I'},
- 	{"output", 1, NULL, 'o'},
- 	{"help", 0, NULL, 'h'},
- 	{"verbose", 0, NULL, 'v'},
-@@ -1409,6 +1424,7 @@ static const char helptext[] =
- "  -L, --list-compressors  Show the list of the available compressors\n"
- "  -t, --test-compression  Call decompress and compare with the original (for test)\n"
- "  -n, --no-cleanmarkers   Don't add a cleanmarker to every eraseblock\n"
-+"  -I, --ignore=PATH       Ignore sub directory and file tree below PATH when recursing over the file system\n"
- "  -o, --output=FILE       Output to FILE (default: stdout)\n"
- "  -l, --little-endian     Create a little-endian filesystem\n"
- "  -b, --big-endian        Create a big-endian filesystem\n"
-@@ -1566,6 +1582,7 @@ int main(int argc, char **argv)
- 	char *compr_name = NULL;
- 	int compr_prior  = -1;
- 	int warn_page_size = 0;
-+	struct ignorepath_entry* element = ignorepath;
- 
- 	page_size = sysconf(_SC_PAGESIZE);
- 	if (page_size < 0) /* System doesn't know so ... */
-@@ -1576,7 +1593,7 @@ int main(int argc, char **argv)
- 	jffs2_compressors_init();
- 
- 	while ((opt = getopt_long(argc, argv,
--					"D:d:r:s:o:qUPfh?vVe:lbp::nc:m:x:X:Lty:i:", long_options, &c)) >= 0)
-+					"D:d:r:s:I:o:qUPfh?vVe:lbp::nc:m:x:X:Lty:i:", long_options, &c)) >= 0)
- 	{
- 		switch (opt) {
- 			case 'D':
-@@ -1600,6 +1617,28 @@ int main(int argc, char **argv)
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
- 					errmsg_die("output filename specified more than once");
diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 97a3e0c01f8..7b29ec72eb1 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -12,10 +12,8 @@ RDEPENDS_mtd-utils-tests += "bash"
 
 PV = "2.0.2+${SRCPV}"
 
-SRCREV = "bc63d36e39f389c8c17f6a8e9db47f2acc884659"
-SRC_URI = "git://git.infradead.org/mtd-utils.git \
-           file://add-exclusion-to-mkfs-jffs2-git-2.patch \
-"
+SRCREV = "1a0494cb62d4a538cd854917aa33821fe4370390"
+SRC_URI = "git://git.infradead.org/mtd-utils.git"
 
 S = "${WORKDIR}/git/"
 

*** devtool.DevtoolUpdateTests.test_devtool_update_recipe_git

1532427922.3617997: diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 97a3e0c01f8..44c5a1c2d1a 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -15,7 +15,9 @@ PV = "2.0.2+${SRCPV}"
 SRCREV = "bc63d36e39f389c8c17f6a8e9db47f2acc884659"
 SRC_URI = "git://git.infradead.org/mtd-utils.git \
            file://add-exclusion-to-mkfs-jffs2-git-2.patch \
-"
+           file://0001-Change-the-Makefile.patch \
+           file://0002-Add-a-new-file.patch \
+           "
 
 S = "${WORKDIR}/git/"
 
meta/recipes-devtools/mtd/mtd-utils/0001-Change-the-Makefile.patch
meta/recipes-devtools/mtd/mtd-utils/0002-Add-a-new-file.patch


*** devtool.DevtoolUpdateTests.test_devtool_update_recipe_local_files

diff --git a/meta/recipes-devtools/makedevs/makedevs/makedevs.c b/meta/recipes-devtools/makedevs/makedevs/makedevs.c
index cba7681414f..1bd1230c800 100644
--- a/meta/recipes-devtools/makedevs/makedevs/makedevs.c
+++ b/meta/recipes-devtools/makedevs/makedevs/makedevs.c
@@ -587,3 +587,4 @@ int main(int argc, char **argv)
 
 	return 0;
 }
+/* Foobar */
diff --git a/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb b/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb
index 92d5870f42a..e31af90e704 100644
--- a/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb
+++ b/meta/recipes-devtools/makedevs/makedevs_1.0.1.bb
@@ -3,7 +3,10 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 SECTION = "base"
 SRC_URI = "file://makedevs.c \
-           file://COPYING.patch"
+           file://COPYING.patch \
+           file://new-local \
+           file://0001-Add-new-file.patch \
+           "
 
 S = "${WORKDIR}"
 
meta/recipes-devtools/makedevs/makedevs/0001-Add-new-file.patch
meta/recipes-devtools/makedevs/makedevs/new-local

*** devtool.DevtoolUpgradeTests.test_devtool_finish_modify_origlayer

1532428127.3812277: diff --git a/meta/recipes-extended/mdadm/mdadm_4.0.bb b/meta/recipes-extended/mdadm/mdadm_4.0.bb
index 226b974352d..034b3c8cf72 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.0.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.0.bb
@@ -24,6 +24,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://0001-Use-CC-to-check-for-implicit-fallthrough-warning-sup.patch \
            file://0001-use-memmove-instead-of-memcpy-on-overlapping-region.patch \
            file://0001-Disable-gcc8-warnings.patch \
+           file://0001-Add-a-comment-to-the-code.patch \
            "
 SRC_URI[md5sum] = "2cb4feffea9167ba71b5f346a0c0a40d"
 SRC_URI[sha256sum] = "1d6ae7f24ced3a0fa7b5613b32f4a589bb4881e3946a5a2c3724056254ada3a9"

meta/recipes-extended/mdadm/files/0001-Add-a-comment-to-the-code.patch

*** devtool.DevtoolUpgradeTests.test_devtool_load_plugin

meta-poky/lib/devtool/bbpath.py
meta-yocto-bsp/lib/devtool/bbpath.py
meta/lib/devtool/bbpath.py
scripts/lib/devtool/bbpath.py

*** recipetool.RecipetoolTests.test_recipetool_load_plugin

meta-poky/lib/recipetool/bbpath.py
meta-yocto-bsp/lib/recipetool/bbpath.py
meta/lib/recipetool/bbpath.py
scripts/lib/recipetool/bbpath.py

*** bbtests.BitbakeTests.test_run_bitbake_from_dir_2

bitbake-cookerdaemon.log



