Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EB61272F3F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 14:48:48 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Feb 2017 06:48:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,190,1484035200"; d="scan'208";a="1132875633"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 21 Feb 2017 06:48:36 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 16:46:27 +0200
Message-Id: <cd0cee58c94fce4b00023568127be8f92cc2f38b.1487687951.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1487687951.git.alexander.kanavin@linux.intel.com>
References: <cover.1487687951.git.alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 10/39] python-backports-lzma: add a recipe
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
X-List-Received-Date: Tue, 21 Feb 2017 14:48:49 -0000

It is needed by dnf, and only when using Python 2.x, so can
be dropped after moving dnf/rpm4 stack to Python 3.x.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...-not-add-include-and-library-directories-.patch | 32 ++++++++++++++++++++++
 .../python-backports-lzma_git.bb                   | 21 ++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-devtools/python-backports-lzma/python-backports-lzma/0001-setup.py-do-not-add-include-and-library-directories-.patch
 create mode 100644 meta/recipes-devtools/python-backports-lzma/python-backports-lzma_git.bb

diff --git a/meta/recipes-devtools/python-backports-lzma/python-backports-lzma/0001-setup.py-do-not-add-include-and-library-directories-.patch b/meta/recipes-devtools/python-backports-lzma/python-backports-lzma/0001-setup.py-do-not-add-include-and-library-directories-.patch
new file mode 100644
index 00000000000..0eb904a8a70
--- /dev/null
+++ b/meta/recipes-devtools/python-backports-lzma/python-backports-lzma/0001-setup.py-do-not-add-include-and-library-directories-.patch
@@ -0,0 +1,32 @@
+From e5e3196cf69172b625c8c6ccca991c02fd18137c Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 30 Dec 2016 18:02:12 +0200
+Subject: [PATCH] setup.py: do not add include and library directories from the
+ host
+
+This avoids host contamination.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ setup.py | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index 7886cf7..9a0356a 100644
+--- a/setup.py
++++ b/setup.py
+@@ -31,9 +31,7 @@ packages = ["backports", "backports.lzma"]
+ home = os.path.expanduser("~")
+ extens = [Extension('backports/lzma/_lzma',
+                     ['backports/lzma/_lzmamodule.c'],
+-                    libraries = ['lzma'],
+-                    include_dirs = [os.path.join(home, 'include'), '/opt/local/include', '/usr/local/include'],
+-                    library_dirs = [os.path.join(home, 'lib'), '/opt/local/lib', '/usr/local/lib']
++                    libraries = ['lzma']
+                     )]
+ 
+ descr = "Backport of Python 3.3's 'lzma' module for XZ/LZMA compressed files."
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/python-backports-lzma/python-backports-lzma_git.bb b/meta/recipes-devtools/python-backports-lzma/python-backports-lzma_git.bb
new file mode 100644
index 00000000000..6d3b8d569de
--- /dev/null
+++ b/meta/recipes-devtools/python-backports-lzma/python-backports-lzma_git.bb
@@ -0,0 +1,21 @@
+HOMEPAGE = "https://github.com/peterjc/backports.lzma"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=846e05e7e9e1c886b2637c230cfcd5dd"
+
+SRC_URI = "git://github.com/peterjc/backports.lzma.git \
+           file://0001-setup.py-do-not-add-include-and-library-directories-.patch \
+           "
+
+PV = "0.0.6+git${SRCPV}"
+SRCREV = "718b3316ae7aee8e03c02e7e110108779ce3aec8"
+
+S = "${WORKDIR}/git"
+
+inherit distutils
+
+DEPENDS_append = " xz"
+
+RDEPENDS_${PN} += "python-core python-io python-pkgutil"
+RDEPENDS_${PN}_class-native += "python-core"
+
+BBCLASSEXTEND = "native"
-- 
2.11.0


