Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B621D6003C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2017 20:33:56 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 06 Jan 2017 12:33:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,326,1477983600"; d="scan'208";a="919732086"
Received: from jgperezc.zpn.intel.com ([10.219.5.150])
	by orsmga003.jf.intel.com with ESMTP; 06 Jan 2017 12:33:55 -0800
From: jose.perez.carranza@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jan 2017 14:45:28 -0600
Message-Id: <1483735528-419-1-git-send-email-jose.perez.carranza@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] runtime: Add cleanup for logrotate tests
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
X-List-Received-Date: Fri, 06 Jan 2017 20:33:58 -0000

From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>

Delete logrotate dir to avoid errors
when test are executed more than 1
time on the same target.

Signed-off-by: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
---
 meta/lib/oeqa/runtime/logrotate.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/runtime/logrotate.py b/meta/lib/oeqa/runtime/logrotate.py
index cf88c54..063280b 100644
--- a/meta/lib/oeqa/runtime/logrotate.py
+++ b/meta/lib/oeqa/runtime/logrotate.py
@@ -27,3 +27,4 @@ class LogrotateTest(oeRuntimeTest):
         self.assertEqual(status, 0, msg = "logrotate service could not be reloaded. Status and output: %s and %s" % (status, output))
         output = self.target.run('ls -la $HOME/logrotate_dir/ | wc -l')[1]
         self.assertTrue(int(output)>=3, msg = "new logfile could not be created. List of files within log directory: %s" %(self.target.run('ls -la $HOME/logrotate_dir')[1]))
+        self.target.run('rm -rf $HOME/logrotate_dir')
-- 
2.1.4


