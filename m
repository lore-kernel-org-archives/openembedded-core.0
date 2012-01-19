Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnoKy-0004cO-HI
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 10:31:16 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Jan 2012 01:23:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97472130"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 19 Jan 2012 01:23:03 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2012 01:22:45 -0800
Message-Id: <416b38834ff6436d8c6e6f73bb7e88d0c3ce0fa8.1326964778.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 24/33] e2fsprogs_1.42.bb: Fix build fallout for uclibc
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
X-List-Received-Date: Thu, 19 Jan 2012 09:31:16 -0000

From: Khem Raj <raj.khem@gmail.com>

e2fsprogs 1.42 onwards uses fallocate() which uclibc
does not implement(yet). In most of places its use
is controlled and it only used when configure detects
fallocate being present but in this one case it missed
to check for fallocate being available so here we
add the check

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../e2fsprogs/e2fsprogs-1.42/fallocate.patch       |   22 ++++++++++++++++++++
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb  |    3 +-
 2 files changed, 24 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/fallocate.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/fallocate.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/fallocate.patch
new file mode 100644
index 0000000..4d952a5
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/fallocate.patch
@@ -0,0 +1,22 @@
+We assume that fallocate is supported somehow
+but we need to check if we have fallocate()
+this problem shows up on uclibc systems since
+uclibc does not have fallocate() implemented
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+
+Index: e2fsprogs-1.42/lib/ext2fs/unix_io.c
+===================================================================
+--- e2fsprogs-1.42.orig/lib/ext2fs/unix_io.c	2012-01-17 17:24:34.290780625 -0800
++++ e2fsprogs-1.42/lib/ext2fs/unix_io.c	2012-01-17 17:25:37.338783680 -0800
+@@ -895,7 +895,7 @@
+ 		goto unimplemented;
+ #endif
+ 	} else {
+-#ifdef FALLOC_FL_PUNCH_HOLE
++#if defined FALLOC_FL_PUNCH_HOLE && defined HAVE_FALLOCATE
+ 		/*
+ 		 * If we are not on block device, try to use punch hole
+ 		 * to reclaim free space.
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
index 9ff85a2..f6759aa7 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
@@ -1,8 +1,9 @@
 require e2fsprogs.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI += "file://quotefix.patch \
+            file://fallocate.patch \
             file://acinclude.m4"
 
 SRC_URI[md5sum] = "a3c4ffd7352310ab5e9412965d575610"
-- 
1.7.6.5



