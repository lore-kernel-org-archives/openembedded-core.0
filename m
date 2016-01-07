Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4F4AC731E1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 03:30:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u073U2UU011843
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jan 2016 19:30:02 -0800 (PST)
Received: from localhost (128.224.162.175) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Wed, 6 Jan 2016 19:30:01 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Jan 2016 11:29:52 +0800
Message-ID: <1452137394-333-2-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1452137394-333-1-git-send-email-yi.zhao@windriver.com>
References: <1452137394-333-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.175]
Subject: [PATCH 1/3] oeqa/runtime/smart: fix hardcoded root directory
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
X-List-Received-Date: Thu, 07 Jan 2016 03:30:03 -0000
Content-Type: text/plain

Use $HOME instead of /home/root in case user changes the default root
directory by ROOT_HOME

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/lib/oeqa/runtime/smart.py |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/smart.py b/meta/lib/oeqa/runtime/smart.py
index e41668d..126d614 100644
--- a/meta/lib/oeqa/runtime/smart.py
+++ b/meta/lib/oeqa/runtime/smart.py
@@ -147,7 +147,7 @@ class SmartRepoTest(SmartTest):
         for i in output.split("\n"):
             if ("rpmsys" != str(i)) and ("myrpmdir" != str(i)):
                 self.smart('channel --disable '+str(i))
-        self.target.run('cd /home/root')
+        self.target.run('cd $HOME')
         self.smart('install psplash')
         for i in output.split("\n"):
             if ("rpmsys" != str(i)) and ("myrpmdir" != str(i)):
@@ -172,4 +172,4 @@ class SmartRepoTest(SmartTest):
     @skipUnlessPassed('test_smart_channel_add')
     def test_smart_remove_package(self):
         self.smart('install -y psplash')
-        self.smart('remove -y psplash')
\ No newline at end of file
+        self.smart('remove -y psplash')
-- 
1.7.9.5


