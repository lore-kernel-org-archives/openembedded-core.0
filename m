Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.28382.1595449895803731590
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2020 13:31:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: joe.slater@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 06MKUwhu007064
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2020 13:31:24 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Wed, 22 Jul 2020
 13:31:11 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [oe-core][PATCH 1/1] libdnf: allow reproducible binary builds
Date: Wed, 22 Jul 2020 13:31:11 -0700
Message-ID: <20200722203111.140237-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Use a static TESTDATADIR if tests are disabled.  Allow
override of TESTDATADIR if tests are enabled since the
default will be wrong for target builds.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../libdnf/libdnf/enable_test_data_dir_set.patch   | 26 ++++++++++++++++++++++
 meta/recipes-devtools/libdnf/libdnf_0.48.0.bb      |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch

diff --git a/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch b/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
new file mode 100644
index 0000000..e3784cc
--- /dev/null
+++ b/meta/recipes-devtools/libdnf/libdnf/enable_test_data_dir_set.patch
@@ -0,0 +1,26 @@
+libdnf: allow reproducible binary builds
+
+Use a dummy directory for test data if not built WITH_TESTS.  Allow for overriding
+TESTDATADIR, since the default is guaranteed to be wrong for target builds.
+
+Upstream-Status: Pending
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -133,7 +133,12 @@ add_definitions(-DG_LOG_DOMAIN=\\"libdnf
+ add_definitions(-D_FILE_OFFSET_BITS=64)
+ 
+ # tests
+-add_definitions(-DTESTDATADIR=\\"${CMAKE_SOURCE_DIR}/data/tests\\")
++if(NOT WITH_TESTS)
++  set(TEST_DATA_DIR "/notests")
++elseif(NOT DEFINED TEST_DATA_DIR)
++  set(TEST_DATA_DIR "${CMAKE_SOURCE_DIR}/data/tests")
++endif()
++add_definitions(-DTESTDATADIR=\\"${TEST_DATA_DIR}\\")
+ 
+ # librhsm
+ if(ENABLE_RHSM_SUPPORT)
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.48.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.48.0.bb
index 947b2f2..37991e6 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.48.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.48.0.bb
@@ -8,6 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master \
            file://0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch \
            file://0001-Add-WITH_TESTS-option.patch \
            file://0001-Look-fo-sphinx-only-if-documentation-is-actually-ena.patch \
+           file://enable_test_data_dir_set.patch \
            "
 
 SRCREV = "46a28d0cf09277fffc11392e5e362a2eda0d53a8"
-- 
2.7.4

