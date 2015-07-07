Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DB16775CC8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jul 2015 12:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t67CMSbR028319 for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Jul 2015 13:22:28 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id w2Sf6pybu-_3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jul 2015 13:22:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t67CMFbC028315
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Jul 2015 13:22:26 +0100
Message-ID: <1436271735.27597.180.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 07 Jul 2015 13:22:15 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] oeqa/bbtests: Fix race over DL_DIR and SSTATE_DIR
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
X-List-Received-Date: Tue, 07 Jul 2015 12:22:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Running "-c cleanall" on shared DL_DIR and SSTATE_DIR is antisocial.
It leads to hard to debug races where we wonder why files disappear
and reappear from those directories.

Fix this by using a specific set of directories for these tests. This
avoids a long standing bug on the autobuilder where aspell and man
sources would disappear.

[YOCTO #6276]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
index 9bd34ee..ffe0ea5 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -98,6 +98,8 @@ class BitbakeTests(oeSelfTest):
     def test_invalid_recipe_src_uri(self):
         data = 'SRC_URI = "file://invalid"'
         self.write_recipeinc('man', data)
+        self.write_config("DL_DIR = \"${TOPDIR}/download-selftest\"")
+        self.write_config("SSTATE_DIR = \"${TOPDIR}/download-selftest\"")
         bitbake('-ccleanall man')
         result = bitbake('-c fetch man', ignore_status=True)
         bitbake('-ccleanall man')
@@ -108,6 +110,8 @@ class BitbakeTests(oeSelfTest):
 
     @testcase(171)
     def test_rename_downloaded_file(self):
+        self.write_config("DL_DIR = \"${TOPDIR}/download-selftest\"")
+        self.write_config("SSTATE_DIR = \"${TOPDIR}/download-selftest\"")
         data = 'SRC_URI_append = ";downloadfilename=test-aspell.tar.gz"'
         self.write_recipeinc('aspell', data)
         bitbake('-ccleanall aspell')
@@ -170,6 +174,8 @@ class BitbakeTests(oeSelfTest):
 
     @testcase(1035)
     def test_continue(self):
+        self.write_config("DL_DIR = \"${TOPDIR}/download-selftest\"")
+        self.write_config("SSTATE_DIR = \"${TOPDIR}/download-selftest\"")
         self.write_recipeinc('man',"\ndo_fail_task () {\nexit 1 \n}\n\naddtask do_fail_task before do_fetch\n" )
         runCmd('bitbake -c cleanall man xcursor-transparent-theme')
         result = runCmd('bitbake man xcursor-transparent-theme -k', ignore_status=True)



