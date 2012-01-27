Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RqpWZ-0007K2-WC
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 18:23:44 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Jan 2012 09:15:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="117133173"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.96])
	by fmsmga002.fm.intel.com with ESMTP; 27 Jan 2012 09:15:51 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2012 09:15:48 -0800
Message-Id: <183530f690264d6bcf114f365809a502d748a928.1327684299.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1327684299.git.sgw@linux.intel.com>
References: <cover.1327684299.git.sgw@linux.intel.com>
In-Reply-To: <cover.1327684299.git.sgw@linux.intel.com>
References: <cover.1327684299.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 5/6] genext2fs: fix inode computation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jan 2012 17:23:44 -0000

This patch fixes a problem with the computation of inodes
based on the bytes_per_inode options, for a larger FS (> 2G)
the inode count would go negative and a smaller default
count would be used, this would cause the FS to run out of
inodes.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../genext2fs-1.4.1/fix-nbblocks-cast.patch        |   35 ++++++++++++++++++++
 meta/recipes-devtools/genext2fs/genext2fs_1.4.1.bb |    4 ++-
 2 files changed, 38 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/fix-nbblocks-cast.patch

diff --git a/meta/recipes-devtools/genext2fs/genext2fs-1.4.1/fix-nbblocks-cast.patch b/meta/recipes-devtools/genext2fs/genext2fs-1.4.1/fix-nbblocks-cast.patch
new file mode 100644
index 0000000..3fd15e0
--- /dev/null
+++ b/meta/recipes-devtools/genext2fs/genext2fs-1.4.1/fix-nbblocks-cast.patch
@@ -0,0 +1,35 @@
+
+This patch fixes up the computation of nbinodes which would go
+negative due to an int overflow issue when nbblocks > 2Meg for
+a 2Gig or greater filesystem.
+
+The computation is now done as a float equation, since both nbblocks
+and bytes_per_inode are no floats, and then cast to int by assignment.
+
+int tmp_nbinodes = nbblocks * BLOCKSIZE / bytes_per_inode;
+
+Upstream-Status: Submitted
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: genext2fs-1.4.1/genext2fs.c
+===================================================================
+--- genext2fs-1.4.1.orig/genext2fs.c
++++ genext2fs-1.4.1/genext2fs.c
+@@ -2447,7 +2447,7 @@ extern int optind, opterr, optopt;
+ int
+ main(int argc, char **argv)
+ {
+-	int nbblocks = -1;
++	float nbblocks = -1;
+ 	int nbinodes = -1;
+ 	int nbresrvd = -1;
+ 	float bytes_per_inode = -1;
+@@ -2609,7 +2609,7 @@ main(int argc, char **argv)
+ 		}
+ 		if(fs_timestamp == -1)
+ 			fs_timestamp = time(NULL);
+-		fs = init_fs(nbblocks, nbinodes, nbresrvd, holes, fs_timestamp);
++		fs = init_fs((int)nbblocks, nbinodes, nbresrvd, holes, fs_timestamp);
+ 	}
+ 	
+ 	populate_fs(fs, dopt, didx, squash_uids, squash_perms, fs_timestamp, NULL);
diff --git a/meta/recipes-devtools/genext2fs/genext2fs_1.4.1.bb b/meta/recipes-devtools/genext2fs/genext2fs_1.4.1.bb
index 9364bb8..012ec6c 100644
--- a/meta/recipes-devtools/genext2fs/genext2fs_1.4.1.bb
+++ b/meta/recipes-devtools/genext2fs/genext2fs_1.4.1.bb
@@ -1,6 +1,8 @@
 require genext2fs.inc
 
-PR = "r0"
+PR = "r1"
+
+SRC_URI += "file://fix-nbblocks-cast.patch"
 
 SRC_URI[md5sum] = "b7b6361bcce2cedff1ae437fadafe53b"
 SRC_URI[sha256sum] = "404dbbfa7a86a6c3de8225c8da254d026b17fd288e05cec4df2cc7e1f4feecfc"
-- 
1.7.6.5



