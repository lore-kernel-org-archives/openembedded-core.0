Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A58FD65ED7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jun 2014 10:13:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5AADggx004886
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jun 2014 03:13:42 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 10 Jun 2014 03:13:41 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jun 2014 18:13:39 +0800
Message-ID: <5b7dd12e087a0e3b89f2fdaa8a5c3242bbe69cdd.1402395182.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1402395182.git.Chong.Lu@windriver.com>
References: <cover.1402395182.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] kexec-tools: Refine kdump device_tree sort
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
X-List-Received-Date: Tue, 10 Jun 2014 10:13:44 -0000
Content-Type: text/plain

The commit b02d735bf was to rearrange the device-tree entries, and
assumed that these entries are sorted in the ascending order. but
acctually when I was validating kexec and kdump, the order of
serial node still is changed. So the patch is to sort these entries
by the directory name in ascending order.

Signed-off-by: Yang Wei <Wei.Yang@windriver.com>
Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-kernel/kexec/kexec-tools.inc          |  3 +-
 ...kexec-tools-Refine-kdump-device_tree-sort.patch | 82 ++++++++++++++++++++++
 2 files changed, 84 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/kexec-tools-Refine-kdump-device_tree-sort.patch

diff --git a/meta/recipes-kernel/kexec/kexec-tools.inc b/meta/recipes-kernel/kexec/kexec-tools.inc
index 50b448c..6a690c6 100644
--- a/meta/recipes-kernel/kexec/kexec-tools.inc
+++ b/meta/recipes-kernel/kexec/kexec-tools.inc
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a \
                     file://kexec/kexec.c;beginline=1;endline=20;md5=af10f6ae4a8715965e648aa687ad3e09"
 DEPENDS = "zlib xz"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz"
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz \
+           file://kexec-tools-Refine-kdump-device_tree-sort.patch"
 
 inherit autotools-brokensep
 
diff --git a/meta/recipes-kernel/kexec/kexec-tools/kexec-tools-Refine-kdump-device_tree-sort.patch b/meta/recipes-kernel/kexec/kexec-tools/kexec-tools-Refine-kdump-device_tree-sort.patch
new file mode 100644
index 0000000..ab1fe96
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/kexec-tools-Refine-kdump-device_tree-sort.patch
@@ -0,0 +1,82 @@
+kexec-tools: Refine kdump device_tree sort
+
+The commit b02d735bf was to rearrange the device-tree entries, and
+assumed that these entries are sorted in the ascending order. but
+acctually when I was validating kexec and kdump, the order of
+serial node still is changed. So the patch is to sort these entries
+by the directory name in ascending order.
+
+Upstream-Status: Pending
+
+Signed-off-by: Yang Wei <Wei.Yang@windriver.com>
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+ kexec/arch/ppc/fs2dt.c |   13 ++++++++++---
+ kexec/fs2dt.c          |   13 ++++++++++---
+ 2 files changed, 20 insertions(+), 6 deletions(-)
+
+diff --git a/kexec/arch/ppc/fs2dt.c b/kexec/arch/ppc/fs2dt.c
+index 4121c7d..cc04b04 100644
+--- a/kexec/arch/ppc/fs2dt.c
++++ b/kexec/arch/ppc/fs2dt.c
+@@ -296,6 +296,9 @@ static int comparefunc(const void *dentry1, const void *dentry2)
+ {
+ 	char *str1 = (*(struct dirent **)dentry1)->d_name;
+ 	char *str2 = (*(struct dirent **)dentry2)->d_name;
++	char* ptr1 = strchr(str1, '@');
++	char* ptr2 = strchr(str2, '@');
++	int len1, len2;
+ 
+ 	/*
+ 	 * strcmp scans from left to right and fails to idetify for some
+@@ -303,9 +306,13 @@ static int comparefunc(const void *dentry1, const void *dentry2)
+ 	 * Therefore, we get the wrong sorted order like memory@10000000 and
+ 	 * memory@f000000.
+ 	 */
+-	if (strchr(str1, '@') && strchr(str2, '@') &&
+-		(strlen(str1) > strlen(str2)))
+-		return 1;
++	if (ptr1 && ptr2) {
++		len1 = ptr1 - str1;
++		len2 = ptr2 - str2;
++		if (!strncmp(str1, str2, len1 >len2 ? len1: len2) &&
++					(strlen(str1) > strlen(str2)))
++				return 1;
++	}
+ 
+ 	return strcmp(str1, str2);
+ }
+diff --git a/kexec/fs2dt.c b/kexec/fs2dt.c
+index 5e6b98d..1c0345b 100644
+--- a/kexec/fs2dt.c
++++ b/kexec/fs2dt.c
+@@ -475,6 +475,9 @@ static int comparefunc(const struct dirent **dentry1,
+ {
+ 	char *str1 = (*(struct dirent **)dentry1)->d_name;
+ 	char *str2 = (*(struct dirent **)dentry2)->d_name;
++	char* ptr1 = strchr(str1, '@');
++	char* ptr2 = strchr(str2, '@');
++	int len1, len2;
+ 
+ 	/*
+ 	 * strcmp scans from left to right and fails to idetify for some
+@@ -482,9 +485,13 @@ static int comparefunc(const struct dirent **dentry1,
+ 	 * Therefore, we get the wrong sorted order like memory@10000000 and
+ 	 * memory@f000000.
+ 	 */
+-	if (strchr(str1, '@') && strchr(str2, '@') &&
+-		(strlen(str1) > strlen(str2)))
+-		return 1;
++	if (ptr1 && ptr2) {
++		len1 = ptr1 - str1;
++		len2 = ptr2 - str2;
++		if (!strncmp(str1, str2, len1 >len2 ? len1: len2) &&
++					(strlen(str1) > strlen(str2)))
++				return 1;
++	}
+ 
+ 	return strcmp(str1, str2);
+ }
+-- 
+1.7.9.5
+
-- 
1.8.1.2


