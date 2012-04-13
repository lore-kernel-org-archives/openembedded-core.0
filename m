Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1SImkJ-0001kz-1C
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 22:05:27 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 13 Apr 2012 12:56:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="129230432"
Received: from unknown (HELO localhost) ([10.255.12.66])
	by orsmga001.jf.intel.com with ESMTP; 13 Apr 2012 12:56:04 -0700
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Apr 2012 14:56:02 -0500
Message-Id: <e1cc1d55074d9755f1e7e20a3b07718b40cb9515.1334346682.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1334346682.git.tom.zanussi@intel.com>
References: <cover.1334346682.git.tom.zanussi@intel.com>
Subject: [PATCH 1/2] systemtap: fix docproc build error
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
X-List-Received-Date: Fri, 13 Apr 2012 20:05:27 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

When building docs in systemtap, docproc is used to generate the
tapset documentation, but it gets built for the target, while it needs
to be build for the host instead.  This change causes that to happen.

Fixes [YOCTO #2193].

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
---
 .../systemtap/systemtap/docproc-build-fix.patch    |   19 +++++++++++++++++++
 meta/recipes-kernel/systemtap/systemtap_git.bb     |    6 +++++-
 meta/recipes-kernel/systemtap/systemtap_git.inc    |    4 +++-
 3 files changed, 27 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/docproc-build-fix.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/docproc-build-fix.patch b/meta/recipes-kernel/systemtap/systemtap/docproc-build-fix.patch
new file mode 100644
index 0000000..33a8994
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/docproc-build-fix.patch
@@ -0,0 +1,19 @@
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
+
+Index: git/doc/SystemTap_Tapset_Reference/Makefile.am
+===================================================================
+--- git.orig/doc/SystemTap_Tapset_Reference/Makefile.am	2012-04-13 08:43:46.263339003 -0500
++++ git/doc/SystemTap_Tapset_Reference/Makefile.am	2012-04-13 09:31:22.470083915 -0500
+@@ -27,6 +27,10 @@
+ noinst_PROGRAMS = docproc
+ SRCTREE=$(abs_top_srcdir)/
+ DOCPROC=$(abs_builddir)/docproc
++docproc_LINK = $(CC_FOR_BUILD) $(LDFLAGS_FOR_BUILD) -o $@
++
++docproc.o: $(srcdir)/docproc.c
++	$(CC_FOR_BUILD) -c $(CFLAGS_FOR_BUILD) -o $@ $(srcdir)/docproc.c
+ 
+ all: $(PDFDOCS) stamp-htmldocs stamp-mandocs
+ tapsets.xml: docproc $(shell find $(SRCTREE)/tapset -name '*.stp')
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index c4a9d87..1d2c9f3 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -6,7 +6,11 @@ DEPENDS = "elfutils sqlite3 systemtap-native"
 DEPENDS_virtclass-native = "elfutils-native sqlite3-native gettext-native"
 DEPENDS_virtclass-nativesdk = "elfutils-nativesdk sqlite3-nativesdk gettext-nativesdk"
 
-PR = "r2"
+PR = "r3"
+
+export CC_FOR_BUILD = "${BUILD_CC}"
+export CFLAGS_FOR_BUILD = "${BUILD_CFLAGS}"
+export LDFLAGS_FOR_BUILD = "${BUILD_LDFLAGS}"
 
 EXTRA_OECONF += "--with-libelf=${STAGING_DIR_TARGET} --without-rpm \
 	     ac_cv_file__usr_include_nss=no \
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index cc250ff..c4d6e34 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -4,7 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRCREV = "83bd2699d8cff2f2d6b9eaf5ea254e4cb6b33e81"
 PV = "1.7+git${SRCPV}"
 
-SRC_URI = "git://sources.redhat.com/git/systemtap.git;protocol=git"
+SRC_URI = "git://sources.redhat.com/git/systemtap.git;protocol=git \
+           file://docproc-build-fix.patch \
+          "
 
 SRC_URI[md5sum]    = "cb202866ed704c44a876d041f788bdee"
 SRC_URI[sha256sum] = "8ffe35caec0d937bd23fd78a3a8d94b58907cc0de0330b35e38f9f764815c459"
-- 
1.7.0.4



