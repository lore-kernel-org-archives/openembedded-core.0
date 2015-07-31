Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 941F47647D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 10:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6VANbiA019792 for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:23:37 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XESet3AHwWYi
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:23:37 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6VANM0D019777
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:23:33 +0100
Message-ID: <1438338202.22462.5.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Jul 2015 11:23:22 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] testimage: testsdk fixes/improvements
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
X-List-Received-Date: Fri, 31 Jul 2015 10:23:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The "bitbake meta-toolchain" comment is dated and incorrect, fix to
point at -c populate_sdk.

If a toolchain contains multiple environment files, iterate them and run
the sdk test suite on each on in turn rather than giving a fatal error and
giving up.

Also improve the debug output so that rather than PN, it also show the
toolchain tarball under test, and the environment file name its using.

Also enable the accidentally disabled cleanup code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 37acb0c..067f771 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -296,19 +296,9 @@ def testsdk_main(d):
     testslist = get_tests_list(d, "sdk")
     testsrequired = [t for t in (d.getVar("TEST_SUITES_SDK", True) or "auto").split() if t != "auto"]
 
-    sdktestdir = d.expand("${WORKDIR}/testimage-sdk/")
-    bb.utils.remove(sdktestdir, True)
-    bb.utils.mkdirhier(sdktestdir)
-
     tcname = d.expand("${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.sh")
     if not os.path.exists(tcname):
-        bb.fatal("The toolchain is not built. Build it before running the tests: 'bitbake meta-toolchain' .")
-    subprocess.call("cd %s; %s <<EOF\n./tc\nY\nEOF" % (sdktestdir, tcname), shell=True)
-
-    targets = glob.glob(d.expand(sdktestdir + "/tc/sysroots/*${TARGET_VENDOR}-linux*"))
-    if len(targets) > 1:
-        bb.fatal("Error, multiple targets within the SDK found and we don't know which to test? %s" % str(targets))
-    sdkenv = sdktestdir + "/tc/environment-setup-" + os.path.basename(targets[0])
+        bb.fatal("The toolchain is not built. Build it before running the tests: 'bitbake <image> -c populate_sdk' .")
 
     class TestContext(object):
         def __init__(self):
@@ -333,33 +323,41 @@ def testsdk_main(d):
             except IOError as e:
                 bb.fatal("No host package manifest file found. Did you build the sdk image?\n%s" % e)
 
-    # test context
-    tc = TestContext()
+    sdktestdir = d.expand("${WORKDIR}/testimage-sdk/")
+    bb.utils.remove(sdktestdir, True)
+    bb.utils.mkdirhier(sdktestdir)
+    subprocess.call("cd %s; %s <<EOF\n./tc\nY\nEOF" % (sdktestdir, tcname), shell=True)
 
-    # this is a dummy load of tests
-    # we are doing that to find compile errors in the tests themselves
-    # before booting the image
     try:
-        loadTests(tc, "sdk")
-    except Exception as e:
-        import traceback
-        bb.fatal("Loading tests failed:\n%s" % traceback.format_exc())
+        targets = glob.glob(d.expand(sdktestdir + "/tc/environment-setup-*"))
+        bb.warn(str(targets))
+        for sdkenv in targets:
+            # test context
+            tc = TestContext()
+
+            # this is a dummy load of tests
+            # we are doing that to find compile errors in the tests themselves
+            # before booting the image
+            try:
+                loadTests(tc, "sdk")
+            except Exception as e:
+                import traceback
+                bb.fatal("Loading tests failed:\n%s" % traceback.format_exc())
 
-    try:
-        starttime = time.time()
-        result = runTests(tc, "sdk")
-        stoptime = time.time()
-        if result.wasSuccessful():
-            bb.plain("%s - Ran %d test%s in %.3fs" % (pn, result.testsRun, result.testsRun != 1 and "s" or "", stoptime - starttime))
-            msg = "%s - OK - All required tests passed" % pn
-            skipped = len(result.skipped)
-            if skipped:
-                msg += " (skipped=%d)" % skipped
-            bb.plain(msg)
-        else:
-            raise bb.build.FuncFailed("%s - FAILED - check the task log and the commands log" % pn )
+    
+            starttime = time.time()
+            result = runTests(tc, "sdk")
+            stoptime = time.time()
+            if result.wasSuccessful():
+                bb.plain("%s SDK(%s):%s - Ran %d test%s in %.3fs" % (pn, os.path.basename(tcname), os.path.basename(sdkenv),result.testsRun, result.testsRun != 1 and "s" or "", stoptime - starttime))
+                msg = "%s - OK - All required tests passed" % pn
+                skipped = len(result.skipped)
+                if skipped:
+                    msg += " (skipped=%d)" % skipped
+                bb.plain(msg)
+            else:
+                raise bb.build.FuncFailed("%s - FAILED - check the task log and the commands log" % pn )
     finally:
-        pass
         bb.utils.remove(sdktestdir, True)
 
 testsdk_main[vardepsexclude] =+ "BB_ORIGENV"



