Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrS-0004tp-Vo
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:39 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jan 2012 22:21:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752317"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:17 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:20:30 -0800
Message-Id: <7f1bcc5a195b9c227358767b420c81cb434dfc0b.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 104/113] elfutils: fix for dso link change in recent ld
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:41 -0000

From: Christopher Larson <chris_larson@mentor.com>

This patch makes the link to the dependencies of libdw explicit, as recent ld
no longer implicitly links them. See
http://lists.fedoraproject.org/pipermail/devel/2010-March/133601.html as
a similar example of the error message you can encounter without this patch,
and https://fedoraproject.org/wiki/UnderstandingDSOLinkChange and
https://fedoraproject.org/wiki/Features/ChangeInImplicitDSOLinking for more
details.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 .../elfutils/elfutils/dso-link-change.patch        |   32 ++++++++++++++++++++
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |    5 ++-
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils/dso-link-change.patch

diff --git a/meta/recipes-devtools/elfutils/elfutils/dso-link-change.patch b/meta/recipes-devtools/elfutils/elfutils/dso-link-change.patch
new file mode 100644
index 0000000..d0cd3ed
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils/dso-link-change.patch
@@ -0,0 +1,32 @@
+Upstream-Status: Pending
+
+# This patch makes the link to the dependencies of libdw explicit, as recent
+# ld no longer implicitly links them. See
+# http://lists.fedoraproject.org/pipermail/devel/2010-March/133601.html as
+# a similar example of the error message you can encounter without this patch,
+# and https://fedoraproject.org/wiki/UnderstandingDSOLinkChange and
+# https://fedoraproject.org/wiki/Features/ChangeInImplicitDSOLinking for more
+# details.
+
+--- elfutils-0.148.orig/src/Makefile.am
++++ elfutils-0.148/src/Makefile.am
+@@ -86,7 +86,7 @@ libdw = ../libdw/libdw.a $(zip_LIBS) $(l
+ libelf = ../libelf/libelf.a
+ else
+ libasm = ../libasm/libasm.so
+-libdw = ../libdw/libdw.so
++libdw = ../libdw/libdw.so $(zip_LIBS) $(libelf) $(libebl) -ldl
+ libelf = ../libelf/libelf.so
+ endif
+ libebl = ../libebl/libebl.a
+--- elfutils-0.148.orig/tests/Makefile.am
++++ elfutils-0.148/tests/Makefile.am
+@@ -172,7 +172,7 @@ libdw = ../libdw/libdw.a $(zip_LIBS) $(l
+ libelf = ../libelf/libelf.a
+ libasm = ../libasm/libasm.a
+ else
+-libdw = ../libdw/libdw.so
++libdw = ../libdw/libdw.so $(zip_LIBS) $(libelf) $(libebl) -ldl
+ libelf = ../libelf/libelf.so
+ libasm = ../libasm/libasm.so
+ endif
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
index 0f4e8ca..710959a 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3\
                     file://EXCEPTION;md5=570adcb0c1218ab57f2249c67d0ce417"
 DEPENDS = "libtool bzip2 zlib"
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "https://fedorahosted.org/releases/e/l/elfutils/elfutils-${PV}.tar.bz2"
 
@@ -29,7 +29,8 @@ SRC_URI += "\
 	file://elfutils-fsize.patch \
 	file://remove-unused.patch \
 	file://mempcpy.patch \
-	file://fix_for_gcc-4.7.patch\
+	file://fix_for_gcc-4.7.patch \
+	file://dso-link-change.patch \
 "
 # Only apply when building uclibc based target recipe
 SRC_URI_append_libc-uclibc = " ${@['', 'file://uclibc-support.patch']['${PN}' == '${BPN}']}"
-- 
1.7.6.4



