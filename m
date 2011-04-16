Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzRI-0006H6-Ov
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 08:57:04 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 Apr 2011 23:54:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="629635255"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by orsmga002.jf.intel.com with ESMTP; 15 Apr 2011 23:54:44 -0700
Message-Id: <d85cf6df6a3fa92bdb26fcd9e675a565ce659a3f.1302936483.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Fri, 15 Apr 2011 16:40:47 +0800
Date: Fri, 15 Apr 2011 23:54:43 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 38/58] libnewt: fix parallel-make issue
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
X-List-Received-Date: Sat, 16 Apr 2011 06:57:05 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Add patch to remove hardcoded /usr/include/slang

Fixes [YOCTO #947]

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../newt/files/fix_SHAREDDIR.patch                 |   29 ++++++++++++++++++++
 .../newt/files/include-without-python.patch        |    2 +
 .../newt/files/remove_slang_include.patch          |   13 +++++++++
 meta/recipes-extended/newt/libnewt_0.52.12.bb      |    8 ++++-
 4 files changed, 50 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/newt/files/fix_SHAREDDIR.patch
 create mode 100644 meta/recipes-extended/newt/files/remove_slang_include.patch

diff --git a/meta/recipes-extended/newt/files/fix_SHAREDDIR.patch b/meta/recipes-extended/newt/files/fix_SHAREDDIR.patch
new file mode 100644
index 0000000..7795260
--- /dev/null
+++ b/meta/recipes-extended/newt/files/fix_SHAREDDIR.patch
@@ -0,0 +1,29 @@
+Upstream-Status: Pending
+
+Author: dexuan.cui@intel.com
+Date: Fri Apr 15 16:17:39 CST 2011
+
+The patch fixes a parallel-make issue: when generating $(SHAREDDIR)/%.o, we should
+ensure the directory ${SHAREDDIR} exists.
+
+We need to push the patch to upstream.
+
+Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
+
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -114,12 +114,12 @@
+ 
+ sharedlib: $(LIBNEWTSH)
+ 
+-$(LIBNEWTSH): $(SHAREDDIR) $(SHAREDOBJS)
++$(LIBNEWTSH): $(SHAREDOBJS)
+ 	$(CC) -shared -o $(LIBNEWTSH) $(SHLIBFLAGS) $(SHAREDOBJS) $(LDFLAGS) $(LIBS)
+ 	ln -fs $(LIBNEWTSONAME) libnewt.so
+ 	ln -fs $(LIBNEWTSH) $(LIBNEWTSONAME)
+ 
+-$(SHAREDDIR)/%.o : %.c
++$(SHAREDDIR)/%.o : %.c $(SHAREDDIR)
+ 	$(CC) $(SHCFLAGS) -c $(CFLAGS) $(CPPFLAGS) -o $@ $<
+ 
+ install: $(LIBNEWT) install-sh whiptail
diff --git a/meta/recipes-extended/newt/files/include-without-python.patch b/meta/recipes-extended/newt/files/include-without-python.patch
index 277ee33..263e9de 100644
--- a/meta/recipes-extended/newt/files/include-without-python.patch
+++ b/meta/recipes-extended/newt/files/include-without-python.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 From 3d13bbbb769050fac4cc6c904c174edc27e4f03d Mon Sep 17 00:00:00 2001
 From: Otavio Salvador <otavio@ossystems.com.br>
 Date: Thu, 20 Jan 2011 14:14:51 -0200
diff --git a/meta/recipes-extended/newt/files/remove_slang_include.patch b/meta/recipes-extended/newt/files/remove_slang_include.patch
new file mode 100644
index 0000000..dbdeef0
--- /dev/null
+++ b/meta/recipes-extended/newt/files/remove_slang_include.patch
@@ -0,0 +1,13 @@
+Index: git/Makefile.in
+===================================================================
+--- git.orig/Makefile.in
++++ git/Makefile.in
+@@ -5,7 +5,7 @@ CC = @CC@
+ CPP = @CPP@
+ CFLAGS = @CFLAGS@
+ LDFLAGS = @LDFLAGS@
+-CPPFLAGS = -D_GNU_SOURCE -I/usr/include/slang @CPPFLAGS@ 
++CPPFLAGS = -D_GNU_SOURCE @CPPFLAGS@ 
+ GNU_LD = @GNU_LD@
+ 
+ VERSION = @VERSION@
diff --git a/meta/recipes-extended/newt/libnewt_0.52.12.bb b/meta/recipes-extended/newt/libnewt_0.52.12.bb
index eefd6bd..e2ad559 100644
--- a/meta/recipes-extended/newt/libnewt_0.52.12.bb
+++ b/meta/recipes-extended/newt/libnewt_0.52.12.bb
@@ -17,11 +17,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 # slang needs to be >= 2.2
 DEPENDS = "slang popt"
 
-PR = "r0"
+PR = "r2"
 
 SRCREV = "c3c7be75f6ef1adfc2be5f99c1e8ef3f0ab58c38"
+
 SRC_URI = "git://git.fedorahosted.org/git/newt;protocol=git \
-           file://include-without-python.patch"
+           file://include-without-python.patch \
+           file://remove_slang_include.patch \
+           file://fix_SHAREDDIR.patch"
+
 S = "${WORKDIR}/git"
 
 EXTRA_OECONF = "--without-python --without-tcl"
-- 
1.7.1.1



