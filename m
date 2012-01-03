Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrP-0004fO-Ov
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:36 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Jan 2012 22:21:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752259"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:08 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:20:02 -0800
Message-Id: <a6c1b2c365dd8b576941b2946af2b76450baac19.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 076/113] avahi: fix configure with automake 1.11.2
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:37 -0000

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



