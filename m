Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id A5DBA77E51
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 13:19:07 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 May 2017 06:19:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,349,1491289200"; d="scan'208";a="102711867"
Received: from bkearns-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.10.90])
	by fmsmga006.fm.intel.com with ESMTP; 16 May 2017 06:19:05 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 May 2017 16:18:39 +0300
Message-Id: <4cb5906e803e5a234e223b32a1ad8d02d931b816.1494939394.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
References: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
References: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH v2 09/20] python-pgo-image: switch python default profile task to pybench
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
X-List-Received-Date: Tue, 16 May 2017 13:19:08 -0000

Switch to pybench in order to reduce the time taken by profiling.

[YOCTO #9338]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-devtools/images/python-pgo-image.bb | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/images/python-pgo-image.bb b/meta/recipes-devtools/images/python-pgo-image.bb
index 426d6acb45..33aa9a1fec 100644
--- a/meta/recipes-devtools/images/python-pgo-image.bb
+++ b/meta/recipes-devtools/images/python-pgo-image.bb
@@ -1,20 +1,22 @@
 SUMMARY = "Minimal image for doing Python profiling (for PGO)"
 
 IMAGE_FEATURES += "ssh-server-dropbear"
-IMAGE_INSTALL = "packagegroup-core-boot python-profile-opt python-profile-opt-tests"
+IMAGE_INSTALL = "packagegroup-core-boot"
+IMAGE_INSTALL += "python-profile-opt python-profile-opt-tests python-profile-opt-tools"
 
 LICENSE = "MIT"
 
 inherit core-image
 
 PYTHON_PROFILE_DIR ?= "${TMPDIR}/work-shared/${MACHINE}/python/pgo-data"
-PYTHON_PROFILE_TASK_DEFAULT = "-m test.regrtest --pgo -w -x test_asyncore test_gdb test_multiprocessing test_subprocess"
-# Exclude tests that are segfaulting on qemux86 target
-PYTHON_PROFILE_TASK_DEFAULT += "test_bytes test_str test_string test_tuple test_unicode test_userstring test_xmlrpc"
-# Exclude tests that are failing on qemux86
-PYTHON_PROFILE_TASK_DEFAULT += "test_StringIO test_builtin test_calendar test_cmath test_ctypes test_distutils test_exceptions test_getargs test_gzip test_json test_math test_shutil test_socket test_sqlite test_sysconfig test_traceback test_warnings"
-# Exclude tests that are taking very long on qemux86
-PYTHON_PROFILE_TASK_DEFAULT += "test_io test_lib2to3 test_itertools"
+#PYTHON_PROFILE_TASK_DEFAULT = "-m test.regrtest --pgo -w -x test_asyncore test_gdb test_multiprocessing test_subprocess"
+## Exclude tests that are segfaulting on qemux86 target
+#PYTHON_PROFILE_TASK_DEFAULT += "test_bytes test_str test_string test_tuple test_unicode test_userstring test_xmlrpc"
+## Exclude tests that are failing on qemux86
+#PYTHON_PROFILE_TASK_DEFAULT += "test_StringIO test_builtin test_calendar test_cmath test_ctypes test_distutils test_exceptions test_getargs test_gzip test_json test_math test_shutil test_socket test_sqlite test_sysconfig test_traceback test_warnings"
+## Exclude tests that are taking very long on qemux86
+#PYTHON_PROFILE_TASK_DEFAULT += "test_io test_lib2to3 test_itertools"
+PYTHON_PROFILE_TASK_DEFAULT = "/opt/share/doc/python-profile-opt/Tools/pybench/pybench.py -n 2 --with-gc --with-syscheck"
 PYTHON_PROFILE_TASK ?= "${PYTHON_PROFILE_TASK_DEFAULT}"
 
 # We need these because we're utilizing the runtime test helpers from oeqa
-- 
2.12.0


