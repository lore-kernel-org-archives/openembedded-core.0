Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1Qm5B7-0007dc-Ee
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 16:33:41 +0200
Received: by rex (Postfix, from userid 1000)
	id 4CAF721DB6; Wed, 27 Jul 2011 15:29:17 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 15:29:14 +0100
Message-Id: <0b8b6289a72c9c2c45127af76992fbe5c4ff8086.1311776363.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <7cdd5b62608ae2047d4fdd2ee98e452398401b1e.1311776363.git.richard.purdie@linuxfoundation.org>
References: <7cdd5b62608ae2047d4fdd2ee98e452398401b1e.1311776363.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1311776363.git.richard.purdie@linuxfoundation.org>
References: <cover.1311776363.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/4] module-init-tools-cross: Drop static binaries patch as a better fix has been merged
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
X-List-Received-Date: Wed, 27 Jul 2011 14:33:41 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../files/no-static-binaries.patch                 |   25 --------------------
 .../module-init-tools-cross_3.16.bb                |    2 -
 2 files changed, 0 insertions(+), 27 deletions(-)
 delete mode 100644 meta/recipes-kernel/module-init-tools/files/no-static-binaries.patch

diff --git a/meta/recipes-kernel/module-init-tools/files/no-static-binaries.patch b/meta/recipes-kernel/module-init-tools/files/no-static-binaries.patch
deleted file mode 100644
index 33fb6e0..0000000
--- a/meta/recipes-kernel/module-init-tools/files/no-static-binaries.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-# Building a native, statically-linked insmod can result in ld failing because
-# it can't find a static libc.  A native, static insmod is unnecessary anyway,
-# so this patch just removes it.
-#
-# - jdike@linux.intel.com
-#
-# Change to a simpler method by just disabling static link flag, since even
-# removing those lines don't prevent insmod.static from compile
-#
-# by Kevin Tian <kevin.tian@intel.com>, 2010-07-21
-
-Upstream-Status: Pending
-
-Index: module-init-tools-3.2.2/Makefile.am
-===================================================================
---- module-init-tools-3.2.2.orig/Makefile.am	2010-05-26 15:43:16.000000000 -0400
-+++ module-init-tools-3.2.2/Makefile.am	2010-05-26 16:04:06.232990785 -0400
-@@ -10,7 +10,6 @@
- modindex_SOURCES = modindex.c zlibsupport.c zlibsupport.h testing.h
- 
- insmod_static_SOURCES = insmod.c
--insmod_static_LDFLAGS = -static
- # We don't want the $(zlib_flags) here: that makes a dynamic executable
- insmod_static_LDADD = libmodtools.a
- 
diff --git a/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb b/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb
index 38f0476..a6c5d21 100644
--- a/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb
+++ b/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb
@@ -3,8 +3,6 @@ PR = "r0"
 inherit cross
 PROVIDES += "virtual/${TARGET_PREFIX}depmod"
 
-SRC_URI += "file://no-static-binaries.patch"
-
 SRC_URI[md5sum] = "bc44832c6e41707b8447e2847d2019f5"
 SRC_URI[sha256sum] = "e1f2cdcae64a8effc25e545a5e0bdaf312f816ebbcd0916e4e87450755fab64b"
 
-- 
1.7.4.1



