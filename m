Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 73E2E71BD4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:36:11 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Feb 2017 02:36:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,186,1484035200"; d="scan'208";a="1132314552"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 20 Feb 2017 02:36:11 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Feb 2017 12:35:49 +0200
Message-Id: <20170220103551.20022-18-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170220103551.20022-1-markus.lehtonen@linux.intel.com>
References: <20170220103551.20022-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH 18/20] python-pgo-image: exclude tests from the python3 profile target
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
X-List-Received-Date: Mon, 20 Feb 2017 10:36:11 -0000

Exlude failing tests (on qemux86 target) which would cause the profile
task to fail.

Also, disable some very long running tests. Running in qemux86 target on
my i7-3770K:
  test_lib2to3: 1604.5s
  test_buffer: 1562.8s
  test_pickle: 1527.0s
  test_io: 1517.8s
  test_threading: 1384.1s
  test_asyncio: 1380.9s
  test_urllib2_localnet: 1276.8s
  test_itertools: 944.7s
  test_tuple: 847.7s
  test_trace: 756.7s
  test_tarfile: 716.7s
  test_unicodedata: 709.9s
  test_decimal: 615.1s
  test_buffer: 1562.8s
  test_pickle: 1527.0s
  test_io: 1517.8s
  test_threading: 1384.1s
  test_asyncio: 1380.9s
  test_urllib2_localnet: 1276.8s
  test_itertools: 944.7s
  test_tuple: 847.7s
  test_trace: 756.7s
  test_tarfile: 716.7s
  test_unicodedata: 709.9s
  test_decimal: 615.1s

[YOCTO #9338]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-devtools/images/python-pgo-image.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/images/python-pgo-image.bb b/meta/recipes-devtools/images/python-pgo-image.bb
index ca690d5..db67cf3 100644
--- a/meta/recipes-devtools/images/python-pgo-image.bb
+++ b/meta/recipes-devtools/images/python-pgo-image.bb
@@ -23,6 +23,11 @@ PYTHON_PROFILE_TASK ?= "${PYTHON_PROFILE_TASK_DEFAULT}"
 
 PYTHON3_PROFILE_DIR ?= "${TMPDIR}/work-shared/${MACHINE}/python3/pgo-data"
 PYTHON3_PROFILE_TASK_DEFAULT = "-m test.regrtest --pgo -w -x test_asyncore test_gdb test_multiprocessing_fork test_multiprocessing_forkserver test_multiprocessing_main_handling test_multiprocessing_spawn test_subprocess"
+# Exclude tests that are failing on qemux86
+PYTHON3_PROFILE_TASK_DEFAULT += "test_builtin test_cmath test_concurrent_futures test_difflib test_distutils test_float test_format test_math test_optparse test_shutil test_statistics test_types test_unicode"
+# Exclude tests that are taking very long on qemux86
+PYTHON3_PROFILE_TASK_DEFAULT += "test_lib2to3 test_buffer test_pickle test_io test_threading test_asyncio test_urllib2_localnet test_itertools test_tuple test_trace test_tarfile test_unicodedata test_decimal"
+PYTHON3_PROFILE_TASK_DEFAULT += "test_long test_zipfile test_deque test_descr test_email test_venv test_bytes test_compileall test_ast test_multibytecodec"
 
 PYTHON3_PROFILE_TASK ?= "${PYTHON3_PROFILE_TASK_DEFAULT}"
 
-- 
2.10.2


