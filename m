Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B70FF754B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 10:00:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6CA0Hbi000847
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 03:00:17 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Thu, 12 Jul 2018 03:00:16 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Jul 2018 18:03:42 +0800
Message-ID: <8b95f9f792c91031b7b01cc9e78b9d937db6c353.1531389673.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1531389673.git.Qi.Chen@windriver.com>
References: <cover.1531389673.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] oeqa/runtime/cases/rpm.py: workaround race condition
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
X-List-Received-Date: Thu, 12 Jul 2018 10:00:17 -0000
Content-Type: text/plain

With the recent change in new systemd version, it's possible that
a user is deleted before stopping user-runtime-dir@xxx.service.
See link below.

  https://github.com/systemd/systemd/issues/9541

Workaround this issue by delay for 1 second before deleting user.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/runtime/cases/rpm.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/rpm.py b/meta/lib/oeqa/runtime/cases/rpm.py
index 1e5e463..2f9dcad 100644
--- a/meta/lib/oeqa/runtime/cases/rpm.py
+++ b/meta/lib/oeqa/runtime/cases/rpm.py
@@ -87,6 +87,12 @@ class RpmInstallRemoveTest(OERuntimeTestCase):
             self.assertEqual(status, 0, msg=msg)
 
         def unset_up_test_user(u):
+            # Due to recent change in systemd, we need to sleep for a while
+            # to avoid unexpected failure of user-runtime-dir@1000.service
+            # See https://github.com/systemd/systemd/issues/9541
+            if self.tc.td.get('VIRTUAL-RUNTIME_init_manager') == 'systemd':
+                self.target.run('sleep 1')
+
             status, output = self.target.run('userdel -r %s' % u)
             msg = 'Failed to erase user: %s' % output
             self.assertTrue(status == 0, msg=msg)
-- 
1.9.1


