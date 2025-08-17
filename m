Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE2C9CA0EE9
	for <webhook@archiver.kernel.org>; Sun, 17 Aug 2025 20:51:32 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.60607.1755463891257792460
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Aug 2025 13:51:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XityiiPE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45a1abf5466so18721205e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 13:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1755463889; x=1756068689; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bKwHDccNirhx8D6hz7IUweaFpqDw6YB81zXg3cu153g=;
        b=XityiiPEej8hJEura/Q4DBVmjhz8Pid/icrggltJF+cQyWsraPi2JGhLITg1Jrof1I
         0Yg4l+sZu56FVmCyVH9n3w5zogsuZ5WiFVrujnnVm1To/KI6/Xh5H+/Pbk9caC/3i63h
         TpkSf3fC1727OPnQXmAozsj80weBAE5dPL2iA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755463889; x=1756068689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bKwHDccNirhx8D6hz7IUweaFpqDw6YB81zXg3cu153g=;
        b=maob5kXnfi9rW4530vnIhAHPDYQ++l9UBZVSep3Oldx9OJTd+E2pEC/a660zQ4i80X
         mvIDOsKVmLWEVqv06GMgWzH/Ni7DaU6e8rJFBryd9xYBbVBXrUVLbBvMVHK9cRxYiFOT
         bAbIk1JPhAXvwFTPPIozTHRrfwrPFkdU303erVosTBuW70F+q54IBE1fWyBEcv2ghNaA
         odQ2qs0Tt78AyyZiaZXMZWbKbtDaHzXO6pVcL72Sfb0S7n59FMBQFm3+6/cFvfYF4mxD
         ithCGc81BeRkF9YZcSylm06/nMjyCoYch1nxF0pwHYi/xjpKvYGM8rg9mT33eQti1+t/
         astw==
X-Gm-Message-State: AOJu0YzzLxIFl3uHsO6ine5mYEY7XjanAK3E2F5uZDWEyo2suKUj0myh
	oYffVeO4Z6XgyPnDaKKAa/EJVRPucxnNlsKzczTFdHBjEq4FZjp/RmbFXaMBD3ae/vO1rP2Fe1C
	9/pwr
X-Gm-Gg: ASbGncs6kiexFAD7GgjkltxTgjHrnd3/njCqbObjE5vEntBgw9bCSY/rHqAkRfQWU27
	A12/KUGmHc8VOXA0cCMQmk4IGpN0Ff7JRjaChLg9lV1E2zHLcQy16ESw+bPILx98IHZsMkCPkAU
	W1SglggPpAPw8gG/uyjgZNyKwvPxL909QVbz0z8efXmAT3dF3Vzc8FjCfd8GjnfwP7rSJYtTnQb
	W2PS1MQPTcdJtzXZQB6oebYhohr5ro0pl/gkVvjas1lF5c5Y5AlesWBgw/QcTWdl8cPZ8sJViqn
	gKK3hTyLvfqtX13FgLmG2gMxbhCJNc14eVQ0HpjuraaW4U5ch9WQfw6hx7o/FdfK6VX0mZ44sHI
	TPxFvO6MhztuG6mSKvWHOrMV+owrgweIOmFlYZBNwZoJUy9iqnkE=
X-Google-Smtp-Source: AGHT+IHwF2DYjWnb7RJBnV0KzrXFaQsoLcJAeVIgkKsaCb+UZF47OWGt5rT6IicPYACAbPWaDckRDA==
X-Received: by 2002:a05:600c:1d25:b0:458:b8b0:6338 with SMTP id 5b1f17b1804b1-45b3f05dc34mr6207175e9.6.1755463889130;
        Sun, 17 Aug 2025 13:51:29 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:128f:f0b2:1625:2f99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6ce764sm143284475e9.10.2025.08.17.13.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 13:51:28 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Michael Jeanson <mjeanson@efficios.com>
Subject: [PATCH 3/5] babeltrace2: Fix python bindings ptests
Date: Sun, 17 Aug 2025 21:51:17 +0100
Message-ID: <20250817205124.3384337-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250817205124.3384337-1-richard.purdie@linuxfoundation.org>
References: <20250817205124.3384337-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 20:51:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222023

From: Michael Jeanson <mjeanson@efficios.com>

The python bindings ptests weren't functional. This patch:

  * Adds a patch to allow the tests to be executed on target standalone
  * Sets a variable to allow the right install path to be passed to setup.py
  * Sets the right paths in the ptest runner script for the python modules
  * Installs the missing data needed to run the tests

Base patch was written by Michael Jeanson, RP then tweaked working
and formatting and added config to complete the work on all arches.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../babeltrace2/external-python-tests.patch   | 126 ++++++++++++++++++
 .../lttng/babeltrace2/run-ptest               |   3 +
 .../recipes-kernel/lttng/babeltrace2_2.1.1.bb |   7 +-
 3 files changed, 134 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/babeltrace2/external-python-tests.patch

