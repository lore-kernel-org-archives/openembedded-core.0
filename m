Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.36802.1614009670915969052
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 08:01:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 7ZVcdrbEy+2BpFTcIInlOlhABcIsL9yHI1Pj6SXXLZBoX1Yd9mA74UTvVDgeyO3Ky7FvFq0/OM
 2JZzhX7+M5AQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="163706079"
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="163706079"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:01:13 -0800
IronPort-SDR: uibCkIXKlHUNLQGPzr6WAERbOR+1HRzF6zeJ9TC/Hgkeh4lPjFx9L6F9zHzHLSpNgkwTymyCCU
 XLdJNC2wiCCg==
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="430302068"
Received: from yrajendx-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.39])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:01:12 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 23/30] oeqa: reproducible: Add more logging
Date: Tue, 23 Feb 2021 00:00:26 +0800
Message-Id: <3ea201b2bcb40a3de6a2e36a43859fe354706b26.1614009417.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614009417.git.anuj.mittal@intel.com>
References: <cover.1614009417.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joshua Watt <JPEWhacker@gmail.com>

The reproducible build tests can take a long time, so having more
logging messages at various points in the build can help debug where the
build is taking a long time.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6b792afe8759d62af8e713b86dad8f6721961a05)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 2d675f1771..4f9adaf301 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -187,6 +187,7 @@ class ReproducibleTests(OESelftestTestCase):
                 SSTATE_MIRRORS = ""
                 ''')
 
+        self.logger.info("Building %s (sstate%s allowed)..." % (name, '' if use_sstate else ' NOT'))
         self.write_config(config)
         d = get_bb_vars(capture_vars)
         bitbake(' '.join(self.images))
@@ -213,6 +214,7 @@ class ReproducibleTests(OESelftestTestCase):
             self.logger.info('Non-reproducible packages will be copied to %s', save_dir)
 
         vars_A = self.do_test_build('reproducibleA', self.build_from_sstate)
+
         vars_B = self.do_test_build('reproducibleB', False)
 
         # NOTE: The temp directories from the reproducible build are purposely
@@ -227,6 +229,7 @@ class ReproducibleTests(OESelftestTestCase):
                 deploy_A = vars_A['DEPLOY_DIR_' + c.upper()]
                 deploy_B = vars_B['DEPLOY_DIR_' + c.upper()]
 
+                self.logger.info('Checking %s packages for differences...' % c)
                 result = self.compare_packages(deploy_A, deploy_B, diffutils_sysroot)
 
                 self.logger.info('Reproducibility summary for %s: %s' % (c, result))
-- 
2.29.2

