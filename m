Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrP-0004lf-1z
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:35 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Jan 2012 22:21:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752253"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:07 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:19:59 -0800
Message-Id: <f4e1e8d81618a93f119ab4984787fb2d721905c3.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 073/113] rpm: fix build with automake-1.11.2
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:35 -0000

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
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    1 +
 2 files changed, 55 insertions(+), 0 deletions(-)
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
index aae59ec..bbc404f 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.0.bb
@@ -66,6 +66,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.0-0.20101229.src.rpm;ex
 	   file://rpm-canonarch.patch \
 	   file://rpm-no-loopmsg.patch \
 	   file://rpm-scriptletexechelper.patch \
+	   file://fix_for_automake_1.11.2.patch \
 	   file://pythondeps.sh \
 	  "
 
-- 
1.7.6.4



