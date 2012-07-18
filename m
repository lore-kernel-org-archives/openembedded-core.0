Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrP5M-0004Vi-Si
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 09:54:17 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 Jul 2012 00:42:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="169736795"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.178])
	by azsmga001.ch.intel.com with ESMTP; 18 Jul 2012 00:42:57 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jul 2012 00:42:35 -0700
Message-Id: <cd9a97c063a6c58b022d95ca9de8bcce784f1d3a.1342597081.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <fee3def2ca49e3349758d9cd9a9cf5645f03cf18.1342597081.git.sgw@linux.intel.com>
References: <fee3def2ca49e3349758d9cd9a9cf5645f03cf18.1342597081.git.sgw@linux.intel.com>
In-Reply-To: <cover.1342597081.git.sgw@linux.intel.com>
References: <cover.1342597081.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 06/18] web-webkit: don't link using g++, it's not needed anymore
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
X-List-Received-Date: Wed, 18 Jul 2012 07:54:17 -0000

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../web/web-webkit/link-with-g++.patch             |   35 --------------------
 meta/recipes-sato/web/web-webkit_git.bb            |    9 +----
 2 files changed, 2 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-sato/web/web-webkit/link-with-g++.patch

diff --git a/meta/recipes-sato/web/web-webkit/link-with-g++.patch b/meta/recipes-sato/web/web-webkit/link-with-g++.patch
deleted file mode 100644
index e0c6784..0000000
--- a/meta/recipes-sato/web/web-webkit/link-with-g++.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-The main webkit library links against stdc++ so we need to use g++ for 
-linking. The easiest way to achieve this is to add a dummy cpp file.
-This also means we have to add AC_PROG_CXX else libtool 2.2.2 gets upset.
-
-RP - 14/4/08 
-
-Upstream-Status: Inappropriate [configuration]
-
---- webkit.orig/src/Makefile.am
-+++ webkit/src/Makefile.am
-@@ -1,11 +1,11 @@
- AM_CPPFLAGS=-DPKGDATADIR=\"$(pkgdatadir)\"
- AM_CFLAGS = -Wall -export-dynamic $(WEB_CFLAGS)
- 
- bin_PROGRAMS = web2
- 
--web2_SOURCES = web2.h web2-main.c web2-utils.c web2-utils.h
-+web2_SOURCES = web2.h web2-main.c web2-utils.c web2-utils.h dummy.cpp
- web2_LDADD   = $(WEB_LIBS)
- 
- MAINTAINERCLEANFILES = config.h.in Makefile.in
- 
- uidir = $(pkgdatadir)
-Index: webkit/configure.ac
-===================================================================
---- webkit.orig/configure.ac	2008-04-14 22:15:25.000000000 +0100
-+++ webkit/configure.ac	2008-04-14 22:16:31.000000000 +0100
-@@ -7,6 +7,7 @@
- 
- AC_ISC_POSIX
- AC_PROG_CC
-+AC_PROG_CXX
- AC_STDC_HEADERS
- AC_PROG_LIBTOOL
- 
diff --git a/meta/recipes-sato/web/web-webkit_git.bb b/meta/recipes-sato/web/web-webkit_git.bb
index dae7faf..0c79324 100644
--- a/meta/recipes-sato/web/web-webkit_git.bb
+++ b/meta/recipes-sato/web/web-webkit_git.bb
@@ -13,10 +13,9 @@ RRECOMMENDS_${PN} += "glib-networking"
 
 SRCREV = "b0676c190f876cbdb1df202fbcec42f212374503"
 PV = "0.1+git${SRCPV}"
-PR = "r1"
+PR = "r2"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
-           file://link-with-g++.patch"
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git"
 
 S = "${WORKDIR}/git"
 
@@ -24,8 +23,4 @@ EXTRA_OECONF = "--enable-libowl"
 
 inherit autotools pkgconfig
 
-do_configure_prepend() {
-    touch ${S}/src/dummy.cpp
-}
-
 FILES_${PN} += "${datadir}/web2"
-- 
1.7.7.6



