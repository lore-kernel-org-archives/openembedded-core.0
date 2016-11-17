Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1E5B571A99
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 06:19:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uAH6Jhph028532
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 22:19:43 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 16 Nov 2016 22:19:43 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Nov 2016 22:19:36 -0800
Message-ID: <fc8b06202cbadfba3e40966e7dfa87bbb62c84fc.1479363545.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1479363545.git.liezhi.yang@windriver.com>
References: <cover.1479363545.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/8] oeqa/sdkext/devtool.py: skip test_extend_autotools_recipe_creation when no libxml2
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
X-List-Received-Date: Thu, 17 Nov 2016 06:19:42 -0000
Content-Type: text/plain

The librdfa requires libxml2 to build, otherwise, it would fail:
| configure: error: Package requirements (libxml-2.0 >= 2.6.26) were not met:
|
| No package 'libxml-2.0' found

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/sdkext/devtool.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/sdkext/devtool.py b/meta/lib/oeqa/sdkext/devtool.py
index c91090e..9ff69f9 100644
--- a/meta/lib/oeqa/sdkext/devtool.py
+++ b/meta/lib/oeqa/sdkext/devtool.py
@@ -1,7 +1,7 @@
 import shutil
 import subprocess
 import urllib.request
-from oeqa.oetest import oeSDKExtTest
+from oeqa.oetest import oeSDKExtTest, skipModule
 from oeqa.utils.decorators import *
 
 class DevtoolTest(oeSDKExtTest):
@@ -64,6 +64,9 @@ class DevtoolTest(oeSDKExtTest):
     @testcase(1482)
     @skipUnlessPassed('test_devtool_location')
     def test_extend_autotools_recipe_creation(self):
+        # librdfa requires libxml2
+        if not oeSDKExtTest.hasLockedSig("libxml2"):
+            skipModule("No libxml2 package in the eSDK")
         req = 'https://github.com/rdfa/librdfa'
         recipe = "bbexample"
         self._run('devtool add %s %s' % (recipe, req) )
-- 
2.10.2


