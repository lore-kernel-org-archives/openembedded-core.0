Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5D97778505
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 14:58:06 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2017 06:58:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,395,1505804400"; d="scan'208";a="173402253"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 14 Nov 2017 06:58:06 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 16:57:45 +0200
Message-Id: <20171114145754.9643-18-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
References: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 18/27] psmisc: update to 23.0
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
X-List-Received-Date: Tue, 14 Nov 2017 14:58:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Switch to gitlab, as that's where development now happens.
Drop two upstreamed patches, add two patches to avoid newly
introduced build errors.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...001-Typo-in-fuser-makes-M-on-all-the-time.patch | 46 ----------------------
 .../files/0002-Include-limits.h-for-PATH_MAX.patch | 29 --------------
 ...-create-src-directory-before-attempting-t.patch | 30 ++++++++++++++
 ...efile.am-do-not-recurse-into-po-directory.patch | 30 ++++++++++++++
 meta/recipes-extended/psmisc/psmisc_22.21.bb       | 12 ------
 meta/recipes-extended/psmisc/psmisc_23.0.bb        | 11 ++++++
 6 files changed, 71 insertions(+), 87 deletions(-)
 delete mode 100644 meta/recipes-extended/psmisc/files/0001-Typo-in-fuser-makes-M-on-all-the-time.patch
 delete mode 100644 meta/recipes-extended/psmisc/files/0002-Include-limits.h-for-PATH_MAX.patch
 create mode 100644 meta/recipes-extended/psmisc/psmisc/0001-Makefile.am-create-src-directory-before-attempting-t.patch
 create mode 100644 meta/recipes-extended/psmisc/psmisc/0001-Makefile.am-do-not-recurse-into-po-directory.patch
 delete mode 100644 meta/recipes-extended/psmisc/psmisc_22.21.bb
 create mode 100644 meta/recipes-extended/psmisc/psmisc_23.0.bb

