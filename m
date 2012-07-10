Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SoYsU-0000MP-DQ
	for Openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 13:45:14 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 10 Jul 2012 04:34:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="175472104"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by fmsmga001.fm.intel.com with ESMTP; 10 Jul 2012 04:34:03 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Tue, 10 Jul 2012 04:32:50 -0700
Message-Id: <ebafb70bbb98a32fca1b8504b81c32ceeff63066.1341917396.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <c20b9f6a19c4968bcda90dc23b6abf9f5f0051c3.1341917396.git.nitin.a.kamble@intel.com>
References: <c20b9f6a19c4968bcda90dc23b6abf9f5f0051c3.1341917396.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1341917396.git.nitin.a.kamble@intel.com>
References: <cover.1341917396.git.nitin.a.kamble@intel.com>
Subject: [PATCH 2/4] telepathy-python: fix build with automake 1.12
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
X-List-Received-Date: Tue, 10 Jul 2012 11:45:14 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Added a new patch:
	telepathy-python_fix_for_automake_1.12.patch

More comments in the patch header.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../telepathy-python_fix_for_automake_1.12.patch   |   26 ++++++++++++++++++++
 .../telepathy/telepathy-python_0.15.19.bb          |    5 ++-
 2 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/telepathy/telepathy-python-0.15.19/telepathy-python_fix_for_automake_1.12.patch

diff --git a/meta/recipes-connectivity/telepathy/telepathy-python-0.15.19/telepathy-python_fix_for_automake_1.12.patch b/meta/recipes-connectivity/telepathy/telepathy-python-0.15.19/telepathy-python_fix_for_automake_1.12.patch
new file mode 100644
index 0000000..f613fdc
--- /dev/null
+++ b/meta/recipes-connectivity/telepathy/telepathy-python-0.15.19/telepathy-python_fix_for_automake_1.12.patch
@@ -0,0 +1,26 @@
+Upstream-Status: Pending
+
+automake 1.12 has deprecated use of mkdir_p, and it recommends
+use of MKDIR_P instead. Changed the code to avoid these kind 
+of warning-errors.
+
+| make[1]: _generated/: Command not found
+| make[1]: *** [_generated/__init__.py] Error 127
+| make[1]: Leaving directory `/srv/home/nitin/builds2/build0/tmp/work/i586-poky-linux/telepathy-python-0.15.19-r4/telepathy-python-0.15.19/src'
+| make: *** [all-recursive] Error 1
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/07/10
+Index: telepathy-python-0.15.19/src/Makefile.am
+===================================================================
+--- telepathy-python-0.15.19.orig/src/Makefile.am
++++ telepathy-python-0.15.19/src/Makefile.am
+@@ -55,7 +55,7 @@ _generated/errors.py: _generated/__init_
+ 	    $(spec_dir)/all.xml
+ 
+ _generated/__init__.py:
+-	$(AM_V_GEN)$(mkdir_p) $(dir $@)
++	$(AM_V_GEN)$(MKDIR_P) $(dir $@)
+ 	@echo "# Placeholder for package" > $@
+ 
+ _generated/%.py: _generated/__init__.py $(tools_dir)/spec-to-python.xsl $(spec_dir)/%.xml
diff --git a/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb b/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
index 0113854..383e29a 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
@@ -8,9 +8,10 @@ RDEPENDS_${PN} += "python-dbus"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
            file://parallel_make.patch \
-           file://remove_duplicate_install.patch"
+           file://remove_duplicate_install.patch \
+           file://telepathy-python_fix_for_automake_1.12.patch"
 
-PR = "r4"
+PR = "r5"
 
 inherit autotools
 
-- 
1.7.3.4



