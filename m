Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 19C3B71711
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 17:17:04 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 30 Sep 2014 10:17:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,628,1406617200"; d="scan'208";a="607677680"
Received: from gmacartn-mobl.ger.corp.intel.com (HELO
	swold-linux.amr.corp.intel.com) ([10.255.13.44])
	by fmsmga002.fm.intel.com with ESMTP; 30 Sep 2014 10:16:56 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Sep 2014 10:16:53 -0700
Message-Id: <868d2927707863bd323972bc9179fd3c7b9156d1.1412095567.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1412095567.git.sgw@linux.intel.com>
References: <cover.1412095567.git.sgw@linux.intel.com>
In-Reply-To: <cover.1412095567.git.sgw@linux.intel.com>
References: <cover.1412095567.git.sgw@linux.intel.com>
Subject: [PATCH 3/5] python-smartpm: Add patches for rpm4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Sep 2014 17:17:09 -0000

Add DEPENDS for python-rpm package from either rpm4 or rpm5

Extend the smart-dflags patch to catch an exception if the api does exist

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../python/python-smartpm/smart-dflags.patch       | 53 ++++++++++++----------
 .../python/python-smartpm/smart-rpm4-fixes.patch   | 49 ++++++++++++++++++++
 .../python/python-smartpm_1.4.1.bb                 |  5 +-
 3 files changed, 81 insertions(+), 26 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-rpm4-fixes.patch

diff --git a/meta/recipes-devtools/python/python-smartpm/smart-dflags.patch b/meta/recipes-devtools/python/python-smartpm/smart-dflags.patch
index 3f27262..531ea51 100644
--- a/meta/recipes-devtools/python/python-smartpm/smart-dflags.patch
+++ b/meta/recipes-devtools/python/python-smartpm/smart-dflags.patch
@@ -7,34 +7,39 @@ Upstream-Status: Pending
 
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 
-diff --git a/smart/backends/rpm/pm.py b/smart/backends/rpm/pm.py
-index 707a146..aec82e7 100644
---- a/smart/backends/rpm/pm.py
-+++ b/smart/backends/rpm/pm.py
-@@ -106,6 +106,23 @@ class RPMPackageManager(PackageManager):
+[sgw - Added try/catch for rpm4 since it does not have setDFlags() API]
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+
+Index: smart-1.4.1/smart/backends/rpm/pm.py
+===================================================================
+--- smart-1.4.1.orig/smart/backends/rpm/pm.py
++++ smart-1.4.1/smart/backends/rpm/pm.py
+@@ -106,6 +106,26 @@ class RPMPackageManager(PackageManager):
              flags |= rpm.RPMTRANS_FLAG_TEST
          ts.setFlags(flags)
  
