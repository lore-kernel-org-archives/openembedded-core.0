Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 812FE781FD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 13:59:13 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jun 2017 06:59:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,364,1493708400"; d="scan'208";a="1162599810"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 20 Jun 2017 06:59:12 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Jun 2017 16:56:24 +0300
Message-Id: <20170620135624.15549-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170620135624.15549-1-alexander.kanavin@linux.intel.com>
References: <20170620135624.15549-1-alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 2/2] dnf: update to 2.5.1
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
X-List-Received-Date: Tue, 20 Jun 2017 13:59:14 -0000

Drop 0001-Revert-proper-check-of-releasever-when-using-install.patch
as the problem has been solved upstream.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...er-check-of-releasever-when-using-install.patch | 105 ---------------------
 .../dnf/{dnf_git.bb => dnf_2.5.1.bb}               |   4 +-
 2 files changed, 1 insertion(+), 108 deletions(-)
 delete mode 100644 meta/recipes-devtools/dnf/dnf/0001-Revert-proper-check-of-releasever-when-using-install.patch
 rename meta/recipes-devtools/dnf/{dnf_git.bb => dnf_2.5.1.bb} (94%)

diff --git a/meta/recipes-devtools/dnf/dnf/0001-Revert-proper-check-of-releasever-when-using-install.patch b/meta/recipes-devtools/dnf/dnf/0001-Revert-proper-check-of-releasever-when-using-install.patch
deleted file mode 100644
index 879ecfa30d7..00000000000
--- a/meta/recipes-devtools/dnf/dnf/0001-Revert-proper-check-of-releasever-when-using-install.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-From 8cd0503612573c455f34db74cd1c2216ed25b69c Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 12 Apr 2017 15:42:06 +0300
-Subject: [PATCH] Revert "proper check of releasever, when using installroot
- (RhBug:1417542)"
-
-This reverts commit 3ddf684b7c67a2b384aa99dde53d8a43218f2e68, as it's causing
-breakage when installing packages into a pristin rootfs. Upstream has been notified:
-https://bugzilla.redhat.com/show_bug.cgi?id=1441636
-
-Upstream-Status: Inappropriate [pending proper fix]
-Signed-off-by: Alex Kanavin <alex.kanavin@gmail.com>
----
- dnf/rpm/__init__.py | 59 +++++++++++++++++++++++++----------------------------
- doc/command_ref.rst |  3 +--
- 2 files changed, 29 insertions(+), 33 deletions(-)
-
-diff --git a/dnf/rpm/__init__.py b/dnf/rpm/__init__.py
-index 5976acd6..1d50e6a0 100644
---- a/dnf/rpm/__init__.py
-+++ b/dnf/rpm/__init__.py
-@@ -30,38 +30,35 @@ def detect_releasever(installroot):
-     # :api
-     """Calculate the release version for the system."""
- 
--    # if installroot is empty dir releasever is None,
--    # that's why releasever is checked from '/'
--    for root in [installroot, "/"]:
--        ts = transaction.initReadOnlyTransaction(root=root)
--        ts.pushVSFlags(~(rpm._RPMVSF_NOSIGNATURES | rpm._RPMVSF_NODIGESTS))
--        for distroverpkg in dnf.const.DISTROVERPKG:
--            try:
--                idx = ts.dbMatch('provides', distroverpkg)
--            except (TypeError, rpm.error) as e:
--                raise dnf.exceptions.Error('Error: %s' % str(e))
--            if not len(idx):
--                continue
--            try:
--                hdr = next(idx)
--            except StopIteration:
--                msg = 'Error: rpmdb failed to list provides. Try: rpm --rebuilddb'
--                raise dnf.exceptions.Error(msg)
--            releasever = hdr['version']
--            try:
--                off = hdr[rpm.RPMTAG_PROVIDENAME].index(distroverpkg)
--                flag = hdr[rpm.RPMTAG_PROVIDEFLAGS][off]
--                ver = hdr[rpm.RPMTAG_PROVIDEVERSION][off]
--                if flag == rpm.RPMSENSE_EQUAL and ver:
--                    if hdr['name'] != distroverpkg:
--                        # override the package version
--                        releasever = ver
--            except (ValueError, KeyError, IndexError):
--                pass
-+    ts = transaction.initReadOnlyTransaction(root=installroot)
-+    ts.pushVSFlags(~(rpm._RPMVSF_NOSIGNATURES | rpm._RPMVSF_NODIGESTS))
-+    for distroverpkg in dnf.const.DISTROVERPKG:
-+        try:
-+            idx = ts.dbMatch('provides', distroverpkg)
-+        except (TypeError, rpm.error) as e:
-+            raise dnf.exceptions.Error('Error: %s' % str(e))
-+        if not len(idx):
-+            continue
-+        try:
-+            hdr = next(idx)
-+        except StopIteration:
-+            msg = 'Error: rpmdb failed to list provides. Try: rpm --rebuilddb'
-+            raise dnf.exceptions.Error(msg)
-+        releasever = hdr['version']
-+        try:
-+            off = hdr[rpm.RPMTAG_PROVIDENAME].index(distroverpkg)
-+            flag = hdr[rpm.RPMTAG_PROVIDEFLAGS][off]
-+            ver = hdr[rpm.RPMTAG_PROVIDEVERSION][off]
-+            if flag == rpm.RPMSENSE_EQUAL and ver:
-+                if hdr['name'] != distroverpkg:
-+                    # override the package version
-+                    releasever = ver
-+        except (ValueError, KeyError, IndexError):
-+            pass
- 
--            if is_py3bytes(releasever):
--                releasever = str(releasever, "utf-8")
--            return releasever
-+        if is_py3bytes(releasever):
-+            releasever = str(releasever, "utf-8")
-+        return releasever
-     return None
- 
- 
-diff --git a/doc/command_ref.rst b/doc/command_ref.rst
-index 77e885ab..3dd451b5 100644
---- a/doc/command_ref.rst
-+++ b/doc/command_ref.rst
-@@ -205,8 +205,7 @@ Options
-  Note: You may also want to use the command-line option
-  ``--releasever=<release>`` when creating the installroot otherwise the
-  *$releasever* value is taken from the rpmdb within the installroot (and thus
-- it is empty at time of creation and *$releasever* is taken from rpmdb using
-- installroot=/).
-+ it is empty at time of creation, the transaction will fail).
-  The new installroot path at time of creation do not contain *repository*,
-  *releasever*, and *dnf.conf* file.
- 
--- 
-2.11.0
-
diff --git a/meta/recipes-devtools/dnf/dnf_git.bb b/meta/recipes-devtools/dnf/dnf_2.5.1.bb
similarity index 94%
rename from meta/recipes-devtools/dnf/dnf_git.bb
rename to meta/recipes-devtools/dnf/dnf_2.5.1.bb
index c975900f85e..a07a509b768 100644
--- a/meta/recipes-devtools/dnf/dnf_git.bb
+++ b/meta/recipes-devtools/dnf/dnf_2.5.1.bb
@@ -10,11 +10,9 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git \
            file://0001-Do-not-prepend-installroot-to-logdir.patch \
            file://0001-Do-not-hardcode-etc-and-systemd-unit-directories.patch \
            file://0001-Corretly-install-tmpfiles.d-configuration.patch \
-           file://0001-Revert-proper-check-of-releasever-when-using-install.patch \
            "
 
-PV = "2.3.0"
-SRCREV = "242079563b54b4714c889fd4ee32e8dd9960f3b8"
+SRCREV = "32e6ffdc8902b868cd8f98f9c399c98c9de0c7b8"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.11.0


