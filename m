Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AB0C1761CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 15:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6NFpdpZ030158 for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 16:51:39 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5nqO_7SK6equ
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 16:51:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6NFpRNo030154
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 16:51:38 +0100
Message-ID: <1437666687.821.125.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jul 2015 16:51:27 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] oeqa/sshcontrol: Ensure we don't trigger ssh-askpass
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
X-List-Received-Date: Thu, 23 Jul 2015 15:51:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If DISPLAY is set, ssh-askpass can be triggered which is not what
we want in the middle of sanity tests. We can disable this by
unsetting DISPLAY.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/utils/sshcontrol.py b/meta/lib/oeqa/utils/sshcontrol.py
index 1c81795..4f8d3d2 100644
--- a/meta/lib/oeqa/utils/sshcontrol.py
+++ b/meta/lib/oeqa/utils/sshcontrol.py
@@ -10,6 +10,7 @@ import subprocess
 import time
 import os
 import select
+import copy
 
 
 class SSHProcess(object):
@@ -31,6 +32,12 @@ class SSHProcess(object):
         self.starttime = None
         self.logfile = None
 
+        # Unset DISPLAY which means we won't trigger SSH_ASKPASS
+        env = copy.copy(os.environ)
+        if "DISPLAY" in env:
+            del env['DISPLAY']
+        self.options['env'] = env
+
     def log(self, msg):
         if self.logfile:
             with open(self.logfile, "a") as f:



