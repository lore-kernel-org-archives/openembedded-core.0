Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 959696A9D4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 04:51:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAD4p3Jq002683
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Nov 2014 20:51:03 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 12 Nov 2014 20:51:03 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Thu, 13 Nov 2014 12:50:58 +0800
Message-ID: <1eb6aa6bbe34b0d41b76ed089f6c6f035cc5296e.1415853991.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415853991.git.hongxu.jia@windriver.com>
References: <cover.1415853991.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] parted: upgrade to 3.2
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
X-List-Received-Date: Thu, 13 Nov 2014 04:51:04 -0000
Content-Type: text/plain

Drop fix-git-version-gen.patch, fix-dvh-overflows.patch and
fix-deprecated-readline.patch, because the parted 3.2 have
merged them.

Add fix-compile-failure-while-dis.patch to fix compile failure

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../parted/{parted-3.1 => files}/Makefile          |  0
 .../files/fix-compile-failure-while-dis.patch      | 57 ++++++++++++++++++++++
 .../{parted-3.1 => files}/fix-doc-mandir.patch     |  0
 .../parted/{parted-3.1 => files}/no_check.patch    |  0
 .../parted/{parted-3.1 => files}/run-ptest         |  0
 .../parted/{parted-3.1 => files}/syscalls.patch    |  0
 .../parted-3.1/fix-deprecated-readline.patch       | 34 -------------
 .../parted/parted-3.1/fix-dvh-overflows.patch      | 35 -------------
 .../parted/parted-3.1/fix-git-version-gen.patch    | 43 ----------------
 .../parted/{parted_3.1.bb => parted_3.2.bb}        |  8 ++-
 10 files changed, 60 insertions(+), 117 deletions(-)
 rename meta/recipes-extended/parted/{parted-3.1 => files}/Makefile (100%)
 create mode 100644 meta/recipes-extended/parted/files/fix-compile-failure-while-dis.patch
 rename meta/recipes-extended/parted/{parted-3.1 => files}/fix-doc-mandir.patch (100%)
 rename meta/recipes-extended/parted/{parted-3.1 => files}/no_check.patch (100%)
 rename meta/recipes-extended/parted/{parted-3.1 => files}/run-ptest (100%)
 rename meta/recipes-extended/parted/{parted-3.1 => files}/syscalls.patch (100%)
 delete mode 100644 meta/recipes-extended/parted/parted-3.1/fix-deprecated-readline.patch
 delete mode 100644 meta/recipes-extended/parted/parted-3.1/fix-dvh-overflows.patch
 delete mode 100644 meta/recipes-extended/parted/parted-3.1/fix-git-version-gen.patch
 rename meta/recipes-extended/parted/{parted_3.1.bb => parted_3.2.bb} (79%)

