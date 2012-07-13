Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SpbBs-0006qR-IC
	for Openembedded-core@lists.openembedded.org;
	Fri, 13 Jul 2012 10:25:32 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 13 Jul 2012 01:14:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="121896850"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Jul 2012 01:14:17 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Fri, 13 Jul 2012 01:12:57 -0700
Message-Id: <a832d221b3450f7caf565bbd23135ea7cc808f08.1342167069.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <575ff760b303fcbf2a8f41a557451d1937d44112.1342167069.git.nitin.a.kamble@intel.com>
References: <575ff760b303fcbf2a8f41a557451d1937d44112.1342167069.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1342167069.git.nitin.a.kamble@intel.com>
References: <cover.1342167069.git.nitin.a.kamble@intel.com>
Subject: [PATCH 2/3] sed-4.1.2: fix build with automake 1.12.x
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
X-List-Received-Date: Fri, 13 Jul 2012 08:25:32 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

automake has depricated use of @mkdir_p@, Fix the
issue by using @MKDIR_P@ instead.

added a new patch:
   sed-4.1.2_fix_for_automake-1.12.patch

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../sed-4.1.2_fix_for_automake-1.12.patch          |   37 ++++++++++++++++++++
 meta/recipes-extended/sed/sed_4.1.2.bb             |    5 ++-
 2 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/sed/sed-4.1.2/sed-4.1.2_fix_for_automake-1.12.patch

diff --git a/meta/recipes-extended/sed/sed-4.1.2/sed-4.1.2_fix_for_automake-1.12.patch b/meta/recipes-extended/sed/sed-4.1.2/sed-4.1.2_fix_for_automake-1.12.patch
new file mode 100644
index 0000000..8059406
--- /dev/null
+++ b/meta/recipes-extended/sed/sed-4.1.2/sed-4.1.2_fix_for_automake-1.12.patch
@@ -0,0 +1,37 @@
+Upstream-Status: Pending
+
+automake-1.12.x has deprecated use of @mkdir_p@, fix the issue by using @MKDIR_P@ instead.
+
+Avoid this build issue:
+| make[1]: mkdir_p@: Command not found
+| make[1]: *** [install-data-yes] Error 127
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/07/13
+
+Index: sed-4.1.2/intl/Makefile.in
+===================================================================
+--- sed-4.1.2.orig/intl/Makefile.in
++++ sed-4.1.2/intl/Makefile.in
+@@ -40,7 +40,7 @@ subdir = intl
+ INSTALL = @INSTALL@
+ INSTALL_DATA = @INSTALL_DATA@
+ mkinstalldirs = $(mkdir_p)
+-mkdir_p = @mkdir_p@
++mkdir_p = @MKDIR_P@
+ 
+ l = @INTL_LIBTOOL_SUFFIX_PREFIX@
+ 
+Index: sed-4.1.2/po/Makefile.in.in
+===================================================================
+--- sed-4.1.2.orig/po/Makefile.in.in
++++ sed-4.1.2/po/Makefile.in.in
+@@ -29,7 +29,7 @@ gettextsrcdir = $(datadir)/gettext/po
+ INSTALL = /srv/home/nitin/builds2/build0/tmp/sysroots/x86_64-linux/usr/bin/install -c
+ INSTALL_DATA = ${INSTALL} -m 644
+ mkinstalldirs = $(mkdir_p)
+-mkdir_p = @mkdir_p@
++mkdir_p = @MKDIR_P@
+ 
+ CC = i586-poky-linux-gcc  -m32   -march=i586 --sysroot=/srv/home/nitin/builds2/build0/tmp/sysroots/qemux86
+ GMSGFMT = /srv/home/nitin/builds2/build0/tmp/sysroots/x86_64-linux/usr/bin/msgfmt
diff --git a/meta/recipes-extended/sed/sed_4.1.2.bb b/meta/recipes-extended/sed/sed_4.1.2.bb
index ca22736..3455c20 100644
--- a/meta/recipes-extended/sed/sed_4.1.2.bb
+++ b/meta/recipes-extended/sed/sed_4.1.2.bb
@@ -4,10 +4,11 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://sed/sed.h;beginline=1;endline=17;md5=e00ffd1837f298439a214fd197f6a407"
 SECTION = "console/utils"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "${GNU_MIRROR}/sed/sed-${PV}.tar.gz \
-           file://fix_return_type.patch"
+           file://fix_return_type.patch \
+           file://sed-4.1.2_fix_for_automake-1.12.patch "
 
 SRC_URI[md5sum] = "928f0e06422f414091917401f1a834d0"
 SRC_URI[sha256sum] = "638e837ba765d5da0a30c98b57c2953cecea96827882f594612acace93ceeeab"
-- 
1.7.3.4



