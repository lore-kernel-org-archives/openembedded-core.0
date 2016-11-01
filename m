Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E65CC71AEC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 03:01:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uA131KBB017507
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 20:01:21 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Mon, 31 Oct 2016 20:01:20 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Nov 2016 11:01:02 +0800
Message-ID: <20161101030102.11272-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [PATCH] pax : strip off the trailing slash of file name
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
X-List-Received-Date: Tue, 01 Nov 2016 03:01:21 -0000
Content-Type: text/plain

From: Zhang Xiao <xiao.zhang@windriver.com>

When extracting packaes, the trailing slash of the file name
has no means but may cause some issue on system call lstat.
Remove it.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../pax-strip-off-file-name-s-trailing-slash.patch | 48 ++++++++++++++++++++++
 meta/recipes-extended/pax/pax_3.4.bb               |  4 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/pax/pax/pax-strip-off-file-name-s-trailing-slash.patch

diff --git a/meta/recipes-extended/pax/pax/pax-strip-off-file-name-s-trailing-slash.patch b/meta/recipes-extended/pax/pax/pax-strip-off-file-name-s-trailing-slash.patch
new file mode 100644
index 0000000..9e0a335
--- /dev/null
+++ b/meta/recipes-extended/pax/pax/pax-strip-off-file-name-s-trailing-slash.patch
@@ -0,0 +1,48 @@
+From aa8ba118869b75a2a9cd681b2f0362d9d8f1c7ec Mon Sep 17 00:00:00 2001
+From: Zhang Xiao <xiao.zhang@windriver.com>
+Date: Tue, 12 Jul 2016 11:34:45 +0800
+Subject: [PATCH] pax: strip off the trailing slash of file name
+
+When extracting packaes, the trailing slash of the file name
+has no means but may cause some issue on system call lstat.
+Remove it.
+
+Upstream-Status: Pending
+
+Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
+---
+ src/pat_rep.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/src/pat_rep.c b/src/pat_rep.c
+index b9a4636..4cbf6bf 100644
+--- a/src/pat_rep.c
++++ b/src/pat_rep.c
+@@ -605,7 +605,7 @@ int
+ mod_name(ARCHD *arcn)
+ {
+ 	int res = 0;
+-
++	char *pt;
+ 	/*
+ 	 * Strip off leading '/' if appropriate.
+ 	 * Currently, this option is only set for the tar format.
+@@ -639,6 +639,15 @@ mod_name(ARCHD *arcn)
+ 	}
+ 
+ 	/*
++	 * strip off trailing slash.
++	 */
++	pt = &(arcn->name[strlen(arcn->name) - 1]);
++	if (*pt == '/') {
++		 *pt = '\0';
++		arcn->nlen = strlen(arcn->name);
++	}
++
++	/*
+ 	 * IMPORTANT: We have a problem. what do we do with symlinks?
+ 	 * Modifying a hard link name makes sense, as we know the file it
+ 	 * points at should have been seen already in the archive (and if it
+-- 
+1.8.5.2.233.g932f7e4
+
diff --git a/meta/recipes-extended/pax/pax_3.4.bb b/meta/recipes-extended/pax/pax_3.4.bb
index 9d1abfb..7ce43ce 100644
--- a/meta/recipes-extended/pax/pax_3.4.bb
+++ b/meta/recipes-extended/pax/pax_3.4.bb
@@ -16,7 +16,9 @@ DEPENDS_append_libc-musl = " fts "
 
 SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/${BPN}/${BP}.tar.bz2/fbd9023b590b45ac3ade95870702a0d6/${BP}.tar.bz2 \
 	file://fix_for_compile_with_gcc-4.6.0.patch \
-	file://pax-3.4_fix_for_x32.patch"
+	file://pax-3.4_fix_for_x32.patch \
+	file://pax-strip-off-file-name-s-trailing-slash.patch \
+"
 
 SRC_URI_append_libc-musl = " file://0001-Fix-build-with-musl.patch \
                              file://0001-use-strtoll-instead-of-strtoq.patch \
-- 
2.8.3


