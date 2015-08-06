Return-Path: <amarnath.valluri@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C82E673A57
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 09:05:00 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 06 Aug 2015 02:04:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,622,1432623600"; d="scan'208";a="763129392"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga001.fm.intel.com with ESMTP; 06 Aug 2015 02:04:58 -0700
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Aug 2015 12:06:09 +0300
Message-Id: <1438851969-4340-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-oe][PATCH] dosfstools-2.11: Fix memory leak in mkdosfs
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
X-List-Received-Date: Thu, 06 Aug 2015 09:05:04 -0000

Added new patch that fixes the memory leak that was introduced in
mkdosfs-dir.patch.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 .../dosfstools/dosfstools-Fix-memroy-leak.patch    | 30 ++++++++++++++++++++++
 .../recipes-devtools/dosfstools/dosfstools_2.11.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-devtools/dosfstools/dosfstools/dosfstools-Fix-memroy-leak.patch

diff --git a/meta/recipes-devtools/dosfstools/dosfstools/dosfstools-Fix-memroy-leak.patch b/meta/recipes-devtools/dosfstools/dosfstools/dosfstools-Fix-memroy-leak.patch
new file mode 100644
index 0000000..555250f
--- /dev/null
+++ b/meta/recipes-devtools/dosfstools/dosfstools/dosfstools-Fix-memroy-leak.patch
@@ -0,0 +1,30 @@
+From 2c2408d815b7cd76a2edd4261eb051e264993090 Mon Sep 17 00:00:00 2001
+From: Amarnath Valluri <amarnath.valluri@intel.com>
+Date: Wed, 5 Aug 2015 16:25:51 +0300
+Subject: [PATCH] dosfstools: Fix memroy leak
+
+Upstream-Status:[Inappropriate]
+
+Avoid leaking memory allocated for buffer.
+
+Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
+---
+ mkdosfs/mkdosfs.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/mkdosfs/mkdosfs.c b/mkdosfs/mkdosfs.c
+index 88b0dc2..2822358 100644
+--- a/mkdosfs/mkdosfs.c
++++ b/mkdosfs/mkdosfs.c
+@@ -1693,6 +1693,8 @@ static int add_file(char *filename, struct dir_entry *dir, unsigned char attr)
+     writebuf(buffer, size, "data");    
+   }
+ 
++  free(buffer);
++
+  exit_add:
+   if (infile) close(infile);
+   return 0;
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
index beec488..824c04d 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/${BPN}/${BP}.src.tar.gz/407d4
            file://nofat32_autoselect.patch \
            file://fix_populated_dosfs_creation.patch \
 	   file://0001-Include-fcntl.h-for-getting-loff_t-definition.patch \
+           file://dosfstools-Fix-memroy-leak.patch \
 	   "
 
 SRC_URI[md5sum] = "407d405ade410f7597d364ab5dc8c9f6"
-- 
2.1.4

---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki 
Business Identity Code: 0357606 - 4 
Domiciled in Helsinki 

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


