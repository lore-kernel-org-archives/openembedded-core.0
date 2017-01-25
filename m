Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 06709731A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 12:41:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 25 Jan 2017 04:41:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,283,1477983600"; d="scan'208";a="35260413"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 25 Jan 2017 04:41:06 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2017 14:40:54 +0200
Message-Id: <20170125124101.29425-4-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170125124101.29425-1-markus.lehtonen@linux.intel.com>
References: <20170125124101.29425-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH RFC 03/10] python: remove path hack from setup.py
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
X-List-Received-Date: Wed, 25 Jan 2017 12:41:09 -0000

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
index b2a8c3b..6449738 100644
--- a/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
+++ b/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
@@ -85,13 +85,3 @@ Index: Python-2.7.12/setup.py
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
2.10.2


