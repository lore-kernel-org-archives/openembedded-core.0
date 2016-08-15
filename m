Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 594AB758DB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 16:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7FGuimo010625 for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 17:56:44 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GtS5CdpcuqKY
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 17:56:44 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7FGue5J010622
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 17:56:41 +0100
Message-ID: <1471280200.20391.90.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Aug 2016 17:56:40 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] oeqa/oetest: Improve subprocess error reporting
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
X-List-Received-Date: Mon, 15 Aug 2016 16:56:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Without this, we get to know the command failed and the exit code but 
have no idea how the command failed since we don't get the output by 
default.

This makes it much easier to see what went wrong and stand a chance of 
fixing it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 5146312..fe103e8 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -136,6 +136,12 @@ class oeRuntimeTest(oeTest):
             if status != 0:
                 return status
 
+class OETestCalledProcessError(subprocess.CalledProcessError):
+    def __str__(self):
+        return "Command '%s' returned non-zero exit status %d with output %s and stderr %s" % (self.cmd, self.returncode, self.output, self.stderr)
+
+subprocess.CalledProcessError = OETestCalledProcessError
+
 class oeSDKTest(oeTest):
     def __init__(self, methodName='runTest'):
         self.sdktestdir = oeSDKTest.tc.sdktestdir



