Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0F12D7688F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 15:26:31 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Aug 2015 08:26:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,653,1432623600"; d="scan'208";a="746460199"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by orsmga001.jf.intel.com with ESMTP; 11 Aug 2015 08:26:11 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Aug 2015 18:27:17 +0300
Message-Id: <a6b35be10f1c5ff911574ad9244b98ba26c2343a.1439306707.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <24c21202012adf0c10fbe8e056720331a4330726.1439306707.git.alexander.kanavin@linux.intel.com>
References: <24c21202012adf0c10fbe8e056720331a4330726.1439306707.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1439306707.git.alexander.kanavin@linux.intel.com>
References: <cover.1439306707.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/2] blktool: update to 4-7
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
X-List-Received-Date: Tue, 11 Aug 2015 15:26:31 -0000

This means replacing a "-6.1" Debian patch with "-7" patch.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../blktool/0001-fix-typos-in-manpage.patch        | 40 +++++++++++
 .../blktool/blktool/0002-fix-string-error.patch    | 31 +++++++++
 ...rgument-for-BLKROSET-it-must-be-const-int.patch | 78 ++++++++++++++++++++++
 .../blktool/{blktool_4-6.1.bb => blktool_4-7.bb}   |  9 ++-
 4 files changed, 153 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-extended/blktool/blktool/0001-fix-typos-in-manpage.patch
 create mode 100644 meta/recipes-extended/blktool/blktool/0002-fix-string-error.patch
 create mode 100644 meta/recipes-extended/blktool/blktool/0003-Fix-3-d-argument-for-BLKROSET-it-must-be-const-int.patch
 rename meta/recipes-extended/blktool/{blktool_4-6.1.bb => blktool_4-7.bb} (76%)

