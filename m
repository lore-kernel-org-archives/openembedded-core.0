Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4CE0A6069C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 15:57:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7MFuFFT014490
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 22 Aug 2019 08:56:51 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 22 Aug 2019 08:56:20 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
Date: Thu, 22 Aug 2019 11:56:16 -0400
Message-ID: <20190822155616.35046-1-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH][V2] sdkext: use simpler kernel module for devtool test
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
X-List-Received-Date: Thu, 22 Aug 2019 15:57:16 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The current devtool test for the building of an out-of-tree kernel
module uses something which requires several "high order" kconfigs to
be set. This results in the test failing, not for expected reasons,
but rather because it depends on specific kernel configuration.

You will get error messages such as

  ERROR: "video_ioctl2"
  [.../1.0-r5/testsdkext/workspace/sources/v4l2loopback-driver/v4l2loopback.ko]
  undefined!
  ERROR: "video_unregister_device"
  [.../1.0-r5/testsdkext/workspace/sources/v4l2loopback-driver/v4l2loopback.ko]
  undefined!

Using a simpler hello-world kernel module example will only require
that CONFIG_MODULE is enabled, thus avoiding a false positive.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---

**V2**
 - also updated the CROPS manual test json file
   (I have no idea how to run this so untested but this is a straight
    substition)
 - continue to use github until we can move the sample to somewhere
   like git.yoctoproject.org

 meta/lib/oeqa/manual/crops.json       | 12 ++++++------
 meta/lib/oeqa/sdkext/cases/devtool.py |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/manual/crops.json b/meta/lib/oeqa/manual/crops.json
index 1cf3c8f30c..071d35b661 100644
--- a/meta/lib/oeqa/manual/crops.json
+++ b/meta/lib/oeqa/manual/crops.json
@@ -234,16 +234,16 @@
                     "expected_results": "this should output the directory of the devtool script and it should be within the sdk workdir you are working in.   \n\n"
                 },
                 "5": {
-                    "action": "devtool add v4l2loopback-driver  https://github.com/umlaeute/v4l2loopback.git   \n\n",
-                    "expected_results": "This should automatically create the recipe v4l2loopback-driver.bb under <crops-esdk-workdir-workspace>/recipes/v4l2loopback-driver/v4l2loopback-driver.bb "
+                    "action": "devtool add kernel-module-hello-world  https://github.com/masselstine/kernel-module-hello-world.git   \n\n",
+                    "expected_results": "This should automatically create the recipe kernel-module-hello-world.bb under <crops-esdk-workdir-workspace>/recipes/kernel-module-hello-world/kernel-module-hello-world.bb "
                 },
                 "6": {
-                    "action": "devtool build v4l2loopback-driver   \n\n",
+                    "action": "devtool build kernel-module-hello-world   \n\n",
                     "expected_results": "This should compile an image   \n\n"
                 },
                 "7": {
-                    "action": "devtool reset v4l2loopback-driver   ",
-                    "expected_results": "This cleans sysroot of the v4l2loopback-driver recipe, but it leaves the source tree intact. meaning it does not erase."
+                    "action": "devtool reset kernel-module-hello-world   ",
+                    "expected_results": "This cleans sysroot of the kernel-module-hello-world recipe, but it leaves the source tree intact. meaning it does not erase."
                 }
             },
             "summary": "sdkext_devtool_kernelmodule"
@@ -291,4 +291,4 @@
             "summary": "sdkext_recipes_for_nodejs"
         }
     }
-]
\ No newline at end of file
+]
diff --git a/meta/lib/oeqa/sdkext/cases/devtool.py b/meta/lib/oeqa/sdkext/cases/devtool.py
index 5a02add764..fad98fbb36 100644
--- a/meta/lib/oeqa/sdkext/cases/devtool.py
+++ b/meta/lib/oeqa/sdkext/cases/devtool.py
@@ -73,8 +73,8 @@ class DevtoolTest(OESDKExtTestCase):
             self._run('devtool reset %s' % recipe)
 
     def test_devtool_kernelmodule(self):
-        docfile = 'https://github.com/umlaeute/v4l2loopback.git'
-        recipe = 'v4l2loopback-driver'
+        docfile = 'https://github.com/masselstine/kernel-module-hello-world.git'
+        recipe = 'kernel-module-hello-world'
         self._run('devtool add %s %s' % (recipe, docfile) )
         try:
             self._run('devtool build %s' % recipe)
-- 
2.21.0


