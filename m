Return-Path: <stefanx.stanacar@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id C27C46077F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 16:47:00 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 12 Jul 2013 09:47:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,654,1367996400"; d="scan'208";a="267494776"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Jul 2013 09:47:01 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id E926E6A4092
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 09:46:59 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jul 2013 19:46:56 +0300
Message-Id: <1dad9f83f59020db8c50a7b0ae6fb2af75496194.1373647359.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <cover.1373647359.git.stefanx.stanacar@intel.com>
References: <cover.1373647359.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1373647359.git.stefanx.stanacar@intel.com>
References: <cover.1373647359.git.stefanx.stanacar@intel.com>
MIME-Version: 1.0
Subject: [PATCH 8/8] testimage.bbclass, lib/oeqa: add headers and comments
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
X-List-Received-Date: Fri, 12 Jul 2013 16:47:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds some comments to testimage.bbclass and the files it calls,
just to give an ideea of what it does.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/classes/testimage.bbclass    | 24 ++++++++++++++++++++++++
 meta/lib/oeqa/oetest.py           |  9 +++++++++
 meta/lib/oeqa/utils/decorators.py |  8 ++++++++
 meta/lib/oeqa/utils/sshcontrol.py |  9 +++++++++
 4 files changed, 50 insertions(+)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 940520f..903849d 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -1,3 +1,27 @@
+# Copyright (C) 2013 Intel Corporation
+#
+# Released under the MIT license (see COPYING.MIT)
+
+
+# testimage.bbclass enables testing of qemu images using python unittests.
+# Most of the tests are commands run on target image over ssh.
+# To use it add testimage to global inherit and call your target image with -c testimage
+# You can try it out like this:
+# - first build a qemu core-image-sato
+# - add INHERIT += "testimage" in local.conf
+# - then bitbake core-image-sato -c testimage. That will run a standard suite of tests.
+
+# You can set (or append to) TEST_SUITES in local.conf to select the tests
+# which you want to run for your target.
+# The test names are the module names in meta/lib/oeqa/runtime.
+# Each name in TEST_SUITES represents a required test for the image. (no skipping allowed)
+# Appending "auto" means that it will try to run all tests that are suitable for the image (each test decides that on it's own).
+# Note that order in TEST_SUITES is important (it's the order tests run) and it influences tests dependencies.
+
+# TEST_LOG_DIR contains a ssh log (what command is running, output and return codes) and a qemu boot log till login
+# Booting is handled by this class, and it's not a test in itself.
+# TEST_QEMUBOOT_TIMEOUT can be used to set the maximum time in seconds the launch code will wait for the login prompt.
+
 TEST_LOG_DIR ?= "${WORKDIR}/testimage"
 
 DEFAULT_TEST_SUITES = "ping auto"
diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 5777ff8..7f6baa4 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -1,3 +1,12 @@
+# Copyright (C) 2013 Intel Corporation
+#
+# Released under the MIT license (see COPYING.MIT)
+
+# Main unittest module used by testimage.bbclass
+# This provides the oeRuntimeTest base class which is inherited by all tests in meta/lib/oeqa/runtime.
+
+# It also has some helper functions and it's responsible for actually starting the tests
+
 import os, re, mmap
 import unittest
 import inspect
diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
index 21e6b22..adec65e 100644
--- a/meta/lib/oeqa/utils/decorators.py
+++ b/meta/lib/oeqa/utils/decorators.py
@@ -1,3 +1,11 @@
+# Copyright (C) 2013 Intel Corporation
+#
+# Released under the MIT license (see COPYING.MIT)
+
+# Some custom decorators that can be used by unittests
+# Most useful is skipUnlessPassed which can be used for
+# creating dependecies between two test methods.
+
 from oeqa.oetest import *
 
 class skipIfFailure(object):
diff --git a/meta/lib/oeqa/utils/sshcontrol.py b/meta/lib/oeqa/utils/sshcontrol.py
index 6c61caa..8f98c45 100644
--- a/meta/lib/oeqa/utils/sshcontrol.py
+++ b/meta/lib/oeqa/utils/sshcontrol.py
@@ -1,3 +1,12 @@
+# Copyright (C) 2013 Intel Corporation
+#
+# Released under the MIT license (see COPYING.MIT)
+
+# Provides a class for setting up ssh connections,
+# running commands and copying files to/from a target.
+# It's used by testimage.bbclass and tests in lib/oeqa/runtime.
+
+
 import subprocess
 import time
 import os
-- 
1.8.1.4


