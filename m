Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 04E266C135
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 19:14:44 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id k141-v6so30908850itk.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 11:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VpDrglAwNZvyVyFW+M9oYamWh9Ip9R7unM5uyZie4is=;
	b=cfZ6srGbvX1wrkE073KVunjEj3kz3TXmqOO/bLNF/DZ4kQmspfqnY2H1/zWaymJ8Wi
	5ynsv3o4ymna+/Z7G7sIKOZ/fmMtodTH3xQmUYoshYgVVZEZ/eT6FmM1cxk6B2i19m8Y
	/hznyiYf3bMe/wSTri7owc1iU/1l6fqSImnRqPFvZb2rj0qkGAaRHNRg+QPA+wc7W82O
	rCeRfyM+agC6fhqFv5zKVYLq9EFEF6RvPCGxaX1JKxp+gDRa9tuzIwHtkHWj6pE6qX5P
	7UNd/EhdXz3eN3E9UDbJ9l3BHPJNIYwjq5FrrPGUpaj+CBSY+5wYi8QzLvd4FFKVhx5l
	FoJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VpDrglAwNZvyVyFW+M9oYamWh9Ip9R7unM5uyZie4is=;
	b=HyZoS+4kv7Ux/th56+IrEe1a67AHljQVX9pUQkzBr6aDKxvWIvqXzwyM75Qo3YT5Mb
	hJGMlezfDoUk6nV93GTz4B3deHJceeVjAc23VZtaMjN3Aq2PvXGYehNE1TMnFic69L/H
	fbFK76L+taqf4ZwiKaw2sFh2hN5aYtNTZbgqMx8lR9o9Y9CkS3UVqS7y0WC6m0Q0JO6v
	0WKIt5eCp3mpq7HTGR36rdCyNBv3Gnxfsi/A0FypOqnqtwsLNLt9x6YeXMvPDrnIU5QH
	zwyrrViNzL7mrZmG7lgOKxQE37al7Nv+lhWSGZub5MtUYP/7DBvv4fO4EEC0f8yAYiUE
	B0/Q==
X-Gm-Message-State: AGRZ1gIQxfHn1/74023IQyxQeY77cvLePetUrCone2FSugHjnY4LEGuT
	uK8WDwmgxJy72SgsKL5nKYiTEJRcz9s=
X-Google-Smtp-Source: AJdET5c2OShqIEu4JAO9wEEZKYf9PGA2xQlfrovxwIvxoJ+FAxcHZobBoAfG5OyVRloDH+EZNRx5yg==
X-Received: by 2002:a24:2c1:: with SMTP id
	184-v6mr6826227itu.100.1542309285492; 
	Thu, 15 Nov 2018 11:14:45 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	19-v6sm6737309itk.7.2018.11.15.11.14.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 15 Nov 2018 11:14:44 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Nov 2018 13:14:42 -0600
Message-Id: <20181115191442.24106-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH] classes/testsdk: Split implementation into classes
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
X-List-Received-Date: Thu, 15 Nov 2018 19:14:45 -0000
Content-Transfer-Encoding: 8bit

Splits the SDK test implementation into separate class files. The
classes that are included are controlled by the variable
${TESTSDK_CLASSES}. This allows a SDK machine to change which classes
are used to implement the test cases.

