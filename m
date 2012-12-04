Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tfosu-000802-2T
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 10:33:48 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Dec 2012 01:18:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,214,1355126400"; d="scan'208";a="228661865"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga001.jf.intel.com with ESMTP; 04 Dec 2012 01:18:23 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Dec 2012 11:19:04 +0200
Message-Id: <c3f94e922c52d16bdf0be2b777a249bbd96a1dea.1354611254.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1354611254.git.constantinx.musca@intel.com>
References: <cover.1354611254.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1354611254.git.constantinx.musca@intel.com>
References: <cover.1354611254.git.constantinx.musca@intel.com>
Subject: [PATCH 4/5] lighttpd: upgrade to 1.4.32
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2012 09:33:48 -0000

lighttpd_fix_for_automake-1.12.patch: removed
- included in the new version

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../files/lighttpd_fix_for_automake-1.12.patch     | 37 ----------------------
 .../{lighttpd_1.4.31.bb => lighttpd_1.4.32.bb}     |  5 ++-
 2 files changed, 2 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-extended/lighttpd/files/lighttpd_fix_for_automake-1.12.patch
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.31.bb => lighttpd_1.4.32.bb} (90%)

diff --git a/meta/recipes-extended/lighttpd/files/lighttpd_fix_for_automake-1.12.patch b/meta/recipes-extended/lighttpd/files/lighttpd_fix_for_automake-1.12.patch
deleted file mode 100644
index 42451b8..0000000
--- a/meta/recipes-extended/lighttpd/files/lighttpd_fix_for_automake-1.12.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Upstream-Status: Pending
-
-This patch fixes following issue with automake 1.12
-
-| configure.ac:42: error: automatic de-ANSI-fication support has been removed
-...
-| automake: warnings are treated as errors
-| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: warning: 'liblightcomp.la': linking libtool libraries using a non-POSIX
-| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: archiver requires 'AM_PROG_AR' in 'configure.ac'
-
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/05/03
-
-Index: lighttpd-1.4.30/configure.ac
-===================================================================
---- lighttpd-1.4.30.orig/configure.ac
-+++ lighttpd-1.4.30/configure.ac
-@@ -24,6 +24,11 @@ dnl AC_PROG_CXX
- AC_PROG_LN_S
- AC_PROG_MAKE_SET
- 
-+# automake 1.12 seems to require this, but automake 1.11 doesn't recognize it
-+m4_pattern_allow([AM_PROG_AR])
-+AM_PROG_AR
-+
-+
- dnl check environment
- AC_AIX
- AC_ISC_POSIX
-@@ -39,7 +44,6 @@ AM_CONDITIONAL(NO_RDYNAMIC, test x$NO_RD
- AC_EXEEXT
- 
- dnl more automake stuff
--AM_C_PROTOTYPES
- 
- dnl libtool
- AC_DISABLE_STATIC
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.31.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb
similarity index 90%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.31.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb
index 6856f53..df6ce97 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.31.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb
@@ -22,11 +22,10 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
         file://index.html.lighttpd \
         file://lighttpd.conf \
         file://lighttpd \
-        file://lighttpd_fix_for_automake-1.12.patch \
         "
 
-SRC_URI[md5sum] = "c718cc27658240d307b8a1d1c7c4bb54"
-SRC_URI[sha256sum] = "5209e7a25d3044cb21b34d6a2bb3a6f6c216ba903ea486a803d070582e5e26ac"
+SRC_URI[md5sum] = "8e2d4ae8e918d4de1aeb9842584d170b"
+SRC_URI[sha256sum] = "60691b2dcf3ad2472c06b23d75eb0c164bf48a08a630ed3f308f61319104701f"
 
 EXTRA_OECONF = " \
              --without-bzip2 \
-- 
1.7.11.7



