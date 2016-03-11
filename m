Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 27463731DD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 14:07:44 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 11 Mar 2016 06:07:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,320,1455004800"; d="scan'208";a="921777275"
Received: from jlock-mobl1.gar.corp.intel.com (HELO
	jlock-mobl.gar.corp.intel.com) ([10.252.4.28])
	by fmsmga001.fm.intel.com with ESMTP; 11 Mar 2016 06:07:43 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Mar 2016 14:07:30 +0000
Message-Id: <bd14ed05261b6845bda66a1789a05e47842c3c02.1457705106.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1457705106.git.joshua.g.lock@intel.com>
References: <cover.1457705106.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1457705106.git.joshua.g.lock@intel.com>
References: <cover.1457705106.git.joshua.g.lock@intel.com>
Subject: [RFC PATCH 2/3] smartpm: remove rpm4 patch
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
X-List-Received-Date: Fri, 11 Mar 2016 14:07:47 -0000

The RPM4 support we added to SMART doesn't appear to work, remove
it as part of the removal of RPM4 from OE-Core.

Refresh the smart-add-for-rpm-ignoresize-check.patch which was
applied after smart-rpm4-fixes.patch and doesn't apply cleanly once
that patch is removed.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 .../smart-add-for-rpm-ignoresize-check.patch       | 20 ++++-----
 .../python/python-smartpm/smart-rpm4-fixes.patch   | 49 ----------------------
 meta/recipes-devtools/python/python-smartpm_git.bb |  1 -
 3 files changed, 9 insertions(+), 61 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-rpm4-fixes.patch

diff --git a/meta/recipes-devtools/python/python-smartpm/smart-add-for-rpm-ignoresize-check.patch b/meta/recipes-devtools/python/python-smartpm/smart-add-for-rpm-ignoresize-check.patch
index 8a27f25..fe98d07 100644
--- a/meta/recipes-devtools/python/python-smartpm/smart-add-for-rpm-ignoresize-check.patch
+++ b/meta/recipes-devtools/python/python-smartpm/smart-add-for-rpm-ignoresize-check.patch
@@ -17,14 +17,15 @@ Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
  smart/backends/rpm/pm.py | 4 ++++
  1 file changed, 4 insertions(+)
 
-diff --git a/smart/backends/rpm/pm.py b/smart/backends/rpm/pm.py
-index 5da9ee6..f0488ec 100644
---- a/smart/backends/rpm/pm.py
-+++ b/smart/backends/rpm/pm.py
-@@ -241,6 +241,10 @@ class RPMPackageManager(PackageManager):
-         except AttributeError:
-             probfilter |= rpm.RPMPROB_FILTER_IGNOREARCH
- 
+Index: git/smart/backends/rpm/pm.py
+===================================================================
+--- git.orig/smart/backends/rpm/pm.py
++++ git/smart/backends/rpm/pm.py
+@@ -233,6 +233,11 @@ class RPMPackageManager(PackageManager):
+         if sysconf.get("rpm-order"):
+             ts.order()
+         probfilter = rpm.RPMPROB_FILTER_OLDPACKAGE
++
 +        if sysconf.get("rpm-ignoresize", False):
 +            probfilter |= rpm.RPMPROB_FILTER_DISKNODES
 +            probfilter |= rpm.RPMPROB_FILTER_DISKSPACE
@@ -32,6 +33,3 @@ index 5da9ee6..f0488ec 100644
          if force or reinstall:
              probfilter |= rpm.RPMPROB_FILTER_REPLACEPKG
              probfilter |= rpm.RPMPROB_FILTER_REPLACEOLDFILES
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/python/python-smartpm/smart-rpm4-fixes.patch b/meta/recipes-devtools/python/python-smartpm/smart-rpm4-fixes.patch
deleted file mode 100644
index 708ffe6..0000000
--- a/meta/recipes-devtools/python/python-smartpm/smart-rpm4-fixes.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-
-This patch checks for rpm5 related functions in order to allow rpm4 
-to work correctly. Currently the rpm4 archscore and filter work
-differently enough that they need to be changed.
-
-Upstream-Status: Inappropriate [OE-Core Specific]
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: smart-1.4.1/smart/backends/rpm/base.py
-===================================================================
---- smart-1.4.1.orig/smart/backends/rpm/base.py
-+++ smart-1.4.1/smart/backends/rpm/base.py
-@@ -338,10 +338,14 @@ class RPMObsoletes(Depends):
- 
- _SCOREMAP = {}
- def getArchScore(arch, _sm=_SCOREMAP):
--    if arch not in _sm:
--        score = rpm.archscore(arch)
--        _sm[arch] = score
--    return _sm.get(arch, 0)
-+    try:
-+        rpm.platformscore(arch)
-+        if arch not in _sm:
-+            score = rpm.archscore(arch)
-+            _sm[arch] = score
-+        return _sm.get(arch, 0)
-+    except AttributeError:
-+        return 1
- 
- # TODO: Embed color into nameprovides and obsoletes relations.
- _COLORMAP = {"noarch": 0, "x86_64": 2, "ppc64": 2, "s390x": 2, "sparc64": 2}
-Index: smart-1.4.1/smart/backends/rpm/pm.py
-===================================================================
---- smart-1.4.1.orig/smart/backends/rpm/pm.py
-+++ smart-1.4.1/smart/backends/rpm/pm.py
-@@ -235,6 +235,12 @@ class RPMPackageManager(PackageManager):
-         if sysconf.get("rpm-order"):
-             ts.order()
-         probfilter = rpm.RPMPROB_FILTER_OLDPACKAGE
-+        try:
-+            # Test for RPM5 function
-+            rpm.platformscore("")
-+        except AttributeError:
-+            probfilter |= rpm.RPMPROB_FILTER_IGNOREARCH
-+
-         if force or reinstall:
-             probfilter |= rpm.RPMPROB_FILTER_REPLACEPKG
-             probfilter |= rpm.RPMPROB_FILTER_REPLACEOLDFILES
diff --git a/meta/recipes-devtools/python/python-smartpm_git.bb b/meta/recipes-devtools/python/python-smartpm_git.bb
index 139bfd5..d9a908d 100644
--- a/meta/recipes-devtools/python/python-smartpm_git.bb
+++ b/meta/recipes-devtools/python/python-smartpm_git.bb
@@ -19,7 +19,6 @@ SRC_URI = "\
           file://smart-channelsdir.patch \
           file://smart-attempt.patch \
           file://smart-attempt-fix.patch \
-          file://smart-rpm4-fixes.patch \
           file://smart-add-for-rpm-ignoresize-check.patch \
           file://smart-already-installed-message.patch \
           file://smart-set-noprogress-for-pycurl.patch \
-- 
2.5.0


