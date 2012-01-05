Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RirGY-0007xF-QJ
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 18:38:15 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Jan 2012 09:30:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="92761369"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 05 Jan 2012 09:30:50 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 09:30:47 -0800
Message-Id: <029c2cbbb567e4f6e600e280706a990b487b1d55.1325784550.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <b34432a20f8269f81bc541aa4ca06aa4425f4a76.1325784550.git.nitin.a.kamble@intel.com>
References: <b34432a20f8269f81bc541aa4ca06aa4425f4a76.1325784550.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1325784550.git.nitin.a.kamble@intel.com>
References: <cover.1325784550.git.nitin.a.kamble@intel.com>
Subject: [PATCH 7/7] systemtap: remove not needed fix for automake 1.11.2
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
X-List-Received-Date: Thu, 05 Jan 2012 17:38:15 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The pkglibexec_SCRIPTS pair is valid. the 1.11.2 introduced an bug
to make it invalid. Now the automake 1.11.2 recipe is fixed, so
no need for this fix for systemtap recipe.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../systemtap/fix_for_automake_1.11.2.patch        |   46 --------------------
 meta/recipes-kernel/systemtap/systemtap_git.bb     |    6 +--
 2 files changed, 2 insertions(+), 50 deletions(-)
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/fix_for_automake_1.11.2.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/fix_for_automake_1.11.2.patch b/meta/recipes-kernel/systemtap/systemtap/fix_for_automake_1.11.2.patch
deleted file mode 100644
index 99e72b2..0000000
--- a/meta/recipes-kernel/systemtap/systemtap/fix_for_automake_1.11.2.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Upstream-Status: Pending
-
-automake version 1.11.2 has made use of dir variables more strict.
-The pkglibexec var can not have SCRIPTS suffix. Using pkgdata
-instead.
-
-Fixes this error:
-| Makefile.am:25: `pkglibexecdir' is not a legitimate directory for `SCRIPTS'
-| autoreconf: automake failed with exit status: 1
-| ERROR: autoreconf execution failed.
-NOTE: package systemtap-1.6+git1+820f2d22fc47fad6e09ba886efb9b91e1247cb39-r0: task do_configure: Failed
-
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-2011/12/29
-
-Index: git/Makefile.am
-===================================================================
---- git.orig/Makefile.am
-+++ git/Makefile.am
-@@ -22,7 +22,7 @@ dtrace.1 stap-merge.1\
- stappaths.7
- 
- bin_SCRIPTS = stap-report
--pkglibexec_SCRIPTS = stap-env
-+pkgdata_SCRIPTS = stap-env
- oldinclude_HEADERS = includes/sys/sdt.h includes/sys/sdt-config.h
- 
- bin_PROGRAMS =
-@@ -41,7 +41,7 @@ if BUILD_SERVER
- man_MANS += stap-server.8
- pkglibexec_PROGRAMS += stap-serverd stap-gen-cert
- bin_SCRIPTS += stap-server
--pkglibexec_SCRIPTS += stap-start-server stap-stop-server
-+pkgdata_SCRIPTS += stap-start-server stap-stop-server
- endif
- endif
- 
-@@ -127,7 +127,7 @@ install-scripts: install-binSCRIPTS inst
- 	for f in $(bin_SCRIPTS); do \
- 	   sed -i -e "s,\$${PKGLIBEXECDIR},$(pkglibexecdir)/," $(DESTDIR)$(bindir)/$$f; \
- 	done
--	for f in $(pkglibexec_SCRIPTS); do \
-+	for f in $(pkgdata_SCRIPTS); do \
- 	   sed -i -e "/INSTALL-HOOK/d;s,sysconfdir=.*,sysconfdir=$(sysconfdir),;s,pkglibexecdir=.*,pkglibexecdir=$(pkglibexecdir)/,;s,localstatedir=.*,localstatedir=$(localstatedir),;s,\$${PKGLIBEXECDIR},$(pkglibexecdir)/," $(DESTDIR)$(pkglibexecdir)/$$f; \
- 	done
- endif
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 1c64be6..ebacc43 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -5,12 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "elfutils sqlite3"
 
 SRCREV = "820f2d22fc47fad6e09ba886efb9b91e1247cb39"
-PR = "r1"
+PR = "r2"
 PV = "1.6+git${SRCPV}"
 
-SRC_URI = "git://sources.redhat.com/git/systemtap.git;protocol=git \
-           file://fix_for_automake_1.11.2.patch \
-          "
+SRC_URI = "git://sources.redhat.com/git/systemtap.git;protocol=git"
 
 EXTRA_OECONF += "--with-libelf=${STAGING_DIR_TARGET} --without-rpm \
 	     ac_cv_file__usr_include_nss=no \
-- 
1.7.6.4



