Return-Path: <jpewhacker@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 524246B79B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Nov 2018 19:20:08 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id g85so3536505ita.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Nov 2018 11:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sFg8rO2kaJGVM28m53rt4gPMZqbJ1cdavM587AIp2qI=;
	b=c+ENi2j0bv+mryE9hB7aoBYuLKcq1lBGjHKEvsLi63mT3+yZvsmyYTohnGcTy5y+CB
	9bzUQ+QMUSt+kQ220IhXjEK+uy3sSC70BFbdxtou0lV7Kjx9fToXwoigEtIqH18ZTXri
	ZmInQj5uVAx+7banMzJaJOwzvJxvDZIhllR8uq7JKqfCa9SiYPM4nvIZIhF8mKDW0z6Q
	voKWsMLkR4rTR7v3I+S10akfiFM4EGJ1GJj2TDgHO/MfGFcaxBn2aCNWwFYXV7CTNcP/
	FN83/lpMnoxoBSiyCh79zXqyyps3uEY4ROUMjAXLHw6zYBibMTOYGuwXWJKX2ifDtZ2C
	/7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sFg8rO2kaJGVM28m53rt4gPMZqbJ1cdavM587AIp2qI=;
	b=jDP0HKgL5/nWLMjEdQLitFUkwhgSAh+8b+BPEPc//2HV4ZhbRrBR++XRuEpfmJvQc3
	tzRrVtJaYk75byOE8CpuiJtp1yqlAOlAem7tI340SfEw0Pf2myCRnJOToTI0thSO+bWy
	Y1DJpuryniVQsDKjyxHgGzwDmhGKgPXCPkRY1jCyWYawk1XjWpq5SP8iYgVyUeIFXIB9
	k2thEHdoVDdKxVU19TXxqV9f7x+wC8F8bdWkAComYvZeI4CrI3lkSLOGURDh8B8g91RJ
	lpGCI2yHBjlo/w+UKF2TVijY9Apx6cakxMS2+pXRmWjPQQ55SKUm5kZM+zEgcVQPFCMv
	XizA==
X-Gm-Message-State: AA+aEWZR2nPuEv4o+sUlDY8Rm3rMzQuKl7P6g32bZc9bOXgiZzoBuTlh
	efbtXlExTnJQaTq9ZF+LnoyqI8Fh4uA=
X-Google-Smtp-Source: AJdET5dk2/yPw3xhLhI1VjV7865DRpMlatvWgijvxr9WLmWhoUmdjMUJ1pPPJm1q1n5MwLkCSm/PVw==
X-Received: by 2002:a24:78c7:: with SMTP id p190mr5684845itc.21.1542568808611; 
	Sun, 18 Nov 2018 11:20:08 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	q131-v6sm13124605itb.5.2018.11.18.11.20.07
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 18 Nov 2018 11:20:07 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Nov 2018 13:19:14 -0600
Message-Id: <20181118191914.14495-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181115191442.24106-1-JPEWhacker@gmail.com>
References: <20181115191442.24106-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v2] classes/testsdk: Split implementation into classes
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
X-List-Received-Date: Sun, 18 Nov 2018 19:20:08 -0000
Content-Transfer-Encoding: 8bit

Splits the SDK test implementation into configurable Python classes. The
classes used for the normal and extensible SDKs are
${TESTSDK_CLASS_NAME} and ${TESTSDKEXT_CLASS_NAME} respectively.

This allows SDK machines to override the classes used to implement the
tests. For the traditional SDK, a common "run()" function is provided by
the class (oeqa.sdk.testsdk.TestSDK), with several hook member functions
that can be overridden in child classes, making it easier to have
consistent behavior. The extensible SDK class
(oeqa.sdkext.testsdk.TestSDKEXT) also has a common "run()" function, but
no hooks have yet been added as there is not currently a known use case
for create derived classes.

