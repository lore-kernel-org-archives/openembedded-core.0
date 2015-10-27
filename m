Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 0D9BC60657
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 02:53:03 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="102313993"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Oct 2015 10:55:13 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t9R2qP7b032651
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 10:52:25 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 27 Oct 2015 10:52:57 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 Oct 2015 10:52:51 +0800
Message-ID: <1445914371-56565-1-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [PATCH] python-smartpm: define LOCKED_KEEP to avoid running error
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
X-List-Received-Date: Tue, 27 Oct 2015 02:53:04 -0000
Content-Type: text/plain

LOCKED_KEEP is undefined, so the following error will be caught.

 /usr/lib/python2.7/site-packages/smart/transaction.py", line 1230, in run
     locked[pkg] = (LOCKED_KEEP, None)

 NameError: global name 'LOCKED_KEEP' is not defined

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 .../python-smartpm/smart-define-LOCKED-KEEP.patch  | 45 ++++++++++++++++++++++
 meta/recipes-devtools/python/python-smartpm_git.bb |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-define-LOCKED-KEEP.patch

diff --git a/meta/recipes-devtools/python/python-smartpm/smart-define-LOCKED-KEEP.patch b/meta/recipes-devtools/python/python-smartpm/smart-define-LOCKED-KEEP.patch
new file mode 100644
index 0000000..8b7769a
--- /dev/null
+++ b/meta/recipes-devtools/python/python-smartpm/smart-define-LOCKED-KEEP.patch
@@ -0,0 +1,45 @@
+From daaec43ecf3f0d0f89cef586327aa1063a4c44c6 Mon Sep 17 00:00:00 2001
+From: Bian Naimeng <biannm@cn.fujitsu.com>
+Date: Tue, 27 Oct 2015 11:08:52 +0900
+Subject: [PATCH] Fix a undefined error
+
+LOCKED_KEEP is undefined, so the following error will be caught.
+
+  /usr/lib/python2.7/site-packages/smart/transaction.py", line 1230, in run
+    locked[pkg] = (LOCKED_KEEP, None)
+
+  NameError: global name 'LOCKED_KEEP' is not defined
+
+Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
+---
+ smart/const.py       | 1 +
+ smart/transaction.py | 2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/smart/const.py b/smart/const.py
+index 3a01073..51ec6c1 100644
+--- a/smart/const.py
++++ b/smart/const.py
+@@ -77,5 +77,6 @@ LOCKED_CONFLICT    = Enum('LOCKED_CONFLICT')
+ LOCKED_CONFLICT_BY = Enum('LOCKED_CONFLICT_BY')
+ LOCKED_NO_COEXIST  = Enum('LOCKED_NO_COEXIST')
+ LOCKED_SYSCONF     = Enum('LOCKED_SYSCONF')
++LOCKED_KEEP        = Enum('LOCKED_KEEP')
+ 
+ # vim:ts=4:sw=4:et
+diff --git a/smart/transaction.py b/smart/transaction.py
+index f022aae..8600090 100644
+--- a/smart/transaction.py
++++ b/smart/transaction.py
+@@ -19,7 +19,7 @@
+ # along with Smart Package Manager; if not, write to the Free Software
+ # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ #
+-from smart.const import INSTALL, REMOVE, UPGRADE, FIX, REINSTALL, KEEP, LOCKED_EXCLUDE, LOCKED_INSTALL, LOCKED_CONFLICT, LOCKED_CONFLICT_BY, LOCKED_NO_COEXIST, LOCKED_SYSCONF, LOCKED_REMOVE
++from smart.const import INSTALL, REMOVE, UPGRADE, FIX, REINSTALL, KEEP, LOCKED_EXCLUDE, LOCKED_INSTALL, LOCKED_CONFLICT, LOCKED_CONFLICT_BY, LOCKED_NO_COEXIST, LOCKED_SYSCONF, LOCKED_REMOVE, LOCKED_KEEP
+ from smart.cache import PreRequires, Package
+ from smart import *
+ 
+-- 
+1.8.4.2
+
diff --git a/meta/recipes-devtools/python/python-smartpm_git.bb b/meta/recipes-devtools/python/python-smartpm_git.bb
index 8b974b0..72d4d23 100644
--- a/meta/recipes-devtools/python/python-smartpm_git.bb
+++ b/meta/recipes-devtools/python/python-smartpm_git.bb
@@ -23,6 +23,7 @@ SRC_URI = "\
           file://smart-add-for-rpm-ignoresize-check.patch \
           file://smart-already-installed-message.patch \
           file://smart-set-noprogress-for-pycurl.patch \
+          file://smart-define-LOCKED-KEEP.patch \
          "
 
 SRCREV = "407a7eca766431257dcd1da15175cc36a1bb22d0"
-- 
1.9.1


