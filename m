Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F366E6AD0D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 08:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5T8GODe031684 for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 09:16:24 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id AwdqFnnQX6uM
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 09:16:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5T8GBj1031652
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 09:16:22 +0100
Message-ID: <1435565771.7287.16.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Jun 2015 09:16:11 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] oeqa/bbtests: Improve error handling
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
X-List-Received-Date: Mon, 29 Jun 2015 08:16:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently if a test fails the cleanup isn't performed, leading to cascade
failures in other tests. We can do better.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
index b301d8f..0dae160 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -121,9 +121,9 @@ class BitbakeTests(oeSelfTest):
     @testcase(1028)
     def test_environment(self):
         self.append_config("TEST_ENV=\"localconf\"")
+        self.addCleanup(self.remove_config, "TEST_ENV=\"localconf\"")
         result = runCmd('bitbake -e | grep TEST_ENV=')
         self.assertTrue('localconf' in result.output)
-        self.remove_config("TEST_ENV=\"localconf\"")
 
     @testcase(1029)
     def test_dry_run(self):
@@ -149,9 +149,9 @@ class BitbakeTests(oeSelfTest):
         result = runCmd('bitbake -r conf/prefile.conf -e | grep TEST_PREFILE=')
         self.assertTrue('prefile' in result.output)
         self.append_config("TEST_PREFILE=\"localconf\"")
+        self.addCleanup(self.remove_config, "TEST_PREFILE=\"localconf\"")
         result = runCmd('bitbake -r conf/prefile.conf -e | grep TEST_PREFILE=')
         self.assertTrue('localconf' in result.output)
-        self.remove_config("TEST_PREFILE=\"localconf\"")
 
     @testcase(1033)
     def test_postfile(self):
@@ -159,9 +159,9 @@ class BitbakeTests(oeSelfTest):
         self.track_for_cleanup(postconf)
         ftools.write_file(postconf , "TEST_POSTFILE=\"postfile\"")
         self.append_config("TEST_POSTFILE=\"localconf\"")
+        self.addCleanup(remove_config, "TEST_POSTFILE=\"localconf\"")
         result = runCmd('bitbake -R conf/postfile.conf -e | grep TEST_POSTFILE=')
         self.assertTrue('postfile' in result.output)
-        self.remove_config("TEST_POSTFILE=\"localconf\"")
 
     @testcase(1034)
     def test_checkuri(self):
@@ -183,8 +183,8 @@ class BitbakeTests(oeSelfTest):
         data = 'INCOMPATIBLE_LICENSE = "GPLv3"'
         conf = os.path.join(self.builddir, 'conf/local.conf')
         ftools.append_file(conf ,data)
+        self.addCleanup(ftools.remove_from_file, conf ,data)
         result = bitbake('readline', ignore_status=True)
         self.assertEqual(result.status, 0)
         self.assertFalse(os.path.isfile(os.path.join(self.builddir, 'tmp/deploy/licenses/readline/generic_GPLv3')))
         self.assertTrue(os.path.isfile(os.path.join(self.builddir, 'tmp/deploy/licenses/readline/generic_GPLv2')))
-        ftools.remove_from_file(conf ,data)
\ No newline at end of file