-+        dflags = ts.setDFlags(0)
-+        if sysconf.get("rpm-noupgrade", False):
-+            dflags |= rpm.RPMDEPS_FLAG_NOUPGRADE
-+        if sysconf.get("rpm-norequires", False):
-+            dflags |= rpm.RPMDEPS_FLAG_NOREQUIRES
-+        if sysconf.get("rpm-noconflicts", False):
-+            dflags |= rpm.RPMDEPS_FLAG_NOCONFLICTS
-+        if sysconf.get("rpm-noobsoletes", False):
-+            dflags |= rpm.RPMDEPS_FLAG_NOOBSOLETES
-+        if sysconf.get("rpm-noparentdirs", False):
-+            dflags |= rpm.RPMDEPS_FLAG_NOPARENTDIRS
-+        if sysconf.get("rpm-nolinktos", False):
-+            dflags |= rpm.RPMDEPS_FLAG_NOLINKTOS
-+        if sysconf.get("rpm-nosuggest", False):
-+            dflags |= rpm.RPMDEPS_FLAG_NOSUGGEST
-+        ts.setDFlags(dflags)
++        try:
++            dflags = ts.setDFlags(0)
++            if sysconf.get("rpm-noupgrade", False):
++                dflags |= rpm.RPMDEPS_FLAG_NOUPGRADE
++            if sysconf.get("rpm-norequires", False):
++                dflags |= rpm.RPMDEPS_FLAG_NOREQUIRES
++            if sysconf.get("rpm-noconflicts", False):
++                dflags |= rpm.RPMDEPS_FLAG_NOCONFLICTS
++            if sysconf.get("rpm-noobsoletes", False):
++                dflags |= rpm.RPMDEPS_FLAG_NOOBSOLETES
++            if sysconf.get("rpm-noparentdirs", False):
++                dflags |= rpm.RPMDEPS_FLAG_NOPARENTDIRS
++            if sysconf.get("rpm-nolinktos", False):
++                dflags |= rpm.RPMDEPS_FLAG_NOLINKTOS
++            if sysconf.get("rpm-nosuggest", False):
++                dflags |= rpm.RPMDEPS_FLAG_NOSUGGEST
++            ts.setDFlags(dflags)
++        except AttributeError, ae:
++            pass
 +
          # Set rpm verbosity level.
          levelname = sysconf.get('rpm-log-level')
          level = {
--- 
-1.7.9.5
-
diff --git a/meta/recipes-devtools/python/python-smartpm/smart-rpm4-fixes.patch b/meta/recipes-devtools/python/python-smartpm/smart-rpm4-fixes.patch
new file mode 100644
index 0000000..708ffe6
--- /dev/null
+++ b/meta/recipes-devtools/python/python-smartpm/smart-rpm4-fixes.patch
@@ -0,0 +1,49 @@
+
+This patch checks for rpm5 related functions in order to allow rpm4 
+to work correctly. Currently the rpm4 archscore and filter work
+differently enough that they need to be changed.
+
+Upstream-Status: Inappropriate [OE-Core Specific]
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: smart-1.4.1/smart/backends/rpm/base.py
+===================================================================
+--- smart-1.4.1.orig/smart/backends/rpm/base.py
++++ smart-1.4.1/smart/backends/rpm/base.py
+@@ -338,10 +338,14 @@ class RPMObsoletes(Depends):
+ 
+ _SCOREMAP = {}
+ def getArchScore(arch, _sm=_SCOREMAP):
+-    if arch not in _sm:
+-        score = rpm.archscore(arch)
+-        _sm[arch] = score
+-    return _sm.get(arch, 0)
++    try:
++        rpm.platformscore(arch)
++        if arch not in _sm:
++            score = rpm.archscore(arch)
++            _sm[arch] = score
++        return _sm.get(arch, 0)
++    except AttributeError:
++        return 1
+ 
+ # TODO: Embed color into nameprovides and obsoletes relations.
+ _COLORMAP = {"noarch": 0, "x86_64": 2, "ppc64": 2, "s390x": 2, "sparc64": 2}
+Index: smart-1.4.1/smart/backends/rpm/pm.py
+===================================================================
+--- smart-1.4.1.orig/smart/backends/rpm/pm.py
++++ smart-1.4.1/smart/backends/rpm/pm.py
+@@ -235,6 +235,12 @@ class RPMPackageManager(PackageManager):
+         if sysconf.get("rpm-order"):
+             ts.order()
+         probfilter = rpm.RPMPROB_FILTER_OLDPACKAGE
++        try:
++            # Test for RPM5 function
++            rpm.platformscore("")
++        except AttributeError:
++            probfilter |= rpm.RPMPROB_FILTER_IGNOREARCH
++
+         if force or reinstall:
+             probfilter |= rpm.RPMPROB_FILTER_REPLACEPKG
+             probfilter |= rpm.RPMPROB_FILTER_REPLACEOLDFILES
diff --git a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
index 0971579..f2eb33d 100644
--- a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
+++ b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
@@ -8,7 +8,7 @@ SECTION = "devel/python"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
 
-DEPENDS = "python rpm gettext-native"
+DEPENDS = "python rpm gettext-native python-rpm"
 PR = "r9"
 SRCNAME = "smart"
 
@@ -32,7 +32,8 @@ SRC_URI = "\
           file://smart-config-ignore-all-recommends.patch \
           file://smart-attempt.patch \
           file://smart-filename-NAME_MAX.patch \
-          "
+          file://smart-rpm4-fixes.patch \
+         "
 
 SRC_URI[md5sum] = "573ef32ba177a6b3c4bf7ef04873fcb6"
 SRC_URI[sha256sum] = "b1d519ddb43d60f293b065c28870a5d9e8b591cd49e8c68caea48ace91085eba"
-- 
1.8.3.1


