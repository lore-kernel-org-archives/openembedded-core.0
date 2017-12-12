Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B75BE78870
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 05:04:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Dec 2017 21:04:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,394,1508828400"; d="scan'208";a="15240471"
Received: from chiron.jf.intel.com ([10.7.159.61])
	by orsmga001.jf.intel.com with ESMTP; 11 Dec 2017 21:04:32 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Dec 2017 21:04:19 -0800
Message-Id: <106b837cdf6378a121b6c6a5ccedf3d24e7acfc7.1513054233.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <cover.1513054233.git.timothy.t.orling@linux.intel.com>
References: <cover.1513054233.git.timothy.t.orling@linux.intel.com>
Subject: [PATCH v3 14/14] python-scons: upgrade to v3.0.1; use pypi.bbclass
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
X-List-Received-Date: Tue, 12 Dec 2017 05:04:33 -0000

* Simplify recipe by using pypi.bbclass
* Drop patch for __future__ print_function
  - fixed upstream:
https://github.com/SConsProject/scons/pull/1/commits/4c199d06e76afb9379e76942d0f68caa57f42509

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 ...ative_3.0.0.bb => python-scons-native_3.0.1.bb} |  0
 ...onscript-Support-python2-print-statements.patch | 38 ----------------------
 ...python-scons_3.0.0.bb => python-scons_3.0.1.bb} | 12 ++-----
 3 files changed, 3 insertions(+), 47 deletions(-)
 rename meta/recipes-devtools/python/{python-scons-native_3.0.0.bb => python-scons-native_3.0.1.bb} (100%)
 delete mode 100644 meta/recipes-devtools/python/python-scons/SConscript-Support-python2-print-statements.patch
 rename meta/recipes-devtools/python/{python-scons_3.0.0.bb => python-scons_3.0.1.bb} (54%)

diff --git a/meta/recipes-devtools/python/python-scons-native_3.0.0.bb b/meta/recipes-devtools/python/python-scons-native_3.0.1.bb
similarity index 100%
rename from meta/recipes-devtools/python/python-scons-native_3.0.0.bb
rename to meta/recipes-devtools/python/python-scons-native_3.0.1.bb
diff --git a/meta/recipes-devtools/python/python-scons/SConscript-Support-python2-print-statements.patch b/meta/recipes-devtools/python/python-scons/SConscript-Support-python2-print-statements.patch
deleted file mode 100644
index b1a790219e..0000000000
--- a/meta/recipes-devtools/python/python-scons/SConscript-Support-python2-print-statements.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 885aabdb313685405737112dcb7d7774eee6d879 Mon Sep 17 00:00:00 2001
-From: Thomas Berg <merlin66b@gmail.com>
-Date: Thu, 19 Oct 2017 14:02:21 -0500
-Subject: [PATCH] SConscript: Support python2 print statements
-
-This fixes a regression introduced in scons-3.0.0, where
-SConscripts containing python 2 print statements would cause
-syntax errors even when executing scons with python 2.7.
-
-This ensures backward compatibility, allowing users to build
-legacy code with scons-3.0.0 without having to patch it.
-
-Taken from
-https://github.com/SConsProject/scons/commit/2e0de3c55f22b3eaa7767b69740b898f3d2f46bf
-
-Upstream-Status: Accepted
-
-Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
----
- engine/SCons/Script/SConscript.py | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/engine/SCons/Script/SConscript.py b/engine/SCons/Script/SConscript.py
-index bc05540..332d1fa 100644
---- a/engine/SCons/Script/SConscript.py
-+++ b/engine/SCons/Script/SConscript.py
-@@ -5,8 +5,6 @@ files.
- 
- """
- 
--from __future__ import print_function
--
- #
- # Copyright (c) 2001 - 2017 The SCons Foundation
- #
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/python/python-scons_3.0.0.bb b/meta/recipes-devtools/python/python-scons_3.0.1.bb
similarity index 54%
rename from meta/recipes-devtools/python/python-scons_3.0.0.bb
rename to meta/recipes-devtools/python/python-scons_3.0.1.bb
index 8fe74f4b3c..2f75b08d25 100644
--- a/meta/recipes-devtools/python/python-scons_3.0.0.bb
+++ b/meta/recipes-devtools/python/python-scons_3.0.1.bb
@@ -2,20 +2,14 @@ SUMMARY = "Software Construction tool (make/autotools replacement)"
 SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=46ddf66004e5be5566367cb525a66fc6"
-SRCNAME = "scons"
 
-SRC_URI = "https://files.pythonhosted.org/packages/source/s/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
-           file://SConscript-Support-python2-print-statements.patch"
-
-SRC_URI[md5sum] = "7ca558edaaa1942fe38f3105ca2400fb"
-SRC_URI[sha256sum] = "aa5afb33c2bbd33c311e47e912412195739e9ffb2e933534a31f85fba8f3470e"
+SRC_URI[md5sum] = "b6a292e251b34b82c203b56cfa3968b3"
+SRC_URI[sha256sum] = "24475e38d39c19683bc88054524df018fe6949d70fbd4c69e298d39a0269f173"
 
 UPSTREAM_CHECK_URI = "http://scons.org/pages/download.html"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit setuptools
+inherit pypi setuptools
 
 RDEPENDS_${PN} = "\
   python-fcntl \
-- 
2.14.3


