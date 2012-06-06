Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1ScHgL-0002GJ-2s
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 16:57:58 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q56ElTjB008586
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jun 2012 07:47:29 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 6 Jun 2012 07:47:28 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Jun 2012 09:53:16 -0500
Message-ID: <d09efc862755ce0e73de806ee2e3ce42443c7116.1338994308.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1338994308.git.mark.hatle@windriver.com>
References: <cover.1338994308.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 5/6] gettext: install libgettextlib.a before removing it
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
X-List-Received-Date: Wed, 06 Jun 2012 14:57:58 -0000
Content-Type: text/plain

From: Joe Slater <jslater@windriver.com>

In a multiple job build, Makefile can simultaneously
be installing and removing libgettextlib.a.  We serialize
the operations.

Signed-off-by: Joe Slater <jslater@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
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
1.7.3.4



