Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D094979265
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 06:03:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7G63gFv023059
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 23:03:42 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Wed, 15 Aug 2018 23:03:41 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Aug 2018 14:14:15 +0800
Message-ID: <2f1af64114464437840516b805fec7cd0773858c.1534399650.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1534399650.git.liezhi.yang@windriver.com>
References: <cover.1534399650.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] binutils: Improve check for input file matching output file
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
X-List-Received-Date: Thu, 16 Aug 2018 06:03:45 -0000
Content-Type: text/plain

When the assembler reports that the input and output are the same, report the
file names involved, in order to help debugging.  Also do not equate two files
are the same if the have the same inode value but reside on different file
systems.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.31.inc   |  1 +
 ...check-for-input-file-matching-output-file.patch | 59 ++++++++++++++++++++++
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0017-improve-check-for-input-file-matching-output-file.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.31.inc b/meta/recipes-devtools/binutils/binutils-2.31.inc
index 02d5bca..6603873 100644
--- a/meta/recipes-devtools/binutils/binutils-2.31.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.31.inc
@@ -36,6 +36,7 @@ SRC_URI = "\
      file://0014-Detect-64-bit-MIPS-targets.patch \
      file://0015-sync-with-OE-libtool-changes.patch \
      file://0016-add-i386pep-emulation-for-x86_64.patch \
+     file://0017-improve-check-for-input-file-matching-output-file.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/0017-improve-check-for-input-file-matching-output-file.patch b/meta/recipes-devtools/binutils/binutils/0017-improve-check-for-input-file-matching-output-file.patch
new file mode 100644
index 0000000..6d8d8a3
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0017-improve-check-for-input-file-matching-output-file.patch
@@ -0,0 +1,59 @@
+From 2a50366ded329bfb39d387253450c9d5302c3503 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Tue, 14 Aug 2018 12:22:35 +0100
+Subject: [PATCH] as.c: Improve check for input file matching output file.
+
+When the assembler reports that the input and output are the same, report the
+file names involved, in order to help debugging.  Also do not equate two files
+are the same if the have the same inode value but reside on different file
+systems.
+
+Upstream-Status: Backport
+
+Robert Yang <liezhi.yang@windriver.com>
+---
+ gas/as.c      | 27 ++++++++++++++++++++-------
+ 2 files changed, 20 insertions(+), 7 deletions(-)
+
+diff --git a/gas/as.c b/gas/as.c
+index b2a908a..3105d06 100644
+--- a/gas/as.c
++++ b/gas/as.c
+@@ -1259,14 +1259,27 @@ main (int argc, char ** argv)
+ 	{
+ 	  struct stat sib;
+ 
+-	  if (stat (argv[i], &sib) == 0)
++	  /* Check that the input file and output file are different.  */
++	  if (stat (argv[i], &sib) == 0
++	      && sib.st_ino == sob.st_ino
++	      /* POSIX emulating systems may support stat() but if the
++		 underlying file system does not support a file serial number
++		 of some kind then they will return 0 for the inode.  So
++		 two files with an inode of 0 may not actually be the same.
++		 On real POSIX systems no ordinary file will ever have an
++		 inode of 0.  */
++	      && sib.st_ino != 0
++	      /* Different files may have the same inode number if they
++		 reside on different devices, so check the st_dev field as
++		 well.  */
++	      && sib.st_dev == sob.st_dev)
+ 	    {
+-	      if (sib.st_ino == sob.st_ino && sib.st_ino != 0)
+-		{
+-		  /* Don't let as_fatal remove the output file!  */
+-		  out_file_name = NULL;
+-		  as_fatal (_("The input and output files must be distinct"));
+-		}
++	      const char *saved_out_file_name = out_file_name;
++
++	      /* Don't let as_fatal remove the output file!  */
++	      out_file_name = NULL;
++	      as_fatal (_("The input '%s' and output '%s' files are the same"),
++			argv[i], saved_out_file_name);
+ 	    }
+ 	}
+     }
+-- 
+2.7.4
+
-- 
2.7.4


