Return-Path: <mark.hatle@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 58AAA6B7B0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 20:29:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7EKTJ2b026616
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 16:29:20 -0400 (EDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 14 Aug 2013 13:29:19 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Aug 2013 15:30:00 -0500
Message-ID: <1376512209-11622-3-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1376512209-11622-1-git-send-email-mark.hatle@windriver.com>
References: <1376512209-11622-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 02/11] python-smartpm: Add support for excluding package from the install
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
X-List-Received-Date: Wed, 14 Aug 2013 20:29:20 -0000
Content-Type: text/plain

Update smart to support a mechanism for excluding specific packages from the
install process.  An error will be generated if this package is required.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../smart-flag-exclude-packages.patch              | 70 ++++++++++++++++++++++
 .../python/python-smartpm_1.4.1.bb                 |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-flag-exclude-packages.patch

diff --git a/meta/recipes-devtools/python/python-smartpm/smart-flag-exclude-packages.patch b/meta/recipes-devtools/python/python-smartpm/smart-flag-exclude-packages.patch
new file mode 100644
index 0000000..21a2874
--- /dev/null
+++ b/meta/recipes-devtools/python/python-smartpm/smart-flag-exclude-packages.patch
@@ -0,0 +1,70 @@
+Add exclude-packages flag support
+
+Allow configuring specific packages to be excluded.  This will allow
+users to specify things NOT to install, and if they are attempted an
+error will be generated.
+
+Upstream-Status: Pending
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+Index: smart-1.4.1/smart/const.py
+===================================================================
+--- smart-1.4.1.orig/smart/const.py
++++ smart-1.4.1/smart/const.py
+@@ -70,6 +70,7 @@ DATADIR     = "/var/lib/smart/"
+ USERDATADIR = "~/.smart/"
+ CONFFILE    = "config"
+ 
++LOCKED_EXCLUDE     = Enum('LOCKED_EXCLUDE')
+ LOCKED_INSTALL     = Enum('LOCKED_INSTALL')
+ LOCKED_REMOVE      = Enum('LOCKED_REMOVE')
+ LOCKED_CONFLICT    = Enum('LOCKED_CONFLICT')
+Index: smart-1.4.1/smart/transaction.py
+===================================================================
+--- smart-1.4.1.orig/smart/transaction.py
++++ smart-1.4.1/smart/transaction.py
+@@ -19,7 +19,7 @@
+ # along with Smart Package Manager; if not, write to the Free Software
+ # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ #
+-from smart.const import INSTALL, REMOVE, UPGRADE, FIX, REINSTALL, KEEP, LOCKED_INSTALL, LOCKED_CONFLICT, LOCKED_CONFLICT_BY, LOCKED_NO_COEXIST, LOCKED_SYSCONF, LOCKED_REMOVE
++from smart.const import INSTALL, REMOVE, UPGRADE, FIX, REINSTALL, KEEP, LOCKED_EXCLUDE, LOCKED_INSTALL, LOCKED_CONFLICT, LOCKED_CONFLICT_BY, LOCKED_NO_COEXIST, LOCKED_SYSCONF, LOCKED_REMOVE
+ from smart.cache import PreRequires, Package
+ from smart import *
+ 
+@@ -29,7 +29,9 @@ def lock_reason(pkg, lockvalue):
+     except TypeError:
+         reason = None
+         lockvalue = None
+-    if reason == LOCKED_INSTALL:
++    if reason == LOCKED_EXCLUDE:
++        return _("%s is to be excluded") % pkg
++    elif reason == LOCKED_INSTALL:
+         return _("%s is to be installed") % pkg
+     elif reason == LOCKED_CONFLICT:
+         return _("%s conflicts with %s") % (pkg, otherpkg)
+@@ -210,6 +212,10 @@ class Policy(object):
+                 self._sysconflocked.append(pkg)
+                 self._locked[pkg] = (LOCKED_SYSCONF, None)
+ 
++        for pkg in pkgconf.filterByFlag("exclude-packages", cache.getPackages()):
++            if pkg not in self._locked:
++                self._locked[pkg] = (LOCKED_EXCLUDE, None)
++
+     def runFinished(self):
+         self._priorities.clear()
+         for pkg in self._sysconflocked:
+Index: smart-1.4.1/smart/commands/flag.py
+===================================================================
+--- smart-1.4.1.orig/smart/commands/flag.py
++++ smart-1.4.1/smart/commands/flag.py
+@@ -47,6 +47,8 @@ Currently known flags are:
+   multi-version - Flagged packages may have more than one version
+                   installed in the system at the same time
+                   (backend dependent).
++  exclude-packages - Flagged packages will be excluded, if they are
++                  required, an error will be generated.
+   ignore-recommends - Flagged packages will not be installed, if
+                   they are only recommended by a package to be
+                   installed rather than required.
diff --git a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
index 70ac8bf..b3b471a 100644
--- a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
+++ b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
@@ -28,6 +28,7 @@ SRC_URI = "\
           file://smart-channelsdir.patch \
           file://smart-conflict-provider.patch \
           file://smart-flag-ignore-recommends.patch \
+          file://smart-flag-exclude-packages.patch \
           "
 
 SRC_URI[md5sum] = "573ef32ba177a6b3c4bf7ef04873fcb6"
-- 
1.8.1.2.545.g2f19ada


