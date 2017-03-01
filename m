Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3202877562
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Mar 2017 16:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v21G2poA011997; Wed, 1 Mar 2017 16:02:51 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id LWFEQvhqttJQ; Wed,  1 Mar 2017 16:02:51 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v21G2kYO011983
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 1 Mar 2017 16:02:47 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cj6iE-0004oU-Ry; Wed, 01 Mar 2017 16:02:46 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Mar 2017 16:02:42 +0000
Message-Id: <1488384162-18397-12-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1488384162-18397-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1488384162-18397-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 12/12] oeqa/sdkext: don't skip tests if there isn't a toolchain
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
X-List-Received-Date: Wed, 01 Mar 2017 16:03:01 -0000

From: Ross Burton <ross.burton@intel.com>

Skipping the tests if a toolchain wasn't installed out of the box (for example,
a minimal eSDK) doesn't make sense as the first thing the tests should do is
install a toolchain.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/sdkext/cases/devtool.py | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/lib/oeqa/sdkext/cases/devtool.py b/meta/lib/oeqa/sdkext/cases/devtool.py
index 63431aa..1072fb6 100644
--- a/meta/lib/oeqa/sdkext/cases/devtool.py
+++ b/meta/lib/oeqa/sdkext/cases/devtool.py
@@ -7,7 +7,6 @@ import subprocess
 from oeqa.sdkext.case import OESDKExtTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.oeid import OETestID
-from oeqa.core.decorator.data import skipIfNotDataVar
 
 class DevtoolTest(OESDKExtTestCase):
     @classmethod
@@ -51,25 +50,21 @@ class DevtoolTest(OESDKExtTestCase):
 
     @OETestID(1605)
     @OETestDepends(['test_devtool_location'])
-    @skipIfNotDataVar('SDK_INCLUDE_TOOLCHAIN', '1', 'SDK does not include toolchain')
     def test_devtool_build_make(self):
         self._test_devtool_build(self.myapp_dst)
 
     @OETestID(1606)
     @OETestDepends(['test_devtool_location'])
-    @skipIfNotDataVar('SDK_INCLUDE_TOOLCHAIN', '1', 'SDK does not include toolchain')
     def test_devtool_build_esdk_package(self):
         self._test_devtool_build_package(self.myapp_dst)
 
     @OETestID(1607)
     @OETestDepends(['test_devtool_location'])
-    @skipIfNotDataVar('SDK_INCLUDE_TOOLCHAIN', '1', 'SDK does not include toolchain')
     def test_devtool_build_cmake(self):
         self._test_devtool_build(self.myapp_cmake_dst)
 
     @OETestID(1608)
     @OETestDepends(['test_devtool_location'])
-    @skipIfNotDataVar('SDK_INCLUDE_TOOLCHAIN', '1', 'SDK does not include toolchain')
     def test_extend_autotools_recipe_creation(self):
         req = 'https://github.com/rdfa/librdfa'
         recipe = "librdfa"
@@ -81,7 +76,6 @@ class DevtoolTest(OESDKExtTestCase):
 
     @OETestID(1609)
     @OETestDepends(['test_devtool_location'])
-    @skipIfNotDataVar('SDK_INCLUDE_TOOLCHAIN', '1', 'SDK does not include toolchain')
     def test_devtool_kernelmodule(self):
         docfile = 'https://github.com/umlaeute/v4l2loopback.git'
         recipe = 'v4l2loopback-driver'
@@ -93,7 +87,6 @@ class DevtoolTest(OESDKExtTestCase):
 
     @OETestID(1610)
     @OETestDepends(['test_devtool_location'])
-    @skipIfNotDataVar('SDK_INCLUDE_TOOLCHAIN', '1', 'SDK does not include toolchain')
     def test_recipes_for_nodejs(self):
         package_nodejs = "npm://registry.npmjs.org;name=winston;version=2.2.0"
         self._run('devtool add %s ' % package_nodejs)
-- 
2.7.4


