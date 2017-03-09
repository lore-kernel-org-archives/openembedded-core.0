Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6758E774F1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 20:24:37 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2017 12:24:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,137,1486454400"; d="scan'208";a="74304925"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 09 Mar 2017 12:24:38 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Mar 2017 22:23:31 +0200
Message-Id: <20170309202331.5595-4-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170309202331.5595-1-alexander.kanavin@linux.intel.com>
References: <20170309202331.5595-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 4/4] gpgme: fix python module build and installation
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
X-List-Received-Date: Thu, 09 Mar 2017 20:24:37 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...-Avoid-host-contamination-from-gpg-config.patch | 28 ++++++++++++++++++++++
 .../0001-Correctly-install-python-modules.patch    | 26 ++++++++++++++++++++
 meta/recipes-support/gpgme/gpgme_1.8.0.bb          |  2 ++
 3 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-support/gpgme/gpgme/0001-Avoid-host-contamination-from-gpg-config.patch
 create mode 100644 meta/recipes-support/gpgme/gpgme/0001-Correctly-install-python-modules.patch

diff --git a/meta/recipes-support/gpgme/gpgme/0001-Avoid-host-contamination-from-gpg-config.patch b/meta/recipes-support/gpgme/gpgme/0001-Avoid-host-contamination-from-gpg-config.patch
new file mode 100644
index 00000000000..b0a9645997c
--- /dev/null
+++ b/meta/recipes-support/gpgme/gpgme/0001-Avoid-host-contamination-from-gpg-config.patch
@@ -0,0 +1,28 @@
+From 96cfc76def123141d0cecaab857da3880396d5ef Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 9 Mar 2017 22:11:00 +0200
+Subject: [PATCH] Avoid host contamination from gpg-config
+
+gpg-config gives us -L/usr/lib as the first item for linking.
+
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ lang/python/setup.py.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lang/python/setup.py.in b/lang/python/setup.py.in
+index 213fe33..22629e2 100755
+--- a/lang/python/setup.py.in
++++ b/lang/python/setup.py.in
+@@ -86,7 +86,7 @@ subprocess.check_call([sys.executable, "gpgme-h-clean.py", gpg_error_h],
+                       stdout=open("errors.i", "w"))
+ 
+ define_macros = []
+-libs = getconfig('libs')
++libs = getconfig('libs')[1:]
+ 
+ # Define extra_macros for both the SWIG and C code
+ for k, v in extra_macros.items():
+-- 
+2.11.0
+
diff --git a/meta/recipes-support/gpgme/gpgme/0001-Correctly-install-python-modules.patch b/meta/recipes-support/gpgme/gpgme/0001-Correctly-install-python-modules.patch
new file mode 100644
index 00000000000..42655fbbe68
--- /dev/null
+++ b/meta/recipes-support/gpgme/gpgme/0001-Correctly-install-python-modules.patch
@@ -0,0 +1,26 @@
+From 4d714c097e497b63d2e8b22a834c671045e215e9 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 9 Mar 2017 21:34:55 +0200
+Subject: [PATCH] Correctly install python modules
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ lang/python/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lang/python/Makefile.am b/lang/python/Makefile.am
+index e32fd12..5ecf6fb 100644
+--- a/lang/python/Makefile.am
++++ b/lang/python/Makefile.am
+@@ -102,6 +102,7 @@ install-exec-local:
+ 	for PYTHON in $(PYTHONS); do \
+ 	  $$PYTHON setup.py install \
+ 	  --prefix $(DESTDIR)$(prefix) \
++          --install-lib=$(DESTDIR)${pythondir} \
+ 	  --record files.txt \
+ 	  --verbose ; \
+ 	  cat files.txt >> install_files.txt ; \
+-- 
+2.11.0
+
diff --git a/meta/recipes-support/gpgme/gpgme_1.8.0.bb b/meta/recipes-support/gpgme/gpgme_1.8.0.bb
index 86922f6fd98..d3e7880a47b 100644
--- a/meta/recipes-support/gpgme/gpgme_1.8.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.8.0.bb
@@ -13,6 +13,8 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://pkgconfig.patch \
            file://python-lang-config.patch \
+           file://0001-Correctly-install-python-modules.patch \
+           file://0001-Avoid-host-contamination-from-gpg-config.patch \
           "
 
 SRC_URI[md5sum] = "722a4153904b9b5dc15485a22d29263b"
-- 
2.11.0


