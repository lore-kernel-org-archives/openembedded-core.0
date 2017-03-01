Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AA94F77552
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 16:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v21G2po9011997; Wed, 1 Mar 2017 16:02:51 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id jpRsIhPgQRUG; Wed,  1 Mar 2017 16:02:51 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v21G2k8o011982
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 1 Mar 2017 16:02:47 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cj6iE-0004oP-RJ; Wed, 01 Mar 2017 16:02:46 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Mar 2017 16:02:41 +0000
Message-Id: <1488384162-18397-11-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1488384162-18397-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1488384162-18397-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 11/12] oeqa/sdkext/devtool: use finally instead of repeating cleanup
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
X-List-Received-Date: Wed, 01 Mar 2017 16:02:58 -0000

From: Ross Burton <ross.burton@intel.com>

Use the finally: block to always to cleanup.

Now that the test harness in testsdk.bbclass has monkey-patched
CalledProcessException to display the output we don't need to do that in the
test case.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/testsdk.bbclass          |  4 +++-
 meta/lib/oeqa/sdkext/cases/devtool.py | 35 ++++++++++-------------------------
 2 files changed, 13 insertions(+), 26 deletions(-)

diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 802e57f..0e6949e 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -100,7 +100,7 @@ def testsdkext_main(d):
     import logging
 
     from bb.utils import export_proxies
-    from oeqa.utils import avoid_paths_in_environ, make_logger_bitbake_compatible
+    from oeqa.utils import avoid_paths_in_environ, make_logger_bitbake_compatible, subprocesstweak
     from oeqa.sdkext.context import OESDKExtTestContext, OESDKExtTestContextExecutor
 
     pn = d.getVar("PN")
@@ -109,6 +109,8 @@ def testsdkext_main(d):
     # extensible sdk use network
     export_proxies(d)
 
+    subprocesstweak.errors_have_output()
+
     # extensible sdk can be contaminated if native programs are
     # in PATH, i.e. use perl-native instead of eSDK one.
     paths_to_avoid = [d.getVar('STAGING_DIR'),
diff --git a/meta/lib/oeqa/sdkext/cases/devtool.py b/meta/lib/oeqa/sdkext/cases/devtool.py
index ffaa2f0..63431aa 100644
--- a/meta/lib/oeqa/sdkext/cases/devtool.py
+++ b/meta/lib/oeqa/sdkext/cases/devtool.py
@@ -29,38 +29,32 @@ class DevtoolTest(OESDKExtTestCase):
         self._run('devtool add myapp %s' % directory)
         try:
             self._run('devtool build myapp')
-        except Exception as e:
-            print(e.output)
+        finally:
             self._run('devtool reset myapp')
-            raise e
-        self._run('devtool reset myapp')
 
     def _test_devtool_build_package(self, directory):
         self._run('devtool add myapp %s' % directory)
         try:
             self._run('devtool package myapp')
-        except Exception as e:
-            print(e.output)
+        finally:
             self._run('devtool reset myapp')
-            raise e
-        self._run('devtool reset myapp')
 
     def test_devtool_location(self):
         output = self._run('which devtool')
         self.assertEqual(output.startswith(self.tc.sdk_dir), True, \
             msg="Seems that devtool isn't the eSDK one: %s" % output)
-    
+
     @OETestDepends(['test_devtool_location'])
     def test_devtool_add_reset(self):
         self._run('devtool add myapp %s' % self.myapp_dst)
         self._run('devtool reset myapp')
-    
+
     @OETestID(1605)
     @OETestDepends(['test_devtool_location'])
     @skipIfNotDataVar('SDK_INCLUDE_TOOLCHAIN', '1', 'SDK does not include toolchain')
     def test_devtool_build_make(self):
         self._test_devtool_build(self.myapp_dst)
-    
+
     @OETestID(1606)
     @OETestDepends(['test_devtool_location'])
     @skipIfNotDataVar('SDK_INCLUDE_TOOLCHAIN', '1', 'SDK does not include toolchain')
@@ -72,7 +66,7 @@ class DevtoolTest(OESDKExtTestCase):
     @skipIfNotDataVar('SDK_INCLUDE_TOOLCHAIN', '1', 'SDK does not include toolchain')
     def test_devtool_build_cmake(self):
         self._test_devtool_build(self.myapp_cmake_dst)
-    
+
     @OETestID(1608)
     @OETestDepends(['test_devtool_location'])
     @skipIfNotDataVar('SDK_INCLUDE_TOOLCHAIN', '1', 'SDK does not include toolchain')
@@ -82,11 +76,8 @@ class DevtoolTest(OESDKExtTestCase):
         self._run('devtool add %s %s' % (recipe, req) )
         try:
             self._run('devtool build %s' % recipe)
-        except Exception as e:
-            print(e.output)
+        finally:
             self._run('devtool reset %s' % recipe)
-            raise e
-        self._run('devtool reset %s' % recipe)
 
     @OETestID(1609)
     @OETestDepends(['test_devtool_location'])
@@ -97,11 +88,8 @@ class DevtoolTest(OESDKExtTestCase):
         self._run('devtool add %s %s' % (recipe, docfile) )
         try:
             self._run('devtool build %s' % recipe)
-        except Exception as e:
-            print(e.output)
+        finally:
             self._run('devtool reset %s' % recipe)
-            raise e
-        self._run('devtool reset %s' % recipe)
 
     @OETestID(1610)
     @OETestDepends(['test_devtool_location'])
@@ -111,8 +99,5 @@ class DevtoolTest(OESDKExtTestCase):
         self._run('devtool add %s ' % package_nodejs)
         try:
             self._run('devtool build %s ' % package_nodejs)
-        except Exception as e:
-            print(e.output)
-            self._run('devtool reset %s' % package_nodejs)
-            raise e
-        self._run('devtool reset %s '% package_nodejs)
+        finally:
+            self._run('devtool reset %s '% package_nodejs)
-- 
2.7.4