diff --git a/meta/recipes-kernel/lttng/babeltrace2/external-python-tests.patch b/meta/recipes-kernel/lttng/babeltrace2/external-python-tests.patch
new file mode 100644
index 00000000000..960b33d9595
--- /dev/null
+++ b/meta/recipes-kernel/lttng/babeltrace2/external-python-tests.patch
@@ -0,0 +1,126 @@
+From d2f528aa09a9001e63710470f6b700d122494961 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Thu, 14 Aug 2025 12:27:16 -0400
+Subject: [PATCH babeltrace] bindings/python: Allow tests to be run externally
+
+Upstream doesn't officially support running their tests externally. The python
+bindings need some tweaks to work in this configuration.
+
+The patch was created by Michael Jeanson <mjeanson@efficios.com> and is under
+discussion with upstream to see if there is a way to support OE's ue case.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Change-Id: I89555a3fbd821baa7088acc154e81665102286b8
+---
+ .../python/bt2/test_component_descriptor.py   |   2 +-
+ tests/bindings/python/bt2/test_graph.py       |   2 +-
+ tests/bindings/python/bt2/test_plugin.py      |  10 +-
+ .../python/bt2/test_query_executor.py         |   2 +-
+ tests/utils/utils.sh                          |   2 +-
+ 6 files changed, 117 insertions(+), 9 deletions(-)
+ create mode 100644 tests/0001-wip-tests-yocto.patch
+
+diff --git a/tests/bindings/python/bt2/test_component_descriptor.py b/tests/bindings/python/bt2/test_component_descriptor.py
+index dcad514eb..49a3c054d 100644
+--- a/tests/bindings/python/bt2/test_component_descriptor.py
++++ b/tests/bindings/python/bt2/test_component_descriptor.py
+@@ -19,7 +19,7 @@ class ComponentDescriptorTestCase(unittest.TestCase):
+         self._comp_descr = bt2.ComponentDescriptor(_DummySink, {"zoom": -23}, self._obj)
+ 
+     def _get_comp_cls_from_plugin(self):
+-        plugin = bt2.find_plugin("text", find_in_user_dir=False, find_in_sys_dir=False)
++        plugin = bt2.find_plugin("text", find_in_user_dir=False, find_in_sys_dir=True)
+         assert plugin is not None
+         cc = plugin.source_component_classes["dmesg"]
+         assert cc is not None
+diff --git a/tests/bindings/python/bt2/test_graph.py b/tests/bindings/python/bt2/test_graph.py
+index 9661667a9..7fe247bd9 100644
+--- a/tests/bindings/python/bt2/test_graph.py
++++ b/tests/bindings/python/bt2/test_graph.py
+@@ -113,7 +113,7 @@ class GraphTestCase(unittest.TestCase):
+         del comp_obj
+ 
+     def test_add_component_obj_non_python_comp_cls(self):
+-        plugin = bt2.find_plugin("text", find_in_user_dir=False, find_in_sys_dir=False)
++        plugin = bt2.find_plugin("text", find_in_user_dir=False, find_in_sys_dir=True)
+         assert plugin is not None
+         cc = plugin.source_component_classes["dmesg"]
+         assert cc is not None
+diff --git a/tests/bindings/python/bt2/test_plugin.py b/tests/bindings/python/bt2/test_plugin.py
+index 0d7a9e775..39451f93a 100644
+--- a/tests/bindings/python/bt2/test_plugin.py
++++ b/tests/bindings/python/bt2/test_plugin.py
+@@ -41,7 +41,7 @@ class FindPluginsTestCase(unittest.TestCase):
+             )
+ 
+     def test_find_none_existing_dir(self):
+-        plugins = bt2.find_plugins_in_path(_TEST_PLUGIN_PLUGINS_PATH, recurse=False)
++        plugins = bt2.find_plugins_in_path(os.environ["BT_TESTS_BUILDDIR"], recurse=False)
+         self.assertIsNone(plugins)
+ 
+     def test_find_dir(self):
+@@ -53,7 +53,7 @@ class FindPluginsTestCase(unittest.TestCase):
+             os.environ["BT_TESTS_OS_TYPE"], "so"
+         )
+         plugin_name = "babeltrace-plugin-utils.{}".format(extension)
+-        path = os.path.join(_TEST_PLUGIN_PLUGINS_PATH, "utils", ".libs", plugin_name)
++        path = os.path.join(_TEST_PLUGIN_PLUGINS_PATH, plugin_name)
+         pset = bt2.find_plugins_in_path(path)
+         self.assertTrue(len(pset) == 1)
+ 
+@@ -66,14 +66,14 @@ class FindPluginTestCase(unittest.TestCase):
+         self.assertIsNone(plugin)
+ 
+     def test_find_existing(self):
+-        plugin = bt2.find_plugin("ctf", find_in_user_dir=False, find_in_sys_dir=False)
++        plugin = bt2.find_plugin("ctf", find_in_user_dir=False, find_in_sys_dir=True)
+         self.assertIsNotNone(plugin)
+ 
+ 
+ class PluginTestCase(unittest.TestCase):
+     def setUp(self):
+         self._plugin = bt2.find_plugin(
+-            "ctf", find_in_user_dir=False, find_in_sys_dir=False
++            "ctf", find_in_user_dir=False, find_in_sys_dir=True
+         )
+ 
+     def tearDown(self):
+@@ -125,7 +125,7 @@ class PluginTestCase(unittest.TestCase):
+         self.assertEqual(plugins["lttng-live"].name, "lttng-live")
+ 
+     def test_filter_comp_classes_len(self):
+-        plugin = bt2.find_plugin("utils", find_in_user_dir=False, find_in_sys_dir=False)
++        plugin = bt2.find_plugin("utils", find_in_user_dir=False, find_in_sys_dir=True)
+         self.assertEqual(len(plugin.filter_component_classes), 2)
+ 
+     def test_sink_comp_classes_len(self):
+diff --git a/tests/bindings/python/bt2/test_query_executor.py b/tests/bindings/python/bt2/test_query_executor.py
+index 099457197..9bbfd417a 100644
+--- a/tests/bindings/python/bt2/test_query_executor.py
++++ b/tests/bindings/python/bt2/test_query_executor.py
+@@ -129,7 +129,7 @@ class QueryExecutorTestCase(unittest.TestCase):
+         del query_method_obj
+ 
+     def test_query_with_method_obj_non_python_comp_cls(self):
+-        plugin = bt2.find_plugin("text", find_in_user_dir=False, find_in_sys_dir=False)
++        plugin = bt2.find_plugin("text", find_in_user_dir=False, find_in_sys_dir=True)
+         assert plugin is not None
+         cc = plugin.source_component_classes["dmesg"]
+         assert cc is not None
+diff --git a/tests/utils/utils.sh b/tests/utils/utils.sh
+index 28db595d1..05b87f64e 100644
+--- a/tests/utils/utils.sh
++++ b/tests/utils/utils.sh
+@@ -143,7 +143,7 @@ export BT_TESTS_BT2_BIN
+ # bt_run_in_py_env() to use it.
+ #
+ # TODO: Remove when `tests/bindings/python/bt2/test_plugin.py` is fixed.
+-_bt_tests_plugins_path=$BT_TESTS_BUILDDIR/../src/plugins
++_bt_tests_plugins_path=/usr/lib/babeltrace2/plugins
+ 
+ # Colon-separated list of project plugin paths, if not set
+ _bt_tests_set_var_def BT_TESTS_BABELTRACE_PLUGIN_PATH \
+-- 
+2.47.2
+
diff --git a/meta/recipes-kernel/lttng/babeltrace2/run-ptest b/meta/recipes-kernel/lttng/babeltrace2/run-ptest
index a0bf33b75de..55397c2dd62 100755
--- a/meta/recipes-kernel/lttng/babeltrace2/run-ptest
+++ b/meta/recipes-kernel/lttng/babeltrace2/run-ptest
@@ -6,6 +6,9 @@
 # test plan to raise ERRORs; this is just noise.
 makeargs="LOG_DRIVER_FLAGS=--ignore-exit abs_top_srcdir=$PWD abs_top_builddir=$PWD"
 
