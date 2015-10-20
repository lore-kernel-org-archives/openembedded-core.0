Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id A348876E70
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 14:00:32 +0000 (UTC)
Received: by wicfv8 with SMTP id fv8so30330567wic.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 07:00:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=nA/MFFs2NuxmivQv2hqppCAfVPf/sPZjvMY62/9IDac=;
	b=EpCcBeNCipatnqyaYJgcpgzH3MTIgUo1G97eC07jAnIfzCvMMcPB+sXyIHhLKzjDyt
	mr3Jy8g7TZjm6dggCMByReolMYaGZpUSvH/1QxyXXj3LCiZYfisLS8Rz/MB/B4legMFa
	3JdKYhZYE3yXDfV0kBWk2BSXOKM0M406Hw0uVj3aB4TojLA8KcECzm1ZAE+VT4KrLtx5
	AV9G6BVm7KjuIJBaJEoRgS9+ypBupI5Pt+GgkfGzvn50QMOANx7k2sYCLvjkkMkOK63t
	Cpcl+S8pfULzjX1AzYKl10YGNp5U0+HSRr8bYZbGj68H0PdvVD6IufsWY0PeiSuk3bVT
	oxDw==
X-Gm-Message-State: ALoCoQmiBzjizBRjR9EOdUtQkTK6DdR2J9Yatfo3zUz8a+PmFd51+s3qSJegLbe1el1hVfXcnKTR
X-Received: by 10.194.220.74 with SMTP id pu10mr4346814wjc.133.1445349631898; 
	Tue, 20 Oct 2015 07:00:31 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id v9sm4027970wjv.45.2015.10.20.07.00.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Oct 2015 07:00:31 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Oct 2015 14:52:53 +0100
Message-Id: <1445349173-9691-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/selftest/bbtests: clean up local DL_DIR/SSTATE_DIR safely
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
X-List-Received-Date: Tue, 20 Oct 2015 14:00:34 -0000

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
index 3d25aed..94ca79c 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -126,6 +126,8 @@ class BitbakeTests(oeSelfTest):
         self.write_config("""DL_DIR = \"${TOPDIR}/download-selftest\"
 SSTATE_DIR = \"${TOPDIR}/download-selftest\"
 """)
+        self.track_for_cleanup(os.path.join(self.builddir, "download-selftest"))
+
         bitbake('-ccleanall man')
         result = bitbake('-c fetch man', ignore_status=True)
         bitbake('-ccleanall man')
@@ -141,12 +143,13 @@ doesn't exist, yet fetcher didn't report any error. bitbake output: %s" % result
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
@@ -203,6 +206,7 @@ SSTATE_DIR = \"${TOPDIR}/download-selftest\"
         self.write_config("""DL_DIR = \"${TOPDIR}/download-selftest\"
 SSTATE_DIR = \"${TOPDIR}/download-selftest\"
 """)
+        self.track_for_cleanup(os.path.join(self.builddir, "download-selftest"))
         self.write_recipeinc('man',"\ndo_fail_task () {\nexit 1 \n}\n\naddtask do_fail_task before do_fetch\n" )
         runCmd('bitbake -c cleanall man xcursor-transparent-theme')
         result = runCmd('bitbake man xcursor-transparent-theme -k', ignore_status=True)
-- 
2.1.4


