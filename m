Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 19E5C77181
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 15:22:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 779A460029B
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 16:21:57 +0100
Message-Id: <aa3b859524bb693d3b150a8873a2ee24c78eac0a.1445527096.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
In-Reply-To: <cover.1445527096.git.joshua.lock@collabora.co.uk>
References: <cover.1445527096.git.joshua.lock@collabora.co.uk>
Subject: [PATCH v3 36/52] oeqa/selftest/bbtests: clean up local DL_DIR/SSTATE_DIR safely
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
X-List-Received-Date: Thu, 22 Oct 2015 15:22:26 -0000

From: Ross Burton <ross.burton@intel.com>

Now that the selftests clean selftest.inc in the tearDown using bitbake in a
function passed to addCleanup (which happens after teardown) will use the
default configuration and not the customised one.

As the intention was to clean away the temporary DL_DIR and SSTATE_DIR, simple
use track_for_cleanup to delete the entire directory instead.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/bbtests.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
index 3d6860f..af0773d 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -101,6 +101,8 @@ class BitbakeTests(oeSelfTest):
         self.write_config("""DL_DIR = \"${TOPDIR}/download-selftest\"
 SSTATE_DIR = \"${TOPDIR}/download-selftest\"
 """)
+        self.track_for_cleanup(os.path.join(self.builddir, "download-selftest"))
+
         bitbake('-ccleanall man')
         result = bitbake('-c fetch man', ignore_status=True)
         bitbake('-ccleanall man')
@@ -116,12 +118,13 @@ doesn't exist, yet fetcher didn't report any error. bitbake output: %s" % result
         self.write_config("""DL_DIR = \"${TOPDIR}/download-selftest\"
 SSTATE_DIR = \"${TOPDIR}/download-selftest\"
 """)
+        self.track_for_cleanup(os.path.join(self.builddir, "download-selftest"))
+
         data = 'SRC_URI_append = ";downloadfilename=test-aspell.tar.gz"'
         self.write_recipeinc('aspell', data)
         bitbake('-ccleanall aspell')
         result = bitbake('-c fetch aspell', ignore_status=True)
         self.delete_recipeinc('aspell')
-        self.addCleanup(bitbake, '-ccleanall aspell')
         self.assertEqual(result.status, 0, msg = "Couldn't fetch aspell. %s" % result.output)
         self.assertTrue(os.path.isfile(os.path.join(get_bb_var("DL_DIR"), 'test-aspell.tar.gz')), msg = "File rename failed. No corresponding test-aspell.tar.gz file found under %s" % str(get_bb_var("DL_DIR")))
         self.assertTrue(os.path.isfile(os.path.join(get_bb_var("DL_DIR"), 'test-aspell.tar.gz.done')), "File rename failed. No corresponding test-aspell.tar.gz.done file found under %s" % str(get_bb_var("DL_DIR")))
@@ -181,6 +184,7 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
         self.write_config("""DL_DIR = \"${TOPDIR}/download-selftest\"
 SSTATE_DIR = \"${TOPDIR}/download-selftest\"
 """)
+        self.track_for_cleanup(os.path.join(self.builddir, "download-selftest"))
         self.write_recipeinc('man',"\ndo_fail_task () {\nexit 1 \n}\n\naddtask do_fail_task before do_fetch\n" )
         runCmd('bitbake -c cleanall man xcursor-transparent-theme')
         result = runCmd('bitbake man xcursor-transparent-theme -k', ignore_status=True)
-- 
2.1.4


