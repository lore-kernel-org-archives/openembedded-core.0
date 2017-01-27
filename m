Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 88E43773B4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 10:13:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 27 Jan 2017 02:13:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,294,1477983600"; d="scan'208";a="36227445"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 27 Jan 2017 02:13:41 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 12:13:31 +0200
Message-Id: <20170127101331.14389-11-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170127101331.14389-1-markus.lehtonen@linux.intel.com>
References: <20170127101331.14389-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH RFC 10/10] python-pgo-image: change python3 profile target to pybench
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
X-List-Received-Date: Fri, 27 Jan 2017 10:13:41 -0000

Running test.regrtest was still taking ridiculously long, i.e. around 4
hours in qemux86 on my desktop machine. Change to pybench which "only"
takes around 55 minutes.

[YOCTO #9338]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-devtools/images/python-pgo-image.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/images/python-pgo-image.bb b/meta/recipes-devtools/images/python-pgo-image.bb
index db67cf3..008598e 100644
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
2.10.2


