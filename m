Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8DD4C7E9E8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2019 03:27:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x633RZaB026754
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Jul 2019 20:27:35 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Tue, 2 Jul 2019 20:27:35 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Jul 2019 11:39:48 +0800
Message-ID: <65ab236956321525d9e610c6f7c5415ae532812e.1562125156.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1562125156.git.Qi.Chen@windriver.com>
References: <cover.1562125156.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] devtool.py: track to clean devtool.conf in test_create_workspace
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
X-List-Received-Date: Wed, 03 Jul 2019 03:27:34 -0000
Content-Type: text/plain

`devtool create-workspace' would create devtool.conf, so track to
clean it up. Otherwise, this devtool.conf file would mess things up.

e.g.
oe-selftest -r devtool && oe-selftest -r devtool -j 2
AssertionError: '/PROJ_DIR/build-selftest-st-15753/workspace/conf/layer.conf' does not exist : Workspace directory not created

This is because the devtool.conf is also copied to build-selftest-st-xxxx
directory, resulting in devtool to create and use workspace specified
in this file.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 904ff69..6fe145c 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -240,6 +240,9 @@ class DevtoolTests(DevtoolBase):
         # Check preconditions
         result = runCmd('bitbake-layers show-layers')
         self.assertTrue('\nworkspace' not in result.output, 'This test cannot be run with a workspace layer in bblayers.conf')
+        # remove conf/devtool.conf to avoid it corrupting tests
+        devtoolconf = os.path.join(self.builddir, 'conf', 'devtool.conf')
+        self.track_for_cleanup(devtoolconf)
         # Try creating a workspace layer with a specific path
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
-- 
1.9.1


