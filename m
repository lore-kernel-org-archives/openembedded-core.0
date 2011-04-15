Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QAevH-0006D0-Q3
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Apr 2011 11:02:44 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Apr 2011 02:00:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,217,1301900400"; d="scan'208";a="733757891"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by orsmga001.jf.intel.com with ESMTP; 15 Apr 2011 01:59:25 -0700
Message-Id: <95f8215966bbb379076078daf089f88a395ed8d5.1302857514.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1302857514.git.dexuan.cui@intel.com>
References: <cover.1302857514.git.dexuan.cui@intel.com>
Old-Date: Fri, 15 Apr 2011 16:40:47 +0800
Date: Fri, 15 Apr 2011 16:57:19 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Dexuan Cui <dexuan.cui@intel.com>
Subject: [PATCH 2/2] libnewt: fix parallel-make issue
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
X-List-Received-Date: Fri, 15 Apr 2011 09:02:45 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Fixes [YOCTO #947]

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../newt/files/fix_SHAREDDIR.patch                 |   29 ++++++++++++++++++++
 .../newt/files/include-without-python.patch        |    2 +
 meta/recipes-extended/newt/libnewt_0.52.12.bb      |    7 +++-
 3 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/newt/files/fix_SHAREDDIR.patch

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
diff --git a/meta/recipes-extended/newt/libnewt_0.52.12.bb b/meta/recipes-extended/newt/libnewt_0.52.12.bb
index eefd6bd..e6c0b2e 100644
--- a/meta/recipes-extended/newt/libnewt_0.52.12.bb
+++ b/meta/recipes-extended/newt/libnewt_0.52.12.bb
@@ -17,11 +17,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 # slang needs to be >= 2.2
 DEPENDS = "slang popt"
 
-PR = "r0"
+PR = "r1"
 
 SRCREV = "c3c7be75f6ef1adfc2be5f99c1e8ef3f0ab58c38"
+
 SRC_URI = "git://git.fedorahosted.org/git/newt;protocol=git \
-           file://include-without-python.patch"
+           file://include-without-python.patch \
+           file://fix_SHAREDDIR.patch"
+
 S = "${WORKDIR}/git"
 
 EXTRA_OECONF = "--without-python --without-tcl"
-- 
1.7.2



