Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 283B477056
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 02:55:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9E2tKJt025234
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 19:55:20 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 13 Oct 2015 19:55:19 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Oct 2015 22:55:17 -0400
Message-ID: <78bfcb15110eba4ebdaecda0c293e5a56009f4dd.1444791107.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1444791107.git.wenzong.fan@windriver.com>
References: <cover.1444791107.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1 v2] bzip2: fix bunzip2 -qt returns 0 for corrupt archives
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
X-List-Received-Date: Wed, 14 Oct 2015 02:55:20 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

"bzip2 -t FILE" returns 2 if FILE exists, but is not a valid bzip2 file.
"bzip2 -qt FILE" returns 0 when this happens, although it does print out
an error message as is does so.

This has been fix by Debian, just port changes from Debian patch file
"20-legacy.patch".

Debian defect:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=279025

Fix item from changelog:
http://archive.debian.net/changelogs/pool/main/b/bzip2/bzip2_1.0.2-7/changelog

  * Fixed "bunzip2 -qt returns 0 for corrupt archives" (Closes: #279025).

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 ...bunzip2-qt-returns-0-for-corrupt-archives.patch | 55 ++++++++++++++++++++++
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb         |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-extended/bzip2/bzip2-1.0.6/fix-bunzip2-qt-returns-0-for-corrupt-archives.patch

diff --git a/meta/recipes-extended/bzip2/bzip2-1.0.6/fix-bunzip2-qt-returns-0-for-corrupt-archives.patch b/meta/recipes-extended/bzip2/bzip2-1.0.6/fix-bunzip2-qt-returns-0-for-corrupt-archives.patch
new file mode 100644
index 0000000..ece90d9
--- /dev/null
+++ b/meta/recipes-extended/bzip2/bzip2-1.0.6/fix-bunzip2-qt-returns-0-for-corrupt-archives.patch
@@ -0,0 +1,55 @@
+From 8068659388127e8e63f2d2297ba2348c72b20705 Mon Sep 17 00:00:00 2001
+From: Wenzong Fan <wenzong.fan@windriver.com>
+Date: Mon, 12 Oct 2015 03:19:51 -0400
+Subject: [PATCH] bzip2: fix bunzip2 -qt returns 0 for corrupt archives
+
+"bzip2 -t FILE" returns 2 if FILE exists, but is not a valid bzip2 file.
+"bzip2 -qt FILE" returns 0 when this happens, although it does print out
+an error message as is does so.
+
+This has been fix by Debian, just port changes from Debian patch file
+"20-legacy.patch".
+
+Debian defect:
+https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=279025
+
+Fix item from changelog:
+http://archive.debian.net/changelogs/pool/main/b/bzip2/bzip2_1.0.2-7/changelog
+
+  * Fixed "bunzip2 -qt returns 0 for corrupt archives" (Closes: #279025).
+
+Upstream-Status: Pending
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+---
+ bzip2.c | 14 ++++++++------
+ 1 file changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/bzip2.c b/bzip2.c
+index 6de9d1d..f2ce668 100644
+--- a/bzip2.c
++++ b/bzip2.c
+@@ -2003,12 +2003,14 @@ IntNative main ( IntNative argc, Char *argv[] )
+             testf ( aa->name );
+ 	 }
+       }
+-      if (testFailsExist && noisy) {
+-         fprintf ( stderr,
+-           "\n"
+-           "You can use the `bzip2recover' program to attempt to recover\n"
+-           "data from undamaged sections of corrupted files.\n\n"
+-         );
++      if (testFailsExist) {
++         if (noisy) {
++            fprintf ( stderr,
++              "\n"
++              "You can use the `bzip2recover' program to attempt to recover\n"
++              "data from undamaged sections of corrupted files.\n\n"
++            );
++         }
+          setExit(2);
+          exit(exitValue);
+       }
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
index 233fe4c..d7b8c06 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.6.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;beginline=8;endline=37;md5=40d9d1eb05736d1bfc
 PR = "r5"
 
 SRC_URI = "http://www.bzip.org/${PV}/${BP}.tar.gz \
+           file://fix-bunzip2-qt-returns-0-for-corrupt-archives.patch \
            file://configure.ac;subdir=${BP} \
            file://Makefile.am;subdir=${BP} \
            file://run-ptest"
-- 
1.9.1


