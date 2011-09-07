Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R1DLZ-0004xv-9A
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Sep 2011 10:19:01 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 07 Sep 2011 01:13:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,344,1312182000"; d="scan'208";a="48820022"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by fmsmga001.fm.intel.com with ESMTP; 07 Sep 2011 01:13:44 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Sep 2011 16:18:06 +0800
Message-Id: <5aa88c90226af1c5822344de8ae4fce537533782.1315383334.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1315383334.git.dongxiao.xu@intel.com>
References: <cover.1315383334.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1315383334.git.dongxiao.xu@intel.com>
References: <cover.1315383334.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/1] telepathy-python: avoid duplicated installation of errors.py
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
X-List-Received-Date: Wed, 07 Sep 2011 08:19:01 -0000

telepathy-python install fails on latest Fedora 16 due to the tighter
check of duplicated file installation.

Remove one errors.py entry in Makefile.am to fix this issue.

[YOCTO #1453]

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../remove_duplicate_install.patch                 |   26 ++++++++++++++++++++
 .../telepathy/telepathy-python_0.15.19.bb          |    5 ++-
 2 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/telepathy/telepathy-python-0.15.19/remove_duplicate_install.patch

diff --git a/meta/recipes-connectivity/telepathy/telepathy-python-0.15.19/remove_duplicate_install.patch b/meta/recipes-connectivity/telepathy/telepathy-python-0.15.19/remove_duplicate_install.patch
new file mode 100644
index 0000000..df95a4c
--- /dev/null
+++ b/meta/recipes-connectivity/telepathy/telepathy-python-0.15.19/remove_duplicate_install.patch
@@ -0,0 +1,26 @@
+commit f6c67662145de889055a86a6b3b12c70a45fc8d5
+Author: Dongxiao Xu <dongxiao.xu@intel.com>
+Date:   Wed Sep 7 16:02:20 2011 +0800
+
+    Avoid duplicated installation of errors.py
+    
+    newer version of autotools don't seem to like listing files to install
+    twice. Remove one errors.py from the installation list.
+    
+    Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
+    
+    Upstream-Status: Inappropirate [upstream inactive]
+    
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 5c27dfe..7536e43 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -11,7 +11,7 @@ telepathy_PYTHON = \
+ 
+ # telepathy._generated.* auto-generated modules
+ spec_dir = $(top_srcdir)/spec
+-spec_files := $(patsubst $(spec_dir)%.xml,_generated%.py,$(wildcard $(spec_dir)/*.xml))
++spec_files := $(filter-out _generated/errors.py, $(patsubst $(spec_dir)%.xml,_generated%.py,$(wildcard $(spec_dir)/*.xml)))
+ 
+ BUILT_SOURCES = \
+ 	_generated/interfaces.py \
diff --git a/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb b/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
index ead8dea..817b911 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-python_0.15.19.bb
@@ -7,9 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
 RDEPENDS_${PN} += "python-dbus"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
-           file://parallel_make.patch"
+           file://parallel_make.patch \
+           file://remove_duplicate_install.patch"
 
-PR = "r2"
+PR = "r3"
 
 inherit autotools
 
-- 
1.7.1



