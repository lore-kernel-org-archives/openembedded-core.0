Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S266B-00027s-ES
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 20:19:03 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 27 Feb 2012 11:10:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122056439"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.37])
	by fmsmga001.fm.intel.com with ESMTP; 27 Feb 2012 11:10:33 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2012 11:10:23 -0800
Message-Id: <360c7cb99f46122c05d6ef100a24882c5a49b0f9.1330369680.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1330369680.git.sgw@linux.intel.com>
References: <cover.1330369680.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330369680.git.sgw@linux.intel.com>
References: <cover.1330369680.git.sgw@linux.intel.com>
Subject: [PATCH 05/13] psmisc: Update to version 22.16
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
X-List-Received-Date: Mon, 27 Feb 2012 19:19:03 -0000

Remove libintl-link patch which has in the upstream code now

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../psmisc/files/libintl-link.patch                |   32 --------------------
 meta/recipes-extended/psmisc/psmisc.inc            |    4 +-
 .../psmisc/{psmisc_22.14.bb => psmisc_22.16.bb}    |    4 +-
 3 files changed, 4 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-extended/psmisc/files/libintl-link.patch
 rename meta/recipes-extended/psmisc/{psmisc_22.14.bb => psmisc_22.16.bb} (46%)

diff --git a/meta/recipes-extended/psmisc/files/libintl-link.patch b/meta/recipes-extended/psmisc/files/libintl-link.patch
deleted file mode 100644
index e42592c..0000000
--- a/meta/recipes-extended/psmisc/files/libintl-link.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-Signed-off-by: Mei Lei <lei.mei@intel.com>
-
-uClibc needs to link against an external libintl but it doesn't do this by
-default. The configure script correctly figures out if this is needed, but
-doesn't actually link to the libraries it decides on. This makes it link to
-them if they are needed:
-
-Index: psmisc-22.14/src/Makefile.am
-===================================================================
---- psmisc-22.14.orig/src/Makefile.am	2011-06-20 04:59:44.000000000 -0700
-+++ psmisc-22.14/src/Makefile.am	2011-12-01 10:19:55.792680654 -0800
-@@ -26,15 +26,17 @@
- 
- fuser_SOURCES = fuser.c comm.h signals.c signals.h i18n.h fuser.h lists.h
- 
-+fuser_LDADD = @INTLLIBS@
-+
- killall_SOURCES = killall.c comm.h signals.c signals.h i18n.h
- 
--killall_LDADD = @SELINUX_LIB@
-+killall_LDADD = @SELINUX_LIB@ @INTLLIBS@
- 
- peekfd_SOURCES = peekfd.c
- 
- pstree_SOURCES = pstree.c comm.h i18n.h
- 
--pstree_LDADD = @TERMCAP_LIB@ @SELINUX_LIB@
-+pstree_LDADD = @TERMCAP_LIB@ @SELINUX_LIB@ @INTLLIBS@
- 
- prtstat_SOURCES = prtstat.c prtstat.h
- 
diff --git a/meta/recipes-extended/psmisc/psmisc.inc b/meta/recipes-extended/psmisc/psmisc.inc
index 9e281d5..4e9aad8 100644
--- a/meta/recipes-extended/psmisc/psmisc.inc
+++ b/meta/recipes-extended/psmisc/psmisc.inc
@@ -9,8 +9,8 @@ SECTION = "base"
 DEPENDS = "ncurses virtual/libintl"
 LICENSE = "GPLv2"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/psmisc/psmisc-${PV}.tar.gz \
-	   file://libintl-link.patch"
+SRC_URI = "${SOURCEFORGE_MIRROR}/psmisc/psmisc-${PV}.tar.gz"
+
 S = "${WORKDIR}/psmisc-${PV}"
 
 inherit autotools gettext
diff --git a/meta/recipes-extended/psmisc/psmisc_22.14.bb b/meta/recipes-extended/psmisc/psmisc_22.16.bb
similarity index 46%
rename from meta/recipes-extended/psmisc/psmisc_22.14.bb
rename to meta/recipes-extended/psmisc/psmisc_22.16.bb
index 4f89672..ac3bd28 100644
--- a/meta/recipes-extended/psmisc/psmisc_22.14.bb
+++ b/meta/recipes-extended/psmisc/psmisc_22.16.bb
@@ -3,5 +3,5 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 PR = "r0"
 
-SRC_URI[md5sum] = "ba3f4e971895c92bba7770d81c981503"
-SRC_URI[sha256sum] = "22bbf4561837af475c0d8d14e3b9cab453998c787212c107fac7faf2f281e26e"
+SRC_URI[md5sum] = "d52caf26159c905574c2ce4bd792b9ee"
+SRC_URI[sha256sum] = "ae426d7238e5353fdf51b1d313897c2bbed0023e66e5b4af2be9cd03d87a9d01"
-- 
1.7.7.6



