Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RholI-0008H9-Sl
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jan 2012 21:45:41 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 Jan 2012 12:38:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="108039309"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga002.fm.intel.com with ESMTP; 02 Jan 2012 12:38:15 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 12:38:00 -0800
Message-Id: <f493f45734431d8fae09fdecf5b6cf0db02e1184.1325536389.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <0a113cb0a2defae38913df19d2bd3d6e378e370f.1325536389.git.nitin.a.kamble@intel.com>
References: <0a113cb0a2defae38913df19d2bd3d6e378e370f.1325536389.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1325536389.git.nitin.a.kamble@intel.com>
References: <cover.1325536389.git.nitin.a.kamble@intel.com>
Subject: [PATCH v2 04/15] rpm: fix build with automake-1.11.2
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
X-List-Received-Date: Mon, 02 Jan 2012 20:45:41 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

automake version 1.11.2 has made use of dir variables more strict.
the use of pkglibdir with SCRIPTS & DATA vars results in automake
errors.
  This commits uses pkgdatadir & pkgbindir vars instead of pkglibdir
to avoid the strict check errors.
  This change also works with automake-1.11.1

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../rpm/rpm/fix_for_automake_1.11.2.patch          |   54 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    3 +-
 2 files changed, 56 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/fix_for_automake_1.11.2.patch

diff --git a/meta/recipes-devtools/rpm/rpm/fix_for_automake_1.11.2.patch b/meta/recipes-devtools/rpm/rpm/fix_for_automake_1.11.2.patch
new file mode 100644
index 0000000..bb0f7eb
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/fix_for_automake_1.11.2.patch
@@ -0,0 +1,54 @@
+Upstream-Status: Pending
+
+automake version 1.11.2 has made use of dir variables more strict.
+the use of pkglibdir with SCRIPTS & DATA vars results in automake
+errors.
+  This commits uses pkgdatadir & pkgbindir vars instead of pkglibdir
+to avoid the strict check errors.
+
+  This change also works with automake-1.11.1
+
+Errors fixed:
+Makefile.am:103: error: `pkglibdir' is not a legitimate directory for `DATA'
+scripts/Makefile.am:47: error: `pkglibdir' is not a legitimate directory for `SCRIPTS'
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2011/12/27
+
+Index: rpm-5.4.0/Makefile.am
+===================================================================
+--- rpm-5.4.0.orig/Makefile.am
++++ rpm-5.4.0/Makefile.am
+@@ -103,13 +103,13 @@ if WITH_PATH_VERSIONED
+ 	done
+ endif
+ 
+-pkglibdir =		@USRLIBRPM@
+-pkglib_DATA = rpmpopt macros/macros macros/macros.rpmbuild cpuinfo.yaml
++pkgdatadir =		@USRLIBRPM@
++pkgdata_DATA = rpmpopt macros/macros macros/macros.rpmbuild cpuinfo.yaml
+ 
+-pkgbindir =	$(pkglibdir)/bin
++pkgbindir =	$(pkgdatadir)/bin
+ pkgbin_SCRIPTS = install-sh mkinstalldirs
+ 
+-pkgcfgdir =	$(pkglibdir)/macros.d
++pkgcfgdir =	$(pkgdatadir)/macros.d
+ pkgcfg_DATA = \
+ 	macros/cmake macros/java macros/libtool macros/mandriva macros/mono \
+ 	macros/perl macros/pkgconfig macros/php macros/python macros/ruby \
+Index: rpm-5.4.0/scripts/Makefile.am
+===================================================================
+--- rpm-5.4.0.orig/scripts/Makefile.am
++++ rpm-5.4.0/scripts/Makefile.am
+@@ -45,8 +45,8 @@ all:
+ 
+ bin_SCRIPTS = gendiff
+ 
+-pkglibdir =		@USRLIBRPM@
+-pkglib_SCRIPTS = \
++pkgbindir =		@USRLIBRPM@
++pkgbin_SCRIPTS = \
+ 	brp-compress brp-python-bytecompile brp-java-gcjcompile \
+ 	brp-strip brp-strip-comment-note brp-nobuildrootpath \
+ 	brp-strip-shared brp-strip-static-archive brp-sparc64-linux \
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.0.bb b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
index 122d3a9..34746c3 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
@@ -45,7 +45,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 DEPENDS = "bzip2 zlib db openssl elfutils expat libpcre attr acl popt ${extrarpmdeps}"
 extrarpmdeps = "python perl"
 extrarpmdeps_virtclass-native = "file-native"
-PR = "r27"
+PR = "r28"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -65,6 +65,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.0-0.20101229.src.rpm;ex
 	   file://rpm-canonarch.patch \
 	   file://rpm-no-loopmsg.patch \
 	   file://rpm-scriptletexechelper.patch \
+	   file://fix_for_automake_1.11.2.patch \
 	   file://pythondeps.sh \
 	  "
 
-- 
1.7.6.4



