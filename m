Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E259E70619
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 07:53:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6H7ra0c024191
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 00:53:36 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 17 Jul 2014 00:53:35 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Jul 2014 15:53:35 +0800
Message-ID: <e1f5ab264579c935e5f33072fda1092c90f7c6ce.1405583236.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1405583236.git.Qi.Chen@windriver.com>
References: <cover.1405583236.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V5 2/2] oeqa: fix return status in pam.py to match shadow-4.2.1
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
X-List-Received-Date: Thu, 17 Jul 2014 07:53:35 -0000
Content-Type: text/plain

The return statuses of commands like `su --help' or `passwd --help'
in shadow 4.2.1 version are different from those in shadow 4.1.4.3
version.

Now that we've upgraded shadow to 4.2.1, we need to fix these statuses
in the pam.py to make things work as expected.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/runtime/pam.py |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/runtime/pam.py b/meta/lib/oeqa/runtime/pam.py
index 52e1eb8..cc5c1bd 100644
--- a/meta/lib/oeqa/runtime/pam.py
+++ b/meta/lib/oeqa/runtime/pam.py
@@ -17,8 +17,8 @@ class PamBasicTest(oeRuntimeTest):
         (status, output) = self.target.run('login --help')
         self.assertEqual(status, 1, msg = "login command does not work as expected. Status and output:%s and %s" %(status, output))
         (status, output) = self.target.run('passwd --help')
-        self.assertEqual(status, 6, msg = "passwd command does not work as expected. Status and output:%s and %s" %(status, output))
+        self.assertEqual(status, 0, msg = "passwd command does not work as expected. Status and output:%s and %s" %(status, output))
         (status, output) = self.target.run('su --help')
-        self.assertEqual(status, 2, msg = "su command does not work as expected. Status and output:%s and %s" %(status, output))
+        self.assertEqual(status, 0, msg = "su command does not work as expected. Status and output:%s and %s" %(status, output))
         (status, output) = self.target.run('useradd --help')
-        self.assertEqual(status, 2, msg = "useradd command does not work as expected. Status and output:%s and %s" %(status, output))
+        self.assertEqual(status, 0, msg = "useradd command does not work as expected. Status and output:%s and %s" %(status, output))
-- 
1.7.9.5