diff --git a/meta/recipes-extended/psmisc/files/0001-Typo-in-fuser-makes-M-on-all-the-time.patch b/meta/recipes-extended/psmisc/files/0001-Typo-in-fuser-makes-M-on-all-the-time.patch
deleted file mode 100644
index e57d60f6a34..00000000000
--- a/meta/recipes-extended/psmisc/files/0001-Typo-in-fuser-makes-M-on-all-the-time.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 3638cc55b4d08851faba46635d737b24d016665b Mon Sep 17 00:00:00 2001
-From: Brad Jorsch <anomie@users.sourceforge.net>
-Date: Fri, 28 Feb 2014 21:55:02 +1100
-Subject: [PATCH] Typo in fuser makes -M on all the time
-
-Brad found that fuser had the -M option on all the time.
-A simple but significant typo caused this, thanks the the patch.
-
-Bug-Debian: http://bugs.debian.org/740275
-
-Upstream-Status: Backport
-
-Signed-off-by: Craig Small <csmall@enc.com.au>
----
- ChangeLog   | 4 ++++
- src/fuser.c | 2 +-
- 2 files changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/ChangeLog b/ChangeLog
-index fd1cccf..e5f784c 100644
---- a/ChangeLog
-+++ b/ChangeLog
-@@ -1,3 +1,7 @@
-+Changes in 22.22
-+================
-+	* Fixed typo in fuser which has -M on Debian #740275
-+
- Changes in 22.21
- ================
- 	* Missing comma in fuser(1) added Debian #702391
-diff --git a/src/fuser.c b/src/fuser.c
-index b485f65..389b302 100644
---- a/src/fuser.c
-+++ b/src/fuser.c
-@@ -1174,7 +1174,7 @@ int main(int argc, char *argv[])
- 		usage(_("No process specification given"));
- 
- 	/* Check if -M flag was used and if so check mounts */
--	if (opts * OPT_ISMOUNTPOINT) {
-+	if (opts & OPT_ISMOUNTPOINT) {
- 	    check_mountpoints(&mounts, &names_head, &names_tail);
- 	}
- 
--- 
-1.8.4.2
-
diff --git a/meta/recipes-extended/psmisc/files/0002-Include-limits.h-for-PATH_MAX.patch b/meta/recipes-extended/psmisc/files/0002-Include-limits.h-for-PATH_MAX.patch
deleted file mode 100644
index c8afcac8a8b..00000000000
--- a/meta/recipes-extended/psmisc/files/0002-Include-limits.h-for-PATH_MAX.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From aa66afecd8ba9cc4139f25ab15ec315173413a7d Mon Sep 17 00:00:00 2001
-From: Paul Barker <paul@paulbarker.me.uk>
-Date: Wed, 20 Aug 2014 10:31:37 +0000
-Subject: [PATCH] Include <limits.h> for PATH_MAX
-
-When building against musl libc, PATH_MAX is defined in <limits.h>.
-
-Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
-
-Upstream-Status: Accepted (Should be in next release after 22.21)
----
- src/pstree.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/pstree.c b/src/pstree.c
-index 071e6c4..0d28260 100644
---- a/src/pstree.c
-+++ b/src/pstree.c
-@@ -41,6 +41,7 @@
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <sys/ioctl.h>
-+#include <limits.h>
- 
- #include "i18n.h"
- #include "comm.h"
--- 
-2.0.4
-
diff --git a/meta/recipes-extended/psmisc/psmisc/0001-Makefile.am-create-src-directory-before-attempting-t.patch b/meta/recipes-extended/psmisc/psmisc/0001-Makefile.am-create-src-directory-before-attempting-t.patch
new file mode 100644
index 00000000000..4d44495fd3f
--- /dev/null
+++ b/meta/recipes-extended/psmisc/psmisc/0001-Makefile.am-create-src-directory-before-attempting-t.patch
@@ -0,0 +1,30 @@
+From 285877b7761d74736aca2687ed9bef2f78b82c33 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 2 Nov 2017 16:21:22 +0200
+Subject: [PATCH] Makefile.am: create src directory before attempting to write
+ there
+
+Otherwise out of tree builds will fail.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 9f61ab4..b4ced7f 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -79,7 +79,7 @@ EXTRA_DIST = src/signames.c README.md
+ CLEANFILES = src/signames.h
+ 
+ src/signames.h: src/signames.c Makefile
+-		export LC_ALL=C ; \
++		export LC_ALL=C ; mkdir -p src ; \
+ 		@CPP@ -dM $< |\
+ 		tr -s '\t ' ' ' | sort -n -k 3 | sed \
+ 	's:#define SIG\([A-Z][A-Z]*[0-9]*\) \([0-9][0-9]*\).*$\:{\ \2,"\1" },:p;d' | \
+-- 
+2.14.2
+
diff --git a/meta/recipes-extended/psmisc/psmisc/0001-Makefile.am-do-not-recurse-into-po-directory.patch b/meta/recipes-extended/psmisc/psmisc/0001-Makefile.am-do-not-recurse-into-po-directory.patch
new file mode 100644
index 00000000000..72f993a1702
--- /dev/null
+++ b/meta/recipes-extended/psmisc/psmisc/0001-Makefile.am-do-not-recurse-into-po-directory.patch
@@ -0,0 +1,30 @@
+From bbd69f375a0eaeba3bfa17008f8ff41e836c1688 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 2 Nov 2017 16:39:59 +0200
+Subject: [PATCH] Makefile.am: do not recurse into po directory
+
+Some broken autoconf logic results in a missing Makefile - let's
+just skip the directory with translations, as users of psmisc are unlikely
+to need those anyway.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Makefile.am | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index b4ced7f..0d343a6 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -11,7 +11,6 @@ ACLOCAL_AMFLAGS = -I m4
+ 
+ SUBDIRS = \
+ 	  doc \
+-	  po \
+ 	  icons \
+ 	  testsuite
+ 
+-- 
+2.14.2
+
diff --git a/meta/recipes-extended/psmisc/psmisc_22.21.bb b/meta/recipes-extended/psmisc/psmisc_22.21.bb
deleted file mode 100644
index 1c6473ebf43..00000000000
--- a/meta/recipes-extended/psmisc/psmisc_22.21.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require psmisc.inc
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
-
-SRC_URI[md5sum] = "935c0fd6eb208288262b385fa656f1bf"
-SRC_URI[sha256sum] = "97323cad619210845b696d7d722c383852b2acb5c49b5b0852c4f29c77a8145a"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/psmisc/psmisc-${PV}.tar.gz \
-           file://0001-Typo-in-fuser-makes-M-on-all-the-time.patch \
-           file://0002-Include-limits.h-for-PATH_MAX.patch \
-           file://0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch \
-           "
diff --git a/meta/recipes-extended/psmisc/psmisc_23.0.bb b/meta/recipes-extended/psmisc/psmisc_23.0.bb
new file mode 100644
index 00000000000..e036ae25508
--- /dev/null
+++ b/meta/recipes-extended/psmisc/psmisc_23.0.bb
@@ -0,0 +1,11 @@
+require psmisc.inc
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+SRC_URI = "git://gitlab.com/psmisc/psmisc.git;protocol=https \
+           file://0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch \
+	   file://0001-Makefile.am-create-src-directory-before-attempting-t.patch \
+           file://0001-Makefile.am-do-not-recurse-into-po-directory.patch \
+           "
+SRCREV = "67b1da268f4c0ce6859980e3dfcfaec5b2448e80"
+S = "${WORKDIR}/git"
-- 
2.15.0


