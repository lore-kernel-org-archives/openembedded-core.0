Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yanjun.Zhu@windriver.com>) id 1Te0Q6-0006XS-IR
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 10:28:40 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qAT9EJfj028617
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2012 01:14:19 -0800 (PST)
Received: from pek-lpgbuild4.wrs.com (128.224.153.32) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 29 Nov 2012 01:14:17 -0800
From: "yanjun.zhu" <yanjun.zhu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Nov 2012 17:14:08 +0800
Message-ID: <1354180448-14858-1-git-send-email-yanjun.zhu@windriver.com>
X-Mailer: git-send-email 1.7.11
In-Reply-To: <3513>
References: <3513>
MIME-Version: 1.0
Subject: [oe][PATCH 1/1] squashfs: fix for CVE-2012-4024
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
X-List-Received-Date: Thu, 29 Nov 2012 09:28:40 -0000
Content-Type: text/plain

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

Signed-off-by: yanjun.zhu <yanjun.zhu@windriver.com>
---
 .../patches/squashfs-4.2-fix-CVE-2012-4024.patch   | 58 ++++++++++++++++++++++
 .../squashfs-tools/squashfs-tools_4.2.bb           |  3 ++
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-devtools/squashfs-tools/patches/squashfs-4.2-fix-CVE-2012-4024.patch

diff --git a/meta/recipes-devtools/squashfs-tools/patches/squashfs-4.2-fix-CVE-2012-4024.patch b/meta/recipes-devtools/squashfs-tools/patches/squashfs-4.2-fix-CVE-2012-4024.patch
new file mode 100644
index 0000000..10f6bb2
--- /dev/null
+++ b/meta/recipes-devtools/squashfs-tools/patches/squashfs-4.2-fix-CVE-2012-4024.patch
@@ -0,0 +1,58 @@
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
1.7.11