+declare -x BT_TESTS_BABELTRACE_PLUGIN_PATH="/usr/lib/babeltrace2/ptest/tests/utils/python"
+declare -x BT_TESTS_PROVIDER_DIR="/usr/lib/babeltrace2/plugin-providers"
+
 exec 2> error.log
 make -C tests -k -s $makeargs $target
 exitcode=$?
diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb b/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
index 88f589eafbc..52768f6ce3c 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-2.1;protocol=http
            file://0001-tests-fix-test-applications-in-cpp-common.patch \
            file://0001-tests-set-the-correct-plugin-directory.patch \
            file://0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch \
+           file://external-python-tests.patch \
            "
 SRCREV = "7f2f8cd6dac497cbb466efb31219b531c62013f5"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
@@ -21,6 +22,8 @@ inherit autotools pkgconfig ptest python3targetconfig
 
 EXTRA_OECONF = "--disable-debug-info --disable-Werror --enable-python-plugins --enable-python-bindings"
 
+export DISTSETUPOPTS = " --install-lib=${PYTHON_SITEPACKAGES_DIR}"
+
 PACKAGECONFIG ??= "manpages"
 PACKAGECONFIG[manpages] = ", --disable-man-pages, asciidoc-native xmlto-native"
 
@@ -67,8 +70,8 @@ do_install_ptest () {
 	find "${S}/tests/$d" -maxdepth 1 -name *.json \
 	     -exec install -t "${D}${PTEST_PATH}/tests/$d" {} \;
     done
-    install -d "${D}${PTEST_PATH}/tests/data/ctf-traces/"
-    cp -a ${S}/tests/data/ctf-traces/* ${D}${PTEST_PATH}/tests/data/ctf-traces/
+    install -d "${D}${PTEST_PATH}/tests/data/"
+    cp -a ${S}/tests/data/* ${D}${PTEST_PATH}/tests/data/
 
     # Copy the tests directory tree and the executables and
     # Makefiles found within.

