Return-Path: <Wenlin.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4910C7F2FD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 07:27:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x9F7Rw6e004045
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 00:27:58 -0700 (PDT)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 15 Oct 2019 00:27:57 -0700
From: Wenlin Kang <wenlin.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Oct 2019 15:27:43 +0800
Message-ID: <1571124463-94917-1-git-send-email-wenlin.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] sysstat: fix CVE-2019-16167
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
X-List-Received-Date: Tue, 15 Oct 2019 07:27:57 -0000
Content-Type: text/plain

This commit is another part of CVE-2019-16167, please see
https://github.com/sysstat/sysstat/issues/232.

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 ...ory-corruption-bug-due-to-Integer-Overflo.patch | 46 ++++++++++++++++++++++
 meta/recipes-extended/sysstat/sysstat_12.1.6.bb    |  4 +-
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/sysstat/sysstat/0001-Fix-232-Memory-corruption-bug-due-to-Integer-Overflo.patch

diff --git a/meta/recipes-extended/sysstat/sysstat/0001-Fix-232-Memory-corruption-bug-due-to-Integer-Overflo.patch b/meta/recipes-extended/sysstat/sysstat/0001-Fix-232-Memory-corruption-bug-due-to-Integer-Overflo.patch
new file mode 100644
index 0000000..46b1118
--- /dev/null
+++ b/meta/recipes-extended/sysstat/sysstat/0001-Fix-232-Memory-corruption-bug-due-to-Integer-Overflo.patch
@@ -0,0 +1,46 @@
+From 603ae4ed8cd65abf0776ef7f68354a5c24a3411c Mon Sep 17 00:00:00 2001
+From: Sebastien GODARD <sysstat@users.noreply.github.com>
+Date: Tue, 15 Oct 2019 14:39:33 +0800
+Subject: [PATCH] Fix #232: Memory corruption bug due to Integer Overflow in
+ remap_struct()
+
+Try to avoid integer overflow when reading a corrupted binary datafile
+with sadf.
+
+Upstream-Status: Backport [https://github.com/sysstat/sysstat/commit/83fad9c895d1ac13f76af5883b7451b3302beef5]
+CVE: CVE-2019-16167
+
+Signed-off-by: Sebastien GODARD <sysstat@users.noreply.github.com>
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+---
+ sa_common.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/sa_common.c b/sa_common.c
+index 395c11c..cfa9007 100644
+--- a/sa_common.c
++++ b/sa_common.c
+@@ -1336,7 +1336,8 @@ int remap_struct(unsigned int gtypes_nr[], unsigned int ftypes_nr[],
+ 	/* Remap [unsigned] int fields */
+ 	d = gtypes_nr[1] - ftypes_nr[1];
+ 	if (d) {
+-		if (ftypes_nr[1] * UL_ALIGNMENT_WIDTH < ftypes_nr[1])
++		if (gtypes_nr[0] * ULL_ALIGNMENT_WIDTH +
++		    ftypes_nr[1] * UL_ALIGNMENT_WIDTH < ftypes_nr[1])
+ 			/* Overflow */
+ 			return -1;
+ 
+@@ -1365,7 +1366,9 @@ int remap_struct(unsigned int gtypes_nr[], unsigned int ftypes_nr[],
+ 	/* Remap possible fields (like strings of chars) following int fields */
+ 	d = gtypes_nr[2] - ftypes_nr[2];
+ 	if (d) {
+-		if (ftypes_nr[2] * U_ALIGNMENT_WIDTH < ftypes_nr[2])
++		if (gtypes_nr[0] * ULL_ALIGNMENT_WIDTH +
++		    gtypes_nr[1] * UL_ALIGNMENT_WIDTH +
++		    ftypes_nr[2] * U_ALIGNMENT_WIDTH < ftypes_nr[2])
+ 			/* Overflow */
+ 			return -1;
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/sysstat/sysstat_12.1.6.bb b/meta/recipes-extended/sysstat/sysstat_12.1.6.bb
index 8cf8c36..362888d 100644
--- a/meta/recipes-extended/sysstat/sysstat_12.1.6.bb
+++ b/meta/recipes-extended/sysstat/sysstat_12.1.6.bb
@@ -2,7 +2,9 @@ require sysstat.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a23a74b3f4caf9616230789d94217acb"
 
-SRC_URI += "file://0001-Include-needed-headers-explicitly.patch"
+SRC_URI += "file://0001-Include-needed-headers-explicitly.patch \
+	    file://0001-Fix-232-Memory-corruption-bug-due-to-Integer-Overflo.patch \
+"
 
 SRC_URI[md5sum] = "d8e3bbb9c873dd370f6d33664e326570"
 SRC_URI[sha256sum] = "f752f3c406153a6fc446496f1102872505ace3f0931d975c1d664c81ec09f129"
-- 
1.9.1


