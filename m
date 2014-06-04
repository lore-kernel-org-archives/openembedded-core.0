Return-Path: <georgex.l.musat@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BD2C565ED7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jun 2014 15:29:19 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 04 Jun 2014 08:29:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,973,1392192000"; d="scan'208";a="542422278"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 04 Jun 2014 08:29:04 -0700
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id 522466A4087;
	Wed,  4 Jun 2014 08:28:37 -0700 (PDT)
From: Lucian Musat <georgex.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jun 2014 18:26:30 +0300
Message-Id: <1401895590-12538-1-git-send-email-georgex.l.musat@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] Added new test cases for bitbake modes (-e -n -p -r -R -c -k)
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
X-List-Received-Date: Wed, 04 Jun 2014 15:29:24 -0000

Signed-off-by: Lucian Musat <georgex.l.musat@intel.com>
---
 meta/lib/oeqa/selftest/bbtests.py | 52 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
index 6815ecf..d730bfd 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -102,3 +102,55 @@ class BitbakeTests(oeSelfTest):
         self.assertTrue(os.path.isfile(os.path.join(get_bb_var("DL_DIR"), 'test-aspell.tar.gz')))
         self.assertTrue(os.path.isfile(os.path.join(get_bb_var("DL_DIR"), 'test-aspell.tar.gz.done')))
         bitbake('-ccleanall aspell')
+
+    def test_environment(self):
+	self.append_config("TEST_ENV=\"localconf\"")
+	result = runCmd('bitbake -e | grep TEST_ENV=')
+	self.assertTrue('localconf' in result.output)
+	self.remove_config("TEST_ENV=\"localconf\"")
+
+    def test_dry_run(self):
+	result = runCmd('bitbake -n m4-native')
+	self.assertEqual(0, result.status)
+
+    def test_just_parse(self):
+	result = runCmd('bitbake -p')
+	self.assertEqual(0, result.status)
+
+    def test_version(self):
+	result = runCmd('bitbake -s | grep wget')
+	find = re.search("wget *:([0-9a-zA-Z\.\-]+)", result.output)
+	self.assertTrue(find) 
+
+    def test_prefile(self):
+	preconf = os.path.join(self.builddir, 'conf/prefile.conf')
+	self.track_for_cleanup(preconf)
+	ftools.write_file(preconf ,"TEST_PREFILE=\"prefile\"")
+	result = runCmd('bitbake -r conf/prefile.conf -e | grep TEST_PREFILE=')
+	self.assertTrue('prefile' in result.output)
+	self.append_config("TEST_PREFILE=\"localconf\"")
+	result = runCmd('bitbake -r conf/prefile.conf -e | grep TEST_PREFILE=')
+	self.assertTrue('localconf' in result.output)
+	self.remove_config("TEST_PREFILE=\"localconf\"")
+
+    def test_postfile(self):
+	postconf = os.path.join(self.builddir, 'conf/postfile.conf')
+	self.track_for_cleanup(postconf)
+	ftools.write_file(postconf , "TEST_POSTFILE=\"postfile\"")
+	self.append_config("TEST_POSTFILE=\"localconf\"")
+	result = runCmd('bitbake -R conf/postfile.conf -e | grep TEST_POSTFILE=')
+	self.assertTrue('postfile' in result.output)
+	self.remove_config("TEST_POSTFILE=\"localconf\"")
+
+    def test_checkuri(self):
+	result = runCmd('bitbake -c checkuri m4')
+	self.assertEqual(0, result.status)
+
+    def test_continue(self):
+	self.write_recipeinc('man',"\ndo_fail_task () {\nexit 1 \n}\n\naddtask do_fail_task before do_fetch\n" )
+	runCmd('bitbake -c cleanall man xcursor-transparent-theme')
+	result = runCmd('bitbake man xcursor-transparent-theme -k', ignore_status=True)
+	errorpos = result.output.find('ERROR: Function failed: do_fail_task')
+	manver = re.search("NOTE: recipe xcursor-transparent-theme-(.*?): task do_unpack: Started", result.output)
+	continuepos = result.output.find('NOTE: recipe xcursor-transparent-theme-%s: task do_unpack: Started' % manver.group(1))
+	self.assertLess(errorpos,continuepos)
-- 
1.9.1


