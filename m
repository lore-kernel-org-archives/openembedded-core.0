Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHPJP-0001qN-KJ
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 01:47:28 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 May 2011 16:44:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,312,1301900400"; d="scan'208";a="741892651"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by orsmga001.jf.intel.com with ESMTP; 03 May 2011 16:44:43 -0700
Message-Id: <87be64a8621ffa7a59c8a4e52d9226207ba5cf41.1304465724.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304465724.git.sgw@linux.intel.com>
References: <cover.1304465724.git.sgw@linux.intel.com>
Old-Date: Fri, 29 Apr 2011 10:55:05 +0800
Date: Tue, 03 May 2011 16:44:43 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Xiaofeng Yan <xiaofeng.yan@windriver.com>, Ilya Yanok <yanok@emcraft.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>, Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 17/33] shared-mime-info: upgrade to version 0.90
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
X-List-Received-Date: Tue, 03 May 2011 23:47:28 -0000

From: Qing He <qing.he@intel.com>

from 0.80
 - parallel build with 0.9 is buggy, disable part of the check for now

Signed-off-by: Qing He <qing.he@intel.com>
---
 .../files/fix-parallel-build.patch                 |   33 ++++++++++++++++++++
 .../shared-mime-info/shared-mime-info_0.80.bb      |    5 ---
 .../shared-mime-info/shared-mime-info_0.90.bb      |    7 ++++
 3 files changed, 40 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-support/shared-mime-info/files/fix-parallel-build.patch
 delete mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info_0.80.bb
 create mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info_0.90.bb

diff --git a/meta/recipes-support/shared-mime-info/files/fix-parallel-build.patch b/meta/recipes-support/shared-mime-info/files/fix-parallel-build.patch
new file mode 100644
index 0000000..ea8b05e
--- /dev/null
+++ b/meta/recipes-support/shared-mime-info/files/fix-parallel-build.patch
@@ -0,0 +1,33 @@
+the check rule will trigger a weird dependency issue in automake,
+it's possible that update-mime-database are invoked simultaneously in
+two different threads at the same time.
+
+As a workaround, revert it to the logic in 0.80
+
+Upstream-Status: Inappropriate [workaround]
+
+Signed-off-by: qing He <qing.he@intel.com>
+
+diff --git a/Makefile.am b/Makefile.am
+index 1a887bc..9df581e 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -72,7 +72,7 @@ uninstall-hook:
+ create-pot:
+ 	$(MAKE) -C po shared-mime-info.pot
+ 
+-check: freedesktop.org.xml update-mime-database check-translations
++check: freedesktop.org.xml check-translations
+ 	if test -n $(XMLLINT) ; then \
+ 		if test -e $(top_builddir)/freedesktop.org.xml; then \
+ 		xmllint --noout --valid $(top_builddir)/freedesktop.org.xml;	\
+@@ -80,9 +80,6 @@ check: freedesktop.org.xml update-mime-database check-translations
+ 		xmllint --noout --valid $(top_srcdir)/freedesktop.org.xml;	\
+ 		fi \
+ 	fi
+-	if test -d .git/ && test -x $(top_builddir)/update-mime-database && test -d $(top_srcdir)/mime-db-tests ; then \
+-		$(top_builddir)/update-mime-database mime-db-tests/ ; \
+-	fi
+ 	if test -d .git/ && test -x ../xdgmime/src/test-mime-data && test -x $(top_builddir)/test-tree-magic ; then \
+ 		mkdir -p $(top_builddir)/temp-mime-dir/mime/packages ; \
+ 		cp -a $(top_builddir)/freedesktop.org.xml $(top_builddir)/temp-mime-dir/mime/packages/ ; \
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_0.80.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_0.80.bb
deleted file mode 100644
index f809923..0000000
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_0.80.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require shared-mime-info.inc
-PR = "r0"
-
-SRC_URI[md5sum] = "eb8d24a6a80888849c9db7f30232ba6a"
-SRC_URI[sha256sum] = "80857ba19f8066bfc8d998bfc72b492e241ebd52d49c245aae9fd5b3d233b024"
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_0.90.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_0.90.bb
new file mode 100644
index 0000000..a806b36
--- /dev/null
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_0.90.bb
@@ -0,0 +1,7 @@
+require shared-mime-info.inc
+PR = "r0"
+
+SRC_URI += "file://fix-parallel-build.patch"
+
+SRC_URI[md5sum] = "967d68d3890ba3994cfce3adf5b8f15b"
+SRC_URI[sha256sum] = "52c9f84a8c72de631a0458542980b1728560f59845eb5e93e1dbe825f4b72304"
-- 
1.7.4.1



