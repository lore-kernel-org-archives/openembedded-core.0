Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sg8Nv-0008Qm-Ga
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Jun 2012 07:50:51 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jun 2012 22:40:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="181103278"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.105])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2012 22:40:08 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Jun 2012 22:39:45 -0700
Message-Id: <ba86c65ed858f9449814cb82fc23173027e2cf0a.1339911478.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1339911478.git.sgw@linux.intel.com>
References: <cover.1339911478.git.sgw@linux.intel.com>
In-Reply-To: <cover.1339911478.git.sgw@linux.intel.com>
References: <cover.1339911478.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 01/23] gcc-cross: argument list too long when do_install
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
X-List-Received-Date: Sun, 17 Jun 2012 05:50:51 -0000

From: Robert Yang <liezhi.yang@windriver.com>

There would be an "Argument list too long" error when the length of
tmpdir is longer than 190, this is caused by:

headers=`echo $(PLUGIN_HEADERS) | tr ' ' '\012' | sort -u`

The PLUGIN_HEADERS is too long before sort, so the "echo" can't handle
it, use the $(sort list) of GNU make which can handle the too long list
would fix the problem, the header would be short enough after sorted.
The "tr ' ' '\012'" was used for translating the space to "\n", the
$(sort list) doesn't need this.

This doesn't impact the output, so it doesn't need the PR bump.

[YOCTO #2591]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    1 +
 .../gcc/gcc-4.6/gcc-argument-list-too-long.patch   |   33 ++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-4.7.inc              |    1 +
 .../gcc/gcc-4.7/gcc-argument-list-too-long.patch   |   33 ++++++++++++++++++++
 4 files changed, 68 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/gcc-argument-list-too-long.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/gcc-argument-list-too-long.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index 7a70a38..03d8871 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -75,6 +75,7 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
 	   file://fortran-cross-compile-hack.patch \
 	   file://cpp-honour-sysroot.patch \
 	   file://mips64-default-n64.patch \
+	   file://gcc-argument-list-too-long.patch \
 	  "
 
 SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch "
diff --git a/meta/recipes-devtools/gcc/gcc-4.6/gcc-argument-list-too-long.patch b/meta/recipes-devtools/gcc/gcc-4.6/gcc-argument-list-too-long.patch
new file mode 100644
index 0000000..70d3c53
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6/gcc-argument-list-too-long.patch
@@ -0,0 +1,33 @@
+There would be an "Argument list too long" error when the
+build directory is longer than 200, this is caused by:
+
+headers=`echo $(PLUGIN_HEADERS) | tr ' ' '\012' | sort -u`
+
+The PLUGIN_HEADERS is too long before sort, so the "echo" can't handle
+it, use the $(sort list) of GNU make which can handle the too long list
+would fix the problem, the header would be short enough after sorted.
+The "tr ' ' '\012'" was used for translating the space to "\n", the
+$(sort list) doesn't need this.
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+Upstream-Status: Pending
+---
+ gcc/Makefile.in |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gcc/Makefile.in b/gcc/Makefile.in
+--- a/gcc/Makefile.in
++++ b/gcc/Makefile.in
+@@ -4553,7 +4553,7 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
+ # We keep the directory structure for files in config or c-family and .def
+ # files. All other files are flattened to a single directory.
+ 	$(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
+-	headers=`echo $(PLUGIN_HEADERS) | tr ' ' '\012' | sort -u`; \
++	headers="$(sort $(PLUGIN_HEADERS))"; \
+ 	srcdirstrip=`echo "$(srcdir)" | sed 's/[].[^$$\\*|]/\\\\&/g'`; \
+ 	for file in $$headers; do \
+ 	  if [ -f $$file ] ; then \
+-- 
+1.7.10.2
+
diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index 973c211..34a73b1 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -66,6 +66,7 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
 	   file://cpp-honor-sysroot.patch \
 	   file://mips64-default-n64.patch \
 	   file://arm-hard-float-loader.patch \
+	   file://gcc-argument-list-too-long.patch \
 	  "
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${BRANCH}"
diff --git a/meta/recipes-devtools/gcc/gcc-4.7/gcc-argument-list-too-long.patch b/meta/recipes-devtools/gcc/gcc-4.7/gcc-argument-list-too-long.patch
new file mode 100644
index 0000000..70d3c53
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.7/gcc-argument-list-too-long.patch
@@ -0,0 +1,33 @@
+There would be an "Argument list too long" error when the
+build directory is longer than 200, this is caused by:
+
+headers=`echo $(PLUGIN_HEADERS) | tr ' ' '\012' | sort -u`
+
+The PLUGIN_HEADERS is too long before sort, so the "echo" can't handle
+it, use the $(sort list) of GNU make which can handle the too long list
+would fix the problem, the header would be short enough after sorted.
+The "tr ' ' '\012'" was used for translating the space to "\n", the
+$(sort list) doesn't need this.
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+Upstream-Status: Pending
+---
+ gcc/Makefile.in |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gcc/Makefile.in b/gcc/Makefile.in
+--- a/gcc/Makefile.in
++++ b/gcc/Makefile.in
+@@ -4553,7 +4553,7 @@ install-plugin: installdirs lang.install-plugin s-header-vars install-gengtype
+ # We keep the directory structure for files in config or c-family and .def
+ # files. All other files are flattened to a single directory.
+ 	$(mkinstalldirs) $(DESTDIR)$(plugin_includedir)
+-	headers=`echo $(PLUGIN_HEADERS) | tr ' ' '\012' | sort -u`; \
++	headers="$(sort $(PLUGIN_HEADERS))"; \
+ 	srcdirstrip=`echo "$(srcdir)" | sed 's/[].[^$$\\*|]/\\\\&/g'`; \
+ 	for file in $$headers; do \
+ 	  if [ -f $$file ] ; then \
+-- 
+1.7.10.2
+
-- 
1.7.7.6



