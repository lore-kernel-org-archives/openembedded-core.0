Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BED297596C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 15:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5PFlg7k006800 for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 16:47:42 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id G4E4OJ7Me4qH
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 16:47:42 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5PFlSID006797
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 16:47:40 +0100
Message-ID: <1435247248.10583.15.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Jun 2015 16:47:28 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] oeqa/selftest/recipetool: Fix appendfile_binary test on opensuse131
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
X-List-Received-Date: Thu, 25 Jun 2015 15:47:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On OpenSUSE 13.1, /bin/ls is a symlink to /usr/bin/ls. This means the
test doesn't use a binary file an fails on that system.

Ensure we resolve any symlink using readlink to avoid this failure.

======================================================================
FAIL: test_recipetool_appendfile_binary (oeqa.selftest.recipetool.RecipetoolTests)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-oe-selftest/build/meta/lib/oeqa/selftest/recipetool.py", line 115, in test_recipetool_appendfile_binary
    self.assertIn('WARNING: ', result.output)
AssertionError: 'WARNING: ' not found in 'Parsing recipes..done.\nNOTE: Writing append file /tmp/recipetoolqai0NY8l/recipes-core/coreutils/coreutils_8.23.bbappend\nNOTE: Copying /bin/ls to /tmp/recipetoolqai0NY8l/recipes-core/coreutils/coreutils/ls'

[YOCTO #7920]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/selftest/recipetool.py b/meta/lib/oeqa/selftest/recipetool.py
index f3ad493..c08b2e4 100644
--- a/meta/lib/oeqa/selftest/recipetool.py
+++ b/meta/lib/oeqa/selftest/recipetool.py
@@ -111,7 +111,9 @@ class RecipetoolTests(DevtoolBase):
 
     def test_recipetool_appendfile_binary(self):
         # Try appending a binary file
-        result = runCmd('recipetool appendfile %s /bin/ls /bin/ls -r coreutils' % templayerdir)
+        # /bin/ls can be a symlink to /usr/bin/ls
+        ls = os.readlink("/bin/ls")
+        result = runCmd('recipetool appendfile %s /bin/ls %s -r coreutils' % (templayerdir, ls))
         self.assertIn('WARNING: ', result.output)
         self.assertIn('is a binary', result.output)
 



