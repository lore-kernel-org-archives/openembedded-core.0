Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 534D478A0F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:25:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:25:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24054041"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:25:32 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:17:55 +0200
Message-Id: <20180308181804.31261-33-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 33/42] mtd: refresh patches
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
X-List-Received-Date: Thu, 08 Mar 2018 18:25:32 -0000

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../add-exclusion-to-mkfs-jffs2-git-2.patch        | 30 ++++++++++++----------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-devtools/mtd/mtd-utils/add-exclusion-to-mkfs-jffs2-git-2.patch b/meta/recipes-devtools/mtd/mtd-utils/add-exclusion-to-mkfs-jffs2-git-2.patch
index 0e3776af048..5d874d9810b 100644
--- a/meta/recipes-devtools/mtd/mtd-utils/add-exclusion-to-mkfs-jffs2-git-2.patch
+++ b/meta/recipes-devtools/mtd/mtd-utils/add-exclusion-to-mkfs-jffs2-git-2.patch
@@ -1,8 +1,10 @@
 Upstream-Status: Pending
 
---- /tmp/mkfs.jffs2.c	2009-01-11 15:28:41.000000000 +0100
-+++ git/jffsX-utils/mkfs.jffs2.c	2009-01-11 15:59:29.000000000 +0100
-@@ -100,6 +100,11 @@
+Index: git/jffsX-utils/mkfs.jffs2.c
+===================================================================
+--- git.orig/jffsX-utils/mkfs.jffs2.c
++++ git/jffsX-utils/mkfs.jffs2.c
+@@ -100,6 +100,11 @@ struct filesystem_entry {
  	struct rb_node hardlink_rb;
  };
  
@@ -14,7 +16,7 @@ Upstream-Status: Pending
  struct rb_root hardlinks;
  static int out_fd = -1;
  static int in_fd = -1;
-@@ -408,7 +413,7 @@
+@@ -309,7 +314,7 @@ static struct filesystem_entry *recursiv
  	char *hpath, *tpath;
  	struct dirent *dp, **namelist;
  	struct filesystem_entry *entry;
@@ -22,8 +24,8 @@ Upstream-Status: Pending
 +	struct ignorepath_entry* element = ignorepath;
  
  	if (lstat(hostpath, &sb)) {
- 		perror_msg_and_die("%s", hostpath);
-@@ -417,6 +422,15 @@
+ 		sys_errmsg_die("%s", hostpath);
+@@ -318,6 +323,15 @@ static struct filesystem_entry *recursiv
  	entry = add_host_filesystem_entry(targetpath, hostpath,
  			sb.st_uid, sb.st_gid, sb.st_mode, 0, parent);
  
@@ -38,8 +40,8 @@ Upstream-Status: Pending
 +
  	n = scandir(hostpath, &namelist, 0, alphasort);
  	if (n < 0) {
- 		perror_msg_and_die("opening directory %s", hostpath);
-@@ -1453,6 +1467,7 @@
+ 		sys_errmsg_die("opening directory %s", hostpath);
+@@ -1359,6 +1373,7 @@ static struct option long_options[] = {
  	{"root", 1, NULL, 'r'},
  	{"pagesize", 1, NULL, 's'},
  	{"eraseblock", 1, NULL, 'e'},
@@ -47,15 +49,15 @@ Upstream-Status: Pending
  	{"output", 1, NULL, 'o'},
  	{"help", 0, NULL, 'h'},
  	{"verbose", 0, NULL, 'v'},
-@@ -1500,6 +1515,7 @@
- "  -L, --list-compressors  Show the list of the avaiable compressors\n"
+@@ -1409,6 +1424,7 @@ static const char helptext[] =
+ "  -L, --list-compressors  Show the list of the available compressors\n"
  "  -t, --test-compression  Call decompress and compare with the original (for test)\n"
  "  -n, --no-cleanmarkers   Don't add a cleanmarker to every eraseblock\n"
 +"  -I, --ignore=PATH       Ignore sub directory and file tree below PATH when recursing over the file system\n"
  "  -o, --output=FILE       Output to FILE (default: stdout)\n"
  "  -l, --little-endian     Create a little-endian filesystem\n"
  "  -b, --big-endian        Create a big-endian filesystem\n"
-@@ -1666,6 +1682,7 @@
+@@ -1566,6 +1582,7 @@ int main(int argc, char **argv)
  	char *compr_name = NULL;
  	int compr_prior  = -1;
  	int warn_page_size = 0;
@@ -63,7 +65,7 @@ Upstream-Status: Pending
  
  	page_size = sysconf(_SC_PAGESIZE);
  	if (page_size < 0) /* System doesn't know so ... */
-@@ -1676,7 +1693,7 @@
+@@ -1576,7 +1593,7 @@ int main(int argc, char **argv)
  	jffs2_compressors_init();
  
  	while ((opt = getopt_long(argc, argv,
@@ -72,7 +74,7 @@ Upstream-Status: Pending
  	{
  		switch (opt) {
  			case 'D':
-@@ -1700,6 +1717,28 @@
+@@ -1600,6 +1617,28 @@ int main(int argc, char **argv)
  				warn_page_size = 0; /* set by user, so don't need to warn */
  				break;
  
@@ -100,4 +102,4 @@ Upstream-Status: Pending
 +
  			case 'o':
  				if (out_fd != -1) {
- 					error_msg_and_die("output filename specified more than once");
+ 					errmsg_die("output filename specified more than once");
-- 
2.16.1


