Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 7C3E57885C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Feb 2018 18:02:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Feb 2018 10:02:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,444,1511856000"; d="scan'208";a="200465173"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 01 Feb 2018 10:02:18 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Feb 2018 20:01:57 +0200
Message-Id: <20180201180210.21652-7-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180201180210.21652-1-alexander.kanavin@linux.intel.com>
References: <20180201180210.21652-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 07/20] p11-kit: take source code from official git
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
X-List-Received-Date: Thu, 01 Feb 2018 18:02:17 -0000

The previous tarball URI seems to be gone.

Also, adjust a few things to make it actually build;
handling autotools-based projects from git checkouts is always harder
than taking them from tarballs :-(

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...p-the-languages-for-which-upstream-does-n.patch | 32 ++++++++++++++++++++++
 meta/recipes-support/p11-kit/p11-kit_0.22.1.bb     | 13 ++++++---
 2 files changed, 41 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-support/p11-kit/p11-kit/0001-LINGUAS-drop-the-languages-for-which-upstream-does-n.patch

diff --git a/meta/recipes-support/p11-kit/p11-kit/0001-LINGUAS-drop-the-languages-for-which-upstream-does-n.patch b/meta/recipes-support/p11-kit/p11-kit/0001-LINGUAS-drop-the-languages-for-which-upstream-does-n.patch
new file mode 100644
index 00000000000..2fda9dfbb89
--- /dev/null
+++ b/meta/recipes-support/p11-kit/p11-kit/0001-LINGUAS-drop-the-languages-for-which-upstream-does-n.patch
@@ -0,0 +1,32 @@
+From c3aa4aae5e9f4adafd9e10d9466f1bc481e0aae6 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 31 Jan 2018 16:47:44 +0200
+Subject: [PATCH] LINGUAS: drop the languages for which upstream does not
+ supply .po files
+
+Regenerating them proved to be too painful.
+Upstream has been notified: https://github.com/p11-glue/p11-kit/issues/127
+
+Upstream-Status: Inappropriate [missing upstream distribution files]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ po/LINGUAS | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/po/LINGUAS b/po/LINGUAS
+index 1fc4d53..e9cc5a7 100644
+--- a/po/LINGUAS
++++ b/po/LINGUAS
+@@ -11,9 +11,7 @@ cy
+ da
+ de
+ el
+-en@boldquot
+ en_GB
+-en@quot
+ eo
+ es
+ es_CL
+-- 
+2.15.1
+
diff --git a/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb b/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb
index 38fa09bf9aa..57798f40201 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.22.1.bb
@@ -2,14 +2,19 @@ SUMMARY = "Provides a way to load and enumerate PKCS#11 modules"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=02933887f609807fbb57aa4237d14a50"
 
-inherit autotools gettext pkgconfig upstream-version-is-even gtk-doc
+inherit autotools gettext pkgconfig gtk-doc
 
 DEPENDS = "libtasn1 libffi"
 
-SRC_URI = "http://p11-glue.freedesktop.org/releases/${BP}.tar.gz"
-SRC_URI[md5sum] = "4e9bea1106628ffb820bdad24a819fac"
-SRC_URI[sha256sum] = "ef3a339fcf6aa0e32c8c23f79ba7191e57312be2bda8b24e6d121c2670539a5c"
+SRC_URI = "git://github.com/p11-glue/p11-kit \
+           file://0001-LINGUAS-drop-the-languages-for-which-upstream-does-n.patch \
+           "
+SRCREV = "bfb3bd47aa48983f5349479bca598403097ff81c"
+S = "${WORKDIR}/git"
+# exclude odd minor versions, which are development releases
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
 
+AUTOTOOLS_AUXDIR = "${S}/build/litter"
 EXTRA_OECONF = "--without-trust-paths"
 
 # This recipe does not use the standard gtk-doc m4 macros, and so the ./configure flags
-- 
2.15.1


