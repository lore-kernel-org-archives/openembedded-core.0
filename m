Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrS-0004pi-Pu
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:39 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Jan 2012 22:21:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752268"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:10 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:20:08 -0800
Message-Id: <736804741e4eb715e5ae6ce8deb640155bb55cfe.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 082/113] systemtap: fix configure with automake 1.11.2
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:39 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

automake version 1.11.2 has made use of dir variables more strict.
The pkglibexec var can not have SCRIPTS suffix. Using pkgdata
instead.

Fixes this error:
| Makefile.am:25: `pkglibexecdir' is not a legitimate directory for
`SCRIPTS'
| autoreconf: automake failed with exit status: 1
| ERROR: autoreconf execution failed.
NOTE: package
systemtap-1.6+git1+820f2d22fc47fad6e09ba886efb9b91e1247cb39-r0: task
do_configure: Failed

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../systemtap/fix_for_automake_1.11.2.patch        |   46 ++++++++++++++++++++
 meta/recipes-kernel/systemtap/systemtap_git.bb     |    3 +-
 2 files changed, 48 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/fix_for_automake_1.11.2.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/fix_for_automake_1.11.2.patch b/meta/recipes-kernel/systemtap/systemtap/fix_for_automake_1.11.2.patch
new file mode 100644
index 0000000..99e72b2
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/fix_for_automake_1.11.2.patch
@@ -0,0 +1,46 @@
+Upstream-Status: Pending
+
+automake version 1.11.2 has made use of dir variables more strict.
+The pkglibexec var can not have SCRIPTS suffix. Using pkgdata
+instead.
+
+Fixes this error:
+| Makefile.am:25: `pkglibexecdir' is not a legitimate directory for `SCRIPTS'
+| autoreconf: automake failed with exit status: 1
+| ERROR: autoreconf execution failed.
+NOTE: package systemtap-1.6+git1+820f2d22fc47fad6e09ba886efb9b91e1247cb39-r0: task do_configure: Failed
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2011/12/29
+
+Index: git/Makefile.am
+===================================================================
+--- git.orig/Makefile.am
++++ git/Makefile.am
+@@ -22,7 +22,7 @@ dtrace.1 stap-merge.1\
+ stappaths.7
+ 
+ bin_SCRIPTS = stap-report
+-pkglibexec_SCRIPTS = stap-env
++pkgdata_SCRIPTS = stap-env
+ oldinclude_HEADERS = includes/sys/sdt.h includes/sys/sdt-config.h
+ 
+ bin_PROGRAMS =
+@@ -41,7 +41,7 @@ if BUILD_SERVER
+ man_MANS += stap-server.8
+ pkglibexec_PROGRAMS += stap-serverd stap-gen-cert
+ bin_SCRIPTS += stap-server
+-pkglibexec_SCRIPTS += stap-start-server stap-stop-server
++pkgdata_SCRIPTS += stap-start-server stap-stop-server
+ endif
+ endif
+ 
+@@ -127,7 +127,7 @@ install-scripts: install-binSCRIPTS inst
+ 	for f in $(bin_SCRIPTS); do \
+ 	   sed -i -e "s,\$${PKGLIBEXECDIR},$(pkglibexecdir)/," $(DESTDIR)$(bindir)/$$f; \
+ 	done
+-	for f in $(pkglibexec_SCRIPTS); do \
++	for f in $(pkgdata_SCRIPTS); do \
+ 	   sed -i -e "/INSTALL-HOOK/d;s,sysconfdir=.*,sysconfdir=$(sysconfdir),;s,pkglibexecdir=.*,pkglibexecdir=$(pkglibexecdir)/,;s,localstatedir=.*,localstatedir=$(localstatedir),;s,\$${PKGLIBEXECDIR},$(pkglibexecdir)/," $(DESTDIR)$(pkglibexecdir)/$$f; \
+ 	done
+ endif
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 732d9a7..1c64be6 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -5,10 +5,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "elfutils sqlite3"
 
 SRCREV = "820f2d22fc47fad6e09ba886efb9b91e1247cb39"
-PR = "r0"
+PR = "r1"
 PV = "1.6+git${SRCPV}"
 
 SRC_URI = "git://sources.redhat.com/git/systemtap.git;protocol=git \
+           file://fix_for_automake_1.11.2.patch \
           "
 
 EXTRA_OECONF += "--with-libelf=${STAGING_DIR_TARGET} --without-rpm \
-- 
1.7.6.4



