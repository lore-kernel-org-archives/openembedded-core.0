Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AD9017E555
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 01:06:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5L167OL014844
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2019 18:06:07 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Thu, 20 Jun 2019 18:06:07 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Jun 2019 09:18:02 +0800
Message-ID: <24cb70ba6329aecc601079975ce689a88a392688.1561023072.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1561023072.git.Qi.Chen@windriver.com>
References: <cover.1561023072.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] context.py: avoid skipping tests by meaningless command argument
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
X-List-Received-Date: Fri, 21 Jun 2019 01:06:06 -0000
Content-Type: text/plain

Currently `oe-selftest -R a' will skip 'archiver' tests. This is
not expected. Fix it so that the '-R' should be followed by actual
module/class/test names.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/core/context.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 5824489..7882697 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -52,7 +52,7 @@ class OETestContext(object):
             return func
         for test in self.suites:
             for skip in skips:
-                if test.id().startswith(skip):
+                if (test.id()+'.').startswith(skip+'.'):
                     setattr(test, 'setUp', skipfuncgen('Skip by the command line argument "%s"' % skip))
 
     def loadTests(self, module_paths, modules=[], tests=[],
-- 
1.9.1


