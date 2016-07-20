Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4314C6212F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 08:54:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6K8s32i015779
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 01:54:03 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 20 Jul 2016 01:54:02 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Jul 2016 16:51:34 +0800
Message-ID: <1469004694-15909-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] Make smartpm rpm5 support check signatures config.
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
X-List-Received-Date: Wed, 20 Jul 2016 08:54:04 -0000
Content-Type: text/plain

RPMv5 has removed support for _RPMVSF_NOSIGNATURES,
the flag can be replaced with a flags set:
"RPMVSF_NODSAHEADER|RPMVSF_NORSAHEADER|RPMVSF_NODSA
RPMVSF_NORSA"

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../python/python-smartpm/smartpm-rpm5-nodig.patch |  59 -----------
 .../smartpm-rpm5-support-check-signatures.patch    | 112 +++++++++++++++++++++
 meta/recipes-devtools/python/python-smartpm_git.bb |   2 +-
 3 files changed, 113 insertions(+), 60 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-smartpm/smartpm-rpm5-nodig.patch
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smartpm-rpm5-support-check-signatures.patch

diff --git a/meta/recipes-devtools/python/python-smartpm/smartpm-rpm5-nodig.patch b/meta/recipes-devtools/python/python-smartpm/smartpm-rpm5-nodig.patch
deleted file mode 100644
index fefb29a..0000000
--- a/meta/recipes-devtools/python/python-smartpm/smartpm-rpm5-nodig.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-RPM5 has removed support for RPMVSF_NOSIGNATURES
-
-Patch smart to no longer use this flag
-
-Upstream-Status: Pending
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-diff --git a/smart/backends/rpm/base.py b/smart/backends/rpm/base.py
---- a/smart/backends/rpm/base.py
-+++ b/smart/backends/rpm/base.py
-@@ -63,11 +63,11 @@ def getTS(new=False):
-         if sysconf.get("rpm-dbpath"):
-             rpm.addMacro('_dbpath', "/" + sysconf.get("rpm-dbpath"))
-         getTS.ts = rpm.ts(getTS.root)
--        if not sysconf.get("rpm-check-signatures", False):
--            if hasattr(rpm, '_RPMVSF_NOSIGNATURES'):
--                getTS.ts.setVSFlags(rpm._RPMVSF_NOSIGNATURES)
--            else:
--                raise Error, _("rpm requires checking signatures")
-+        #if not sysconf.get("rpm-check-signatures", False):
-+        #    if hasattr(rpm, '_RPMVSF_NOSIGNATURES'):
-+        #        getTS.ts.setVSFlags(rpm._RPMVSF_NOSIGNATURES)
-+        #    else:
-+        #        raise Error, _("rpm requires checking signatures")
-         rpm_dbpath = sysconf.get("rpm-dbpath", "var/lib/rpm")
-         dbdir = rpm_join_dbpath(getTS.root, rpm_dbpath)
-         if not os.path.isdir(dbdir):
-@@ -89,11 +89,11 @@ def getTS(new=False):
-         if sysconf.get("rpm-dbpath"):
-             rpm.addMacro('_dbpath', "/" + sysconf.get("rpm-dbpath"))
-         ts = rpm.ts(getTS.root)
--        if not sysconf.get("rpm-check-signatures", False):
--            if hasattr(rpm, '_RPMVSF_NOSIGNATURES'):
--                ts.setVSFlags(rpm._RPMVSF_NOSIGNATURES)
--            else:
--                raise Error, _("rpm requires checking signatures")
-+        #if not sysconf.get("rpm-check-signatures", False):
-+        #    if hasattr(rpm, '_RPMVSF_NOSIGNATURES'):
-+        #        ts.setVSFlags(rpm._RPMVSF_NOSIGNATURES)
-+        #    else:
-+        #        raise Error, _("rpm requires checking signatures")
-         return ts
-     else:
-         return getTS.ts
-diff --git a/smart/plugins/yumchannelsync.py b/smart/plugins/yumchannelsync.py
---- a/smart/plugins/yumchannelsync.py
-+++ b/smart/plugins/yumchannelsync.py
-@@ -56,8 +56,8 @@ def _getreleasever():
- 
-     rpmroot = sysconf.get("rpm-root", "/")
-     ts = rpmUtils.transaction.initReadOnlyTransaction(root=rpmroot)
--    if hasattr(rpm, '_RPMVSF_NOSIGNATURES') and hasattr(rpm, '_RPMVSF_NODIGESTS'):
--        ts.pushVSFlags(~(rpm._RPMVSF_NOSIGNATURES|rpm._RPMVSF_NODIGESTS))
-+    #if hasattr(rpm, '_RPMVSF_NOSIGNATURES') and hasattr(rpm, '_RPMVSF_NODIGESTS'):
-+    #    ts.pushVSFlags(~(rpm._RPMVSF_NOSIGNATURES|rpm._RPMVSF_NODIGESTS))
-     releasever = None
-     # HACK: we're hard-coding the most used distros, will add more if needed
-     idx = ts.dbMatch('provides', 'fedora-release')
diff --git a/meta/recipes-devtools/python/python-smartpm/smartpm-rpm5-support-check-signatures.patch b/meta/recipes-devtools/python/python-smartpm/smartpm-rpm5-support-check-signatures.patch
new file mode 100644
index 0000000..4067a90
--- /dev/null
+++ b/meta/recipes-devtools/python/python-smartpm/smartpm-rpm5-support-check-signatures.patch
@@ -0,0 +1,112 @@
+From 5b79e28bd70a0ec5b34c5ff19b66cbbdd1e48835 Mon Sep 17 00:00:00 2001
+From: Haiqing Bai <Haiqing.Bai@windriver.com>
+Date: Fri, 18 Mar 2016 13:34:07 +0800
+Subject: [PATCH] Make smartpm to support check signatures of rpmv5.
+
+The original support for 'rpm-check-signatures' has been
+disabled for the RPMv5 does not support '_RPMVSF_NOSIGNATURES'
+now. This fix replaces the '_RPMVSF_NOSIGNATURES' with
+rpm VS flags set:RPMVSF_NODSAHEADER|RPMVSF_NORSAHEADER|
+RPMVSF_NODSA|RPMVSF_NORSA.
+
+Upstream-Status: Pending
+Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
+---
+ smart/backends/rpm/base.py      | 43 +++++++++++++++++++++++++++++++----------
+ smart/backends/rpm/pm.py        |  2 +-
+ smart/plugins/yumchannelsync.py |  5 +++--
+ 3 files changed, 37 insertions(+), 13 deletions(-)
+
+diff --git a/smart/backends/rpm/base.py b/smart/backends/rpm/base.py
+index 85f4d49..dbd6165 100644
+--- a/smart/backends/rpm/base.py
++++ b/smart/backends/rpm/base.py
+@@ -63,11 +63,23 @@ def getTS(new=False):
+         if sysconf.get("rpm-dbpath"):
+             rpm.addMacro('_dbpath', "/" + sysconf.get("rpm-dbpath"))
+         getTS.ts = rpm.ts(getTS.root)
+-        if not sysconf.get("rpm-check-signatures", False):
+-            if hasattr(rpm, '_RPMVSF_NOSIGNATURES'):
+-                getTS.ts.setVSFlags(rpm._RPMVSF_NOSIGNATURES)
+-            else:
+-                raise Error, _("rpm requires checking signatures")
++
++        # _RPMVSF_NOSIGNATURES is not supported in RPMv5, so here uses
++        # RPMVSF_NODSAHEADER|RPMVSF_NORSAHEADER|RPMVSF_NODSA|RPMVSF_NORSA
++        # to replace '_RPMVSF_NOSIGNATURES' to continue to support check
++        # rpm signatures
++
++        #if not sysconf.get("rpm-check-signatures", False):
++        #    if hasattr(rpm, '_RPMVSF_NOSIGNATURES'):
++        #        getTS.ts.setVSFlags(rpm._RPMVSF_NOSIGNATURES)
++        #    else:
++        #        raise Error, _("rpm requires checking signatures")
++        if sysconf.get("rpm-check-signatures") == False:
++            getTS.ts.setVSFlags(rpm.RPMVSF_NODSAHEADER|rpm.RPMVSF_NORSAHEADER|\
++                                rpm.RPMVSF_NODSA|rpm.RPMVSF_NORSA)
++        else:
++            getTS.ts.setVSFlags(0)
++
+         rpm_dbpath = sysconf.get("rpm-dbpath", "var/lib/rpm")
+         dbdir = rpm_join_dbpath(getTS.root, rpm_dbpath)
+         if not os.path.isdir(dbdir):
+@@ -89,11 +101,22 @@ def getTS(new=False):
+         if sysconf.get("rpm-dbpath"):
+             rpm.addMacro('_dbpath', "/" + sysconf.get("rpm-dbpath"))
+         ts = rpm.ts(getTS.root)
+-        if not sysconf.get("rpm-check-signatures", False):
+-            if hasattr(rpm, '_RPMVSF_NOSIGNATURES'):
+-                ts.setVSFlags(rpm._RPMVSF_NOSIGNATURES)
+-            else:
+-                raise Error, _("rpm requires checking signatures")
++
++        # _RPMVSF_NOSIGNATURES is not supported in RPMv5, so here uses
++        # RPMVSF_NODSAHEADER|RPMVSF_NORSAHEADER|RPMVSF_NODSA|RPMVSF_NORSA
++        # to replace '_RPMVSF_NOSIGNATURES' to continue to support check
++        # rpm signatures
++
++        #if not sysconf.get("rpm-check-signatures", False):
++        #    if hasattr(rpm, '_RPMVSF_NOSIGNATURES'):
++        #        ts.setVSFlags(rpm._RPMVSF_NOSIGNATURES)
++        #    else:
++        #        raise Error, _("rpm requires checking signatures")
++        if sysconf.get("rpm-check-signatures") == False:
++            ts.setVSFlags(rpm.RPMVSF_NODSAHEADER|rpm.RPMVSF_NORSAHEADER|\
++                                rpm.RPMVSF_NODSA|rpm.RPMVSF_NORSA)
++        else:
++            ts.setVSFlags(0)
+         return ts
+     else:
+         return getTS.ts
+diff --git a/smart/backends/rpm/pm.py b/smart/backends/rpm/pm.py
+index b57a844..7b651b5 100644
+--- a/smart/backends/rpm/pm.py
++++ b/smart/backends/rpm/pm.py
+@@ -180,7 +180,7 @@ class RPMPackageManager(PackageManager):
+                 fd = os.open(path, os.O_RDONLY)
+                 try:
+                     h = ts.hdrFromFdno(fd)
+-                    if sysconf.get("rpm-check-signatures", False):
++                    if sysconf.get("rpm-check-signatures", True):
+                          if get_public_key(h) == '(none)':
+                              raise rpm.error('package is not signed')
+                 except rpm.error, e:
+diff --git a/smart/plugins/yumchannelsync.py b/smart/plugins/yumchannelsync.py
+index f8107e6..2dc5482 100644
+--- a/smart/plugins/yumchannelsync.py
++++ b/smart/plugins/yumchannelsync.py
+@@ -56,8 +56,9 @@ def _getreleasever():
+ 
+     rpmroot = sysconf.get("rpm-root", "/")
+     ts = rpmUtils.transaction.initReadOnlyTransaction(root=rpmroot)
+-    if hasattr(rpm, '_RPMVSF_NOSIGNATURES') and hasattr(rpm, '_RPMVSF_NODIGESTS'):
+-        ts.pushVSFlags(~(rpm._RPMVSF_NOSIGNATURES|rpm._RPMVSF_NODIGESTS))
++    #_RPMVSF_NOSIGNATURES is not supported in RPMv5
++    #if hasattr(rpm, '_RPMVSF_NOSIGNATURES') and hasattr(rpm, '_RPMVSF_NODIGESTS'):
++    #    ts.pushVSFlags(~(rpm._RPMVSF_NOSIGNATURES|rpm._RPMVSF_NODIGESTS))
+     releasever = None
+     # HACK: we're hard-coding the most used distros, will add more if needed
+     idx = ts.dbMatch('provides', 'fedora-release')
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/python/python-smartpm_git.bb b/meta/recipes-devtools/python/python-smartpm_git.bb
index d9fb271..81e45b7 100644
--- a/meta/recipes-devtools/python/python-smartpm_git.bb
+++ b/meta/recipes-devtools/python/python-smartpm_git.bb
@@ -13,7 +13,6 @@ SRCNAME = "smart"
 
 SRC_URI = "\
           git://github.com/smartpm/smart.git \
-          file://smartpm-rpm5-nodig.patch \
           file://smart-recommends.patch \
           file://smart-channelsdir.patch \
           file://smart-rpm-transaction-failure-check.patch \
@@ -25,6 +24,7 @@ SRC_URI = "\
           file://smart-cache.py-getPackages-matches-name-version.patch \
           file://smart-channel-remove-all.patch \
           file://smart-locale.patch \
+          file://smartpm-rpm5-support-check-signatures.patch \
          "
 
 SRCREV = "407a7eca766431257dcd1da15175cc36a1bb22d0"
-- 
2.8.1