diff --git a/meta/recipes-extended/parted/parted-3.1/Makefile b/meta/recipes-extended/parted/files/Makefile
similarity index 100%
rename from meta/recipes-extended/parted/parted-3.1/Makefile
rename to meta/recipes-extended/parted/files/Makefile
diff --git a/meta/recipes-extended/parted/files/fix-compile-failure-while-dis.patch b/meta/recipes-extended/parted/files/fix-compile-failure-while-dis.patch
new file mode 100644
index 0000000..68ab715
--- /dev/null
+++ b/meta/recipes-extended/parted/files/fix-compile-failure-while-dis.patch
@@ -0,0 +1,57 @@
+From 060e74354774d36d2c11ef08e3e7ea9b9b6e23fb Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 13 Nov 2014 11:29:33 +0800
+Subject: [PATCH] libparted/arch/linux.c: fix compile failure while
+ --disable-device-mapper
+
+While --disable-device-mapper, the MACRO ENABLE_DEVICE_MAPPER is
+undef, but it missed to scope some device mapper functions.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ libparted/arch/linux.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/libparted/arch/linux.c b/libparted/arch/linux.c
+index 6fd73c5..2afa479 100644
+--- a/libparted/arch/linux.c
++++ b/libparted/arch/linux.c
+@@ -2320,6 +2320,7 @@ zasprintf (const char *format, ...)
+ static char *
+ dm_canonical_path (PedDevice const *dev)
+ {
++#ifdef ENABLE_DEVICE_MAPPER
+         LinuxSpecific const *arch_specific = LINUX_SPECIFIC (dev);
+ 
+         /* Get map name from devicemapper */
+@@ -2337,6 +2338,7 @@ dm_canonical_path (PedDevice const *dev)
+         dm_task_destroy (task);
+         return dev_name;
+ err:
++#endif
+         return NULL;
+ }
+ 
+@@ -2957,13 +2959,15 @@ _disk_sync_part_table (PedDisk* disk)
+                                                unsigned long long *start,
+                                                unsigned long long *length);
+ 
+-
++#ifdef ENABLE_DEVICE_MAPPER
+         if (disk->dev->type == PED_DEVICE_DM) {
+                 add_partition = _dm_add_partition;
+                 remove_partition = _dm_remove_partition;
+                 resize_partition = _dm_resize_partition;
+                 get_partition_start_and_length = _dm_get_partition_start_and_length;
+-        } else {
++        } else
++#endif
++        {
+                 add_partition = _blkpg_add_partition;
+                 remove_partition = _blkpg_remove_partition;
+ #ifdef BLKPG_RESIZE_PARTITION
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/parted/parted-3.1/fix-doc-mandir.patch b/meta/recipes-extended/parted/files/fix-doc-mandir.patch
similarity index 100%
rename from meta/recipes-extended/parted/parted-3.1/fix-doc-mandir.patch
rename to meta/recipes-extended/parted/files/fix-doc-mandir.patch
diff --git a/meta/recipes-extended/parted/parted-3.1/no_check.patch b/meta/recipes-extended/parted/files/no_check.patch
similarity index 100%
rename from meta/recipes-extended/parted/parted-3.1/no_check.patch
rename to meta/recipes-extended/parted/files/no_check.patch
diff --git a/meta/recipes-extended/parted/parted-3.1/run-ptest b/meta/recipes-extended/parted/files/run-ptest
similarity index 100%
rename from meta/recipes-extended/parted/parted-3.1/run-ptest
rename to meta/recipes-extended/parted/files/run-ptest
diff --git a/meta/recipes-extended/parted/parted-3.1/syscalls.patch b/meta/recipes-extended/parted/files/syscalls.patch
similarity index 100%
rename from meta/recipes-extended/parted/parted-3.1/syscalls.patch
rename to meta/recipes-extended/parted/files/syscalls.patch
diff --git a/meta/recipes-extended/parted/parted-3.1/fix-deprecated-readline.patch b/meta/recipes-extended/parted/parted-3.1/fix-deprecated-readline.patch
deleted file mode 100644
index c4ca06d..0000000
--- a/meta/recipes-extended/parted/parted-3.1/fix-deprecated-readline.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-
-From: Gustavo Zacarias
-Subject: bug#16929: [PATCH] ui: switch to new-style readline typedef
-Date: Mon, 3 Mar 2014 10:40:08 -0300
-
-The CPPFunction typedef (among others) have been deprecated in favour of
-specific prototyped typedefs since readline 4.2 (circa 2001).
-It's been working since because compatibility typedefs have been in
-place until they where removed in the recent readline 6.3 release.
-Switch to the new style to avoid build breakage.
-
-Signed-off-by: Gustavo Zacarias <address@hidden>
-
-Upstream-Status: Backport
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
----
- parted/ui.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/parted/ui.c b/parted/ui.c
-index 786deed..b33f6fc 100644
---- a/parted/ui.c
-+++ b/parted/ui.c
-@@ -1470,7 +1470,7 @@ init_readline (void)
- #ifdef HAVE_LIBREADLINE
-   if (!opt_script_mode) {
-     rl_initialize ();
--    rl_attempted_completion_function = (CPPFunction*) complete_function;
-+    rl_attempted_completion_function = (rl_completion_func_t *) complete_function;
-     readline_state.in_readline = 0;
-   }
- #endif
diff --git a/meta/recipes-extended/parted/parted-3.1/fix-dvh-overflows.patch b/meta/recipes-extended/parted/parted-3.1/fix-dvh-overflows.patch
deleted file mode 100644
index b1eae97..0000000
--- a/meta/recipes-extended/parted/parted-3.1/fix-dvh-overflows.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Ming Liu <ming.liu@windriver.com>
----
- dvh.h |   10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-Index: parted-3.1/libparted/labels/dvh.h
-===================================================================
---- parted-3.1.orig/libparted/labels/dvh.h	2013-02-25 10:46:13.204477586 +0800
-+++ parted-3.1/libparted/labels/dvh.h	2013-02-25 10:47:20.954477065 +0800
-@@ -112,8 +112,8 @@ struct device_parameters {
- 
- struct volume_directory {
- 	char	vd_name[VDNAMESIZE];	/* name */
--	int	vd_lbn;			/* logical block number */
--	int	vd_nbytes;		/* file length in bytes */
-+	unsigned int	vd_lbn;		/* logical block number */
-+	unsigned int	vd_nbytes;	/* file length in bytes */
- };
- 
- /*
-@@ -125,9 +125,9 @@ struct volume_directory {
-  * NOTE: pt_firstlbn SHOULD BE CYLINDER ALIGNED
-  */
- struct partition_table {		/* one per logical partition */
--	int	pt_nblks;		/* # of logical blks in partition */
--	int	pt_firstlbn;		/* first lbn of partition */
--	int	pt_type;		/* use of partition */
-+	unsigned int	pt_nblks;	/* # of logical blks in partition */
-+	unsigned int	pt_firstlbn;	/* first lbn of partition */
-+	int		pt_type;	/* use of partition */
- };
- 
- #define	PTYPE_VOLHDR	0		/* partition is volume header */
diff --git a/meta/recipes-extended/parted/parted-3.1/fix-git-version-gen.patch b/meta/recipes-extended/parted/parted-3.1/fix-git-version-gen.patch
deleted file mode 100644
index a9f26e9..0000000
--- a/meta/recipes-extended/parted/parted-3.1/fix-git-version-gen.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Upstream-Status: Accepted [Expected to be included in parted versions > 3.1]
-Upstream-URL: http://git.savannah.gnu.org/cgit/gnulib.git/patch/?id=cbc11ff0020eb9c04caea6b3e7dc4e4281dff1f9
-
-From cbc11ff0020eb9c04caea6b3e7dc4e4281dff1f9 Mon Sep 17 00:00:00 2001
-From: Andreas Oberritter <obi@opendreambox.org>
-Date: Sun, 18 Mar 2012 17:39:14 +0000
-Subject: git-version-gen: don't let "prefix" envvar cause trouble
-
-* build-aux/git-version-gen (prefix): Initialize properly,
-so as not to use a value specified via the environment.
-Details here: http://thread.gmane.org/gmane.comp.gnu.parted.bugs/10810
----
-diff --git a/build-aux/git-version-gen b/build-aux/git-version-gen
-index d5542a2..0fa9063 100755
---- a/build-aux/git-version-gen
-+++ b/build-aux/git-version-gen
-@@ -1,6 +1,6 @@
- #!/bin/sh
- # Print a version string.
--scriptversion=2012-01-06.07; # UTC
-+scriptversion=2012-03-18.17; # UTC
- 
- # Copyright (C) 2007-2012 Free Software Foundation, Inc.
- #
-@@ -92,6 +92,8 @@ Options:
- 
- Running without arguments will suffice in most cases."
- 
-+prefix=v
-+
- while test $# -gt 0; do
-   case $1 in
-     --help) echo "$usage"; exit 0;;
-@@ -120,7 +122,6 @@ if test -z "$tarball_version_file"; then
- fi
- 
- tag_sed_script="${tag_sed_script:-s/x/x/}"
--prefix="${prefix:-v}"
- 
- nl='
- '
---
-cgit v0.9.0.2
diff --git a/meta/recipes-extended/parted/parted_3.1.bb b/meta/recipes-extended/parted/parted_3.2.bb
similarity index 79%
rename from meta/recipes-extended/parted/parted_3.1.bb
rename to meta/recipes-extended/parted/parted_3.2.bb
index 9057463..655a825 100644
--- a/meta/recipes-extended/parted/parted_3.1.bb
+++ b/meta/recipes-extended/parted/parted_3.2.bb
@@ -9,16 +9,14 @@ PR = "r1"
 SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
            file://no_check.patch \
            file://syscalls.patch \
-           file://fix-git-version-gen.patch \
            file://fix-doc-mandir.patch \
-           file://fix-dvh-overflows.patch \
-           file://fix-deprecated-readline.patch \
+           file://fix-compile-failure-while-dis.patch \
            file://run-ptest \
            file://Makefile \
 "
 
-SRC_URI[md5sum] = "5d89d64d94bcfefa9ce8f59f4b81bdcb"
-SRC_URI[sha256sum] = "5e9cc1f91eaf016e5033d85b9b893fd6d3ffaca532a48de1082df9b94225ca15"
+SRC_URI[md5sum] = "0247b6a7b314f8edeb618159fa95f9cb"
+SRC_URI[sha256sum] = "858b589c22297cacdf437f3baff6f04b333087521ab274f7ab677cb8c6bb78e4"
 
 EXTRA_OECONF = "--disable-device-mapper"
 
-- 
1.9.1


