Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RholK-0008H9-9Q
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jan 2012 21:45:42 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 Jan 2012 12:38:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="108039314"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by fmsmga002.fm.intel.com with ESMTP; 02 Jan 2012 12:38:15 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 12:38:03 -0800
Message-Id: <05025150fb80328cf257363966f599ea25a89aa8.1325536389.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <0a113cb0a2defae38913df19d2bd3d6e378e370f.1325536389.git.nitin.a.kamble@intel.com>
References: <0a113cb0a2defae38913df19d2bd3d6e378e370f.1325536389.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1325536389.git.nitin.a.kamble@intel.com>
References: <cover.1325536389.git.nitin.a.kamble@intel.com>
Subject: [PATCH v2 07/15] avahi: fix configure with automake 1.11.2
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
X-List-Received-Date: Mon, 02 Jan 2012 20:45:42 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

automake version 1.11.2 has made use of dir variables more strict.
use of pkglibdir with DATA var results in automake errors.
  This commits uses pkgdatadir var instead of pkglibdir to avoid
the strict check errors.

Fixes this error:
service-type-database/Makefile.am:21: `pkglibdir' is not a legitimate
directory for `DATA'
autoreconf: automake failed with exit status: 1
ERROR: autoreconf execution failed.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-connectivity/avahi/avahi.inc          |    5 +-
 .../avahi/files/fix_for_automake_1.11.2.patch      |   44 ++++++++++++++++++++
 2 files changed, 47 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/avahi/files/fix_for_automake_1.11.2.patch

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index deebbd6..3cee1a4 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -14,14 +14,15 @@ SECTION = "network"
 # python scripts are under GPLv2+
 LICENSE = "GPLv2+ & LGPLv2.1+"
 
-INC_PR = "r10"
+INC_PR = "r11"
 
 DEPENDS = "expat libcap libdaemon dbus glib-2.0"
 
 SRC_URI = "http://avahi.org/download/avahi-${PV}.tar.gz \
           file://00avahi-autoipd \
           file://99avahi-autoipd \
-          file://initscript.patch"
+          file://initscript.patch \
+          file://fix_for_automake_1.11.2.patch"
 
 USERADD_PACKAGES = "avahi-daemon"
 USERADD_PARAM_avahi-daemon = "--system --home /var/run/avahi-daemon \
diff --git a/meta/recipes-connectivity/avahi/files/fix_for_automake_1.11.2.patch b/meta/recipes-connectivity/avahi/files/fix_for_automake_1.11.2.patch
new file mode 100644
index 0000000..e7a1908
--- /dev/null
+++ b/meta/recipes-connectivity/avahi/files/fix_for_automake_1.11.2.patch
@@ -0,0 +1,44 @@
+Upstream-Status: Pending
+
+automake version 1.11.2 has made use of dir variables more strict.
+the use of pkglibdir with DATA var results in automake errors.
+  This commits uses pkgdatadir var instead of pkglibdir to avoid 
+the strict check errors.
+
+Fixes this error:
+service-type-database/Makefile.am:21: `pkglibdir' is not a legitimate directory for `DATA'
+autoreconf: automake failed with exit status: 1
+ERROR: autoreconf execution failed.
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2011/12/28
+
+
+Index: avahi-0.6.30/service-type-database/Makefile.am
+===================================================================
+--- avahi-0.6.30.orig/service-type-database/Makefile.am
++++ avahi-0.6.30/service-type-database/Makefile.am
+@@ -18,13 +18,12 @@
+ EXTRA_DIST=build-db.in service-types
+ 
+ pkgdata_DATA=service-types
+-pkglib_DATA=
+ 
+ if HAVE_PYTHON
+ if HAVE_GDBM
+ 
+ noinst_SCRIPTS=build-db
+-pkglib_DATA+=service-types.db
++pkgdata_DATA+=service-types.db
+ 
+ build-db: build-db.in
+ 	$(AM_V_GEN)sed -e 's,@PYTHON\@,$(PYTHON),g' \
+@@ -41,7 +40,7 @@ endif
+ if HAVE_DBM
+ 
+ noinst_SCRIPTS=build-db
+-pkglib_DATA+=service-types.db.pag service-types.db.dir
++pkgdata_DATA+=service-types.db.pag service-types.db.dir
+ 
+ build-db: build-db.in
+ 	$(AM_V_GEN)sed -e 's,@PYTHON\@,$(PYTHON),g' \
-- 
1.7.6.4