[YOCTO #13020]

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/testsdk.bbclass    | 227 +++-----------------------------
 meta/lib/oeqa/sdk/testsdk.py    | 141 ++++++++++++++++++++
 meta/lib/oeqa/sdkext/testsdk.py | 104 +++++++++++++++
 3 files changed, 264 insertions(+), 208 deletions(-)
 create mode 100644 meta/lib/oeqa/sdk/testsdk.py
 create mode 100644 meta/lib/oeqa/sdkext/testsdk.py

diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 5b9bf7b2624..f4392337236 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -14,224 +14,35 @@
 #
 # where "<image-name>" is an image like core-image-sato.
 
-def get_sdk_configuration(d, test_type):
-    import platform
-    from oeqa.utils.metadata import get_layers
-    configuration = {'TEST_TYPE': test_type,
-                    'MACHINE': d.getVar("MACHINE"),
-                    'SDKMACHINE': d.getVar("SDKMACHINE"),
-                    'IMAGE_BASENAME': d.getVar("IMAGE_BASENAME"),
-                    'IMAGE_PKGTYPE': d.getVar("IMAGE_PKGTYPE"),
-                    'STARTTIME': d.getVar("DATETIME"),
-                    'HOST_DISTRO': ('-'.join(platform.linux_distribution())).replace(' ', '-'),
-                    'LAYERS': get_layers(d.getVar("BBLAYERS"))}
-    return configuration
-get_sdk_configuration[vardepsexclude] = "DATETIME"
+TESTSDK_CLASS_NAME ?= "oeqa.sdk.testsdk.TestSDK"
+TESTSDKEXT_CLASS_NAME ?= "oeqa.sdkext.testsdk.TestSDKExt"
 
-def get_sdk_json_result_dir(d):
-    json_result_dir = os.path.join(d.getVar("LOG_DIR"), 'oeqa')
-    custom_json_result_dir = d.getVar("OEQA_JSON_RESULT_DIR")
-    if custom_json_result_dir:
-        json_result_dir = custom_json_result_dir
-    return json_result_dir
+def import_and_run(name, d):
+    import importlib
 
-def get_sdk_result_id(configuration):
-    return '%s_%s_%s_%s_%s' % (configuration['TEST_TYPE'], configuration['IMAGE_BASENAME'], configuration['SDKMACHINE'], configuration['MACHINE'], configuration['STARTTIME'])
+    class_name = d.getVar(name)
+    if class_name:
+        module, cls = class_name.rsplit('.', 1)
+        m = importlib.import_module(module)
+        c = getattr(m, cls)()
+        c.run(d)
+    else:
+        bb.warn('No tests were run because %s did not define a class' % name)
 
-def testsdk_main(d):
-    import os
-    import subprocess
-    import json
-    import logging
-
-    from bb.utils import export_proxies
-    from oeqa.sdk.context import OESDKTestContext, OESDKTestContextExecutor
-    from oeqa.utils import make_logger_bitbake_compatible
-
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
+import_and_run[vardepsexclude] = "DATETIME BB_ORIGENV"
 
 python do_testsdk() {
-    testsdk_main(d)
+    import_and_run('TESTSDK_CLASS_NAME', d)
 }
-addtask testsdk
 do_testsdk[nostamp] = "1"
 
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
-
 python do_testsdkext() {
-    testsdkext_main(d)
+    import_and_run('TESTSDKEXT_CLASS_NAME', d)
 }
-addtask testsdkext
-do_testsdkext[nostamp] = "1"
+do_testsdk[nostamp] = "1"
 
 python () {
-    if oe.types.boolean(d.getVar("TESTIMAGE_AUTO") or "False"):
-        bb.build.addtask("testsdk", None, "do_populate_sdk", d)
-        bb.build.addtask("testsdkext", None, "do_populate_sdk_ext", d)
+    auto = oe.types.boolean(d.getVar("TESTIMAGE_AUTO") or "False")
+    bb.build.addtask("testsdk", None, ("", "do_populate_sdk")[auto], d)
+    bb.build.addtask("testsdkext", None, ("", "do_populate_sdk_ext")[auto], d)
 }
diff --git a/meta/lib/oeqa/sdk/testsdk.py b/meta/lib/oeqa/sdk/testsdk.py
new file mode 100644
index 00000000000..6ff44f83f66
--- /dev/null
+++ b/meta/lib/oeqa/sdk/testsdk.py
@@ -0,0 +1,141 @@
+# Copyright 2018 by Garmin Ltd. or its subsidiaries
+# Released under the MIT license (see COPYING.MIT)
+
+from oeqa.sdk.context import OESDKTestContext, OESDKTestContextExecutor
+
+class TestSDKBase(object):
+    @staticmethod
+    def get_sdk_configuration(d, test_type):
+        import platform
+        from oeqa.utils.metadata import get_layers
+        configuration = {'TEST_TYPE': test_type,
+                        'MACHINE': d.getVar("MACHINE"),
+                        'SDKMACHINE': d.getVar("SDKMACHINE"),
+                        'IMAGE_BASENAME': d.getVar("IMAGE_BASENAME"),
+                        'IMAGE_PKGTYPE': d.getVar("IMAGE_PKGTYPE"),
+                        'STARTTIME': d.getVar("DATETIME"),
+                        'HOST_DISTRO': ('-'.join(platform.linux_distribution())).replace(' ', '-'),
+                        'LAYERS': get_layers(d.getVar("BBLAYERS"))}
+        return configuration
+
+    @staticmethod
+    def get_sdk_json_result_dir(d):
+        json_result_dir = os.path.join(d.getVar("LOG_DIR"), 'oeqa')
+        custom_json_result_dir = d.getVar("OEQA_JSON_RESULT_DIR")
+        if custom_json_result_dir:
+            json_result_dir = custom_json_result_dir
+        return json_result_dir
+
+    @staticmethod
+    def get_sdk_result_id(configuration):
+        return '%s_%s_%s_%s_%s' % (configuration['TEST_TYPE'], configuration['IMAGE_BASENAME'], configuration['SDKMACHINE'], configuration['MACHINE'], configuration['STARTTIME'])
+
+class TestSDK(TestSDKBase):
+    context_executor_class = OESDKTestContextExecutor
+    context_class = OESDKTestContext
+    test_type = 'sdk'
+
+    def get_tcname(self, d):
+        """
+        Get the name of the SDK file
+        """
+        return d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh")
+
+    def extract_sdk(self, tcname, sdk_dir, d):
+        """
+        Extract the SDK to the specified location
+        """
+        import subprocess
+
+        try:
+            subprocess.check_output("cd %s; %s <<EOF\n./\nY\nEOF" % (sdk_dir, tcname), shell=True)
+        except subprocess.CalledProcessError as e:
+            bb.fatal("Couldn't install the SDK:\n%s" % e.output.decode("utf-8"))
+
+    def setup_context(self, d):
+        """
+        Return a dictionary of additional arguments that should be passed to
+        the context_class on construction
+        """
+        return dict()
+
+    def run(self, d):
+
+        import os
+        import subprocess
+        import json
+        import logging
+
+        from bb.utils import export_proxies
+        from oeqa.utils import make_logger_bitbake_compatible
+
+        pn = d.getVar("PN")
+        logger = make_logger_bitbake_compatible(logging.getLogger("BitBake"))
+
+        # sdk use network for download projects for build
+        export_proxies(d)
+
+        tcname = self.get_tcname(d)
+
+        if not os.path.exists(tcname):
+            bb.fatal("The toolchain %s is not built. Build it before running the tests: 'bitbake <image> -c populate_sdk' ." % tcname)
+
+        tdname = d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.testdata.json")
+        test_data = json.load(open(tdname, "r"))
+
+        target_pkg_manifest = self.context_executor_class._load_manifest(
+            d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.target.manifest"))
+        host_pkg_manifest = self.context_executor_class._load_manifest(
+            d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.host.manifest"))
+
+        processes = d.getVar("TESTIMAGE_NUMBER_THREADS") or d.getVar("BB_NUMBER_THREADS")
+        if processes:
+            try:
+                import testtools, subunit
+            except ImportError:
+                bb.warn("Failed to import testtools or subunit, the testcases will run serially")
+                processes = None
+
+        sdk_dir = d.expand("${WORKDIR}/testimage-sdk/")
+        bb.utils.remove(sdk_dir, True)
+        bb.utils.mkdirhier(sdk_dir)
+
+        context_args = self.setup_context(d)
+
+        self.extract_sdk(tcname, sdk_dir, d)
+
+        fail = False
+        sdk_envs = self.context_executor_class._get_sdk_environs(sdk_dir)
+        for s in sdk_envs:
+            sdk_env = sdk_envs[s]
+            bb.plain("SDK testing environment: %s" % s)
+            tc = self.context_class(td=test_data, logger=logger, sdk_dir=sdk_dir,
+                sdk_env=sdk_env, target_pkg_manifest=target_pkg_manifest,
+                host_pkg_manifest=host_pkg_manifest, **context_args)
+
+            try:
+                tc.loadTests(self.context_executor_class.default_cases)
+            except Exception as e:
+                import traceback
+                bb.fatal("Loading tests failed:\n%s" % traceback.format_exc())
+
+            if processes:
+                result = tc.runTests(processes=int(processes))
+            else:
+                result = tc.runTests()
+
+            component = "%s %s" % (pn, self.context_executor_class.name)
+            context_msg = "%s:%s" % (os.path.basename(tcname), os.path.basename(sdk_env))
+            configuration = self.get_sdk_configuration(d, self.test_type)
+            result.logDetails(self.get_sdk_json_result_dir(d),
+                            configuration,
+                            self.get_sdk_result_id(configuration))
+            result.logSummary(component, context_msg)
+
+            if not result.wasSuccessful():
+                fail = True
+
+        if fail:
+            bb.fatal("%s - FAILED - check the task log and the commands log" % pn)
+
+
diff --git a/meta/lib/oeqa/sdkext/testsdk.py b/meta/lib/oeqa/sdkext/testsdk.py
new file mode 100644
index 00000000000..57b2e0e03f2
--- /dev/null
+++ b/meta/lib/oeqa/sdkext/testsdk.py
@@ -0,0 +1,104 @@
+# Copyright 2018 by Garmin Ltd. or its subsidiaries
+# Released under the MIT license (see COPYING.MIT)
+
+from oeqa.sdk.testsdk import TestSDKBase
+
+class TestSDKExt(TestSDKBase):
+    def run(self, d):
+        import os
+        import json
+        import subprocess
+        import logging
+
+        from bb.utils import export_proxies
+        from oeqa.utils import avoid_paths_in_environ, make_logger_bitbake_compatible, subprocesstweak
+        from oeqa.sdkext.context import OESDKExtTestContext, OESDKExtTestContextExecutor
+
+        pn = d.getVar("PN")
+        logger = make_logger_bitbake_compatible(logging.getLogger("BitBake"))
+
+        # extensible sdk use network
+        export_proxies(d)
+
+        subprocesstweak.errors_have_output()
+
+        # extensible sdk can be contaminated if native programs are
+        # in PATH, i.e. use perl-native instead of eSDK one.
+        paths_to_avoid = [d.getVar('STAGING_DIR'),
+                        d.getVar('BASE_WORKDIR')]
+        os.environ['PATH'] = avoid_paths_in_environ(paths_to_avoid)
+
+        tcname = d.expand("${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.sh")
+        if not os.path.exists(tcname):
+            bb.fatal("The toolchain ext %s is not built. Build it before running the" \
+                    " tests: 'bitbake <image> -c populate_sdk_ext' ." % tcname)
+
+        tdname = d.expand("${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.testdata.json")
+        test_data = json.load(open(tdname, "r"))
+
+        target_pkg_manifest = OESDKExtTestContextExecutor._load_manifest(
+            d.expand("${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.target.manifest"))
+        host_pkg_manifest = OESDKExtTestContextExecutor._load_manifest(
+            d.expand("${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.host.manifest"))
+
+        sdk_dir = d.expand("${WORKDIR}/testsdkext/")
+        bb.utils.remove(sdk_dir, True)
+        bb.utils.mkdirhier(sdk_dir)
+        try:
+            subprocess.check_output("%s -y -d %s" % (tcname, sdk_dir), shell=True)
+        except subprocess.CalledProcessError as e:
+            msg = "Couldn't install the extensible SDK:\n%s" % e.output.decode("utf-8")
+            logfn = os.path.join(sdk_dir, 'preparing_build_system.log')
+            if os.path.exists(logfn):
+                msg += '\n\nContents of preparing_build_system.log:\n'
+                with open(logfn, 'r') as f:
+                    for line in f:
+                        msg += line
+            bb.fatal(msg)
+
+        fail = False
+        sdk_envs = OESDKExtTestContextExecutor._get_sdk_environs(sdk_dir)
+        for s in sdk_envs:
+            bb.plain("Extensible SDK testing environment: %s" % s)
+
+            sdk_env = sdk_envs[s]
+
+            # Use our own SSTATE_DIR and DL_DIR so that updates to the eSDK come from our sstate cache
+            # and we don't spend hours downloading kernels for the kernel module test
+            # Abuse auto.conf since local.conf would be overwritten by the SDK
+            with open(os.path.join(sdk_dir, 'conf', 'auto.conf'), 'a+') as f:
+                f.write('SSTATE_MIRRORS += " \\n file://.* file://%s/PATH"\n' % test_data.get('SSTATE_DIR'))
+                f.write('SOURCE_MIRROR_URL = "file://%s"\n' % test_data.get('DL_DIR'))
+                f.write('INHERIT += "own-mirrors"\n')
+                f.write('PREMIRRORS_prepend = " git://git.yoctoproject.org/.* git://%s/git2/git.yoctoproject.org.BASENAME \\n "\n' % test_data.get('DL_DIR'))
+
+            # We need to do this in case we have a minimal SDK
+            subprocess.check_output(". %s > /dev/null; devtool sdk-install meta-extsdk-toolchain" % \
+                    sdk_env, cwd=sdk_dir, shell=True, stderr=subprocess.STDOUT)
+
+            tc = OESDKExtTestContext(td=test_data, logger=logger, sdk_dir=sdk_dir,
+                sdk_env=sdk_env, target_pkg_manifest=target_pkg_manifest,
+                host_pkg_manifest=host_pkg_manifest)
+
+            try:
+                tc.loadTests(OESDKExtTestContextExecutor.default_cases)
+            except Exception as e:
+                import traceback
+                bb.fatal("Loading tests failed:\n%s" % traceback.format_exc())
+
+            result = tc.runTests()
+
+            component = "%s %s" % (pn, OESDKExtTestContextExecutor.name)
+            context_msg = "%s:%s" % (os.path.basename(tcname), os.path.basename(sdk_env))
+            configuration = self.get_sdk_configuration(d, 'sdkext')
+            result.logDetails(self.get_sdk_json_result_dir(d),
+                            configuration,
+                            self.get_sdk_result_id(configuration))
+            result.logSummary(component, context_msg)
+
+            if not result.wasSuccessful():
+                fail = True
+
+        if fail:
+            bb.fatal("%s - FAILED - check the task log and the commands log" % pn)
+
-- 
2.19.1


