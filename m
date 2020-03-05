Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 99EB46089C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2020 22:05:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 025M554J008657
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Mar 2020 14:05:15 -0800
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.487.0;
	Thu, 5 Mar 2020 14:04:54 -0800
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Mar 2020 14:04:54 -0800
Message-ID: <20200305220454.108763-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH 1/1] libdnf: fix deprecation warning
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
X-List-Received-Date: Thu, 05 Mar 2020 22:05:24 -0000
Content-Type: text/plain

Backport from libdnf.  Fix is in version 0.35.2.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../libdnf/libdnf/fix-deprecation-warning.patch    | 71 ++++++++++++++++++++++
 meta/recipes-devtools/libdnf/libdnf_0.28.1.bb      |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/fix-deprecation-warning.patch

diff --git a/meta/recipes-devtools/libdnf/libdnf/fix-deprecation-warning.patch b/meta/recipes-devtools/libdnf/libdnf/fix-deprecation-warning.patch
new file mode 100644
index 0000000..3a3e02f
--- /dev/null
+++ b/meta/recipes-devtools/libdnf/libdnf/fix-deprecation-warning.patch
@@ -0,0 +1,71 @@
+From 66d9b2ba3fbc7b04f2b5ad9d0e5371340c037b5f Mon Sep 17 00:00:00 2001
+From: Marek Blaha <mblaha@redhat.com>
+Date: Wed, 10 Jul 2019 10:11:01 +0200
+Subject: [oe-core][PATCH 1/1] Fix Python 3.8 deprecation warning
+ (RhBug:1724244)
+
+This deprecation warning was introduced in Python 3.8 by
+https://bugs.python.org/issue36381:
+
+/usr/lib/python3.8/site-packages/dnf/package.py:57: DeprecationWarning: PY_SSIZE_T_CLEAN will be required for '#' formats
+  return super(Package, self).chksum
+
+https://bugzilla.redhat.com/show_bug.cgi?id=1724244
+---
+ python/hawkey/package-py.cpp      | 3 ++-
+ python/hawkey/packagedelta-py.cpp | 3 ++-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+---
+
+Unchanged.  Appears in version 0.35.2.
+
+Upstream-Status: Backport [git://github.com/rpm-software-management/libdnf.git]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+
+diff --git a/python/hawkey/package-py.cpp b/python/hawkey/package-py.cpp
+index 5102bba..68e03cb 100644
+--- a/python/hawkey/package-py.cpp
++++ b/python/hawkey/package-py.cpp
+@@ -18,6 +18,7 @@
+  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+  */
+ 
++#define PY_SSIZE_T_CLEAN
+ #include <Python.h>
+ #include <stdio.h>
+ 
+@@ -251,7 +252,7 @@ get_chksum(_PackageObject *self, void *closure)
+ #if PY_MAJOR_VERSION < 3
+     res = Py_BuildValue("is#", type, cs, checksum_length);
+ #else
+-    res = Py_BuildValue("iy#", type, cs, checksum_length);
++    res = Py_BuildValue("iy#", type, cs, (Py_ssize_t)checksum_length);
+ #endif
+ 
+     return res;
+diff --git a/python/hawkey/packagedelta-py.cpp b/python/hawkey/packagedelta-py.cpp
+index ca1cb7d..1a64836 100644
+--- a/python/hawkey/packagedelta-py.cpp
++++ b/python/hawkey/packagedelta-py.cpp
+@@ -18,6 +18,7 @@
+  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+  */
+ 
++#define PY_SSIZE_T_CLEAN
+ #include <Python.h>
+ 
+ // hawkey
+@@ -92,7 +93,7 @@ get_chksum(_PackageDeltaObject *self, void *closure)
+ #if PY_MAJOR_VERSION < 3
+     res = Py_BuildValue("is#", type, cs, checksum_length);
+ #else
+-    res = Py_BuildValue("iy#", type, cs, checksum_length);
++    res = Py_BuildValue("iy#", type, cs, (Py_ssize_t)checksum_length);
+ #endif
+ 
+     return res;
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
index d498347..163a2ee 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
@@ -8,6 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf \
            file://0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch \
            file://0001-Add-WITH_TESTS-option.patch \
            file://0001-include-stdexcept-for-runtime_error.patch \
+           file://fix-deprecation-warning.patch \
            "
 
 SRCREV = "751f89045b80d58c0d05800f74357cf78cdf7e77"
-- 
2.7.4


