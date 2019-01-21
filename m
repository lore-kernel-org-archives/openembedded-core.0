Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F25AC745A1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2019 09:21:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0L9LZAi025320
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2019 01:21:45 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 21 Jan 2019 01:21:24 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Jan 2019 17:29:59 +0800
Message-ID: <f2b0687b21913c2806aebdb3355a6444649ec08d.1548062956.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1548062956.git.Qi.Chen@windriver.com>
References: <cover.1548062956.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] devtool.py: remove fetch results from download directory to avoid failure
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
X-List-Received-Date: Mon, 21 Jan 2019 09:21:55 -0000
Content-Type: text/plain

The fetch results need to be removed from the download directory to avoid
failures like below.

  Submodule path 'doxyport': checked out 'db3e1a6eb8677d3166d90d82c3068689803ce547'

  fatal: reference is not a tree: 67cad692720982ac3cbd99bf1c3421edc69b08f9
  Unable to checkout '67cad692720982ac3cbd99bf1c3421edc69b08f9' in submodule path 'doxygen2jsdoc'

  ERROR: Function failed: base_do_unpack

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 9eb9bad..4fcbdc3 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -446,6 +446,7 @@ class DevtoolAddTests(DevtoolBase):
         # Test devtool add
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake -c cleansstate %s' % testrecipe)
+        self.add_command_to_tearDown('rm -rf %s/git2/*%s*' % (get_bb_var('DL_DIR', None), testrecipe))
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         result = runCmd('devtool add %s %s -a -f %s' % (testrecipe, srcdir, url))
         self.assertExists(os.path.join(self.workspacedir, 'conf', 'layer.conf'), 'Workspace directory not created: %s' % result.output)
@@ -464,6 +465,8 @@ class DevtoolAddTests(DevtoolBase):
         checkvars['SRCREV'] = '${AUTOREV}'
         self._test_recipe_contents(recipefile, checkvars, [])
         # Try with revision and version specified
+        result = runCmd('bitbake -c cleansstate %s' % testrecipe)
+        result = runCmd('rm -rf %s/git2/*%s*' % (get_bb_var('DL_DIR', None), testrecipe))
         result = runCmd('devtool reset -n %s' % testrecipe)
         shutil.rmtree(srcdir)
         url_rev = '%s;rev=%s' % (url, checkrev)
-- 
1.9.1


