Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eflanagan@envy.jf.intel.com>) id 1ScmQS-00047r-3Q
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 01:47:36 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Jun 2012 16:37:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="149733198"
Received: from envy.jf.intel.com ([10.7.201.175])
	by orsmga001.jf.intel.com with ESMTP; 07 Jun 2012 16:37:04 -0700
Received: from envy.jf.intel.com (localhost [127.0.0.1])
	by envy.jf.intel.com (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id
	q57NbHcO006555 for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jun 2012 16:37:17 -0700
Received: (from eflanagan@localhost)
	by envy.jf.intel.com (8.14.4/8.14.4/Submit) id q57NbHWJ006554
	for openembedded-core@lists.openembedded.org;
	Thu, 7 Jun 2012 16:37:17 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jun 2012 16:37:01 -0700
Message-Id: <19bc0f08e5a5e9ef7f4287cacef2a9a78c74a7e2.1339111944.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <480358f458a7874b5705fc48547489d19a9df72c.1339111944.git.elizabeth.flanagan@intel.com>
References: <480358f458a7874b5705fc48547489d19a9df72c.1339111944.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1339111944.git.elizabeth.flanagan@intel.com>
References: <cover.1339111944.git.elizabeth.flanagan@intel.com>
Subject: [Consolidated Pull 13/22] gettext: install libgettextlib.a before removing it
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
X-List-Received-Date: Thu, 07 Jun 2012 23:47:36 -0000

From: Joe Slater <jslater@windriver.com>

In a multiple job build, Makefile can simultaneously
be installing and removing libgettextlib.a.  We serialize
the operations.

Signed-off-by: Joe Slater <jslater@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 .../gettext/gettext-0.18.1.1/parallel.patch        |   34 ++++++++++++++++++++
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    3 +-
 2 files changed, 36 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/gettext/gettext-0.18.1.1/parallel.patch

diff --git a/meta/recipes-core/gettext/gettext-0.18.1.1/parallel.patch b/meta/recipes-core/gettext/gettext-0.18.1.1/parallel.patch
new file mode 100644
index 0000000..4ca44cc
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-0.18.1.1/parallel.patch
@@ -0,0 +1,34 @@
+instal libgettextlib.a before removing it
+
+In a multiple job build, Makefile can simultaneously
+be installing and removing libgettextlib.a.  We serialize
+the operations.
+
+Signed-off-by: Joe Slater <jslater@windriver.com>
+
+--- a/gettext-tools/gnulib-lib/Makefile.am
++++ b/gettext-tools/gnulib-lib/Makefile.am
+@@ -57,6 +57,10 @@ endif
+ # Rules generated and collected by gnulib-tool.
+ include Makefile.gnulib
+ 
++# defined in Makefile.gnulib but missing this dependency
++#
++install-exec-clean: install-libLTLIBRARIES
++
+ # Which classes to export from the shared library.
+ MOOPPFLAGS += --dllexport=styled_ostream
+ 
+--- a/gettext-tools/src/Makefile.am
++++ b/gettext-tools/src/Makefile.am
+@@ -229,8 +229,8 @@ libgettextsrc_la_LDFLAGS += -Wl,--export
+ endif
+ 
+ # No need to install libgettextsrc.a, except on AIX.
+-install-exec-local: install-libLTLIBRARIES install-exec-clean
+-install-exec-clean:
++install-exec-local: install-exec-clean
++install-exec-clean: install-libLTLIBRARIES
+ 	case "@host_os@" in \
+ 	  aix*) ;; \
+ 	  *) $(RM) $(DESTDIR)$(libdir)/libgettextsrc.a ;; \
diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
index 5685bbe..253ea43 100644
--- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
@@ -5,13 +5,14 @@ SECTION = "libs"
 LICENSE = "GPLv3+ & LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r12"
+PR = "r13"
 DEPENDS = "libxml2-native gettext-native virtual/libiconv ncurses expat"
 DEPENDS_virtclass-native = "libxml2-native gettext-minimal-native"
 PROVIDES = "virtual/libintl virtual/gettext"
 PROVIDES_virtclass-native = "virtual/gettext-native"
 CONFLICTS_${PN} = "proxy-libintl"
 SRC_URI = "${GNU_MIRROR}/gettext/gettext-${PV}.tar.gz \
+	   file://parallel.patch \
           "
 
 SRC_URI_append_libc-uclibc = " file://wchar-uclibc.patch \
-- 
1.7.5.4



