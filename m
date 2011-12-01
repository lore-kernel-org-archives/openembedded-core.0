Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RWGUy-0007bT-AY
	for openembedded-core@openembedded.org; Fri, 02 Dec 2011 00:57:04 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 Dec 2011 15:50:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,281,1320652800"; d="scan'208";a="81299153"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by azsmga001.ch.intel.com with ESMTP; 01 Dec 2011 15:50:19 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Thu,  1 Dec 2011 15:50:14 -0800
Message-Id: <a21979bc80c97b20c7c9287ab601cd5838571e51.1322783370.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322783370.git.sgw@linux.intel.com>
References: <cover.1322783370.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322783370.git.sgw@linux.intel.com>
References: <cover.1322783370.git.sgw@linux.intel.com>
Subject: [PATCH 2/6] psmisc: Update to 22.14
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
X-List-Received-Date: Thu, 01 Dec 2011 23:57:04 -0000

 * Create psmisc-extras for unpackaged binaries
 * rebase patch
 * set LICENSE to GPLv2

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../psmisc/files/libintl-link.patch                |   22 ++++++++++---------
 meta/recipes-extended/psmisc/psmisc.inc            |    8 +++++-
 .../psmisc/{psmisc_22.13.bb => psmisc_22.14.bb}    |    6 ++--
 3 files changed, 21 insertions(+), 15 deletions(-)
 rename meta/recipes-extended/psmisc/{psmisc_22.13.bb => psmisc_22.14.bb} (42%)

diff --git a/meta/recipes-extended/psmisc/files/libintl-link.patch b/meta/recipes-extended/psmisc/files/libintl-link.patch
index 698d98a..e42592c 100644
--- a/meta/recipes-extended/psmisc/files/libintl-link.patch
+++ b/meta/recipes-extended/psmisc/files/libintl-link.patch
@@ -6,25 +6,27 @@ default. The configure script correctly figures out if this is needed, but
 doesn't actually link to the libraries it decides on. This makes it link to
 them if they are needed:
 
---- psmisc-22.13/src/Makefile.am
-+++ psmisc-22.13/src/Makefile.am
-@@ -25,16 +25,17 @@ endif
+Index: psmisc-22.14/src/Makefile.am
+===================================================================
+--- psmisc-22.14.orig/src/Makefile.am	2011-06-20 04:59:44.000000000 -0700
++++ psmisc-22.14/src/Makefile.am	2011-12-01 10:19:55.792680654 -0800
+@@ -26,15 +26,17 @@
  
+ fuser_SOURCES = fuser.c comm.h signals.c signals.h i18n.h fuser.h lists.h
  
- fuser_SOURCES = fuser.c comm.h signals.c signals.h i18n.h fuser.h
 +fuser_LDADD = @INTLLIBS@
-
++
  killall_SOURCES = killall.c comm.h signals.c signals.h i18n.h
-
+ 
 -killall_LDADD = @SELINUX_LIB@
 +killall_LDADD = @SELINUX_LIB@ @INTLLIBS@
-
+ 
  peekfd_SOURCES = peekfd.c
-
+ 
  pstree_SOURCES = pstree.c comm.h i18n.h
-
+ 
 -pstree_LDADD = @TERMCAP_LIB@ @SELINUX_LIB@
 +pstree_LDADD = @TERMCAP_LIB@ @SELINUX_LIB@ @INTLLIBS@
-
+ 
  prtstat_SOURCES = prtstat.c prtstat.h
  
diff --git a/meta/recipes-extended/psmisc/psmisc.inc b/meta/recipes-extended/psmisc/psmisc.inc
index 77047cc..9e281d5 100644
--- a/meta/recipes-extended/psmisc/psmisc.inc
+++ b/meta/recipes-extended/psmisc/psmisc.inc
@@ -1,4 +1,3 @@
-LICENSE = "GPL"
 SUMMARY = "Utilities for managing processes on your system"
 DESCRIPTION = "The psmisc package contains utilities for managing processes on your \
 system: pstree, killall and fuser.  The pstree command displays a tree \
@@ -8,6 +7,7 @@ processes identified by name.  The fuser command identifies the PIDs \
 of processes that are using specified files or filesystems."
 SECTION = "base"
 DEPENDS = "ncurses virtual/libintl"
+LICENSE = "GPLv2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/psmisc/psmisc-${PV}.tar.gz \
 	   file://libintl-link.patch"
@@ -17,7 +17,8 @@ inherit autotools gettext
 
 ALLOW_EMPTY = "1"
 
-PACKAGES =+ "fuser fuser-doc killall killall-doc pstree pstree-doc "
+PACKAGES =+ "fuser fuser-doc killall killall-doc pstree pstree-doc"
+PACKAGES += "psmisc-extras"
 
 FILES_${PN} = ""
 RDEPENDS_${PN} = "fuser killall pstree"
@@ -31,6 +32,9 @@ FILES_killall-doc = "${mandir}/man1/killall*"
 FILES_pstree = "${bindir}/pstree"
 FILES_pstree-doc = "${mandir}/man1/pstree*"
 
+FILES_psmisc-extras = "${bindir}"
+FILES_psmisc-extras-doc = "${mandir}"
+
 do_install_append() {
 	mv ${D}${bindir}/killall ${D}${bindir}/killall.${PN}
 	mv ${D}${bindir}/fuser ${D}${bindir}/fuser.${PN}
diff --git a/meta/recipes-extended/psmisc/psmisc_22.13.bb b/meta/recipes-extended/psmisc/psmisc_22.14.bb
similarity index 42%
rename from meta/recipes-extended/psmisc/psmisc_22.13.bb
rename to meta/recipes-extended/psmisc/psmisc_22.14.bb
index 757e097..4f89672 100644
--- a/meta/recipes-extended/psmisc/psmisc_22.13.bb
+++ b/meta/recipes-extended/psmisc/psmisc_22.14.bb
@@ -1,7 +1,7 @@
 require psmisc.inc
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
-PR = "r1"
+PR = "r0"
 
-SRC_URI[md5sum] = "e2c339e6b65b730042084023784a729e"
-SRC_URI[sha256sum] = "06d25e8ebb4722dbcede98a787c39a9ed341f8e58fde10c0b2d6b35990b35daa"
+SRC_URI[md5sum] = "ba3f4e971895c92bba7770d81c981503"
+SRC_URI[sha256sum] = "22bbf4561837af475c0d8d14e3b9cab453998c787212c107fac7faf2f281e26e"
-- 
1.7.6.4



