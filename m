Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A0FFC7872E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 10:47:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vBLAlH2Z022221
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 02:47:17 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Thu, 21 Dec 2017 02:47:16 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Dec 2017 18:47:09 +0800
Message-ID: <db82cf9442451cc487407b11c9cc856e9e9576d5.1513853180.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1513853180.git.liezhi.yang@windriver.com>
References: <cover.1513853180.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] selftest/cases/devtool.py: fix workspace layer checking
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
X-List-Received-Date: Thu, 21 Dec 2017 10:47:16 -0000
Content-Type: text/plain

Fixed:
$ oe-selftest -r devtool.DevtoolTests.test_create_workspace
[snip]
2017-12-20 18:28:59,404 - oe-selftest - INFO - Traceback (most recent call last):
  File "/workspace2/lyang1/poky/meta/lib/oeqa/core/decorator/__init__.py", line 32, in wrapped_f
    return func(*args, **kwargs)
  File "/workspace2/lyang1/poky/meta/lib/oeqa/selftest/cases/devtool.py", line 177, in test_create_workspace
    self.assertTrue('/workspace' not in result.output, 'This test cannot be run with a workspace layer in bblayers.conf')
AssertionError: False is not true : This test cannot be run with a workspace layer in bblayers.conf
[snip]

$ bitbake-layers show-layers
NOTE: Starting bitbake server...
layer                 path                                      priority
==========================================================================
meta                  /workspace2/lyang1/poky/meta              5
meta-poky             /workspace2/lyang1/poky/meta-poky         5
meta-yocto-bsp        /workspace2/lyang1/poky/meta-yocto-bsp    5
meta-selftest         /workspace2/lyang1/poky/meta-selftest     5

There is no workspace layer, but I'm in /workspace2, this patch can fix the problem.

[YOCTO #12442]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 8a1e685..460f3cc 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -174,7 +174,7 @@ class DevtoolTests(DevtoolBase):
     def test_create_workspace(self):
         # Check preconditions
         result = runCmd('bitbake-layers show-layers')
-        self.assertTrue('/workspace' not in result.output, 'This test cannot be run with a workspace layer in bblayers.conf')
+        self.assertTrue('\nworkspace' not in result.output, 'This test cannot be run with a workspace layer in bblayers.conf')
         # Try creating a workspace layer with a specific path
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
-- 
2.7.4


