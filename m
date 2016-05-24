Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E27FD612E5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 11:53:52 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2016 04:53:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,359,1459839600"; d="scan'208";a="109497965"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 24 May 2016 04:53:42 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 14:53:52 +0300
Message-Id: <64aed5969d18c777a6294e4bab793fc3acdda010.1464088997.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 03/45] python3-dir.bbclass: add a separate class for Python 3
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
X-List-Received-Date: Tue, 24 May 2016 11:53:53 -0000

This is much cleaner than sharing python-dir.bbclass between python 2
and 3 classes, and doing confusing overrides in them.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/distutils-common-base.bbclass | 2 --
 meta/classes/distutils3-base.bbclass       | 3 ---
 meta/classes/python-dir.bbclass            | 6 +++---
 meta/classes/python3-dir.bbclass           | 5 +++++
 meta/classes/python3native.bbclass         | 4 +---
 5 files changed, 9 insertions(+), 11 deletions(-)
 create mode 100644 meta/classes/python3-dir.bbclass

diff --git a/meta/classes/distutils-common-base.bbclass b/meta/classes/distutils-common-base.bbclass
index 08511f5..dee06b4 100644
--- a/meta/classes/distutils-common-base.bbclass
+++ b/meta/classes/distutils-common-base.bbclass
@@ -1,5 +1,3 @@
-inherit python-dir
-
 EXTRA_OEMAKE = ""
 
 export STAGING_INCDIR
diff --git a/meta/classes/distutils3-base.bbclass b/meta/classes/distutils3-base.bbclass
index 2a093d3a..82ab6a3 100644
--- a/meta/classes/distutils3-base.bbclass
+++ b/meta/classes/distutils3-base.bbclass
@@ -1,8 +1,5 @@
 DEPENDS  += "${@["${PYTHON_PN}-native ${PYTHON_PN}", ""][(d.getVar('PACKAGES', True) == '')]}"
 RDEPENDS_${PN} += "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' == 'class-target']}"
 
-PYTHON_BASEVERSION = "3.5"
-PYTHON_ABI = "m"
-
 inherit distutils-common-base python3native
 
diff --git a/meta/classes/python-dir.bbclass b/meta/classes/python-dir.bbclass
index ebfa4b3..a11dc35 100644
--- a/meta/classes/python-dir.bbclass
+++ b/meta/classes/python-dir.bbclass
@@ -1,5 +1,5 @@
-PYTHON_BASEVERSION ?= "2.7"
-PYTHON_ABI ?= ""
+PYTHON_BASEVERSION = "2.7"
+PYTHON_ABI = ""
 PYTHON_DIR = "python${PYTHON_BASEVERSION}"
-PYTHON_PN = "python${@'' if '${PYTHON_BASEVERSION}'.startswith('2') else '3'}"
+PYTHON_PN = "python"
 PYTHON_SITEPACKAGES_DIR = "${libdir}/${PYTHON_DIR}/site-packages"
diff --git a/meta/classes/python3-dir.bbclass b/meta/classes/python3-dir.bbclass
new file mode 100644
index 0000000..06bb046
--- /dev/null
+++ b/meta/classes/python3-dir.bbclass
@@ -0,0 +1,5 @@
+PYTHON_BASEVERSION = "3.5"
+PYTHON_ABI = "m"
+PYTHON_DIR = "python${PYTHON_BASEVERSION}"
+PYTHON_PN = "python3"
+PYTHON_SITEPACKAGES_DIR = "${libdir}/${PYTHON_DIR}/site-packages"
diff --git a/meta/classes/python3native.bbclass b/meta/classes/python3native.bbclass
index 8ec6b76..1899863 100644
--- a/meta/classes/python3native.bbclass
+++ b/meta/classes/python3native.bbclass
@@ -1,6 +1,4 @@
-PYTHON_BASEVERSION = "3.5"
-
-inherit python-dir
+inherit python3-dir
 
 PYTHON="${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}"
 EXTRANATIVEPATH += "${PYTHON_PN}-native"
-- 
2.8.1