[YOCTO #13020]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/testsdk-oecore.bbclass    |  88 +++++++++++
 meta/classes/testsdk.bbclass           | 202 ++-----------------------
 meta/classes/testsdkext-oecore.bbclass | 107 +++++++++++++
 3 files changed, 205 insertions(+), 192 deletions(-)
 create mode 100644 meta/classes/testsdk-oecore.bbclass
 create mode 100644 meta/classes/testsdkext-oecore.bbclass

diff --git a/meta/classes/testsdk-oecore.bbclass b/meta/classes/testsdk-oecore.bbclass
new file mode 100644
index 00000000000..9a85ac59397
--- /dev/null
+++ b/meta/classes/testsdk-oecore.bbclass
@@ -0,0 +1,88 @@
+# Copyright (C) 2013 - 2016 Intel Corporation
+#
+# Released under the MIT license (see COPYING.MIT)
+
+def testsdk_oecore_main(d):
+    import os
+    import subprocess
+    import json
+    import logging
+
+    from bb.utils import export_proxies
+    from oeqa.sdk.context import OESDKTestContext, OESDKTestContextExecutor
+    from oeqa.utils import make_logger_bitbake_compatible
+
+    pn = d.getVar("PN")
+    logger = make_logger_bitbake_compatible(logging.getLogger("BitBake"))
+
+    # sdk use network for download projects for build
+    export_proxies(d)
+
+    tcname = d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh")
+    if not os.path.exists(tcname):
+        bb.fatal("The toolchain %s is not built. Build it before running the tests: 'bitbake <image> -c populate_sdk' ." % tcname)
+
+    tdname = d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.testdata.json")
+    test_data = json.load(open(tdname, "r"))
+
+    target_pkg_manifest = OESDKTestContextExecutor._load_manifest(
+        d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.target.manifest"))
+    host_pkg_manifest = OESDKTestContextExecutor._load_manifest(
+        d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.host.manifest"))
+
+    processes = d.getVar("TESTIMAGE_NUMBER_THREADS") or d.getVar("BB_NUMBER_THREADS")
+    if processes:
+        try:
+            import testtools, subunit
+        except ImportError:
+            bb.warn("Failed to import testtools or subunit, the testcases will run serially")
+            processes = None
+
+    sdk_dir = d.expand("${WORKDIR}/testimage-sdk/")
+    bb.utils.remove(sdk_dir, True)
+    bb.utils.mkdirhier(sdk_dir)
+    try:
+        subprocess.check_output("cd %s; %s <<EOF\n./\nY\nEOF" % (sdk_dir, tcname), shell=True)
+    except subprocess.CalledProcessError as e:
+        bb.fatal("Couldn't install the SDK:\n%s" % e.output.decode("utf-8"))
+
+    fail = False
+    sdk_envs = OESDKTestContextExecutor._get_sdk_environs(sdk_dir)
+    for s in sdk_envs:
+        sdk_env = sdk_envs[s]
+        bb.plain("SDK testing environment: %s" % s)
+        tc = OESDKTestContext(td=test_data, logger=logger, sdk_dir=sdk_dir,
+            sdk_env=sdk_env, target_pkg_manifest=target_pkg_manifest,
+            host_pkg_manifest=host_pkg_manifest)
+
+        try:
+            tc.loadTests(OESDKTestContextExecutor.default_cases)
+        except Exception as e:
+            import traceback
+            bb.fatal("Loading tests failed:\n%s" % traceback.format_exc())
+
+        if processes:
+            result = tc.runTests(processes=int(processes))
+        else:
+            result = tc.runTests()
+
+        component = "%s %s" % (pn, OESDKTestContextExecutor.name)
+        context_msg = "%s:%s" % (os.path.basename(tcname), os.path.basename(sdk_env))
+        configuration = get_sdk_configuration(d, 'sdk')
+        result.logDetails(get_sdk_json_result_dir(d),
+                          configuration,
+                          get_sdk_result_id(configuration))
+        result.logSummary(component, context_msg)
+
+        if not result.wasSuccessful():
+            fail = True
+
+    if fail:
+        bb.fatal("%s - FAILED - check the task log and the commands log" % pn)
+
+testsdk_oecore_main[vardepsexclude] =+ "BB_ORIGENV"
+
+python do_testsdk() {
+    testsdk_oecore_main(d)
+}
+
diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 5b9bf7b2624..5be946fca47 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -38,200 +38,18 @@ def get_sdk_json_result_dir(d):
 def get_sdk_result_id(configuration):
     return '%s_%s_%s_%s_%s' % (configuration['TEST_TYPE'], configuration['IMAGE_BASENAME'], configuration['SDKMACHINE'], configuration['MACHINE'], configuration['STARTTIME'])
 
-def testsdk_main(d):
-    import os
-    import subprocess
-    import json
-    import logging
+TESTSDK_CLASSES ?= "testsdk-oecore testsdkext-oecore"
 
-    from bb.utils import export_proxies
-    from oeqa.sdk.context import OESDKTestContext, OESDKTestContextExecutor
-    from oeqa.utils import make_logger_bitbake_compatible
+inherit ${TESTSDK_CLASSES}
 
-    pn = d.getVar("PN")
-    logger = make_logger_bitbake_compatible(logging.getLogger("BitBake"))
-
-    # sdk use network for download projects for build
-    export_proxies(d)
-
-    tcname = d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh")
-    if not os.path.exists(tcname):
-        bb.fatal("The toolchain %s is not built. Build it before running the tests: 'bitbake <image> -c populate_sdk' ." % tcname)
-
-    tdname = d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.testdata.json")
-    test_data = json.load(open(tdname, "r"))
-
-    target_pkg_manifest = OESDKTestContextExecutor._load_manifest(
-        d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.target.manifest"))
-    host_pkg_manifest = OESDKTestContextExecutor._load_manifest(
-        d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.host.manifest"))
-
-    processes = d.getVar("TESTIMAGE_NUMBER_THREADS") or d.getVar("BB_NUMBER_THREADS")
-    if processes:
-        try:
-            import testtools, subunit
-        except ImportError:
-            bb.warn("Failed to import testtools or subunit, the testcases will run serially")
-            processes = None
-
-    sdk_dir = d.expand("${WORKDIR}/testimage-sdk/")
-    bb.utils.remove(sdk_dir, True)
-    bb.utils.mkdirhier(sdk_dir)
-    try:
-        subprocess.check_output("cd %s; %s <<EOF\n./\nY\nEOF" % (sdk_dir, tcname), shell=True)
-    except subprocess.CalledProcessError as e:
-        bb.fatal("Couldn't install the SDK:\n%s" % e.output.decode("utf-8"))
-
-    fail = False
-    sdk_envs = OESDKTestContextExecutor._get_sdk_environs(sdk_dir)
-    for s in sdk_envs:
-        sdk_env = sdk_envs[s]
-        bb.plain("SDK testing environment: %s" % s)
-        tc = OESDKTestContext(td=test_data, logger=logger, sdk_dir=sdk_dir,
-            sdk_env=sdk_env, target_pkg_manifest=target_pkg_manifest,
-            host_pkg_manifest=host_pkg_manifest)
-
-        try:
-            tc.loadTests(OESDKTestContextExecutor.default_cases)
-        except Exception as e:
-            import traceback
-            bb.fatal("Loading tests failed:\n%s" % traceback.format_exc())
-
-        if processes:
-            result = tc.runTests(processes=int(processes))
-        else:
-            result = tc.runTests()
-
-        component = "%s %s" % (pn, OESDKTestContextExecutor.name)
-        context_msg = "%s:%s" % (os.path.basename(tcname), os.path.basename(sdk_env))
-        configuration = get_sdk_configuration(d, 'sdk')
-        result.logDetails(get_sdk_json_result_dir(d),
-                          configuration,
-                          get_sdk_result_id(configuration))
-        result.logSummary(component, context_msg)
-
-        if not result.wasSuccessful():
-            fail = True
-
-    if fail:
-        bb.fatal("%s - FAILED - check the task log and the commands log" % pn)
-  
-testsdk_main[vardepsexclude] =+ "BB_ORIGENV"
-
-python do_testsdk() {
-    testsdk_main(d)
-}
-addtask testsdk
-do_testsdk[nostamp] = "1"
-
-def testsdkext_main(d):
-    import os
-    import json
-    import subprocess
-    import logging
-
-    from bb.utils import export_proxies
-    from oeqa.utils import avoid_paths_in_environ, make_logger_bitbake_compatible, subprocesstweak
-    from oeqa.sdkext.context import OESDKExtTestContext, OESDKExtTestContextExecutor
-
-    pn = d.getVar("PN")
-    logger = make_logger_bitbake_compatible(logging.getLogger("BitBake"))
-
-    # extensible sdk use network
-    export_proxies(d)
-
-    subprocesstweak.errors_have_output()
-
-    # extensible sdk can be contaminated if native programs are
-    # in PATH, i.e. use perl-native instead of eSDK one.
-    paths_to_avoid = [d.getVar('STAGING_DIR'),
-                      d.getVar('BASE_WORKDIR')]
-    os.environ['PATH'] = avoid_paths_in_environ(paths_to_avoid)
-
-    tcname = d.expand("${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.sh")
-    if not os.path.exists(tcname):
-        bb.fatal("The toolchain ext %s is not built. Build it before running the" \
-                 " tests: 'bitbake <image> -c populate_sdk_ext' ." % tcname)
-
-    tdname = d.expand("${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.testdata.json")
-    test_data = json.load(open(tdname, "r"))
-
-    target_pkg_manifest = OESDKExtTestContextExecutor._load_manifest(
-        d.expand("${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.target.manifest"))
-    host_pkg_manifest = OESDKExtTestContextExecutor._load_manifest(
-        d.expand("${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.host.manifest"))
-
-    sdk_dir = d.expand("${WORKDIR}/testsdkext/")
-    bb.utils.remove(sdk_dir, True)
-    bb.utils.mkdirhier(sdk_dir)
-    try:
-        subprocess.check_output("%s -y -d %s" % (tcname, sdk_dir), shell=True)
-    except subprocess.CalledProcessError as e:
-        msg = "Couldn't install the extensible SDK:\n%s" % e.output.decode("utf-8")
-        logfn = os.path.join(sdk_dir, 'preparing_build_system.log')
-        if os.path.exists(logfn):
-            msg += '\n\nContents of preparing_build_system.log:\n'
-            with open(logfn, 'r') as f:
-                for line in f:
-                    msg += line
-        bb.fatal(msg)
-
-    fail = False
-    sdk_envs = OESDKExtTestContextExecutor._get_sdk_environs(sdk_dir)
-    for s in sdk_envs:
-        bb.plain("Extensible SDK testing environment: %s" % s)
-
-        sdk_env = sdk_envs[s]
-
-        # Use our own SSTATE_DIR and DL_DIR so that updates to the eSDK come from our sstate cache
-        # and we don't spend hours downloading kernels for the kernel module test
-        # Abuse auto.conf since local.conf would be overwritten by the SDK
-        with open(os.path.join(sdk_dir, 'conf', 'auto.conf'), 'a+') as f:
-            f.write('SSTATE_MIRRORS += " \\n file://.* file://%s/PATH"\n' % test_data.get('SSTATE_DIR'))
-            f.write('SOURCE_MIRROR_URL = "file://%s"\n' % test_data.get('DL_DIR'))
-            f.write('INHERIT += "own-mirrors"\n')
-            f.write('PREMIRRORS_prepend = " git://git.yoctoproject.org/.* git://%s/git2/git.yoctoproject.org.BASENAME \\n "\n' % test_data.get('DL_DIR'))
-
-        # We need to do this in case we have a minimal SDK
-        subprocess.check_output(". %s > /dev/null; devtool sdk-install meta-extsdk-toolchain" % \
-                sdk_env, cwd=sdk_dir, shell=True, stderr=subprocess.STDOUT)
-
-        tc = OESDKExtTestContext(td=test_data, logger=logger, sdk_dir=sdk_dir,
-            sdk_env=sdk_env, target_pkg_manifest=target_pkg_manifest,
-            host_pkg_manifest=host_pkg_manifest)
-
-        try:
-            tc.loadTests(OESDKExtTestContextExecutor.default_cases)
-        except Exception as e:
-            import traceback
-            bb.fatal("Loading tests failed:\n%s" % traceback.format_exc())
-
-        result = tc.runTests()
-
-        component = "%s %s" % (pn, OESDKExtTestContextExecutor.name)
-        context_msg = "%s:%s" % (os.path.basename(tcname), os.path.basename(sdk_env))
-        configuration = get_sdk_configuration(d, 'sdkext')
-        result.logDetails(get_sdk_json_result_dir(d),
-                          configuration,
-                          get_sdk_result_id(configuration))
-        result.logSummary(component, context_msg)
-
-        if not result.wasSuccessful():
-            fail = True
-
-    if fail:
-        bb.fatal("%s - FAILED - check the task log and the commands log" % pn)
-
-testsdkext_main[vardepsexclude] =+ "BB_ORIGENV"
+python () {
+    auto = oe.types.boolean(d.getVar("TESTIMAGE_AUTO") or "False")
 
-python do_testsdkext() {
-    testsdkext_main(d)
-}
-addtask testsdkext
-do_testsdkext[nostamp] = "1"
+    if d.getVar('do_testsdk'):
+        d.setVarFlag('do_testsdk', 'nostamp', '1')
+        bb.build.addtask("testsdk", None, ("", "do_populate_sdk")[auto], d)
 
-python () {
-    if oe.types.boolean(d.getVar("TESTIMAGE_AUTO") or "False"):
-        bb.build.addtask("testsdk", None, "do_populate_sdk", d)
-        bb.build.addtask("testsdkext", None, "do_populate_sdk_ext", d)
+    if d.getVar('TESTSDKEXT_CLASSES'):
+        d.setVarFlag('do_testsdkext', 'nostamp', '1')
+        bb.build.addtask("testsdkext", None, ("", "do_populate_sdk_ext")[auto], d)
 }
diff --git a/meta/classes/testsdkext-oecore.bbclass b/meta/classes/testsdkext-oecore.bbclass
new file mode 100644
index 00000000000..e8c02013ac9
--- /dev/null
+++ b/meta/classes/testsdkext-oecore.bbclass
@@ -0,0 +1,107 @@
+# Copyright (C) 2013 - 2016 Intel Corporation
+#
+# Released under the MIT license (see COPYING.MIT)
+
+def testsdkext_oecore_main(d):
+    import os
+    import json
+    import subprocess
+    import logging
+
+    from bb.utils import export_proxies
+    from oeqa.utils import avoid_paths_in_environ, make_logger_bitbake_compatible, subprocesstweak
+    from oeqa.sdkext.context import OESDKExtTestContext, OESDKExtTestContextExecutor
+
+    pn = d.getVar("PN")
+    logger = make_logger_bitbake_compatible(logging.getLogger("BitBake"))
+
+    # extensible sdk use network
+    export_proxies(d)
+
+    subprocesstweak.errors_have_output()
+
+    # extensible sdk can be contaminated if native programs are
+    # in PATH, i.e. use perl-native instead of eSDK one.
+    paths_to_avoid = [d.getVar('STAGING_DIR'),
+                      d.getVar('BASE_WORKDIR')]
+    os.environ['PATH'] = avoid_paths_in_environ(paths_to_avoid)
+
+    tcname = d.expand("${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.sh")
+    if not os.path.exists(tcname):
+        bb.fatal("The toolchain ext %s is not built. Build it before running the" \
+                 " tests: 'bitbake <image> -c populate_sdk_ext' ." % tcname)
+
+    tdname = d.expand("${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.testdata.json")
+    test_data = json.load(open(tdname, "r"))
+
+    target_pkg_manifest = OESDKExtTestContextExecutor._load_manifest(
+        d.expand("${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.target.manifest"))
+    host_pkg_manifest = OESDKExtTestContextExecutor._load_manifest(
+        d.expand("${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.host.manifest"))
+
+    sdk_dir = d.expand("${WORKDIR}/testsdkext/")
+    bb.utils.remove(sdk_dir, True)
+    bb.utils.mkdirhier(sdk_dir)
+    try:
+        subprocess.check_output("%s -y -d %s" % (tcname, sdk_dir), shell=True)
+    except subprocess.CalledProcessError as e:
+        msg = "Couldn't install the extensible SDK:\n%s" % e.output.decode("utf-8")
+        logfn = os.path.join(sdk_dir, 'preparing_build_system.log')
+        if os.path.exists(logfn):
+            msg += '\n\nContents of preparing_build_system.log:\n'
+            with open(logfn, 'r') as f:
+                for line in f:
+                    msg += line
+        bb.fatal(msg)
+
+    fail = False
+    sdk_envs = OESDKExtTestContextExecutor._get_sdk_environs(sdk_dir)
+    for s in sdk_envs:
+        bb.plain("Extensible SDK testing environment: %s" % s)
+
+        sdk_env = sdk_envs[s]
+
+        # Use our own SSTATE_DIR and DL_DIR so that updates to the eSDK come from our sstate cache
+        # and we don't spend hours downloading kernels for the kernel module test
+        # Abuse auto.conf since local.conf would be overwritten by the SDK
+        with open(os.path.join(sdk_dir, 'conf', 'auto.conf'), 'a+') as f:
+            f.write('SSTATE_MIRRORS += " \\n file://.* file://%s/PATH"\n' % test_data.get('SSTATE_DIR'))
+            f.write('SOURCE_MIRROR_URL = "file://%s"\n' % test_data.get('DL_DIR'))
+            f.write('INHERIT += "own-mirrors"\n')
+            f.write('PREMIRRORS_prepend = " git://git.yoctoproject.org/.* git://%s/git2/git.yoctoproject.org.BASENAME \\n "\n' % test_data.get('DL_DIR'))
+
+        # We need to do this in case we have a minimal SDK
+        subprocess.check_output(". %s > /dev/null; devtool sdk-install meta-extsdk-toolchain" % \
+                sdk_env, cwd=sdk_dir, shell=True, stderr=subprocess.STDOUT)
+
+        tc = OESDKExtTestContext(td=test_data, logger=logger, sdk_dir=sdk_dir,
+            sdk_env=sdk_env, target_pkg_manifest=target_pkg_manifest,
+            host_pkg_manifest=host_pkg_manifest)
+
+        try:
+            tc.loadTests(OESDKExtTestContextExecutor.default_cases)
+        except Exception as e:
+            import traceback
+            bb.fatal("Loading tests failed:\n%s" % traceback.format_exc())
+
+        result = tc.runTests()
+
+        component = "%s %s" % (pn, OESDKExtTestContextExecutor.name)
+        context_msg = "%s:%s" % (os.path.basename(tcname), os.path.basename(sdk_env))
+        configuration = get_sdk_configuration(d, 'sdkext')
+        result.logDetails(get_sdk_json_result_dir(d),
+                          configuration,
+                          get_sdk_result_id(configuration))
+        result.logSummary(component, context_msg)
+
+        if not result.wasSuccessful():
+            fail = True
+
+    if fail:
+        bb.fatal("%s - FAILED - check the task log and the commands log" % pn)
+
+testsdkext_oecore_main[vardepsexclude] =+ "BB_ORIGENV"
+
+python do_testsdkext() {
+    testsdkext_oecore_main(d)
+}
-- 
2.19.1


