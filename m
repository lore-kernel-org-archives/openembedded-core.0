Return-Path: <raphael.kubo.da.costa@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 042EF6C489
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Nov 2018 15:10:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Nov 2018 07:10:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,257,1539673200"; d="scan'208";a="101762593"
Received: from rkubodac-desk.ger.corp.intel.com ([10.252.31.112])
	by orsmga003.jf.intel.com with ESMTP; 20 Nov 2018 07:10:30 -0800
From: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Nov 2018 16:10:26 +0100
Message-Id: <20181120151026.51842-1-raphael.kubo.da.costa@intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [rocko][PATCH] bison: Fix build break with glibc 2.28
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
X-List-Received-Date: Tue, 20 Nov 2018 15:10:32 -0000
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

(From OE-Core rev: 741415c58b3565764000028c26efd081212eb989)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-devtools/bison/bison/gnulib.patch | 21 +++++++++++++++++++
 meta/recipes-devtools/bison/bison_3.0.4.bb    |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta/recipes-devtools/bison/bison/gnulib.patch

diff --git a/meta/recipes-devtools/bison/bison/gnulib.patch b/meta/recipes-devtools/bison/bison/gnulib.patch
new file mode 100644
index 0000000000..7eaf0ce0fa
--- /dev/null
+++ b/meta/recipes-devtools/bison/bison/gnulib.patch
@@ -0,0 +1,21 @@
+Fix gnulib issues found with glibc 2.28 libio.h removal
+
+see
+https://lists.gnu.org/r/bug-gnulib/2018-03/msg00000.html
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: bison-3.0.4/lib/fseterr.c
+===================================================================
+--- bison-3.0.4.orig/lib/fseterr.c
++++ bison-3.0.4/lib/fseterr.c
+@@ -29,7 +29,7 @@ fseterr (FILE *fp)
+   /* Most systems provide FILE as a struct and the necessary bitmask in
+      <stdio.h>, because they need it for implementing getc() and putc() as
+      fast macros.  */
+-#if defined _IO_ftrylockfile || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
++#if defined _IO_EOF_SEEN || __GNU_LIBRARY__ == 1 /* GNU libc, BeOS, Haiku, Linux libc5 */
+   fp->_flags |= _IO_ERR_SEEN;
+ #elif defined __sferror || defined __DragonFly__ /* FreeBSD, NetBSD, OpenBSD, DragonFly, Mac OS X, Cygwin */
+   fp_->_flags |= __SERR;
diff --git a/meta/recipes-devtools/bison/bison_3.0.4.bb b/meta/recipes-devtools/bison/bison_3.0.4.bb
index 7d066be0ad..a86549c086 100644
--- a/meta/recipes-devtools/bison/bison_3.0.4.bb
+++ b/meta/recipes-devtools/bison/bison_3.0.4.bb
@@ -15,6 +15,7 @@ SRC_URI = "${GNU_MIRROR}/bison/bison-${PV}.tar.xz \
            file://dont-depend-on-help2man.patch.patch \
            file://0001-src-local.mk-fix-parallel-issue.patch \
            file://add-with-bisonlocaledir.patch \
+           file://gnulib.patch \
 "
 
 # No point in hardcoding path to m4, just use PATH
-- 
2.19.1


