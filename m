Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CEE1071978
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 06:19:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uAH6JdI7021956
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 22:19:39 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 16 Nov 2016 22:19:39 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Nov 2016 22:19:31 -0800
Message-ID: <61246658fe264929d272f4da2f681e0fb95f9809.1479363545.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1479363545.git.liezhi.yang@windriver.com>
References: <cover.1479363545.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/8] oeqa/sdkext/devtool.py: remove workspace/sources before running test cases
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
X-List-Received-Date: Thu, 17 Nov 2016 06:19:39 -0000
Content-Type: text/plain

Fixed:
MACHINE = "qemux86-64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

$ bitbake core-image-minimal -cpopulate_sdk_ext
[snip]
ERROR: Source tree path /path/to/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/testsdkext/tc/workspace/sources/v4l2loopback-driver already exists and is not empty\n'
[snip]

This is because the test case will run twice
(environment-setup-core2-64-poky-linux and
environment-setup-x86-pokymllib32-linux), it would fail in the second
run, 'devtool reset' can not remove sources, so remove it before running
test cases.

[YOCTO #10647]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/sdkext/devtool.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/sdkext/devtool.py b/meta/lib/oeqa/sdkext/devtool.py
index 65f41f6..f101eb6 100644
--- a/meta/lib/oeqa/sdkext/devtool.py
+++ b/meta/lib/oeqa/sdkext/devtool.py
@@ -15,6 +15,9 @@ class DevtoolTest(oeSDKExtTest):
         self.myapp_cmake_dst = os.path.join(self.tc.sdktestdir, "myapp_cmake")
         shutil.copytree(self.myapp_cmake_src, self.myapp_cmake_dst)
 
+        # Clean sources dir to make "git clone" can run again
+        shutil.rmtree(os.path.join(self.tc.sdktestdir, "tc/workspace/sources"), True)
+
     def _test_devtool_build(self, directory):
         self._run('devtool add myapp %s' % directory)
         try:
-- 
2.10.2


