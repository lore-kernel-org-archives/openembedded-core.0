Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TgqbY-0001Ld-4C
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Dec 2012 06:36:08 +0100
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 9CC8F303EF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Dec 2012 00:02:48 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Dec 2012 21:02:09 -0800
Message-Id: <d35560f33f257bd12a07c7c0be770319086d6ad9.1354855433.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1354855433.git.scott.a.garman@intel.com>
References: <cover.1354855433.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1354855433.git.scott.a.garman@intel.com>
References: <cover.1354855433.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 9CC8F303EF.C300A
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 16/16] squashfs: fix for CVE-2012-4024
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Dec 2012 05:36:08 -0000

From: "yanjun.zhu" <yanjun.zhu@windriver.com>

Reference:http://squashfs.git.sourceforge.net/git/gitweb.cgi?p=
squashfs/squashfs;a=commit;h=19c38fba0be1ce949ab44310d7f49887576cc123

Fix potential stack overflow in get_component() where an individual
pathname component in an extract file (specified on the command line
or in an extract file) could exceed the 1024 byte sized targname
allocated on the stack.

Fix by dynamically allocating targname rather than storing it as
a fixed size on the stack.

[YOCTO #3513]

Fixes denzil [YOCTO #3520]

Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
---
 .../patches/squashfs-4.2-fix-CVE-2012-4024.patch   |   72 ++++++++++++++++++++
 .../squashfs-tools/squashfs-tools_4.2.bb           |    3 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-devtools/squashfs-tools/patches/squashfs-4.2-fix-CVE-2012-4024.patch

diff --git a/meta/recipes-devtools/squashfs-tools/patches/squashfs-4.2-fix-CVE-2012-4024.patch b/meta/recipes-devtools/squashfs-tools/patches/squashfs-4.2-fix-CVE-2012-4024.patch
new file mode 100644
index 0000000..8b9904f
--- /dev/null
+++ b/meta/recipes-devtools/squashfs-tools/patches/squashfs-4.2-fix-CVE-2012-4024.patch
@@ -0,0 +1,72 @@
+Upstream-Status: Backport
+
+Reference:http://squashfs.git.sourceforge.net/git/gitweb.cgi?p=
+squashfs/squashfs;a=commit;h=19c38fba0be1ce949ab44310d7f49887576cc123
+
+Fix potential stack overflow in get_component() where an individual
+pathname component in an extract file (specified on the command line
+or in an extract file) could exceed the 1024 byte sized targname
+allocated on the stack.
+
+Fix by dynamically allocating targname rather than storing it as
+a fixed size on the stack.
+
+Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
+diff -urpN a/unsquashfs.c b/unsquashfs.c
+--- a/unsquashfs.c	2012-11-29 17:04:08.000000000 +0800
++++ b/unsquashfs.c	2012-11-29 17:04:25.000000000 +0800
+@@ -1034,15 +1034,18 @@ void squashfs_closedir(struct dir *dir)
+ }
+ 
+ 
+-char *get_component(char *target, char *targname)
++char *get_component(char *target, char **targname)
+ {
++	char *start;
++
+ 	while(*target == '/')
+ 		target ++;
+ 
++	start = target;
+ 	while(*target != '/' && *target!= '\0')
+-		*targname ++ = *target ++;
++		target ++;
+ 
+-	*targname = '\0';
++	*targname = strndup(start, target - start);
+ 
+ 	return target;
+ }
+@@ -1068,12 +1071,12 @@ void free_path(struct pathname *paths)
+ 
+ struct pathname *add_path(struct pathname *paths, char *target, char *alltarget)
+ {
+-	char targname[1024];
++	char *targname;
+ 	int i, error;
+ 
+ 	TRACE("add_path: adding \"%s\" extract file\n", target);
+ 
+-	target = get_component(target, targname);
++	target = get_component(target, &targname);
+ 
+ 	if(paths == NULL) {
+ 		paths = malloc(sizeof(struct pathname));
+@@ -1097,7 +1100,7 @@ struct pathname *add_path(struct pathnam
+ 			sizeof(struct path_entry));
+ 		if(paths->name == NULL)
+ 			EXIT_UNSQUASH("Out of memory in add_path\n");	
+-		paths->name[i].name = strdup(targname);
++		paths->name[i].name = targname;
+ 		paths->name[i].paths = NULL;
+ 		if(use_regex) {
+ 			paths->name[i].preg = malloc(sizeof(regex_t));
+@@ -1130,6 +1133,8 @@ struct pathname *add_path(struct pathnam
+ 		/*
+ 		 * existing matching entry
+ 		 */
++		free(targname);
++
+ 		if(paths->name[i].paths == NULL) {
+ 			/*
+ 			 * No sub-directory which means this is the leaf
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
index c54081b..9922f1e 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.2.bb
@@ -3,6 +3,7 @@
 DESCRIPTION = "Tools to manipulate Squashfs filesystems."
 SECTION = "base"
 LICENSE = "GPL-2 & PD"
+FILESEXTRAPATHS_prepend := "${THISDIR}/patches:"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://../../7zC.txt;beginline=12;endline=16;md5=2056cd6d919ebc3807602143c7449a7c \
                    "
@@ -12,6 +13,8 @@ PR = "1"
 SRC_URI = "${SOURCEFORGE_MIRROR}/squashfs/squashfs${PV}.tar.gz;name=squashfs \
            http://downloads.sourceforge.net/sevenzip/lzma465.tar.bz2;name=lzma \
           "
+SRC_URI += "file://squashfs-4.2-fix-CVE-2012-4024.patch \
+           " 
 SRC_URI[squashfs.md5sum] = "1b7a781fb4cf8938842279bd3e8ee852"
 SRC_URI[squashfs.sha256sum] = "d9e0195aa922dbb665ed322b9aaa96e04a476ee650f39bbeadb0d00b24022e96"
 SRC_URI[lzma.md5sum] = "29d5ffd03a5a3e51aef6a74e9eafb759"
-- 
1.7.9.5



