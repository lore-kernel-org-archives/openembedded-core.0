Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 619AC7EB14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 17:52:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7KHqfNO028712
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 20 Aug 2019 10:52:42 -0700 (PDT)
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 20 Aug 2019 10:52:41 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Tue, 20 Aug 2019 13:52:39 -0400
Message-ID: <20190820175239.19769-1-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] sdkext: use simpler kernel module for devtool test
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
X-List-Received-Date: Tue, 20 Aug 2019 17:52:42 -0000
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

Richard, it is unclear if I need to match this change in
meta/lib/oeqa/manual/crops.json. Please let me know and I
send a V2 which does this. I am not fond of pointing at
my own github but it was the best option to ensure it will
exist and not be messed with.

 meta/lib/oeqa/sdkext/cases/devtool.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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


