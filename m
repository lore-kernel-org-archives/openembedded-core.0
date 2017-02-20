Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 66C6F71D97
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:36:01 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Feb 2017 02:36:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,186,1484035200"; d="scan'208";a="1132314436"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 20 Feb 2017 02:36:00 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Feb 2017 12:35:40 +0200
Message-Id: <20170220103551.20022-9-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170220103551.20022-1-markus.lehtonen@linux.intel.com>
References: <20170220103551.20022-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH 09/20] python-pgo-image: switch python default profile task to pybench
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
X-List-Received-Date: Mon, 20 Feb 2017 10:36:01 -0000

Switch to pybench in order to reduce the time taken by profiling.

[YOCTO #9338]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-devtools/images/python-pgo-image.bb | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/images/python-pgo-image.bb b/meta/recipes-devtools/images/python-pgo-image.bb
index 222d7a8..82cb001 100644
--- a/meta/recipes-devtools/images/python-pgo-image.bb
+++ b/meta/recipes-devtools/images/python-pgo-image.bb
@@ -1,7 +1,8 @@
 SUMMARY = "Minimal image for doing Python profiling (for PGO)"
 
 IMAGE_FEATURES += "ssh-server-dropbear"
-IMAGE_INSTALL = "packagegroup-core-boot python-profile-opt python-profile-opt-tests"
+IMAGE_INSTALL = "packagegroup-core-boot"
+IMAGE_INSTALL += "python-profile-opt python-profile-opt-tests python-profile-opt-tools"
 
 LICENSE = "MIT"
 
@@ -9,12 +10,13 @@ inherit core-image
 
 PYTHON_PROFILE_DIR ?= "${TMPDIR}/work-shared/${MACHINE}/python/pgo-data"
 PYTHON_PROFILE_TASK_DEFAULT = "-m test.regrtest --pgo -w -x test_asyncore test_gdb test_multiprocessing test_subprocess"
-# Exclude tests that are segfaulting on qemux86 target
-PYTHON_PROFILE_TASK_DEFAULT += "test_bytes test_str test_string test_tuple test_unicode test_userstring test_xmlrpc"
-# Exclude tests that are failing on qemux86
-PYTHON_PROFILE_TASK_DEFAULT += "test_StringIO test_builtin test_calendar test_cmath test_ctypes test_distutils test_exceptions test_getargs test_gzip test_json test_math test_shutil test_socket test_sqlite test_traceback test_warnings"
-# Exclude tests that are taking very long on qemux86
-PYTHON_PROFILE_TASK_DEFAULT += "test_io test_lib2to3 test_itertools"
+## Exclude tests that are segfaulting on qemux86 target
+#PYTHON_PROFILE_TASK_DEFAULT += "test_bytes test_str test_string test_tuple test_unicode test_userstring test_xmlrpc"
+## Exclude tests that are failing on qemux86
+#PYTHON_PROFILE_TASK_DEFAULT += "test_StringIO test_builtin test_calendar test_cmath test_ctypes test_distutils test_exceptions test_getargs test_gzip test_json test_math test_shutil test_socket test_sqlite test_traceback test_warnings"
+## Exclude tests that are taking very long on qemux86
+#PYTHON_PROFILE_TASK_DEFAULT += "test_io test_lib2to3 test_itertools"
+PYTHON_PROFILE_TASK_DEFAULT = "/opt/share/doc/python-profile-opt/Tools/pybench/pybench.py -n 2 --with-gc --with-syscheck"
 PYTHON_PROFILE_TASK ?= "${PYTHON_PROFILE_TASK_DEFAULT}"
 
 # We need these because we're utilizing the runtime test helpers from oeqa
-- 
2.10.2


