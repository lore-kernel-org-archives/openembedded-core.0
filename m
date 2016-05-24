Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EE61565CBB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 11:53:52 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2016 04:53:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,359,1459839600"; d="scan'208";a="109497969"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 24 May 2016 04:53:43 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 14:53:53 +0300
Message-Id: <c99118ff8bef308fa852488b8533546c7dd19d65.1464088997.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
References: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 04/45] default-versions.inc: drop python-related defaults
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

There is only one version of python 2.x provided, so no need
to set a preferred version.
PYTHON_BASEVERSION is now set explicitly in python-dir.bbclass and
python3-dir.bbclass, so fix up a few recipes that relied on it being
set in default-versions.inc without inheriting python-dir.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/default-versions.inc | 5 -----
 meta/recipes-devtools/rpm/rpm_5.4+cvs.bb      | 2 +-
 meta/recipes-devtools/rpm/rpm_5.4.16.bb       | 2 +-
 meta/recipes-kernel/lttng/lttng-tools_git.bb  | 2 +-
 meta/recipes-rt/rt-tests/hwlatdetect_0.96.bb  | 1 +
 5 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta/conf/distro/include/default-versions.inc b/meta/conf/distro/include/default-versions.inc
index a04ea71..cc8c533 100644
--- a/meta/conf/distro/include/default-versions.inc
+++ b/meta/conf/distro/include/default-versions.inc
@@ -2,11 +2,6 @@
 # Default preferred versions
 #
 
-# Force the python versions in one place
-PYTHON_BASEVERSION ?= "2.7"
-PREFERRED_VERSION_python ?= "2.7.11"
-PREFERRED_VERSION_python-native ?= "2.7.11"
-
 # Force the older version of liberation-fonts until we fix the fontforge issue
 PREFERRED_VERSION_liberation-fonts ?= "1.04"
 
diff --git a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
index 0991f6d..625d75e 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
@@ -156,7 +156,7 @@ SRC_URI_append_libc-musl = "\
 # to process certain package feeds.
 #SRC_URI += "file://rpm-debug-platform.patch"
 
-inherit autotools gettext
+inherit autotools gettext python-dir
 
 acpaths = "-I ${S}/db/dist/aclocal -I ${S}/db/dist/aclocal_java"
 
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
index 7ebd5e9..3adb29c 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -165,7 +165,7 @@ SRC_URI_append_libc-musl = "\
 
 UPSTREAM_CHECK_REGEX = "rpm-(?P<pver>(\d+[\.\-_]*)+)-.*$"
 
-inherit autotools gettext
+inherit autotools gettext python-dir
 
 acpaths = "-I ${S}/db/dist/aclocal -I ${S}/db/dist/aclocal_java"
 
diff --git a/meta/recipes-kernel/lttng/lttng-tools_git.bb b/meta/recipes-kernel/lttng/lttng-tools_git.bb
index 3ce4a9e..8ef267c 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_git.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_git.bb
@@ -35,7 +35,7 @@ SRC_URI = "git://git.lttng.org/lttng-tools.git;branch=stable-2.7 \
 
 S = "${WORKDIR}/git"
 
-inherit autotools-brokensep ptest pkgconfig useradd
+inherit autotools-brokensep ptest pkgconfig useradd python-dir
 
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "tracing"
diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_0.96.bb b/meta/recipes-rt/rt-tests/hwlatdetect_0.96.bb
index 962069e..025eb63 100644
--- a/meta/recipes-rt/rt-tests/hwlatdetect_0.96.bb
+++ b/meta/recipes-rt/rt-tests/hwlatdetect_0.96.bb
@@ -6,6 +6,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 require rt-tests.inc
+inherit python-dir
 
 EXTRA_OEMAKE += "PYLIB=${libdir}/python${PYTHON_BASEVERSION}/dist-packages"
 
-- 
2.8.1


