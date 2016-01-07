Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0EDF0731D6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 03:30:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u073U6jt018681
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jan 2016 19:30:06 -0800
Received: from localhost (128.224.162.175) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Wed, 6 Jan 2016 19:30:05 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Jan 2016 11:29:53 +0800
Message-ID: <1452137394-333-3-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1452137394-333-1-git-send-email-yi.zhao@windriver.com>
References: <1452137394-333-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.175]
Subject: [PATCH 2/3] oeqa/runtime/logrotate: fix hardcoded root directory
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
X-List-Received-Date: Thu, 07 Jan 2016 03:30:06 -0000
Content-Type: text/plain

Use $HOME instead of /home/root in case user changes the default root
directory by ROOT_HOME

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/lib/oeqa/runtime/logrotate.py |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/runtime/logrotate.py b/meta/lib/oeqa/runtime/logrotate.py
index 86d791c..de300bf 100644
--- a/meta/lib/oeqa/runtime/logrotate.py
+++ b/meta/lib/oeqa/runtime/logrotate.py
@@ -14,9 +14,9 @@ class LogrotateTest(oeRuntimeTest):
 
     @skipUnlessPassed("test_ssh")
     def test_1_logrotate_setup(self):
-        (status, output) = self.target.run('mkdir /home/root/logrotate_dir')
+        (status, output) = self.target.run('mkdir $HOME/logrotate_dir')
         self.assertEqual(status, 0, msg = "Could not create logrotate_dir. Output: %s" % output)
-        (status, output) = self.target.run("sed -i 's#wtmp {#wtmp {\\n    olddir /home/root/logrotate_dir#' /etc/logrotate.conf")
+        (status, output) = self.target.run("sed -i \"s#wtmp {#wtmp {\\n    olddir $HOME/logrotate_dir#\" /etc/logrotate.conf")
         self.assertEqual(status, 0, msg = "Could not write to logrotate.conf file. Status and output: %s and %s)" % (status, output))
 
     @testcase(289)
@@ -24,5 +24,5 @@ class LogrotateTest(oeRuntimeTest):
     def test_2_logrotate(self):
         (status, output) = self.target.run('logrotate -f /etc/logrotate.conf')
         self.assertEqual(status, 0, msg = "logrotate service could not be reloaded. Status and output: %s and %s" % (status, output))
-        output = self.target.run('ls -la /home/root/logrotate_dir/ | wc -l')[1]
-        self.assertTrue(int(output)>=3, msg = "new logfile could not be created. List of files within log directory: %s" %(self.target.run('ls -la /home/root/logrotate_dir')[1]))
+        output = self.target.run('ls -la $HOME/logrotate_dir/ | wc -l')[1]
+        self.assertTrue(int(output)>=3, msg = "new logfile could not be created. List of files within log directory: %s" %(self.target.run('ls -la $HOME/logrotate_dir')[1]))
-- 
1.7.9.5


