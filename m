Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QeEWv-0006wa-VV
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 00:55:46 +0200
Received: by rex (Postfix, from userid 1000)
	id 655DE3132C; Tue,  5 Jul 2011 23:51:25 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jul 2011 23:51:05 +0100
Message-Id: <0bfedd0d9d59ad6184e242d85cdeca7297e90fa6.1309906154.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <696f00b67217242f3a372d070c2473f8ced639ed.1309906154.git.richard.purdie@linuxfoundation.org>
References: <696f00b67217242f3a372d070c2473f8ced639ed.1309906154.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1309906154.git.richard.purdie@linuxfoundation.org>
References: <cover.1309906154.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 04/17] btrfs-tools: Fix manpage creation directory
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
X-List-Received-Date: Tue, 05 Jul 2011 22:55:46 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../btrfs-tools/btrfs-tools/weak-defaults.patch    |   31 ++++++++++++++++++++
 .../btrfs-tools/btrfs-tools_git.bb                 |    3 +-
 2 files changed, 33 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/weak-defaults.patch

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/weak-defaults.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/weak-defaults.patch
new file mode 100644
index 0000000..9ca9fca
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/weak-defaults.patch
@@ -0,0 +1,31 @@
+Upstream-Status: Pending
+
+Allow mandir to be set from the environment, fixing the following packaging warnings:
+
+WARNING: For recipe btrfs-tools, the following files were installed but not shipped in any package:
+WARNING:   /usr/man/man8/btrfs-show.8.gz
+WARNING:   /usr/man/man8/btrfs-image.8.gz
+WARNING:   /usr/man/man8/btrfsctl.8.gz
+WARNING:   /usr/man/man8/btrfs.8.gz
+WARNING:   /usr/man/man8/btrfsck.8.gz
+WARNING:   /usr/man/man8/mkfs.btrfs.8.gz
+
+RP - 5/7/2011
+
+Index: git/man/Makefile
+===================================================================
+--- git.orig/man/Makefile	2011-07-05 22:03:58.949919067 +0100
++++ git/man/Makefile	2011-07-05 22:04:07.789919856 +0100
+@@ -2,9 +2,9 @@
+ INSTALL= install
+ 
+ prefix ?= /usr/local
+-bindir = $(prefix)/bin
+-mandir = $(prefix)/man
+-man8dir = $(mandir)/man8
++bindir ?= $(prefix)/bin
++mandir ?= $(prefix)/man
++man8dir ?= $(mandir)/man8
+ 
+ MANPAGES = mkfs.btrfs.8.gz btrfsctl.8.gz btrfsck.8.gz btrfs-image.8.gz \
+ 	   btrfs-show.8.gz btrfs.8.gz
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
index 312dff3..a5c556d 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/mason/btrfs-progs-unsta
 
 S = "${WORKDIR}/git"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI += "file://upstream-tmp/0001-Btrfs-progs-add-a-btrfs-select-super-command-to-over.patch \
 	    file://upstream-tmp/0002-Btrfs-progs-use-safe-string-manipulation-functions.patch \
@@ -40,6 +40,7 @@ SRC_URI += "file://upstream-tmp/0001-Btrfs-progs-add-a-btrfs-select-super-comman
 	    file://debian/01-labels.patch \
 	    file://debian/02-ftbfs.patch \
 	    file://fix_use_of_gcc.patch \
+	    file://weak-defaults.patch \
 		"
 
 SRC_URI[md5sum] = "78b1700d318de8518abfaab71f99a885"
-- 
1.7.4.1