diff --git a/meta/recipes-extended/blktool/blktool/0001-fix-typos-in-manpage.patch b/meta/recipes-extended/blktool/blktool/0001-fix-typos-in-manpage.patch
new file mode 100644
index 0000000..fee368d
--- /dev/null
+++ b/meta/recipes-extended/blktool/blktool/0001-fix-typos-in-manpage.patch
@@ -0,0 +1,40 @@
+From 9cb1667f9d3a9bcfc3b83466cd8d3b79f0554ff0 Mon Sep 17 00:00:00 2001
+From: Azat Khuzhin <a3at.mail@gmail.com>
+Date: Wed, 8 Jul 2015 01:37:09 +0300
+Subject: [PATCH 1/3] fix typos in manpage
+
+This patch is taken from
+ftp://ftp.debian.org/debian/pool/main/b/blktool/blktool_4-7.debian.tar.xz
+
+Upstream-Status: Inappropriate [upstream is dead]
+Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
+
+---
+ blktool.8 | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/blktool.8 b/blktool.8
+index a1f5c96..45b7724 100644
+--- a/blktool.8
++++ b/blktool.8
+@@ -191,7 +191,7 @@ Query or set device bus state (0 off, 1 on, 2 tristate)
+ Query the detected (or overridden, via -t) device class.
+ Typically this will result in 'ATA' or 'SCSI' for most devices.
+ Detection is based on device major; thus your SATA device may appear as
+-'SCSI'.
++\&'SCSI'.
+ 
+ .TP
+ .B cd-speed
+@@ -237,7 +237,7 @@ Omitting the on/off argument will print the current state.
+ 
+ .TP
+ .B media
+-Lock in (or unlock) a removeable device.
++Lock in (or unlock) a removable device.
+ 
+ .TP
+ .B multiple-count
+-- 
+2.1.4
+
diff --git a/meta/recipes-extended/blktool/blktool/0002-fix-string-error.patch b/meta/recipes-extended/blktool/blktool/0002-fix-string-error.patch
new file mode 100644
index 0000000..d08aba5
--- /dev/null
+++ b/meta/recipes-extended/blktool/blktool/0002-fix-string-error.patch
@@ -0,0 +1,31 @@
+From ddb1071da2c78d8155aab62e9f0d46f69500200f Mon Sep 17 00:00:00 2001
+From: Azat Khuzhin <a3at.mail@gmail.com>
+Date: Wed, 8 Jul 2015 01:42:24 +0300
+Subject: [PATCH 2/3] fix string error
+
+This patch is taken from
+ftp://ftp.debian.org/debian/pool/main/b/blktool/blktool_4-7.debian.tar.xz
+
+Upstream-Status: Inappropriate [upstream is dead]
+Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
+
+---
+ util.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/util.c b/util.c
+index 1f3a9ca..2ccf56a 100644
+--- a/util.c
++++ b/util.c
+@@ -28,7 +28,7 @@ void pdie(const char *msg, int perr)
+ 	if (perr)
+ 		perror(msg);
+ 	else
+-		fprintf(stderr, msg);
++		fprintf(stderr, "%s", msg);
+ 	if (blkdev >= 0)
+ 		close(blkdev);
+ 	exit(1);
+-- 
+2.1.4
+
diff --git a/meta/recipes-extended/blktool/blktool/0003-Fix-3-d-argument-for-BLKROSET-it-must-be-const-int.patch b/meta/recipes-extended/blktool/blktool/0003-Fix-3-d-argument-for-BLKROSET-it-must-be-const-int.patch
new file mode 100644
index 0000000..d7ed0b9
--- /dev/null
+++ b/meta/recipes-extended/blktool/blktool/0003-Fix-3-d-argument-for-BLKROSET-it-must-be-const-int.patch
@@ -0,0 +1,78 @@
+From 68faa63aaad81f4a289e4a03173ab4cf798deb53 Mon Sep 17 00:00:00 2001
+From: Azat Khuzhin <a3at.mail@gmail.com>
+Date: Sat, 1 Nov 2014 22:24:32 +0300
+Subject: [PATCH 3/3] Fix 3-d argument for BLKROSET it must be 'const int *'
+
+Most of *SET ioctls have int type for 3-d argument, except BLKROSET.
+So add bc_arg_type enum, build it into bool_comand and install arg_type
+to bc_arg_int_ptr for BLKROSET only.
+
+Debian-bug-id: 641164
+Link: https://bugs.debian.org/641164
+
+This patch is taken from
+ftp://ftp.debian.org/debian/pool/main/b/blktool/blktool_4-7.debian.tar.xz
+
+Upstream-Status: Inappropriate [upstream is dead]
+Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
+
+---
+ blktool.c | 11 +++++++++--
+ blktool.h |  7 +++++++
+ 2 files changed, 16 insertions(+), 2 deletions(-)
+
+diff --git a/blktool.c b/blktool.c
+index fbefecd..221a195 100644
+--- a/blktool.c
++++ b/blktool.c
+@@ -85,7 +85,7 @@ static struct bool_command bool_cmd_tbl[] = {
+ 	{ { DEF_BOOL("pio-data"), dc_ata, DEF_HDIO(32BIT) },
+ 	  "16-bit", "32-bit" },
+ 	{ { DEF_BOOL("readonly"), dc_any, IOCNAME(BLKROGET), IOCNAME(BLKROSET) },
+-	  DEF_BOOLSTR },
++	  DEF_BOOLSTR, bc_arg_int_ptr },
+ 	{ { DEF_BOOL("unmask-irq"), dc_ata, DEF_HDIO(UNMASKINTR) },
+ 	  DEF_BOOLSTR },
+ 	{ { "wcache", ct_bool, handle_wcache, dc_any,
+@@ -171,7 +171,14 @@ static void handle_bool(int argc, char **argv, struct command *cmd)
+ 
+ 	} else if ((argc == 4) && (cmd->write_ioctl_name != NULL)) {
+ 		do_32 = parse_bool(argc, argv, bcm);
+-		if (ioctl(blkdev, cmd->write_ioctl, do_32))
++		
++		int ret;
++		if (bcm->arg_type == bc_arg_int_ptr) {
++			ret = ioctl(blkdev, cmd->write_ioctl, &do_32);
++		} else {
++			ret = ioctl(blkdev, cmd->write_ioctl, do_32);
++		}
++		if (ret)
+ 			pdie(cmd->write_ioctl_name, 1);
+ 	}
+ 	else {
+diff --git a/blktool.h b/blktool.h
+index fce4387..85add83 100644
+--- a/blktool.h
++++ b/blktool.h
+@@ -85,11 +85,18 @@ struct command {
+ 	const char		*write_ioctl_name;
+ };
+ 
++enum bc_arg_type {
++	bc_arg_int,
++	bc_arg_int_ptr,
++};
++
+ struct bool_command {
+ 	struct command		cmd;
+ 
+ 	const char		*str_false;
+ 	const char		*str_true;
++
++	enum bc_arg_type arg_type;
+ };
+ 
+ struct class_operations {
+-- 
+2.1.4
+
diff --git a/meta/recipes-extended/blktool/blktool_4-6.1.bb b/meta/recipes-extended/blktool/blktool_4-7.bb
similarity index 76%
rename from meta/recipes-extended/blktool/blktool_4-6.1.bb
rename to meta/recipes-extended/blktool/blktool_4-7.bb
index 69f2261..679196b 100644
--- a/meta/recipes-extended/blktool/blktool_4-6.1.bb
+++ b/meta/recipes-extended/blktool/blktool_4-7.bb
@@ -8,17 +8,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://blktool.c;beginline=7;endline=8;md5=a5e798ea98fd50972088968a15e5f373"
 
 DEPENDS = "glib-2.0"
-PR = "r1"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/b/blktool/blktool_4.orig.tar.gz;name=tarball \
-           ${DEBIAN_MIRROR}/main/b/blktool/blktool_4-6.1.diff.gz;apply=yes;name=patch"
+           file://0001-fix-typos-in-manpage.patch \
+           file://0002-fix-string-error.patch \
+           file://0003-Fix-3-d-argument-for-BLKROSET-it-must-be-const-int.patch \
+          "
 
 SRC_URI[tarball.md5sum] = "62edc09c9908107e69391c87f4f3fd40"
 SRC_URI[tarball.sha256sum] = "b1e6d5912546d2a4b704ec65c2b9664aa3b4663e7d800e06803330335a2cb764"
 
-SRC_URI[patch.md5sum] = "cf605a683d54d1fbcb35b940076ddb0c"
-SRC_URI[patch.sha256sum] = "d7923527e1a00984620ab307c9047a653d7ae2856cd20a82de8a33328f381ae3"
-
 S = "${WORKDIR}/${BPN}-4.orig"
 
 inherit autotools pkgconfig
-- 
2.1.4


