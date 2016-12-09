Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 036AE6067C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2016 08:38:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uB98cHbX006984
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 9 Dec 2016 00:38:17 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 9 Dec 2016 00:38:16 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 9 Dec 2016 00:38:15 -0800
Message-ID: <a27415050670fcb77888e9a8a770c1e4c4d63246.1481272232.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1481272232.git.liezhi.yang@windriver.com>
References: <cover.1481272232.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] [jethro] selftest/recipetool.py: set srcrev for recipetool create
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
X-List-Received-Date: Fri, 09 Dec 2016 08:38:17 -0000
Content-Type: text/plain

The srcrev would default to master when not set, which may cause erorrs
when the source is changed.

Fixed:
======================================================================
FAIL: test_recipetool_create_git (oeqa.selftest.recipetool.RecipetoolTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/utils/decorators.py", line 106, in wrapped_f
    return func(*args, **kwargs)
  File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/recipetool.py", line 402, in test_recipetool_create_git
    self._test_recipe_contents(recipefile, checkvars, inherits)
  File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/devtool.py", line 25, in _test_recipe_contents
    self.assertEqual(value, needvalue, 'values for %s do not match' % var)
AssertionError: 'Unknown LGPLv2.1' != 'LGPLv2.1' : values for LICENSE do not match

The rev=9f7cf8895ae2d39c465c04cc78e918c157420269 is taken from master
branch. It was failed because libmatchbox's master branch has added a
COPYING.MIT, and the testcase only checks COPYING.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/selftest/recipetool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/recipetool.py b/meta/lib/oeqa/selftest/recipetool.py
index b1f1d2ab..d15820c 100644
--- a/meta/lib/oeqa/selftest/recipetool.py
+++ b/meta/lib/oeqa/selftest/recipetool.py
@@ -389,7 +389,7 @@ class RecipetoolTests(RecipetoolBase):
         os.makedirs(tempsrc)
         recipefile = os.path.join(self.tempdir, 'libmatchbox.bb')
         srcuri = 'git://git.yoctoproject.org/libmatchbox'
-        result = runCmd('recipetool create -o %s %s -x %s' % (recipefile, srcuri, tempsrc))
+        result = runCmd('recipetool create -o %s "%s;rev=9f7cf8895ae2d39c465c04cc78e918c157420269" -x %s' % (recipefile, srcuri, tempsrc))
         self.assertTrue(os.path.isfile(recipefile), 'recipetool did not create recipe file; output:\n%s' % result.output)
         checkvars = {}
         checkvars['LICENSE'] = 'LGPLv2.1'
-- 
2.10.2


