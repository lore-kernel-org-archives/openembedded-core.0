Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F27C760024
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 08:16:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5T8Gvt0031757 for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 09:16:57 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CEgFfEG_aDJi
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 09:16:57 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5T8Gh01031722
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 09:16:55 +0100
Message-ID: <1435565803.7287.17.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 29 Jun 2015 09:16:43 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] oeqa/bbtests: Show useful failure message for gplv3 test
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
X-List-Received-Date: Mon, 29 Jun 2015 08:16:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If this test fails the current output tells us nothing about what happened.
Show the exit status and output to aid debugging.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
index 0dae160..e4f69a3 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -185,6 +185,6 @@ class BitbakeTests(oeSelfTest):
         ftools.append_file(conf ,data)
         self.addCleanup(ftools.remove_from_file, conf ,data)
         result = bitbake('readline', ignore_status=True)
-        self.assertEqual(result.status, 0)
+        self.assertEqual(result.status, 0, "Bitbake failed, exit code %s, output %s" % (result.status, result.output))
         self.assertFalse(os.path.isfile(os.path.join(self.builddir, 'tmp/deploy/licenses/readline/generic_GPLv3')))
         self.assertTrue(os.path.isfile(os.path.join(self.builddir, 'tmp/deploy/licenses/readline/generic_GPLv2')))



