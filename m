Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 911EA77E1C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 13:19:01 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 May 2017 06:18:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,349,1491289200"; d="scan'208";a="102711785"
Received: from bkearns-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.10.90])
	by fmsmga006.fm.intel.com with ESMTP; 16 May 2017 06:18:57 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 May 2017 16:18:33 +0300
Message-Id: <b2ceb4eaaec348481e8e6a1897e4015698021a9a.1494939394.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
References: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
References: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH v2 03/20] python: remove path hack from setup.py
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
X-List-Received-Date: Tue, 16 May 2017 13:19:01 -0000

There should be no need to hack the library and include dirs in
setup.py. The script detects them from compiler output. We need to
remove this is because python-profile-opt recipe is built with a
non-standard prefix setting (i.e. /opt) and the hack breaks the
discovery of system libraries and headers.

[YOCTO #9338]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 .../python/python/01-use-proper-tools-for-cross-build.patch    | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch b/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
index 366ce3e400..02656d23c5 100644
--- a/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
+++ b/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
@@ -85,13 +85,3 @@ Index: Python-2.7.13/setup.py
              assert not self.inplace
              basename, tail = os.path.splitext(ext_filename)
              newname = basename + "_failed" + tail
-@@ -574,6 +575,9 @@ class PyBuildExt(build_ext):
- 
-         # XXX Omitted modules: gl, pure, dl, SGI-specific modules
- 
-+        lib_dirs = [ os.getenv("STAGING_LIBDIR"),  os.getenv("STAGING_BASELIBDIR") ]
-+        inc_dirs = [ os.getenv("STAGING_INCDIR") ]
-+
-         #
-         # The following modules are all pretty straightforward, and compile
-         # on pretty much any POSIXish platform.
-- 
2.12.0


