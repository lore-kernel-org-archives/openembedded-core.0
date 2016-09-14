Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D385B77028
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 08:46:07 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 14 Sep 2016 01:46:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,333,1470726000"; d="scan'208";a="760546924"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Sep 2016 01:46:08 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2016 11:46:06 +0300
Message-Id: <1473842766-27585-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1473842766-27585-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1473842766-27585-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH v2] python-smartpm: use md5 as the digest for rpm_sys channel
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
X-List-Received-Date: Wed, 14 Sep 2016 08:46:08 -0000

Use md5 sum instead of mtime as the "digest" method for rpm_sys channel.
The digest is used to determine if the channel has been updated. It was
found out that mtime was not a reliable digest. On some systems mtime
of the rpm db does not get updated after every transaction if transactions
(smart install / remove commands) are fired in quick succession. As a
consequence smartpm cache and rpm db get out of sync.

[YOCTO #10244]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 ...m_sys-use-md5sum-instead-of-mtime-as-the-.patch | 38 ++++++++++++++++++++++
 meta/recipes-devtools/python/python-smartpm_git.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/channels-rpm_sys-use-md5sum-instead-of-mtime-as-the-.patch

diff --git a/meta/recipes-devtools/python/python-smartpm/channels-rpm_sys-use-md5sum-instead-of-mtime-as-the-.patch b/meta/recipes-devtools/python/python-smartpm/channels-rpm_sys-use-md5sum-instead-of-mtime-as-the-.patch
new file mode 100644
index 0000000..2f14a12
--- /dev/null
+++ b/meta/recipes-devtools/python/python-smartpm/channels-rpm_sys-use-md5sum-instead-of-mtime-as-the-.patch
@@ -0,0 +1,38 @@
+channels/rpm_sys: use md5sum instead of mtime as the digest
+
+Use the internal getFileDigest() function (which defaults to md5) instead of
+mtime for getting the file digest. On some systems mtime proved to be
+unreliable because of delayed update. This caused smart to miss rpm db updates
+and thus get its understanding of installed packages out of sync.
+
+Upstream-Status: Pending
+
+Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
+---
+ smart/channels/rpm_sys.py | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/smart/channels/rpm_sys.py b/smart/channels/rpm_sys.py
+index b9fda27..6f1fe94 100644
+--- a/smart/channels/rpm_sys.py
++++ b/smart/channels/rpm_sys.py
+@@ -22,6 +22,7 @@
+ from smart.backends.rpm.header import RPMDBLoader
+ from smart.backends.rpm.base import getTS, rpm_join_dbpath
+ from smart.channel import PackageChannel
++from smart.util.filetools import getFileDigest
+ from smart import *
+ import os
+ 
+@@ -35,7 +36,7 @@ class RPMSysChannel(PackageChannel):
+         dbdir = rpm_join_dbpath(sysconf.get("rpm-root", "/"),
+                             sysconf.get("rpm-dbpath", "var/lib/rpm"))
+         path = os.path.join(dbdir, "Packages")
+-        digest = os.path.getmtime(path)
++        digest = getFileDigest(path)
+         if digest == self._digest:
+             return True
+         self.removeLoaders()
+-- 
+2.6.6
+
diff --git a/meta/recipes-devtools/python/python-smartpm_git.bb b/meta/recipes-devtools/python/python-smartpm_git.bb
index 0c26048..861910c 100644
--- a/meta/recipes-devtools/python/python-smartpm_git.bb
+++ b/meta/recipes-devtools/python/python-smartpm_git.bb
@@ -26,6 +26,7 @@ SRC_URI = "\
           file://smart-locale.patch \
           file://smartpm-rpm5-support-check-signatures.patch \
           file://smart-add-deugging-when-targetpath-is-empty.patch \
+          file://channels-rpm_sys-use-md5sum-instead-of-mtime-as-the-.patch \
          "
 
 SRCREV = "407a7eca766431257dcd1da15175cc36a1bb22d0"
-- 
2.6.6


