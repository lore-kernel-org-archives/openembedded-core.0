Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EF94873208
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 12:41:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 25 Jan 2017 04:41:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,283,1477983600"; d="scan'208";a="35260425"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 25 Jan 2017 04:41:11 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2017 14:40:58 +0200
Message-Id: <20170125124101.29425-8-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170125124101.29425-1-markus.lehtonen@linux.intel.com>
References: <20170125124101.29425-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH RFC 07/10] python-pgo-image: exclude tests from the default profile target
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
X-List-Received-Date: Wed, 25 Jan 2017 12:41:11 -0000

Exclue tests that are segfaulting or otherwise failing (on qemux86
target), and thus, causing the profile task to fail.

Also, disable tests that are taking very long to execute. In qemux86
target on my i7-3770K:
  test_lib2to3: 1908.8s
  test_io: 1278.4s
  test_itertools: 436.4s

[YOCTO #9338]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-devtools/images/python-pgo-image.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/images/python-pgo-image.bb b/meta/recipes-devtools/images/python-pgo-image.bb
index 1aabd56..222d7a8 100644
--- a/meta/recipes-devtools/images/python-pgo-image.bb
+++ b/meta/recipes-devtools/images/python-pgo-image.bb
@@ -8,7 +8,14 @@ LICENSE = "MIT"
 inherit core-image
 
 PYTHON_PROFILE_DIR ?= "${TMPDIR}/work-shared/${MACHINE}/python/pgo-data"
-PYTHON_PROFILE_TASK ?= "-m test.regrtest --pgo -w -x test_asyncore test_gdb test_multiprocessing test_subprocess"
+PYTHON_PROFILE_TASK_DEFAULT = "-m test.regrtest --pgo -w -x test_asyncore test_gdb test_multiprocessing test_subprocess"
+# Exclude tests that are segfaulting on qemux86 target
+PYTHON_PROFILE_TASK_DEFAULT += "test_bytes test_str test_string test_tuple test_unicode test_userstring test_xmlrpc"
+# Exclude tests that are failing on qemux86
+PYTHON_PROFILE_TASK_DEFAULT += "test_StringIO test_builtin test_calendar test_cmath test_ctypes test_distutils test_exceptions test_getargs test_gzip test_json test_math test_shutil test_socket test_sqlite test_traceback test_warnings"
+# Exclude tests that are taking very long on qemux86
+PYTHON_PROFILE_TASK_DEFAULT += "test_io test_lib2to3 test_itertools"
+PYTHON_PROFILE_TASK ?= "${PYTHON_PROFILE_TASK_DEFAULT}"
 
 # We need these because we're utilizing the runtime test helpers from oeqa
 TEST_TARGET ?= "qemu"
-- 
2.10.2


