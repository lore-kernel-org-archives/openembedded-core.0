Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0997E76FD7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Sep 2015 16:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8QGl4Qu030921 for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Sep 2015 17:47:04 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id iwE5Z2Te2bLy
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Sep 2015 17:47:04 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8QGkr37030907
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Sep 2015 17:47:04 +0100
Message-ID: <1443286013.19044.217.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 26 Sep 2015 17:46:53 +0100
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] oeqa/oetest: Fix SDK command execution
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
X-List-Received-Date: Sat, 26 Sep 2015 16:47:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The SDK environment wasn't being sourced when running these test
commands, meaning in some cases the cross compiler was being tested,
not the SDK tools. This is clearly not the intent so fix this by
ensuring the SDK environment is present. This fixes test failures
in multilib SDKs.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 3816c1a..95a463b 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -203,7 +203,7 @@ class oeSDKTest(oeTest):
         return False
 
     def _run(self, cmd):
-        return subprocess.check_output(cmd, shell=True)
+        return subprocess.check_output(". %s; " % self.tc.sdkenv + cmd, shell=True)
 
 def getmodule(pos=2):
     # stack returns a list of tuples containg frame information



