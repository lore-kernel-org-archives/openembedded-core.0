Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8922477E2B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 13:19:02 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 May 2017 06:19:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,349,1491289200"; d="scan'208";a="102711842"
Received: from bkearns-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.10.90])
	by fmsmga006.fm.intel.com with ESMTP; 16 May 2017 06:19:03 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 May 2017 16:18:37 +0300
Message-Id: <0d264b2bb80ad67ab6113bddba94292c4a2ae349.1494939394.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
References: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
References: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH v2 07/20] python-pgo-image: exclude tests from the default profile target
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
X-List-Received-Date: Tue, 16 May 2017 13:19:02 -0000

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
index af9da20338..426d6acb45 100644
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
+PYTHON_PROFILE_TASK_DEFAULT += "test_StringIO test_builtin test_calendar test_cmath test_ctypes test_distutils test_exceptions test_getargs test_gzip test_json test_math test_shutil test_socket test_sqlite test_sysconfig test_traceback test_warnings"
+# Exclude tests that are taking very long on qemux86
+PYTHON_PROFILE_TASK_DEFAULT += "test_io test_lib2to3 test_itertools"
+PYTHON_PROFILE_TASK ?= "${PYTHON_PROFILE_TASK_DEFAULT}"
 
 # We need these because we're utilizing the runtime test helpers from oeqa
 TEST_TARGET ?= "qemu"
-- 
2.12.0


