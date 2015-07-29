Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 549E973237
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 09:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6T9oDNk018748 for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 10:51:01 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id H6xqjsQfh12C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 10:51:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6T9onV6018779
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 10:51:00 +0100
Message-ID: <1438163449.11208.57.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jul 2015 10:50:49 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] sshcontrol: Use os.environ.copy() instead of copy.copy()
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
X-List-Received-Date: Wed, 29 Jul 2015 09:51:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

os.environ is special and copy.copy() doesn't do what we'd expect,
changes in the child object change the parent. copy.deepcopy() is
also known to have issues with it.

Use the dedicated .copy() method which will not influence the 
parent. This fixes selftest failures where the DISPLAY variable 
disappears.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/utils/sshcontrol.py b/meta/lib/oeqa/utils/sshcontrol.py
index 4f8d3d2..6ed48ba 100644
--- a/meta/lib/oeqa/utils/sshcontrol.py
+++ b/meta/lib/oeqa/utils/sshcontrol.py
@@ -10,7 +10,6 @@ import subprocess
 import time
 import os
 import select
-import copy
 
 
 class SSHProcess(object):
@@ -33,7 +32,7 @@ class SSHProcess(object):
         self.logfile = None
 
         # Unset DISPLAY which means we won't trigger SSH_ASKPASS
-        env = copy.copy(os.environ)
+        env = os.environ.copy()
         if "DISPLAY" in env:
             del env['DISPLAY']
         self.options['env'] = env



