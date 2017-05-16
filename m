Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 1ED9B77DB1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 13:19:19 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP; 16 May 2017 06:19:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,349,1491289200"; d="scan'208";a="102711950"
Received: from bkearns-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.10.90])
	by fmsmga006.fm.intel.com with ESMTP; 16 May 2017 06:19:19 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 May 2017 16:18:50 +0300
Message-Id: <d5e464c405080ef6afac33a68652badb02c8db73.1494939394.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
References: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
References: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH v2 20/20] python-pgo-image: change python3 profile target to pybench
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
X-List-Received-Date: Tue, 16 May 2017 13:19:19 -0000

Running test.regrtest was still taking ridiculously long, i.e. around 4
hours in qemux86 on my desktop machine. Change to pybench which "only"
takes around 55 minutes.

[YOCTO #9338]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-devtools/images/python-pgo-image.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/images/python-pgo-image.bb b/meta/recipes-devtools/images/python-pgo-image.bb
index e16cd52486..dc98e0c839 100644
--- a/meta/recipes-devtools/images/python-pgo-image.bb
+++ b/meta/recipes-devtools/images/python-pgo-image.bb
@@ -3,7 +3,7 @@ SUMMARY = "Minimal image for doing Python profiling (for PGO)"
 IMAGE_FEATURES += "ssh-server-dropbear"
 IMAGE_INSTALL = "packagegroup-core-boot"
 IMAGE_INSTALL += "python-profile-opt python-profile-opt-tests python-profile-opt-tools"
-IMAGE_INSTALL += "python-profile-opt3 python-profile-opt3-tests"
+IMAGE_INSTALL += "python-profile-opt3 python-profile-opt3-tests python-profile-opt3-tools"
 
 LICENSE = "MIT"
 
@@ -22,12 +22,13 @@ PYTHON_PROFILE_TASK_DEFAULT = "/opt/share/doc/python-profile-opt/Tools/pybench/p
 PYTHON_PROFILE_TASK ?= "${PYTHON_PROFILE_TASK_DEFAULT}"
 
 PYTHON3_PROFILE_DIR ?= "${TMPDIR}/work-shared/${MACHINE}/python3/pgo-data"
-PYTHON3_PROFILE_TASK_DEFAULT = "-m test.regrtest --pgo -w -x test_asyncore test_gdb test_multiprocessing_fork test_multiprocessing_forkserver test_multiprocessing_main_handling test_multiprocessing_spawn test_subprocess"
+#PYTHON3_PROFILE_TASK_DEFAULT = "-m test.regrtest --pgo -w -x test_asyncore test_gdb test_multiprocessing_fork test_multiprocessing_forkserver test_multiprocessing_main_handling test_multiprocessing_spawn test_subprocess"
 # Exclude tests that are failing on qemux86
-PYTHON3_PROFILE_TASK_DEFAULT += "test_builtin test_cmath test_concurrent_futures test_difflib test_distutils test_float test_format test_math test_optparse test_shutil test_statistics test_types test_unicode"
+#PYTHON3_PROFILE_TASK_DEFAULT += "test_builtin test_cmath test_concurrent_futures test_difflib test_distutils test_float test_format test_math test_optparse test_shutil test_statistics test_types test_unicode"
 # Exclude tests that are taking very long on qemux86
-PYTHON3_PROFILE_TASK_DEFAULT += "test_lib2to3 test_buffer test_pickle test_io test_threading test_asyncio test_urllib2_localnet test_itertools test_tuple test_trace test_tarfile test_unicodedata test_decimal"
-PYTHON3_PROFILE_TASK_DEFAULT += "test_long test_zipfile test_deque test_descr test_email test_venv test_bytes test_compileall test_ast test_multibytecodec"
+#PYTHON3_PROFILE_TASK_DEFAULT += "test_lib2to3 test_buffer test_pickle test_io test_threading test_asyncio test_urllib2_localnet test_itertools test_tuple test_trace test_tarfile test_unicodedata test_decimal"
+#PYTHON3_PROFILE_TASK_DEFAULT += "test_long test_zipfile test_deque test_descr test_email test_venv test_bytes test_compileall test_ast test_multibytecodec"
+PYTHON3_PROFILE_TASK_DEFAULT = "/opt/share/doc/python-profile-opt3/Tools/pybench/pybench.py -n 2 --with-gc --with-syscheck"
 
 PYTHON3_PROFILE_TASK ?= "${PYTHON3_PROFILE_TASK_DEFAULT}"
 
-- 
2.12.0


