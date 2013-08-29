Return-Path: <stefanx.stanacar@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 0FC7C6BD79
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:05:24 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 29 Aug 2013 09:05:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,984,1367996400"; d="scan'208";a="288481942"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Aug 2013 09:05:23 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 7DF3E6A4007;
	Thu, 29 Aug 2013 09:05:20 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2013 19:05:13 +0300
Message-Id: <1377792313-15644-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] lib/oeqa/runtime: syslog: fix test for logger in case of systemd
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
X-List-Received-Date: Thu, 29 Aug 2013 16:05:25 -0000

Recently syslog behaviour changed for systemd images (log
it's in a buffer not in /var/log/messages), account
for the new stuff.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/runtime/syslog.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/runtime/syslog.py b/meta/lib/oeqa/runtime/syslog.py
index 5ff2962..14d94fd 100644
--- a/meta/lib/oeqa/runtime/syslog.py
+++ b/meta/lib/oeqa/runtime/syslog.py
@@ -23,7 +23,7 @@ class SyslogTestConfig(oeRuntimeTest):
 
     @skipUnlessPassed("test_syslog_running")
     def test_syslog_logger(self):
-        (status,output) = self.target.run('logger foobar && grep foobar /var/log/messages')
+        (status,output) = self.target.run('logger foobar && test -e /var/log/messages && grep foobar /var/log/messages || logread | grep')
         self.assertEqual(status, 0, msg="Test log string not found in /var/log/messages. Output: %s " % output)
 
     @skipUnlessPassed("test_syslog_running")
-- 
1.8.3.1


